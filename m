Return-Path: <Bhabu.Bindu@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E062CCEBF8F
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 10:27:43 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.90])
 by mx.groups.io with SMTP id smtpd.web11.66086.1727432856210094763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 03:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=tWJmRcZX;
 spf=pass (domain: kpit.com, ip: 52.101.225.90, mailfrom: bhabu.bindu@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAVUrtAz1arbZ84Hp0ThVm+W2lRqcNwQlv5TqynPMDNX9uHKaRoj95mRqJ5YysV8Xij6wr0WmLva74RtxmFMG3xxFmotZmy9+BdFCuPuLn4Eqi8OASBPUAqRMto98xBL3jhIbNbalXHMXdzeqQ3UM/lXpF+nKQ5v1sQme4R6Zw2F15DEIYJUewB7vwzrKgFCpDxnyjdxSBwuJ6bm1t18IzA3r/qkU+Gk5de4WMiAC80ErySVqD3zT49qkRo96Bdz3OM0bdYCsabgAfWsn7jVzDjdkKTZrpTx8pCVAbRZA04Dm7gLRdgj54aHBzhC3ZSONKVQiwy+JMw1W8Zw7/TVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DycwpnS0gV2EWYNMFJw0HSL3PFX9gi5m2rXWBJdYdk=;
 b=OE1MGzElV4xjGjCUVfk7i9OZQ+EmU4v+f4j/hAJfPqLEjqYAbMPmKswwTlmv0w5gh93F8Rj/MkcKG+9W5CyhMe8sQAZH1TIpBGgddAh+Zq+zjHJ5bO8FfQ2z7c/zuqT3TiQqXgiGzoQZrE6EvmbdhIr/jrEZE0PMJuRQHhuKfemWnQjywuKzyYUnZnAFMmat4fBaSYWaK6ff711+TDGe6nL4UDhGIOp+D0/anJrZQYCCJPHIgs99k/grQ8QGfXbHOB2h22zi+Vbj0mI9lwsQzNua4KbeEd+MXY0LrPDvUgqVij/kselwQzvj2MVmSLKG2EvJAMP/0t5xjjFZtHhzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DycwpnS0gV2EWYNMFJw0HSL3PFX9gi5m2rXWBJdYdk=;
 b=tWJmRcZXSMi0CHpvSPOnAT2AeDsj69NKOfSpMaIAs5/61siL5v4nEGI6EMY1dlfTxqbxeSJij14jW1maIhyznOiclL14ZKeVdbd+qgTyBCN66wxs51DF0SpYeNKvML2pEYOgAMQ5gyavfeAXW1opFt+/zOkhQzGS1SfeSfS56NA=
Received: from MA0PR01MB9793.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ee::13)
 by PN0PR01MB6028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Fri, 27 Sep
 2024 10:27:24 +0000
Received: from MA0PR01MB9793.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::65dc:8806:aaf7:ebc7]) by MA0PR01MB9793.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::65dc:8806:aaf7:ebc7%4]) with mapi id 15.20.8005.010; Fri, 27 Sep 2024
 10:27:24 +0000
From: Bhabu Bindu <Bhabu.Bindu@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Nikhil R <Nikhil.R@kpit.com>, Bhabu Bindu <bindudaniel1996@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Marta Rybczynska <rybczynska@gmail.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz
 packages
Thread-Topic: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz
 packages
Thread-Index: AQHan6XNt/eh2JON302tN4KuOoHwkbGKVgwAgFCdNACAkVvO8A==
Date: Fri, 27 Sep 2024 10:27:24 +0000
Message-ID: 
 <MA0PR01MB97936D2CC0A90C2D422A36B8956B2@MA0PR01MB9793.INDPRD01.PROD.OUTLOOK.COM>
References: <20240506110846.125652-1-nikhil.r@kpit.com>
	 <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
 <ad9e2853a23d17dda7fc499525054009590aff53.camel@linuxfoundation.org>
In-Reply-To: 
 <ad9e2853a23d17dda7fc499525054009590aff53.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9793:EE_|PN0PR01MB6028:EE_
x-ms-office365-filtering-correlation-id: 70734852-1d81-4663-2e8f-08dcdedefa40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?jNHcxpdTELkbZV4n0SRrSTSXLynOFhe36JR/eEd14j8SXMoOPql78h2Ms65H?=
 =?us-ascii?Q?Hz6d7hVvuE1uUq0EBfMej2YRA7m42YrY8pW73PezzyOLJKEs9YQKF3wY060A?=
 =?us-ascii?Q?FlE0+8JPeW0ToOIsxFKyXmeGhNCUY4OnvD94UohERpIAAWrsfv0LJQbDHivx?=
 =?us-ascii?Q?lwKI/htGY5G0TSVRsypThWXaJhjZ+TY0A7F+M3GzVh8jJlYVOPq6cofbdD5U?=
 =?us-ascii?Q?zgRt2Y//sqQDFjEYg4SbqFxI61FDDV4q1kLMAQ707ZxhkKISd7R7QcCHnPAd?=
 =?us-ascii?Q?ZS5/Fdzitj6cSEhujsUmrVRKzmoi4fV3kWzwF3w74wcEJ0RcKpj4/L6mIrvk?=
 =?us-ascii?Q?LeFQLPHts0RnbralvSa4o+pcbcUq1eCr+f3RzF/AZkFrTeuCbMSSMe6QUzSi?=
 =?us-ascii?Q?pBpO7m/m0PXimS7ZLigOW+zytbSORy7aWRvPavr8Y2oOAzpnJYxE7fCXVlQk?=
 =?us-ascii?Q?WK4WXAa57/c/5shKPz/+xy8D07aER5jFM6dewz02Uaqn/mCCXhkeCfDwMInQ?=
 =?us-ascii?Q?Bwr4BhJb8V+69AHvX6sHJwnN6LVpNKhDyMcFY1odN0ntCrKfdIqHKokVb17r?=
 =?us-ascii?Q?aNarYR05Eh3OQGsOF/UZl42h5Hae5xhcUkk1/lFBfcSxWBspgyhjlRrklEDx?=
 =?us-ascii?Q?q+dDbqUS8H/0F09uBPDa7nqaPKNJuw17YHH5UH2WfEbe8FjcaOeqquF56Q2o?=
 =?us-ascii?Q?ijSwfto5/n8hvxQ/yqexh6FdOz88QyhhJOaAxpx9ArBXiV+0plAp6zgp/1ii?=
 =?us-ascii?Q?C7UOzxUf9zz2Tjv/3ayOdh+i737iVDtHZI2c9Q/Z1a17uSxYofmarqCeyGYx?=
 =?us-ascii?Q?rNfkuWcCszDReCOsGSSmySc1cWahfDsgJmiVamXvKZMCd5FPoZ1/aNS6DPru?=
 =?us-ascii?Q?v8T7ZrDjnr+VQlRT5A/8x0Rei4hI/so4+BOx4N/xF8nS5F+4KLqH9bQXr+Uc?=
 =?us-ascii?Q?4a79TrutVNsT2TTF2Bo7uQ9oZJADc6crYmfH+0EAsirWTDZ1PiIqwvu8hObU?=
 =?us-ascii?Q?XM6p3bhYyBFtFjfqgXkqmD8N2SWxCh8Rpp67+gxsyMp2p2jjP5g3kwE8zPVb?=
 =?us-ascii?Q?6JYyZxmpewWrIHcPSIbQ5Z0KsH3SsYYk7NomXUEO8/v2z81NKJVzuDwn5F58?=
 =?us-ascii?Q?i07oYmnllBqFpqiJsMkck7A5XVuSruFLOi6O8uYzMMeaaoDaCrK0bnUiGZl0?=
 =?us-ascii?Q?5Y18cmW+DJ1G6xoqbdUyLiqBHaZec3AeY0Ko10ygP7iX6iZ8NeshLH2MOAc2?=
 =?us-ascii?Q?1QcNLt+VsYsSj1ofEbalsTGfmIjxN7qfvHE0cK+5Ng=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9793.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lTtkLoLBhG3zmpL7pdeKmBSmhRVGzNQnBfoqPeE/a7j7VLn1voKj6B33PFuK?=
 =?us-ascii?Q?rMB6drrfQAqPe14dqV6O3HqRjilTqOcjfrAsqAaFmSngKJhc4/w6rdKfFSRf?=
 =?us-ascii?Q?bv+9MeQ6pteJRaa+v5Jmz0JwkQuQEp5NF1zDBsXXc+MpvF0e818JG6eZRrrs?=
 =?us-ascii?Q?I1sIeFDdF65j01wb18bqYxbyAVVyXShH8lvvA2+TmjgV8X7SHgu2k3q7MLDB?=
 =?us-ascii?Q?UzwyWcCFzUiW7G5z1j7mfIEJdZ8RWyo8xULMSjSVKq7TS/aVWDesm+s0QCjZ?=
 =?us-ascii?Q?9RMorFTHEoHgkZmcZ/6vujzU64i2kxk4G8CiKykbQnY8EH4MdeSn4o8B2jG3?=
 =?us-ascii?Q?HxEOqmuk2tly6XZIF5Hw2+TnltIL+wFvDv0az93DgNUQL6LnGAlXT+cr9LD8?=
 =?us-ascii?Q?aMEqu5n87LllxMaQLisJslfdjvVLmuUT1sxmgMk7gA6xXvtTMpGJmDn3xS0P?=
 =?us-ascii?Q?vP2Nol3vItr0me7S1yiyaNXLIiwXI/mXpS3ZL8uIYjvTimx11M8bkYPmMm/s?=
 =?us-ascii?Q?d43XSlEC5kLA3uredRrqxaWqQflkM9fajN39/QSAZjXAWYmLY0T51ZohjWxU?=
 =?us-ascii?Q?ylYs/fpCOHgdaimWWAgnq2biT1e63x+O3WnazCnd/JzSatomRM9MbbY5gRjj?=
 =?us-ascii?Q?xkCIKf/EZW0Uy58zvTz47ad5PKQcviLylhuQ8cupCWs/NoMpqk0PCwCXtxWZ?=
 =?us-ascii?Q?Oav9gFTLVZBv3pcu8LiNJZCGFTJ4RsCuxUAw6Vd0CqYB1iZvWB59i+5ESA50?=
 =?us-ascii?Q?co+NkzUhIdkm8++JEI3bULAq8PRc1/RbnC/t/3h4pjvvXvt0JIpr7D10cQt6?=
 =?us-ascii?Q?9jZ+WXsrcBDbCNHKD/5Y1XDZpoIHFIAB+LlrOH9fx9IV1X4dL23LPKeph80w?=
 =?us-ascii?Q?k9ECd7pRHxVVTOvwtTH4sj03gG+946qRJ2Z3ch21/IJRaAg0evG0au3YSCub?=
 =?us-ascii?Q?LIqXgchjZLnDFa9jcBPyGKjgimHee/hgk720kXrx9Kzvt3t92C1oqlxGxrYg?=
 =?us-ascii?Q?EBuTUxFq1XTqEBU+zHLhCRNkb6mNqeDxK1xnY4t5JMYx8zVdzzVcS8K+sy8q?=
 =?us-ascii?Q?GHt1XDOz59EdqPS0PEaX5RrMN+jchEAKh2WsVVkRfwwQSWBkSQ1NM0MZjuJk?=
 =?us-ascii?Q?hNcenYh1r3GMHmbM9eklkGKF4Kj7tuXVqsZEGrlhdRT38GfD+mLcyZGGYY37?=
 =?us-ascii?Q?/q8fBR/8YFbK2fweYE6UJABWAMX35/0k6YDrh4F0nI1DGWa+88UP/5Q7unoG?=
 =?us-ascii?Q?T0SSIzYBnDSwWYHvY7t2IDTNp2mfrOxNISn717iLEt9DQerEbUDG+fUxHRRI?=
 =?us-ascii?Q?bmmc8nzCmA6ShsJXvfnnnJ7hGbkGxV0wrYARgCG7eTZZ262PCv1G2cF3uU0a?=
 =?us-ascii?Q?Exrx2vi/3sRjGbBRAIVxH0zT+MA8xG/+j+HN7k7HZ4dAv/2/F/Ge/jcDAR/g?=
 =?us-ascii?Q?b2+KXDRBqt24J/XpAVPxud9MjPmiol2tNC8gwwwi/eL6+ITIlAayiIpRrMQr?=
 =?us-ascii?Q?MScwLMZmiA19grWpzmr2lHseeibZ6YZKVTBSU/+12fLae6FWD3U/zXOgvF5c?=
 =?us-ascii?Q?FpG8m5//9sYEL6xYMzk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB97936D2CC0A90C2D422A36B8956B2MA0PR01MB9793INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9793.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70734852-1d81-4663-2e8f-08dcdedefa40
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 10:27:24.1849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1vvhEvvYdJ6Npuau60VzIOWhjfP3Z1d2tW2i5nEIj7EYhcv9duwUx2BY+w0OkGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 10:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205010

--_000_MA0PR01MB97936D2CC0A90C2D422A36B8956B2MA0PR01MB9793INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello ,

The LICENSE variable for xz package is updated, and this change is already =
part of scarthgap and master branch.

May I know when this change will be part of kirkstone.
https://lists.openembedded.org/g/openembedded-core/message/199040

Best Regards,
Bindu B
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: 27 June 2024 04:06
To: rybczynska@gmail.com <rybczynska@gmail.com>; nikhilar2410@gmail.com <ni=
khilar2410@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>; Bhabu Bindu <Bhabu.=
Bindu@kpit.com>; Nikhil R <Nikhil.R@kpit.com>; Bhabu Bindu <bindudaniel1996=
@gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz=
 packages

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On Mon, 2024-05-06 at 17:32 +0200, Marta Rybczynska via
lists.openembedded.org wrote:
> I'm not a copyright lawyer, but from what I understand public domain
> is not a licence. For a discussion
> see https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
iki.spdx.org%2Fview%2FLegal_Team%2FDecisions%2FDealing_with_Publ&data=3D05%=
7C02%7Cbhabu.bindu%40kpit.com%7C2ea7b1fb245347fc31ec08dc96306b75%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C638550382007188689%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7=
C%7C%7C&sdata=3D71LsYBUvsIlOxDGTkkZKVRvHkWrn0mxAx6Vu9wzZqPs%3D&reserved=3D0=
<https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Publ>
> ic_Domain_within_SPDX_Files
>
> The next version of xz will be 0BSD so the statement will change too.

I did check into this a bit. We do have a "placeholder" license file in
our common-licenses directory so PD is accepted in our license fields
but there is no SPDX PD license identifier for the reasons linked to
above, each wording is different. PD means different things in
different locations too.

Switching to 0BSD probably makes things easier!

For now, mentioning PD in the LICENSE field would match other recipes.

Cheers,

Richard

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB97936D2CC0A90C2D422A36B8956B2MA0PR01MB9793INDP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello ,<br>
<br>
The LICENSE variable for xz package is updated, and this change is already =
part of scarthgap and master branch.<br>
<br>
May I know when this change will be part of kirkstone.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19904=
0" id=3D"LPlnk546351">https://lists.openembedded.org/g/openembedded-core/me=
ssage/199040</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Bindu B</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> 27 June 2024 04:06<br>
<b>To:</b> rybczynska@gmail.com &lt;rybczynska@gmail.com&gt;; nikhilar2410@=
gmail.com &lt;nikhilar2410@gmail.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;; Bhabu =
Bindu &lt;Bhabu.Bindu@kpit.com&gt;; Nikhil R &lt;Nikhil.R@kpit.com&gt;; Bha=
bu Bindu &lt;bindudaniel1996@gmail.com&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable=
 for xz packages</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
On Mon, 2024-05-06 at 17:32 +0200, Marta Rybczynska via<br>
lists.openembedded.org wrote:<br>
&gt; I'm not a copyright lawyer, but from what I understand public domain<b=
r>
&gt; is not a licence. For a discussion<br>
&gt; see <a href=3D"https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing=
_with_Publ">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwiki.sp=
dx.org%2Fview%2FLegal_Team%2FDecisions%2FDealing_with_Publ&amp;data=3D05%7C=
02%7Cbhabu.bindu%40kpit.com%7C2ea7b1fb245347fc31ec08dc96306b75%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C638550382007188689%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%=
7C%7C&amp;sdata=3D71LsYBUvsIlOxDGTkkZKVRvHkWrn0mxAx6Vu9wzZqPs%3D&amp;reserv=
ed=3D0</a><br>
&gt; ic_Domain_within_SPDX_Files<br>
&gt;<br>
&gt; The next version of xz will be 0BSD so the statement will change too.<=
br>
<br>
I did check into this a bit. We do have a &quot;placeholder&quot; license f=
ile in<br>
our common-licenses directory so PD is accepted in our license fields<br>
but there is no SPDX PD license identifier for the reasons linked to<br>
above, each wording is different. PD means different things in<br>
different locations too.<br>
<br>
Switching to 0BSD probably makes things easier!<br>
<br>
For now, mentioning PD in the LICENSE field would match other recipes.<br>
<br>
Cheers,<br>
<br>
Richard<br>
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

--_000_MA0PR01MB97936D2CC0A90C2D422A36B8956B2MA0PR01MB9793INDP_--

