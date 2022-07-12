Return-Path: <henze@greysolutions.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142C9C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:50:10 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com
 (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.46])
 by mx.groups.io with SMTP id smtpd.web12.10104.1657637408468904669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@greysolutions.de header.s=selector1 header.b=V/jp1QUV;
 spf=pass (domain: greysolutions.de, ip: 40.107.127.46,
 mailfrom: henze@greysolutions.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms4oo4lQfoyAKX+FTMd7EE94p7Qm2X0sU0gh7qrTnekr5BsyvybW407YaCzWO0QkI5fS5LcgCjDQyig/oWUawvx7po69IAsD8ylF7R9joJxeKGBRi+eitbE3mk65FsIS+ByxxncYX9kG/Qeldy5DNeOOvijKXRSEphe4CyS7oh0lExcLDSR3zhsNZ7joZzxDObqmJH82VDKdmvROeNJfg6EzTRI0hfa+Prb/PrLsKDUCjKguaEyAqDk+/Vqrii26g5i6YpQA25JBj+CnnSPjMyTHSYXdei4VTXN+GFWK7QtJy5SJcdaYZspQTEz8vyUd0J/3wY33Kacl9yNCUgnbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur9gIVEw70+xSMHiwn38uFRyuOK7K3iAHZnfebBHSas=;
 b=fxi2NODECB+GFe58N0IIj3zrcMttk24G0Iz6GnHRoIc7Wc97bamoOrjtvWOYLpwU0V6I95XEq5RuWIiiB4ZADA4Dk6KEPPy0kzaZ3O5aULPkhY/DNQtKXHlywVB0KZrUbzkWjM0ZnwcAHFFRz52Perdt994S2NUjoVc64dpJ/7EFUHM9zeZEFH6rmtOTtyV2mfHvZsxsCnNsD350flulHi29bRMNwFC8LNpVfmDJoejuaWj0h1ZJhfhkjRvCDnSq2gBliQMfh9rukwEbhVNbOUyujigiickOKGAqRAFM9KsOK5dnEpfFc8EnN9rjYAUNcNk0kXb0+aGVdfxsiL649A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=greysolutions.de; dmarc=pass action=none
 header.from=greysolutions.de; dkim=pass header.d=greysolutions.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greysolutions.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur9gIVEw70+xSMHiwn38uFRyuOK7K3iAHZnfebBHSas=;
 b=V/jp1QUVYR4zaZg+w3W1X440XPPnuep0dJsKbjL0gK940JwWvjiZGGqLIbU6PDPLJQVTUrPM5ZuEJaYt9C+wyM0MAVB2C2tLJrHZDk3lVjAUU/otBTvznTwsAOQ4tLCVFv1370DCEWZXJLMrrzZuZW1Tnqb1ap6t53ju/z5J3zSPifxdgyFGuCSa/SdK0PvTLUGUeUe1qlH2m366GQZGw7/n4s/v2dvCVPEEauyQ6t4NqlB+p4pvaFpkdQm7WIsqi9mUtqAB6t3RU3Her8JE+rXIrG+byHFR0TC+3wl3U8OkrY7P4eK4vasALr0+R8fCLzMXleMCy3ClWypm+4l3Jw==
Received: from FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:d::8) by
 FRYP281MB2474.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:77::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.10; Tue, 12 Jul 2022 14:50:03 +0000
Received: from FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4c5a:96c6:b3be:f183]) by FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4c5a:96c6:b3be:f183%3]) with mapi id 15.20.5438.011; Tue, 12 Jul 2022
 14:50:03 +0000
From: Beatrice Henze <henze@greysolutions.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Project Opportunity Embedded Linux Yocto
Thread-Topic: Project Opportunity Embedded Linux Yocto
Thread-Index: AdiV/opsuhgo+CeVRhO4Ib8lLZClbQ==
Date: Tue, 12 Jul 2022 14:50:03 +0000
Message-ID: 
 <FR2P281MB001261FEC36EB2347004BC6DCA869@FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=greysolutions.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17add4f1-226e-4bd0-774a-08da6415cde7
x-ms-traffictypediagnostic: FRYP281MB2474:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 82YHbg9x229vVVC/nM1JWxR9BZ8wKwOA22xK/9CABteeYO6cGQUhd5ygNSbYGASfz/eKEXCB8NSw7gW2YblvvyDfEqBpu4G+imrgGGKWKm0iql3pGoFr6ticcCc5noLbNI5mSOg/1AMLbebZCWkxYpLLFJgoW+BkVJuTF7rFOIT6AxI41MEdS3tO5RHek0jsGbmvgW/Tf7OK95ujHnX8xQD6bYk/HctuG8l+Tibfyk373xOn+rcRyLeHONLbsMQlliiJ5vlc3nstTorSWOYMk9J8Gbxpftnw36jsYZ3f6naEn5NrJ/90GBC35y04rTyCsaZG/JcpPSXZ52ffc6oY6oqvxHECi22MIsAQllzRCh4FDIe6dijvD1WUnlOjqqydaclVYYjIeJSg0cpNHZE3x7ITsuLFokhG1gj8ldAIJMWCcEs4Xu/ejzNiopI0ipjvnCeKkso1lSOgGIxuKc505yqv0mpJY9EQQWEnpW/sUMS0OzyY9UjaDprQd9IW64cStxuIbmSrOY2oHp3kIT1AGcvWRpOun9w13Yvb1ArINzRRrjyb4GH4k+qjeQXiEKoBnYKFu1T3PscmJ8oEG2R7AxUUjirAQj+5hz7+lItDawkxklsYl7CBoGG8/apvB55nQ7V9gISzRvTrYWlEZFdpWibOctak+PhSddKK/ejyTSbjDPpLa1ZVTsJNg3bVeqUk4DOs3F7kq6KkKVQurUhN/2jnxFMD0e9EozyCK+gHzMi9/Hapflx3Fmclj4UrqJI4YtnnpvOX3wXuBgyhQcl0rDlFVz0grvJ8jS5KAd/kkTbrIKOv9TbwJL441Bv/OqQKSfqYuHdLd34W2Y1+eRS7WM2atiwgM2KdXMmB4gZ8ct6mazm+B9BjTn6mjMuAuPcN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39840400004)(396003)(136003)(376002)(33656002)(55236004)(122000001)(41300700001)(2906002)(478600001)(83380400001)(99936003)(8936002)(5660300002)(316002)(55016003)(38100700002)(66446008)(9686003)(76116006)(66476007)(64756008)(66556008)(8676002)(38070700005)(6506007)(166002)(52536014)(71200400001)(26005)(6916009)(86362001)(186003)(66574015)(19627235002)(7696005)(66946007)(554374003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UVo7WBzqZMq9rDxmPa2KMk+fvB4/2UNG4QMWxSdPOjKI752qEjyEUZmqgj?=
 =?iso-8859-1?Q?LtpRRWE7iOLJlj2Bj9JrrxsfxgPBa3wOsErpDcp4C+OhwXwV3E8YFl2hIb?=
 =?iso-8859-1?Q?5mX0mGA2SYSF9jqKU0eJ6CvJ680Do7WELcH/MmNf+ovUNpTPHJIeVfax5N?=
 =?iso-8859-1?Q?UQS8HPrDydJVAlfZJOXFgApBjm/vXQHS6yOdDUuv33V+s5vtMBBZxuYUmb?=
 =?iso-8859-1?Q?6Knf3G5t3/NCeIBGD2t5UsHW2sWPZqFuGf0Qymj0Q4dEm9d7AShH63LBfL?=
 =?iso-8859-1?Q?FkLbnT7caGK6+FdVVdCYub8lC9SgOZLek7bMLKuZaa6XtHHfRwwn28iZtD?=
 =?iso-8859-1?Q?45Nr9yqSXfVnf7IQEEvIqzqrCfO/QHbGgDKcAcyNmC/djh4RT6NOxA8q0p?=
 =?iso-8859-1?Q?xlErChw55HlqcwbaBZCKE/ZiU3A2e8pdGU2Hj9U9GOtiDxCDrlcDYkjxy2?=
 =?iso-8859-1?Q?hm54/3PiK3ijqD1kKgLMNMHc2EgbNBNHBsIrGXsMsqSPCEMgx1BCwLuyjB?=
 =?iso-8859-1?Q?sZKsegSVqX190MUole5bs43txF+5MFJw9UMtxTG8SletoOWlDjtgMjMqjO?=
 =?iso-8859-1?Q?3fBhhGbDqNlQ/y+/LF4DiE5d4DblAr5qGMtluGL1wewzS1Pj9GJFGH0fcN?=
 =?iso-8859-1?Q?XTVmn3KzCHmX35oyE/aHEM210oK++kBho8L3nJ2W0gpXlNUaLe7zdQiz9k?=
 =?iso-8859-1?Q?jzaXj1W7PNX3U1YVPBgHQTzuDmUup4hOvzcmMs1IZeMQFLVH91+o+LPMXv?=
 =?iso-8859-1?Q?YvN/b5nMYkMR2vUmaY1MOYxYm9qWIkOaRCs5q3K3ioGn1Jkkxkt7zEhZc4?=
 =?iso-8859-1?Q?kIBW2DSJsHxfjc6n1/Pb6JY54g9ctGlEqGxtuTyc0aor5/UoEE4iD/cu6O?=
 =?iso-8859-1?Q?YWYcrVHNILGdSxPjX37UjvVIKaM5Tqn+U9RKvroRnm23SUObBNQ5yhj8oO?=
 =?iso-8859-1?Q?HKSmglQo6+1gZWwqa2VWJ1TW47j9zlZwuXOYgpwjey1PJRaFZCXsYqpMOX?=
 =?iso-8859-1?Q?gnnaRMrp+tDHXOIOTB8yi2Z4B4CTRLoiF2bYUYRsbS0adczY1HEH+W1mtp?=
 =?iso-8859-1?Q?U1Sp5zcMKPz1vSuK7hbbUzb2Gst4Ieww9T+rV7BE5veUZH8K3bWtdBIuAf?=
 =?iso-8859-1?Q?4DDe8Lbms9LdwEJ0thK2J1Bdr+v9wZfAz2Fg0JMq6ArP9XsRwOoUegKpFl?=
 =?iso-8859-1?Q?/ShFd5Iy7i4FXf07QMLDXlTSddB2u787DUluhDQwd6gndC//vXE4/SH/wc?=
 =?iso-8859-1?Q?GddLUuAm0iqHTYeauEh5RUjM+vJlxygTRTur/BzBGaHw0H8JqiVVOlcKGl?=
 =?iso-8859-1?Q?Pvx6lwy8jjXhOYuoqFeEYszFYaFNDdNre4VUf2e120IvA/HM5HJj0J7k8l?=
 =?iso-8859-1?Q?O5QYUYMBA255CRnp+Q9c+NkcUic05yBfh+qDTCP20aj+hWuCfaYsk9UC42?=
 =?iso-8859-1?Q?QtRx3zxYD2Eq1b+JqFu3E03rB7pIaHIcSTBDxDpxHhk6w0k5b2Q80+SMSx?=
 =?iso-8859-1?Q?SJc246gSRhAI250R4xssFt0rWDxFE/OCkTU629atPJvR6o0nRGWnF+4P1Z?=
 =?iso-8859-1?Q?ILiBsXHRIqZymXuHV5dRzGPBC9f3wMXTlEKyQQ5Hs0ajERymMK/1wC/4cq?=
 =?iso-8859-1?Q?GiAWr9x7sAFpbhf4llvXtyGiykV/F/FftG?=
Content-Type: multipart/related;
	boundary="_006_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: greysolutions.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17add4f1-226e-4bd0-774a-08da6415cde7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 14:50:03.7455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a9527f8-1bf5-43d4-8358-68fa40133ea8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Ny2tWQrlok1xoQw8GdizBq40owN3XNWM5PSYts1ScUEwMNCKVBxS16CEfJCYbwCz0vFQmr2BhJq2t8EXILXD7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB2474
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 14:50:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167933

--_006_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_
Content-Type: multipart/alternative;
	boundary="_000_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_"

--_000_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am not sure who to contact, but I have a project and would like to ask if=
 somebody can support our client?

Currently I am looking for 2 freelance positions in the embedded developmen=
t for a client:

1. For our client we are looking for a freelance Embedded Linux Engineer (m=
/f/d) with the following frame parameters:

Requirements:
- Very good knowledge in embedded programming in C++/C and experience in us=
ing scripting languages like Python
- Confident in the use of Yocto Linux
- Very good knowledge of embedded Linux (boot process, configuration of the=
 system, development/adaptation of kernel modules)
- Special knowledge in areas of secure boot, encryption and software update=
 mechanisms are an advantage

Tasks:
Collaboration on the integration of created elements into the overall syste=
m incl. creation/adaptation of CI tests.

2. For our client we are looking for freelance Embedded Software Build Engi=
neer (m/f/d) with the following framework parameters:

- Must Haves:
-Experienced in using Yocto Linux - someone is wanted to work on our Yocto =
based build system.
-Continuing development and maintenance of the build system
-In addition, the necessary experience in Continuous Integration with Gitla=
b/Jenkins should be applied

- Tasks
We are looking for support to work in an agile development team to implemen=
t work in SW Building and Continuous Intergation.

For both positions the following paramaters apply:
Start: asap
Duration: 3 months with option for extension
Workload: Full time
Location: Full Remote
Project language: Englisch or German

I look forward to your feedback with the following information to henze@gre=
ysolutions.de<mailto:henze@greysolutions.de>
- Your current project availability (earliest start)
- Your maximum workload/week in total
- Your hourly rate
- Your current profile

Beste Gr=FC=DFe
Beatrice Henze

[cid:image001.png@01D8960F.6E011470]

Beatrice Henze
Recruiting Expert


henze@greysolutions.de<mailto:henze@greysolutions.de>
greysolutions.de<http://www.greysolutions.de/>
Friedrich-Springorum-Str. 29, 40237 D=FCsseldorf
[Kian Ansari Linkedin]<https://www.linkedin.com/in/beatrice-henze/>
 [cid:image003.png@01D8960F.6E011470] <https://www.xing.com/profile/Jacquel=
ine_Kless/cv>



--_000_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am not sure who to contact, b=
ut I have a project and would like to ask if somebody can support our clien=
t?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Currently I am looking for 2 fr=
eelance positions in the embedded development for a client:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1. For our client we are lookin=
g for a <b>
freelance Embedded Linux Engineer (m/f/d) </b>with the following frame para=
meters:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Requirements:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Very good knowledge in embedd=
ed programming in C++/C and experience in using scripting languages like Py=
thon<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Confident in the use of Yocto=
 Linux<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Very good knowledge of embedd=
ed Linux (boot process, configuration of the system, development/adaptation=
 of kernel modules)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Special knowledge in areas of=
 secure boot, encryption and software update mechanisms are an advantage<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tasks: <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Collaboration on the integratio=
n of created elements into the overall system incl. creation/adaptation of =
CI tests.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2. For our client we are lookin=
g for <b>freelance Embedded Software Build Engineer (m/f/d)</b> with the fo=
llowing framework parameters:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Must Haves:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-Experienced in using Yocto Lin=
ux - someone is wanted to work on our Yocto based build system.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-Continuing development and mai=
ntenance of the build system<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-In addition, the necessary exp=
erience in Continuous Integration with Gitlab/Jenkins should be applied<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Tasks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are looking for support to w=
ork in an agile development team to implement work in SW Building and Conti=
nuous Intergation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For both positions the followin=
g paramaters apply:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Start: asap<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Duration: 3 months with option =
for extension<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Workload: Full time<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Location: Full Remote<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Project language: Englisch or G=
erman<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I look forward to your feedback=
 with the following information to
</span><a href=3D"mailto:henze@greysolutions.de"><span lang=3D"EN-US">henze=
@greysolutions.de</span></a><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Your current project availabi=
lity (earliest start)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Your maximum workload/week in=
 total<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Your hourly rate<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">- Your current profile<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:DE">Beste Gr=FC=
=DFe<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:DE">Beatrice Hen=
ze<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:DE"><o:p>&nbsp;<=
/o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr style=3D"height:.75pt">
<td width=3D"160" valign=3D"top" style=3D"width:120.0pt;padding:0cm 10.5pt =
0cm 0cm;height:.75pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"65" style=3D"width:48.75pt;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"line-height:105%"><i><span style=3D"font-si=
ze:12.0pt;line-height:105%;mso-fareast-language:DE"><img border=3D"0" width=
=3D"179" height=3D"179" style=3D"width:1.8645in;height:1.8645in" id=3D"Graf=
ik_x0020_7" src=3D"cid:image001.png@01D8960F.6E011470"></span></i><span sty=
le=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Times New Roman&q=
uot;,serif"><o:p></o:p></span></p>
</td>
<td width=3D"1" style=3D"width:1.05pt;border:none;border-right:solid #BDBDB=
D 1.5pt;padding:0cm 0cm 0cm 0cm;height:.75pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
1.0pt;line-height:105%;font-family:&quot;Arial&quot;,sans-serif;color:black=
;mso-fareast-language:DE">&nbsp;<o:p></o:p></span></p>
</td>
<td valign=3D"top" style=3D"padding:0cm 0cm 0cm 10.5pt;height:.75pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"269" style=3D"width:201.55pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:25.3pt">
<td style=3D"padding:0cm 0cm 9.0pt 0cm;height:25.3pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><b><span style=3D"font-si=
ze:12.0pt;line-height:105%;font-family:&quot;Arial&quot;,sans-serif;color:#=
646464;mso-fareast-language:DE">Beatrice Henze
</span></b><span style=3D"font-size:12.0pt;line-height:105%;mso-fareast-lan=
guage:DE"><br>
</span><b><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:#64=
6464;mso-fareast-language:DE">Recruiting Expert<o:p></o:p></span></b></p>
</td>
</tr>
<tr style=3D"height:47.5pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:47.5pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"269" style=3D"width:201.55pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:26.05pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:26.05pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"269" style=3D"width:201.55pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:26.05pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:26.05pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"165" style=3D"width:124.05pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:21.25pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:21.25pt"></td>
</tr>
</tbody>
</table>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm;height:26.05pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"93" style=3D"width:69.5pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:10.95pt">
<td style=3D"padding:0cm 4.5pt 0cm 4.5pt;height:10.95pt">
<p class=3D"MsoNormal" style=3D"line-height:10.5pt"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p>&nbsp;</o:p></span><=
/p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm;height:10.95pt">
<p class=3D"MsoNormal" style=3D"line-height:10.5pt"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-language:DE"><=
o:p>&nbsp;</o:p></span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:10.7pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:10.7pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"132" style=3D"width:99.3pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:10.7pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:10.7pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"167" style=3D"width:125.4pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:11.45pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:11.45pt">
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:10.5pt"><span style=3D"=
mso-fareast-language:DE"><a href=3D"mailto:henze@greysolutions.de"><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0563=
C1">henze@greysolutions.de</span></a></span><span style=3D"font-size:9.0pt;=
font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:10.5pt"><span style=3D"=
mso-fareast-language:DE"><a href=3D"http://www.greysolutions.de/"><span sty=
le=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0563C=
1">greysolutions.de</span></a></span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Arial&quot;,sans-serif;mso-fareast-language:DE"><o:p></o:p></spa=
n></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:10.7pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:10.7pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"209" style=3D"width:156.55pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:10.7pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:10.7pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"209" style=3D"width:156.55pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:10.7pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:10.7pt">
<p class=3D"MsoNormal" style=3D"line-height:10.5pt"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-language:DE">F=
riedrich-Springorum-Str. 29, 40237 D=FCsseldorf
</span><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-se=
rif"><o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:12.25pt">
<td style=3D"padding:9.0pt 0cm 0cm 0cm;height:12.25pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;border-collapse:collapse">
<tbody>
<tr style=3D"height:12.25pt">
<td style=3D"padding:0cm 0cm 0cm 0cm;height:12.25pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"32" style=3D"width:23.65pt">
<tbody>
<tr style=3D"height:12.25pt">
<td style=3D"padding:0cm 4.5pt 0cm 0cm;height:12.25pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;line-hei=
ght:105%"><a href=3D"https://www.linkedin.com/in/beatrice-henze/" target=3D=
"_blank"><span style=3D"font-size:8.5pt;line-height:105%;color:#444444;mso-=
fareast-language:DE;text-decoration:none"><img border=3D"0" width=3D"16" he=
ight=3D"16" style=3D"width:.1666in;height:.1666in" id=3D"Grafik_x0020_6" sr=
c=3D"cid:image002.png@01D8960F.6E011470" alt=3D"Kian Ansari Linkedin"></spa=
n></a><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
10.0pt;line-height:105%;font-family:&quot;Times New Roman&quot;,serif;mso-f=
areast-language:DE">&nbsp;</span><a href=3D"https://www.xing.com/profile/Ja=
cqueline_Kless/cv"><span style=3D"color:windowtext;mso-fareast-language:DE;=
text-decoration:none"><img border=3D"0" width=3D"18" height=3D"21" style=3D=
"width:.1875in;height:.2187in" id=3D"Grafik_x0020_5" src=3D"cid:image003.pn=
g@01D8960F.6E011470"></span></a><span style=3D"font-size:10.0pt;line-height=
:105%;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:DE"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_--

--_006_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=8687;
	creation-date="Tue, 12 Jul 2022 14:50:03 GMT";
	modification-date="Tue, 12 Jul 2022 14:50:03 GMT"
Content-ID: <image001.png@01D8960F.6E011470>
Content-Transfer-Encoding: base64

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
HPh/tTb5y+kkqx0AAAAASUVORK5CYII=

--_006_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=606;
	creation-date="Tue, 12 Jul 2022 14:50:03 GMT";
	modification-date="Tue, 12 Jul 2022 14:50:03 GMT"
Content-ID: <image002.png@01D8960F.6E011470>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAACJUlEQVR4nO2WP2gTURzHP+/dJWmK
tJpQlcYKNdJSXLQKTlbj4B/QwVGxi4uzOujgKHSqSzdBdHMU0eAqthQLEYdio4sNpoJGJZE2pl4u
93O4S0oVelcSDUoeHLz37t3vfd73vvf7neJ6Wmhj0+3cvAPQAegABAaIdYfoiZjtAbhxLMnC1THm
rxzh9HAfAIZWfw9g4tQwO7ZE2L01yq0TQwBIC3OnL8Czd18b/advPwNgaDC1wtSqoYbhjetzKqBI
KkgtGBuMUbZqvPzwDaWCKxBkra+zTg71MdDbhaEV0ZBmJlcklYxzMNGLI0KxUuVeZolUMs7RwRiG
VszlSzzJFgKB+gJcPjzAuX07AZiazTGTK3LxQIJLh3YB8KVskdoTZ3w0se65x9kC5x+8omzVNozv
64HlHzVsR7AdaQQrWza2I6zaDtuiIcZHE3yvuvdEoFoTzo5s5+bxvX7h/QG0WjOc9pylVX3smm9q
NsfI5HPO3M9QWq1iaHBEuLC/v3mAjVpIaworFtfSWd6XKqTfFHj4+hNaKUSgv6fLN0ZT6U0p93W4
ioAApUoVcPtmgITVdH6tn9YRV/bNZsmWFyPZZJr0VUC8kwEI8tuc88uG4s25VwsAIqZuuD9suIKF
zbUvojtsrF9vuOvDRrBX4Qtwe3qRRwuus+c/LgNwZy7P9GKRmiOseDmhrs7dzBIv8iUs20EFKAiB
asGfbP/GH1EHoAPwXwP8BLUcyHn6kLaxAAAAAElFTkSuQmCC

--_006_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=462;
	creation-date="Tue, 12 Jul 2022 14:50:03 GMT";
	modification-date="Tue, 12 Jul 2022 14:50:03 GMT"
Content-ID: <image003.png@01D8960F.6E011470>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAACsAAAAzCAMAAAA5BgEEAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAkUExURQAAAMbGAABVVdLWANXVANTUANTXAABYXgBZXtPVAABaX9TWABxit7MAAAAK
dFJOUwAJDFBVaqrH4vKtdd+ZAAAACXBIWXMAACHVAAAh1QEEnLSdAAABHUlEQVRIS4XQSVIEMRRD
wWKe7n9fJDuBNoFN7r78ohZ1/evjm2HvThiWPV0Y9nRl2dOFYU9Xlj1dGPZ0ZdnThWFPF4brev9y
b+BZGJab9t2ALgwhLMugK0sJwzDowjApwxC6skzCsmw/+9eHdfFg+SIsizAMP4Qxb13M+5aweupq
PK+E0UsX43Glq1y6ms8LXfTSxXhc6aKXrsbrShi9dDEeV7ropYvxuNJVT2GM15UueuliPK50lUtX
83mhi166GI8rXbzm0tV8XghjnMIY50IX835Txhx+vAjDIgzDN10YDrHwJj3/id+UYTgQluVAGIYD
YVkOhGE4EJblQBiGA2FZDoRhOHhShuVAGIYTZRgOhPFoOVCG4UAYva7rE2dfIQxVnEogAAAAAElF
TkSuQmCC

--_006_FR2P281MB001261FEC36EB2347004BC6DCA869FR2P281MB0012DEUP_--

