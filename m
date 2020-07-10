Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.82])
 by mx.groups.io with SMTP id smtpd.web10.8940.1594382119187975620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 04:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=PAdskASi;
 spf=pass (domain: kpit.com, ip: 40.107.139.82, mailfrom: amitanand.chikorde@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqLGTHkaChfBPixzJChmYdDNYmsscOjqfzDIRCMf2bHSUU+EN2B4R8ZpHyBVhedJvsTzPicYWVHGsvVlpEXfrXqyrf0Bxz2NyrMtD3kmi+pIN9iFJT7jhYQy8hdGBVynjbOHqhIfzvKbl0QZNZyb/GcMWGO0XJsKbME38pq+j5V1lCtOq5j+631s8dzVtm7Iob3/bVLBG4yHYdL/FrGyUY2Y07JNFCyP4Mlj4PXSdEYnIEgZP5NRtnJ8SOcHNoAYbGY+HEf++Gvu0j7bEaavy2AXzze6T4MHznp+FPF4Vh31BIklCvi/cYfq+8IxOJVBdyFf4saQrqdFCahqvp239g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K96vsLASzPH14g2ttZk+hlws4u/EdhK9WoFLvP7dLwk=;
 b=Mh876eDletbg9sI3GT4fJ7WEBVN16UKuDLBGhCawXsxuQUUr9kCKoivq/664nGzZdHSaqWKUSNBfChk9gLa7DFHQ12E76zgeSOlAEJRTaPCMatDNduNjq0ZLiBTxfB3MwXbIleq5W8CcO+VG8ufQlQn/u3B702oSPwLL7DscazVKx2p+WWUWdZ6qUWCoPbUCtJmiOujH3TfZQ3R96D1LEsmmLKLELNx10SmOgomayioyz/ElZnauR8qyGAkeOCYaESCQ4vIVgVmOAJrT//G5YQzGUiEXNVBzJcjwsa4APpXGnWIOCteI2AtZH749ImySLaGMHvRfQG9jvvfAmq2dNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K96vsLASzPH14g2ttZk+hlws4u/EdhK9WoFLvP7dLwk=;
 b=PAdskASifOZBdorcfQZFqTb4SJ4oaYtvb80aBZULepVm4NUtQQMKRDpmNSEHrIgcISvbzAES3fYwfBAkEnlczSFYqSf6n/2rfdShA6R3Lru7iGimlCR34zuckpUOf5JkIpOYZkxixWfdTNvihVMj1NjXjATOQy5HAC+t8cr2dCw=
Received: from BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:57::22)
 by BMXPR01MB0901.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:15::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 10 Jul
 2020 11:55:14 +0000
Received: from BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d445:3888:be45:18b4]) by BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d445:3888:be45:18b4%3]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 11:55:14 +0000
From: "Amitanand N Chikorde" <Amitanand.Chikorde@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>, Nisha Parrakat
	<Nisha.Parrakat@kpit.com>, Anuj Chougule <Anuj.Chougule@kpit.com>, Aditya
 Tayade <Aditya.Tayade@kpit.com>
Subject: [poky][master][PATCH] systemd: Fix codesonar warnings
Thread-Topic: [poky][master][PATCH] systemd: Fix codesonar warnings
Thread-Index: AQHWVq9NbkNS03iCbUKkMKxuz0iAag==
Date: Fri, 10 Jul 2020 11:55:13 +0000
Message-ID: 
 <BMXPR01MB33973A13BA96F2FB63428220FD650@BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2409:4042:2016:e486:6cea:a80d:63fe:8aa0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d2eb1cc1-b13e-4a56-cc46-08d824c81b47
x-ms-traffictypediagnostic: BMXPR01MB0901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BMXPR01MB0901EA37511843C162B0B215FD650@BMXPR01MB0901.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lqrYke6/8BxryHrGlEpQsxOjbK/Zyn3mtvTdMUfoN7HckWohJ/w2GV9uTsqamwayxvFSHMQiFO761Ew3+/3ti2vpcxZk8CNR0ihYuduQ2Q11WOQoCCYM70dUQXB1kqnMxm+5qfTEEtMM+tALc+knWsrHzMymSFuCdENl1qAugAWQJcaDULp1vgbeWP0eYXlde7ZSyXTAxFCKRMcPGQ2//eThwvLKsf7dsu68h0bno4NNo4e2TlOsTPe/cgo/Ek0caq9QyIuoMmCXLGO9+CQDQHLOLSuvyPl81015K7XH5Qj1w9Sj8/ZzAwCA2aLyH5xHJxfuiBKcaWDqPOLcLiMk0g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(316002)(19627405001)(66574015)(71200400001)(66446008)(64756008)(66556008)(66476007)(54906003)(107886003)(76116006)(91956017)(66946007)(2906002)(83380400001)(7696005)(9686003)(33656002)(86362001)(478600001)(55016002)(5660300002)(6506007)(6916009)(8936002)(8676002)(186003)(4326008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ARU7rul7CvKuWNAY9i2iPbIeeXEBc4VN2XUiga564GQMbzo+AuETfAvDGoBvCeoGEnf8wmwNF1cdbO0wIjnqWI4QsgrqdoGdd32azOtCNvJsqTJfTZtDU9sSsi8m7hAK/VROdp8koWLBmo+HeBQCc1QFBovPZ1qStyNCQeXVqbbngL9z94PAW9lDHOTRDixvXsmQhoBvyoelo3N87APGIzNC6lDIPCeopgRker2P3Zn5cdJlJvSEbD2Z5QT1rHoDHihaPZc3h2G3TwZT6+LTYAapAi7ygadRJmAxBedhThm2Daxaj3wuEnNMuZV8GgSQpQEpWaVOUnBLnvDkEww/Sc9OGV+0DKII5hQRHxBptHhbjpwyCE/6/bcuQc621KX9osQeWUoIaU8x5lU54z1OwCGqO3JdBzYKenzojeIeZI4yRPS2ZhVVTMiVnCp3JLHuSUih23EPObAjxsi7laIEHdIva8wD8zjUURZjl3TNHh2Iy+xeioVC6TVpY0MeUvIshNYekzbNjyk9dGb7c1ONI3R6AN2oomwQuLMBUv5TMxEjt/WDUt8/76xo33646rwg
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eb1cc1-b13e-4a56-cc46-08d824c81b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 11:55:13.8956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPJiFQlG3ar92s2+sOdn2ApVmOW+rmLzLHotJf5esWQ8zjwVKfHVBohk4cEHhJu4DgmLoYiZKAj6HVif03DMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0901
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB33973A13BA96F2FB63428220FD650BMXPR01MB3397INDP_"

--_000_BMXPR01MB33973A13BA96F2FB63428220FD650BMXPR01MB3397INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: "Amitanand.Chikorde" <Amitanand.Chikorde@kpit.com>

Fixed below systemd codesonar warnings.
1. isprint() and isspace() is invoked here with an argument of signed
type char, but only has defined behavior for int arguments that are
either representable as unsigned char or equal to the value
of macro EOF(-1).

As per codesonar report, in a number of libc implementations, isprint()
and isspace() functions implemented using lookup tables (arrays):
passing in a negative value can result in a read underrun.

To avoid this unexpected behaviour, typecasted char type argument to
unsigned char type.

2. "seqnum" defined, not initialized & used in device-private.c
Intialized "seqnum" at definition.

Upstream-Status: Pending
Signed-off-by: Amitanand.Chikorde <amitanand.chikorde@kpit.com>
---
 .../files/systemd_codesonar_warnings_fix.patch      | 105 ++++++++++++++++=
++++
 5 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 files/systemd_codesonar_warnings_fix.patch

diff --git a/files/systemd_codesonar_warnings_fix.patch b/files/systemd_cod=
esonar_warnings_fix.patch
new file mode 100644
index 0000000..8138eba
--- /dev/null
+++ b/files/systemd_codesonar_warnings_fix.patch
@@ -0,0 +1,105 @@
+systemd: fix codesonar warnings
+
+Fixed below systemd codesonar warnings.
+1. isprint() and isspace() is invoked here with an argument of signed
+type char, but only has defined behavior for int arguments that are
+either representable as unsigned char or equal to the value
+of macro EOF(-1).
+
+As per codesonar report, in a number of libc implementations, isprint()
+and isspace() functions implemented using lookup tables (arrays):
+passing in a negative value can result in a read underrun.
+
+To avoid this unexpected behaviour, typecasted char type argument to
+unsigned char type.
+
+2. "seqnum" defined, not initialized & used in device-private.c
+Intialized "seqnum" at definition.
+
+Signed-off-by: Amitanand N. Chikorde <Amitanand.Chikorde@kpit.com>
+Upstream-Status: Pending
+
+--- origcode/src/libsystemd/sd-device/device-private.c 2020-07-09 18:05:13=
.744127907 +0530
++++ modifcode/src/libsystemd/sd-device/device-private.c        2020-07-09 =
18:01:56.494621945 +0530
+@@ -560,7 +560,7 @@
+         char **key;
+         const char *major =3D NULL, *minor =3D NULL;
+         DeviceAction action =3D _DEVICE_ACTION_INVALID;
+-        uint64_t seqnum;
++        uint64_t seqnum =3D 0;
+         int r;
+
+         assert(ret);
+--- origcode/src/libudev/libudev-util.c        2020-07-09 18:05:13.6560495=
15 +0530
++++ modifcode/src/libudev/libudev-util.c       2020-07-09 18:02:32.5633864=
14 +0530
+@@ -171,7 +171,7 @@
+
+         /* strip trailing whitespace */
+         len =3D strnlen(str, len);
+-        while (len && isspace(str[len-1]))
++        while (len && isspace((unsigned char) str[len-1]))
+                 len--;
+
+         /* strip leading whitespace */
+@@ -182,8 +182,8 @@
+         j =3D 0;
+         while (i < len) {
+                 /* substitute multiple whitespace with a single '_' */
+-                if (isspace(str[i])) {
+-                        while (isspace(str[i]))
++                if (isspace((unsigned char) str[i])) {
++                        while (isspace((unsigned char) str[i]))
+                                 i++;
+                         to[j++] =3D '_';
+                 }
+--- origcode/src/udev/udevadm-hwdb.c   2020-07-09 18:05:13.612010318 +0530
++++ modifcode/src/udev/udevadm-hwdb.c  2020-07-09 18:03:26.243530163 +0530
+@@ -487,7 +487,7 @@
+
+                 /* strip trailing whitespace */
+                 len =3D strlen(line);
+-                while (len > 0 && isspace(line[len-1]))
++                while (len > 0 && isspace((unsigned char) line[len-1]))
+                         len--;
+                 line[len] =3D '\0';
+
+--- origcode/src/udev/udevadm-info.c   2020-07-09 18:05:13.616013882 +0530
++++ modifcode/src/udev/udevadm-info.c  2020-07-09 18:03:41.621625782 +0530
+@@ -73,7 +73,7 @@
+
+                 /* skip nonprintable attributes */
+                 len =3D strlen(value);
+-                while (len > 0 && isprint(value[len-1]))
++                while (len > 0 && isprint((unsigned char) value[len-1]))
+                         len--;
+                 if (len > 0)
+                         continue;
+--- origcode/src/udev/udev-rules.c     2020-07-09 18:05:13.624021008 +0530
++++ modifcode/src/udev/udev-rules.c    2020-07-09 18:03:03.227995790 +0530
+@@ -726,7 +726,7 @@
+                 return -1;
+
+         /* skip whitespace */
+-        while (isspace(linepos[0]) || linepos[0] =3D=3D ',')
++        while (isspace((unsigned char) linepos[0]) || linepos[0] =3D=3D '=
,')
+                 linepos++;
+
+         /* get the key */
+@@ -738,7 +738,7 @@
+                 linepos++;
+                 if (linepos[0] =3D=3D '\0')
+                         return -1;
+-                if (isspace(linepos[0]))
++                if (isspace((unsigned char) linepos[0]))
+                         break;
+                 if (linepos[0] =3D=3D '=3D')
+                         break;
+@@ -751,7 +751,7 @@
+         temp =3D linepos;
+
+         /* skip whitespace after key */
+-        while (isspace(linepos[0]))
++        while (isspace((unsigned char) linepos[0]))
+                 linepos++;
+         if (linepos[0] =3D=3D '\0')
+                 return -1;
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB33973A13BA96F2FB63428220FD650BMXPR01MB3397INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><span>From: &quot;Amitanand.Chikorde&quot; &lt;Amitanand.Chikorde@kpit=
.com&gt;</span></div>
<div><span></span></div>
<div><br>
</div>
<div>Fixed below systemd codesonar warnings.<br>
</div>
<div>1. isprint() and isspace() is invoked here with an argument of signed<=
br>
</div>
<div>type char, but only has defined behavior for int arguments that are<br=
>
</div>
<div>either representable as unsigned char or equal to the value<br>
</div>
<div>of macro EOF(-1).<br>
</div>
<div><br>
</div>
<div>As per codesonar report, in a number of libc implementations, isprint(=
)<br>
</div>
<div>and isspace() functions implemented using lookup tables (arrays):<br>
</div>
<div>passing in a negative value can result in a read underrun.<br>
</div>
<div><br>
</div>
<div>To avoid this unexpected behaviour, typecasted char type argument to<b=
r>
</div>
<div>unsigned char type.<br>
</div>
<div><br>
</div>
<div>2. &quot;seqnum&quot; defined, not initialized &amp; used in device-pr=
ivate.c<br>
</div>
<div>Intialized &quot;seqnum&quot; at definition.<br>
</div>
<div><br>
</div>
<div>Upstream-Status: Pending<br>
</div>
<div>Signed-off-by: Amitanand.Chikorde &lt;amitanand.chikorde@kpit.com&gt;<=
br>
</div>
<div>---<br>
</div>
<div>&nbsp;.../files/systemd_codesonar_warnings_fix.patch &nbsp; &nbsp; &nb=
sp;| 105 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
</div>
<div>&nbsp;5 files changed, 9 insertions(&#43;), 9 deletions(-)<br>
</div>
<div>&nbsp;create mode 100644 files/systemd_codesonar_warnings_fix.patch<br=
>
</div>
<div><br>
</div>
<div>diff --git a/files/systemd_codesonar_warnings_fix.patch b/files/system=
d_codesonar_warnings_fix.patch<br>
</div>
<div>new file mode 100644<br>
</div>
<div>index 0000000..8138eba<br>
</div>
<div>--- /dev/null<br>
</div>
<div>&#43;&#43;&#43; b/files/systemd_codesonar_warnings_fix.patch<br>
</div>
<div>@@ -0,0 &#43;1,105 @@<br>
</div>
<div>&#43;systemd: fix codesonar warnings<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;Fixed below systemd codesonar warnings.<br>
</div>
<div>&#43;1. isprint() and isspace() is invoked here with an argument of si=
gned<br>
</div>
<div>&#43;type char, but only has defined behavior for int arguments that a=
re<br>
</div>
<div>&#43;either representable as unsigned char or equal to the value<br>
</div>
<div>&#43;of macro EOF(-1).<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;As per codesonar report, in a number of libc implementations, isp=
rint()<br>
</div>
<div>&#43;and isspace() functions implemented using lookup tables (arrays):=
<br>
</div>
<div>&#43;passing in a negative value can result in a read underrun.<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;To avoid this unexpected behaviour, typecasted char type argument=
 to<br>
</div>
<div>&#43;unsigned char type.<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;2. &quot;seqnum&quot; defined, not initialized &amp; used in devi=
ce-private.c<br>
</div>
<div>&#43;Intialized &quot;seqnum&quot; at definition.<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;Signed-off-by: Amitanand N. Chikorde &lt;Amitanand.Chikorde@kpit.=
com&gt;<br>
</div>
<div>&#43;Upstream-Status: Pending<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;--- origcode/src/libsystemd/sd-device/device-private.c 2020-07-09=
 18:05:13.744127907 &#43;0530<br>
</div>
<div>&#43;&#43;&#43;&#43; modifcode/src/libsystemd/sd-device/device-private=
.c &nbsp; &nbsp; &nbsp; &nbsp;2020-07-09 18:01:56.494621945 &#43;0530<br>
</div>
<div>&#43;@@ -560,7 &#43;560,7 @@<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; char **key;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; const char *major =3D NULL, *minor =
=3D NULL;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; DeviceAction action =3D _DEVICE_ACTI=
ON_INVALID;<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp;uint64_t seqnum;<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t seqnum =3D 0;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; int r;<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; assert(ret);<br>
</div>
<div>&#43;--- origcode/src/libudev/libudev-util.c &nbsp; &nbsp; &nbsp; &nbs=
p;2020-07-09 18:05:13.656049515 &#43;0530<br>
</div>
<div>&#43;&#43;&#43;&#43; modifcode/src/libudev/libudev-util.c &nbsp; &nbsp=
; &nbsp; 2020-07-09 18:02:32.563386414 &#43;0530<br>
</div>
<div>&#43;@@ -171,7 &#43;171,7 @@<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; /* strip trailing whitespace */<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; len =3D strnlen(str, len);<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp;while (len &amp;&amp; isspace(str[le=
n-1]))<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp;while (len &amp;&amp; isspace((u=
nsigned char) str[len-1]))<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; len--;<b=
r>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; /* strip leading whitespace */<br>
</div>
<div>&#43;@@ -182,8 &#43;182,8 @@<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; j =3D 0;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; while (i &lt; len) {<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* subst=
itute multiple whitespace with a single '_' */<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (issp=
ace(str[i])) {<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;while (isspace(str[i]))<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (=
isspace((unsigned char) str[i])) {<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;while (isspace((unsigned char) str[i]))<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i&#43;&#43;;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; to[j&#43;&#43;] =3D '_';<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
</div>
<div>&#43;--- origcode/src/udev/udevadm-hwdb.c &nbsp; 2020-07-09 18:05:13.6=
12010318 &#43;0530<br>
</div>
<div>&#43;&#43;&#43;&#43; modifcode/src/udev/udevadm-hwdb.c &nbsp;2020-07-0=
9 18:03:26.243530163 &#43;0530<br>
</div>
<div>&#43;@@ -487,7 &#43;487,7 @@<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* strip=
 trailing whitespace */<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; len =3D =
strlen(line);<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (l=
en &gt; 0 &amp;&amp; isspace(line[len-1]))<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;whil=
e (len &gt; 0 &amp;&amp; isspace((unsigned char) line[len-1]))<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; len--;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; line[len=
] =3D '\0';<br>
</div>
<div>&#43;<br>
</div>
<div>&#43;--- origcode/src/udev/udevadm-info.c &nbsp; 2020-07-09 18:05:13.6=
16013882 &#43;0530<br>
</div>
<div>&#43;&#43;&#43;&#43; modifcode/src/udev/udevadm-info.c &nbsp;2020-07-0=
9 18:03:41.621625782 &#43;0530<br>
</div>
<div>&#43;@@ -73,7 &#43;73,7 @@<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* skip =
nonprintable attributes */<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; len =3D =
strlen(value);<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (l=
en &gt; 0 &amp;&amp; isprint(value[len-1]))<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;whil=
e (len &gt; 0 &amp;&amp; isprint((unsigned char) value[len-1]))<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; len--;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (len =
&gt; 0)<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; continue;<br>
</div>
<div>&#43;--- origcode/src/udev/udev-rules.c &nbsp; &nbsp; 2020-07-09 18:05=
:13.624021008 &#43;0530<br>
</div>
<div>&#43;&#43;&#43;&#43; modifcode/src/udev/udev-rules.c &nbsp; &nbsp;2020=
-07-09 18:03:03.227995790 &#43;0530<br>
</div>
<div>&#43;@@ -726,7 &#43;726,7 @@<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -=
1;<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; /* skip whitespace */<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp;while (isspace(linepos[0]) || linepo=
s[0] =3D=3D ',')<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp;while (isspace((unsigned char) l=
inepos[0]) || linepos[0] =3D=3D ',')<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; linepos&=
#43;&#43;;<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; /* get the key */<br>
</div>
<div>&#43;@@ -738,7 &#43;738,7 @@<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; linepos&=
#43;&#43;;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (line=
pos[0] =3D=3D '\0')<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; return -1;<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (issp=
ace(linepos[0]))<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (=
isspace((unsigned char) linepos[0]))<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; break;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (line=
pos[0] =3D=3D '=3D')<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; break;<br>
</div>
<div>&#43;@@ -751,7 &#43;751,7 @@<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; temp =3D linepos;<br>
</div>
<div>&#43;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; /* skip whitespace after key */<br>
</div>
<div>&#43;- &nbsp; &nbsp; &nbsp; &nbsp;while (isspace(linepos[0]))<br>
</div>
<div>&#43;&#43; &nbsp; &nbsp; &nbsp; &nbsp;while (isspace((unsigned char) l=
inepos[0]))<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; linepos&=
#43;&#43;;<br>
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; if (linepos[0] =3D=3D '\0')<br>
</div>
<div><span>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; re=
turn -1;</span></div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB33973A13BA96F2FB63428220FD650BMXPR01MB3397INDP_--
