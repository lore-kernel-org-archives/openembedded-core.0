Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D931EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:42:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.5476.1690231321699275230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=YwRqP0Ox;
 spf=pass (domain: welotec.com, ip: 40.107.20.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaGGNwnLRTxPm4YO94+k0qhx/FW/V/SO7J9mn8OJ1aj4kBfPnRUgT+gqCTTUll/9YGk/bJxG84FUT0y/z1n46NOVhtmm/UYTqBeJEIdSfvJa/qY7S37YPV+NWUVwtEezrgVHGTu6Nnl6lOjkB+s020bgeLBVINtog5thImsNU71bX0L6H5vsCwhyRkxS5WwQ7jRqTIE35TvTaCzogbSd0vf5naSxfaOUKIVuoUooouU4ZXKzw9ntFf7vMHJS8g5ALjHvDpgWXiWiXXvHhNE02JeI+Q5donL414sLC/IhJwAp2jaJonNR3u/5j7W3crOtfkZ9LPIYoOthr4MjdadD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj10VASRnLTFzEE4QMhMIfCfHyAk8LpEQCDnELB2Log=;
 b=lxZM6LVaG034rPbkFNh7GGB0X00Svo7JW68sJAckXYV/wQVFB4d3ZEj4L4CrNIc2yMQkfZuJJJRIcU9jn3CJl9OhG07InE85joOpA6tuqhYpd4C/G7yKlowKcWcRMl2TWyU/9A8q21sU8S4AFjdz3GV7+kEpm2UmdL19tJJd+1EbccmpTXuyNlNR1ZIJmelIWDSEGrS+srt5DTL855JH1sXGrgKQz6eRN4ds6AwaqKfcVt0guJVdUn3kueh15flc5VwkKua75k658TiX3a4biAmQTfycmP38gFPQk6ZmRJYUSetUlnpwsDzuQxT2HYLPXCD5ea2oGxEdvFOLQJBXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj10VASRnLTFzEE4QMhMIfCfHyAk8LpEQCDnELB2Log=;
 b=YwRqP0Oxg8rtZA2aD4+L7QVMvV48LFh/OXpkNcop37dCouNh2TcxQoH+3bAX64yCfwUgyfe+zkf/GD8rnPPd/lORZngWN6LK3qurejHuUmtBBcJLQaHgPK4/Zb29PUHv54rTCDTWnH842FryuR6bDTBkpOV0EoNzFif1xGoOiLk=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:41:58 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:41:58 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, =?iso-8859-2?Q?Piotr_=A3obacz?=
	<p.lobacz@welotec.com>
CC: Christian Hermann <mail@hermannch.dev>, Alex Stewart <alex.stewart@ni.com>
Subject: ODP: [OE-Core][PATCH v5 2/5] CONTRIBUTING: fix yocto ML link
Thread-Topic: [OE-Core][PATCH v5 2/5] CONTRIBUTING: fix yocto ML link
Thread-Index: AQHZvm8aSfYsA8dmf0yjRBPUAgs2mK/JYXvd
Date: Mon, 24 Jul 2023 20:41:58 +0000
Message-ID: 
 <VI1PR04MB5373622B600F9B8AF4803F1F9102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230724204018.352695-1-p.lobacz@welotec.com>
 <1774E85A2AA5D0F0.7114@lists.openembedded.org>
In-Reply-To: <1774E85A2AA5D0F0.7114@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB7608:EE_
x-ms-office365-filtering-correlation-id: 992d9a64-3000-46e0-40ff-08db8c866d0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vPrk2aP8ecBFMp35vjRAama1m/0lQp95LErCxdkk9Ugtxdd0G/dqhSB8/X9fEwRe2dazKW0J/kzn88riay9oZnGU2pX1tKFamCI7ZvbSAacZPxxbI3zaWQxRzqVU93kajVeZlUrKdULLvuTTQUPPZnhOhB1kUXnnW9r4wFXUGvAxe+HXlPOkDaO4FCSnj1saIX3tjqQ+G8PMFMUZD9nvaAqNK83s0t+694/nGcVz+WUjGMaoaFQJYLghv7UsOy0hW33b0iuOJgbWXI8/Py7dmVradL5giSkfM3py2sohDHF1DIjoIGBkM1GSaV8hohamlZE02szxPKwz4lT1Mp3eYsw8s7YfG9wWI8/l3j3yB0Hwgaomf8JupGzczyhPLI1MCzTpp9itFwgCoC0SYd7JGfibyOUqIykqHAjJhJmuVm0ESWgLnAAwu2C2rjVlhgKZhVG6Pl+LVAYknJ7QLNzKA3mW0rFpsQkGhr3Xt7DCYKkwY8VNEwTzqzvsykOdoMzktJ4fnCqoULLeeK1XS/56CF92+2VPH357dPvBnq5DRIq2+d+ztHCcqB+MrpgXFDQMH/v6Zr/1Mgq6wLJ3xtfZbFsfuXqXj2sleDmK+5lHY4nJw39BPLR0LvqIs8czpmj9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39840400004)(346002)(451199021)(66556008)(66476007)(64756008)(66446008)(66946007)(316002)(4326008)(110136005)(54906003)(38100700002)(83380400001)(76116006)(38070700005)(91956017)(33656002)(71200400001)(478600001)(19627405001)(7696005)(9686003)(41300700001)(8676002)(8936002)(26005)(186003)(52536014)(5660300002)(6506007)(86362001)(55016003)(2906002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?Jj87pnOuODZqD3Z9s5JPM/TiRrOrFOXGpyhmk4JH1oz5vvrh4RPgci4gDl?=
 =?iso-8859-2?Q?tpvUIMxWK9/aXBPU1VGZGO8S/QRqp7I/GlFg8fMVe9rHKKcl86Gc3aN3qH?=
 =?iso-8859-2?Q?6TusgCytFZigOyqX+eQzBYueQEPsF6Afh7bGjrD6DvRXHWSiojxkN5bkVH?=
 =?iso-8859-2?Q?mTp+3KHHTxEKAEwSbdZWdsyjJxpoRsOOkHlNq0W1vhRUCd73vJP7+e9lbo?=
 =?iso-8859-2?Q?TZ72tmbu6GKZD5IC/1Oe01NaF1pSkgld7Q6Muux9Ct5uQiO9MxEEIBgjM9?=
 =?iso-8859-2?Q?2JetMTvbrGNTirBngTSfkMpTsowYD0NVmuwnRV49w3U4LqzOkRgCKCK2Fq?=
 =?iso-8859-2?Q?afoh5rfsYTHvCtpILTn1ZReuZnDv81Nc55K2bfe9jiyXybXoAC5ZkVUpMa?=
 =?iso-8859-2?Q?duOmiz7fs73ljlptUyynw4PSgxeWeWdnw7EHiaBBnYuuYJTXYKKEKVqf8n?=
 =?iso-8859-2?Q?O/aBOGarzGlUsm+dZoP+XTs3B8O1IOPRpO93gXs63IJ2b/FwmPhA2e40td?=
 =?iso-8859-2?Q?KUX1rl6fG7z8UEDlgVl2IXCYIiLg60q4E86wXZdA+jRJlx77O3iJ4DP0jO?=
 =?iso-8859-2?Q?1VgOfwb4DqyJ2jeIHUtNrCGUYu/jN3stQTGdCl3leFAtdBNHIwrm8RI+wK?=
 =?iso-8859-2?Q?fpTPbxQSrI5VnEWnyOz9bRD09lB5vrylerPe+iQMZxDw65OtrdlH1mMpkr?=
 =?iso-8859-2?Q?bPk0WUFfp6oQnIPWgW4jB5NH2v+rQgPh0Gh080ea1YZhDLLV4BE9UO5uHD?=
 =?iso-8859-2?Q?1bRJo/bMFCdRwKdfzl7t1xvb6ptjZ4bgxCt6OES/ZXPd/ZU9jFjqfY8g6i?=
 =?iso-8859-2?Q?0QupA7sXNwL8lJ5QhEjIWFrDckt6Vd6I9Ht8Jxka8eTRpIyZAw5tMEsuKU?=
 =?iso-8859-2?Q?YLhSD424OC9jeyCxYiCPe8GDFIpECOHFQjsvARazidOt7yYdC2EKUGH/9D?=
 =?iso-8859-2?Q?5iDQbuoMcTPICBFQEn0ua9gu6qajxxcBAWoCyFKEDtcJCLM0HhD+dCW2Bq?=
 =?iso-8859-2?Q?vx/hqyXBTbmmN1vc3pALV4rxL48byJ2beSV/SCHcqdEJv61WUNFr8MeRwj?=
 =?iso-8859-2?Q?8yY6xcvzOmoVnZQ49LLkoEl2f4KomWitxXlcciMGL+x+ESOVCOlYfusQwQ?=
 =?iso-8859-2?Q?5X3jnwD6TtqOf4gKvYZDy1O+GKGfSckucGUiYFFSmbkkhLGnsyr7inY/Lc?=
 =?iso-8859-2?Q?Ps6VCVuiVvFw40OpnvMJ1hIh8SGXl+QipLEtSzh5RIRy++WlK17TGdtJl3?=
 =?iso-8859-2?Q?E4gqn0KGtP7GC4ztx27kRTzYed9L9vH9f7vjVF49evVdfJhqA20k2WzGAv?=
 =?iso-8859-2?Q?TUzWfNqosI5y2QtHtOzSBjouV7l0hV1gcGntsp1UNA88UCrH6jjTOUf6XH?=
 =?iso-8859-2?Q?3KLJZ4nTGI2XFFDLv5SVAY1dS0uDaQDctwFmaekvyEPI5/iHVof+1ofPYB?=
 =?iso-8859-2?Q?PQ+gAmWQ9S5cbK+NgrmIa5RbGnFHEJALbS4QSQzUSiUJAO29GCs9C6bM+v?=
 =?iso-8859-2?Q?TX+TK2vhBrkd6VWd8RqyIQ1J3H5loFTvzzD18M7qoFbF3z1zGgE7LYq0+g?=
 =?iso-8859-2?Q?Z5yCCQc8LMFbRd17BpRcC9emGb8/Bh5BSIfwT3J5A33ZA00aIPBeaMuAiL?=
 =?iso-8859-2?Q?QzwDBm4OANGB7FjBp0BvPIzqy6wEaTv0Mi?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373622B600F9B8AF4803F1F9102AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992d9a64-3000-46e0-40ff-08db8c866d0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 20:41:58.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UC18RYt6yU9dag8Utpmk4/RFwUzgQfMuW8v2y9jQSobktaGbyLXaI+LCjtqFWrjmUsS4BEBmLbD6MKz4O4ommw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184812

--_000_VI1PR04MB5373622B600F9B8AF4803F1F9102AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

I'm sorry for these emails. They wer sent by mistake.

BR
Piotr
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 22:40
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
DW: Christian Hermann <mail@hermannch.dev>; Alex Stewart <alex.stewart@ni.c=
om>
Temat: [OE-Core][PATCH v5 2/5] CONTRIBUTING: fix yocto ML link

From: Christian Hermann <mail@hermannch.dev>

Signed-off-by: Christian Hermann <mail@hermannch.dev>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 CONTRIBUTING | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING b/CONTRIBUTING
index 8da0fc4..ea6b4ed 100644
--- a/CONTRIBUTING
+++ b/CONTRIBUTING
@@ -46,7 +46,7 @@ changed to fix multiple bugs, that should be multiple pat=
ches.

 Opkg-utils is primarily used by the OpenEmbedded build system but may also=
 be
 used by other embedded Linux projects. For now, please submit all patches =
to
-both the Yocto Project mailing list (yocto@yoctoproject.org) and the opkg =
mailing
+both the Yocto Project mailing list (yocto@lists.yoctoproject.org) and the=
 opkg mailing
 list (opkg-devel@googlegroups.com), adding a subject prefix of "opkg-utils=
 PATCH"
 (this prefix is necessary as the Yocto Project mailing list receives patch=
es for
 many projects). Also make sure that you use the -M option on the command l=
ine or
@@ -57,7 +57,7 @@ opkg-utils directory it will all be done automatically wh=
en you use
 `git format-patch` or `git send-email`:

         git config format.to "opkg-devel@googlegroups.com"
-       git config --add format.to "yocto@yoctoproject.org"
+       git config --add format.to "yocto@lists.yoctoproject.org"
         git config format.subjectprefix "opkg-utils PATCH"
         git config diff.renames copy

--
2.34.1


--_000_VI1PR04MB5373622B600F9B8AF4803F1F9102AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I'm sorry for these emails. They wer sent by mistake.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> poniedzia=B3ek, 24 lipca 2023 22:40<br>
<b>Do:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>DW:</b> Christian Hermann &lt;mail@hermannch.dev&gt;; Alex Stewart &lt;a=
lex.stewart@ni.com&gt;<br>
<b>Temat:</b> [OE-Core][PATCH v5 2/5] CONTRIBUTING: fix yocto ML link</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Christian Hermann &lt;mail@hermannch.dev&gt;=
<br>
<br>
Signed-off-by: Christian Hermann &lt;mail@hermannch.dev&gt;<br>
Signed-off-by: Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
---<br>
&nbsp;CONTRIBUTING | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/CONTRIBUTING b/CONTRIBUTING<br>
index 8da0fc4..ea6b4ed 100644<br>
--- a/CONTRIBUTING<br>
+++ b/CONTRIBUTING<br>
@@ -46,7 +46,7 @@ changed to fix multiple bugs, that should be multiple pat=
ches.<br>
&nbsp;<br>
&nbsp;Opkg-utils is primarily used by the OpenEmbedded build system but may=
 also be<br>
&nbsp;used by other embedded Linux projects. For now, please submit all pat=
ches to<br>
-both the Yocto Project mailing list (yocto@yoctoproject.org) and the opkg =
mailing<br>
+both the Yocto Project mailing list (yocto@lists.yoctoproject.org) and the=
 opkg mailing<br>
&nbsp;list (opkg-devel@googlegroups.com), adding a subject prefix of &quot;=
opkg-utils PATCH&quot;<br>
&nbsp;(this prefix is necessary as the Yocto Project mailing list receives =
patches for<br>
&nbsp;many projects). Also make sure that you use the -M option on the comm=
and line or<br>
@@ -57,7 +57,7 @@ opkg-utils directory it will all be done automatically wh=
en you use<br>
&nbsp;`git format-patch` or `git send-email`:<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config format.to &quot=
;opkg-devel@googlegroups.com&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config --add format.to &quot;yoct=
o@yoctoproject.org&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config --add format.to &quot;yoct=
o@lists.yoctoproject.org&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config format.subjectp=
refix &quot;opkg-utils PATCH&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config diff.renames co=
py<br>
&nbsp;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373622B600F9B8AF4803F1F9102AVI1PR04MB5373eurp_--

