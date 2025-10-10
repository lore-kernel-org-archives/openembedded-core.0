Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD91ECCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 18:55:22 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.3])
 by mx.groups.io with SMTP id smtpd.web10.1649.1760122518073569653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 11:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=DWYWPTBR;
 spf=pass (domain: axis.com, ip: 52.101.72.3, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bbym+PcOPnuH7VskPDV4zBPUkRU72puZT4D+MPteZOyX4L6/ys+6QznvBhJaDBBM0h5hrNcLGv7b0ib+B2EeMl1AIbvFvo73RGl5flqe9Cc9LDKHPn1eJjihLbp7WkzZsR0y8nGnLFU0+LWXIi0O5b3kuea7oAC9n5pSv5RLIZq0CSHJCT5Q0eSN0M0YsWSSRcX7qP+N6glZibz7xNW7vW0SpTt0FsdTWP1oONhVG3qmYTH1xbcXVntqF3wBFfk7nUGabr8L0Utoid0F3D4wmepO3JXkFTl8dwJTcrm1PYXdpzpqsxhCEOGHz3bCAoEGpolFzNjs7IIy2P6lRdqv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQhkAhgzkp3RC6xGYI+BOcmUJ8AgYdQSQi/twos/9j0=;
 b=H4HdEK8JufdWkB32hFp51NOt1QZJSb2d6IJ6SakcnPuEfFVSnffTlg8LTnlboC3ROCjSIjAh+7KfP6BqrXMTky6Spk+REvClcHZSMOoBcTu0r6d9cOSblrvOuoQlaY9eWOzQQipQ26VV5qCwFXuy6CJotFYIKbRldPnLnuz75+YEJn91+Kt131+x6EnuAvbeGPF3p2C7o4PRWj8x6D7mV6IKQf8GNoxyf1ocXi6JBUTN/fs/XiMaChXLemKmOw5xZ6NnJNx7dHxHck1BKueMXwLsowp5H54wH+lT4dOJktLzpzNGuEX0vKu3k87kcfT5Kw6I7Gku4LrBoUj2a1OKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQhkAhgzkp3RC6xGYI+BOcmUJ8AgYdQSQi/twos/9j0=;
 b=DWYWPTBRDLkQAuYBScSlBWLY7dFpS1pP3nUqg2x9dV4nidsfZd9VvmvrVNZfPvOjaLqEwmO5Dl3jQLuO79VB9j1IrK+r79afsuHM/BIhClyHNIF45DJ+8P0lh6Dyr1peQ1IO3zzH1YCcOOzwjVV3MQYr19isg4xKEENvJ7Gwt6o=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB10374.eurprd02.prod.outlook.com (2603:10a6:20b:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 18:55:14 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 18:55:14 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "reatmon@ti.com" <reatmon@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
Thread-Topic: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
Thread-Index: AQHcOgA+NimIeWqCEkuo8nadGSkoWLS7uk1Q
Date: Fri, 10 Oct 2025 18:55:14 +0000
Message-ID: 
 <DB5PR02MB10213DF753E3F85BCEA448E74EFEFA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251010160842.28715-1-reatmon@ti.com>
 <20251010160842.28715-3-reatmon@ti.com>
In-Reply-To: <20251010160842.28715-3-reatmon@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB10374:EE_
x-ms-office365-filtering-correlation-id: 3fbf8352-b384-4e60-3f9c-08de082e8bfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?jXn59w+ZotBlCYoB8MEppmzLK+MWSKWsaXdfrdqxZt6UCYcRAEg7Xni1CwhT?=
 =?us-ascii?Q?Ek0ppiWlZ5nECJ757Mx8meXiPrHzpINNJWvsqyeKXRvblxpvTEw2jFP82V1u?=
 =?us-ascii?Q?jDjGuUj4gwfOQEgnOUaaa1snY5XR0xSK8yQQmvA/5gqVFof8AJ6hjkBmnViP?=
 =?us-ascii?Q?3FiH7zpVf4/FjkHXlQFBeW5DOQGBOpm9KamcCg37ZT4ZTzyhoxi1sSwxxcHs?=
 =?us-ascii?Q?xeiQE+lUMLI4biZan4/Qac03HJeTQ1r0F7RIk0CF94plQq+5909kt5lJIvoI?=
 =?us-ascii?Q?fQIeaVCR+vpGG7eo31TS6ZBhKDI4To8NZe1uz3HRe/GqHD6Vm6bEGQSvIqIk?=
 =?us-ascii?Q?F+cAVAHHgdlT1NNkQsyOzMEtTvra8CBc6m/VygbFohExGit5YsHmgb/Gp2gq?=
 =?us-ascii?Q?6AHHZF5oSWIBYrSdI2BkMnex3I4xm+ynKRUyHZ39fuYkEkntb8sB0XNFx0Hm?=
 =?us-ascii?Q?BQEB5wtt1OGLFq9/Usy7UbQFfF7g7xM+tKVQ/EPJDPSF5wXGN+olYyo/19xy?=
 =?us-ascii?Q?iRxtCI7k2J6EguSwNPghRUrioaF53vE4N3TbSWIeSJML2I9R2B2okQbL5foN?=
 =?us-ascii?Q?cLw1IxZhJrgJ8qnwgGMBSzP92mIsRJBcdjlCEt7VNLjRknxEUBQZr5SHxuQJ?=
 =?us-ascii?Q?35/tKDMDpaP00UJ37G2hKrVXNxuT1lhUlG3AkRk7bMpaWElOjhSgWx7RDVgF?=
 =?us-ascii?Q?iFTdXeKqu17xLDEOqxuDGQbraaZfaNs+8Xm+B+6PjCstwFCHOWlg5CgfEtFQ?=
 =?us-ascii?Q?ZyVPi/LrWaXiYQWWxraz8aRIG02dnqv7PAmDNKRy3gsD9dcSo+IsTbTm6ol+?=
 =?us-ascii?Q?ymypbRbyj7GzZkaJslDuKlKDDDZIGcMMXse+Bl7MHyhduud7kDZKBg5mOG+H?=
 =?us-ascii?Q?ZHsyL1Cb1KFEyKCSi7cZkyuGwAiAyQQjNKj5obfNvYobrY6eREljw4ghzxTb?=
 =?us-ascii?Q?j192MUr28rFanu3M5cewbsOEP3/CKxZuJLsh8qH8fo6nYozQg8h5IMRYW/YH?=
 =?us-ascii?Q?jE/FzV8ramiwMh75VKhrxUu/jl+OlYrRXDdaguXGB0tXWnsYBfqKemQ1N34Q?=
 =?us-ascii?Q?SvLYb9Xx8qzcGg6ws2YG0EnYDbbywmMU1o5vDtzRuXeHdblTYKwIexOcpRm1?=
 =?us-ascii?Q?FsVoKgp7ZIjo2FOGtA/fOmT9Iukvw78iL4NXxTe6W3BXZN/7aykCOWxz2Ffv?=
 =?us-ascii?Q?oLrPs7fU3cv+xKSjjE1BB2zO6fitFgXsr7ZzWzrohpMr9lC45Wq39Qo9nx8S?=
 =?us-ascii?Q?oCxcNJ6Z/uuNTWn++hut8cBdZKF+fwHahm/b06UU4KBEptoimJUDOuCqer/l?=
 =?us-ascii?Q?ufMoQy4/7XTVWMZrDfhmz7l/8sh37CbCiD7i+9iT2jaAgkF7jxSiusatQmnU?=
 =?us-ascii?Q?htWbm6nUttFDOl7ae83nHYX/GMjIRdDnnYjxZ0or9UmAXP3dvtHOOyHpUaz4?=
 =?us-ascii?Q?4n4qZ7oalk39Dv1gS0ZDasqSzbmtmVJN/G8iyqoB7bISCCDJkKCeKl6pRhhS?=
 =?us-ascii?Q?GUY5nj1i6wCXKXzjJ4kcv08J8yokGIYtpvzW?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rgTJnVR/xonCq9hHq+NevsdWqmJfLhM5cKBpC1ZFzAOWgQxiTF9AW3pI6KZN?=
 =?us-ascii?Q?mr4ghcjGQp4Q84WAhXiPew8fAItP+wn/bYtfRIHFjQKeKWxgB3Lyvx1N8oet?=
 =?us-ascii?Q?5xFWKQTzKQxkSPn4/Ti9E5+82FZApE+A7SQuNRLEETJW/no4ZnxKdrUdn5uX?=
 =?us-ascii?Q?jrnFK2mHT0KfGnKcvCCWfs+DTB3BnCM4QWa9EJkzFkJ57c+fisgcSyXSLkFb?=
 =?us-ascii?Q?ZLVQRFUcX/uNHZzdaH0z+9vKtoXH0OMzoXXetNiurAzZzMkfUjUC7XhE9IEB?=
 =?us-ascii?Q?G6SljuJ0++zNfIgZ3RZitbFAP3Alj+qLsu5zvJmncbJIZvVsYSe8nYesbtWh?=
 =?us-ascii?Q?V5YuzBBykVWw8YkEewOUZwU3kiDYErTteBdl6vKYoGexB7+D6SD+6mBeCio1?=
 =?us-ascii?Q?ei2onhCzTwj4g05k6iFrLD6KuBzJQibdzI6J2nXmlFxjD68aOzDFwzWBCdLd?=
 =?us-ascii?Q?JLs6UT+hIyaxgW2/dn9hc6HRVdG9ZapKYMkrxSzi15ooB6ihTSo4fjBGF68V?=
 =?us-ascii?Q?9LxpviL4CayPbk+y2xfk352v5dt//g+XBQaPpiAKwKu9lICeBhAQ2WxeyO5u?=
 =?us-ascii?Q?01CfCKpynvS4lgWbvWeXf9v065EZINJcX9Cb1AGk0ADrRWFooWTw3A509/IA?=
 =?us-ascii?Q?UMSKneu76QdE1WVglK828Pukvr/o6J1dBc2oEloDeaSdSlgk+qQWb3xe0goO?=
 =?us-ascii?Q?p5d6GBIraevXdY8J1jhMn7s9rbzsIHabOUiekpI8/JIdS/pOAGJlCsNQV3qd?=
 =?us-ascii?Q?QD2lQV4dAKQN+k0rumc+z71d5z3scovwfnLq4UnFQh0pQU9ku1CWTTXsUfHq?=
 =?us-ascii?Q?YzPcP9zq45Z7mmrs8XuGj+9k+04CQXRWCUFHLgC1Nxs9182oFbYZyJmyVPVz?=
 =?us-ascii?Q?94X4F1wsum5gbrbW467l/N371yIAXjnA23qeps+hMneOz02evsUuqTFagFkQ?=
 =?us-ascii?Q?hKsEOBL0fyfvesnjLm51BapX9ngrQk4QW8l/vFmIPHETt7Q1N9kZ/0TOVLkI?=
 =?us-ascii?Q?q3iVtrjisqyus0j8x5n0BS/TqZagjghDD+QZrMCJ2cmpQnMV0Iqb6rFxcUUs?=
 =?us-ascii?Q?QGowBKvjOf+wrxk2KPIGg/KseYJM2s47rqY+5gZUblB7l1hdgsNKXfNfY6YJ?=
 =?us-ascii?Q?acxOycoDRjgGk2dxoSEu18oqkuYB5MpRGqp4sfTi5E75/hjqYX3FNmtcRlMU?=
 =?us-ascii?Q?XVypIRPcMgqchSKeKvjcx6Jf9gaaHMMDfWz5AqTzAW0za6nSQIOlrpch8iej?=
 =?us-ascii?Q?7w1LYVbdoTA2xuiVvUEZc5VCer+cTNIFmtsRzZdxOzCh3fr+8J5ppPgvmWX0?=
 =?us-ascii?Q?KXd5qcJPTT/QIHFpH/DYl6Oufp6wuYchezFenOtKodXPCsG0j9uuVjwITa9h?=
 =?us-ascii?Q?kZUHirOt2CHoTU0zcYyaMyWPUoLNF3dBWdy8gg65jszKJTwx4ODLc+ZnJN6w?=
 =?us-ascii?Q?Lwap0e85pgbPZa03VRR+idBFcOx2JthgrN1m6RY+ycikUtDKZRVWkPuiNuRY?=
 =?us-ascii?Q?/WVg0J59vGMjlfeZ0wo8Xm++i2hDwlPXWA9/cL3BYxrzvytIwU+d9Gpzwg?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbf8352-b384-4e60-3f9c-08de082e8bfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 18:55:14.3195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYfhQ5cDsVyeTE/kJX28HCPMUkU91XH9KEdESnxoLjCyvoRuFuy1XgQu1nkhTcFw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10374
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 18:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224704

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ryan Eatmon via lists.openembedded.org
> Sent: den 10 oktober 2025 18:09
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
>=20
> Now that all of the current firmware has either been moved into
> sub-packages or removed due to licensing the base package is now
> empty. Going forward we would like to keep the base package empty
> and force the version updates to bin any new firmwares into
> sub-packages.
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v3: Split single patch into three patches, and add ALLOW_EMPTY.
>=20
>  .../linux-firmware/linux-firmware_20250917.bb             | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> index 4efdc73a45..9a12f45435 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> @@ -3311,8 +3311,14 @@ LICENSE:${PN} =3D "\
>      & WHENCE \
>  "
>=20
> +# The goal for this recipe is to creata bunch of breakout packages for t=
he

creata -> create a

> +# firmware so that you can choose which files to include and not have to=
 pull
> +# them all in.  To that end, we do want any files to be part of the

do want -> do not want

> +# linux-firmware package.  So set it to "".  Do not change this.
> +FILES:${PN} =3D ""
> +ALLOW_EMPTY:${PN} =3D "1"
> +
>  FILES:${PN}-license +=3D "${nonarch_base_libdir}/firmware/LICEN*"
> -FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
>  RDEPENDS:${PN} +=3D "${PN}-license"
>  RDEPENDS:${PN} +=3D "${PN}-whence-license"
>=20
> --
> 2.17.1

//Peter


