Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3967DC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 11:36:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.web10.12682.1750332997012951495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 04:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=EighfZwO;
 spf=pass (domain: axis.com, ip: 40.107.159.25, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTyZxXS7kkTp8PUDATAkXTG74LXtTgWaP6b7nwRt8B/5wa+zHYNS1E3NVRYKhSYD08PmolX/G/G0ffRCLFKlk05YNFTHqkbidyti1xTfPdnXCUtk2yZZ4IPJX0ByDyy20DoHSTXobA9w0RtsPahAs+xpX0yF8qgKo8lqdUFh3iHuRT6cXfmJoZb3UeqAl7QJdNkCxB63P2NpD9/tgrC3kNeOpDhK4UzIYvmuOg1iQaQnXwVBnpz74Ep6qPHluzTdci3afCUCN6xS6WLPKlVjwVjVLJ+tDHbOk73x3XGwAG7BQd45wJKVhev1oqHmiy63zRXL94oyORNY9DmkOAzdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DSIDWHLvvNjfCuqNoAKSWdjRo65uOeBv5iaXjIr29E=;
 b=Jkz+v0GfzX2Z+ofINlEL2vQE1fa/l8vMAqktV+9/QwIwZTYgcbh9nhJMmVs5Tmql++5iYF1sxmXeRCOWSVimd8YSauhvgg5iW4jCu/Y4sBKH8wIAoXQxTvO3fM+DjeKl0LfoiOEc5PhaQwAMwlpZQY25lrzfDpPQxqFs0YPraZSX9DCPqF7mUG6EwBp1e9cLKQZt0G5jTQIOdd9FroJyLZfuj4GfYtndXS76BCouvOC7GBLKtIKuS5ghzDdxdMzOcpyHiDZKKF29+7ORfru5alQ3B+srFbxsMXii7kerJIHaZ4ecpiQLKDGZGYMYTQ1+sHSaZLT2VBhp9vNj/UGUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DSIDWHLvvNjfCuqNoAKSWdjRo65uOeBv5iaXjIr29E=;
 b=EighfZwOVyG5CXRJdijDDTvNHATJaN67TNOK4U9RkV+HpiqQgNIq3MozAmKf3Tg0M5jUeqH8gkLu4e+AU5eI2IAs6cUVl/3D0Wo5ADwY7D3eCrEJaR4utFB5VLRgwW3D7IGIzscK+F5NK8mLj62g497LbqdL8bP93EtUdWx3//g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by DU0PR02MB9799.eurprd02.prod.outlook.com (2603:10a6:10:44c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 11:36:33 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.8835.018; Thu, 19 Jun 2025
 11:36:33 +0000
Message-ID: <b41f1b29-4fab-400b-b27c-86bd69a1e111@axis.com>
Date: Thu, 19 Jun 2025 13:36:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/9] scripts/recipetool/licenses.csv: add more
 licenses
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250529202802.1198179-1-ross.burton@arm.com>
 <20250529202802.1198179-5-ross.burton@arm.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <20250529202802.1198179-5-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0069.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:8::6)
 To DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|DU0PR02MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f87f29-5df9-47c9-7439-08ddaf258a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rmd3WWZMM3ZSRUtjeUVDYTZUZ3Y2MGE2L3piTm90c2hJY0x2TEN3QjFsS1M5?=
 =?utf-8?B?bXNNeC9EZUxvOE5OV0Y4YW9lOTdUMlc3eDhUZ00vL1VuMGMzN0N6aVIyalkr?=
 =?utf-8?B?MnpwaVFoMUNjUGVwYWtHcjBtdWF4ZUQ0MUp6eTM0YWR3akhlOW4reFlPZkxM?=
 =?utf-8?B?bXpqYkUwZ1kvMEpCd3pFSHBHM2M2YjlEWGtwUmlCbVNaQXZhNHFaWEJrWHdv?=
 =?utf-8?B?a0s0OERFTjAwL1ZZeEJoazcyejhqM0dKZTBWN0R2N3dOa29JMTR6MUw2bVRN?=
 =?utf-8?B?RkFQVXFQdlFHSDg2UTZYQkxNMUFlaDBPQVlyK1BVTnJldEFwUU9rT1J3WFRK?=
 =?utf-8?B?VEc5aU5XK0xDdDRMdFFkK0xEVWFZVjZ4N0VnREkvVkoyaTNrK0M2ZDhJZXdS?=
 =?utf-8?B?dEtoQTVjaHdERDRxKzZZZlJxZDV5MHN5MkJFUUN4WnhqZlNJTTNPaHhsd2g1?=
 =?utf-8?B?TE5RVjE3Kzd6a0dSdWUvSUlJU0VRbkRsdEprblRlL1drT0V1RGpHd2VuWW1j?=
 =?utf-8?B?R1grdWZGVlhBaUliM0F2V21qemg0RmFyLzcvTUdqekc4K1RicWFpRHRrcE41?=
 =?utf-8?B?eHVFRUxDa0JNWllGOHBjYXpLNHlNMlc5MFArK2JmbENBaEM4eFkrYWZpclZx?=
 =?utf-8?B?b2J4OVdFblBuSDE0bTNGWXNCaFVneHBqUjNOL05FVzhHOHI3dHQ4NWtYamtl?=
 =?utf-8?B?bVNhY0xlYU1rR1FLcnhjcmRCbTNDMEhvaWpIejZTa2xSTlpQSER6WnlHZHg2?=
 =?utf-8?B?eEpUMksxVkkrazd4T2hXL1dIN05vazQxUFdOY3pjMVdJSFB0SzRPV3Jwc05y?=
 =?utf-8?B?T1JkbitvNlpTTW1MZENQblExZkZRSHM5OEV3aTN1SERsVjNpaVh2NlM5UGw3?=
 =?utf-8?B?TmE3UGcxRXdMME9hc01aOEM4UVNBQlRZUzVxbzRwdFY1STAvSEs3UWpOcmlu?=
 =?utf-8?B?K25JZjVaZlZxdGloanhoWXVnV1YwYi9TeEVkTEFSN2pueGtkVWxNT3Roa2pl?=
 =?utf-8?B?MkFFazVjNDZGTWNEN3dET1B4dXZCTVZXTkx6RVBnSHRlK1VWYmpHNnZ5VVJZ?=
 =?utf-8?B?V3dpZVdZbCsxdXdZUk85K3JLMktFcXRCMElDNzdvMEVVWTYvK1V1ZXNwdlZQ?=
 =?utf-8?B?M3N0TTR5RGRmeW0zSDF5d2pjQlE1MzhUSHJlVGFmR20rOFJ0d1RUdGkzOVgr?=
 =?utf-8?B?cWQ0c0FDM1NRUkVjRFg0YlFGQzR6azk1dXNOZVcwaWZnNUV1SFR6c2lCbUkz?=
 =?utf-8?B?TENVQU5sdTY1amJ0Ui96cVZCeDQ4bTdxaExYV3NtY05kNDFidTFlSEdLRTNG?=
 =?utf-8?B?a3hQbXZqa1VwTC82TmhBZVpqN2YycWFpRlBhWllMU3Q5a2xSWSszRytMdWlQ?=
 =?utf-8?B?YlE3NUxreDQ4dStPQXIrSVk2OEF0SGNGcXoxUGhrQVNSQko4aW1UckRoTlhX?=
 =?utf-8?B?OGNrQ1JyK2hUTjNsaUhZQlRESnJ4NjlqaU1YR2prbUFEd2R1UjJMdkk0ZXVu?=
 =?utf-8?B?bzB1ank4R0xzZG5hRHhMK2FvZUVpQnU0N2IyWGJPWU1GVUNRR0hLbkh5YzZE?=
 =?utf-8?B?OG9DQ3VuL3ZYZVlLTDBzc3NVRVhHTUhlOFdacVltRFdKMklXdkROV0F6VUp6?=
 =?utf-8?B?ZzIrd0R2blZuYmVqK1JSWlVack93UklrRVNNU1cxb3dQc2grUjRRUTBGTU9h?=
 =?utf-8?B?Y092VDkwT0tNYy9CeHBTeVdROS80NlY5Q0pTN20rbXM1S05tL3luUDc0MHAr?=
 =?utf-8?B?UTV2QXY4SkVUbStDbkUrVk92Q1U5NjhBNnZyMnNaNEFKaExZMlhmaWRoeXdH?=
 =?utf-8?Q?5BX0ALumNVa9LVNOgYgbhBRAZkPWmYdG+TA+w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zk5ydmREdlRPTkN1bkZRaWVGb0xNcDNUUFJXVjJyZXhlczFYeDI3MGxzS092?=
 =?utf-8?B?VnlUNlVvSlRPMnFTUUJORzhTM2ZQQWdTQ1FSZzNBTXdNZkhuM1NQNVl5eHor?=
 =?utf-8?B?VjV4MUI5T0F5bFhldDg3UVo2RXBVRFU1OUFxQWFnMUxEOWpIZ3lRSWFaWHdp?=
 =?utf-8?B?aXhYWFNMUGRrZzFSVHYxTTlRY3ZVK3o2UFc0Z1RXL0dmR2Z4SXhnVWg4Ykhk?=
 =?utf-8?B?RDg1dWliR1hnYmpmcHQySkZoSXZkSFpxclE4U2hnWjE1NG1kK2R1RXRvNG0z?=
 =?utf-8?B?SVh1MnlQcEdTMHZxb28zQ0krdXFsV1REcElzZlVQOFduekhhQ0VlRmpxSlB3?=
 =?utf-8?B?M2FZemR2K2xHS0JQTFRmM1dyWDQ0NCtBd25MWGhvRUhLQVB4azFNODhCS3lN?=
 =?utf-8?B?NG9adlZWNXpjYnZBamFrQXZ0NHMrN2hDRVRxaFRyM1NyS3pUaG9ZMElFZFhy?=
 =?utf-8?B?bUc1Y1JKSDMwVmtTTGhPMDNSckIxZUtKY1cxbHJXV1pBdXo1R2JnR1hRcFk3?=
 =?utf-8?B?TC9UbXpZR3BlZ01JZ3VNNThvK25TeWdmbzJHWTg0SElMeGxmNGhNcVdFRWNv?=
 =?utf-8?B?WlhHdnpTRDFxUmxOdDBGZE9NRmhhamlsUEF0aHg2Y1RoZlI5UFQvdGhocjVz?=
 =?utf-8?B?K1NHUEl6NSs3V2RUR2VsUE5aQ3ppbUlGNGRMOE1IQVlKUVBoNzdWbnRha0JZ?=
 =?utf-8?B?eHVwdVg2aEd5a1dMek5nVXBGUTljL3dYNS8vVkdKbWh5ZGYzOXU5UDRwdlUx?=
 =?utf-8?B?WENGZzY3QnVYS0lvdnJmYm1OOWVVb2ZuanNGV0hUK0t1enlJakl6V1pzMm4v?=
 =?utf-8?B?VTduQi9FdjZ3cXFkN0JHbmNtQVFkcEljYUsyRU1XSVUyZHA0RmRabzN1cDJl?=
 =?utf-8?B?ZnNXZjM2ZDJ3L2drT3RCb0c1blc5dG95WUN0U2xiMjFaa09NMGNOcmNMcit3?=
 =?utf-8?B?MEV0UW1FNkV1SGFGQ3Qra0QxYnI2cEd6eStRaDBDRGJuS0dKZ0JRdERtK3VU?=
 =?utf-8?B?dTBqTHhwU213NWJFc2Ezb3RIeG9STDBnb0NhQytJbzJPVGRqMDZkdkt5YWNV?=
 =?utf-8?B?cHgyVEM1M1ZkNnlicTk4MXVERm1BOGRMbytoY2o2eWpZSG5DUjNmWnE4TXVo?=
 =?utf-8?B?ZW1ZZmhkaE9GenRUS1hsNklpTGV3VldFNTRqSjVJZEJhS0lEaTQ3K1NkZGRZ?=
 =?utf-8?B?YnVoeW5aVWZPV0JKdzIzSS9Zc3VUMDIwL1hGTFlNai93VHRDdmRGRGNydmVk?=
 =?utf-8?B?VFBiczNrczlQeUFGOEFvUThEaFowSVVJQ2sxbnhhUDdWQ1poM2dYN1RsSU9V?=
 =?utf-8?B?MGtVcERFZGQwaDBkOTBUdmpsOTk4Yjc2eC8wemtjRzdkeHBadkpDVlRuUzFu?=
 =?utf-8?B?RVBJN3NjYzlWR2xOMHFmWWZQQWw5S2FsckJzVkVnSHBZbVBsL1JseTRjRkdQ?=
 =?utf-8?B?Sk9MbUFQWXk4TUxmTGJ4MjE0K2RBQzVWL0k1NG1CVmsxbEorV3I1VXZMK2Er?=
 =?utf-8?B?QndaNTVIazd0MFJyWmpBK0FHYmxwQXkvWnpwRFBSVlJ0TjV5RFNxem5zamh1?=
 =?utf-8?B?K2Q1a3h4M1RGa3RzSFpsOW5KaStWWnp2YlZ5cEJabkVseTY4aHlIcFZ3c2k1?=
 =?utf-8?B?VzJ1eFplK096Qyt3ajRNRWhqS1M1V2FsaGVGWnZhbEpVQzhjOG9PVEU2TW85?=
 =?utf-8?B?S0szMVB1Ly94UHdVZlVFMWkxNWFQOXBtMUlsVktJTmVpTWdTWXBiWk51M0JL?=
 =?utf-8?B?bDg2OXJzZDdxWmFEWnFxSnFSK1lWZFRkVmdKbGVXQkJkVkxBZyt4ZHZtK0d5?=
 =?utf-8?B?L21rTldTakU4SVFMNkdYblZMcXEwNVFpNUQ5QXNDTWd4dVFYdlFGekp6Z2x3?=
 =?utf-8?B?Q0dyR1M1MmNHNTlNT2VOVWNhYzlGbi9NeFU4QU5NR1JUUXI1RTNrdFBabC9P?=
 =?utf-8?B?UzBONVpCSHdRanVDSGpFeDVZZHFSS0lvRlNqcHg0a3FKSVpUekV0VHQzUUJD?=
 =?utf-8?B?YmFRc2llaXpOczhlQzMvd0ZxMS9wV0pBV3NIV1g1WFpMbGN2WTJCajk4cExj?=
 =?utf-8?B?ZEU2SFAzdFE5Y3pXdVcrMmNBK0NyQUhCWU1FLzdUOUdLNUgrRW1xRDBpUXBM?=
 =?utf-8?Q?ZMhxtURAdwXCUdAAKEYyA+CdX?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f87f29-5df9-47c9-7439-08ddaf258a92
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:36:33.3288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q0a5r67ZKLxv61fnxfU9R8XDf2tBznEtP5DBC+pIIo6k8YP/DbSqz269WL0aLS2xAdavanaELeRaDG8Os15ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9799
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 11:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219069


On 29/05/2025 22:27, Ross Burton via lists.openembedded.org wrote:
> Some more hashes for some Go modules that I found in the wild.
>
> This method of license identification is not scaling...
Indeed, still seeing one info message about

0ceb9ff3b27d3a8cf451ca3785d73c71,MIT

for github.com/ghods/yaml@v1.0.0 when testing to (re)create the crucible 
recipe
though.

Christian


