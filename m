Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4444C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:17:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.web10.85606.1738581454150649865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KGTxh/2c;
 spf=pass (domain: cherry.de, ip: 52.101.70.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5UcErlRTtbxnD5YRNoM1NWvKu0LQ8YV0HfFx0m12i2nnfCDj5ECaJoKaQK8EQ5YCu13Ro2O5v2XJFRLexcr8/ZfdkpW4xqRiSkLeI2dg2x08FaJz5IRT2IkA+2Pl+yAIxQplgKNNfuEwnqvrAp3zmYc7CVTfYWitqO9+A4XHvIhvhNdsQfhvXYBHp06jMR+ior+qINWUoIPut/q4x4g9XvGkQ5BrXHAMhBn2CM+447s5nU72S14ft1o/uIrUS31d7kUrZGsNp1/klGI4aqofifDkjHDKmbEDrcPz19UQOFpBBzxyyVW6BSYOENbTl1URv6PWc41LY/CYgwN0fMR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huHfkCJ8ryNEE07fUoU9WOXqpHjoJqFZtiAPQ8Xs0PI=;
 b=oWF1ujJ4u9uQLr79vfeA4xwMrFpEo1VmI4R+CYF/c6rgIbazM+ZfYFLD0cXokRaGbSrPl6zCtytsgKAg/gwitBFZYmH2l4CHPKj7CJCfGvQ84rFQeDyTjtYuRJoiAZvyVhCzqCsTGnuizpnanoIqV9/grZwaLXKNqwczNqu8xQXNTG6Dff04hF9uNntdpRlP6uYqvHtoHLqkCqhCw9qJtKe6mdj3iQn2bKsdQEhENMeiaexcTEjc3H7ul87IJP6HbR6JKfLmi0AQdOAkAh2ObOgp8BaIyQmaGVXf3/6BtePKnQhTrS4lyTnrgVVwEdBhA0ZBm32xF5d/dqBWgCiv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huHfkCJ8ryNEE07fUoU9WOXqpHjoJqFZtiAPQ8Xs0PI=;
 b=KGTxh/2ceV5GDryrB1ZpKMxMsgntLDCWmnwewKwbKPVm0y458EAgxfQvgSe6DIDwHpbHSGlYFldsJCsR87uwjovN34FDMa6Kyv4FAjffXnD513Gkt8wVHJDpfBBwvza0k86Hgk36+PgvCHVn4yymraVHeX1k1AbHj5AziO+VhYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6963.eurprd04.prod.outlook.com (2603:10a6:208:18b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 11:17:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 11:17:29 +0000
Message-ID: <b407c45e-030a-4707-be56-0f5ff1cde46d@cherry.de>
Date: Mon, 3 Feb 2025 12:17:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: alex.kanavin@gmail.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
 <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
 <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
 <CANNYZj-iMjQnJ6OZDDGJ6ofeNEQVmvby9cSzOrQh8GBcVVXtmg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj-iMjQnJ6OZDDGJ6ofeNEQVmvby9cSzOrQh8GBcVVXtmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0055.eurprd09.prod.outlook.com
 (2603:10a6:802:1::44) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: c142c66c-f189-4a13-7d6e-08dd4444588a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2ppWldjQ0x6RXVyS0JjL3lhYlQ3U3NVa1ZGeVp5dEtqTFVjUk5PV0lXeHFQ?=
 =?utf-8?B?QkI3ckt4Z1kwSFczSmVqb2xybFc0enRQWGVpVzVhY1gzMHFuK01zRktoVm1W?=
 =?utf-8?B?YS8zUVlQZlM0RjI5dDRZeUl5QU9pYWZKZDlnZzJZNUlIY1A5c2l4cVdQdFp1?=
 =?utf-8?B?N1M1dStLRnNLSlpBQW1LNC85dmh3TmUrNS9XQ2lYaE81K0gzcXVmUndWQmZT?=
 =?utf-8?B?VzNWNHQ1dlBSYTVzbk1ZVUt1QWJ1cVpiU1ZwTnZGWWFTOTEveTIyeEhBUTdI?=
 =?utf-8?B?dytXT0RZMFpjU0FGVy9EbGdSR1FRMUJEbnRjYm9rY0cvaEFsMTlRalFndllw?=
 =?utf-8?B?dDRKM0NBZERXWGd0bFMwdFdKRmRQUTdONXdqYVMzam12cXE0OTE1U0p0UWUz?=
 =?utf-8?B?dXZvcmExM2tMS1BudE8rZi9veWx0RWhiak85T1drWlJWTEU2QXdkbzRJSDRL?=
 =?utf-8?B?QUtoaUJpK0lvRHVseFZVSFlqRnd1VC9URlorQlVPWk1XNXp5YjRkdStNNC9D?=
 =?utf-8?B?dkp3dnNvRGZacmJ4MnVua2JKSk91THpJa0ZIU2k5L212NDJXWGMvdGJMaW80?=
 =?utf-8?B?QjNaNzNCVGswaXlFcVdQM3ZUQmtHZVJSdi9NcHU5bEFrTkZDNzVFOXVRdVl3?=
 =?utf-8?B?RVdsbm0vTElnWTNrOHJYTnJ4cisyY0M4UFh2cG9HLzhZMjEwSkNiNytPL0Vk?=
 =?utf-8?B?czF4SEN1U3AxZzhFbGtRL0kwdFAzblBqQ25ydUVpeHpoYTRoZFQ0aFNXRzZC?=
 =?utf-8?B?UWNiUEF0TCt6c1lSYmJuMGVXem5UZG9Vb3RIYVhNNU8yZ2V2aHAwckxhbVZh?=
 =?utf-8?B?SFRxbnRyUitIOE9Va1hQVnJxU3R2SWZzeDhhaWRMUndTdTFIbjNHZVhyMXpY?=
 =?utf-8?B?K3RmN2hralVDVkpWMHRJR0k0L3JuUU40SGFSb3Brc2pUc1ZZbUxiUDdtczVs?=
 =?utf-8?B?NWJCR253T0g0bjV2TTVJVnNoQytmMnpMVUxaY3JJU3BoWXZvb2x5Wjh0OENF?=
 =?utf-8?B?WTdqcHlNRXk2aGFiWlZXVlhaMDh6dXUwTHRHZU1aVy9pMlBHTzJ2VFg1Z0d1?=
 =?utf-8?B?cVcyMU1ZaGJaODlxNW55dm0ybk9QVDM4TWdza01TNDN3WGpjSFpyRkhtNThC?=
 =?utf-8?B?V2ZqM2hXRGs2aVZzSjdleXdSY2tIOVN5OWFQTXJxUEQyTzY1WWE5NW4yZVAw?=
 =?utf-8?B?cTVHMlpNR3FpOWx6UVN6WENmb3RZeHd5dlNxN1hQQjRVVmpNd1VCSmdJYlcw?=
 =?utf-8?B?U3NtSndGMXBJb0RSeDJTZmhJNUkzSWZCU2RrMHEzZU5ua01hTlFUekxlQkpv?=
 =?utf-8?B?TGdWQkJBRVJqMVVqRTF4TG5yaU9HVkFjOG8yS0J3ZzJ1SCt6aHdKcWRnclpD?=
 =?utf-8?B?NEp1elkwd0lydU4yQ3YyMGozVCsyMjA3NE0xa0IwZmxWVXNjUXRWUjYxNEZC?=
 =?utf-8?B?MTdVelp4UmZPUnN6N09TNEE2WjlYM0s1NUxkRTM4dlcrOWxYVmNjV0o0MnB0?=
 =?utf-8?B?Z2F6cUZkWjQ2WWFXdnp4N1N6NVIvUmFuNzVvTTgvUTZmZUlxTVNKdkJaVlh1?=
 =?utf-8?B?bGxPOWN4dkd4UW1UVzlMNTNCQW9lWGFidVRtREFjaTh0OHN3QXlwT0JMUHNU?=
 =?utf-8?B?ek1FNkxWZWtBOHBxSmxXSVh6d0M1cGZOY2J3c1dkM2orYmVkYmltd1lpUjRD?=
 =?utf-8?B?UW5KQUY0RzhuTitjQkpaWjFHQ3loTUZvWWJEdEZ2bEFyN056MUdLRzEyVndr?=
 =?utf-8?B?K3o4dVRBbndENjdBL3hxU0RuWEJ3ZnVZNWJWTndDMXZlRXRRMm9DbVJjMTdM?=
 =?utf-8?B?SitXZEdJemd4d0R3VVVPaDRPVDQyV2IyL3g3RzA2aG5uNVZJcUlXdjZuM1lR?=
 =?utf-8?Q?+7azs9IWyngbI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGhndDVlQ3QvcEViV2NXemNqRmVSQnpwTnNtS256VHhlR3JmOEd1REhBa2tV?=
 =?utf-8?B?dFV5c1FORzFRZTF1WE1hYjdaSG1TZ0tPbi9JVi9wOXpScFhPaHlPNDBOV1Z1?=
 =?utf-8?B?UGJjNlBERkN5MjV4cnE3eUdVN01jb2pMRW41Q2ZsUW5QQnA1VGN2ZUhKMHhp?=
 =?utf-8?B?SW9ocGlTMW81cFhvL1hIdzN1K3NQZi9Kc3pjVFFWVTNSMVN6QzRaYnFPdkdq?=
 =?utf-8?B?bnNwc2k0bWZ6T2x4cENFc1B2ZUszelB2SEZyWHdUTkNVVWQzdE1mL3VNbnVB?=
 =?utf-8?B?cHpYdlRBU2pWdGhaWEVmSGdXN1JUYmk1eXRMMFhHTk44c2VnMXJiTzBKR2hk?=
 =?utf-8?B?V2w1VVJqL2FvQ1o0WEV4WVBpWm9XZjgwdzFRbVZKTGNZeU96ZHZDVEUvcVRP?=
 =?utf-8?B?b21yNVR5Zk9oTTFRZEk3YVAwcFdzYlA1V0VLenVsSmxmejg2bFhSS1dPanJN?=
 =?utf-8?B?d0lxOWZTV09tVVlmTUNXSjR2czY2UWZSSWlsdjdkZVQ3WFYwcnVOVmhtTG9Q?=
 =?utf-8?B?anhDdkxGTmlxM0R1cVRYUkRVNHV5WHBoaGRkTkxGYjdWNG5UbmhsZ3VrYUkw?=
 =?utf-8?B?ZmpOb2I0YjNmenRTOWNtb09ha20zTFlCb3huWnVCUWlVb2VoKzRKcVVWMzNE?=
 =?utf-8?B?N0NFdlcyei9kMzI2Y3M1UTIwUFdsd3JPaUg1aTVsQXY5NzN5OG1PeEFRRWFS?=
 =?utf-8?B?VlM2MkkyWU8yQklyUEZlMFdoUHEvTUNiWkVBeU4wYkRaaWMxdUpiOStHNUdl?=
 =?utf-8?B?RXdhOStLN25Ec1BwZG1SdW8vN0xBTGdSWGJ4T05hK2w1eXBBYnF0dXVtOWda?=
 =?utf-8?B?dnh3OHFZaElVdnh6NVB1eTVQeW83TW91Tk1QYmt3WUhlcWdiclZPRzNTNnlR?=
 =?utf-8?B?YmhJWXpjYlhobjBHL0RDdG5DWFdxOXZhN0gxaGRMQ1VvbkhlUVk4emxleEhB?=
 =?utf-8?B?VWJDS1lxUTYzdm8rUlFEdUthYlMxNFAxZ2VickhBSytIc0hSRUtYUWxOQmk5?=
 =?utf-8?B?YWhBVUhmRGo0QnJ3V3hkRzdBMXBKMjNzQnVORzNEZFY1YVlKcWxKWWV2ckJX?=
 =?utf-8?B?Y1RWTnIyMGlYdHlVWUtySXc4cy9WUUpvSmhZUkxFN1B2TlpzdnFTRjB2Rlhp?=
 =?utf-8?B?ckR1dTcxKzlMaWFaWW55TE53TDFMV1JlQlJTVUdhVThlR3NubU96OHg5dG4y?=
 =?utf-8?B?ZllXRUxvZk1EQ28wbStLdytjdFF0eWxDV2ZvU2laU0Vyc1BtSVNLT0p6S2Vx?=
 =?utf-8?B?T1RoaXNpcjRRMEtJS3RybjhUUTRKditlS1dtVm9UNU8rRTd0TUtGZ1c5cXZE?=
 =?utf-8?B?VTdvNjZWcHQyRTBoUHVIdzIxS0R2QnhvbEI1eEpOSm51UXNWZFFpNy9oVGlH?=
 =?utf-8?B?MlQxcVoxUVoxZ1NHWDJqZVc1aEdOdGhWTDgzVGdXVXZLQjkzTmlzRXR6YXZ5?=
 =?utf-8?B?WFg5eUtQVktCZ2loTDJHemFHU2JxYXVkS3pwOGp5cythZEdDSnVGZ0VrS1I1?=
 =?utf-8?B?cGJlTTJUbGpDUGx4SWYwcmtQbnRjc3JzRmJhMm9aVHZpSC85MUhqK3FnU2pC?=
 =?utf-8?B?bjBzRnp6UUgydHE3cTdlbVZnTjZhK0dMekdhUFk5MGlUb01kKzRxVXY2ZS96?=
 =?utf-8?B?aTIxZy9GUWcvb0MrRzA3b3hLREtmbkM1Lys1Q0dqOUJXNXNFTnI0cjJ3ZTUr?=
 =?utf-8?B?MlFDbWRzczluZzFtYXovcWkvdmxheFZlZ1VxMmErQ2JRdUtqTXZNV3cwSVZY?=
 =?utf-8?B?T0JTazE0aW04ajE3VHRveHhsR2ZXK1FXZG5SRjFSSTJ5WDJ5Y1Z2K1BvM1lo?=
 =?utf-8?B?QTlQTE45bE42dysrNXZ6MEltSi8zUjVTUnpCK29WbjBmVlJaRE9lbTRvUnhh?=
 =?utf-8?B?M3BDcndwSU15UDZpU2RtL2dkRHpnUEtQUER2SWFFL0hkNXBWdnFQbE5Jbklx?=
 =?utf-8?B?a1BybHZXNUx0SHdaWTZ5TW5nUkpPV0czWlZTZzJ3Uzd0MWIveVlZZEJocTdH?=
 =?utf-8?B?WDBkYnYvdEZZRGVRL1o1NWJiTVFrVEpRQXhTSUFwLzdFVCtJZHlGWDErRDdq?=
 =?utf-8?B?VnJrMjRDL25GTHdJQzRVRDUyR08yaFhpcmFjdmZFQzNGZUtwZmhYS2xad3hq?=
 =?utf-8?B?d1Z3alRxeVdBeGM4VkJVOFF4UUNDNlpPVDkwZXMyS0xHb3NCNDFiZGlDanFy?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c142c66c-f189-4a13-7d6e-08dd4444588a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 11:17:29.2039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/w0J5nLd2zXtXioCXNC/f6agmJIUVcEEr2PTiy3pOoIlxszg7naYR9812TMSFeGSUuX5OzzIJg0BjPjgm6zBl99Ado6H/hiT25ZLP41ly8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210641



On 2/3/25 12:14 PM, Alexander Kanavin via lists.openembedded.org wrote:
> On Sat, 1 Feb 2025 at 12:37, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>> How was this tested? For me it fails immediately with the same error
>>> as the previous update attempts:
>>
>> Yes, I forgot about the Intel world, I was testing on ARM & ARM64.
> 
> Please remember to try at least the basic poky config (which is qemux86-64).
> 
>>> Basically, mesa updates are blocked until clang lands in core. If you
>>> want new mesa, please do help out.
>>
>> Is there any work in progress? The latest attempt I see was made in
>> November.
> 
> RP has recently reviewed the patches, so you need to find the review.
> 

https://lore.kernel.org/openembedded-core/20241105184540.3450302-1-raj.khem@gmail.com/ 
for the series.

Cheers,
Quentin

