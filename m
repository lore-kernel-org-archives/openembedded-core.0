Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web12.3939.1605082007466582758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 00:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=Z38s3xcM;
 spf=pass (domain: spinetix.com, ip: 40.107.22.48, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMp7VgUEqTqyR9XKOaQs+sZIWEPo6S2pTjcgugIXGjQrWDmnrlZ7a6m9MRsisVoJfCa0DkZNrbz3KVj4IfXEZeRR2JU5TcZfDsarnQjBeafPcD8cZZO0yjKknGBwbsXG4cyx6Rqu1C9qOfjIxeDevktWhQUAgLiQL3Fbnhznirzbdhx3IA07JI5qf+qW2ppRdKasYJBd2DuMUx3L1jh9AXjlZZ64JvnElLLx9T3bsP0q0mONjk5czpdTbdbtE41VE1qYzr6qhCiH3jOH8QQ+V/jbXGXFLw3R6bkHa9K8B1q2HzX4jVsEPqlMOuQ2BoRb/gSb9xr5wpMHxwb2LON9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG1fAF1e+hhbRJMzbJ14PffZ2Ehx/yG4EbMU7ZP8d0U=;
 b=JMkeGypGNJYsnSP+lsr0q0ASbzliNoioEdRWSCJ6GICbEsjLSmFCaYFaLcOp7PG9cbzK6Brbo48f5O82s/2+IyWMmb1pwe6uAkPGWltos4NhqEVgAg0vuTOxf7RGlp4N+mboJThvjAN2iH7WlsxgGjQ6tQoYQyeDCwjPNaiDla/ys87QT4nQGNlvbhFK1CeMLAJqRTLnxKduxqx4Vj3k9vVXq8kuXUOE/SCydec+NHj4r+7aQLEMgSBkzsaQu7raQ6M+vp/BgqwvW5wuPLIL62TFy9SyStx2zWnQvAhcg91NRk+0eq7oeB2Memx26KJSwddS0sjtm6nFb2YlZkatUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG1fAF1e+hhbRJMzbJ14PffZ2Ehx/yG4EbMU7ZP8d0U=;
 b=Z38s3xcM/DUKBzbc3WB06mcbr/EWzlytOGuFBCOw/54XR8MUhb3cTFGJsZ8szoMnqmI49o7R3b+We4/QJRPmN++QDw9uTA3fDdIX0bom4xPI4QKAvHRN0d9yk08R2cuE0HMLSaYPJwAb6ao+Yl+2nmehRIPatiEbXIjiwv3bIoA=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6743.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:18e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 08:06:45 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c%7]) with mapi id 15.20.3499.034; Wed, 11 Nov 2020
 08:06:44 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: FreeType CVE-2020-15999
Thread-Topic: FreeType CVE-2020-15999
Thread-Index: Ada3/yfZgI6So/CPS5+iqCvl+/ICCA==
Date: Wed, 11 Nov 2020 08:06:44 +0000
Message-ID: 
 <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
x-originating-ip: [178.198.197.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 650b6cb9-9873-49d1-1b61-08d88618bb19
x-ms-traffictypediagnostic: DBAPR01MB6743:
x-microsoft-antispam-prvs: 
 <DBAPR01MB6743EAF0747EE04281C7885688E80@DBAPR01MB6743.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eA3CF2lkl5En6Wq+ndtnL83lOgXHhA2S3320HP4Dmc3zjduF72b13Kl9yWRP6A8FKmG3PJPQT+4tIChg3Wcmw5qVVwYAAQZIbT8tt6FN5mqaS4GO1k7CDzTshqL84p8Phthmu+ZaEnaixVR/EJ0ZlgS2p3mcdjlJJf7PsEkewsZ/OMUHZvIc6N8oAtJF5XJvswZG0BnTl60VT9j3ryFrlQIQ5Bf6qEU+9RS4/Sa5+mxHKJEmU1FQdg9Ngk2cUNbBu5D3JK6FZHuEv5+ZVsACkyXuL45GcrOo9oLcuWyau6T67tw6YkMMNpe1k2JGANb5tP1ffs8VTAoH8Yu7b3MGmi1IeQFiGckQFCrjaGJpS7zo/LlAqh2rGKLHlrAsSsv7LoROFO5aBosrz9uaAlXg8A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(366004)(39830400003)(376002)(966005)(186003)(2906002)(8936002)(8676002)(86362001)(83380400001)(6506007)(7696005)(316002)(66476007)(76116006)(55016002)(66556008)(478600001)(26005)(66446008)(4744005)(64756008)(6916009)(9686003)(5660300002)(166002)(71200400001)(66946007)(52536014)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 QHN4qBHIHRlwChMN/Rt2O81FmuwQpUoP1nI47PDB5SSu7VNSvuq+xLl5KwlsyLsxfc75vuNwSxmc+W4Rn2PYBk1McxegF6UJSAZGnCn8o0r6faTStY+dM81cGnR+5lLp6fN0CfBrDPU/tkFO/xcqhwuHoLpLnPQUVOVtzmoguejCsJralZiA6um3Zyh28ANudhXEyi9EC5j4Lzq9CNvCbul2YfHo3llS8MbqNHPTFUVHXvmMj5iyFToKKYXSFfKc9c1/tnVcrV8o3eZLZo2Fs3ACXDDPP92VV6bRsqEHUXG3SyadtPBVUp+yid+kci3iDgNmrpjq92mexvsXH2u6R0mPpRKI49BlzH88FPRG5uQYljfrGkYoPqfGQP7GHvLUCs/XDrrBkzwAsaF277bWQV/dbXSo+/wDKG6WbKq1HIyZC2lr/czkb1uQyGD93E2xiXintOgrBpc1rA9CqlZXS2PfOr2t2AhrsRHsd09ZsyxRQYvW5wTQmKD//qYXNgtqx2Him3niYMSGh0P3GF6NpldECHyJsYmWIB5CSZ2f+8nYZzhjsTlzHUZiQCbBcVlmJbp3eExXxw4seLC+EkZnFoNTyVqiWimHlJu0LPH2apJOrSXAtBVUn6hLPtrfwTn8gBn9JYdYRD6CiykW/UM/sA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650b6cb9-9873-49d1-1b61-08d88618bb19
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 08:06:44.8047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4e+e38/Sb3VT9jjayVAsxKSwrAOiKz4b6gfsa+HvnZsvkDUo4T4O6uFrXzR7cSknBAOb1tff/K4kyIgurKvfYdeWqZvweZh8JcSBmTG+F7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6743
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0102MB2630314CC44CCB6400F59C4E88E80DB6PR0102MB2630_"

--_000_DB6PR0102MB2630314CC44CCB6400F59C4E88E80DB6PR0102MB2630_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

It was brought to my attention that FreeType < 2.10.4 is affected by a buff=
er overflow with PNG bitmaps as per https://sourceforge.net/projects/freety=
pe/files/freetype2/2.10.4/, https://cve.mitre.org/cgi-bin/cvename.cgi?name=
=3DCVE-2020-15999

This does not appear in the CVE metrics which have been posted recently, ap=
parently because it is tagged as google:chrome in the NVD database.

In master freetype is already at 2.10.4, but on gatesgarth it is 2.10.2 and=
 dunfell 2.10.1. What is the strategy regarding FreeType updates in OE-Core=
 releases? Should I send a patch to update freetype to 2.10.4 in both branc=
hes or backport the fix for the buffer overrun?

Also, how should one report problems in the NVD database?

Thanks,

Diego
--
Diego Santa Cruz, PhD
Technology Architect
spinetix.com


--_000_DB6PR0102MB2630314CC44CCB6400F59C4E88E80DB6PR0102MB2630_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It was brought to my attention that FreeType &lt; 2.=
10.4 is affected by a buffer overflow with PNG bitmaps as per
<a href=3D"https://sourceforge.net/projects/freetype/files/freetype2/2.10.4=
/">https://sourceforge.net/projects/freetype/files/freetype2/2.10.4/</a>,
<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2020-15999"=
>https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2020-15999</a><o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This does not appear in the CVE metrics which have b=
een posted recently, apparently because it is tagged as google:chrome in th=
e NVD database.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In master freetype is already at 2.10.4, but on gate=
sgarth it is 2.10.2 and dunfell 2.10.1. What is the strategy regarding Free=
Type updates in OE-Core releases? Should I send a patch to update freetype =
to 2.10.4 in both branches or backport
 the fix for the buffer overrun?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, how should one report problems in the NVD data=
base?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Diego<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif">--
<br>
<b>Diego Santa Cruz, PhD<br>
</b><span style=3D"color:gray">Technology Architect<br>
spinetix.com</span></span><span style=3D"font-size:12.0pt;font-family:&quot=
;Times New Roman&quot;,serif;color:gray"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB6PR0102MB2630314CC44CCB6400F59C4E88E80DB6PR0102MB2630_--
