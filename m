Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36712CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 09:21:33 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.17])
 by mx.groups.io with SMTP id smtpd.web11.8717.1757323286680772588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 02:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fy2m9Egl;
 spf=pass (domain: cherry.de, ip: 52.101.83.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGuYUNN0PoPAz64ZO4TRF/OCfKcVJK/6nPvgLnU3tpD7tyae6Fjkau6DPEb4GWq9xNDXN6AXahBkyd7Ijm59PnXyQFqntspB3zBoCD/M664C53ozaT/2hQk5HUk0qBC5n0+v5I91AG5oa6TtfQk0RLZqPnKTi17KMibXvFgj+r4RTQs1r/xJLnYdKcLdEklDHQY8AyZqx2IIfNl2gx7Lez9v5s/bZcGj8EEwMX2CiTUocCHDqVNEBonbSeu5noPnEYdIrYn5B7zwTBYVSSGvm4LvjI+s3LxcNAOLhwXuO6YumXFSHRayOakM4qp+dNZO7bo8m1ZDdeUm44XBUeAWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znXrh5YsshChMJUizHNAZhlRNeyJ0omAsyAuKJneU84=;
 b=Wlb/R3pauNWLuOT/adHEcYcBuWH2hGZmCHTPBxkvOM9nuAf/VzsFkUPemlfC8c5IKN8BErExcF3H0C3KPO1t9KEY/U3ogjZtnsYjxrcEvkHLpoUaf4WeOOPuW0KmkY/kH7NOdaq4UIFJK1GCnY/CY+l6dYxS8BC+FDNgL+9iEQJ0JnLag/hizlv73hLNnZRKmnh5Ubim43X7TXvj4OmsF1Ko8mItFs0ZzRyJjw/A7O40LbYCdM7Q8DAdSAnu9Q2y/9Ahx+PTdo9vt35352jIWgGha4AjyxWvl7uzzjL/CUU2k/t163ULsWdvNPsgi6sQIPdrzNO3K7X63IgpHkSMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znXrh5YsshChMJUizHNAZhlRNeyJ0omAsyAuKJneU84=;
 b=fy2m9EgltgCNVzeJHVCgTRCNgGReoklDFoo1X6Q4Oq0hWkZshumdbulH/2mbRrZKtHeez6W29HNt8Q0y7LCcs2MLJv8Fz/IUbtRIrfzZhmcxrB9QAwIxMtBo/3qtkVZPIpeD5flBFeJE8O53+/TmGVuGg5rp6AKZXzlXJ71Tj64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV2PR04MB11447.eurprd04.prod.outlook.com (2603:10a6:150:29f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 09:21:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 09:21:13 +0000
Message-ID: <0956d894-380f-4569-8979-49610079645d@cherry.de>
Date: Mon, 8 Sep 2025 11:21:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] mesa: update 25.2.0 -> 25.2.2
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
References: <20250906062034.667458-1-f_l_k@t-online.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250906062034.667458-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV2PR04MB11447:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd8b2c6-032c-4dc2-0411-08ddeeb90e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YkphMXpDVnlHZWJLMWE2S0JreUluMjU3eitVK3NiUlcrRHNpU0EwYS93SVFH?=
 =?utf-8?B?cTlMcFZsVjUzK3NxVFNZQlNId0pLRXRLTVkyS00wMUtvcDJsUUNIVHFKN1J0?=
 =?utf-8?B?bW5OaENZY1VERlBQN0RQaWRNa2liU0FNTUl2d1F2a0xwLzhkbTNiOUUvYnZU?=
 =?utf-8?B?c2ZWdk9ISmY5Uy83cjJXTFJ6MUt1TUZsZ1ZpNjdjNitHRjdjbUNzTnNMaXpx?=
 =?utf-8?B?S3FzdGtlRjNhV1l2eTJQTGtOU2MyakVLeEpMQ1FuNVJBSnVoWSs3c1hvdTdq?=
 =?utf-8?B?M2FHMDRrcUluNFFIRGlkVHRGUUdrMFN1NnRrUzVpanZBSWVIaEtLTm03UmZh?=
 =?utf-8?B?YXVBZzEzYjNMWkl4b0l4MWRzcG1iYlg3blJ2ck1vdUlBVlVQMFVxa1F2Znkw?=
 =?utf-8?B?c3RNWGU1NmRvUk1Gc2hGMzlaSkR2dHUzVGR2WXBDN1h4c3F1WVVMcW5ZbnpX?=
 =?utf-8?B?dXRQUGM5b1Y1UllJY1BFMEJ4TmloQVRNVUIzRzZJN013KzhaWjdlbDFRcldt?=
 =?utf-8?B?TTV2bm1CZ1ZjakJaa1FtcGo2QUp5VE9CQWVYTXkvS2plRUdDNFpqMERzeXMy?=
 =?utf-8?B?S1pKRkxLZkVTeEZqKzMvNitsZUZURi9JN2k5UzBiaXVrMXV6WDd6UXJLaEtn?=
 =?utf-8?B?WDR0UGZGVE43SmxuV0U3TFBpeHlWYm5lUVRoT0JLYXdlb3pydmsvN0VNeFcx?=
 =?utf-8?B?Wk9HVyt3bFQ1aFNSUld3TFMzWTlpblVlY1Zrc3FSd2VybGFrenNGOXY4QnRz?=
 =?utf-8?B?Qkt6THRpYmhQdXhSdVpBdTFxLzdQVVIxV0pGK05nNHI2eExUeTE4TXRrRnJG?=
 =?utf-8?B?VllyTCs2dGc2YXo5SmZQSVYrVFBHMnFhN29TVU9HYUFMcEhNSzVITURKcGtS?=
 =?utf-8?B?QnU5OUd0bmhCc0U2T3FtUjZwUU55TFA4MVRSN3hjNk1EbGRMelV2Zk5qaE9M?=
 =?utf-8?B?eVVqU2l0bW5jZllpOTN5Rlk4dWxiUFJzUk9QTWN1d0dWc0swRDFRTnJmQ1E0?=
 =?utf-8?B?UzdmVktWRXJsMFNRcWw0NEdlbkhZMjcya0tHV0xheXUrOVlFS1JVNStHdEhP?=
 =?utf-8?B?LzJhL05vVDlBS0RrZmdiNTJBSVJvWGlJNWZVeGtxVFVocHBpb2pkQ3FPNUlp?=
 =?utf-8?B?a2F3RjFweHdERENzclp4NS80KzJNWFp6dlFkRU9zMWdnL29qeVB6TlFsODEv?=
 =?utf-8?B?SHF1M1EvUXZ0bHYxYTdtYmVoTUsvWk1FaEwwT0M4QmpXSlQ4K2pTWDIxTDlT?=
 =?utf-8?B?S3B1eGhLR2J2OGR5ZUJ3OVNFakZPbzNHb0p4STNEdFJkRWkxSFBqRmk3RUF1?=
 =?utf-8?B?TDhGNUVsTDBkWHU1b1pZZFhYOG1FdjZkRytZa2QwQWg0L2hvWjNRcUdJcmZM?=
 =?utf-8?B?ak43S05KbW5ZdVBtMFlveDhPbldMc2x2UmV2eko0encxeFpNbHFyYm9LM1Yy?=
 =?utf-8?B?dVpwNldiSVJmZ3JidWx6aGcyNll5RE5TcWZoRHJIUnVzUmdyRjFtSXc4dUVt?=
 =?utf-8?B?TUMxTWFpSmlWVEJwSERwc3hOcDU3SUpSNE9ud2VwOTdxK0IxclVyd09wUU16?=
 =?utf-8?B?YVNMR0ZZSlJSZWxqTUNwTzI3SldqZHA2dHg2V2ovbGpKbHQxeE4weXhZK1NF?=
 =?utf-8?B?eVBxY1pJZEVueXdyK2NxcU9YdFlkVHdNUkUvbFVhTStYZ3M3SCtBdjNqT2tJ?=
 =?utf-8?B?MVpMejZreCsrSTRFNXBFQkhBZFNaS1RvRmY5NmM5RlYzN090NGJKQmxqb1Rr?=
 =?utf-8?B?bDBsb3RNd09GN3RzdmgrZCtOaDRHY2xPS2pmV3ZxeCt5NFdvQkJyUEFEOWFR?=
 =?utf-8?Q?uTfeFaEemW6eFthVuY364HSV5WFvqqvMEX7jc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UytEQzAzSTN1Slp2L21XdUZ5ZVNmSk5HSjdOSFdZaGNSb2k3SkhicEZKWFZM?=
 =?utf-8?B?Wms5UVViM1JTczJkUkt1U1ZocWpuOTZKdDBnamsrS1FIS1N2S1FwYWdFR2NC?=
 =?utf-8?B?Mk44aUF3eml1VjR6RDVkTlRaQjRxczJsWkRiQnZRTVRTR1Rzdy9GbGV1NjBI?=
 =?utf-8?B?NXRqN0VmMmVNcnZ6aVJpdW9lWng3TWdRbDNOT1R0L01weGliTXdJTTFVUHp0?=
 =?utf-8?B?N2JCM3FGaXdZTXBzUk5OM1RkcCtvSkRvSmpOaDRKMVBCMTJ4eFgxb0hReE9P?=
 =?utf-8?B?M0ErZDNFWnFkUFNGL1JsT3l3RXRpeUVCL240NlE2RnkrMitzaXZhektkR0JY?=
 =?utf-8?B?U1krR2RYdHF6MTNXUDJFY0p6dElOWjhBNUhBVURxWEdQb2wzTVhmUC9sVXRo?=
 =?utf-8?B?Zk9NcThTb2g3cm1ZQ2E1ZWtsNStEUTFjTyt3aGNLZDZORDVna1kwUlc3N3Vk?=
 =?utf-8?B?b1NRR0xseGc1Y3IyQUNlWktENVlXWDlKVnloR3NLSUwyUTVTYlVXK3pValc4?=
 =?utf-8?B?cU80N2UvcGozWTIrWXkyYlBYOFJPWjkxVlBZSEFvREoreFl5Q0cyazUwdC9p?=
 =?utf-8?B?SXNjSTUrTFpHcFhORGw5WC90ckJjSEoxalA1R2pqQ28xdnh3elNOc296Z2xK?=
 =?utf-8?B?Qldsc1RJYWhhSElVTjFOeW1RbEtqd0pmWS9nQmJsKy9sbzVqTGhRcG1UcXVt?=
 =?utf-8?B?czR6Yk4yOEJ1a3NPSWVoN1JmTDRYbW1DWVFQclBOcXA0dmJCMGlvcXFVaEJL?=
 =?utf-8?B?RVFpRUt1WUE3OVV1aXJMaVNnNFFCbEZWbEY3bjFDeTR2Zy80MW9FRTdWU2Ix?=
 =?utf-8?B?d29XTW9zc2dXUHJYWi9KWUtVRFNZOE96L3RoOEJIajdMNVY0ZkoycExCWEtu?=
 =?utf-8?B?VWVKell0MERVOWpjTGpGTGNsbXk0MjNJOUR5TERpNnBteVlLeEdaWEZxckVV?=
 =?utf-8?B?Q0xGWmIwTEQ2SmV2S2RCdWs4Uk5DeWlqWktjbHVteWhjVnQ0cGYwNllJNmE1?=
 =?utf-8?B?bnlYblNWRGtWNWkvWVZ6QXBHa09QNlI5a1Y1SEc5YjFURmZSb3ExZEswb1R4?=
 =?utf-8?B?V0ROK2dpTzZ0Q2Y2U1dnY0gvY1A3Uk1CVHlwUDBYcHBYWkROL2x5OGVFV0ZN?=
 =?utf-8?B?ZTRGcnQveFBlcEY1OG4vSE9WTXU2aU9rcGhUczk1ZHZuOFNEVzVlMzA5MlRn?=
 =?utf-8?B?UmJnbEdHY1BuYlFNZVJneEZJYlloZnVFaXpEdFZPcUZ1STRTdnYyS1RBeUN6?=
 =?utf-8?B?c3RvQi9SS2JadVdENjlPeDMrUzhPNEdLemtIcDd1c3kzRnBZZ04vRnpjMUhS?=
 =?utf-8?B?TDlzNjRMeDBkaVRTS0ZmN2RLa0Q5SDViMWtsV1pzTENSTlYvcVY1OW9tWWRT?=
 =?utf-8?B?QnVNSVcwYmxpREp4U0wxVXBycFF5cHZCL3NUVkg5WW5ZRzlNd3dxYk1HVlJH?=
 =?utf-8?B?SVhXRXpJdisrTlhiVmhtS2xZdVBKbzlTalNSakp6dVFFaEYyOFR6dVhEd1Jw?=
 =?utf-8?B?TEwxL2E4NjJjNWdmblJTQ1NXUnNzQVVOdlN5NmlpRkFWZ0tQdURGamRTOEJS?=
 =?utf-8?B?SllvYk0zKzJyZjZwUHY3dExQZzhveWYrdm5XTFoxVXhpQ0txOGsyOTBFUDZ2?=
 =?utf-8?B?eXNqTHVzQmJTQktjeTQrcWN5Ylh3OXhXZ0tUc0VqbHppU1U2MEMwN281MjZH?=
 =?utf-8?B?SEZ0RWw3QXUzQjlMTTdYejV3SXdaZDV1c2tmcTFwWjkvOXIxSStPOGt0MGVu?=
 =?utf-8?B?YWYvZ2xaSmphZUJTd2VzbHJUMHNUSFVPaFhwUWN2SXNROUsrMVhSeDk2Rlcr?=
 =?utf-8?B?cVcvZHVHWFUrL09jbVpnTUp0c0NMOFNUOWduZkZ1UGZYYVdiNTJTZStORWxj?=
 =?utf-8?B?VUJydWlxV1gySmJBc2VYNlpYRFFiYm5zbnk4MEZYUWJHSTU2azVlcjZvalFS?=
 =?utf-8?B?SDZPZC9KaGFlQVRYNVVPaUQ2SEcvVTZCeTRjUHJycnZZSk5GMnFlbFJWRmxE?=
 =?utf-8?B?UVdsbXJhOVpDQ2ZRRnA0L0YvRGl6RXhTbnpKemRwd2J1c1RxZmNBYXBua3J1?=
 =?utf-8?B?TkpybU0zbXdjUThFZGg2Y0VpTFdZMStPdFFneHd3N01NajlueFZPdDI0Ky8r?=
 =?utf-8?B?RVNqMnpaSktPamNXK2ZIbzloZ3dhSk54LzNhbnY4YWpjb3h0UHJnVGcwaXND?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd8b2c6-032c-4dc2-0411-08ddeeb90e8b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:21:13.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kDot9ufsU1g5zpFGdg9NqxcocMka8HYBDIbywg+ZdtSOIIrSVmatz5CBDtwRu1+cdy4O8FKZF9tj1NH53jfsth5Lpm1Yl89Uj8FUfL13Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 09:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223061

Hi Marek,

On 9/6/25 8:20 AM, Markus Volk via lists.openembedded.org wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

This looks ok to me, though I've sent the same patch as part of this 
series: 
https://lore.kernel.org/openembedded-core/20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de/T/#t

Would you mind giving this a review?

Thanks!
Quentin

