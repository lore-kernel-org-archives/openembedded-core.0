Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.75])
 by mx.groups.io with SMTP id smtpd.web12.711.1610627691106607336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 04:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bdqlwN9z;
 spf=pass (domain: kpit.com, ip: 40.107.139.75, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlV4++bh6wDcSvrlcU54qWKs1H6pHKtLGpvDxCkbuwnpJbz6LFs8WpV35es/+UsArxQEyaJaCv/v4QkvxixCraKk5W0c4+h670/XUuBS5+EUpSoEaO9u+iU73k881bm1b7VRB1o5e32ZvVwkxvAHx/1H7V1oU6LioLoNJxRS3w6ahEemczU4HG94VREnFq4m485/lMyGtdqRwrunQF5Z1gYqvdxGayKSoDd6I6cwFp1KW+iwrDx07XY8PIpt7RQy5pquZxDZubuAf8Ej2UTulJmxESppncl2m0JHGM+nVRgMCTfNOsglrZaomsVP093h0oIrOsgOSjKz86lRML7Dqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCAdMRCna2+dMvuDy1oNAsMCwloL+PSdILsvMOD3Xws=;
 b=LIA94xprCiLzct5wJml1CBOK5FUkO7b1SKuk0nQLxhzIU2KLSUKqU/FjCAyzvpwm0DsF4Ac/r5GJ1urmVJL9zQgLkrUNz5gCMrMKM5VwqT7Fk1z8fyoWeluR32g7Q80WSkHO0sX1LN6Qqk0x52V1S03NbYDMMqm9n4dl+dRB2fv4qw3+k+ToZ4SpMpc2TUCzhySUjBirrCX1ntvqdV0PPQangKv4iIncY06d4xHazd/UERK2e1SY24pjXbYK34UGWUyMkfCkrDaFmLHsgjmbr25HbEh0OjfSmtXWeB8XoWqUHB4/b26D5AkRQWPK4rgIfi5hmNQyB/5yqf6mOa002Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCAdMRCna2+dMvuDy1oNAsMCwloL+PSdILsvMOD3Xws=;
 b=bdqlwN9zQeDGiK4JGJ6i5u9Z9Wj25M7dPlmtozxab/E2v8hP/juxs67PnrzR0r+q5OcsihTlMX9TntMp55+Oc266jZ77InE0LRnDYhe6VfmtBgw0qMww1B6bGH0BLu3KanuHJ/1YNAbZiyXCGIFij5VYXjSoXAYcI36e10Ix3FI=
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 12:34:48 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 12:34:48 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Thread-Topic: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Thread-Index: AQHW6nD2l/c//VpyskqER+UTUjSv+6onDkHP
Date: Thu, 14 Jan 2021 12:34:47 +0000
Message-ID: 
 <PN2PR01MB4410B33065EE84F48B994FBCEFA80@PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM>
References: <1610627384-11461-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
In-Reply-To: <1610627384-11461-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [182.48.232.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c51277b2-6b7a-4813-1e08-08d8b888c7f9
x-ms-traffictypediagnostic: PNZPR01MB4158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PNZPR01MB4158EF73134778DF651B32BCEFA80@PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5oNcYJ9SxH4PvMnw6jaY4haCYijV1TbacqQmBd1etgXvJ55xubnbKE4Ds4iIB+MkpTK+9f2HWG5wqus+oDC+83g2a/hAAKRAeNU71CBfXJ3/oflBj2QqmnysZLLZPZV2NVH9lyxz89wrrEpmBP3EW93ox4RaGYFbv7nPiDl7a3IFkVcBqs6ka7eHXIu2d02KLvo5a7resXUBJUKc/FCidp9qMHaonFMCigj/0GtJcIuEPT/77oHpz0irNBON5czdDFc6hzq9xM+We/FdqZMJ0MNr03pZ0ghsyRu2gTTahh11TNhvurDGHbq38K5gTVmUSAm27muDS3jzPkcLKllSQUPoSWK7sUL1Qa27i9WBJAosQmFYp6luJdDtBL4mClJ6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(8676002)(52536014)(9686003)(8936002)(55016002)(86362001)(107886003)(6916009)(2906002)(478600001)(66946007)(5660300002)(66556008)(316002)(66574015)(83380400001)(64756008)(33656002)(66446008)(66476007)(76116006)(6506007)(186003)(71200400001)(19627405001)(26005)(7696005)(53546011)(91956017)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?MPoLINywBSzjilAb3GQdnA7BSfTgrmIJVsr0oM1SfU+4rmklz5Sg2SD8W1?=
 =?iso-8859-1?Q?wf+rlLjdQNqZYLV2RaoeKtmlVPpDF2NaXOyyHGphTLNiCAYV9zPsQAXFEH?=
 =?iso-8859-1?Q?yOGjO3McRbRi7tRZKqjCxNqR07L4FmiQdLUa3VyXAr6Pg9r8fKYzHT85OF?=
 =?iso-8859-1?Q?MAFq1Gn+pLUACVHL6VP4rC8ZtgVkyM1cWhxZAhfVeO2a7WsMLszPrngOBK?=
 =?iso-8859-1?Q?drBHHe9QHceKM7/VFwrz6ZJ8PDrkCTHF39VsrtOkf7SGWBVbRgn3AnEs7k?=
 =?iso-8859-1?Q?deJKTfHG7zs4eg6Fqe1x1jRHyu1+yEM8Ucp8L0ceYuu/oqv0vVW3pq4ewN?=
 =?iso-8859-1?Q?Yb/m8KkA6JMlFiuxnaJ1pSmLWZPRXUuywXgCF2gwzatyw/EMb6DnwnvImF?=
 =?iso-8859-1?Q?NEorVbxdRbmDQ4aooytWnlGJVdIy34jDO3paXKcLlxZwcfyWob7Xw2gf2m?=
 =?iso-8859-1?Q?HgaKL5xnCrjSXzHAVFLCDj49VlG6TfhLIcwyXhh/2Vfn5DLX1v2mmpihCs?=
 =?iso-8859-1?Q?RqnJXcQyDuBtjsFnauunb+Ro4tylUx5Hn3lNDi4Ze7RiwbBY77zuP0zI9e?=
 =?iso-8859-1?Q?7NC/Lt1AE3qYuUDTuesd4QyohSQdQiK+Lk229+44mVrc9DeloFkaxRYXZq?=
 =?iso-8859-1?Q?ysrpKKklwarrm9ILBm7BDjPB5LvN/C5bALbUxGMm9UMnviFroXLG9bOwMA?=
 =?iso-8859-1?Q?2pAiCNOhX8gHx41fEB/KE77RtSbw8AT7bRYdbVz54gy3fo1VNJxNnevayU?=
 =?iso-8859-1?Q?SJLqNLjO1XAq3NZJCiUq094L197EzH7+YRAyFoDMSHdjZXH38CiwvNpb5h?=
 =?iso-8859-1?Q?bLAQuYcAQOqCkCuo5uhNcJ/d0nuRgs+NQYPvKzy5kixFnG5tcvaNOyBoD1?=
 =?iso-8859-1?Q?/yMDI7EVi8Y3YbYmNFKZrK0KgBSd7oaJKYxqFZGyiHI7U1lZCRHOuRwYQy?=
 =?iso-8859-1?Q?INBqlRS47W0B/Whmhc9fLtda/lKo2hyU5H300Jz1kTUlg1nneclANRIhsk?=
 =?iso-8859-1?Q?dW0fOvnQCGSJxrXiQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c51277b2-6b7a-4813-1e08-08d8b888c7f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 12:34:48.0570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hhon3MhVATDAS/kItpjAjbIEPdlYmGK09a/9Ux0G6X5P8BHlz8P2mtKwnrFpKecTkT/2rmqk2+uZFx8o9EAvFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4158
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB4410B33065EE84F48B994FBCEFA80PN2PR01MB4410INDP_"

--_000_PN2PR01MB4410B33065EE84F48B994FBCEFA80PN2PR01MB4410INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this email!


Thanks & Regards,

Harprit Bhandari

________________________________
From: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Sent: 14 January 2021 17:59
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; =3Daditya.tayade@kpit.com <=
=3Daditya.tayade@kpit.com>
Subject: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest

Upgrade SRCREV to latest as it fixes the below issue:
Running UndefinedBehaviorSanitizer on projects that use
rapidjson triggers 'applying non-zero offset <NN> to null
pointer' findings in 'internal/stack.h' which are hard
to suppress by library users.
Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
as the changes are already incorporated in the latest
codebase.
As per abi-compliance-checker report the source compatibility
and binary compatibility between previous SRCREV
6a905f9311f82d306da77bd963ec5aa5da07da9c and current
SRCREV 0ccdbf364c577803e2a751f5aededce935314313
is 100% and this patch is already tested on 64bit
ARM (aarch64) in a product with on target CI tests.

Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/=
recipes-devtools/rapidjson/rapidjson_git.bb
index e3ed9c6..5b5c8b2 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,9 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dba04aa8f65de1396a7e59d1d746=
c2125"

-SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1 \
-           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path=
.patch"
+SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1"

-SRCREV =3D "6a905f9311f82d306da77bd963ec5aa5da07da9c"
+SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"

 PV =3D "1.1.0+git${SRCPV}"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN2PR01MB4410B33065EE84F48B994FBCEFA80PN2PR01MB4410INDP_
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
<div style=3D"margin:0px;font-size:12pt">Please ignore this&nbsp;email!</di=
v>
<div style=3D"margin:0px;font-size:14px;font-family:&quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syste=
m, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif">
<div style=3D"margin:0px;font-size:12pt;font-family:Calibri, Arial, Helveti=
ca, sans-serif">
<br>
</div>
<div style=3D"margin:0px">
<div style=3D"margin:0px">
<div dir=3D"ltr" style=3D"margin:0px;font-size:12pt;font-family:Calibri, He=
lvetica, sans-serif">
<p style=3D"margin-top:0px;margin-bottom:0px">Thanks &amp; Regards,</p>
<p style=3D"margin-top:0px;margin-bottom:0px">Harprit Bhandari</p>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Harpritkaur Bhandari =
&lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Sent:</b> 14 January 2021 17:59<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; =3Daditya.tayade=
@kpit.com &lt;=3Daditya.tayade@kpit.com&gt;<br>
<b>Subject:</b> [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to late=
st</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Upgrade SRCREV to latest as it fixes the below iss=
ue:<br>
Running UndefinedBehaviorSanitizer on projects that use<br>
rapidjson triggers 'applying non-zero offset &lt;NN&gt; to null<br>
pointer' findings in 'internal/stack.h' which are hard<br>
to suppress by library users.<br>
Removed &quot;0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patc=
h&quot;<br>
as the changes are already incorporated in the latest<br>
codebase.<br>
As per abi-compliance-checker report the source compatibility<br>
and binary compatibility between previous SRCREV<br>
6a905f9311f82d306da77bd963ec5aa5da07da9c and current<br>
SRCREV 0ccdbf364c577803e2a751f5aededce935314313<br>
is 100% and this patch is already tested on 64bit<br>
ARM (aarch64) in a product with on target CI tests.<br>
<br>
Signed-off-by: Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@kpit.com&gt;<b=
r>
---<br>
&nbsp;meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---<br>
&nbsp;1 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/=
recipes-devtools/rapidjson/rapidjson_git.bb<br>
index e3ed9c6..5b5c8b2 100644<br>
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb<br>
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb<br>
@@ -4,10 +4,9 @@ SECTION =3D &quot;libs&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://license.txt;md5=3Dba04aa=
8f65de1396a7e59d1d746c2125">file://license.txt;md5=3Dba04aa8f65de1396a7e59d=
1d746c2125</a>&quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;git://github.com/miloyip/rapidjson.git;nobranch=3D1 \<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch">
file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch</a>&q=
uot;<br>
+SRC_URI =3D &quot;git://github.com/miloyip/rapidjson.git;nobranch=3D1&quot=
;<br>
&nbsp;<br>
-SRCREV =3D &quot;6a905f9311f82d306da77bd963ec5aa5da07da9c&quot;<br>
+SRCREV =3D &quot;0ccdbf364c577803e2a751f5aededce935314313&quot;<br>
&nbsp;<br>
&nbsp;PV =3D &quot;1.1.0+git${SRCPV}&quot;<br>
&nbsp;<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
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

--_000_PN2PR01MB4410B33065EE84F48B994FBCEFA80PN2PR01MB4410INDP_--
