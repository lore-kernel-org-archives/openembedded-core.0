Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBC4C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:26:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12225.1750847199056201747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 03:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271525806=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5dTP7016579
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:26:38 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mky5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgBa16oV+x2B1Vho3XQy5cUThmZPSJmYY7FGOdQSnubfidqNTaV060U6vpIBMOUSjfDYQy34XopAYNU9QL2CRGNCz0ouwW+NH/EaTsmukiaGbH686DFb6LD7qVSlPkz7rlJd776EVWvYrHHMsdNAdoPrnDk+uxsE2IsV23rx/3qVnrdW5B6tjeWm4t5hLcO1Ag0g/7lASCshWyd/PAoS2tMtGuQz+6s7roYy8f1buvUAoKr1mHR6pDbYnvF5LXdbW4jV0/08owK4qVJ6/cCfF9sVJ2LZdB7oWf2EBz0BUUqJ+4G7K+vPFbMrO2K/wWt82tFgp5YNW7hsMUUrFWw8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7YZqD5/5TON2/5i13NXB7n1SIre0pt+9uP5YMpjrGY=;
 b=KriS/M4rXP+oowhn0yatYzWZb5HCijEqhB2589j0YXv+7Jbm+Qma1c2ehLPuoTLJPZnTew9i5KKbgfUa4xZs2KKmpl0XlllIHVS0yEXLU43DLVJkPfjlStWuljwWBljSl3OqE18Xn92rg0R15f4TK5PXZ1cQJ8wW9dOjjeF8eQjs9FHmC7jsuUKbFODNY6KdE0Iaa2oB+DnpreNYHZn5uUOH+1GMN8UXZ8Iw+iUU1V1D94YetCbz6dXu3ao26I6F/wofPuU861LvwUn4NJi8L47VKFQUHBI0a5HbqUQJtX8LnqxZK6xXL2zf1E4Rkc+NLttz6Jjun5v5ajjLjP78pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 10:26:35 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 10:26:35 +0000
Message-ID: <1bc1c261-0212-4282-b691-a1be0157924b@windriver.com>
Date: Wed, 25 Jun 2025 15:56:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: Drop obsolete rust-lld and extended tools
 dependencies
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
 <c8ed7c6d-f2e0-4d51-8a48-f177dcfd3b29@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <c8ed7c6d-f2e0-4d51-8a48-f177dcfd3b29@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6df444-90d9-4f1f-6a98-08ddb3d2c2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3ZCVFRaM1hzQSt0VDQxRHpLR0RadUhCZjkzYS9UaFNwS1ZYaHVoUFVRL2do?=
 =?utf-8?B?TTJPQTdmMDNWVHNtdklzY0RDQ3VSZlEydFhPR1JvUzFpbURKQ0hZcFJFLzNW?=
 =?utf-8?B?ZGRCNUlLd2NiY01menBuN0wyaFc4czVjWnNkazhQNnFnMlJXQ2pJU00zWGlG?=
 =?utf-8?B?VUkwaUVoWFZiWHJIRlJYWDZJNDNuSVpsbW81MXg3RVFMdXM2eDMrTTBkQmtQ?=
 =?utf-8?B?NGxacEpWaFQyY2pnbHlZbFp3c0J5OEV2MnlEQlJYSkx2QkpHVjdYeUhvWDJy?=
 =?utf-8?B?S1pPY05BUzFpZ0hxRnU0QTVqY3lnZjFwUUQ5VnNuQThGdmZicVpjb1lGQWkr?=
 =?utf-8?B?aExJNjZDbGY1cjNMSmlWb1EwUXRUa1ZlcFdNWFZocC84NU1kS3RibkVxRGln?=
 =?utf-8?B?VHJhbURTeWlyYzFOdmRvMCtGelFmR3NRS0J4Nm9rVU1FOC94bmtKRzg0Rmhw?=
 =?utf-8?B?dnBOOTdnMGVrbkZpdlZuMy83cUpXeTEvL1hoYkt5RXFJNXRuejkwclFkTDNX?=
 =?utf-8?B?d3VWeVB1SnNGemc3RVdTdy93NWtuSnFjb3l6NEFFSUdpR3JXckVYc3gzTnY2?=
 =?utf-8?B?V2wvMFZhTlpwU29LWlpLOHdLdHVJZ09LeFhmWnBxbE1pMzI4Tm9jTHhKL3Uv?=
 =?utf-8?B?bnVSVGNxM1kvK0FHam5wTHMxYk55UjJPSjNsWEMya25jRGtxaWtMd3FPdlBH?=
 =?utf-8?B?YzFkek1kdjhvUisvQXk2TUdEdlFhRjNMSDNaV3hOdE44Y3lIRUx5WWlUUERZ?=
 =?utf-8?B?cGl3VC9SWWVIVFpMU0oyemRiOEoxTFhpMkFXUWpDRFJRL3hpem5WQmFNWnlk?=
 =?utf-8?B?MUtUSUJmZkRFd25BcEdSNG9oSVMrQXIwaXJWVWNZbXpUckRsUHI4MDJZcVg5?=
 =?utf-8?B?SzB4YnNwM0JRQVArSXFQMmw3SitpQjlsSGNTUDhzQVkvMjd2ck1xRjZndWxl?=
 =?utf-8?B?eVh3c3RWUk9jUnFPZVgrSExkUkVZd2xVSVJVYTc1U1hrRXZmZlZrZElSbHh4?=
 =?utf-8?B?dndnaWgzMEI1eklOZklGd3k1ZEUxM2F2d0dwMWlZemNEc2tCekFtS1pDcWQ0?=
 =?utf-8?B?eDJQazc1V3VlY200eUlrKzVtQk1wenRSYytaUVFVcXE4Z0ZBWTJJMXpvMGhC?=
 =?utf-8?B?VkszR3BiaS9LT3dPZGtXU2NFQjlqS1VaUDI0Y3AyanlLMm04aUhhNWZCaHgy?=
 =?utf-8?B?dTczZ0pMcDgwWGIrc016blR5dnhEU2g3RDhiQVNJS3l6cUVLei85UHNORnd4?=
 =?utf-8?B?b2dCY3k5MW5sVUR3aHlJS3dGa3ZReGwvVzZweWZNOTF0Q0h6eDN2MnVXM3cw?=
 =?utf-8?B?TFc4R05LVDhpSCtYcHYwWW9wSEFNUlc4YlV5MTlYS1ZEQjRwS1I3NXVQclYv?=
 =?utf-8?B?S0wvV05aaGpYYWdXWVFSWDJ5TFlaT0FwY0JYaEQ3bHRlVnRDY3d3WjVXWElO?=
 =?utf-8?B?OUI1VDlSRVZpQlNtc2VCelREN0tTRXNmK2ljZDh6YXZPVktsaXd2U3F2amJN?=
 =?utf-8?B?RFIyUnhibWtocmkxUXJCMGJtK2xjY2I1TWIwWHgrQ2lJR3BhMWg2dVVyVlBo?=
 =?utf-8?B?NDNRbyt0RFEzTVpXZkpnaDErbWZTN2VDc0pGb1pGUnQrQ2djOUQ4ZUF5eklC?=
 =?utf-8?B?NjV0cExjVExvcWlJM09qdUpYMEs5eWlwR1ZGUVJOaEdNTmFsbHo0NGdaSUt3?=
 =?utf-8?B?V3Vqb2tOZTRhTVpEeWtaRkxmUjdnY3c1bG5iMm16RUtnMWN4NmJUaTRMeDlY?=
 =?utf-8?B?eXkwUEJpMS9FdXBuM3JrL21VdTQ4SVBsUnJoRWk0ZWJCTS9SMGY1V0tGZ0p1?=
 =?utf-8?B?K2k0Q1dBSFhHb1h5cUZuQW9BYlM3NWkzaUJzMzR0N1RyVXdCWDdwYzlXbUQy?=
 =?utf-8?B?b2hYVGNxa3JDU1kxWFlwOExOYzNCekVDRGI5Qk5wZlFhdVlwejdoRzcxNXRL?=
 =?utf-8?Q?trm6BuFMIko=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjNYOVE3eDR5eXNRaWFuRmpzdGs4YlFjdkd6UWN0d1B5Mi9yU2J0Z1pCSThR?=
 =?utf-8?B?aUJVWHdsWVMraVhRSktrcHAwYVA4cXZNMjFOTUxjK0FnTE9UMjduVnJ2R3Jx?=
 =?utf-8?B?bDZ4aW1udy9EcmdxQjdtR3hMRjlobERSd21xcW9ScXYrNnpLVlpHNHBmTExE?=
 =?utf-8?B?cTd3UTM2c0FHNWdFNGhhUE5QeFA5M3ZTaGhlOHY4eXZ1NVhQaWhUSDBsYm5C?=
 =?utf-8?B?OWVBaFV0ZXBTY01oYSszbGtuRWtxVkRsckpsV0xYdUVNMWlGcnJReVU1N3hZ?=
 =?utf-8?B?ZFdaVWwxT3ZCeWxLSEZjVURXelh2VC9Sbk10eU11eEp0QkkrYk1MS2tKY1pI?=
 =?utf-8?B?NnJqaTQ5RW92a0lkWEx2V1krYklqcDBpRXJlY3I0S0VURzhWeHYvUWdHbVdu?=
 =?utf-8?B?cG9majVCaGhVa1N4UHpvMlFNUlN0bWRsRUhmZHl4N3RCMitvR21ETHRwNTR5?=
 =?utf-8?B?TkZseGdmVmhUZFNOdkpIcFhEUTNITnFkRXpuRk5Rc29VS09nUVVXUFU1WnY3?=
 =?utf-8?B?MUJianNZOWhVRFFJSkx4VEtFeFlLNjRoT2pieUJEdWI1L2l3SGd4YktpM3Vo?=
 =?utf-8?B?T1dtd0owM1J2cTQ1MFNEb2hpY1Bhd01iOW92RDlPb3cwWmcvbVVvM3E2YjdZ?=
 =?utf-8?B?MnhiRGw4MXI0SWdWcFh1M3VoZ29QUzdDdjc1QVp3TGlwSitIUys5bGFDT2x0?=
 =?utf-8?B?SWt0OFNVWlRoYkFLYTJFV1lRT1Y5R0s4SEwrWGc5SWxjVjVCUW1CcU9WU3Rj?=
 =?utf-8?B?emtWYkk2MWhCaU5oWUt5RHZ0SG10WVc4VjVZbnhJVlh1cktIdjR4UTdxSFhs?=
 =?utf-8?B?VEJWaytwQmE0NG01TmFURTBEK1ZOSGVndVNkdmM5NmhMU2lPd2kyclRnVER4?=
 =?utf-8?B?MTJLeGRUbjVZYUpVcXBkUGo1dHNXQ0JhSCtGR0x0N1hvem11cDdFbDdwZG9M?=
 =?utf-8?B?NzlqaUZFWnp3NjBpcUxFM2tobE44MEh2SEN1T1p6S3NZeCtKRFVRZG8yRWto?=
 =?utf-8?B?T1UzaUdYSE5qUGY0M0hHVEVSVzN6OHN5dzg4REJ5N2NkNllhY1hkTU1JdVpY?=
 =?utf-8?B?em9pSC84NUVFcjZHNGFSN3dibm1JZ25FOTBkL0Z2UHpWWUlsMElFYU5LUk9k?=
 =?utf-8?B?cEtpNENLQzRuWjI0Ym1YMUdYQzF4Z1NBTVlQUGRtTXE5YVpzbnU5VHd0ME11?=
 =?utf-8?B?ZWF6MU1YdC9rUE52N2oxK0FqWHM3cHhHQjMya3ZaRDFaVXovaFVTUzU2Q2ZH?=
 =?utf-8?B?dlp0cGc1MWRhNXdyN0R3ZzBTSzkzWDlKdEwrYjlMQ2tkNGlZbU1zdW1QSndB?=
 =?utf-8?B?MkJzeGIwMVlKd1VuZjZlaG1oUlNja0FmUlhqM01YVU1BRG1IWXRIb3VERTZr?=
 =?utf-8?B?VWVNblhZOTllZUl0c1lkTi9JTktVN05GaXpMRFMrSTJNaWxoajB4dktQdUQ1?=
 =?utf-8?B?a3RFdGxSOTcrOEdOd2hHVm43SzhDL0RKSXJMUm5lOGJoRmVPZnBnKzVvcy9l?=
 =?utf-8?B?elB4ZUp2UkgxYjlPK0V0Sm8rY1dHUElEZExRRG0vVzVYRjNOYUpHdDhHV1lK?=
 =?utf-8?B?a1A3MW43VHN0eXR4a1R1TEVhb05tMjJpbk1pcUVOQWs5azJ4UlNpSDhaSVZG?=
 =?utf-8?B?L2hhcUxydG45Q2hyMnJoTXRKWFZrVzA2aDVsVUp4RTRKd011UU8ybWExNTNC?=
 =?utf-8?B?bkJTWEpldHRseUF6b3A5VmFZYXl5SkVJRVVOcWxTVHpQeXZkTEJybjdEbnhi?=
 =?utf-8?B?V2UzOXQzYzJOaStSSDZuVFdxRkhZWFBwTWM4ZVJsVlUyZVJqcVNrdzhjV2ow?=
 =?utf-8?B?N0JmOWhMV1ZQZ2JUU0l6RlRCTHJYS0lJMEFnVXJLUk9uRVo0VU1sZHRaaTE1?=
 =?utf-8?B?YzVWakppSW5HeWdNZWUrSmdwSVNIRTRSak5xQkNOZmlmOGp4em5MZklWRnN0?=
 =?utf-8?B?Y0dFUEQ3ZHlMTVQyYy9HcmhuK28xbU1oRy8wVVlaa3p6aDZYZ3A2dUl5WXhs?=
 =?utf-8?B?WFpORzc0WDFZc0t2ZHJHejl6eDNQelhES0RVa1l3QXZCNG9tMmRZUVl5RWRD?=
 =?utf-8?B?aEZOSjBKR0dmZnNMWUVKZWhFdm1ucG1zbytRRHZONUVrMW5pMWpBMlUvQmRn?=
 =?utf-8?B?K0ZUOCsrbEtOcG56ODdPd1ZPRlc5Y3pyUEIxeHNZREhETE95K3JrTVNHZFhr?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6df444-90d9-4f1f-6a98-08ddb3d2c2cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:26:35.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFY6AQp6sZmvi4z8UtnMd2fdfrSAkH60SYSAh8i7KrE+Cv54pSvAQVpwpenFGqNqVFuzkiWhiflwSHcv9TFVHRe6OIcbUV+jBpEaHTQowm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfX1BGLSjIouZ9v wkQxdG+zycFRmNMf1dpxFPdWglg76XlcWMfDD8PAHRaKU4zaz23k1jCoK+cHdMZeXS72KffWYUi htWq7aaYIFu61xopfw1VqESMuDh0zeGBGLlVu6SRe5pKB0AMJ5G9SHplh6+Vhz7/1lCZ2SUuolr
 QYMMu+PygBUG96BoTZZ9lTVV4603UoC/Knvzxd+33fkDFK7t+5TGsGVE88Ac+t4Z0RSy3pLQ3I0 g2vvoO3kWfnxDYWgPvaYOkPaza7P3HGRmoOP6RD6eXdo416v3XYh7RVAJnwwH+QoyfFbtTr3sNa Wb7QRgGUCMIyuxnU1lyTy2kPX9iTzp+GhRMLtigKBDfEn1dYc9NeGchsZ/J40Rb7v+h0Z2vkBAX
 hy27zOWuMaKRd7tIKBUdEMd2plimK1dsSFd8k3c1YkYhE5Go/0JKYgDOU9FGbB1iIuu0r03E
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685bcede cx=c_pps a=33vzwVeaTI93/w+ci0ZVvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=s0yWKYAWgm2UBUt_l8AA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jpzjdj_qKxks2RVosMfyrst6kJHIV3gI
X-Proofpoint-ORIG-GUID: jpzjdj_qKxks2RVosMfyrst6kJHIV3gI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=684 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219313


On 24-06-2025 21:43, Randy MacLeod wrote:
> On 2025-06-24 5:14 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Some dependencies introduced during the v1.86 upgrade
>> were needed only for rust-lld and certain LLVM extended tools,
>> not for the Rust compiler itself.
>>
>> Since rust-lld and the extended tools are now disabled, these
>> dependencies have become obsolete.
>
>
>
>> Additionally, related tasks
>> such as packaging zsh files and removing cargo binaries are no longer relevant.
>> They can be re-enabled later if needed.
>
> Why drop the zsh packaging? Did it get removed upstream?
>
> Same question about why it's safe to drop the rm -rf cargo.
>
These changes were initially made due to dependency requirements for 
building
rust-lld and the extended tools. However, after disabling rust-lld and 
the extended tools
and reviewing the dependencies, it was found that these changes were no 
longer necessary.


Regards,
Yash

> ../Randy
>
>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/recipes-devtools/rust/rust_1.86.0.bb | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-devtools/rust/rust_1.86.0.bb
>> index c2443fbb15..b13ec116be 100644
>> --- a/meta/recipes-devtools/rust/rust_1.86.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.86.0.bb
>> @@ -7,13 +7,13 @@ LIC_FILES_CHKSUM ="file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
>>   inherit rust
>>   inherit cargo_common
>>   
>> -DEPENDS += "rust-llvm pkgconfig-native openssl ninja-native"
>> +DEPENDS += "rust-llvm"
>>   # native rust uses cargo/rustc from binary snapshots to bootstrap
>>   # but everything else should use our native builds
>>   DEPENDS:append:class-target = " cargo-native rust-native"
>>   DEPENDS:append:class-nativesdk = " cargo-native rust-native"
>>   
>> -RDEPENDS:${PN}:append:class-target = " gcc g++ binutils bash"
>> +RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
>>   
>>   # Otherwise we'll depend on what we provide
>>   INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
>> @@ -237,11 +237,10 @@ do_test_compile () {
>>   
>>   ALLOW_EMPTY:${PN} = "1"
>>   
>> -PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-zsh-completion"
>> +PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
>>   FILES:${PN}-rustdoc = "${bindir}/rustdoc"
>>   FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
>>   FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
>> -FILES:${PN}-zsh-completion = "${datadir}/zsh"
>>   
>>   RDEPENDS:${PN}-rustdoc = "${PN}"
>>   RDEPENDS:${PN}-tools-clippy = "${PN}"
>> @@ -258,10 +257,6 @@ rust_do_install() {
>>       rust_runx install
>>   }
>>   
>> -rust_do_install:append:class-native () {
>> -    rm -f ${D}${bindir}/cargo
>> -}
>> -
>>   rust_do_install:class-nativesdk() {
>>       export PSEUDO_UNLOAD=1
>>       rust_runx install
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

-- 
Regards,
Yash Shinde


