Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E85E9A771
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 11:23:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17560.1774351421644682154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 04:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KeGE9FX5;
 spf=pass (domain: cherry.de, ip: 52.101.69.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1mKXxJmXJvsvopi02SRrR9h22/aM8hGahMjD1q8MFoL2h1JF16ge/DIpDPn5nEM9W0SS9s+ZPjF4+ANrQpbEtobaA2IFaf7XFLoBEtgNC78lTNker2/GX9p6xRoqP2cpDBhEw/CMi3apJkjWozlSm4y53yGlmcpyDR4c3fk+YMlnp9DV2iPwlhIzSsbSAP70bkVW+wiWgotwqkRJV+cZ2BPLaNhP/lWgWZEwMz1RRKJBpNU1md49EzI44vOK9LSmpa1dpORIumzQdaQ7eILYVjsBMzBCJTj2Q6VmD80HaPuuoXnVilDW6vFR784x/FR8QQ7sE8ZBCkV8T3Mww8wAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMSzz3VutX4Nk0s8WxG1c+ip4HIK6hqHktUMyOHHJsU=;
 b=J7vvR56+4ddd0YPGRDM7PKjQQCxo5q9k6lsD9Xje8wnnVml1cqfufbwhDNSr9PavbnscqbojGWdrApLo2RqRN7IECk0Bx284HlSWkYQJ72oOiuM028B3izKL0u+jP+a0OvbG8os4+HaT9GnVY7XRSEbagz8Sih8uAb6e35qyLK2Jeoyg5ejldzdo7aCH860bl1m/nryggUxGgPT60e3VSHdNqBZ/TEubrTz36VoZ9XQ8pMq/aEEJGpaT0eo1ViGjZz6iIk5T1d9YpvsCGpFK9KsSM99zxPdODq9GhTWaXa0vdjwykIaEN95iphowsXDrsWhwS0yLxg+kN6NnuKsfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMSzz3VutX4Nk0s8WxG1c+ip4HIK6hqHktUMyOHHJsU=;
 b=KeGE9FX5P8CTo6TfMsNVN0kJY1jb9gr3fqgFx5GWG+guzw7kcAGWJXLh52xyIDk7ncD9+blXmmC9/4wWDWTLN+61FBHSjxJdlzWMPUXBEkS1pQ9SRfVUJ0RQsHBY+lazCayWwxsunqxyQSlWpd7vWSQezXgcIk3W+5Y04G2/E0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB12127.eurprd04.prod.outlook.com (2603:10a6:150:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 24 Mar
 2026 11:23:35 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 11:23:27 +0000
Message-ID: <9775bbc5-cbbc-4d61-961f-868c78123e97@cherry.de>
Date: Tue, 24 Mar 2026 12:23:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] mesa: Upgrade to 26.0.3
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
References: <20260324111711.2929939-1-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260324111711.2929939-1-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR08CA0275.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::48) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB12127:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5a7921-e5f0-47ec-57f1-08de8997c4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	R6jiVL/rrUCWjixeYF34hYKIGc5DnygsRuyZK94UcW2VaIRjWqVX0mkUNfKDGXbAABV2W9xDpBWDi8y1Aex1cfMRahWm1wZABKtEPZC0KfWRCvR7A3MeL511WCcJCNMQEEv20KSJVD7NTEyJl2UtH4zWLHZWY+U0mq0sTxfZsGC7fx99P/h8th/kjCiiCKDCK4aSmMuLvgCXWaSCYOAparDgGJxbOp0SpUiCkrk+0CfxVLWnUajk8XfdWpgQr1reO4Qk02TwK7IN8/gkHLBwRw13NqBKSBjv3nrrArbeaKrE5SS3uCqZI4TWM4jQ5+eK4Yr81/CIa1r9H2eQ1/wJHjbVTP2IsKmfqsqEBkgHIQrDmdAARhs/Afq//Xy50kPbVFX/zC/Zk7jitZHWfT6gv5BMaE+/fDaxZl4iKX8b/hwGyzmKBm0USRG6HoZfYnlBRU31xfg7mRbFPfBpl6QSHwlBvM3LlbQMmf5c9zLCdQTTpwiS0XvfvePNmbYm1Q4Y0EpQFNYIwh8tW1m2BK3EDS0uv/IC3qArEyDHqfJfKSRfE0/tfAIyBcCcpa2tMpQqAXR8vpMAx6smB2h1fyZs2hW/h9Dc4SHOCriSZP/o2dVwqRgBpapV/XBBRqRK78DhaOuHxrN2lIVtq4GfJRLHSU6z67JILU4jDEKZI+/HVRAIGOneNMPMJ3UTu16IRjES
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUU4NDl1eFhGT2hMcnZmYUxGVjl2NTFEL1lGR0VXM2sxblQybzJxejF5NVh6?=
 =?utf-8?B?REcvbWNpQjBLV3Qra2xvRnZ4bTRFNHF0OHBKRG5YK2lsNHdZNlZ6bDl4UE1M?=
 =?utf-8?B?MXA1Sk5XdzhkZ3F0NjlhalNFRmNINGNqUlg0bldmcm5wbjZNWWFsZFN5cVc5?=
 =?utf-8?B?a3pDdS9FcTgyaEVFdTc3dW1OSHg4Mk5wekRuWlB2Q2wyUU1OM0c4VlFxUVJO?=
 =?utf-8?B?K2tsYnQ4dE50alFwalhUN1JKRW14LzNXYTcrdzlweU5KTUVjL2g0a3BoTWVv?=
 =?utf-8?B?Z3pXNmI1QjdLUVNncU1Mbk9PV3A1NzNuVFEzQk1xVjViMklUUGxVUlNrb1o0?=
 =?utf-8?B?ODdrN05FdlZmazlBZDMxR1FCWUk0ZGcrNmtWcVo2MVkralhUblVGUDJielV3?=
 =?utf-8?B?TlREUHJCY1BGUWZWekg3ZDNIU1dSb2hxcjAvYU8wWkJ4YWp1YjgrY2pSVE5z?=
 =?utf-8?B?L2RJYStWQi9ra0p1UFc0Y0EwTXdtSUNaKzBXUVVZWUo5Mnl5SmJYdFdHWm5a?=
 =?utf-8?B?SnNMQWIwTGNrTjVyWTRlVXZPVDMxUm5vYUFRRmJBMmpDRW85Sm05TTc5T2tw?=
 =?utf-8?B?SmJlNFJ0elVkczAvTkoremFDamJqOE5hT3Bxb05KR0J1RHBlOUhkbEpyQzFR?=
 =?utf-8?B?RUphSmpXR2svNG1CMEJaVGhCWk5QYWxxamtqVUpkOVBrUDl2QW1RZjdwdHV3?=
 =?utf-8?B?SG9lcGtzb3diS3JTY2Vpa05CQUFvcDRWUGJ1RDFPRGVrY284ZXJqNnd5Ynl4?=
 =?utf-8?B?NHBNNFlUZHNaSnMzZGZ2TnRvUFVsTVhqUlVXMXdQL2hGY3hnYkxzVFBpNWZs?=
 =?utf-8?B?ZzBEK3RpSUF5K21oTENuZklaZkp2K2NrM0gxZDRnMjVuNFRqeHVWNGVkbU93?=
 =?utf-8?B?VXFiZUVDd2Y4V2YvZGhQblpaRnBZQzZLdlZKZDZrUmJFbElGeWVsT3AvMk9a?=
 =?utf-8?B?SVRrbndOUWVqVTlyeEVmc0lHcW1qRFZvUlZ1WXA4VHFCSkdvTVRTS3J1QW9v?=
 =?utf-8?B?NU1Ea3p6T2NDekdkZ1Zqczg1OVlGdkE0dGZrVUk1SStZNURGS1FCT0g3RUlz?=
 =?utf-8?B?a2ZpZXVyUlNLUWgreWhOSFFaMXFFL2hxQTViTXd2SlN5WUVMUDlMYWx2aXpP?=
 =?utf-8?B?RS92d1hZQUkyTHAvNFNhellOSmpMMVFkMXQ4bWYvNVBhS280K0JNMWhGblJ6?=
 =?utf-8?B?bWI1VWRySzd4MGRJM3hQMi91RWZTa28zdTNjNzVLYm9aZkk3dnBQeFNZK1dW?=
 =?utf-8?B?SkRrUnJXVkcxVVZTQUdBU2VsZ015VmM5NkJlekpETjlaLzJteXZYNE1PQWl2?=
 =?utf-8?B?b1VsckhDNERidEIzbUVaWHBtdHdxL3BqVm1pWXVkMlZ0WEl2MVhNWmg3RFRN?=
 =?utf-8?B?YUNTU1FrNEhqMlJRWHJJRUNzK1RFdERMa3dnK1ZUMXg4L25NT21McFY4WFcw?=
 =?utf-8?B?bFBIbzlUZjVkVkdEZm1kVmV6UEdyUjFPNml3N0VXTDZWcFZPdjhMTnhPRUJv?=
 =?utf-8?B?UlhDd3JTLzk3endkbHpxby9UdmoxNS9ZUno3Yk9kM1gxWGgva2NKNGpUVHRJ?=
 =?utf-8?B?MGErYmFqZDQrMldmSXVNRVV6RUNjdkwzejhKTUg2bHFHbHd0ZWQyUXJNYlY5?=
 =?utf-8?B?R0l1YWJjcUtaSnFGbWxwMzhkcEI1YkFCR3NERGw1cmt4ZlNwbk9uN3owOFdP?=
 =?utf-8?B?K0lCb2xRM3A1UVAxKzRLcGVleXhBajc0TWJSM3ZYZll4QXpqV3RpYm9KZUs3?=
 =?utf-8?B?SUJHMlBCaXR6UkpBZ2NzaFZqbHJ5c0NvVnpXV0lBaWhjUlJQWlF1ZGlGd3I0?=
 =?utf-8?B?VmV5Y0RRbHVtbUtBZWpRc2tuMFZhcTJBK0FBakFwSjRpSWY0N1h5bnlnTjFX?=
 =?utf-8?B?WU9BczBxZDFYc21ub2dyeEtWNWVLUFRRTjhMRmkwSWVyNnFESGJZaEY1SW12?=
 =?utf-8?B?b1NTekZJVVF0TXhEbHRVQW5XclN5OFc3c0ozbHYyM2xZbVRPaWhDVC9acytK?=
 =?utf-8?B?N0Z1WEZDbVBnREd2MDZWemtPait6OFh2QWVpc1p4UVRVZVhiRng1aGJwZ3BU?=
 =?utf-8?B?ZXZtYWVDbzZleTZkN0FNODZ2ZUdqUWVHZi9oaGZBMmo5SXpPT0pRUHhndXM1?=
 =?utf-8?B?L3hlb1BZOGxwK2h6NDJPb0I5OUxyNGFxZHRzN25ZQXJxOWU2dWN3UlZXZWR4?=
 =?utf-8?B?VkJSZ0V6bGJkZ3VzbkZ4MnFFbXZqYis0RjdUby9RTk02VDRrNmIxNkN2R0Vh?=
 =?utf-8?B?MHM1R0dpL25DR1VtcjFmRWZ3UjhCZzhYck5FamM2aGFscEIrRGltZEJyci9H?=
 =?utf-8?B?ZEpJOGZNYnR3ek1PZmlQc1VjZjZtYnRiU0lENTZ6a2dhOG1kYnc4dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5a7921-e5f0-47ec-57f1-08de8997c4d9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:23:27.0074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cArKJgv64xhxZ/zY+XL01rcK0kM64t9PlRSyI3J/yI2U/EiDpCvb6a8uV4zziAdM8zGtrVxDnkj9IDX1PrJbS0YA5GM5PMbW0hOI/6tpBOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233793

Hi Zoltan,

On 3/24/26 12:17 PM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-dev/2026-March/226616.html
> 

Please add Reviewed-by and other tags given to earlier versions to the 
new versions if no changes were made compared to the earlier version.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Do not send a v3 just to add a Reviewed-by.

Thanks!
Quentin

