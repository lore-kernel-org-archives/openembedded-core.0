Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEBAC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:25:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13136.1740669899467281125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41533e53bd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9vLIS008727
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:24:59 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmja2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCycikqk93u8zO7OxsXzLkxo+zV0BwKAg/6taZKox3CQNNi2DdauVxqYwE6yjo1Gf/iEljebufUTC/e3Q7xS5YDGDnKDGIZt/5h+F8qj6SbYnEZCVVbNSgLycJIkZzyPaJrbX0v0HsugHRBEgxn/rvSSglCg45uigFBtZm5O3S/XwcSaBmPMKLkm4Wgxqyp8xUg9P5V4Anrs06zK0YwDGtbuBIP7HVqmJx0izCiYg1Fk2IfSRllGMF2J58DbwDs3t1FySbIcDJVUQOBN0G/Xuzed2sMH/Em2GtXm9H1Vo3dsK8uiayCaEd6Rtq/k65xou+2pg96sidweN/3jt2e/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UgommfkmqUE5RLcl/VcG74tC8v83eK7LxAtX+vfUck=;
 b=BXHR4opRUjElp2A+s0sKO6bhqhXQ/ZEe3Qq+zPZwkiXdhRPWhWsHCpQdZTL49EbOkr7fLtyMzp3AjHD/FTDURAU6I4IUn9k22+c94Yrp0Qe6VNPqSVCQtiNc1sBOcrdrI2bNW7fluL0bWcaN/ByubOr0hQV/5ftV4gYL2gk+UbP56BuuHfuqJYIK3im4as5LNIXFAPjTTC2yuN8Pgc16N77g8zmwpwSMg+FUD9pDEyJMq++IMY1tnDUpK0xUbG32YuHb6LltEpWRnhKQ7FWwmkicAEsE3iibgzp+CxBLbSk52QDtG+w8V9iFaP0zQuARZpAlCK3fiujUnHS+0BBjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:24:55 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 15:24:55 +0000
Content-Type: multipart/alternative;
 boundary="------------SgPwduWWuaKTyu55IeHLwgG9"
Message-ID: <28c4058f-9a62-4774-91c9-77fe14629163@windriver.com>
Date: Thu, 27 Feb 2025 10:24:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.82.0->1.83.0
To: deepesh.varatharajan@windriver.com,
        openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
 <1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com>
X-ClientProxiedBy: PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 13851060-a614-4f46-b753-08dd5742e32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0pJRHNhZE1JSE8zTXNQN1loK3dGa0JCKzdSYVZ2UitMYzcxcThzaC9tSk04?=
 =?utf-8?B?QjZwdUI2TTZkcklGd2xlbExXQ0Q0ME56WHVHK0M5bFBFM2RWbiszcjVvZTNY?=
 =?utf-8?B?NWxqdlNkOFJxMnVkckdYQXdBUUQrbFlENHd4U1FocjBrTm9Bam1TcmN6QmdN?=
 =?utf-8?B?VmxpenNRbHFYWTNjd09iOVhQSkRBdzN2RDZCQlJ0NEw3RXFKdEpCM2tERGw3?=
 =?utf-8?B?TFlMZWN5ankvbHhYeVVjdHlja0lmc0hzYTdwTGZnQ21NclpoQ3lueklpT3lG?=
 =?utf-8?B?YWhpMUl5TnFUWjVDOURYV3hGeG11Tk8vRVphV3JUVEd5dy9tKzhac0xuVlF1?=
 =?utf-8?B?SWFpSGlmV3NEMUo3Q1ZzYk1UalVxVE5DRmxmQ1JMNnJ5Skx0MUdzSU9SdFhP?=
 =?utf-8?B?ZVlOejNOR3RPeGp4ZVVEN1lIMGRCYVc0dmQ3SVVaNjJqQm1XSWtKaHlLRngw?=
 =?utf-8?B?VVJwWlovMk5YaGpVNnlPOHM1VEo4UjVaSVhpalJ2SXdzaGR1Q1lsK2c4b1lS?=
 =?utf-8?B?ZG4rQ05ydlBVWEs2ZUdRYUNDNzdxWDAyeHdaV3VNQ1RCRGUrWDhtQjhtbldV?=
 =?utf-8?B?OTJWSm9Xdk92SVJTdnNQRzBmVU90VGZmQWk1VGEzTTNWdHpvQXZ3UU4zclhi?=
 =?utf-8?B?OWp4SXo1d3dZYjhyYjFhTWh6OGpuaUx6cWVDcDBmaGxNbklUMlBSSWZadEhN?=
 =?utf-8?B?WWZ0b255YVRSWUlQZ0JVd2g0elhLZzhrVWJ4RGlmRExFMlBvZmpTZERsVmVw?=
 =?utf-8?B?Vy9QdlN0R2JyL3lpUkNUcWRmSjN5N0xhclJlZjFZVWhNZEhQTGVtVkExbkkw?=
 =?utf-8?B?Z2F4UTVycUdKMUlLZmI4SjBjOUtCc2ZSbWpTbUdVN0V0ak1Bb3VwSU5TajRY?=
 =?utf-8?B?Sks2S0U4bVcvanVyRHN5OExRMEZjRGNOWWRCTkRONlNFWkNZSmZsSTJRTXl6?=
 =?utf-8?B?bXAvRURNYWwxUE5TNGY4SitFOHlMTnBsTVVzS3c1OEZnNlB6Ujd0MUVhdEdL?=
 =?utf-8?B?UjRaMWFqNlJ0WG9XeHhPZ1B0cGEwZ2ZmR0tiRWVoNDdCcWtUN2VvSUo0UTZq?=
 =?utf-8?B?QUYzOW5zNEpQcHpMK2xXV09mZy9MbmVIcU1MT2xGb2h3TDlzL2NEdStEZVVR?=
 =?utf-8?B?dnlWWVgzSW1BckRMb3M4STlqZVJneXRlYmM1eXNBbzdxUFFCai9WS1ZRWjUr?=
 =?utf-8?B?OGlWN0dhREw2bFNIZ01PVUh2ODBBN3Z2VW95aWVVcitnTlBzZVYyNDBENXhr?=
 =?utf-8?B?TnpzcS9vQmMxblAyNFBna2I5MkphSjhadGE2NGgyQUJ2WGtjbWU0ektmTFhy?=
 =?utf-8?B?K0QvZzZYZ1JoMG0vK3hreWh2RGpuc2t5Qi83SGlSSXhvZzNVT1NnS3NOTm1B?=
 =?utf-8?B?RkszdDNJZDBHYWpFc3NTTHFvVWY3UmNjVHl6YlhGWXUrT1dZZjhIb2NmdU95?=
 =?utf-8?B?NjYyck9teDNORUVTWXBxVWI1aWNKNERhRzE2SEpnMzNidXVUN0hLbzFYNGN1?=
 =?utf-8?B?ZjU3WTNveFBDanM5RnBpWEo4M045T3ZyNUV3VllldDFwREE5MEt2dk1xTW5S?=
 =?utf-8?B?aytoYUFIcHY2U0NFTG9LM3kvRFd2TGlSc0lvMldNKzEzQUZ2dDhYYkgycERt?=
 =?utf-8?B?K0RjSEpSN282QVltZkQ1ZmdlSitYTlF3R3Nld0R1cHBVejVaNnczMDIvWjVZ?=
 =?utf-8?B?UmYzQ0d3clNiKzdoWjk1RTFsdHNLMEQwdDJwa2EvOHlmUlFyMWM1SU1HNHds?=
 =?utf-8?B?RnEycEROSWJlMUVWWW9BUklicFB0Q0c1OFM0MzRrN3V1cWZyeDJPK2xJZ0Rs?=
 =?utf-8?B?eTlkMm1lWkIyYitlb0laSUp1N3JsUmtBaUw3MWczRVFnRHlLYkhmemZtVFZJ?=
 =?utf-8?Q?JnCxvmeN+hWxQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0p5c3dKSDJkU29wUExzcEtDRFp4ZzlBUjRLalRvd2p3dG5RMysrc1ZDVDRX?=
 =?utf-8?B?YXQyenZieXJ4YTQ1ekE1b3dNWHdHTy9ZTlNQUzNWeGwzUUZ0Vk9jZHEwUmxw?=
 =?utf-8?B?YWJ5MU5HM3hQK2FYaTUvcW9SRjRxQ2FmSTZkM3NFeWVKQnVMTEdia294dnR0?=
 =?utf-8?B?bHQ4THlJSGZSK0ZtQ2R5dGRvMmc1QXg0OG1ZZ2VxR0VuT3duYTQyaURXTnlx?=
 =?utf-8?B?VjlLYkpkR2w4TTFCZHFyVGRHQTdzc1hBTHpGUjcrdUdnS0ZoamFRbVFwL3Iv?=
 =?utf-8?B?bDJUMXFjRDF2U0t0QlBjaTZnQy8rWU1DVlVFaG5qaTdqWjNnWnMzaXB4aFB3?=
 =?utf-8?B?Uno2ckwxZHlnMk9rK2VRUURqeUtVdi9HTXVWblBDcWpKYUNTOGdZR2czdnIx?=
 =?utf-8?B?VEVVRFRPbWhjVVlEZk5ZZWJkVzVDOWtTRU8wRElEeDBVMWwwaGRwTjNlL1R5?=
 =?utf-8?B?aWFGM09tYnNYYWQrdkhFZlVpM0FEREpjTUwza3RQNktTVDFEZE1PV3dZbXor?=
 =?utf-8?B?ZXRyQlZkY3dkcDhSY2dZNzZyMVgyRjVNVjcvY1NNR3AyVHpMRCtDcTRjYld1?=
 =?utf-8?B?d3pIVzhLcCtTTWlqZ094dHd1MkN0TlpkbnYwbkt0cDQ5ZXc0Q2RmQTRjSnUr?=
 =?utf-8?B?eSs0MzRicis2V2NjVnJhWi8zWXV6MFgwZER5eXY4T3A0YzN0SXR5Tmh5eHk0?=
 =?utf-8?B?TjhocUFOQzNFMk9Xa3BnYktDVWlwOUwxMEMweFpwWlA4R3lMaG1oODdjUURS?=
 =?utf-8?B?bnpoVkFtNTNtbXRaTGNaWnRvNWdkNjFzNkU1TkNtSE5Ld3FRbUlsdmNobldu?=
 =?utf-8?B?Y1NIUThBT0xxcFpBdStuRER4RmFBelJLdkRMNWI4MW1GR3ZmbGVzbVFtaE5I?=
 =?utf-8?B?NGsxZGRkUVR1K2pRSG5Ia1ZNV3hRSGQ4ZU1RTWJ5eWZYTXp0VXpEN09BOVBN?=
 =?utf-8?B?c2dhQ1ZiTVIzeTV0VmdweFB3U2pHQTU3Q2R6ODcvSk5mN0NsY1pBQzAvVWhq?=
 =?utf-8?B?U2s2Sy9uMjhLVk8wTXVBZjUxTGJ5dmRLQWR4ZzMyMUFiUzRZajN6SUhCZU9U?=
 =?utf-8?B?UHF3bHhkbVJJdUVLR3FqZEpsMkdiYVBpQ2pPMFBqakNEYlYwUnAweVZuYk8v?=
 =?utf-8?B?R1lJcUNKQmlMSzJmM0dTMjFVUTBKdFpwQnE1blVnTVdveXNUcTN3NWFDMElF?=
 =?utf-8?B?WTRnYzBaeWFNSTNsWmJKV2wxaW5obyt2b1k3SkJHSy9rcHN1WUZTdDFYRXBI?=
 =?utf-8?B?aTRnenVtV2szbkFKNG1vWldtT1BjdEI3VWxySlVITzIwb2hjSEcvWW1YRFZV?=
 =?utf-8?B?VjBzOFpwWHR2QWJ1UjlhRmxMbUNSaGVjNGwrYUdyL2d0SnZlYjYvNHZsTno5?=
 =?utf-8?B?M1Q1QVVVUG90b1MrdU1QTUhaa3hwTk1FdnMxLzNMVCt5WGVSN0VGRmNmT3g0?=
 =?utf-8?B?N3U4bTVpUFZhd093NVZ3M3luUHF1aGFpMmZlSDRBc0Y1ZHZhL2J5V1F0M1Vx?=
 =?utf-8?B?Yk9GREVtdkdsbUJ2bEI4dHMxdU9EbFZpVy8ydVkxbVFMVC9NRVcvU2MvYm02?=
 =?utf-8?B?dEdabDFXS0FmdVF4VUhCL29RMGFFTGdyZ0g4RlJsd0kzYXlEdG9senpiZHQx?=
 =?utf-8?B?NU5ycEVHdlNENmFVdHkzeHRyOEs5VmxISzNuT3kvRDhYU0thaG5ZN2s0K0RW?=
 =?utf-8?B?SllYNTlFT3UyU2FmSFRqUmErRzVJZXRIeEFYREZNQ0JINGNuMVpqbkdCWDBa?=
 =?utf-8?B?QU5MT3lzQlN4bkQwTW5YczNNVDczZ2VUM25LWVYycGdqN21USzEreFdXYldP?=
 =?utf-8?B?UGhsQnBhUzQ2b01WWjM5R0h1RktNWE8wTzQxSHgrM1dZRHM1N25tZEdweDVN?=
 =?utf-8?B?SXlISmVMcUtDMEZZWDNvbFpJWjRFc295czgzQWoyM1l1TEVCUEh4WnYvRUZa?=
 =?utf-8?B?R1BWcDBDOFdFVnNkejJKVkoyZ2ozaXNrTVJMWUxNSW81ejY2NE13ZHltWkIz?=
 =?utf-8?B?aXUxWEZOZGRQb1htdnBjNWlFMmZCaW5ycXRDamZ5aW5INnZOanVZWW5vYVpl?=
 =?utf-8?B?NzJLZEpSbFVVREYrZHVFdDVHSGE2UkR1MVI2RDZKK3JYZE10U3FzTnNEbDdQ?=
 =?utf-8?B?UTJCWjE3T1k4RmZPWGpicndIVUJVVlRVUnlnSW44U25peVRnM2p5aUVOUUxp?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13851060-a614-4f46-b753-08dd5742e32a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:24:55.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpW1fSfg99dTwrEkzgh16IQujTrrtrDfO3cZPBwvPF3kQyrxNGFDEWyyGo/4/qpbp+cob/vlYiGJzTZl7G049RJJcR+NMrWKwSY2/CVlqgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
X-Proofpoint-ORIG-GUID: YiGJkQFUZnzbxmDTYvzRayduoyyD-AYo
X-Authority-Analysis: v=2.4 cv=UK8nHDfy c=1 sm=1 tr=0 ts=67c083ca cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=PqIxx4AiKRwZNWVckGIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=oeJsKWMJRRqiwOsQBjEA:9 a=jGUOkv43x2Yd_zv8:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YiGJkQFUZnzbxmDTYvzRayduoyyD-AYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=860 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212015

--------------SgPwduWWuaKTyu55IeHLwgG9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 51R9vLIS008727

T24gMjAyNS0wMi0yNyA4OjUyIGEubS4sIFZhcmF0aGFyYWphbiwgRGVlcGVzaCB2aWEgDQps
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBUZXN0ZWQgdGhlIGZvbGxvd2luZzoN
Cj4NCj4gYml0YmFrZSBydXN0LCBjYXJnbywgbmF0aXZlc2RrLXJ1c3QsIGNvcmUtaW1hZ2Ut
bWluaW1hbCwgDQo+IGNvcmUtaW1hZ2Utc2F0byAtYyBkb19wb3B1bGF0ZV9zZGssIGNvcmUt
aW1hZ2Utc2F0byAtYyB0ZXN0c2RrLCB3b3JsZA0KPiBvZS1zZWxmdGVzdCAtciBydXN0LCBy
ZXByb2R1Y2libGUNCj4NCj4gb2Utc2VsZnRlc3QgcmVzdWx0cyBmb3IgYWxsIGFyY2hzIGFz
IGJlbG93Og0KPiBUYXJnZXTCoMKgwqDCoMKgwqDCoMKgIHBhc3PCoMKgwqDCoMKgwqAgc2tp
cHBlZA0KPiB4ODZfNjTCoMKgwqDCoMKgwqDCoCAxOTE0McKgwqDCoMKgwqDCoMKgwqAgNDM4
DQo+IHg4NsKgwqDCoMKgwqDCoMKgwqDCoMKgIDE4OTU0wqDCoMKgwqDCoMKgwqDCoCA2MjUN
Cj4gQVJNNjTCoMKgwqDCoMKgwqDCoMKgIDE4OTgzwqDCoMKgwqDCoMKgwqDCoCA1OTYNCj4g
QVJNwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTg5MzfCoMKgwqDCoMKgwqDCoMKgIDY0Mg0KPiBw
cGPCoMKgwqDCoMKgwqDCoMKgwqDCoCAxODg5M8KgwqDCoMKgwqDCoMKgwqAgNjg2DQoNCg0K
SWYgeW91IGhhdmUgdGhlIG51bWJlcnMsIHBsZWFzZSBzaG93IHVzIGhvdyB0aGF0IGNvbXBh
cmVzIHRvIHRoZQ0KdGVzdCByZXN1bHRzIGZvciAxLjgyLiBTaG93IGJlZm9yZSwgYWZ0ZXIs
IGRpZmYuDQoNCg0KSWYgeW91IGRvbid0IGhhdmUgdGhlIGV4YWN0IG51bWJlcnMsIGZyb20g
dGhlIHBhdGNoLCBpdCBsb29rcyBsaWtlIA0KeW91J3ZlIG9ubHkgYWRkZWQgNiBtb3JlIHRl
c3RzIGFzIFtpZ25vcmVdLg0KSXMgdGhhdCByaWdodD8NCg0KLi4vUmFuZHkNCg0KDQo+DQo+
IFJlZ2FyZHMsDQo+IERlZXBlc2gNCg0KLS0gDQojIFJhbmR5IE1hY0xlb2QNCiMgV2luZCBS
aXZlciBMaW51eA0K
--------------SgPwduWWuaKTyu55IeHLwgG9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-02-27 8:52 a.m., Varatharajan,
      Deepesh via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com">Tested
      the following:
      <br>
      <br>
      bitbake rust, cargo, nativesdk-rust, core-image-minimal,
      core-image-sato -c do_populate_sdk, core-image-sato -c testsdk,
      world
      <br>
      oe-selftest -r rust, reproducible
      <br>
      <br>
      oe-selftest results for all archs as below:
      <br>
      Target&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; skipped
      <br>
      x86_64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19141&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 438
      <br>
      x86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18954&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 625
      <br>
      ARM64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18983&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 596
      <br>
      ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18937&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 642
      <br>
      ppc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18893&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 686
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>If you have the numbers, please show us how that compares to the<br>
      test results for 1.82. Show before, after, diff.<br>
    </p>
    <p><br>
      If you don't have the exact numbers, from the patch, it looks like
      you've only added 6 more tests as [ignore].<br>
      Is that right?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com">
      <br>
      Regards,
      <br>
      Deepesh</blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SgPwduWWuaKTyu55IeHLwgG9--

