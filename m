Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725C8C79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 04:21:03 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10179.1788881152877166570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=XccTFpHf;
 spf=pass (domain: axis.com, ip: 40.107.130.64, mailfrom: gustav.lindberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBfFhRYn6kOeS34vbG17cnmH/GwOniMjCM3PnVVxJFv6S7gCkU5UMqrPXbNEZICh1E4t85LrrqHKZrZcZ2F9wrYBec2c0itWC8rXiXpM2wzk8tF5vNFV+i0pAoNTyYUvJ8Cp6bRqfGIDAJyrlOzLfR2sFudpsfT3vDQBzptRGqDRW1wLEfYEB+Uu4Yewkarcmh36PWMhf53esT5WHLvXmdGZ0JlaaVM03jibWB5nMJCZRdkr6ojZJIQeK76tqwf0X6OEIgnHhPtho76HJ0DlZXCm+8FFj3PPmEB8Txx7YzLWVxv37/oGFyyPOzd/YPRVYZZf1eas2Df0elB9P+/PIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCdp7+Fgz3oUfBtjkjAdh+jsKh5Cd4ZdQpTzDeO2sNw=;
 b=W+asCT1Bso/egeDqmSWBtCJlZ3ori0ouHeTJr4yeYAv8flKH6cD1PCiIQxq6P+1zYTjaNl5thgRMEj1siMUE+19FVYUoV+qruG43TtjVqUla84s/mk2iouEhVtcQLKos5wpLyxQAfQbPw8sCZDN4t3aGABpxYyaV6bMCp8w4rbZEwc2KQww2hh0h75zcnPzTMHERkM+8OHME8VvTdO6if0i3j9M+phb5K5R/HSGoW24gsrTEoGJ3hJzrOFApJd/CQKL79/qeg/rzrKs0VRY90G2yHMUd0uszaShUx0eDkMIYfhZlUAmR/NkQXUYmbvZeJzUwHSyJncyoGlGOwhF3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCdp7+Fgz3oUfBtjkjAdh+jsKh5Cd4ZdQpTzDeO2sNw=;
 b=XccTFpHf4ckl9hu1qfY6QV7s44y/HyxW2CPkd+a7mMN4pHirXfieuOhm6F5Hj3vXm0BPzbM5Dc/cEKODSJgqp2A3vmlS2GeoFy2mB6N1Lua7lkyWrTsGx0tEhaE/Z+Ifez85gHvpPwyjt3eU8b6EeozI5AgleUA6n63CIeKB6fw=
Received: from DBBPR02MB10462.eurprd02.prod.outlook.com (2603:10a6:10:52e::9)
 by AS1PR02MB8164.eurprd02.prod.outlook.com (2603:10a6:20b:477::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 15:10:51 +0000
Received: from DBBPR02MB10462.eurprd02.prod.outlook.com
 ([fe80::5e78:c08c:a67:2b03]) by DBBPR02MB10462.eurprd02.prod.outlook.com
 ([fe80::5e78:c08c:a67:2b03%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 15:10:50 +0000
From: Gustav Lindberg <Gustav.Lindberg@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv8] boost: Add support for building boost-asio as a shared library
Thread-Topic: [OE-core] [PATCHv8] boost: Add support for building boost-asio
 as a shared library
Thread-Index: AQHdPFR5Tl9AC3JhEU6Bw4dpHzxGCLa+YDEAgAZvEJ0=
Date: Tue, 8 Sep 2026 15:10:50 +0000
Message-ID: 
 <DBBPR02MB10462773CD2F96E736CB3618787B12@DBBPR02MB10462.eurprd02.prod.outlook.com>
References: <20260904100208.3052527-1-gustali@axis.com>
 <CANNYZj8+JD0nUxr9QuN6S2gkCzE4Fs=AXV5qzd+hDXNCqOv5LA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8+JD0nUxr9QuN6S2gkCzE4Fs=AXV5qzd+hDXNCqOv5LA@mail.gmail.com>
Accept-Language: sv-SE, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR02MB10462:EE_|AS1PR02MB8164:EE_
x-ms-office365-filtering-correlation-id: a5ea3cde-99cb-426d-d425-08df0dbb5ead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|13003099007|38070700021|10067099003|4143699003|11063799006|8096899003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 
 NQ8Esl4VmdzAiLio8SINbGP1c6C410y1jQkXc+4bnO50yZamvvj+0w6Fu9D1QNHax6itwF9tomwLPhFfs9XVnx56egFY2LzA3z9GpJ6zD1gHcHvWkSIRsbfzTBNpaTL6Z7ALUwR/9KcNKoGwUrBKbIErms3nJcbN1k4z6Cov1+9piMwFpTJVPrVCCWMSjqomBrfAcW03RhTrXVqsdC2KUDSEtw6VtCAdxqK8y1k+X98SfR8270UczwpoURCyWS5RrFEY00p1o8fZksjC4XP2W5PuTfkJG83NPyhfXm0td0M2740KTmhriYjm2+Ko+BcRLyDcCxmU+op7/vjNfjzbO1Zz7Mb0irtCADm2cYOSp/B/UbanwllgVGeTur2cIcD/FbqEf/mwze2zpGlQeh2ThG6J2FyNWoj0/udyw3v9ggDQG7gQSCYHkEyJxpqGP/82DJvAwkgX+GxvagWHWCbiOtHQmrc8uZryjsYtd4c/C6F0l+QuUwntbJv69V7ByVMdszWJF3HgdXe0fWrAyxbJg5nbpgCTV9hlalasvn1ZTjxyev7+ZqnNJlvg9rtiFNs4SAx3S0pvBgdtIYsEHk8/VLxV0HBij8a9fl8Hlusy9rvOuAVqY5TGcQMrYFhzRj1KOf0xCdK+eNFpMiRVV6e8toL2wfm2Gw8OfppQECbTvGIaSb9DO7Rbbh3gucuBi963MjrGo4CgFqJXf1ssX3KK5j8sXOeO+DwPSXykVpT4dVY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR02MB10462.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(13003099007)(38070700021)(10067099003)(4143699003)(11063799006)(8096899003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GiA9/xYZvjaXM5je+FOlpbSe7OWJrsrKXW6/PXycxJSMeHy4hdnr8AtfiD?=
 =?iso-8859-1?Q?cwJfuxL5i6TM3/8ms5A2xoNAbz3SQzaXO0XFDk9AIafaH6Ej97WRdrRcc2?=
 =?iso-8859-1?Q?FkwMrkOXTFwmkSvgfbahlizjcJTbXZf+4G8jXb7B81F+oRXYJq8LYyge6K?=
 =?iso-8859-1?Q?9nAgIzcXcfAB2vsGut7jo1N7Z9Iy8PK3kYm1PfpFg/IGmKl3nBXB+RxrBq?=
 =?iso-8859-1?Q?LqPvGXuzk3sXIT4FWB9NeX4jP07o8cDfmZeoFCALp9I0NVChjf6AEYQWln?=
 =?iso-8859-1?Q?DmQLG1ylWm9erebKUOgCMrf67W75IGTWy51l9vY7s6q7iKaDLplDmrl8Vq?=
 =?iso-8859-1?Q?fIrouwO7SDURtT5A33tbmHoNdvUBy1i28+U1q42htGlm/nXkRNGqm6NTjE?=
 =?iso-8859-1?Q?i1RwN8ZUYSOeQVokOnxoavsakjTZCFrsLGEyxmv3C5/tYHHN7/jrHypw7R?=
 =?iso-8859-1?Q?DQmXqyBvbDX4LArPNn77dXxL9JuuZV12P1BzSOd/QjGS0eF5UHUOsus3l1?=
 =?iso-8859-1?Q?xP9/N1XHLEHusb9Glv9pRutyWye9gMYFQ8SB0eE+T16hJLKcOfUCSDNB+d?=
 =?iso-8859-1?Q?ylrjeoy8Xe3VEvQREBCcpP/lSpNLMOIEs9wSXMqrfPwmjLTFhm9KEkOtBu?=
 =?iso-8859-1?Q?WWTnWfE0HQP81FXf2AK3cNNvREeQMIYJHFz/pNIQbafrm7n7kOc3oVEtJP?=
 =?iso-8859-1?Q?9e9Lj1m7eBVMwLo2ti6YF3YT58KyP631xIc7e0xhi8g4JMMNxgPUZp/isU?=
 =?iso-8859-1?Q?sC6kLrRx8m3UaTcXD1jygF1wQdyRgkOE1/EaNPDMAivod8DqWOflo5B+Vl?=
 =?iso-8859-1?Q?Ks/2gtzDa29GOmJwPXPj6ECue92TonwaywqHQNyPP5kqSkXXGagDprd2ZS?=
 =?iso-8859-1?Q?bFj2U3Mwfvcmrdu7VuOHDO26PHtPsofAJ5wd1+g2YWMJa+MtRXwe679gH2?=
 =?iso-8859-1?Q?IyFAvVCqxlXX0Lnw6zLZ7/RhI1LiIGRFGOtrCvM1xWq/+hdU6KtrTssm8f?=
 =?iso-8859-1?Q?ZwnSvjiZB1zL/1UEU7FG8ul8yktDR9h3WqdCyRoyOsnjlnMoJwo/fOn77t?=
 =?iso-8859-1?Q?QGfeRninoIYCnvxplXDbxfLLWP0uWRpvhIfef5QnpoSQI3t6P426MAmKMT?=
 =?iso-8859-1?Q?khp8gurXooGGDZ6vsu9ji/fSXHNenBhI2U314In5r4VAg8qd/BY9MiNm3p?=
 =?iso-8859-1?Q?1xYqWGtnDJtnHTaXqq/SeNpz06f5TwU4qftkBzScSB7BiGgsdPpsA301go?=
 =?iso-8859-1?Q?tfhNrT0ABJy7Yepl2H0TODEK+/MAQiInCcOiLpV9WkRLt20G//ZCOsIdq4?=
 =?iso-8859-1?Q?MDWO4zgkUiHy6Fmhd456cfBCur19LbLqNBBcFz9h7hRNftWoSYunAbJX5/?=
 =?iso-8859-1?Q?wOWl6hssga7BpWOPkG/7c0NZ4+faM2Zc+mdutTsroBvZKjfoohQ/Vqzs02?=
 =?iso-8859-1?Q?McDEQ3e7SMWHfLaeyBr7hPIjSM6g7lE/1uHEWngRcjr8yEY24RCic0BFDW?=
 =?iso-8859-1?Q?hAu/AZeAq6JQLxBUCVZbQxnr1Am/h+N0C6c/3Wl9Wl8hphEQDLI2Yeunvf?=
 =?iso-8859-1?Q?6PKYu3K/aUSmBFLQiOBSkM2jBIhV13a8eV/ONX7R6QpIG1sLKB5STMPHId?=
 =?iso-8859-1?Q?NX94QyWp/9aUWkKagMtkedqowAaBgbCNQmpka1H/o5eR0TOkFgSjoel6D8?=
 =?iso-8859-1?Q?HM+InY66i2UPuJUitYcCH3UDOnjnoI+OxJm9QgvGcmEXuoHSv42Ua+k0iO?=
 =?iso-8859-1?Q?fVTAazfrZl4xL/m4RE3eAPYngNG1jeApe6KI0ArXJdpya7?=
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR02MB10462.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ea3cde-99cb-426d-d425-08df0dbb5ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 15:10:50.8173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmwNIYss8Bm0qTWnbiHWxnj9iuuCoNWWdrDr85DWjKztFybUTwjB/ClNHCIXcIuMuiHr11HiStr0jLT+R5ryWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8164
Content-Language: sv-SE
Content-Type: multipart/alternative;
	boundary="_000_DBBPR02MB10462773CD2F96E736CB3618787B12DBBPR02MB10462eu_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 04:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245392

--_000_DBBPR02MB10462773CD2F96E736CB3618787B12DBBPR02MB10462eu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I discussed this with my team and we don't think it's worth spending any mo=
re time on trying to patch boost. So we will create a recipe in our own cod=
e for building the shared library instead of publishing it here.

Best regards,
Gustav Lindberg
________________________________
Fr=E5n: Alexander Kanavin <alex.kanavin@gmail.com>
Skickat: den 4 september 2026 14:53
Till: Gustav Lindberg <Gustav.Lindberg@axis.com>
Kopia: openembedded-core@lists.openembedded.org <openembedded-core@lists.op=
enembedded.org>
=C4mne: Re: [OE-core] [PATCHv8] boost: Add support for building boost-asio =
as a shared library

[You don't often get email from alex.kanavin@gmail.com. Learn why this is i=
mportant at https://aka.ms/LearnAboutSenderIdentification ]

On Fri, 4 Sept 2026 at 12:02, Gustav Lindberg via
lists.openembedded.org <gustali=3Daxis.com@lists.openembedded.org>
wrote:

> > No custom compiler executions please. Building a shared library should
> > be done by the boost build system itself, and enabled via a flag to it
> > during do_configure (e.g. via PACKAGECONFIG_CONFARGS or BJAM_EXTRA).
> > You probably need to patch boost to do this, and send the needed patch
> > upstream.
>
> I spent a day trying to get that to work, but it doesn't seem to be possi=
ble. Everything I tried either breaks
> the header-only version or doesn't build the shared library.

The next step is to ask boost upstream to help, maybe by filing a
ticket, and/or continue maintaining a .bbappend with these changes.

I know boost is horrible, and has a convoluted non-standard
boost-specific build system, but we should not be bypassing that
entirely, especially when no one else is asking for asio-shared for
now.

Adding asio to BOOST_LIBS is fine, and can go in as a separate patch.
Can you send that please?

Alex

--_000_DBBPR02MB10462773CD2F96E736CB3618787B12DBBPR02MB10462eu_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I discussed this with my team and we don't think it's worth spending any mo=
re time on trying to patch boost. So we will create a recipe in our own cod=
e for building the shared library instead of publishing it here.</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Gustav Lindberg</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Fr=E5n:</b> Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>Skickat:</b> den 4 september 2026 14:53<br>
<b>Till:</b> Gustav Lindberg &lt;Gustav.Lindberg@axis.com&gt;<br>
<b>Kopia:</b> openembedded-core@lists.openembedded.org &lt;openembedded-cor=
e@lists.openembedded.org&gt;<br>
<b>=C4mne:</b> Re: [OE-core] [PATCHv8] boost: Add support for building boos=
t-asio as a shared library</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from alex.kanavin@gmail=
.com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
On Fri, 4 Sept 2026 at 12:02, Gustav Lindberg via<br>
lists.openembedded.org &lt;gustali=3Daxis.com@lists.openembedded.org&gt;<br=
>
wrote:<br>
<br>
&gt; &gt; No custom compiler executions please. Building a shared library s=
hould<br>
&gt; &gt; be done by the boost build system itself, and enabled via a flag =
to it<br>
&gt; &gt; during do_configure (e.g. via PACKAGECONFIG_CONFARGS or BJAM_EXTR=
A).<br>
&gt; &gt; You probably need to patch boost to do this, and send the needed =
patch<br>
&gt; &gt; upstream.<br>
&gt;<br>
&gt; I spent a day trying to get that to work, but it doesn't seem to be po=
ssible. Everything I tried either breaks<br>
&gt; the header-only version or doesn't build the shared library.<br>
<br>
The next step is to ask boost upstream to help, maybe by filing a<br>
ticket, and/or continue maintaining a .bbappend with these changes.<br>
<br>
I know boost is horrible, and has a convoluted non-standard<br>
boost-specific build system, but we should not be bypassing that<br>
entirely, especially when no one else is asking for asio-shared for<br>
now.<br>
<br>
Adding asio to BOOST_LIBS is fine, and can go in as a separate patch.<br>
Can you send that please?<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_DBBPR02MB10462773CD2F96E736CB3618787B12DBBPR02MB10462eu_--

