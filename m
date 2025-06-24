Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131B2C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 16:14:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2550.1750781640330962095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 09:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82704a5857=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODdNxH010221
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:13:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqaka3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:13:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2+bicnXZFc+9zho31DQHVzqXIOHmdwNDYx4jVz8d4Wrgdt8FZuhpbiOpaYStEB9ygzX9dqEE8KE8EYFIicFeDcih9delN7iFQE7DqDccCnBKsrnEuz3t6Fs5CvLAqX8/wC9RpEelToDcEAuicFpIuWnXdIQYO/iSEbS+J+8tVKfXq6Bn5uAP1g+US+HS75QBG3nSYSHnrmvLug+2mVIHFk2NJ49WQvOSrkxCW3bIZP+/+KixPBHgOSg6tKInww3tuTOt9N88Rxb5qOOrTsmA11nujsZJ7ERRrQM8MpaIS0zz0Zzo/OilpATtqtr9mQLpasck023KAkxB+99Guv7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IHzawTKet2HJEdt2NJ63uLhaxqlDDRfva06FU45ecY=;
 b=V+IelJ3R4OyxE3W8FJFwWUQ48Xzlzzrr4GQjSjFRG4MfwFFrJ5jitqOYlqveY/n9F+lISDOTAY6WSBUstpyyemCeWMb5IYAoQrSa4FV1Fw7TiyPIS3CHk5LJrNBHbowknK0f1ZIP9Qn/Ip9UAtY4joPjkqHx27QnkrDbkUJaADx5QqUHH92Jen6QWPouRWQQ/xYyYBAybRtfUnuiSUgk2FN98ePtlwILxstaCVFyRxNYeqQnNpXuFqnQpoykxIYiku0Fr10z18YWgGA8Imql2xaSkZKfViSE08ubvzt3JsPaAVlv5ZdX6R3RGQhLUahHWYVwB0ACXjVsiPpSMbHeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 16:13:56 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8857.025; Tue, 24 Jun 2025
 16:13:56 +0000
Content-Type: multipart/alternative;
 boundary="------------jMohk7Il9GpWK9KNfX0WnRIk"
Message-ID: <c8ed7c6d-f2e0-4d51-8a48-f177dcfd3b29@windriver.com>
Date: Tue, 24 Jun 2025 12:13:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: Drop obsolete rust-lld and extended tools
 dependencies
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: PH7P220CA0171.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::32) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: cf26cf8c-a17e-4b03-68da-08ddb33a1ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3VJOXFuclVyVUdzbEdaaEVocWp5cVorQzZXT0R4OG9oZFpPK01YZy9CU0ht?=
 =?utf-8?B?RFNNTlNPVXlxNXlocEtvNk9xd1NQNWVFWWRQNmNpOUZ6czE5dXhNd2tFMEl3?=
 =?utf-8?B?Q2VaNHhZU252RGJyL0Y0NFV6OHZ2Umk4b2cvY1l2RmFEeVg3S3JTeFZvSHpN?=
 =?utf-8?B?U05oT0V0VmVXeHE2dXo5ODAvalZVTkFTNlJnUlY3SE9tUzhMZXRDL3VBMHdo?=
 =?utf-8?B?cVk1bXc3OTZaMDlFek1ZaWNYV01RdWpPNTJMNXZnMnc3UVA1NkpjazZiUHU0?=
 =?utf-8?B?TEtEa3I2SndobDErS1l4dTIwSDVxYUpuNFRCcm1HMkZDa1Q0U25MMFphY3RC?=
 =?utf-8?B?S1VwcGxNWXMxd3FrRXNxOThzbDVkdFJ6RkVldFRFQlNSYWkyaHljbTJkNjBV?=
 =?utf-8?B?bWE1clAzbVpqcGZDTC8wWHFoWVZFaXhUN2tsa1M3anpPa2ZyUW9nTTlTekdC?=
 =?utf-8?B?TFFVWHVkYlpaRlBlWnZJYkR0VE13MmdxUHd6NUd6TUNPQmM4dm9hTFpEcnpQ?=
 =?utf-8?B?Qi9laE5LNzBLR0NXWXdmN2RVUURldW51eXkxS0g1Y2JCb2d3R2ExWUgzekdr?=
 =?utf-8?B?cXhjYlorOUZ0eE92UWpVdlNxM1dwd0NSZkpNQ0FHVXV3YzgrMVg4NjFrSVJZ?=
 =?utf-8?B?bUd4bnF0REcyU0pWTHBVWEdpSnRBRHFzajVDYlNZaWpGZlN6Tk9mUXB1NnJh?=
 =?utf-8?B?Q0pIOWhzZ2xQTXZkNTlVYlNzUkd2Mm5nK0NDYU00NGFzbHN4U2hNVmtsZWxx?=
 =?utf-8?B?Uk1TQytFY0ZmRGRGYU1zWFR0cVNUb2ExaFJSdExKZnM3QXVzOTFJQzkwM1or?=
 =?utf-8?B?UVM3ejNlcElMZEhnR1hUYjZFS2tuM2FlakNvRUo5UDJlaEUzUHM2U1ZsZE1S?=
 =?utf-8?B?ZEw3d0Y0V3Y4S3NXNmRBV3RqSlcvRFhjdGhIRStqWERtV0Q5VmpjRzBwS1Az?=
 =?utf-8?B?eW9ObHdIa2NIOFFPUnhJTnhIQW5RTGF4N2VUeEFqVTNkOEhmZ3oxMGdmY1kr?=
 =?utf-8?B?ZVRJQzRndW1uaHBKYnk2cGdnTWdmcEg0a0xqeWNCVVVFVFlxTjJQK1FNK2xk?=
 =?utf-8?B?Yk9pS0RYUEU2U2pBUjVLbm9LLzY5UmgyVmFEWm9kRFZhUHhzSEtibkJxY0lC?=
 =?utf-8?B?enA5UCs4a01ocWlDRlNDZE8vNHkyaUZRT0dpZTV5MjRGWUxFbU81OHlvV3lZ?=
 =?utf-8?B?K0xTUHNQNEJTaExYYndYUHVYN2t2UDF6a0VvQlZaNnIrc1IzdHJtRU1haE85?=
 =?utf-8?B?cklYNzY4dVJicmhuQ04xM2hESVU1TENod2k3dmlZN3gxVE5Ob0tXejQxRmRH?=
 =?utf-8?B?MjNBck01dTRSR1dMWkJrOFczT2ttVHJZTHdyZG83MVkwb3dXd01EcERRa0tO?=
 =?utf-8?B?azBjODNsMHBOWWMxK21KclVuQzladFozNWl5akhzWGNjNDZvS1U4UklxNmht?=
 =?utf-8?B?TzdnSXpaTzZkN0tWU2s1ck1ycVg1c25hWkpOMjllNm11bS9yeDZSYXZ4ejVl?=
 =?utf-8?B?Rm9sSUFFSHNUVTI0YVU1b1NIOVJKMFduejk4bFgwTmRIY0RoTXZLdkZabDJJ?=
 =?utf-8?B?RlV5Q2FyMWx0bDdXQ1pRTWFudlM3MzZ5S1o4M0JMNG9OdnBzN3FTOXNFaERK?=
 =?utf-8?B?NmtlUDlGV3JjdzJUdzlhTHVldGtUd0dxYng5WUdOMnlhOExIdzNTWHM1T20v?=
 =?utf-8?B?ZDVqQndxSkxUV1gvT3IrZzhibml4VWIvSnlCYVd2aE9VL0s1S0M5VFB6VGg3?=
 =?utf-8?B?Qk1Kb2ZYOTFVK1Z6MXhFRnRFc0dKbXoyVzFHRkJJZVN4L3B3TWVGUWNVTmFm?=
 =?utf-8?B?NzhhQlNISzNCNklUcmwwd1FhNlJHNEk2N2dKVTRESEJZb1dwUFdFeE5sakIy?=
 =?utf-8?B?VjlOVG9BVVlIS2U4RlhuWGhFcFNFTGVTeUw1TzZ2djZZSHZZbjMxbWVOUGN0?=
 =?utf-8?Q?FFnavIlkylM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0JTTDBmRm9YWU1ZUm80Q3hwaFJlN2VieDlMdStybm01RVhQcXladmlOOCtD?=
 =?utf-8?B?b2tPOEh1Uk85blQ1bDNyQzROUWlQaHRSQVNEMzh5cEc2cUxpYVRJalRjN2pB?=
 =?utf-8?B?ZFp3NU45SXJVZGpSRDY2dFZzZkp1SGxGeU10bmNmL2N5K2lwc2VDMy9zeENq?=
 =?utf-8?B?c2hzdy9CUVFQVnJHSy9LZnRmNWV6ZEdwTEpWbFp3dElUTGNHZG9EZUJMeFRI?=
 =?utf-8?B?RmZsdlhLOGRuUk1BZElmS2pzY0VWK1V4NHdONUZjbEJ4aXFzdFp2SjQwWFV5?=
 =?utf-8?B?blN2U09SYmhvdmN0TmRmSXJkdmNYN0c0cm8yZTRaN2RzMm9HYlVHLytGamFu?=
 =?utf-8?B?dU9qZjdZYy9FbEJDZTk3aEhubHUvNWhuaGMzRUNTTHlnTTBSTFdUWTlOeGx4?=
 =?utf-8?B?UThLWnA0RVZoS1ZtUDJrVUhMMHIyUHFBakdpRkI0OG1uSjZuRUI4TW9mTHBV?=
 =?utf-8?B?UHJ5ZExoU3E5TUtkVXNaZ0RTTlBKRWJEcWNGVzQxcGpHcGh6WWgrTHFFV3lp?=
 =?utf-8?B?SWVhQmFOSytmNG5iN2xIdGpZT1huZll4YytDc1h4MUo5OVhjZjZ0cmNqRUNn?=
 =?utf-8?B?UkV1MEw0bktsdSsrZEpLNkFjZHg5bHZNblorN2pYaGdkZzJqUUhaVEhCT1Yz?=
 =?utf-8?B?a01lY0lvVU0wcG9YdUNJVmxpNDFac3c4QWVweHdtRHhPMWw3azF1Y0RnMVEw?=
 =?utf-8?B?YkE5VkxsL2lyZW5qcVJtelpuc2RGWk5CR1FubmdJRDlWc3RheXIwZ3VSL1Mx?=
 =?utf-8?B?cjFYemJRQU5VcFdVeDlTOFBnOEpqMTc0d2ZaejBmeVRERVI1ZjV3Ly9PM1Ns?=
 =?utf-8?B?cHJJTGMrNHZlV1EwSnV1RnhjWnpLRWhPcXNKNTYzN1NyTFg5TTd3V1FDaGdv?=
 =?utf-8?B?aElMejJ5MnFDRytMZ2piUlBpRkN4TGVhRU1Dck5Ub3hXVHY1U2ZrNXNab1Y3?=
 =?utf-8?B?YWYrSGE2TWZwRUNxcndzVzRMM3NncGxIYmsvRVRkdC9qWDVLMUdBVUN6WlZt?=
 =?utf-8?B?S0FvUHZiSFBiSjc3VXJNcGp3L29ZZURlSEFTM2tvZkNEblhscjNLS3p6Um5P?=
 =?utf-8?B?aUhkNWxRb3lsZ2hZRkgwVGVnSTVyUU4wL0VNaWZ4OHI0NVUrNWlxdUg5bXhm?=
 =?utf-8?B?MHh1ZjIyNkY0R0FLYlFIUUxQSTg2TnMxT2dUNk5QWjVSR3pLbVBlbTV2Vnp1?=
 =?utf-8?B?Yld0UDFTbWZaTUlGY2p5VmdVb2tvZ0JqVjVyMHAvUm9Scm5DWWtJbE0wYWIy?=
 =?utf-8?B?enNWTURWQ0U4NFpibk43ZG9MbEFxbm8xalFDRzhOd09DYW9ldkJzYjEvZlNr?=
 =?utf-8?B?b3RhZG9KYnd6MFRRZS9kcVh2QTMxQ2RjWjRNNmUza25vYTJ2SjdUNlF2ZjRr?=
 =?utf-8?B?Y0ZxZFRkL25LVUJXZ01ZTFhDMXN2YnBzVWhndmo0Y1IvOXdmS3Rqb2Z6V0V5?=
 =?utf-8?B?cHRpNHoxb3FoYXlPV3ArWGQ0MWRiTkVKbmMzSklLUmdIQktid0lGcGVBcXBJ?=
 =?utf-8?B?dVB5QXZBcGY0NmtYbkprUnBZcnhmaDR2aFpiTEZSV1U5S3REMzdLQU1yV0hz?=
 =?utf-8?B?ejJabGtnd0VjVy82T3lJM2RleVNCWC9EUTRQbHVreS8vK0kzMXpGd2RCT3lL?=
 =?utf-8?B?UHBtZnY5U0FKOWhKelFGWENEc2hhK09TL0pNV0hEbkV4RTBjQW9oUkFmS1lN?=
 =?utf-8?B?UzdYb0xESDJDNmtvSjZ6OXlDNlhKaWpwNnV6cE1FTVVIank4aTRvOWl4aWYr?=
 =?utf-8?B?QXV4SDczZjJOb3NKNWVsVVBuak5PbU92TjJmYmUwUi9VMTliVEdRNzBxQ3B2?=
 =?utf-8?B?d2EwckhrN0Y3ZzVXSVVlWDJmQ2MxaVlCWFJGQ1gwZytMdjY5ajN3Ry9LaHVJ?=
 =?utf-8?B?QjVKbHVVUm9YaUxFVThVK1R2NDBja3JFZVdCMjJxL2U1T2dqNGJONFlzWEEy?=
 =?utf-8?B?UVN5RHF1M2dEK080czdnQUswd3cydk9kM0V5Q0FRTUFHblhaRnc0VUJGQUk4?=
 =?utf-8?B?Mmp1Y0pxTVgrd2U4V1RWR3kvaTJPZzR3eTY1dFcwNmZjci95L3hTUGhTNTdR?=
 =?utf-8?B?dzM2ekJCcS96VUhNRWJEU1ZINzlGblk2OFJKMC9BWUpXMnBzMzVucFlsRG5n?=
 =?utf-8?B?TG5KN2cybVRIUmlXN0RyREJHTkFmMnlwOHZoYlJxZWVKeC9NU0lkTnByVnU2?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf26cf8c-a17e-4b03-68da-08ddb33a1ed1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 16:13:56.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gum1gvd+bVxFy6mBs7dMWP2Gi5lqKdMyDQMf9kpjbwLZb5jU09jfZWHwSCHMmQFSxvwf8oJjL0JKoCyLf2bM83fg5M767ZjpzRS/ev339w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-Proofpoint-ORIG-GUID: lppJ3wU1iNxt2JKF1ao4bq2KDTUTZmKA
X-Proofpoint-GUID: lppJ3wU1iNxt2JKF1ao4bq2KDTUTZmKA
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685acec7 cx=c_pps a=nbHxHWYZ5biEzOhcRz1Xag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=iqF9Y7EksB3AKhJ1HbgA:9 a=QEXdDO2ut3YA:10 a=w4T9-zdeUMYHahEURgYA:9 a=MINQfYGClcbaQvPU:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzNSBTYWx0ZWRfX7PRj3wPrylNQ OqlKQZ+xt0xMnKp/wJghpOM1AhvGbUoO4UtloZFiQX+oIwO1igWObuzUvl6LCPsiwR4ktNOMe1i 62y+0iLaOqZd+b4plDgqpR/BWPnp4+CVuVEDlhscBMsM5Go6CqpgKQfTk+3pf5npjVRmMTkR1Z4
 31/a7leT7Ut61IKCgxZmFT8iKxb5wVlSIQLLGErzj2mkIIG7sgapOAIGdhDUFaWehjn7nLA/r4S Dzl4lmQQ7tBWmbdeCVajlxOkF8Muu35nHfCgtlGKx43Ls10jFfiqbiDrpmr7RJZd/qMWMv8aaug FpyEqiYXyN/tYKHzRV70fIe9f0AnOlDJzGxeaf+wrDt5IK8fsYqYAxFfDMYWYrpi9afpA7n1yLZ
 ckz6Z6KdAc5qBwmQo6/a3B+CLQ+NBVPow9BUIHLetnOFMMNF6k1d5TXs3jicmYkddidvzTfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=610 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219272

--------------jMohk7Il9GpWK9KNfX0WnRIk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-24 5:14 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Some dependencies introduced during the v1.86 upgrade
> were needed only for rust-lld and certain LLVM extended tools,
> not for the Rust compiler itself.
>
> Since rust-lld and the extended tools are now disabled, these
> dependencies have become obsolete.



> Additionally, related tasks
> such as packaging zsh files and removing cargo binaries are no longer relevant.
> They can be re-enabled later if needed.

Why drop the zsh packaging? Did it get removed upstream?

Same question about why it's safe to drop the rm -rf cargo.

../Randy


>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/recipes-devtools/rust/rust_1.86.0.bb | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-devtools/rust/rust_1.86.0.bb
> index c2443fbb15..b13ec116be 100644
> --- a/meta/recipes-devtools/rust/rust_1.86.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.86.0.bb
> @@ -7,13 +7,13 @@ LIC_FILES_CHKSUM ="file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
>   inherit rust
>   inherit cargo_common
>   
> -DEPENDS += "rust-llvm pkgconfig-native openssl ninja-native"
> +DEPENDS += "rust-llvm"
>   # native rust uses cargo/rustc from binary snapshots to bootstrap
>   # but everything else should use our native builds
>   DEPENDS:append:class-target = " cargo-native rust-native"
>   DEPENDS:append:class-nativesdk = " cargo-native rust-native"
>   
> -RDEPENDS:${PN}:append:class-target = " gcc g++ binutils bash"
> +RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
>   
>   # Otherwise we'll depend on what we provide
>   INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
> @@ -237,11 +237,10 @@ do_test_compile () {
>   
>   ALLOW_EMPTY:${PN} = "1"
>   
> -PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-zsh-completion"
> +PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
>   FILES:${PN}-rustdoc = "${bindir}/rustdoc"
>   FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
>   FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
> -FILES:${PN}-zsh-completion = "${datadir}/zsh"
>   
>   RDEPENDS:${PN}-rustdoc = "${PN}"
>   RDEPENDS:${PN}-tools-clippy = "${PN}"
> @@ -258,10 +257,6 @@ rust_do_install() {
>       rust_runx install
>   }
>   
> -rust_do_install:append:class-native () {
> -    rm -f ${D}${bindir}/cargo
> -}
> -
>   rust_do_install:class-nativesdk() {
>       export PSEUDO_UNLOAD=1
>       rust_runx install


-- 
# Randy MacLeod
# Wind River Linux

--------------jMohk7Il9GpWK9KNfX0WnRIk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-06-24 5:14 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250624091403.2469860-1-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Some dependencies introduced during the v1.86 upgrade
were needed only for rust-lld and certain LLVM extended tools,
not for the Rust compiler itself.

Since rust-lld and the extended tools are now disabled, these
dependencies have become obsolete. </pre>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250624091403.2469860-1-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">Additionally, related tasks
such as packaging zsh files and removing cargo binaries are no longer relevant.
They can be re-enabled later if needed.</pre>
    </blockquote>
    <p>Why drop the zsh packaging? Did it get removed upstream?</p>
    <p>Same question about why it's safe to drop the rm -rf cargo.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250624091403.2469860-1-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/recipes-devtools/rust/rust_1.86.0.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-devtools/rust/rust_1.86.0.bb
index c2443fbb15..b13ec116be 100644
--- a/meta/recipes-devtools/rust/rust_1.86.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.86.0.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc">&quot;file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc&quot;</a>
 inherit rust
 inherit cargo_common
 
-DEPENDS += &quot;rust-llvm pkgconfig-native openssl ninja-native&quot;
+DEPENDS += &quot;rust-llvm&quot;
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = &quot; cargo-native rust-native&quot;
 DEPENDS:append:class-nativesdk = &quot; cargo-native rust-native&quot;
 
-RDEPENDS:${PN}:append:class-target = &quot; gcc g++ binutils bash&quot;
+RDEPENDS:${PN}:append:class-target = &quot; gcc g++ binutils&quot;
 
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = &quot;1&quot;
@@ -237,11 +237,10 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = &quot;1&quot;
 
-PACKAGES =+ &quot;${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-zsh-completion&quot;
+PACKAGES =+ &quot;${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt&quot;
 FILES:${PN}-rustdoc = &quot;${bindir}/rustdoc&quot;
 FILES:${PN}-tools-clippy = &quot;${bindir}/cargo-clippy ${bindir}/clippy-driver&quot;
 FILES:${PN}-tools-rustfmt = &quot;${bindir}/rustfmt&quot;
-FILES:${PN}-zsh-completion = &quot;${datadir}/zsh&quot;
 
 RDEPENDS:${PN}-rustdoc = &quot;${PN}&quot;
 RDEPENDS:${PN}-tools-clippy = &quot;${PN}&quot;
@@ -258,10 +257,6 @@ rust_do_install() {
     rust_runx install
 }
 
-rust_do_install:append:class-native () {
-    rm -f ${D}${bindir}/cargo
-}
-
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------jMohk7Il9GpWK9KNfX0WnRIk--

