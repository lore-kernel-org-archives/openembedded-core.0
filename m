Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC4ACAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:30:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.4])
 by mx.groups.io with SMTP id smtpd.web10.36785.1759764625278754342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=g7h1DbUl;
 spf=pass (domain: cherry.de, ip: 40.107.130.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWTas9wxlAyGvqAUb2lb/+HYEmHUxxy8qciNNlHaxBhcJ7vrSQ/zEWbIxLpS831DsoYqGT76jRaBuiPDsF+eD4zk965DEfKHmRP7uSJhsrf+wYV7T/jORhRbUMMttImU4CD1ui2WU59sYBG5dKUJSDBqEbrSS0gWXaHvaGFW/hkG08IBWIuo3uOF25aoWgYn+Sv4vFLxompBAeiaV36JBX3MxPyk6osTGuF7Q1z/h8cg2rDOptRvtiDsea4uAeigqU+6eYLrwP05xVn2Zhc0l+D+f1WWxCnVdscbd/LPGrbpzHwUZi7kUy29JIW9XHfJGo3dVB7L7mEDj/8sb8LDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCq7FrdYx4rDdbW2lhFjfE/bgrE8f+B0hoCSjH6UNf0=;
 b=H2NtE8WxHgJ9ZUepB6UyoGLSr5qPvPwHMNwmqDoRV41qvtg5dPbsklMNg2BfsN62rpnim8vXqnUp+Uk+kpAb2nX0shRynden2+H1dfJDjkjlkDBIcCXPijgmS2uZv8iZ810gWhwIfQeaB+dJtu07hHuoeWULF9gFYFBQ2VL7GfEX2kJSdQk1JxljUxQwJESEvqr3JaqTPj5ezErpL/Uyk0R7eO1AUxXLxXA1QHpjtXxszc4U0+OdnhvgHuP6YLjulleNYDjDgOEoBfU8ZKaapwnGvziennKUMCoYcl91YdAsBLajKypnBWQQisOlYXAdijZU+Ezw1+ePbn9LD20ejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCq7FrdYx4rDdbW2lhFjfE/bgrE8f+B0hoCSjH6UNf0=;
 b=g7h1DbUlJFCr7JrbiTdXxHIOr7f7L/lt8+t65QbqL0/39Gx+owNMTZUEoqqxHHhizOW/cmEn3lN395QvkRTUObZrIu56aAYMMq+5OTQqmygC4PqKsSuU4LJ6mvHr0gKMySOjlriMzSapkjqHCNN3dCNsn8c61hcLUgCCituTV20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9114.eurprd04.prod.outlook.com (2603:10a6:10:2f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 15:30:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 15:30:16 +0000
Message-ID: <bf3eb594-b3ad-45b2-8360-b474c50b7402@cherry.de>
Date: Mon, 6 Oct 2025 17:30:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: update 25.2.3 -> 25.2.4
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
References: <20251002151226.1985845-1-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251002151226.1985845-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 129a93b5-a007-419f-2e25-08de04ed4015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGVSNVF3K1lIYlBxaEpMc0Vkb3U3eE1KWTY2TVpNd2c4aVFDczByNHBGaVdw?=
 =?utf-8?B?T3Q4RjBJYnVFWTFhT1JBTHIvSVgyeDhsY2NDdnNjbUtrU0xQTzI4eWVPZEJu?=
 =?utf-8?B?VkFDVWkxZjE2ZlhwMWFBSnJFUFdOc1lwTFRLc1NiTDZhZk01WFFWTy9NODNO?=
 =?utf-8?B?T3QvcVZwRWJ0RUp0K2MrcUdJOTVobjJaL3pYUHNnOEE5ZFVzaU0weVBXNE5E?=
 =?utf-8?B?TFhFZ0xTWjdtNEpzRTQzaVFCUS9LWGZ0SVdwaTUyY3pjV0M0RjM3bk1oRWxw?=
 =?utf-8?B?bFBBbXlXY2t1cUFSNjJJZDZMWkNYOThhelY0c0xEUzZVSTU3MmZRUzlTaWQ0?=
 =?utf-8?B?Z1dRdnlBY21UUHhEV0lSV3VvdWs4dTl2WktrRS9WMnhkVTdaTGs4Nm1BS0Zz?=
 =?utf-8?B?TU9PZ0Z0YjM2V0dwb2V4SmhSTC9hdXBzNWpkOXFhNVVzbVdRQm5BSkdvT2do?=
 =?utf-8?B?ZzJib29YbmdMc1lLYmo1VFl3bW5LWW0vRG5HR0VqYWJSM2NZOTc2bzFnUmhu?=
 =?utf-8?B?U0VuSEFBYk5ldHowNE5WSHhBRXlhK1h2eGFzTlUxdWRxMWxvdnBqQXcyUEsz?=
 =?utf-8?B?VGYxNHZyRjVoNmRJV0lSZzQ4UlNCclFTVHlWSFR2UHRMUFhUNGlTRjFBaVdL?=
 =?utf-8?B?M2FtbGc3ZWhWbi8weFlub2JqQThGQkVaMEdMRlhWanI1OXYvaU56aVRYa0Z3?=
 =?utf-8?B?aG5UR0dDMzF3QzdxRzAweVZUdmZqSEhiVDM4UmsvT3Z5VElsNkZGdnZLYnB3?=
 =?utf-8?B?Ym40eHczK2hXS29uRC9hUGRPTEduSWZ0WkJiRU54aVdCUGx5cjgwYUU0ZHA5?=
 =?utf-8?B?Sy9YZElOcFBQUXpjMHpmZVkzZDhpRXdtcjV0aTNOU3NJNzI0Z1k0SkwydVht?=
 =?utf-8?B?QzdwVFRRNjdxY0d3RVV3ZVhoNC9ma3ZJcHJ4Y0hIZy9WWk9RVnJzaHRVVmZX?=
 =?utf-8?B?TUpRVEFYb3Z6S3BCSDk4VndvMFdWS0wvb1NFTjRTV2pjekVkK1NFc09mQ090?=
 =?utf-8?B?L3dNYThleUZ5K05WbXpzVllzanhvWG1CUDlhVkEyWksvSTcrRmxoTVJScFpN?=
 =?utf-8?B?UFlPVTY1WHl5UG8zYkVLS2xoQU9IcU40K1k4czRzTVlsZFRDbURPd1BEdHEz?=
 =?utf-8?B?YUZIdDUyUXAvTE02UVNIK09EbmdjTVZwY1RQM1R6RGRRSC9jcWN5M05RSkVp?=
 =?utf-8?B?L0VsQUlMWW9rRlY4VnVVdldvbS82KzFMZ3p3Z3RxK2l4eCtRN3lsZHBIQTV0?=
 =?utf-8?B?K1lCeUIxdWg1QisxcjZYVTIzdCtKYVhhV2Z6ZkRueGhWcGg4Mk4yWmZsWWRR?=
 =?utf-8?B?NGt2c3duT2J5UGtHaG5ua1lyZ1VpOEw5aTNrcWxncVpxRFpEc2JCamtVeG5C?=
 =?utf-8?B?NUJpU1ppTmN0WktYRTF2ZWVZWWpmQ2RDNEZhQk5YR3E5QWgxMDFyOHk4ZnRv?=
 =?utf-8?B?SW16VnVCbGp2VlZvYmNMUnBkMklPRjBxWkZjMkYyN2J2WE9lVmdTdVlFVTVI?=
 =?utf-8?B?WVpCUllpQjJEakFkQlM4a0ducWhmM2JlTVdiZU9tZGcwRTRCSFF1V3cxZEY4?=
 =?utf-8?B?WFA3TUVLdkhRODFzV056T1AyYkdQMkJZWjU5VmFoS0xZTkNBRXl1OXd2TkFT?=
 =?utf-8?B?WFF5aWVqbTRLSWxhRzB1U2JHWElKcVNDbUhmVlkxOTA3bHRwZ1BGSDViajRY?=
 =?utf-8?B?K3gzL2ZIaDVSTEhYaERxcFN3RlBBTytxQThMZmdVc2N2bGNzeXRtbitDM3Qy?=
 =?utf-8?B?bEUyZVNTWThGK1U3SXJabDlhUWxrN2dUK3NseFhBTk5GMmF1aGdVZEVjdkl1?=
 =?utf-8?B?VUxvUmpxelRqRWQ1M1Y1ZnFIdUFFWU53VU5KQVd3aDExUE9hYkZvNlFCZmNK?=
 =?utf-8?B?RmhCaEdSb0RaMWRGbCtzMlZpdkZUL1lXNW5Dd25pVTlJa0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alRxTVVoZ3Q1TXVkUXp3YlcxUlFnSmY4NU9tUVVZMUxkNm1XTDhmaGhaVzc5?=
 =?utf-8?B?VXZBc016MndEUmRuUE5OL1UvVDgwUnAzTTUvaDd4WU4xVG1zR3cwdHphNGxG?=
 =?utf-8?B?dHV6VzB4RnlrWGZFUFlMeWRDQ1ZUUHNGcnQ4dWsvbHcwWkUrWDVNd2d2bTM2?=
 =?utf-8?B?ZC92TjFidXRnbGppV1p5OHVYZmd2UFIyL1V4N3hyTzcvQ2pST0FCekJCWmZO?=
 =?utf-8?B?U0lGUHZJaFEwSkZiUkFKa2RLY295bTVpMHZjY0NBbC9EMnozZ1UxWmQrOTZX?=
 =?utf-8?B?REJLUnp4dFJqL3B3dVJjZmc3RFA0RnQ2dGRLb1pXenZ6dHBBaEZtNitiZmta?=
 =?utf-8?B?dVo4d3lCV294WlhSdHVWdGlSb3FtazA3YUp0YUhRSW5qS0tnd2QzZW8wTVNW?=
 =?utf-8?B?RVNuRHNTU0dhZ0xKNHJCV1lRY2F1MmhnSVRwSVdNdWFuVnZlaDZkSmR1MXZ6?=
 =?utf-8?B?cGFoN2VhVDRYMTI3UGplNElnSEM4ZUtDSnZzb2htblVKKzZwK2gwSkh6M2pt?=
 =?utf-8?B?ZnUva3E3ZXM0WU5DZEQxSkFtVjlhK3ZHSkZINDZWdDl0M0IzTE1YWVN4RlJ2?=
 =?utf-8?B?TS96cE9MYjdFVk42eHIvL2xMWVZDZTZpSk81aC84dCtGNFZnMXJZbVIyYW4v?=
 =?utf-8?B?MmpqWFA0TFV6ZmJOZWJ5ZzRSNkNBNXZtZWNUN1VCcU1yMERjQ2lZOWF0c2c2?=
 =?utf-8?B?YlBDZWFLWWhPcnoyb1AzWjRaMG0xeG5LZ09lb1BQR0JRMTMwRjh5R3Q1d1Uz?=
 =?utf-8?B?SERpSTRZN3EzWlF2b2hSVU95TzdEM1NKd0ZxKzZ1SUJFeW5xemVQVmNNRGV3?=
 =?utf-8?B?bXJhdUtrTFA1K1c4cmlJdjhYNjlGRTZENjJsWVlpc1phVU8vSHNLTEc1TDFI?=
 =?utf-8?B?OXNvNDdqMWE5aWwvYS9xZVNqM1RieGZlOGVvck95UlJPYUVSN3Jtb2UxaWFj?=
 =?utf-8?B?THl4THpBd093L0FCV0lET1Fodzhsc25ZZW5EUGZ5Qlc2R2ZWZzBDeXRTUk0w?=
 =?utf-8?B?U0pMc1F4QnBoL2NwclFTT1VsU2NvakI2eHc4K1Z1UlJoUjliVUhBSi9sL29o?=
 =?utf-8?B?YXk3ODlOMTdtKzM3QWpKNlhQMWgraDNxMXVPVFhwWlNkaG4rVWJUWVIzWUZ3?=
 =?utf-8?B?Qms3cGpUc3QxNmRyalRaeGpmNkpjb1FOeHNrdmIwUG82Z2sxYThIN1FZK1lS?=
 =?utf-8?B?Z2F3OGVTSWNvMS9xYkJ4dVdxdUp6WGVWZTVYWURmcXM2ZGR3UUZMOUpROGFC?=
 =?utf-8?B?TnR0emJqNHBjTWQ4VWxjRExITFhHRTlHN3Bvc29scUhGV01jcmhMcWM0dEU0?=
 =?utf-8?B?SkpBRTFnSFlQbjBLbHl0NWFoUGZKc2hNdVNRNDRuZEVudWNSemw4cUZZV0RJ?=
 =?utf-8?B?UHA0dHRtdzNKbnRpRm5MemRZUmRNazYrenhTZlo0VDYwMldGTkwzS0pSeXJL?=
 =?utf-8?B?UTNRL0VGeTdoSjlreTBXRCtXOGFHdE5JZlVPOXptQ3lzVmR3WlhyTFlZOWNw?=
 =?utf-8?B?TEZ5UGo5cTM5SjVMM0RnbGkzTEdvWXNMS0NJbXY0Zm9OVkw4MDFGdXVwZGpV?=
 =?utf-8?B?cjYybGFhdi96M3ZGS3htbFVaVW5DQ0RkbTNiQUVzYlA0NWtKVGtKVS9oYkNS?=
 =?utf-8?B?VGpkdlhvVkMxbVpUcm0xQ0pLVVVmbGVacHFRM3UzcGpiQlZ4R2d6TVE1RDh6?=
 =?utf-8?B?Z2FiZElYYjNHS1BFWkNEbUc4VER2MVlFcmlhcC9LNmdSMkYxbW5xVjY1RGFY?=
 =?utf-8?B?UVhBamVZd3hoUjZUWS8xa29YeDM5UTFLb2NDUTFlQ0xwZndnbzlvZDMwZ1F4?=
 =?utf-8?B?UlZLVjNZTTFxdm03eVdYdno4cGhRdThQTUlqdTloaEw3L0p1RVdBUWdvTUlz?=
 =?utf-8?B?N1J2S1hEbU1SUkFFZTUvTGY2WE5Kczh6UFVvc1kyN2Ewbm9FVHJ4c3VGc0Rx?=
 =?utf-8?B?clJxMmtWQ2hQOW4zS0YvaVBnSzUwZnpEcWxtWFYrWlE0dVNZRzVVWUxBc1Zr?=
 =?utf-8?B?V2pzRmNuVFB5T2tsckZNRlFpS0NXQVVVL1N0cmRmVi9jMS9oVEl6STkySkhz?=
 =?utf-8?B?S0JKUVQyOGp3RDhobDZVYzFMYnBlcVNxd2kvVWF3UXVROFNWTkN0T3UvTFpH?=
 =?utf-8?B?bW0veGxXeFlaU2JVRkNxQmE3SkFuMGM5aFRRa0U1NWZPNExONFVVanl1aUhU?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 129a93b5-a007-419f-2e25-08de04ed4015
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:30:16.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaRZqnTNIoQ1UPX23Rgf40HMmNr4ESGl/ATKGsXV4JsISJNJIycu2H+vBzNKX9ZIkb1wl/xxxD44n7d0znZU1dYGjqlU/8XCCE4RDSg9PjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 15:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224492



On 10/2/25 5:12 PM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> Announcement:
> https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html
> 

SHA256 matches the one listed on the announcement and I quickly went 
through the diff and nothing should require any change to the recipe (no 
new includes or changes to meson conf files).

Thus,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

