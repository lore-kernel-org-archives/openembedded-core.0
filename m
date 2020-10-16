Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.88])
 by mx.groups.io with SMTP id smtpd.web10.7917.1602823444930215966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 21:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iO2FwjIc;
 spf=pass (domain: windriver.com, ip: 40.107.244.88, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdUQ59Hmloxxq8NsramWrw6eOI2yVwB29qC2/vRLJZqJBZYi+wL3MG+EtMhhsvXdgvSbXZhz29mq19WqV8woUTIHZmIyjOHo4u3bkRGrbhnn832QEAV3D57ddSa/gdZdnCzZl//FcGJQT9tqZ8ZC6g3Dk9Z0I4MGXgP+ApYgVdBKz3dm5AzGddDXlg/BLyOTeOHEG0+krLG5wovKArrrm5dLUFxlyjRXDqxwBrwSUc/BeA4ak0iih4Y10hZfQo/K6v8vwIp6J5bNrtTwo2dNJ/wwsSYCYKn1APOwyUstc1dJ8KZsbPDLrAGXYk/EkXAJNAFpou81kJGO++X78BQKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZVihsqf5B8Ko5uPgI/KgM7xeJ9mKCTXuCOpeKr79hQ=;
 b=jSDfKQSU/CLK2SYHSQnMX3C2wnqjbmufX+hU7dKFJZKfsbQakZBuba37/QlwuEdGpgG4M8kwVpC+urbgwYurBRvFQJjbQ4e3L0AOJPCCN7mu8cr8cWMypY1qZGDsL79ntsxI9jk195fC4RTBTCNTeqDwEv6MHyDUGo2e1ArbtoUR4Wxi/DfMsrQO5YPwkIusjzVWMAJq1Bzbv0t8bd9qiRI85vti2gYVfD5i9Ep0+v/C3py1cvC02dmavMJlvPmpqzE78DffbrpQCobqXW7NSMg27GXhswaEzki+1Nh+//22cvmV4SfWcFVDJm3nS/fCxjOP055mmF2YBNFIQ7ZDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZVihsqf5B8Ko5uPgI/KgM7xeJ9mKCTXuCOpeKr79hQ=;
 b=iO2FwjIcjuNEA/u+reVioJOfMcE1njxkBZh18x9qe72glCAeitUuB+JNdXsoF396+Vh3GrfL/6MB+8U/TtebS8jdcXAarF/4WEnYqaox6NOUaBKxvCJK/2q3qbP1l+F7DoqhxmIQLF4ag+DhEUJO2syLta+iIlz8753lRHdQUCc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4289.namprd11.prod.outlook.com (2603:10b6:a03:1ce::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 04:44:02 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 04:44:02 +0000
Subject: Re: [OE-core][PATCH] cups: use /run instead /var/run in systemd's unit file
To: openembedded-core@lists.openembedded.org
References: <163E5B186438C53E.31077@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <86025eb4-5780-af05-2a5f-7e07d7b59251@windriver.com>
Date: Fri, 16 Oct 2020 12:50:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <163E5B186438C53E.31077@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 04:44:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd704b7d-374e-4e12-f3a6-08d8718e1ae4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4289:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4289D0531BA669B158CEBC4DED030@BY5PR11MB4289.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:305;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Raz/B8maaUoTrxIRAIYQi72SckwrnsKF3CyRk28iSzkEgo9p3BapNU019yX6/LWYiFAFVJU41AdkOr9Y+1jsusEAF32KBRvhi49mWDpzg20imo0K11lx3LVzZ7f6fBHfz6LhMvwqyz0hZraoCbYYV5aiyGa/uUU8he75nnT7L2kdjoKm1/gT32rPuVCWvq9twuxUTiA91o+kCoK6Z8u8AiaqImqycC0kDGSZFfydQrBVJQeI0oGOEaGP5M6vDc8GqHfElctbNg5iAwSx1kepNJIP1Au9EmTd1newEfUYQZtJvl/xjSAuREUGRqITQJyz9aGm1dFveT6af0qqbKyJX6my+t9JTB1GLE4oh/NSSmddvUTcJz4MWNR1CA3qBWsEe6TznetbYURPue4X0/ldg/f2k7fDG87shkvsCNWgYvB3/yI43WgWxLNIjFX2RxPQEQ0RWyhJdkiqIksSGfWnRsCR3lpcMNF7iiE//lsKYFNKgLTGRT0pFQPDgro8UzTMNIrTt2ELTYCJKShCl5IwxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39850400004)(83380400001)(478600001)(31696002)(34490700002)(26005)(16526019)(6706004)(186003)(966005)(53546011)(36756003)(86362001)(6916009)(5660300002)(33964004)(52116002)(316002)(6486002)(66946007)(8936002)(66556008)(6666004)(2906002)(66476007)(16576012)(956004)(31686004)(166002)(8676002)(2616005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Xk1aZlX2qbt4CVab2bKEgWVSeegy1nG8jFZ2r8ub54Uc+2ypr9VwgtsfghXcJppD1z9J92fAl+bom8BROIbIQi1kRa0X12dIb/00fYCO4TZdnllHPqUDycg0jJye2Gh72D+tmkuV2P2HU/57SK74OXwdmEbhGnxsjt79Xz3sxlWJzk/Z3sJLRDscuQAGSFd5Roe3yKTbc2RlGLcdkOIB8+S5Kyl4EcXygYx2seltuuCDf+iXC/+Z3ilVM1CA0vAF0RuHkl+d/yFgKgbV8hO8L6fMxbBfqDKDuN7kEGA0hENzsDWeMjFtLfNcIxkJUsNSBLodiNCiplaCII1bDqlK3xWhi/7/9u60TaeonVDWjSrdCLjTEkYQcEFvnVz64Di3sT5Uv0RtfigWgLupKHmEfDik9S4Hy+ott4mfpPMzrlrghMvTAW705XeEHVw/FyBw9uW1JDuAT7h/18LIZ0reTnpWjF8tJCNUgLLOFz9jlhoiLnHXXoUu3Q/y3DAfJolyZWfJMxU6IyrsxBoPNmQjZrD3/VCCzW12D5H6NMfdz+tu10XdzvNCQcLUDDLILfCGi7f6AyayxkANKVYrMOZuk3BG9kX99xPZXqWjFj5e/K2m6DFjfnGVA3gSFark8tyIr7h1JF9tDgZKslTXLegn0g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd704b7d-374e-4e12-f3a6-08d8718e1ae4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 04:44:02.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FNRvtXGd7kITM2mHmktG3Pl0uQZzVCz8+EDs35GQFAd4GAOfCvV+PqHK7XcxFUv/v6n1n1/gnt3YWQ+Y29iXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4289
Content-Type: multipart/alternative;
 boundary="------------69C5D86BA2BB2A0E6F1264B2"

--------------69C5D86BA2BB2A0E6F1264B2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, please ignore this patch.

On 10/16/2020 11:23 AM, Chen Qi wrote:
> /var/run has been deprecated by systemd, so use /run instead,
> as suggested by systemd.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-extended/cups/cups.inc           |  1 +
>   ...sd.socket-use-run-instead-of-var-run.patch | 28 +++++++++++++++++++
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index 1765944568..f56233acac 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -13,6 +13,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
>              file://0002-don-t-try-to-run-generated-binaries.patch \
>              file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
>              file://0004-cups-fix-multilib-install-file-conflicts.patch \
> +           file://0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch \
>              file://volatiles.99_cups \
>              file://cups-volatiles.conf \
>              "
> diff --git a/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch b/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
> new file mode 100644
> index 0000000000..e8fbd19104
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
> @@ -0,0 +1,28 @@
> +From 5b1d90bc6bbb25eaf01855cb0fd5e0a9c9e1fa7f Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Fri, 16 Oct 2020 11:22:01 +0800
> +Subject: [PATCH] org.cups.cupsd.socket: use /run instead of /var/run
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + scheduler/org.cups.cupsd.socket | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/scheduler/org.cups.cupsd.socket b/scheduler/org.cups.cupsd.socket
> +index 9cb4613..899e00b 100644
> +--- a/scheduler/org.cups.cupsd.socket
> ++++ b/scheduler/org.cups.cupsd.socket
> +@@ -3,7 +3,7 @@ Description=CUPS Scheduler
> + PartOf=org.cups.cupsd.service
> +
> + [Socket]
> +-ListenStream=/var/run/cups/cups.sock
> ++ListenStream=/run/cups/cups.sock
> +
> + [Install]
> + WantedBy=sockets.target
> +--
> +2.17.1
> +
>
>
> 
>


--------------69C5D86BA2BB2A0E6F1264B2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Sorry, please ignore this patch.<br>
      <br>
      On 10/16/2020 11:23 AM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:163E5B186438C53E.31077@lists.openembedded.org" type="cite">
      <pre wrap="">/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 ...sd.socket-use-run-instead-of-var-run.patch | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1765944568..f56233acac 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -13,6 +13,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.tfile://0002-don-t-try-to-run-generated-binaries.patch\file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch\file://0004-cups-fix-multilib-install-file-conflicts.patch\+file://0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch\file://volatiles.99_cups\file://cups-volatiles.conf\">&quot;https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0002-don-t-try-to-run-generated-binaries.patch \
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
+           file://0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            &quot;</a>
diff --git a/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch b/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
new file mode 100644
index 0000000000..e8fbd19104
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
@@ -0,0 +1,28 @@
+From 5b1d90bc6bbb25eaf01855cb0fd5e0a9c9e1fa7f Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Fri, 16 Oct 2020 11:22:01 +0800
+Subject: [PATCH] org.cups.cupsd.socket: use /run instead of /var/run
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ scheduler/org.cups.cupsd.socket | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/org.cups.cupsd.socket b/scheduler/org.cups.cupsd.socket
+index 9cb4613..899e00b 100644
+--- a/scheduler/org.cups.cupsd.socket
++++ b/scheduler/org.cups.cupsd.socket
+@@ -3,7 +3,7 @@ Description=CUPS Scheduler
+ PartOf=org.cups.cupsd.service
+ 
+ [Socket]
+-ListenStream=/var/run/cups/cups.sock
++ListenStream=/run/cups/cups.sock
+ 
+ [Install]
+ WantedBy=sockets.target
+-- 
+2.17.1
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

--------------69C5D86BA2BB2A0E6F1264B2--
