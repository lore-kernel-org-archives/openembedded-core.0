Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19169EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 20:48:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web10.1011.1689194895186486113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 13:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.21.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sw5hbEAqxtFa0ky/ZuKkGLbQMC1FclJ5yew4AU3Y6hQwR+RIy7UaW85MNazRa3Ckxed2dVg8at42MPxCiniENWQ+lPWnEIY1CdXFO/kr919BUEo8f3FQ/gAEcsoHzbmoVxLjNQndfXDosbQtvobN1CrJA/9pGtO6NnG/gZInhi1YtF6US64RlenCi4J147krv8BMYd1abc9SI4phvIUQfONk5oR4TPfWBYYXLma2Hj2pEQ8IJR56k3M9HXcjJ4FrvmqrjGVP2s2KY8ILxuBrrTofW2s2/xQ4AmXLHBC99ncUUPdFPZe/BTGUNlEVG9DdGjmGIsIrAE0wgBO2vSmgVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ulxb9mMvJzsWjBUnxCee8h53jQpb/DhHJb8DGgRo2U0=;
 b=XwSvAk8L1aG+VaMMqTdFB3f4/Uh7Uqfa0tNO6JQIK5bEMHQhyywCrgWiE7lcmJ+WFh40Q+PqCb1v8GLAOl/cNynFiK6JQwPPV4r2WKTNspCOEo7NPopwx5rP7TFRlpuzNwYY2fv6UWW+LrXrH9YM+H2blTwNS5LPSn00IaKau3hvBjT/O6CbL1edsm6mW430HZii12lc5SXlC16qR5H9f4SJ+GwyZF84uah5gIu0C7JXCI0N0skHt/6ayCdAnK5HWgnUdERf9rlCRx47pISsloJwN39vvIiUtBGuVbC7WBRsLrzSIhTXHYyhbqWj+T6Csbx63lJUQhFB/M8eXKiu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ulxb9mMvJzsWjBUnxCee8h53jQpb/DhHJb8DGgRo2U0=;
 b=TQG/CMLk1CEdjlQoT1JgSSR3o6963eFLbBNMzdwu/OymwsJeNyH6MB0UTyowhBiSqad66AI9w621htTb/ICQR/ARYOh66NO17zoQDBYBMXqwxK3PSqxSpffF2DO4uFGdHzzsK3Bw5DSW5AMFH6ZBtW4I8uJ05P47gtIbR883W7Y=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 20:48:11 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 20:48:11 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtQHzgf1cCG01pEmjH5DVhSvfAq+2mhf/
Date: Wed, 12 Jul 2023 20:48:11 +0000
Message-ID: 
 <VI1PR04MB5373BCEB0EC347625C9A15E09136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
	 <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
	 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
	 <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <d2d9f29c1d04105c76b6791387fab33662da3cd5.camel@linuxfoundation.org>
 <177139B6ABA154C9.19802@lists.openembedded.org>
In-Reply-To: <177139B6ABA154C9.19802@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PAXPR04MB8173:EE_
x-ms-office365-filtering-correlation-id: 68842818-4c45-4278-5552-08db83194e6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MuUHNl2wGMXXJ1uCvyTNZ+BXcgho8KJp+0qUftMrwcBgrRkU+nfIgr/JZk6qdaljLnjGtqn6vthyeTrF43AwSF8E9mx5lF4Ori7GHFXE+ywViSy2+115Z1ZdeHO5fSjB037xVrsCM1WWSEwZkuvW/FjN3WMy5v5xE4mU93ppmPhEk+IvhTVQMO2HTsWET77M+ngqami+wLAA1r/V44hBAVsZwUmuhZiIg0vgFMe68hL1Eezi/L9qH/4Xx4DFWQ9zG9i3+7MST5kIZeU0DC2/ZbWfLx15AE8hAbznkfjPCfdcaYPVHVQiJHVxi5AeD9y2WTzY/hD3TmLJOAyDrKq+xPJLHoIBi1RKb8YvcKTClNjdNnj+VWSL9t+nSmQ2vTpQXOpK8mITwDyw1RdPzz9QnmX1DGrqRe+Qj3bDJI19emJ9uq6gRq4mWCci353MpP03SAPrmxx2UletWJ9sYK4nOPXbpCGP/6Fjgwhk+1o6DDz1JMfrFfBJtZ3kjjFmYK4alLtCBTrAJk8Y0FmxYtjobx3vuro99jqLzzc4H1ROREiBoC1hI2CGy7ibJeTXXO59y8vwRKNwmKfWZWC6Hhrg2c+olkKaSgJ21Cr6kt2rX40=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39830400003)(451199021)(55016003)(166002)(41300700001)(2906002)(8936002)(8676002)(316002)(52536014)(5660300002)(66446008)(66476007)(64756008)(76116006)(4326008)(66946007)(91956017)(66556008)(26005)(6506007)(86362001)(38100700002)(38070700005)(9686003)(7696005)(71200400001)(33656002)(45080400002)(122000001)(110136005)(478600001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?wdrX94bWDJAHeYnV/lIlItR9x3dwSQtoGgLWuHmkmlMvweFW0x5TbIpe?=
 =?windows-1250?Q?uRbEsoBLdDFNAee2+TKtbn7qlKulyxRFwHMEDPbblGG2gjiOwqinGtAv?=
 =?windows-1250?Q?Q7ThuPuDVbaACjEDssDzbYdK6pID2e+IfX6UsZj2Q/DB3oG3XaiVlZca?=
 =?windows-1250?Q?T3FbmXGBKAzCrcCeHuVRXLCDZWMBdH8QipVpwTFuicy7NNpjjskykEuM?=
 =?windows-1250?Q?oi5EqGD/dI8YJAU1/aVZ+BGK2bO6eXFpfMp1pc6yvpc7MZzdoI/NaO4C?=
 =?windows-1250?Q?Tk1OTnV+XIBGWd9arCDK2TVm5YsXMeCYInRWdfFz8jtcjpVR//zQqsGs?=
 =?windows-1250?Q?rGLYgYGl2yWlIzgq8PmTS4XNHF5/AtO+5ghcTagY4l+ovfp2Awpws+zY?=
 =?windows-1250?Q?T4ywviXsuGQpguYuTs2TIb8QQkNPCvE1XFQQPqfehIFrfDvFkoc1gAJg?=
 =?windows-1250?Q?G2FaL3dk5F9pxTVWyQdaihUwllwGQWedfqaZ5I7BUIp8gqwvYV7RMOrk?=
 =?windows-1250?Q?oz6tCFUPHhuC5pdBnopW13IAJJ+TF0mhFHMmdRb4XPLNc54AsEzd4V6J?=
 =?windows-1250?Q?SV7+Y/epL4ny6KawymMauK1+Nl1G0HzwuZPSEEIB7gEK3rZxhZ/bQrEB?=
 =?windows-1250?Q?FHcmxdSgIFw7f/0SxjmWyKQnlDDenEgWj6Algm8yoDVmLimILZ3WZsTJ?=
 =?windows-1250?Q?Bj9YOt8W0ZzXYHhl4GNVtOeDf62QmcJASXtKOVYIxlRzBDXvVeUJT1lw?=
 =?windows-1250?Q?HvyJ4FjE02ylsn1Jhwa9bePjua4t12GGXxNdmtMjujetIT78DL7Hh0mo?=
 =?windows-1250?Q?pLKg7oqZJ0cFBMFQTumloFjInIP1PWAGtJzQpPdVBPKeNZlbFXNH5erp?=
 =?windows-1250?Q?eb7xnxDzbv+sSbOre+NA8LqL75wZ1pagwnByuAjM0dbzE0PXjqbHN703?=
 =?windows-1250?Q?Vx+6PhX5WsJR95g2yzPdWQAU1H7cBfKvgZpUnJkn8RNkSwBRN50sUxX8?=
 =?windows-1250?Q?FM0bZAJQq0YMu/uJZ3qTXopFmq/dq2UK7SHXGkCv2Svv6FKUTCiUnqht?=
 =?windows-1250?Q?GqUXN6KkpWhAuGDzRG6+XQOurPJdfjbWIWDqbgIZSuUYdTd5cCvViByD?=
 =?windows-1250?Q?0r0Axf1CuCK0+/dVzGF0A1dgeBtoaqCtDUCNZrhPWoRWpY0C+YfEvGsF?=
 =?windows-1250?Q?TygO82+0UoFVhStyfkTvN201/Z66mu/YZXtACTApXKH+I58uDRVj9qZs?=
 =?windows-1250?Q?6J7u8qhBHai6QLG0aRKOldMwfrg7Nf+eO5KPp8seFVfT8kyFv/BL9lPf?=
 =?windows-1250?Q?qkErrCmURHuXbjSrJm0QPhg7W9ZfNV7U+XkLjfGtV9O5W+Vd5AIeBQvN?=
 =?windows-1250?Q?bFpqNz4PoXknpwgJS3gqg+JVKIqzXS/humnXoR/uFCPunpEAjVU8z+7Z?=
 =?windows-1250?Q?zlSPFm83c2a/fKUqkbjtRwKRf4CU1gO9p7HycqeoWd3sjvjBfQEGVO5Z?=
 =?windows-1250?Q?/gStdUkRGgWSyKgPziphsbHJLnZOYx99SPABuu/ktbdDQytWyvc213Et?=
 =?windows-1250?Q?utH+wK9X/qy/99hZSsE7o1LSvWltzHRFTNXHH/xKJ35Ck/vkjV60UpoL?=
 =?windows-1250?Q?wa0Su/1IkbKhr6v9s6yQkw78d7U03+57rE26480NV0D6zJSxohHYIiUH?=
 =?windows-1250?Q?6deTleWc3pNQvn7j+nGpDVuLT1ljz2/Yu7rnXDgiX8d+2rujLk9UPQ?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373BCEB0EC347625C9A15E09136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68842818-4c45-4278-5552-08db83194e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 20:48:11.6181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmYFLrxOu9QyW0BS+dcEpE4X5oeHJLx438hY1DmhaT5PAnEfgDRtRzYarrbBOTbl+UYjezJkp6uHWSRC1ep6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 20:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184223

--_000_VI1PR04MB5373BCEB0EC347625C9A15E09136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Sorry for typo. It should be any, not anu. I=92m typing from mobile=85

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: Wednesday, July 12, 2023 10:46:27 PM
Do: Richard Purdie <richard.purdie@linuxfoundation.org>; Alexander Kanavin =
<alex.kanavin@gmail.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro n=
ative features support

Richard, but that is exactly, what I have written=85 wirhout anu checks.

Cheers
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: Wednesday, July 12, 2023 9:25:15 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Alexander Kanavin <alex.kanavin@=
gmail.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr dis=
tro native features support

On Wed, 2023-07-12 at 19:08 +0000, Piotr =A3obacz wrote:
> OK, I have set in v5 patches set, these acl and xattr attributes by
> default in DISTRO_FEATURES_NATIVE, without any checks, if it exists
> in DISTRO_FEATURES. Is that ok for all of you?

No, don't check DISTRO_FEATURES. Just add acl unconditionally.

Cheers,

Richard

--_000_VI1PR04MB5373BCEB0EC347625C9A15E09136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">Sorry for typo. It should be any, not anu. I=92m typing fr=
om mobile=85</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> openembedded-core@lists=
.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; w imieni=
u u=BFytkownika Piotr =A3obacz via lists.openembedded.org
 &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 12, 2023 10:46:27 PM<br>
<b>Do:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; Alexa=
nder Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr d=
istro native features support</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div></div>
<div>
<div>Richard, but that is exactly, what I have written=85 wirhout anu check=
s.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Cheers</div>
<div dir=3D"ltr">Piotr</div>
<div id=3D"x_ms-outlook-mobile-signature" dir=3D"ltr"></div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 12, 2023 9:25:15 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xa=
ttr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Wed, 2023-07-12 at 19:08 +0000, Piotr =A3obac=
z wrote:<br>
&gt; OK, I have set in v5 patches set, these acl and xattr attributes by<br=
>
&gt; default in DISTRO_FEATURES_NATIVE, without any checks, if it exists<br=
>
&gt; in DISTRO_FEATURES. Is that ok for all of you?<br>
<br>
No, don't check DISTRO_FEATURES. Just add acl unconditionally.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_VI1PR04MB5373BCEB0EC347625C9A15E09136AVI1PR04MB5373eurp_--

