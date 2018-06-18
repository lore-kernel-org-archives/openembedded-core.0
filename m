Return-Path: <TOl@hms.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0057.outbound.protection.outlook.com [104.47.2.57])
	by mail.openembedded.org (Postfix) with ESMTP id 23875606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 01:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/tFoJwECt0u9SPS84nTW11ZbE6lKWGO7S6DmJPoleaA=;
	b=FEu7VTb1Wp8/H0Wlp5WuS3CR6c+FM7prYkgWB+jp3xKXOW3gzL4qoKGz5ci3Mj2SSsSv4GwBlCJBbJVG6kCHTaVNuwsC4TmNkV+fvxICRn8BjbXbVxufuotml7j2wyablynk/7JP/5xkzj9yKnJo5PvbLcz0hU3PQCwiiV86s3M=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2438.eurprd06.prod.outlook.com (10.169.213.144) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.16; Mon, 18 Jun 2018 12:25:27 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d%2]) with mapi id 15.20.0863.016;
	Mon, 18 Jun 2018 12:25:27 +0000
From: Tobias Olausson <TOl@hms.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meta-oe][PATCH] image_types.bbclass: add optional
	size	to ubi vols
Thread-Index: AQHUBv9wLX4/KuS7QkqhnXlse0m9yg==
Date: Mon, 18 Jun 2018 12:25:26 +0000
Message-ID: <DB6PR0601MB2133BA4A7605F9D8CFE5BE4AC3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133494840B64E5FA74F9A63C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
In-Reply-To: <DB6PR0601MB2133494840B64E5FA74F9A63C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2438;
	7:KS66xUHiSs5tOamhOu0u111MN3iCBCAie9PlSiI3lGNseFD8GX02azxff0f3jPABwV8lI3uLcxsl74TtaXlDFdxfokNjfo33tpI1AUwWj7irdvjFwbNFYhcedM55RSyailEVqMQAgkchB4/xONSbMt6CfrWxJPGivFZf5ZIFxMB0c4V3YPcIhzxs+1EmTer4X0k9ePlNaj+Im2hPjhbYZURCezne+v3p9NPpS2eL//u0ZE1lnGKZiC+uF6yn3jwX
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(376002)(366004)(39380400002)(396003)(39850400004)(346002)(199004)(189003)(252514010)(14454004)(8936002)(5660300001)(99286004)(6436002)(3660700001)(81156014)(81166006)(68736007)(3280700002)(106356001)(105586002)(229853002)(9686003)(6306002)(54896002)(53936002)(236005)(66066001)(72206003)(316002)(55016002)(4326008)(478600001)(74482002)(5640700003)(6246003)(486006)(76176011)(2900100001)(74316002)(7696005)(86362001)(2940100002)(606006)(575784001)(2351001)(19627405001)(97736004)(26005)(966005)(2906002)(2501003)(53546011)(6506007)(11346002)(446003)(5250100002)(6606003)(6116002)(3846002)(6916009)(33656002)(25786009)(102836004)(7736002)(476003)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2438;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 07fc2e2e-38ab-4b89-9eaf-08d5d51692ba
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2438; 
x-ms-traffictypediagnostic: DB6PR0601MB2438:
x-microsoft-antispam-prvs: <DB6PR0601MB2438FEBC5C5CC4E85C8CADA4C3710@DB6PR0601MB2438.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2438; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2438; 
x-forefront-prvs: 0707248B64
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: T/fqy283ohmd08INl2x29txf62j5Y0IM++P0v83niU9Bay7edMTSFfdYJXTJ5cvC5kYXosV3YqnSm9qOptAYJ/IikG5OGBzYFTv0Ik9zaRDAFmH2qWpp9G43SkfHCR8zjaICAX297yk/qnuWUe2OhpxgBh8dJdXyWWx+aqd5QTBSvbxATWZEjez2IVWbfffEBZdloJfe/AjaewUeCDH6+4rnhs5V1Lu2MAoLcG3wfrGwEZj4ILyu6aBvG52i+ZCbDvxrAFt+FyXQb2pBUOfSMyagOQ9HXkAb0neb7XWKZ4h0rrCuXyBKYZAYkSAjpUS+JY9Ux/QrPrb86asdJVX46w==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fc2e2e-38ab-4b89-9eaf-08d5d51692ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 12:25:26.9087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2438
Cc: Magnus Olsson <Mago@hms.se>
Subject: Re: [meta-oe][PATCH] image_types.bbclass: add optional size	to ubi vols
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 01:58:02 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0601MB2133BA4A7605F9D8CFE5BE4AC3710DB6PR0601MB2133_"

--_000_DB6PR0601MB2133BA4A7605F9D8CFE5BE4AC3710DB6PR0601MB2133_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just noticed there is a serious typo that will make this fail in multiubi s=
ettings. It worked for my non-multi setup which was just lucky variable nam=
ing. Will send an updated patch.


Tobias Olausson
Development Engineer

HMS Industrial Networks AB

Norra =C5gatan 26C
431 35 M=F6lndal, Sweden

Email: tol@hms.se



________________________________
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Tobias Olausson <TOl@hms.se>
Sent: Monday, June 18, 2018 1:29 PM
To: openembedded-core@lists.openembedded.org
Cc: Magnus Olsson
Subject: [OE-core] [meta-oe][PATCH] image_types.bbclass: add optional size =
to ubi vols

From d7b8be3f844c10ace0d4c04e35986145fc20d0d8 Mon Sep 17 00:00:00 2001
From: Tobias Olausson <tol@hms.se>
Date: Mon, 18 Jun 2018 13:22:04 +0200
Subject: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi vol=
s

Instead of hard coding the ubi volume to be just large enough to fit the
root file system, one can use a variable to set a preferred size.

Signed-off-by: Tobias Olausson <tol@hms.se>
---
 meta/classes/image_types.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 00a00d318f..ae23aeaa8a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -164,10 +164,18 @@ multiubi_mkfs() {
                 local vname=3D"_$3"
         fi

+       # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_name for multi=
ubi
+       eval local UBI_VOL_SIZE=3D\"\$UBI_VOL_SIZE_${name}\"
+
         echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
         echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.cfg
         echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUF=
FIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
         echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.cfg
+
+       if [ -n "${UBI_VOL_SIZE}" ]; then
+               echo "vol_size=3D${UBI_VOL_SIZE}" >> ubinize${vname}-${IMAG=
E_NAME}.cfg
+       fi
+
         echo vol_type=3Ddynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
         echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cf=
g
         echo vol_flags=3Dautoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
--
2.17.1



--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_000_DB6PR0601MB2133BA4A7605F9D8CFE5BE4AC3710DB6PR0601MB2133_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Just noticed there is a serious t=
ypo that will make this fail in multiubi settings. It worked for my non-mul=
ti setup which was just lucky variable naming. Will send an updated patch.<=
br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFo=
nt&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoCo=
lorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymb=
ols;">
<p style=3D"margin-top:0; margin-bottom:0"><span id=3D"ms-rterangepaste-sta=
rt"></span></p>
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:10pt; font-family:&quo=
t;Arial&quot;,sans-serif,serif,&quot;EmojiFont&quot;; color:rgb(0,51,102)" =
lang=3D"EN-US">Tobias Olausson<br>
</span></b><b><span style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;=
,sans-serif,serif,&quot;EmojiFont&quot;; color:rgb(0,51,102)" lang=3D"EN-US=
">Development Engineer</span></b><span style=3D"" lang=3D"EN-US"></span></p=
>
<p class=3D"x_MsoNormal"><span style=3D"font-size:7.5pt; font-family:&quot;=
Arial&quot;,sans-serif,serif,&quot;EmojiFont&quot;; color:rgb(31,73,125)" l=
ang=3D"EN-US"><br>
</span><span style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-s=
erif,serif,&quot;EmojiFont&quot;; color:rgb(0,51,102)" lang=3D"EN-US">HMS I=
ndustrial Networks AB</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:7.5pt; font-family:&quot;=
Arial&quot;,sans-serif,serif,&quot;EmojiFont&quot;; color:rgb(0,51,102)" la=
ng=3D"EN-US">Norra =C5gatan 26C<br>
431 35 M=F6lndal, Sweden</span><span style=3D"font-size:7.5pt; font-family:=
&quot;Arial&quot;,sans-serif,serif,&quot;EmojiFont&quot;; color:rgb(31,73,1=
25)" lang=3D"EN-US"><br>
</span><span style=3D"font-size:7.5pt; font-family:&quot;Arial&quot;,sans-s=
erif,serif,&quot;EmojiFont&quot;; color:rgb(0,51,102)" lang=3D"EN-US"><br>
Email: tol@hms.se</span><span style=3D"font-size:7.5pt; font-family:&quot;A=
rial&quot;,sans-serif,serif,&quot;EmojiFont&quot;; color:rgb(0,51,102)" lan=
g=3D"EN-US"></span><br>
</p>
<span id=3D"ms-rterangepaste-end"></span><br>
<p></p>
</div>
</div>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openembedded-core-b=
ounces@lists.openembedded.org &lt;openembedded-core-bounces@lists.openembed=
ded.org&gt; on behalf of Tobias Olausson &lt;TOl@hms.se&gt;<br>
<b>Sent:</b> Monday, June 18, 2018 1:29 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Magnus Olsson<br>
<b>Subject:</b> [OE-core] [meta-oe][PATCH] image_types.bbclass: add optiona=
l size to ubi vols</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From d7b8be3f844c10ace0d4c04e35986145fc20d0d8 Mon =
Sep 17 00:00:00 2001<br>
From: Tobias Olausson &lt;tol@hms.se&gt;<br>
Date: Mon, 18 Jun 2018 13:22:04 &#43;0200<br>
Subject: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi vol=
s<br>
<br>
Instead of hard coding the ubi volume to be just large enough to fit the<br=
>
root file system, one can use a variable to set a preferred size.<br>
<br>
Signed-off-by: Tobias Olausson &lt;tol@hms.se&gt;<br>
---<br>
&nbsp;meta/classes/image_types.bbclass | 8 &#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;<br>
&nbsp;1 file changed, 8 insertions(&#43;)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index 00a00d318f..ae23aeaa8a 100644<br>
--- a/meta/classes/image_types.bbclass<br>
&#43;&#43;&#43; b/meta/classes/image_types.bbclass<br>
@@ -164,10 &#43;164,18 @@ multiubi_mkfs() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; local vname=3D&quot;_$3&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Set UBI_VOL_SIZE (for regular u=
bi) or UBI_VOL_SIZE_name for multiubi<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eval local UBI_VOL_SIZE=3D\&quot;=
\$UBI_VOL_SIZE_${name}\&quot;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo \[ubifs\] &gt; ubiniz=
e${vname}-${IMAGE_NAME}.cfg<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo mode=3Dubi &gt;&gt; u=
binize${vname}-${IMAGE_NAME}.cfg<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo image=3D${IMGDEPLOYDI=
R}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs &gt;&gt; ubinize${vname}=
-${IMAGE_NAME}.cfg<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo vol_id=3D0 &gt;&gt; u=
binize${vname}-${IMAGE_NAME}.cfg<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;${UBI_VOL_SIZE}&quo=
t; ]; then<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; echo &quot;vol_size=3D${UBI_VOL_SIZE}&quot; &gt;&gt; ubinize=
${vname}-${IMAGE_NAME}.cfg<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo vol_type=3Ddynamic &g=
t;&gt; ubinize${vname}-${IMAGE_NAME}.cfg<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo vol_name=3D${UBI_VOLN=
AME} &gt;&gt; ubinize${vname}-${IMAGE_NAME}.cfg<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo vol_flags=3Dautoresiz=
e &gt;&gt; ubinize${vname}-${IMAGE_NAME}.cfg<br>
-- <br>
2.17.1<br>
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" id=3D"LPlnk353371" class=3D"OWAAutoLink" previewremoved=3D"true">http://l=
ists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DB6PR0601MB2133BA4A7605F9D8CFE5BE4AC3710DB6PR0601MB2133_--
