Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.72])
 by mx.groups.io with SMTP id smtpd.web10.11562.1599010408624108683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 18:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DruaXIq3;
 spf=pass (domain: windriver.com, ip: 40.107.76.72, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvQ4oKpnE+0uStpZq6l0hpCMQ5y/9LQ5V253jTBA3EAdB/8nZR4YMXI16CIlmfzab4BpYIRCf04SkXaPnyvk5KOPoMVebxipx5kugxVs9sIHkWMPNe6AUC58Y/giGOV6z94d62nbrIw+IrlnCmNHUgHhxXt+6OD9W/AuLV9jKhwAWxcDzXW8ko5OYqAqhQt3tzRxm9OgilDi9c1VA3FpA8OT4nRmzfeu8XtG53/nSeMid4J+cqLq9Q2zKYHtm7qwDKMUpSw42IoijvS9e4PZ+IldyjXXvrL4v78HxamEb4bCLq7EffMT6dyLd3gBU66zJGQ8jrvZ9K+rdwgviuGZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEt5IhHPM8dhEegZ6MkeS3W+ai9avI6d0bqU5R8dGNg=;
 b=i5wvvMM63QWPGVHcYX0BfLmRWhMQ3outAa+q1E6JW9+bcbpcicNIdHOrd1blaekG/rY5ruwZ1pmZM+OTfcwymCKhf39KCErQ8oZPpsr7Eerl94tJsRCADKz6IUySqLR0xoS8mqVfgS0cRgBhtwOSF7XEVpTDSYyVMh1Bhtofr7m9ubBEA72pVAPOfRPUpWrPIoOQpHjFAatha8khXQAQd/5diD6WBv5WqYg7qxYNJ/w3Vxd/Ly1LfB/eeGCZLmgGwH5JOozlgwtHw41nQ8UoFbsnv4JzBnPbt7FJAFQLAU4HZn9hpIMlneo6SUge9jXcQoNQMSepPOW96v2rs6Tybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEt5IhHPM8dhEegZ6MkeS3W+ai9avI6d0bqU5R8dGNg=;
 b=DruaXIq3bXPg60pB7o/lTCN4eeSkPwgV6cUwCNorDZu+j725WUukB4cFxTLy8fl8/+7zzxOXX+GGMUYucKz6okMEo76/SZ+q7nnv8ni0Z483Nc3kLT4NtR7jHOh50xploygVyIm6WJurQUjP0AMpNOg5xSYeCn0S32qxAzAkI1U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3350.namprd11.prod.outlook.com (2603:10b6:a03:1a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 01:33:17 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::6da1:47ca:a4e9:92e3]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::6da1:47ca:a4e9:92e3%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:33:17 +0000
Subject: Re: [OE-core] [PATCH 4/8] dhcpd: move from meta-network need a client
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200901152236.9377-1-akuster808@gmail.com>
 <20200901152236.9377-4-akuster808@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <46ac639e-669e-7b36-1770-9d2049ea1904@windriver.com>
Date: Wed, 2 Sep 2020 09:38:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20200901152236.9377-4-akuster808@gmail.com>
X-ClientProxiedBy: HK0PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:203:b0::32) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HK0PR03CA0116.apcprd03.prod.outlook.com (2603:1096:203:b0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 01:33:15 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c85228f-e6be-4827-c9da-08d84ee02ab6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3350:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3350ADBB3D64CE9848BAF6F1ED2F0@BYAPR11MB3350.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BAnhrXuvrwqZ0lVDhQM5VIwCXOG6dNJ5ioVPzp92E8j6nljeZ0ywHrKvki5tZGJRArOE2uHQt/Hy78UKCZeKmJ0tMN1O3VkhfMhczOMarRgetjW7LTl/9ULjKvNJEZY8e1zeNGJChnpNT/OiCv6KC2Bgiu8Fm+aOKJf9kPFcGN5Z0tar/ayUvNWNymJf0mgwR3mi4G3TnDRNfed0MVEiBFbMtQYx1gp43RshqLH1/pxzjZut/lwOYOZedbss6iR2mpl9LQbVHtp0uH0NyFZN681xHS15IORPMHduj/7gJqdX4R1LIScdCJrb4XmQrOMHNmzO7xAPqc6fJrsbmlj2Z52P4YmLXdBG5xuFi12nBcY1nVL24zGgGVQedii/3LBYnwIyRhFULsg39VLwyRtzz10oQC1JdBlqbvsHbeVMjOR3cyDxpkjYZDXXW5Zs/gExipDx+Tg8v7bCo8wRFJTfpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(2906002)(83380400001)(31686004)(8676002)(966005)(36756003)(166002)(5660300002)(478600001)(6666004)(31696002)(33964004)(66556008)(8936002)(16576012)(316002)(66476007)(956004)(53546011)(52116002)(26005)(86362001)(2616005)(66946007)(186003)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WK7vQ3bJaN5IsACwCtQ2pAt1ye79LqtvUVcVEWw6J/ZMQMxkTIfRQSJfNEMPGqf/Ig9TFuwq80khG50M1pHjAPYVt4mbRrjscJua1S9nPvFrgK9oTsEjGjjekrYyYGo6KY8TF5VBKfZ1xBV73G+AjbtnvMsSrczUS6cnqKsF740h2bXO+ICoeEd5AeR4C3kOTJ9+JmsxuNuVuGQQMdd7zUckKdIs/xuIuFoNXfyegPmqmM4TfnRHERotvCyfvVq0Myblcpy3PhLvKWXoqRRfRRawkasjv1Brfo8LPhy3if7xUQBF0U9c/KxIk8Z/XWhzVTkDrkJAFCPr0lFzGsSzzDLz73/ZGwFmJQcNYeZxYULK3MF13xD79xGxUsx9pWl5kWmA3rsxJTIme30Azoue1A29zdm44Nel0hLtk3cDG2POpYI4PgfJaZ5QN8C28AiRVMfAgTgEop+zQJ1ZkNTT+A3yUND38dO4JmqFL+i7iU9PAfluXoZzo9ZuYqlwF11nMFQEPgfeAeFToXUohFtNmcHtMVNOCNw+rgBbItlJgsKCAH7nAeTKBIVl1WGq1cjblEARe4T8xbGqU0kUW3Ka/FU1VqQxhQVTaQQG+RWp8oLdzuVX0hitW+tHsnmQ0hnSDXjh/o9zmV1LN+WarpD5iw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c85228f-e6be-4827-c9da-08d84ee02ab6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 01:33:17.3136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOpN8XvZ+9uEhviWgvTI/2VZlqlOhEVx+11OOpNutT8PHrJpAbm3GX3i2XVu+hds8Im96rYZ7xmmxSi0UDxXGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3350
Content-Type: multipart/alternative;
 boundary="------------89DBA90AF09C069A11F030BD"

--------------89DBA90AF09C069A11F030BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The title uses 'dhcpd' but the recipe's name is 'dhcpcd'. [Patch 5/8] 
also uses 'dhcpd'.

One more thing to confirm. We are using dhcpcd to replace dhcp, right?

Best Regards,
Chen Qi


On 09/01/2020 11:22 PM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../dhcpcd/dhcpcd_9.1.4.bb                    | 28 ++++++++++++
>   ...e-INCLUDEDIR-to-prevent-build-issues.patch | 45 +++++++++++++++++++
>   2 files changed, 73 insertions(+)
>   create mode 100644 meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
>   create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
>
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
> new file mode 100644
> index 00000000000..defd3420f02
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
> @@ -0,0 +1,28 @@
> +SECTION = "console/network"
> +SUMMARY = "dhcpcd - a DHCP client"
> +DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
> +               computer to work on the attached networks without trouble \
> +               and mostly without configuration."
> +
> +HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2"
> +
> +UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
> +
> +SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
> +           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
> +
> +SRC_URI[sha256sum] = "5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820"
> +
> +inherit pkgconfig autotools-brokensep
> +
> +PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +
> +PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
> +
> +EXTRA_OECONF = "--enable-ipv4"
> +
> +FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
> diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
> new file mode 100644
> index 00000000000..37d2344438a
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
> @@ -0,0 +1,45 @@
> +From aa9e3982c1e75ad49945a62f5e262279c7a905a4 Mon Sep 17 00:00:00 2001
> +From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
> +Date: Sun, 13 Jan 2019 01:50:52 +0100
> +Subject: [PATCH] remove INCLUDEDIR to prevent build issues
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
> +---
> + configure | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 6c81e0db..32dea2b4 100755
> +--- a/configure
> ++++ b/configure
> +@@ -20,7 +20,6 @@ BUILD=
> + HOST=
> + HOSTCC=
> + TARGET=
> +-INCLUDEDIR=
> + DEBUG=
> + FORK=
> + STATIC=
> +@@ -72,7 +71,6 @@ for x do
> + 	--mandir) MANDIR=$var;;
> + 	--datadir) DATADIR=$var;;
> + 	--with-ccopts|CFLAGS) CFLAGS=$var;;
> +-	-I|--includedir) INCLUDEDIR="$INCLUDEDIR${INCLUDEDIR:+ }-I$var";;
> + 	CC) CC=$var;;
> + 	CPPFLAGS) CPPFLAGS=$var;;
> + 	PKG_CONFIG) PKG_CONFIG=$var;;
> +@@ -309,9 +307,6 @@ if [ -n "$CPPFLAGS" ]; then
> + 	echo "CPPFLAGS=" >>$CONFIG_MK
> + 	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
> + fi
> +-if [ -n "$INCLUDEDIR" ]; then
> +-	echo "CPPFLAGS+=	$INCLUDEDIR" >>$CONFIG_MK
> +-fi
> + if [ -n "$LDFLAGS" ]; then
> + 	echo "LDFLAGS=" >>$CONFIG_MK
> + 	echo "LDFLAGS+=	$LDFLAGS" >>$CONFIG_MK
> +--
> +2.17.2 (Apple Git-113)
> +
>
>
> 



--------------89DBA90AF09C069A11F030BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">The title uses 'dhcpd' but the recipe's
      name is 'dhcpcd'. [Patch 5/8] also uses 'dhcpd'.<br>
      <br>
      One more thing to confirm. We are using dhcpcd to replace dhcp,
      right?<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 09/01/2020 11:22 PM, akuster wrote:<br>
    </div>
    <blockquote cite="mid:20200901152236.9377-4-akuster808@gmail.com" type="cite">
      <pre wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 .../dhcpcd/dhcpcd_9.1.4.bb                    | 28 ++++++++++++
 ...e-INCLUDEDIR-to-prevent-build-issues.patch | 45 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
new file mode 100644
index 00000000000..defd3420f02
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
@@ -0,0 +1,28 @@
+SECTION = &quot;console/network&quot;
+SUMMARY = &quot;dhcpcd - a DHCP client&quot;
+DESCRIPTION = &quot;dhcpcd runs on your machine and silently configures your \
+               computer to work on the attached networks without trouble \
+               and mostly without configuration.&quot;
+
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://roy.marples.name/projects/dhcpcd/">&quot;http://roy.marples.name/projects/dhcpcd/&quot;</a>
+
+LICENSE = &quot;BSD-2-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2">&quot;file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2&quot;</a>
+
+UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://roy.marples.name/downloads/dhcpcd/">&quot;https://roy.marples.name/downloads/dhcpcd/&quot;</a>
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz\+file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch">&quot;http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch&quot;</a>
+
+SRC_URI[sha256sum] = &quot;5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820&quot;
+
+inherit pkgconfig autotools-brokensep
+
+PACKAGECONFIG ?= &quot;udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}&quot;
+
+PACKAGECONFIG[udev] = &quot;--with-udev,--without-udev,udev,udev&quot;
+PACKAGECONFIG[ipv6] = &quot;--enable-ipv6,--disable-ipv6&quot;
+
+EXTRA_OECONF = &quot;--enable-ipv4&quot;
+
+FILES_${PN}-dbg += &quot;${libdir}/dhcpcd/dev/.debug&quot;
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
new file mode 100644
index 00000000000..37d2344438a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -0,0 +1,45 @@
+From aa9e3982c1e75ad49945a62f5e262279c7a905a4 Mon Sep 17 00:00:00 2001
+From: Stefano Cappa <a class="moz-txt-link-rfc2396E" href="mailto:stefano.cappa.ks89@gmail.com">&lt;stefano.cappa.ks89@gmail.com&gt;</a>
+Date: Sun, 13 Jan 2019 01:50:52 +0100
+Subject: [PATCH] remove INCLUDEDIR to prevent build issues
+
+Upstream-Status: Pending
+
+Signed-off-by: Stefano Cappa <a class="moz-txt-link-rfc2396E" href="mailto:stefano.cappa.ks89@gmail.com">&lt;stefano.cappa.ks89@gmail.com&gt;</a>
+---
+ configure | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure b/configure
+index 6c81e0db..32dea2b4 100755
+--- a/configure
++++ b/configure
+@@ -20,7 +20,6 @@ BUILD=
+ HOST=
+ HOSTCC=
+ TARGET=
+-INCLUDEDIR=
+ DEBUG=
+ FORK=
+ STATIC=
+@@ -72,7 +71,6 @@ for x do
+ 	--mandir) MANDIR=$var;;
+ 	--datadir) DATADIR=$var;;
+ 	--with-ccopts|CFLAGS) CFLAGS=$var;;
+-	-I|--includedir) INCLUDEDIR=&quot;$INCLUDEDIR${INCLUDEDIR:+ }-I$var&quot;;;
+ 	CC) CC=$var;;
+ 	CPPFLAGS) CPPFLAGS=$var;;
+ 	PKG_CONFIG) PKG_CONFIG=$var;;
+@@ -309,9 +307,6 @@ if [ -n &quot;$CPPFLAGS&quot; ]; then
+ 	echo &quot;CPPFLAGS=&quot; &gt;&gt;$CONFIG_MK
+ 	echo &quot;CPPFLAGS+=	$CPPFLAGS&quot; &gt;&gt;$CONFIG_MK
+ fi
+-if [ -n &quot;$INCLUDEDIR&quot; ]; then
+-	echo &quot;CPPFLAGS+=	$INCLUDEDIR&quot; &gt;&gt;$CONFIG_MK
+-fi
+ if [ -n &quot;$LDFLAGS&quot; ]; then
+ 	echo &quot;LDFLAGS=&quot; &gt;&gt;$CONFIG_MK
+ 	echo &quot;LDFLAGS+=	$LDFLAGS&quot; &gt;&gt;$CONFIG_MK
+-- 
+2.17.2 (Apple Git-113)
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------89DBA90AF09C069A11F030BD--
