Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D371FC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 18:00:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.57157.1747072818469711975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 11:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=722724617f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CBeY8o019156
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 11:00:16 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46j6ajssun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 11:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ve5fsc67PB0KSurcVlnNl4oWE1y65PBd4feWRcxGhLtQlQJDZKSGR8ZcrMke6oZ9YD1Wam6RGhN+bMP/vXCuUxCxHEqWVxskGpO0+M4IwzvGcIWXM5tMnGxXVgLjjWb2xeUWHBg2kyMnzER+i4rEChelAy9H39GWg+bPSXg7sIU0lwp23UwOaK6c3I44sTIha0vynUPizM41qqOUIb/6lQDHEqLage+SVbsr50xyIFfwAMZhbueKovxWNsJn91EARJbTeIK8p7G8twbjnScr0tFFdjRon5FZQr2CZ1yW+8RpC5WfYgIYCy0OpFXkE80mt5VtmoURlPHykURwo5nD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK4v8KnneG3+aIh2t9Pk/EI1rq1xX4eJXENfVV6hNYU=;
 b=lhHBkFCZVw5qbX7ReOQPlBvFPOvhFQ6Zfa9MkZklG0V4UZMu1TCOeMOGIotsXz9+inlTAYKgLzzie+6IM4hpP8Pt7O7KW9uWIx8TvHqjiNldNOuUj9Sz9/GneSoB1uJ8j91eTI1jmgTQprETc55mkp6Zkxn+ouwS4PaXWe/xGAxbvU5Uid1F5YFp7rgMmWP5Y5hAYLU0wrqR20rZ2mDTZxEHLPL+rRNJbgQftlgbjepst/wzof03hDCwiQJulPJi2MkxFnkSb4IM3rqUvKdmoacZovlaZURMGKiWFBEPTvtc/0S0+mAR1BGlv2SO8LeHUvVvqEoRnCg856jf77mK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 18:00:11 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:00:10 +0000
Content-Type: multipart/alternative;
 boundary="------------oNLmHN0qdOXVkNGOJde1orWR"
Message-ID: <545a1627-78e4-4e86-a584-11d5880611f2@windriver.com>
Date: Mon, 12 May 2025 14:00:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] coreutils: fix ptest build error with
 single-binary
To: ovidiu.panait@windriver.com, openembedded-core@lists.openembedded.org
References: <20250508072814.106107-1-ovidiu.panait@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250508072814.106107-1-ovidiu.panait@windriver.com>
X-ClientProxiedBy: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c44832-08d4-4e11-0234-08dd917ed61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1h2NmNrb2k4VE1sc0VVK1ZxT3poNWZwbHh3MkM2UUZrSEwzaWhoQWpPYW5i?=
 =?utf-8?B?OXVQYzBRNkNhTGZxejk2QzJTcHNjNDJPbTgwTFkzQXU1VW9CbWI1OXg5QldQ?=
 =?utf-8?B?ZFJ5OXVQdGRFeG1pVFVQWW82TTRtSmJHdmZnd3VoMktZQ2djcjZTdGdKOFph?=
 =?utf-8?B?d2h4TE1DVUhmbXovVEYvSklWVUdadGxKM3lUN1B1SDN5UjZZL3gxaEtlNHJk?=
 =?utf-8?B?ZHFjQ2tVakRLZ3NCTm1Bb1BnRXdGdURNTFpxdmNHZjdNN0t6eWFHWXcwU2Fy?=
 =?utf-8?B?RkJzV1RyNFl1VUN1YUZ3OTZteFQ5eGhWeVM5eTdBaS9oQU92bCtQNjlrVXla?=
 =?utf-8?B?eGNjb3pxMDIrKzFHU1lOazkzN0Q0ZzRYY2QyWi94RGtLUFp0cXVNN3NwVng2?=
 =?utf-8?B?TC9sazk2amI2SVk4NUxQYzdnNFh5V0FlU29tZW16eHNIdXlxNmcwNkIvRUtI?=
 =?utf-8?B?ZnFrVkMyNnBCV0N5UnFiYXhFYUVxMHpYalREcEJBSm0yTXgyTnZodHB1b1RR?=
 =?utf-8?B?OHpzRHVtQzRwdWdyQVdBN3FPR2xsSWpma3NoOUZhVUtpeFRMN3lxNCtLYlB5?=
 =?utf-8?B?WksvSnRhZEkyb2lSNjVvS3JJd0tuS2NHaTE3T01BN2UzQVdWanNaYTd2YVFY?=
 =?utf-8?B?c3lKVnNrTmdaYXdoL2UwTFB4VmNBWnZ1a0lZdkVKZFNsNFJ6aUdEZVhoNlB2?=
 =?utf-8?B?eTRhOGZIN0VlNCs4Q01QUzJXWUlhY01FL0lOaDROQjhLc3FXOC9BTFlyY1Mv?=
 =?utf-8?B?UXBVYXdIeTlWemdOaUJGczNjcTVTUGlZZUlYRTVTNmJsT2oxNzM4bXNwM0tR?=
 =?utf-8?B?K1VxNU1oUUJsNjRKazJhd2pYQUF5dUhmY3pxS3ZnSit5cGhMZzVjN29oQnZX?=
 =?utf-8?B?ZVdrMmtoalZXaGFlOUFXS3E5aE45cmFoMDRMVUtibTZZbXBUb0pSVFg1a3Fl?=
 =?utf-8?B?UFlkdWx6WGlXWE4yZTZCb2RKcGtweDlkVGdpZ2Nkc3AvQlN1VWM2N3lqbXBu?=
 =?utf-8?B?WWkzMkJOdlJzUkwydU4ySGw3NlRhSkRFbGVFL29iTTBlNWVRNkpnM1RrUkJD?=
 =?utf-8?B?ZUU1cGhGc3NmeUlmbDZCNmQ2aUE4cXZPeGdoMjBQd3kwbWlGRjNEYTVGVHFW?=
 =?utf-8?B?Rzk5MGJLTHBzbVZJdkhLcGhhS3lpcFJ1eEI1bXNGYVk2Q3d0NjFKWHlpKzBn?=
 =?utf-8?B?ajhjVW15NGpiaHFEQWdabUR0UzZzSUJUakZpK0xaUVRUazRlY09JbW5HKzdr?=
 =?utf-8?B?THFpOWZqSW5KYlJ4MXMyMXR4RG5ZZk5FRkNQWWJzQk13Rm9ZeHVCZERmbzVO?=
 =?utf-8?B?TFI4STJ4aUtzYW1COWNGTVlOUm1jMlhXR0pDQkozRjZmdC9DK3FwNmdjUWcr?=
 =?utf-8?B?ZDFwZ2pMNXZIdDYrRTUxSE5vbXB1QXNUV2FyZGIxQ2U5YXpyeU9QTW9EYUo5?=
 =?utf-8?B?SC9RRytPcGpJblNXMGs5N0JXTFRQQWpuL0dBRmt1Ym9EamU2MzFQSDlETml4?=
 =?utf-8?B?ZnFzWDgydmw4c0JhL1VEZHk1U2ZUL2JDMng0eEYwdkhhVGFLekhDamptNFY4?=
 =?utf-8?B?T0tESWMzaCtUQ0NYSGF0azNUbWNSMTc3dS8wM3FvZ1Y2aVRzeTdyNlFyakhR?=
 =?utf-8?B?dDlRTWNHU0I1UEFtcmtKaVgyKzJLYzJvWS9MNG4wZ3JmMlhnT2tFMndMS1BQ?=
 =?utf-8?B?VXBzOEYrMDNWM1ZHK3lHc09uRXQ4R0tqbG5CU2YyZlU2UHlOMkdNRElRa0to?=
 =?utf-8?B?ZGhOQXNHWkhBTG5UZnBoMEVya0pFN2gxVlE2cjZzcVVITWJiM0xmeEhjdS82?=
 =?utf-8?B?Ukk3a1Qwd1JvWlFmSXJPK2krZmJmRkdFVEMwcm1TV1FhMWVPZ1MxTEVaMms0?=
 =?utf-8?Q?w/vbBMMChDClC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFgwdnU3cERGQlFqdE93dGEzOW9XTTJJekcrUlNPaXBKZnk4eDhwK1gwaHND?=
 =?utf-8?B?Umh4SXBjNk8velR0a1NkNkFOM1RWbXRlK2tLeW5iRVhaSXE5dHIxbm5yVW91?=
 =?utf-8?B?bmJSL3dBQ2xlMlZXVGcxMWR5RnlxTGhvTGRyaHBxVUZuTDYrbi9FZGg2THRD?=
 =?utf-8?B?QU93VDdDL2k5NTk5ZU1PUHNKL2xJUEtLamNPdWhIa0JFVWlCNFN2YzQ1YWdR?=
 =?utf-8?B?YVRmYU9CdzgxV1ROTmpTL0VsN1F6U2VRZENZdFNScVZLUFdiK1I3Q3J5VHVR?=
 =?utf-8?B?cHR6clBSYlBra09SaHpFRFNwYStPQVNhRDFmY1dHT05yblFaZ0JJMGZhUHlX?=
 =?utf-8?B?aFpMODR6Nlh6cjFCRkNmU0RGVW84MUF4cXBPRjdxMTZUUWNNWVJHckpSdmNp?=
 =?utf-8?B?OTZHaVhTTnFJekZzZUNEU2JCTzlYcSt2ZFZIRElSdEdqNjVlZGR4ckZqQmNI?=
 =?utf-8?B?YmtZVU03dmd1a2FHSjJRNHMvR3FMZWoraUFUZ2twaGJXYkJJR216OUd3Ykt5?=
 =?utf-8?B?RXAvSUdIQi9qYmhqZE5kUGFrMW5teUR0RWp2NzVZTXovcUkzNzgzQi9Rc2Rn?=
 =?utf-8?B?NGhTeGQ3ZDg1TU9icSt4RUhoUlljWGR0ZmtvRHgrZUdyNG1ubDRMb0VuNy9z?=
 =?utf-8?B?eGVsS2R1M1N0V3I5eUprY0lCVXYvakRHMzFwWGtpSXJNVS96czJKRlNNNEpI?=
 =?utf-8?B?SDJzVGZySmpjYmMzZkdNTkw4UzYvY1pGY0FFMGRLbTRCMUZOYUorN292YVJz?=
 =?utf-8?B?aGNnaXZQTFJCTGNaZ2tQWktFQ2JHR3pzU2J5MUEvT3F5d2dLT2NSSGZkMFVW?=
 =?utf-8?B?VTdHRkMxQkN5ZW9PTjlRUVBqdU44MTBkSEo5djNCblpybHZsZVkwSEhjd3ky?=
 =?utf-8?B?UnhjcVFNdHhRZG9VVjR6V3RoUmFPaFlOUTNlOExsblI0SXlIazhBbWZ3bGRU?=
 =?utf-8?B?NlNmdHhNN2g0bldFT0N0bEUvUGFYNzI2Rm90SlB5Q3M3S25XaTRjL01MVEJE?=
 =?utf-8?B?eFd1czYrL0c2cW5FVkdWUXJVWk83V1B4ZmtsRVF0V05wdEFYcWVkaG80SUtl?=
 =?utf-8?B?ZzU4VEIxeGwxeVdFTWdkM0doaUhkeERzb1NVK0pTVEhsUHFDMmI3RDk4WDY2?=
 =?utf-8?B?aXk3cndMRUNYa3k0L1JQTDhHL05JWEE0dEdQVlArZmFWRzZ1MnZuT3IzYnVC?=
 =?utf-8?B?Qzk2Q1hUMXhXWi9ZR1FralEwVm91b2hFc1EwbzRvSC80Z0tzL1EzTy9vV3ZL?=
 =?utf-8?B?Z1BMMER6UWRVUHpJamRiWXYxczRKa3dUTjB2dHJiMmhkL3NJR1V0cDFPRzcx?=
 =?utf-8?B?MEZzNFRnK002cGdNZmVqTHRhaXJodDRSZC9WZW5DeDZDN1hNOHV6U0dQNkcy?=
 =?utf-8?B?MjBwdEJzdDFabTJPbG1IZUtrME01blZNSmpBQi9xNFFxZmdsRlZweFRneUEy?=
 =?utf-8?B?bzkzaDNoM3BteEdjWVVDLzd2VmIwYmRwSHA0YnRFdmphWlFNdWVsL1lSdm9B?=
 =?utf-8?B?RFRWc0ZGTE5ZTWFuL2ZBS0s1bXhMRFQ1NSt5WlBtSGdESktvek04dVhzOGVp?=
 =?utf-8?B?dFFoWWliWW9RQmR5dk5EeTF5ejFEWmMvMXdwZHF3UjBtN1owdEpOc2swZ0NR?=
 =?utf-8?B?T0pXdFk2Uy83a1JxbXBUdGovOS9JUnVYTlpKKzRGNXkzZHEyZXo3UzcwQmw1?=
 =?utf-8?B?TS9tUDRtRmlRaTNZbmFYNHI2TVpjZFZQTjBqN25lc1NYRktIbXVNUkwyQUp2?=
 =?utf-8?B?d1hSR2RuOHdMcVNBd0ozRHh5WXpyaEFJb3pzSnFOVTVzcHB3YmxaeEl6QVRq?=
 =?utf-8?B?Nkh2TFBnN0JFbVRQU1VVYlFKNTJtUVhscldLWWNaZWY1RzhHSlFDd3J2V3l2?=
 =?utf-8?B?aEFnMmJyM1VrTXZybnhwNHpRTTl2K2Y0dmxvY1dwZ1NIK2tsZGZNQXhMZHll?=
 =?utf-8?B?bEFWUmpBSTc3Y1MzT0Q2SXJLcWlZVXZCZEFONDkxam5xTG9qMnkxMWZjZGNw?=
 =?utf-8?B?aVVsU1hSaVFKZ0xTNVpsaWpXNVBJMUxBU0FqbzBkQXV4V3lKZElOc3A2S3Vk?=
 =?utf-8?B?M1FPMnc3WjJPdHJOdUVFdzBTTkpXRlBGUzVzL1UrYXJkQlBsSzJUcktWTkx3?=
 =?utf-8?B?QzBXdXFLM2liS1VqeVg2MTdjbGNTL25EL09aRkY1SzRXS2dsSXJGb3QrOGdw?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c44832-08d4-4e11-0234-08dd917ed61e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:00:10.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOI5MmgwA+30i2xCa4T4ekwIDtLxGXEXH8Y65nGfU2cNcfgEMQOKA0uu7zdo+XDZc7lWDiT9MLIgMkqUyjo2UHXxUkdibX8V9Cphahi5G7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-Proofpoint-ORIG-GUID: zRWxT2ncBhRJcphK347Gdw26zQrPfhm3
X-Authority-Analysis: v=2.4 cv=c8irQQ9l c=1 sm=1 tr=0 ts=68223730 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_Qzbin9yEip8Y1rlDxQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=qAxYNdvDvy1bax9X53gA:9 a=od4ZCldnx1Jm1D82:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE4NSBTYWx0ZWRfX/0kAmmyumX5+ KECNFe6yqFJO/bDCsOfDB+qhU8atbuRoGZTlxlIqrBIpbmo9JkOhYUX0hfmL0gchvcG3zCKR1+6 //9iNPrHD9tZ/FDTONQl6OCuFlRqhyOsOX1JmnCwKlYGDs2qTP4Hpqi/+wHSJUzrtvx4uTWlXvO
 fKkz86Sv64+sNdf9rTfpjfQD1/9DaK+3QaozuMBxXTQku5uKHp5LErNDEQANAkWQoOID88Lxk1R O4Hw+oC8iF15GJ1iIWEBC1y7jbqEkFVciRkSDl6B8MKVob6MkPsnH1XvgOqTYyYNm+UIkDZf8xk qfi+l6YI4t1mHfkfdZnSt2frvtMYSTOB50lhr5Lu7OKRJK/Y+nBmcJLDmbMakL47c7U8O6jF+r4
 QaNedsjS30yzgx6c1ZB3Vy/8l3UJ6belM58deWaTvJEryCuUnWkj4WpZGazCXa3NayINe/ze
X-Proofpoint-GUID: zRWxT2ncBhRJcphK347Gdw26zQrPfhm3
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216382

--------------oNLmHN0qdOXVkNGOJde1orWR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54CBeY8o019156

On 2025-05-08 3:28 a.m., Ovidiu Panait via lists.openembedded.org wrote:
> From: Ovidiu Panait<ovidiu.panait@windriver.com>
>
> When coreutils has 'single-binary' PACKAGECONFIG enabled, coreutils-pte=
st
> build fails with the following errors:
> DISTRO_FEATURES:append =3D " ptest"
> EXTRA_IMAGE_FEATURES +=3D " ptest-pkgs"
> PACKAGECONFIG:append:pn-coreutils =3D " single-binary"

Hi Ovidiu,

Fixing this issue a a good idea since the single-binary can save space:
 =C2=A0=C2=A0 "rpm package reduces from 849K to 519K."
https://git.openembedded.org/openembedded-core/commit/?id=3D94ce5d25cad7d=
81b979218a40cdf15be26a7aae5

Can we fix this by adjusting the build-aux/gen-single-binary.sh script,=20
ideally upstream?

Also, coreutils can generate symlinks:

 =C2=A0--enable-single-binary=3Dshebangs|symlinks
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Compile all the tools in a single binary,=20
reducing
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 the overall size. When compiled this way,=20
shebangs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (default when enabled) or symlinks are=20
installed for
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 each tool that points to the single binary.

have you looked into doing that to avoid the script problem?

If you mention that in the commit log, that will help people who may have
these questions later.

Thanks,

../Randy


>
> bitbake coreutils
> ....
> ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: File /usr/lib/coreutil=
s/ptest/src/pwd in package coreutils-ptest contains reference to TMPDIR [=
buildpaths]
> ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: coreutils-ptest: /usr/=
lib/coreutils/ptest/src/pwd maximum shebang size exceeded, the maximum si=
ze is 128. [shebang-size]
>
> To fix this, use /usr/bin/env shebangs in ptest files and get rid of bu=
ild
> host paths.
>
> Signed-off-by: Ovidiu Panait<ovidiu.panait@windriver.com>
> ---
>   meta/recipes-core/coreutils/coreutils_9.6.bb | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipe=
s-core/coreutils/coreutils_9.6.bb
> index b876a8fdd0..fe2cf73d40 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
> @@ -215,6 +215,12 @@ do_install_ptest () {
>
>       # handle multilib
>       sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'true', =
'false', d)}; then
> +        find "${D}${PTEST_PATH}/src" -type f -exec \
> +            sed -i -e 's:${B}/src/coreutils:/usr/bin/env -S coreutils:=
g' \
> +            {} +
> +    fi
>   }
>
>   do_install_ptest:append:libc-musl () {
> --
> 2.34.1
>
> pLK@tY:ATbOf1"dW
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216144):https://lists.openembedded.org/g/openembedd=
ed-core/message/216144
> Mute This Topic:https://lists.openembedded.org/mt/112783421/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------oNLmHN0qdOXVkNGOJde1orWR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-05-08 3:28 a.m., Ovidiu Panait
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250508072814.106107-1-ovidiu.panait@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Ovidiu Panait <a class="moz-txt-link-rfc2396E" href="mailto:ovidiu.panait@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a>

When coreutils has 'single-binary' PACKAGECONFIG enabled, coreutils-ptest
build fails with the following errors:
DISTRO_FEATURES:append = &quot; ptest&quot;
EXTRA_IMAGE_FEATURES += &quot; ptest-pkgs&quot;
PACKAGECONFIG:append:pn-coreutils = &quot; single-binary&quot;</pre>
    </blockquote>
    <p>Hi Ovidiu,</p>
    <p>Fixing this issue a a good idea since the single-binary can save
      space:<br>
      &nbsp;&nbsp; &quot;rpm package reduces from 849K to 519K.&quot;<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=94ce5d25cad7d81b979218a40cdf15be26a7aae5">https://git.openembedded.org/openembedded-core/commit/?id=94ce5d25cad7d81b979218a40cdf15be26a7aae5</a><br>
    </p>
    <p>Can we fix this by adjusting the build-aux/gen-single-binary.sh
      script, ideally upstream?<br>
    </p>
    <p>Also, coreutils can generate symlinks:</p>
    <p>&nbsp;--enable-single-binary=shebangs|symlinks<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Compile all the tools in a single
      binary, reducing<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the overall size. When compiled this
      way, shebangs<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default when enabled) or symlinks are
      installed for<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; each tool that points to the single
      binary.<br>
      <br>
    </p>
    <p>have you looked into doing that to avoid the script problem?</p>
    <p>If you mention that in the commit log, that will help people who
      may have<br>
      these questions later.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250508072814.106107-1-ovidiu.panait@windriver.com">
      <pre wrap="" class="moz-quote-pre">

bitbake coreutils
....
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: File /usr/lib/coreutils/ptest/src/pwd in package coreutils-ptest contains reference to TMPDIR [buildpaths]
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: coreutils-ptest: /usr/lib/coreutils/ptest/src/pwd maximum shebang size exceeded, the maximum size is 128. [shebang-size]

To fix this, use /usr/bin/env shebangs in ptest files and get rid of build
host paths.

Signed-off-by: Ovidiu Panait <a class="moz-txt-link-rfc2396E" href="mailto:ovidiu.panait@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..fe2cf73d40 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -215,6 +215,12 @@ do_install_ptest () {

     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'true', 'false', d)}; then
+        find &quot;${D}${PTEST_PATH}/src&quot; -type f -exec \
+            sed -i -e 's:${B}/src/coreutils:/usr/bin/env -S coreutils:g' \
+            {} +
+    fi
 }

 do_install_ptest:append:libc-musl () {
--
2.34.1

pLK@tY:ATbOf1&quot;dW
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#216144): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/216144">https://lists.openembedded.org/g/openembedded-core/message/216144</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112783421/3616765">https://lists.openembedded.org/mt/112783421/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------oNLmHN0qdOXVkNGOJde1orWR--

