Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9651.1793800864952753427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 06:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0fQE/TR8;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5HE6cAeZG7Sg//YyIBozRqhmsNxeKA7RYusfu2Yqp3e4kPl8jH9qsuzWp+SDA5MQbAcs2o3kV1jrXKUBhQXU5sp9OFmETAnIdT6ZHIj5MjlIcNr9o5xUJ2hdZS9BeP7P62M8OAEZrC6e1b+VIcHAGrg50LKYGzn644h7m7zbSeFtXB6irLOFtV9it1YQbH3SMGDPPqKeL2RLj/RayNnxSv5aq0pSyOyStqcb3KBsrt4RuvPKOt9ur7l2y+EKDLCWXnt/P3WkmV57bETlHPRyII8hCxvh8mbcyQ7JOPLMfnt6zOeN8j6DgLCKUsujI8B/luAc1UeXV2z0Oe0HB4IsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNtBnashhmGeVPFW51jdovoNwN3itVBUhBqQN65FoI=;
 b=wzwvv0bfZfYUtkMoMIF7/Naulann1quPwWRykEfpN8BVZBD+wV6/JpvqxVi1i/yj1rLzzJuQAOqoiZwRkm0jzCdRp5E/mC3ghD+QJqFPPX4dp8/BLBZOVPSwlkuVSqglqy4WEimxbDg6u49+OnJAaWJJl4hf1Pe4uyCMHmbpbpBbkN9e03EAvD+2xZvyTbVnvAmVq3FORoAg2WV6phbo0pLCz1rzpbOxqKxsh/1Q6cUBvC5oYE5ZKPnIaLkVA/wjLxdA6EsYF2eCiAI2HiYsWjYFBNhejGt5cRpdlLUv3mf17rrJ2WPnqgFo1pz93Q+1N3EnVAWb2lI4gM3hkmBThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zNtBnashhmGeVPFW51jdovoNwN3itVBUhBqQN65FoI=;
 b=0fQE/TR8dTed69lH4vltK1bFCCGFOtNZ8duQ/OCpnPVssDyM/yfhRcbEYmtfkEACJ3753DRxc+TNPtp6BDp/CDLczBzhmo4ZuohpHfH/KP8/5aOUau/7MRJFGCysn/tBdYc44Pvq6UWF4VscSgp1pnZERXyRTEh71q5InRhpVCnPiA3HugZOcr2AU7w+tlCh6b8eIxkBJBMn862sdLlPPOCmdTPeilE/GUvG7+HXAeTsR5UIqhNa9/NdgWvMUA5lALU3XSfMVwEEFUiZw1alDqLnHZrM2TPtbJ8xI0O28q+STvn0B9JBPwDVVHqMTyYgb4yaHrFm2hFmdJKGy84c3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1277.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 14:01:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 14:00:59 +0000
Message-ID: <274a871e-1105-4f2f-903d-f49aaba44d75@est.tech>
Date: Wed, 4 Nov 2026 15:00:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/4] rsync: upgrade 3.5.1 -> 3.5.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
 <20261104113822.45520-2-jaipaul.cheernam@est.tech>
 <DMMH5MBL0Y9R.19MJFCNHD82Q7@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMMH5MBL0Y9R.19MJFCNHD82Q7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:10:110::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1277:EE_
X-MS-Office365-Filtering-Correlation-Id: 93592776-8e07-4fbb-2f8f-08df3a7c0d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261022075727099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: enK2+tViq0b9gtOK29CM1Gs0XAu6qcQ7wyaQZSVaarLHHL64ckvxrWijRYmMnt2UvAxSfKcDLneEN3Z8nQVed35kj1LqXardKBeW7IrIXh5rYg/S8o9dwokgDW8R523Y9u7Wc8VeBmQarubwDpu981+52Np1PCllgHjfjV6nDguslxgS0XwirB6XU0VUeuB9os1PnmDkB3RHGiLgDeVyOscgWnPlPXKSADZfvpnIQlPJIq1+r72HiZH7EUe03bkPbHQU8c2Ncbe9Vdg5MukZM3wVOlxXdJI6skDetMA7OdGv9nTgunys2UQKB50duzCO6KoYGQ1cyBiciDJBWW/99oqanFzfnn2Duo9zAucgqiO21C9q+hRfe8oNPKiart+O44JimZUmHvL32n1w0UHCr+St+wYhOE2Oq+QfpjcqRYax2HnQSFQEccCiKp81IySOwVmCdWuzVnatnspyWwI8jA5g+ZioCTNJ74NGFCHXHUbXzcAu+uTNa+4dGdybvJQfn+CIqcOW5ad7pl1S76T8usirgQ7tAjrsGbn4Pf08hWPLdV2qlocEr10z9YMzT6JQdk6AHYYoGegJfEt9AHwOjfCqy0JTsG8q2h97+mmMFiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GoXkEJAjfDiZoY/6Yvn+j9zLZh8xn0/eHO9hRru7J8Zc/1jiJGusDcNkJfgK?=
 =?us-ascii?Q?jYJ7BEMUHjOtxG9w84iperpJn3YQ5olv8LurON8Q2HYVh/gvkLVj+ZZMCQDL?=
 =?us-ascii?Q?PHvAexNL/Mv23Jncnrv0XjzGdvMPFDewGNgsEsKKU2mftHDp0d2H86D4W0hv?=
 =?us-ascii?Q?cjTZ8o+5RHQwYuI67I5LkOBnx0ScbO1ZJGwkhMopuLXZWrDTtd4ZLPYEcedt?=
 =?us-ascii?Q?GYNOfxKrs14ExzBulO0Nnu1W66aTXdiBCwdfyxtZpO0y45Q5jkGp4E0X49gW?=
 =?us-ascii?Q?OGto89M2H35Qa+UQLAVNzf466QDfSdpFapDqn/d/fxAIcEAUviRgy+7BqWYi?=
 =?us-ascii?Q?GylMhhDmx9Msil++TNo75GKm0bwQ+pyoZfyqyYAQvwGpYCV08s1wp8cZ/G8G?=
 =?us-ascii?Q?8i6u94AN1K+WBmds023g0/V9/xJfHckTH7WV7pr+aNOMuFTcfufXqh+oHvWX?=
 =?us-ascii?Q?ynxUSAscmlmF3wZy4bFcenhMeJkcbOC7IoA8O7cQiDVr7UH+XWT4qPRNEvMm?=
 =?us-ascii?Q?2Ar7w6vEwN6+ghsWiVsSntfjWNahTSdjJu/x45lc+tl6tQfTvcjrAnPTPWXO?=
 =?us-ascii?Q?Ww0kM9LlocQOucwI/18Wr0erRvEKv6VIOorcyDvXxhdRXy5wJiYFA0N66wU/?=
 =?us-ascii?Q?6IFl0iVc4nsdXMuiSSuaxyQHR/hwonviCwuMoUTrdwo3beh1Ni7QpqaM8DJR?=
 =?us-ascii?Q?nuNQHDTfbeoAUMo4eSuVGzeScroJi7INkxzEJVOaaH5bD1nJ/t01tbplOwZK?=
 =?us-ascii?Q?Z4Ox5Rcc9W6kuEQ+gfHqC8+rwsDU3NvOlOkiy5CAL0D7PN352uH7QXiqJhYp?=
 =?us-ascii?Q?r3kJW3dxdIJ7zSnRiYyAaYK6sANSQBfefAX0PRiplVsFVzen5Awj9IjTixlO?=
 =?us-ascii?Q?FX902Uah+gFtL5PbXFuyI3k46Xp2PJbX8Od9+H4F9leJ3GVcQJKlm9l27dP8?=
 =?us-ascii?Q?EImWNxg9oo+MavG6c5HWRvZkLzwGvpbQOka5nAIp251L3k1jWwG5L7YQ7ckm?=
 =?us-ascii?Q?PyJ6syNtBe/PkaMbFrAkLWirpkNlf5svGaDgUxigu8D/1C249yvd3Vmcq9+S?=
 =?us-ascii?Q?87oNQ74Jz5vmHI7fdLnM1XSoNLC2c2MCWFUUC9k2UPo9mdiSqLB+ogp7Wmsj?=
 =?us-ascii?Q?G1lO+Yy1XEFfNAbb5v7BoqjpGAUjSAFzOAAllsiIi33BOJbTR5JduaKKS74r?=
 =?us-ascii?Q?gdzDzRxZKxB+fIa8+cZj7grJ5oCBPAqiqX2l7Sj280QLq1+XARQzhig06EiY?=
 =?us-ascii?Q?+SZX5Hb1SqwZwJT4SLfD23YCEwDVAwM2V1weGm6SiJYMo26c+c7vQ4Hhq61+?=
 =?us-ascii?Q?Z969x5t+WxQk2qElwpvaQi8iNiMEx/XzuoJlSAL7eQFAVU75ui9yI89X6sK7?=
 =?us-ascii?Q?Pbi6MpqsRdHR01B5t08TwUroOdHGHTul2z9s6DNoLy3S5SFJIzDO9iXb5Gt4?=
 =?us-ascii?Q?0onexFOO4FTt+YODNosqAMmGknuu7wTsXb0M2l5q8c92M3p9vP/FRYnT0syf?=
 =?us-ascii?Q?yKDK+BvMoiezjvF8vqCRLCf3SY0ou/le687E0i00DXIIv7Tah24iSGBCeHIh?=
 =?us-ascii?Q?/yU0aCvTjYHCTIuwFcoSByL7ywB2cUanCOErXKuNa2+H01I/EqRYkopQvTJA?=
 =?us-ascii?Q?l9gu7AD1pI3OCiH18EMR6Vjcw/yrbmr+7WnxbecGXDkVMDFdrVFCHBKgXVwv?=
 =?us-ascii?Q?M3a3s8dsTdvjp8LaQOL99+VKiCfLFokNylGEWLtv5cx9Jn9Xo6NGHzH2Xgml?=
 =?us-ascii?Q?rST8Iy0VWg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 93592776-8e07-4fbb-2f8f-08df3a7c0d6f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:00:58.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV0ARRXpxY28hhOD1U2l3H7xPvf8qu2Q6LYY014u31Qr19vdnLAwzFWz0L7w0Xim0Ic+90MAgs8OBicrv9L2fp7FKCoj9ge7knYH+abBSe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1277
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 14:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249382


On 2026-11-04 14:52, Mathieu Dubois-Briand wrote:
> https://download.samba.org looks down, so we can not fetch the sources
> and put in in the mirror. I will try again later this week.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5054

Hi Mathieu,

It did worked for me this morning and yes, now its failing for me as well.

github is working , may be we can=C2=A0 change source to github if issue is=
=20
persistent=C2=A0 .


Regards,

Jaipaul

