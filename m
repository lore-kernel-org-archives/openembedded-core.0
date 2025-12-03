Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EEED12D6D
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:19:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16294.1764771547060164478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 06:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=R1Lek/eT;
 spf=pass (domain: cherry.de, ip: 40.107.130.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYQ5XbBTh8DAAqZbW/QGTY4C3owSYMdf4uR08jQJVA+bkMiDlaBIpbPeUMIpoMjKfT1loSkMDioVXW+3EzfW89T3gB0Ch0Ao6ABDeRALNseu6qBx3yUrwIBZz7MJ6PtPFn35rx2lNJ/9HqeuTfaIW6zbHWDEQzvDcQtq2ZJ8axX7mIChgJ96zqQYBCy4V+e8HJLYwQrOYV+lMdp40v0avId+OVwv2dGWXTG2NrQJQNc49NT/Liwxy08HIKtzhKZ9RvnVxbJfu3Qs6PLJIln3bqYvjMZUbRibwG0BFTqKAHiLiMopRFckCTjiSqHBY2fFN15TTo4XKJW0Hq34MRC12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Wi06HqnMi/BsSTHsglhHyD4t8cWEDadJcW5epEDRsg=;
 b=tAhPQ4Zq84Q305LXVJVF6W7mRHXLmE5SSuQOMDS3bkZ4wX9uQgbNfP+RWDu6fGueZBS+uoF98OjA8Jk1qOSgozphAKgDV1YQsHgIsHkT7qcjhJVBYOBF0QXDBHh9EWs+gLDb305wwq5Van1c/LZz6406MsmLvFodQMg87ZbGpPKpBpkxqa99n1V5te8z/2W+QD9G1ZS1kWORTS0Nv41VJwvuk/Pzb+TZ0zMj1leVXljwWsOFWsDDPXcHAsu9WDafXWl1GjCIpbgyZVA2FTllC/iK3Pnujt2LUNy3qeWTGZooqMob6sKpu9Kk6Oh6sZRdaB1lh+r8BV3o0vk5i/PkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Wi06HqnMi/BsSTHsglhHyD4t8cWEDadJcW5epEDRsg=;
 b=R1Lek/eTioD9GMIdAO1x73bQjEeVw95Hq3dSk64vdnY9WqvFg7Ml1k3Rm2mOi/hmdJkqcZGdxrf8MSOefc15tVsoAVxZ1AVdCED0i6nbEoE7xN0pcctZAfAJyM29iSmZ3NCuqG2Aab/a4WZcuMc/cVs7RM2nmnZruiv+y87aKU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:19:03 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 14:19:03 +0000
Message-ID: <978ba43b-8ad4-4034-bb43-c5b8bbf72e60@cherry.de>
Date: Wed, 3 Dec 2025 15:18:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 2/2] mesa: drop freedreno-fdperf
 PACKAGECONFIG
To: dmitry.baryshkov@oss.qualcomm.com, Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251030115415.2566247-2-dmitry.baryshkov@oss.qualcomm.com>
 <C831BC71-F6F4-4D2B-B8C7-BDE128F16745@arm.com>
 <d066656a-dc2e-463b-bac5-fc56b48fc859@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d066656a-dc2e-463b-bac5-fc56b48fc859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: a59458dc-3543-440c-a62d-08de3276e8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mQIY3c4EwfNmskqIsq4viXdZZ4phIAjCJ96OjDWiJ1mRwwiqEJbDYQioJmHW?=
 =?us-ascii?Q?tXhvgjgYedsBeGppoA71/FqDTIwY94plurBZ3ssLYdkj7FF866b+Go8p6c3h?=
 =?us-ascii?Q?xcksUw4SwQfliBFTLntutePBTC+oG4MGyeNvHaruFUayDWeeQkn8CbT/BA/P?=
 =?us-ascii?Q?QOpanoRiLp5T5t1vWGXFhJTO85hDNcmKTbCS0FGduI/Op759bcRoH04vwGgY?=
 =?us-ascii?Q?C1vlIYx9VHiMS9+oLpOXAQgUcfF9ZhXnsZIs9sPr20GZbFtwwluU/yxjx/tZ?=
 =?us-ascii?Q?Y0cQ3pPHzAGCPoeJAvPq7vHsj4WtqdrbInms+20rMlIP798bDvAncmr32qZP?=
 =?us-ascii?Q?YzTmJ09NI56Kb7/snGnIrpKGAcKNoZC0ZVMSUhjiHgBNJSHxoJL/6S2QIoQv?=
 =?us-ascii?Q?Ck3QKvQ6bkkbALGRo6uI057ITlEdjxd5uZa4Zd9OiskFDKZKc+xQnviTWBe7?=
 =?us-ascii?Q?qqb+S6KkOoLU2tyNUKrgcg7ducxbNIAMGSqJ6XI/s5xefR7bls9olb2b6AnJ?=
 =?us-ascii?Q?oaOwJnT7jpjoYIX4ArjBsk4gw7K9jJ/3Y3wXTwcRncX7D4yPrw5aMefL1RC0?=
 =?us-ascii?Q?URP5Lh6vWbaeBtwMxXql1R1Yl4E0EmEIfN8Fwpmw9urz6KwEA3NSVoB0MzYy?=
 =?us-ascii?Q?90mgz4NWe5Pney/3kohBZlGeOQrhqk/a4CKJTSkzA3+offc/S9SSJlRpn3pl?=
 =?us-ascii?Q?gUvNkJ8s1lDwbWbyRi9mY27VBJsWmeWAYMp4nxpuz8AIOUl2LH6d+Wmjf9tS?=
 =?us-ascii?Q?gbHB+1p854tTrgrQdtSq/nCJL5ccXUf44zsDZ3MFZZmFpdy1jpPvSSAYmX3a?=
 =?us-ascii?Q?KWx9B9DEr5jqnemzcLbQTiaDWWpoeuEFR1M/EFOYKq/hVz2zZBt+5N3X0uLc?=
 =?us-ascii?Q?lp7xZG1u2g9txy2ArEGj5z8SU+ZLpFMmxrFNraZ73A4k4T1PotMQfLFakatV?=
 =?us-ascii?Q?qMXwdXdY1BOFV3VvncT1zarmnDZpcxO7Z490ts+2Kux5anqsXaF6CVvJZQUB?=
 =?us-ascii?Q?iKxBtThfhkSGeQo+sO+PfNY2iY7c91t4IjWfLdFdnEgVMr++Q+gS61Zb7QKK?=
 =?us-ascii?Q?rRvBGN0IOTmpWQK1u9mbRCPpKwdKjkn9JMN+9RpFWZbYLrLBkb/026Suzbrx?=
 =?us-ascii?Q?vemMFw55ES8l+dGPl0l6SHWybsVeSlIZ7XuwNb1YTon1oTIO0VXft7PFkr6n?=
 =?us-ascii?Q?bwwRZgc64M/pRblaYfhddNL5U/UI/QlUfaJSliilhKzjb4lpz2oXYP+QjCBw?=
 =?us-ascii?Q?5f2QolHMRJD8RNflpM/9sSy4vgNgdGUJ1HwLaxGy78Z0oWcUDUxaY1tt+/AF?=
 =?us-ascii?Q?0xbpR+jrMGS20M5Bl0zrWK7JEHNp0XTHAgvGu8oXSOIHGPKxbX0Y/y2yoILp?=
 =?us-ascii?Q?lHO5vSYlbovGuHEPGkNyZgP7Ygth/+byj96zhd+icxfFODNtB5zS9iqjQ4tO?=
 =?us-ascii?Q?RPpJ9NQZlWTKZJ2PlqrrUU3JLX6Qrr1S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?safOQgArkGwaBUJq7sCnbEcvRQnigYB0v/DocmclK7pjbC/Q4NIW7gKDlKna?=
 =?us-ascii?Q?dtGOHxGVE5j1zllEtd04/KuaIlsG/RpsvCWgM49PAz8w4fL6kQK6p/u2E0CY?=
 =?us-ascii?Q?+cYq0EioxaN7PmxUV+XEbySiZXQHtdlRo1vID8GtZ5ZcAyVoVrcoUl9qNGqJ?=
 =?us-ascii?Q?HR2NVtVn2Yk/s9VHI6Fg3Pqz/GH37OlT5K7uq3gPiWiw9dOcG+O/ra9VxTGe?=
 =?us-ascii?Q?QnpWGXu8Wjrasl0OQukmXlSS1FLdDLPMmtC3E5evJdpgZttMppuR21Jsttgs?=
 =?us-ascii?Q?lnc85/DRnJnktU0lVuXoAJv5/Tf4iKG8+Q4cE9FjRNNpYUbuM1vlFhJpuhgQ?=
 =?us-ascii?Q?0hxnELSnbO/xlonsojSytXHEIRUcSgun8jNzX8gZMlQv02Y9/6k0yrJN3h/P?=
 =?us-ascii?Q?t4b3qyrvhs6ObPHLLuDu07eZtJ/zJM3y45hFDhllMjOLHNALG5HbsrnWcoWn?=
 =?us-ascii?Q?gJbIN56/2tiwFftaAPNz38yLMvFjC0y5VcrzoDIfh5V/nruBVUbWhUAj9//7?=
 =?us-ascii?Q?t1eyuZY6ByZgytv0ddsjIhodwhrTxP9Dko2Wrk06c/MQO4B8IupG1Fceg5M7?=
 =?us-ascii?Q?u/dF0+GcOrJB6lLcRKVG7y61rZhocXFRK5QXkAfSeSV1qRwZ8FyPYG9TdqeD?=
 =?us-ascii?Q?5Cqh3Nfn4j8ulSePzQMQeo6WEtoBv9hFeZ7bHunz32VmgK49VRHko4TVfPHT?=
 =?us-ascii?Q?28WgeQkLMchZ/GIz8FjREANmMiFpJs/xRyq2woVxd1OLeRRw26+WJMLamM0U?=
 =?us-ascii?Q?16deHaaQbpsGl+ZtRYpeek9uzhPpyHi8SwXnQHm7+QV4Ok4RwPSmljJ/HNby?=
 =?us-ascii?Q?1H3IOlL97dm5jwMUQ3zvWkVTKTz1mI3YXCZoim9MYeoB4nqk2JMSfH7bwEFK?=
 =?us-ascii?Q?hOyCInWxneF2G4Mum0xVbyx/q1IaDc5sntfMW3Heldkcu21NFOVpModSPlGG?=
 =?us-ascii?Q?7g8E+rPYaxdSIa6FVPFYE03c4P8L6ETucGSd1ujwdQDrPEO9E1nIbGGCUUtu?=
 =?us-ascii?Q?qr0KhEK7jvEHaipX3d+Y51ShxkINQ8X8gmLnZVlE4qofEum/YKlfQlx8Eho8?=
 =?us-ascii?Q?NOz9YMPAwZ2piJlo21aMthWwMOHupIw6vnSfAZmcyqADOCoSquDXTO7bYaCT?=
 =?us-ascii?Q?OR6TB4e0NJ3iiapfKdey9YaeifD+8p1P5MJnAIlt7HkYtqAJeY5MT0fJV/d+?=
 =?us-ascii?Q?x2ZAwvn+Lv5My5D9gFJ4GkIsPGOudTxwMv8b9zngkYN5CTD3ReePeN5tulbp?=
 =?us-ascii?Q?BDsnrnt1vZCgM2BOMLgxV5bWO4+1FCsERLfs3lvPNVmctZGPurVKNlUNQPxb?=
 =?us-ascii?Q?k3eC5AvOb+9DdThySaVI0jsrxUtFXQZD41CgbMsiXaPbXc8BcN32E1UjNW6+?=
 =?us-ascii?Q?PF97OXQcXNFW9XJbyZwnJvQJ0fPQHA5OKK9beTUUWubG5T7Kl3aiJ3adZudw?=
 =?us-ascii?Q?03PWavPKRmBgDebekPFpezk9WAqE3EdAH3zLPF2zfSCFZmKkOvbUYnXtrjsM?=
 =?us-ascii?Q?cMDZJLkvSyigWmPzvy59ZJwNgQi7TuLWSKbp7UJ6U8w1nqpPNJDYtbWp/wWR?=
 =?us-ascii?Q?Yhoz7EO2hy9xRaOLcy8jQMqlG4EN5vI15B9rM24kzhkIz++oI4Lh/Qr4FR1L?=
 =?us-ascii?Q?O0u0i7o1DSkdTUjT5v7w/nk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a59458dc-3543-440c-a62d-08de3276e8ed
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:19:02.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwKdwyHM76mmD2Ar6Gw1SxAVDTLCwiv5Xb6VHRZoWeDsRMUqNPUVoTJUT8ib7eYoT6FG8U3Kgjs16clLBuliY1WaaS4/GRaryBWDAwrCdv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 14:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227229

Hi Dmitry,

On 12/2/25 12:48 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> On 01/12/2025 20:00, Ross Burton wrote:
>>
>>
>>> On 30 Oct 2025, at 11:54, Dmitry Baryshkov via lists.openembedded.org=20
>>> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>>
>>> # dependencies for tools.
>>> -TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>>> 'freedreno', ' ncurses libxml2 ', '', d)}"
>>> -
>>> -# the fdperf tool requires libconfig (a part of meta-oe) so it needs=20
>>> special
>>> -# treatment in addition to the usual 'freedreno tools'.
>>> -PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>>> +TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>>> 'freedreno', ' ncurses libconfig libxml2 ', '', d)}=E2=80=9D
>>
>> TOOLS_DEPS is just set as this now:
>>
>> TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '=20
>> ncurses libxml2 ', '', d)}=E2=80=9D
>>
>> So just merge those together instead of having two assignments for the=20
>> same configuration.
>=20
> This is exactly what should happen. The first line is removed by the patc=
h.
>=20

Please rebase, we don't have TOOL_DEPS:append anymore so this won't apply.

The change is fine otherwise.

Cheers,
Quentin

