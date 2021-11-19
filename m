Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A6BC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 17:58:47 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.58])
 by mx.groups.io with SMTP id smtpd.web10.12457.1637344725392213765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 09:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=TuPS+VzI;
 spf=pass (domain: nxp.com, ip: 40.107.0.58, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsT1ZMfflddJ+z0RlP5sk5tntCvaD5DoxjhXqVs03aDFlN++QoxiAcg2WAAADqj4fR1FVwBwX0Zj6RINpYmzJzK7kMSe59wfpbRAzREpVFthiHrqwRoOtHcJ4FIQBIarsvbidX44MxBThh/n5XgikMIGfpQv2I3YbiMR6MaKwpGZ378bndHMR2VO9iuJkR8l0RgazTByQtiOJ5nST+5Crhzl6a/nYWjPHHsYrmQVrraa3ShLgYvkzXU9ldgutb30HGwg3p243CDpk4xZAZtJo0nEZjWSN4bhYb0+QM8p0h7kvlGapDgi72umAXI9DXCcZVIhE1t1+VB7lRW62ij/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezgD0fbvzPE948sPX+XUcLmyndpOyz9vISkIG/Un1SE=;
 b=A2KTLjS/pc30opbZ9MrAQAYzOfFU5mZKZf6oW3OBZeR3FJsqzXBXdpq7xWCtZsSieZF/pCzmUsVXZlsnl6ReVOhUjNV7I/Okddds4aZ8ZlWLOCO7r+PieQUpkXlRU5KMt1E7LzIVz+1gT9ffBy6j6LbltGtObXt4VlZrH3E0oxRUoGaZi2YNIhhZo/dc2hoqC0kUSwf6pwCAzdbGt6jexZQyJZ6hTEHGcHrPgrYYJ1H7VQB53EqbcZEzAOrpS149/Sjw5WRPIGmR7qZoYXNlIDFYcPmdPEpp90hkNPLKJuh0GKGEhQF49dIp7kzyQGKF4wNqyK/9kJnpkPJTXLjrTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezgD0fbvzPE948sPX+XUcLmyndpOyz9vISkIG/Un1SE=;
 b=TuPS+VzIoNNi2xZqeZE78nt4sYkkCF13qgWHideFx52lM6hwmOsy3LPPm1nG694LLywlxBNlKOg/xgwHSOPOR7RKA4OT4ABhVZ1KQIXwRU8qU4Dbts+xIai4zwpzGbE/bruBvcSqDfFQoNgTVnLwC04cMY9OPj/LBcCgyjGsaQs=
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB8PR04MB6538.eurprd04.prod.outlook.com (2603:10a6:10:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 17:58:42 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::f55e:bddc:b8de:e7d5]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::f55e:bddc:b8de:e7d5%3]) with mapi id 15.20.4690.030; Fri, 19 Nov 2021
 17:58:42 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Denys Dmytriyenko
	<denis@denix.org>, Otavio Salvador <otavio.salvador@ossystems.com.br>
CC: "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: RE: pls comment on weston non-PAM patch (link inside)
Thread-Topic: pls comment on weston non-PAM patch (link inside)
Thread-Index: AQHX16p0CWmY8VusjEiYQ6sCCaYV1qwLICgAgAAAeIA=
Date: Fri, 19 Nov 2021 17:58:42 +0000
Message-ID: 
 <DBBPR04MB7753DF2FEB25F92BAD71E716E29C9@DBBPR04MB7753.eurprd04.prod.outlook.com>
References: 
 <CANNYZj8h4kDhv-ZqkKqMY_aXAezOVYmmrV28jn-jQjdK-d3N2Q@mail.gmail.com>
 <CANNYZj-A4OU5FvM3sMLDfYiv0KBujAifRnCijZHxa_GP4YvELA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-A4OU5FvM3sMLDfYiv0KBujAifRnCijZHxa_GP4YvELA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: otavio.salvador@ossystems.com.br
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 982138e1-f017-4042-ccd3-08d9ab863914
x-ms-traffictypediagnostic: DB8PR04MB6538:
x-microsoft-antispam-prvs: 
 <DB8PR04MB65386459B7CC7C93E1308C84E29C9@DB8PR04MB6538.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ug2x9ascAjXrnv837yxqSIG0H1fcQhP2RdjSQJtzfCE7soSXWn/anG14M1aWoXA+FGI+blAsAUb9ub4F06lgolEHjBXsooPWCo+8anHYR51RS6He5Bj6/fHANjxGPQO0CcI04YxqdMc+wGocG7akiOlp58M8fkh4Slliysl8S3kWsuzNZjE2IunLrrmeSFVSSFWQneEmrx0xc7bkxDh4+TADZ1oJjXLVd4lzIiSSIqCnLgPruJ/bw1ah2R15nXKVLg3YGH5p0N0adPCFiiND/Yd1/4LRfD+MWgcn5pQNM0zqaiGqxMWZ6OJPRQg782nNuidgDDTFRkIe+jxmnhyAXUQb25lzocqKDewtxaI86u85Ct7O/WMJM56bqT3m+1GMr+DPIIlemJ3ZfLrFN2qb5jcpzp3affXKMp8OQnWOVkY/pPdLDaDyVYOz3CplDVq+miszyZ24QAMqJU5qLFPWwDD94hxCfXJY0NrPZdo+q+FPRqnLD0SVvJfIaJu8IyTcRBwglCWHRwD2FDeD370PRls5DljfmdgIk9fHwltxhOoQBUmGt+nG6ny3scLlFBrT5h8Jvpyg27oFBMOOhOp0o8jv/jxvbwkFHEGuKwC8Jhw/9MgtN2WNrHTYAbsgoJIe3jNS3tvUZDssaGwL1W1Euu2htld/3UGrwjBUlxDi2tI/RmTipMYAhsoQq/E7W0MDHPgO6wne6k74eAqKFrJ4mA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(33656002)(186003)(2906002)(44832011)(5660300002)(71200400001)(8676002)(86362001)(966005)(66476007)(66556008)(64756008)(4326008)(7696005)(508600001)(66446008)(8936002)(26005)(55016002)(38100700002)(110136005)(83380400001)(66946007)(166002)(53546011)(6506007)(52536014)(9686003)(316002)(76116006)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Knoklfc2ccweEVQ4/R2sgEcwuTa4lvN9kEIeCF7vSWsi8pKSqfW0v1KfQ4CV?=
 =?us-ascii?Q?9+Ec6XnRgr+Iswr9A3rf/yURaZ5CkIoOL3o77g29tNPcBb0ndy+B+uSsVpxN?=
 =?us-ascii?Q?BOvuPy1pHh8HLJiE39RRSLmi5M3KYeIRhVbe8Xc1+3G/2EMHOD0OniZ8DvF6?=
 =?us-ascii?Q?m05z26lq4Hrco/qVruDnCCw+e4aHzx6FWX5p0Zw0wDlugp0gYrXailSX7iP7?=
 =?us-ascii?Q?7iimyzBY6HSn5NTT8Tv5tsL7lf16q4nmhFsHwgDzeWFcnwLxH3LGomz4bOuv?=
 =?us-ascii?Q?h68EBS1W0qBHHP4fH61WRe2rhMws21/sN1i00WCp1BqA2EgiOPWqbHTTcdUK?=
 =?us-ascii?Q?p+WCzmmouJ8wGIJ7Wu72ktK2tAfdiztfJPjwbQaSq3DZdVN+cuBLI17X203+?=
 =?us-ascii?Q?PK8jbuNb71wLAJ8gCmLpGWqIH0JqNYhRwAktxa273CRR1V4s0jh5Aw/MMWOR?=
 =?us-ascii?Q?msy+IcPZ2TnPPLxLnrl4f/yVbdxjrPzT61a9g/80x+Yfm3T3e8Y0KA5m2ay9?=
 =?us-ascii?Q?5GD6VMDbhWJf1kPtPT5IayJTTjcbw8qk2q52zLD2Ng+g9CncyLbP87aa9WmH?=
 =?us-ascii?Q?TlgVN+fpsMcPFg8dBGnNh9uHLv6rPKquthlgEkLAYY50IWaCZU2PBnHVYn77?=
 =?us-ascii?Q?x1ClEihfbYTt+0PIWxwotNlIIu9z5OeJOmQhhOVc3zZyhJxWnhyMJIyvWvX8?=
 =?us-ascii?Q?R38zKkamhHSkfjT5QmzDI1gI12QNQmBHGQBMoyiEFB6ldqKjNCrPdWMgNN1h?=
 =?us-ascii?Q?lUZumbP/yl+UTd4FAuXMeq2iqueJnQNjOYQbvXY4R+rVsMQI4aWHvSoBKP7H?=
 =?us-ascii?Q?221KHdjdrqdGmf+bG3gg6TlsKPXY1dDX4kaTOJW3X0G2ACClYWfZtN58Yc3T?=
 =?us-ascii?Q?JTE0IKtduUBIY8OmMRImIvx5fsK4BPHhV/ivH/3s6v2yuHHxxH7Rco+gpq5t?=
 =?us-ascii?Q?iJkOD9hc2biyT3psAyeSck1EHQr/gOd+EoTKHOjQ+z/nAEqW0cfgNsCHP4i0?=
 =?us-ascii?Q?2ggxiQ86E2IZtT/ZvHj+/7V9wbqLaxgRQqkTXltBil7NoMa74IHylC40s6VV?=
 =?us-ascii?Q?nzzGvSEsPVNfUraJ9HHKbhL6j/j0HDrwzom9mfDaZEJNe71MCO2ZamA0J5Nt?=
 =?us-ascii?Q?I48j8900mj3iQGdBh6sKz0S4SDFs3aT4ahK8H91D1FB0bMK2wZ4It/J8CR/h?=
 =?us-ascii?Q?bQGy1pFsCpi6GbKWwCexw+sO08p3tx8U7NpWF8Up0ea4ijZ6NReV3sKdrYW1?=
 =?us-ascii?Q?r9D4dsdAhsN+9CW/N0i3sKX1crgrWRN/qGtLjiSz2ZqlREfkl5ASlhLZ8J+R?=
 =?us-ascii?Q?LuxdQU81IHNTTh7qBe5rGvuUoe3B+ZzDewW8LiFBo8b9ZUiSaqP7vsVTXLME?=
 =?us-ascii?Q?dNOvpWCqt4kiVHmGDX/1C6URXX9cl1to9hXdkNAvDKzpcBwUSjYCOUiZz8xN?=
 =?us-ascii?Q?zTiDwsx9qnhEJlmKImkBYOyKoAVOdUi9+LZmuuqKCS5W3pUw8qm7xkAx7a2J?=
 =?us-ascii?Q?KyQMkpCaOjdNS1L1BGPyhfOw4h8R92kplX8cb1sv1c5v1b6AlT5OWeXs70qO?=
 =?us-ascii?Q?AMe8dVyyHiv0pAkN3820Q8BdS7tJAmmt0Rk6ndaWuOzT5ZaRQrVlqIZMjWCP?=
 =?us-ascii?Q?Mg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DBBPR04MB7753DF2FEB25F92BAD71E716E29C9DBBPR04MB7753eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 982138e1-f017-4042-ccd3-08d9ab863914
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 17:58:42.0550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 fQAedIJXdCPxzv+my3oYRz37ogN/Qyf7RQPvSQP0JQ8NPxOJXrDZSoNtYZvH8CL+A7URmaojkdyzYOZxHIIGbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6538
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 17:58:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158525

--_000_DBBPR04MB7753DF2FEB25F92BAD71E716E29C9DBBPR04MB7753eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Alex. @Otavio<mailto:otavio.salvador@ossystems.com.br> pushed the ha=
rdest for the use case and I don't really have anything to add. Given that =
Pekka has suggested that there is a better approach without weston-launch, =
it seems that removing the patch is fine. In the worst case we can backport=
 the patch to meta-freescale until we have a new solution.

Tom

From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Friday, November 19, 2021 11:06 AM
To: OE-core <openembedded-core@lists.openembedded.org>; Tom Hochstein <tom.=
hochstein@nxp.com>; Denys Dmytriyenko <denis@denix.org>
Cc: ppaalanen@gmail.com
Subject: Re: pls comment on weston non-PAM patch (link inside)

Hello guys,

reminding you to speak up in the patch submission; if you don't, upstream w=
ill close it without merging, and I will start working towards removing the=
 patch from Yocto as well.

Alex

On Fri, 12 Nov 2021 at 10:48, Alexander Kanavin <alex.kanavin@gmail.com<mai=
lto:alex.kanavin@gmail.com>> wrote:
Hello folks,

I sent the weston non-PAM patch upstream and they have raised questions abo=
ut its validity, can you please comment on it?
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725<https://=
eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.freedesk=
top.org%2Fwayland%2Fweston%2F-%2Fmerge_requests%2F725&data=3D04%7C01%7Ctom.=
hochstein%40nxp.com%7C6a003f79d8a44b3beaf008d9ab7ee8ad%7C686ea1d3bc2b4c6fa9=
2cd99c5c301635%7C0%7C0%7C637729383818649026%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=3D=
mOGax0pBnQjJBMrDsfv6bv%2FgZ96u%2Fd5UcP3wZDph36Q%3D&reserved=3D0>

Thanks,
Alex




--_000_DBBPR04MB7753DF2FEB25F92BAD71E716E29C9DBBPR04MB7753eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Thanks Alex. <a id=3D"OWAAM5F07BBDAE6E642D4837CEDBE4=
3FDA9DB" href=3D"mailto:otavio.salvador@ossystems.com.br">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif;text-decoration:n=
one">@Otavio</span></a> pushed the hardest for the use case and I don&#8217=
;t really have anything to add. Given that Pekka has suggested that there i=
s a better approach without weston-launch, it seems
 that removing the patch is fine. In the worst case we can backport the pat=
ch to meta-freescale until we have a new solution.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tom<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Alexander Kanavin &lt;alex.kanavin@gmai=
l.com&gt; <br>
<b>Sent:</b> Friday, November 19, 2021 11:06 AM<br>
<b>To:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;; Tom Ho=
chstein &lt;tom.hochstein@nxp.com&gt;; Denys Dmytriyenko &lt;denis@denix.or=
g&gt;<br>
<b>Cc:</b> ppaalanen@gmail.com<br>
<b>Subject:</b> Re: pls comment on weston non-PAM patch (link inside)<o:p><=
/o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Hello guys,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">reminding you to speak up in the patch submission; i=
f you don't, upstream will close it without merging, and I will start worki=
ng towards removing the patch from Yocto as well.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, 12 Nov 2021 at 10:48, Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wr=
ote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal">Hello folks,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I sent the weston non-PAM patch upstream and they ha=
ve raised questions about its validity, can you please comment on it?<o:p><=
/o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://eur01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fgitlab.freedesktop.org%2Fwayland%2Fweston%2F-%2F=
merge_requests%2F725&amp;data=3D04%7C01%7Ctom.hochstein%40nxp.com%7C6a003f7=
9d8a44b3beaf008d9ab7ee8ad%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377=
29383818649026%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DmOGax0pBnQjJBMrDsfv6bv%2F=
gZ96u%2Fd5UcP3wZDph36Q%3D&amp;reserved=3D0" target=3D"_blank">https://gitla=
b.freedesktop.org/wayland/weston/-/merge_requests/725</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_DBBPR04MB7753DF2FEB25F92BAD71E716E29C9DBBPR04MB7753eurp_--

