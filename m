Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63C7C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:12:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.65])
 by mx.groups.io with SMTP id smtpd.web11.7781.1748945551262345820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HwL03iWf;
 spf=pass (domain: cherry.de, ip: 52.101.69.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAfK2UZKg5pYNMJVLtGfZndAiuj8hmZ1tYrnSkE4gaL6E6fe3DwQAKkRansU87orBQDaotNX/QuddWt6QRPy4sq3KhtyowWmYV+wWvCpJPSVIMx3wWEOXCQ43LMIECLEbhDCft3BjkykQ6pDoj9AeHSmfwa1zKQwuiBUvP9xmqsKENOP+hIEzCVd0nQSBPkVsD1YJHmE7fCh2ne6sa0Qorooa0AIU7Jx1Bd+M090t2L3vz2Ea/PyZSa2fvjpizTnbWhbXc46MNZ7bW3/foHfbBfuZ7l+Wj4HonKbZ59456UHnX9gSq7IVB6ebX6M3MOGmflzRWfLeMi9EvfoPzqWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB0JJp2eP4EJnQN8FyiGN66FEiJjhlN3B+zdKNGYeK8=;
 b=VMne5iorrgW43A8LoTCmvrIloVgLzHumX7pq3LnVgN3vR2xuWaunpX9Zi/NC+aJhntwB3c4L5YXN9o+bGq1NpOSGiUHY0tcQ76s17x9AIDjzAGrVVdV/54jutFYiIVejrXJid5ebJ8xpxrQKFDT4kYvpo3ZY5pocmFChJfdcR0Yb2vGcRauCSIUzTb87lhZ26pYHGcCXmA/gC4a5aNTQb3pLDbQk4IUh6ImIu6Yi4UnakVTvQPfvYerYn7h9AoxtJymij3PgstzOoFTuhdT5UfNDHceC21dWba8YtXYesCzjtxtlnntDGkFRHly+n/6le9O+NOMLE8nMXf0WT/lIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB0JJp2eP4EJnQN8FyiGN66FEiJjhlN3B+zdKNGYeK8=;
 b=HwL03iWfrsdc6uIclGBqzVpxZxp87S1lJif1OUsko0L5/9eUwwJjOjxCmzidEiewiJP80c5DJtfhzTwJKVvYyIShFQSNQvFMiR7X+JZHr17LltjF96TduyZ0dBVrHkPj4JxZY05HrAsHu3xrIhDkZwLiZpL4TVigJ4afaTtMQ2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB10747.eurprd04.prod.outlook.com (2603:10a6:102:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 10:12:25 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 10:12:25 +0000
Message-ID: <1e9f7bf9-e319-4864-ae53-fb82468cb12e@cherry.de>
Date: Tue, 3 Jun 2025 12:12:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] util-linux: Improve the package licenses
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250603031425.2206714-1-pkj@axis.com>
 <166b439a-86cd-4bef-816f-c016732236da@cherry.de>
 <DB5PR02MB10213CA080A393F42FE4D4229EF6DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DB5PR02MB10213CA080A393F42FE4D4229EF6DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0099.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::16) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB10747:EE_
X-MS-Office365-Filtering-Correlation-Id: affbcbde-6dd2-4155-e6ac-08dda2872376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3BhWkdjS0ZiRVhCMFlaQ240RWNmbzdmQTI1clFPQlhzb3pCZWZEVk94UDNn?=
 =?utf-8?B?dHU0QzErYlhBTlE3dnEvaThyWGk4cUFzOERtZ3JOa3pLUHBFQWN3K25Sakg3?=
 =?utf-8?B?bE5GMVRCT2JrRmRJTEFmQzNjaTVkSEFpY3VXWUU0dW1pSzJPSkRYUUd6c1lY?=
 =?utf-8?B?ME1KVWltSHRXcEozRTNQYUpUS2FHWTllTWN2NXpEM1ZkY2VYd3ZXbG1Lb1NX?=
 =?utf-8?B?VUU0VHVvcDB1b2NwNVhydEJxdW5WRVhTMWZwRitCZ1RNSStXemw3c3dnV0dU?=
 =?utf-8?B?M0lVdHJZZmhFSFBIVVZrRk5penBVV01RVGxXT3p1ZXVXT0Y3RW83MEpOQlBt?=
 =?utf-8?B?dmZjMmV0UnQ1Nm1ocUxhQk4vUG40bnllTi9UcXJYZ0NERGxqdkZNejJVM3dp?=
 =?utf-8?B?bnBsVS93UkhEOElOQTB0VjhzNGovSURUeFlzalY5TlAvSHhZTzhxK1lZYjhB?=
 =?utf-8?B?VlRhREtFYWFYYTkzMEJnU08xODBFbmxOYW9rNVorK2pRcEhzdlhTeVZKUE5h?=
 =?utf-8?B?cTFBb016cVlKelpUblJWUVJpNWxtRy9kbld6Mi83V09STENMTEhML0dmcVJk?=
 =?utf-8?B?SmZvbkdpd1oyUmJ1SWIvTTByTzFUWUFudmVhSVVVTmJQMk1mZ1pCTWlwenZ0?=
 =?utf-8?B?Ti95bEZlR01MVVlUSGpxNXhwUlRTUVBEWTJGbTlwNUtyU0ZWTGU4dDdQQ3ZZ?=
 =?utf-8?B?MUg4TE5XSDRNYVgyRWEwZzJzYjdmMlpmdTRHSTNwTVRJdlV6c0d3ck14cmVw?=
 =?utf-8?B?RlR4aDNzUWxuOUJOTzNhMnp2d3FnQngxOEJvWjh6eUlYT3lYMjNjZW5MY3V5?=
 =?utf-8?B?V2Z2U3QzVVZCazcyOXBEb1NuOUw3alFTMXE1Rm1Zd040dGVrQUl3aTdZM3RM?=
 =?utf-8?B?QWpZck9DWGpKVm1rRW1lR1YydVRkaVRlZUJxQ0ZBTU5yaVkxQ0FITnZBL29W?=
 =?utf-8?B?VGViRnpnNnVGRTNzZklXZWNZak1ySi9oNW5WSUdHb0JPNWZkd2JQUTJlc0pD?=
 =?utf-8?B?Q2ZEK1BJTWpId2p3bzAyc3I4ajdyT0tabEhlSENKaldMcmVLYmJMVEIwNlJ1?=
 =?utf-8?B?NzE5SnlpVmV4RmxMWjBaZlYzcVN2KzB5bWkvSVo5QnJBZHlsWlZPay9RQ3Y2?=
 =?utf-8?B?N2JCKy9Sc2Y4cktNQmpoMmRpNVp3QW8yRXI3b01ENjlQR0tFa0xiL3h6NDFQ?=
 =?utf-8?B?NEZsdVFEMmM3T0VmZ1pIVHBlRGhaMGpFRGYvcmx5emtjM3FzbkVMNWhudnll?=
 =?utf-8?B?ejVIVDNyMVlQYmV3NFBGalgrZ25DU0dUTk4rOTgrek9LUUJRZ05TeURoVmI3?=
 =?utf-8?B?THM2OFZUbEpsd3YzektXa1RiSDZqNVpSTUtVZ0hNQWpOUmNyWlhGT092TVZY?=
 =?utf-8?B?UGwyclRsNmpueTRXTnJBbFVxNG51STd4RFljWHlVSTd5SzYyYUUwSHdZVXp6?=
 =?utf-8?B?Q3ZtdXBEMXNkcUppbkpnNmI2ZDhkWUpOYmpUeHZ6QkVOK1JVUGtpR1EwQnNF?=
 =?utf-8?B?eTJINXBtNHV2c1FkVjhvQVJ0NWcwbHFEa0owRkZJQ25ib0xmU2RQdWZuWDdH?=
 =?utf-8?B?MVM3eEdpSVg4RkYyR3BLRkJVcTlTQVEzbzlJUlorcjdiSmlvcjBPa29nZVBM?=
 =?utf-8?B?ZnhXSHVzNEx5d2lGZVR3SnNabXJpY2tReUNHNFRXaUNmN2daRVU0MDRFb0JB?=
 =?utf-8?B?RmVzVlU1U3h0TXRZcUU5bGxiOFZTakl0Vis4NWtBSUJZZjNXak1naUkrSmN0?=
 =?utf-8?B?bWl6WDdCam9aeE1lNy9pTUtOQTJMaGJiQW45TWpqZFdHWVdESHFUeUZCYzA4?=
 =?utf-8?B?Umk4TkpHcnRXZmN1NytWR20wRnVvUFY1S3VLdFZjSE9PaHo0L2tjZTIvamhN?=
 =?utf-8?B?RUN1cVZ5RmVCU2xMRXI3MHgwREN3aVZ0bHRWS3c5UXIybThpZmUyam1EaUkw?=
 =?utf-8?Q?Vm0FUk7sr5g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjVQbU4rYUhyczZndVozSStmb1BmRE5xbnNZMUozTFltRWliSlA5NlZsRnJF?=
 =?utf-8?B?VXlvTlBKb1ZBOE5HeEFJclNZclYyamFqeStFcE45aGFZdWJDYnFiZTJGMzVx?=
 =?utf-8?B?UEZMcW44V1UyUko0RTM1VVJ1bXVXbGpwbWpaMUhNd0lOdW0ybFBLOWRkWUlp?=
 =?utf-8?B?RURDTzdteUhxeE5hcFJNVzcrU3gvREk3eS8vR094Ymg5a0w3anJ5VHhYcWw0?=
 =?utf-8?B?WFRZVEtuTTdobnpua1RPL3JMbzd5RHlEaitSTkFWc3R2N2MxMVpWdUU1NHUy?=
 =?utf-8?B?enFZUmdqMDFwbTZUWjBzTlJHY2w2UzdNMjNCbGpEYXJwR016c1gzQm5xbFJR?=
 =?utf-8?B?RWJnZElmREg0dUVIWU5NYTNLdnB0M1lUc09LQkFIbnhycjV5b2dKZGcxalZF?=
 =?utf-8?B?bndnbmxjM2dNMkRvN2JjSHBwWlFSaVp0b1pjZGNiRklIWXNVQW1xS2RqSmhS?=
 =?utf-8?B?MjVROTZLTGo5K3Y4MEhLQkNoQStrZ09TbUFaek1XVGhZa3BWVFRLV1U0MEtE?=
 =?utf-8?B?eU1mUVZ3V1liR2dGdGN2QXRRV3lwQSttVFo1dGh3WnFzWEp2RThRQ1A1KzRM?=
 =?utf-8?B?eW9LVjVYS1phY1ZJMndvVE1EdERER1M4clQzdnZIa2dPenE1alprNXRpS09o?=
 =?utf-8?B?dG5BMERPWlpNNEpNT2pKUnRJSlZoVUprSElDelpJQ2NpTFhBVkF3TU5rVGs0?=
 =?utf-8?B?YkRjY1ZLelhnczFGeXh5bVo4VWJZU1VDZDNwTHI1Ny82dlUvNGtpNXZaeWto?=
 =?utf-8?B?U1NVbGZFSDk5bEgyYVZTV2JHQTlzcktHeis3bXdwa0RxeXcxYTlNbFJYVlFV?=
 =?utf-8?B?WWMwZFBWTWV3amJvYzZ1Z3RkYWdCOVk5YVBRa2lDODhhdytab1ZiV3p5TWxv?=
 =?utf-8?B?MC9GMVVYTzZjT3R6Nno0VExDbHMvU3ZKRFQwSnhNMlZXWVhyamRTamNDbXZE?=
 =?utf-8?B?eUREYWZocXJOZTVDZUd0NUJmbUNjWVp5YnR5Yk8vWWdyZi9zVWwyWkpTbHlM?=
 =?utf-8?B?cFlOZkcySnp4dHVzWlFGSm1yQ2pxQ3dHZGYvTUZadmx6cHAwTEVhZmFHbldu?=
 =?utf-8?B?TWp4RElhRVViYmV5QVZEVXFZazhQNzlkMDRTVVQzOHJVUmxOaVVvckN0ckx3?=
 =?utf-8?B?R3VQOUtDRzEvU3ovSHE3d0FzVy9RaGZGbkNPcWdjakxzd2dEMUVoczNFT0lS?=
 =?utf-8?B?elppQzNuV3RPRzUyZy8zcUVNY1NPeDluSEo5eWdINWNtcjV6RnZJcU1iZC90?=
 =?utf-8?B?N2RoTzRmbDAvT3Nrb0Y0TGZiZ0cvaGhHYTJST0FBOUhCbnQ0R3h4b1JIbmVk?=
 =?utf-8?B?MjNZNFVwSmdmU2IyRnl3allOamNDNEVqbDh2a2M3eWtBdks1cEQ1VXBGYWMw?=
 =?utf-8?B?Sk8rWm1OTFdEcXJ0Q2lFRnRtdkl3cU9mYlA3dWsxamlrWjNHRXF1S3ZYT1di?=
 =?utf-8?B?WWNma08ydlB4VGJFVDhZakYweWJQLzM0elBUenMxbng3eEZoV0tKUlFrSzE4?=
 =?utf-8?B?ekxORFdHVlNObWxlelNtUCthb29SOVlUaUZwWWVqN1NNbnlFTFZsb3JZdWFS?=
 =?utf-8?B?ZE5jQnBIbVZIQjdNbGRYMFMreUVFMlBTdUh3c29pQW96bnM1YnZkdGhrcVZO?=
 =?utf-8?B?bU1nVkFVTk85TzduMnNJN2tXUGl0VG9ObHN2RFhPN3dIM1ZRUk9ITzdUSFlt?=
 =?utf-8?B?NWdLcUxXWi9XVDArK25uWXNpUEt4M09ocU02RGVsd1lhN1ZUc0tCV0hqc2Jx?=
 =?utf-8?B?dUM5QnRaMkQ1SUNzRHd1b0U5bHJ6eEdWc1lzVXNGa04vSVMvMmhyQjViV3FR?=
 =?utf-8?B?aTNLeWVsYWxZVm1NYklRc1h5K0lMR1dIbWppWGlXRlN2SXBSSm9Eb083THJ5?=
 =?utf-8?B?cU9nVnU1NTFWb1hmeU9VSFpmbks4REZtSVFJSjRTRnFKcFBaZG1lM3Nlejcw?=
 =?utf-8?B?dmZhNVRnQ2ZoazJvcDRDQ1A0M2d2ekI0ZWx4RklSZU5MbGgvR1FreXh3eEMw?=
 =?utf-8?B?MkNxRXB2THhScm9udnFyczZTWitDbExKOEhTSEUzTVM1Y05wNHA3SndsNkxr?=
 =?utf-8?B?cGFqeUlQdkhiSE1lSWxabmQzMU8yU2dTRjZ5WFVkNWpxYWxsRHVtemcyTG5W?=
 =?utf-8?B?Nko4NXhmM1ZyUG5iQjczb1VaNVIyNXRYZnJ5MmlDdkZHTWpwajREQnBEWEN0?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: affbcbde-6dd2-4155-e6ac-08dda2872376
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:12:25.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfWqbcYpPa7C+ih61ubDtXlGimGjkOwGqlPALgg2Pb46Yxi0DZT8UziVI1+YoaID92ok9HhFOsGZCZurid6mufk+LVmkRGJ7vxdW/urXe5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217798

Hi Peter,

On 6/3/25 12:07 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>> Sent: den 3 juni 2025 11:27
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] util-linux: Improve the package licenses
>>
>> Hi Peter,
>>
>> On 6/3/25 5:14 AM, Peter Kjellerstedt via lists.openembedded.org wrote:
>>> The default license for util-linux is GPL-2.0-or-later.
>>>
>>> Most of the applications and the libraries are also linked with
>>> libcommon.la, which uses these licenses:
>>> LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & MIT
>>>
>>> Set the above licenses for all dynamic packages, unless explicitly
>>> specified.
>>>
>>> In particular, this avoids setting BSD-4-Clause-UC and EUPL-1.2 on
>>> packages where they do not belong.
>>>
>>> License-Update: See above
>>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>> ---
>>>    meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++++---
>>>    .../util-linux/util-linux_2.41.bb             |  3 ++
>>>    2 files changed, 38 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>>> index b0f2a9d497..bd7ad10035 100644
>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>> @@ -6,14 +6,43 @@ disk partitioning, kernel message management, filesystem creation, and system lo
>>>
>>>    SECTION = "base"
>>>
>>> +# Most of the applications and the libraries are linked with libcommon.la,
>>> +# which uses these licenses
>>
>> Is this something we can detect directly within the binaries in a
>> package, so that we could simply add those licenses dynamically to
>> LICENSE:${PN}-x instead of having to list them by hand?
> 
> I doubt that is possible.
> 

Fair enough, was just a random thought I had :)

>> Packages without a package-specific LICENSE will take the recipe's
>> LICENSE I believe, considering that *.la is part of the -dev package
>> should the -dev package have a "more precise" license than the recipe's
>> default?
> 
> Sounds like a good idea. I'll send an updated patch.
> 

I don't know the content of the dev package, so maybe that isn't the 
best suggestion and the default would work fine?

After all, the LIBCOMMON_LICENSE is part of the recipe's LICENSE so it 
would be covered at the very least (albeit not necessarily proper).

Cheers,
Quentin

