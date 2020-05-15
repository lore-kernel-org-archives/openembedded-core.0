Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.42])
 by mx.groups.io with SMTP id smtpd.web12.5846.1589507731657590802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 18:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=diyqwChF;
 spf=pass (domain: windriver.com, ip: 40.107.223.42, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeLb1Lq2zKXv8JYWvS4c5tJ2v74rMy+bGvB9VGBvBDOS4MxqRx+isPknaFw1oQDwE+L2u36DNRpgL9xzxjJFPm5LK2pkKwxTB/hdcl7K5JWD4Xov61vg/F/ujNlfQuosnmWXZFY3ms4F/3JoVPDk2ZaeFrdOXXohfZnSQqxH/nbHESmrPJ6moboRx32yV6bNoW28cAWQUGyEI4yQVyuxX9M4X6MBZeSBsmLjp73l4WNZNIQTjPb2rGXSczilT76WuQq14J25pRreck5jju6+2dX0LGCvt1QqAP/HPTgLUsmCTIJh1VOZBSTvcwmV9XvQejefKmu50/Bo2EuVISFBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPZou2YVcUJn3RFL7PxySfQ4n9IV2r4bAEDF0cdtYes=;
 b=IQ3NZc0VXd3BwhWz49ZH6J57V2h2vGtph71BhxnP4yy7NjQVjnbbYkF0Cu63i4TZAvB/NoHltpPlFjAcam5NMYaD6rWxHqTocY+IE4qp59Snbw/jm0zSyLurZuh62w3vEk9+wza8RFbmf/hULkcCP/w9y43ixc+L6qpKVJSEUmD9YsVBtkLmltOHVv1VUWJ5hkJSzb5nLSaXe8atNncL7j47QpKqcC3jxar3V5AT/GzPmLKkm+fyVcrlISBfcVlTKhW1bJwM8/HO4ATmvky0mmXPcZx00lt9RVF8jaiFar3n/KbcANxm1NlZ1Yq9Aj1//KMjYdQuH0ktv8s0ET97Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPZou2YVcUJn3RFL7PxySfQ4n9IV2r4bAEDF0cdtYes=;
 b=diyqwChFXWd4giTl5EJhwDSq1ud8x8Iu3mZdT+2i2JrmADPFiaFh5o+3QeJv9TyHLXNknbfA2BpDtxlCd0I4vtbaSt9+ZpuUkUnqUmVdD8Ts9FVl8TpdtF9hRdxX1QMHKAkfa86krmpkPxeZ3Y04yxuOHaBxS+zJSGKdjYDKoJI=
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB2967.namprd11.prod.outlook.com (2603:10b6:a03:8a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Fri, 15 May
 2020 01:55:29 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 01:55:29 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bison: fix the parallel build
Thread-Topic: [OE-core] [PATCH] bison: fix the parallel build
Thread-Index: AQHWKcUeN25nyARYwEq9xffmfvjrr6inN6sAgAEr/NI=
Date: Fri, 15 May 2020 01:55:29 +0000
Message-ID: 
 <BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0@BYAPR11MB2598.namprd11.prod.outlook.com>
References: <20200514073936.40572-1-mingli.yu@windriver.com>
 <17e2ea0e-6588-355a-9f5a-b570a0e4cf87@gmail.com>,<5EBCFA66.5010902@windriver.com>
In-Reply-To: <5EBCFA66.5010902@windriver.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [147.11.252.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb3c63cd-528a-416f-9e16-08d7f8730b78
x-ms-traffictypediagnostic: BYAPR11MB2967:
x-microsoft-antispam-prvs: 
 <BYAPR11MB29675E5654860E6E76EC9F00F1BD0@BYAPR11MB2967.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tw2i901C4Ofg0Uz28RZhdHmBjNOgOM1UopNVjkDhdnLyOWk4vf5XyIEH6PQHXEllG/5zJ8wL5MZVYVdteHXjzRierLvLa5DOs1MU6o+mrhhBjqGZjF8K9Lcm9cGGExIhUqqTO5eEZe+iMFUXdWubiFSuJLeMRZKQJhpp6LKTQfReu1bjCVsVwRcMamQUmgCTyXFKf00eJnT10dKMnRL2DUYn9x9II5O1TxqyWIVjEaCN0BikiIKGFiO7E5xZkksx1lEXRRfP5m6GC22uRum4yycoDaVNibs6wXw1CvmzyFnjciiZ+o62vJhoqYzuMZrWjWKARqb5lcv0iwwnomRCvcAHwF4GwDpeYlQgraff2YIT23hq45lzu3ZKlj64/vQHpu3MHBm8OSXV+ZiTwtq32T/f5TDsJUmYc1ncNkVFJAjt9UCowXMMrTvv64dgX8DiAZQg3Gs64gl7U15a/4lSqZS2fPBHYVMyCFWKK0/TN3m8PvHDyRjLQKX1VT3KRU3vAgIJBMkqUY7eaLALH3CRgg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39850400004)(396003)(346002)(136003)(366004)(8936002)(19627405001)(2906002)(8676002)(966005)(52536014)(316002)(26005)(86362001)(71200400001)(5660300002)(110136005)(6506007)(186003)(53546011)(7696005)(9686003)(76116006)(33656002)(55016002)(166002)(21615005)(66946007)(66556008)(66476007)(66446008)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 RDCyiH7ZXcYNJf5CgyM8thfpGZogifhER2S9KW75cZRAbBpwU6+XJPExAy23Akg/jeJ4ZI/COgk9ppRvTvEGZZYsKkGmO2MQVZJpSOnO0YPf6rk/BtA71i2YmNIWwvf+3idP2Zz+vhIJGdvFNSi0uU0mpKilAquzugxzjg+ebprxhZvvQAyGDQ2174njzVpoe3I9tVSjUOL2VDhiXBwOCOCj5TD62pUECtIdBlGlwYKzJrBkvYQRvFFdeMkWp85yKXmumuRb22uN/T+36hpgSFTaRIWSnEXaMeGeHKmikJMiLaWO2yBkcNwIt8ck/aGIEYdCdaPV0Xqzrg9fq/8lQhru4iZKyKn8j2BaYyGx6vAFV8BN8rKS1eLLvuk3fi/4OAs3aB+MQ5cKNpUAFb2/gNAkhDUo0q9PuF6VoXxQ90cNRmyVUlKHPlyxEWS4766nuVlh+ksuejXTW3uPb8HhZmpmkApHLc+OmONLoVP1/+A=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c63cd-528a-416f-9e16-08d7f8730b78
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 01:55:29.1027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gp5PcLoQWKAvZVGzQZekE7UYCKnqh3tmwVqvEj9VWpFLJeuor0OXZgdyHzk+wq6nenkC9uGEwsLSxOANa9I02g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2967
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0BYAPR11MB2598namp_"

--_000_BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0BYAPR11MB2598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jacob,

I can check the https://lists.gnu.org/archive/html/bison-patches/2020-05/ms=
g00055.html link now, so I resend the v2 to add the link for Upstream-Statu=
s part.

Thanks,
Mingli
________________________________
From: Yu, Mingli <mingli.yu@windriver.com>
Sent: Thursday, May 14, 2020 15:59
To: Jacob Kroon <jacob.kroon@gmail.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bison: fix the parallel build

Hi Jacob,

On 05/14/20 15:55, Jacob Kroon wrote:
> Hi Mingli,
>
> On 5/14/20 9:39 AM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Explicitly make the BUILT_SOURCES which
>> are the generated headers such as stdio.h,
>> fcntl.h and etc to be the dependencies of
>> the gl_LIBOBJS such as libbison_a-sprintf.o,
>> libbison_a-printf.o and etc to guarantee the
>> BUILT_SOURCES is generated before begin to
>> compile EXTRA_lib_libbison_a_SOURCES such as
>> fprintf.c in parallel builid, otherwise there
>> may come below error:
>>   | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
>>
>> It does the same for src_bison_OBJECTS and
>> lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
>> generated before begin to compile src_bison_SOURCES
>> which contains AnnotationList.c and etc.
>>
>> BTW, the MOSTLYCLEANFILES also contains the
>> generated header needs to be created early
>> in the build process, so add it also in to
>> avoid below error:
>>   | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
>> file or directory
>>
>> [YOCTO #13825]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
>>   meta/recipes-devtools/bison/bison_3.5.4.bb    |  1 +
>>   2 files changed, 64 insertions(+)
>>   create mode 100644
>> meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patc=
h
>>
>> diff --git
>> a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.pa=
tch
>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.pa=
tch
>>
>> new file mode 100644
>> index 0000000000..c3be91a109
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.pa=
tch
>>
>> @@ -0,0 +1,63 @@
>> +From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Thu, 14 May 2020 15:23:16 +0800
>> +Subject: [PATCH] bison: fix the parallel build
>> +
>> +Explicitly make the BUILT_SOURCES which
>> +are the generated headers such as stdio.h,
>> +fcntl.h and etc to be the dependencies of
>> +the gl_LIBOBJS such as libbison_a-sprintf.o,
>> +libbison_a-printf.o and etc to guarantee the
>> +BUILT_SOURCES is generated before begin to
>> +compile EXTRA_lib_libbison_a_SOURCES such as
>> +fprintf.c in parallel builid, otherwise there
>> +may come below error:
>> + | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
>> +
>> +It does the same for src_bison_OBJECTS and
>> +lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
>> +generated before begin to compile src_bison_SOURCES
>> +which contains AnnotationList.c and etc.
>> +
>> +BTW, the MOSTLYCLEANFILES also contains the
>> +generated header needs to be created early
>> +in the build process, so add it also in to
>> +avoid below error:
>> + | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
>> file or directory
>> +
>> +Upstream-Status: Submitted [bison-patches@gnu.org maillist]
>> +
>
> I can't find the patch email in the bison-patches mailing list archive,
> do you have a link url ?

Good catch, that's why I didn't paste the link in the Submitted part.

BTW, I also cannot find at
https://lists.gnu.org/archive/html/bison-patches/2020-05/threads.html
though I indeed sent to bison-patches@gnu.org.

Thanks,
Mingli

>
> /Jacob
>

--_000_BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0BYAPR11MB2598namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Jacob,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I can check the <a href=3D"https://lists.gnu.org/archive/html/bison-patches=
/2020-05/msg00055.html" id=3D"LPlnk352408">
https://lists.gnu.org/archive/html/bison-patches/2020-05/msg00055.html</a> =
link now, so I resend the v2 to add the link for Upstream-Status part.</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mingli<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yu, Mingli &lt;mingli=
.yu@windriver.com&gt;<br>
<b>Sent:</b> Thursday, May 14, 2020 15:59<br>
<b>To:</b> Jacob Kroon &lt;jacob.kroon@gmail.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] bison: fix the parallel build</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Jacob,<br>
<br>
On 05/14/20 15:55, Jacob Kroon wrote:<br>
&gt; Hi Mingli,<br>
&gt;<br>
&gt; On 5/14/20 9:39 AM, Yu, Mingli wrote:<br>
&gt;&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Explicitly make the BUILT_SOURCES which<br>
&gt;&gt; are the generated headers such as stdio.h,<br>
&gt;&gt; fcntl.h and etc to be the dependencies of<br>
&gt;&gt; the gl_LIBOBJS such as libbison_a-sprintf.o,<br>
&gt;&gt; libbison_a-printf.o and etc to guarantee the<br>
&gt;&gt; BUILT_SOURCES is generated before begin to<br>
&gt;&gt; compile EXTRA_lib_libbison_a_SOURCES such as<br>
&gt;&gt; fprintf.c in parallel builid, otherwise there<br>
&gt;&gt; may come below error:<br>
&gt;&gt;&nbsp;&nbsp; | muscle-tab.c:(.text&#43;0x77a): undefined reference =
to `rpl_sprintf'<br>
&gt;&gt;<br>
&gt;&gt; It does the same for src_bison_OBJECTS and<br>
&gt;&gt; lib_libbison_a_OBJECTS to make sure BUILT_SOURCES<br>
&gt;&gt; generated before begin to compile src_bison_SOURCES<br>
&gt;&gt; which contains AnnotationList.c and etc.<br>
&gt;&gt;<br>
&gt;&gt; BTW, the MOSTLYCLEANFILES also contains the<br>
&gt;&gt; generated header needs to be created early<br>
&gt;&gt; in the build process, so add it also in to<br>
&gt;&gt; avoid below error:<br>
&gt;&gt;&nbsp;&nbsp; | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.=
h: No such<br>
&gt;&gt; file or directory<br>
&gt;&gt;<br>
&gt;&gt; [YOCTO #13825]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; .../0001-bison-fix-the-parallel-build.patch&nbsp;&nbsp=
; | 63 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&gt;&nbsp;&nbsp; meta/recipes-devtools/bison/bison_3.5.4.bb&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 &#43;<br>
&gt;&gt;&nbsp;&nbsp; 2 files changed, 64 insertions(&#43;)<br>
&gt;&gt;&nbsp;&nbsp; create mode 100644<br>
&gt;&gt; meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-buil=
d.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-bu=
ild.patch<br>
&gt;&gt; b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-bu=
ild.patch<br>
&gt;&gt;<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..c3be91a109<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; &#43;&#43;&#43;<br>
&gt;&gt; b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-bu=
ild.patch<br>
&gt;&gt;<br>
&gt;&gt; @@ -0,0 &#43;1,63 @@<br>
&gt;&gt; &#43;From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:0=
0:00 2001<br>
&gt;&gt; &#43;From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;&gt; &#43;Date: Thu, 14 May 2020 15:23:16 &#43;0800<br>
&gt;&gt; &#43;Subject: [PATCH] bison: fix the parallel build<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;Explicitly make the BUILT_SOURCES which<br>
&gt;&gt; &#43;are the generated headers such as stdio.h,<br>
&gt;&gt; &#43;fcntl.h and etc to be the dependencies of<br>
&gt;&gt; &#43;the gl_LIBOBJS such as libbison_a-sprintf.o,<br>
&gt;&gt; &#43;libbison_a-printf.o and etc to guarantee the<br>
&gt;&gt; &#43;BUILT_SOURCES is generated before begin to<br>
&gt;&gt; &#43;compile EXTRA_lib_libbison_a_SOURCES such as<br>
&gt;&gt; &#43;fprintf.c in parallel builid, otherwise there<br>
&gt;&gt; &#43;may come below error:<br>
&gt;&gt; &#43; | muscle-tab.c:(.text&#43;0x77a): undefined reference to `rp=
l_sprintf'<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;It does the same for src_bison_OBJECTS and<br>
&gt;&gt; &#43;lib_libbison_a_OBJECTS to make sure BUILT_SOURCES<br>
&gt;&gt; &#43;generated before begin to compile src_bison_SOURCES<br>
&gt;&gt; &#43;which contains AnnotationList.c and etc.<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;BTW, the MOSTLYCLEANFILES also contains the<br>
&gt;&gt; &#43;generated header needs to be created early<br>
&gt;&gt; &#43;in the build process, so add it also in to<br>
&gt;&gt; &#43;avoid below error:<br>
&gt;&gt; &#43; | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No =
such<br>
&gt;&gt; file or directory<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;Upstream-Status: Submitted [bison-patches@gnu.org maillist]<b=
r>
&gt;&gt; &#43;<br>
&gt;<br>
&gt; I can't find the patch email in the bison-patches mailing list archive=
,<br>
&gt; do you have a link url ?<br>
<br>
Good catch, that's why I didn't paste the link in the Submitted part.<br>
<br>
BTW, I also cannot find at<br>
<a href=3D"https://lists.gnu.org/archive/html/bison-patches/2020-05/threads=
.html">https://lists.gnu.org/archive/html/bison-patches/2020-05/threads.htm=
l</a>
<br>
though I indeed sent to bison-patches@gnu.org.<br>
<br>
Thanks,<br>
Mingli<br>
<br>
&gt;<br>
&gt; /Jacob<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0BYAPR11MB2598namp_--
