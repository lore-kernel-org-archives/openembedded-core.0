Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1613AD743DC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 21:39:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.176.1732138738568033387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 13:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105449edae=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKt1kE006739
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:38:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8ctcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:38:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4XxKh92feyAQ736A+huwmB7Rm2ZHHxIyAf+SIx44/hKWY+zn4/JetaMcP5BWESYNWOW71x6fi6AsWfA/oQeD7uT/3RdM0B5nZlWA7MPkPeNjrFr2vfYscdeRMwfiScZ+W7AYUTCSAa8F139fKD3W75vMasgYRKHozx7lPIyhMk2MDrR74vkdZXjNQpGDtSJrdLAPBz6FWIlYqGE4Bwbm6MNDJtgf5x5JxIk6W1foGa5PPoIBhZ6m4wobsegcYw4IQF2/p1OU7SuAj2V/me9iaHeCyEo6u19WF63+nJT+s4HY/iz4AH0nwumFwYwWIGDkVJwg6lifG5rtL3Bg9GBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C++qIUDe87GfD8dhCQSVm3mnPmHBpeK3YXWnnSP0XFM=;
 b=n9k4Z4gCAjNs6khn9KZamuSrKevULrQQcqJAyay9h3nUYgaJSe7IcP/Gqve0C03xxRqp1rx6jktKATmyWfTq2KjpLuzTQOnXWbdFSMk4hul97z/Gcxs6VGAQhX30FvTeG+M8LoCfL7BMm7dsOY231JYFslNL3tvvFPm12VhX7ZBeXSXTs0fRjTyeWEy8HaXn3cw1i77byMsuj5QMtG11aDXWCH/9+8pc7NhDXWQgC9bjXC87aT/cF8GNHkuzM8R1tsQvEZzvk7UfUEX1n5x5BSNNUYb5hpZnFVpNVcGeIFdA7LRH6Klz7YXagA6BbIRNrlMmukod8xwwbcZLVw+HuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 21:38:53 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 21:38:52 +0000
Content-Type: multipart/alternative;
 boundary="------------yzOvsXcgScXaPPWt42W4ySu6"
Message-ID: <bc3793e0-4939-46e6-9268-b565ecb68e81@windriver.com>
Date: Wed, 20 Nov 2024 16:38:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust-target-config: fix cargo build with toolchain clang
 for riscv64
To: Harish.Sadineni@windriver.com
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20241120101429.209176-1-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20241120101429.209176-1-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a420e0-e3c1-46af-7d84-08dd09abba47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bzF1WTl2Nk1XVnZVYS91VjlMdXZxQWNqTmxFZmRHZ1JVZzQzK2tJdEJ4UkdW?=
 =?utf-8?B?ZzBMM1E4RVlDaUFsY0FsQTNhTDRnQlc3ZCs3aktKd3IwQmV2bGJIbzh1WXNh?=
 =?utf-8?B?NHJHeUVyY1FTdFdZYmJCa2VPbTBCVU1uVG01TzFCbkF3TmRsbXRhM0VRb29I?=
 =?utf-8?B?U2phMWtqMUtOQ2FoRlJBMzFFaWY3cGZoNUYzTFVkMjd1NFlDMVc4c1JxZEU5?=
 =?utf-8?B?Q3FJQ0tadWpQUk9FSTdDMzl2N0tuS1dqOHpzaTJSUnJqRkxsSVpORFppU21r?=
 =?utf-8?B?MUFBV0F0dGhtQW92dW5mQy9heHREV1NNd3BkRmZIR1Q5Q1lKYUhOMzBuVkdC?=
 =?utf-8?B?Q3d0TkFWeUI3RFJLTUhkWDBwK3pLWW5lSytDVHJ4NnRKVFQ4RGJUakpiM0hI?=
 =?utf-8?B?YVhIUjQzbll5MTNPbGN2NlRvaXR2RXNNWHRQU1ZQay9oNk54OEgvTnlBK0pl?=
 =?utf-8?B?WENrMDB6S3Vub2Q1Tmc2RzNYSkxJaCs2WEI0VmE2VzJjb0xEVnowUElsQnQy?=
 =?utf-8?B?VlgycDFONjV4NFhWYi8yQ1NXZXZvT0Y5N3I0SWplY1hFVjZzWlQ4cjJycHBo?=
 =?utf-8?B?U3lYWGMwemI3clZZR3hZZGd2N1lzNFpMeHRzQkxqUExvcjhKNS9KOW8zaUxr?=
 =?utf-8?B?RnhFdzl2YW1Pa0hFVWRKcVduYkNlMTg2d0RlcTQzU2lMam5iZThKMkFmdlp6?=
 =?utf-8?B?TGNtVUh4UGRCZHAzUXorRGZURnRxbjJFMWZuSmU5TWsxNklOcjRIOXZrSTJ0?=
 =?utf-8?B?YzJnL296T2NlVjdvOUNxUVYrdUV3dkFjNmJkbEZRTUxXdndrUTFRYmV4ZkxZ?=
 =?utf-8?B?YzhJQ3pJOGdXV0xzaVZiNXNEdy9JWmVnQkxZRVNLY0VqOE04cE5TdGpsYUtF?=
 =?utf-8?B?empxK2U1OWJwdmI4L3NNdG5zNUdSSjNIejViQzM1Z0tGS0NpbGJXWkVCY004?=
 =?utf-8?B?N2xsaFVjcG9ia3pmbjVzbE5Ea2dDdnR5akJjRXhpS2dZa1hJcVBzNVNSb3Nn?=
 =?utf-8?B?eCt3T1lvcHpwZy9PR2Q2UTVSb3VVOFNmLzA2dlFKR0NzT1FzbkhWN0owRW5J?=
 =?utf-8?B?cndSOWZab3RWanVDeUhmdklDSmZQMlFJZ1lYaE1KRU82K1lhWVpIaVF0a2JF?=
 =?utf-8?B?OGpISzBiSTlVbTVLbllIRGtUYTl5N211RDdvU0dFQnR0YThvc2hjbG9VMnI2?=
 =?utf-8?B?eko3TkJMZjZQOU1ucVNDVEpoZ1BaSnhaK2ZtdzIrbjA1eWozY1VYL3NCK0Fp?=
 =?utf-8?B?YzBlaEliQW9MYzh2QnBlaElqMmUvNjVYRFlZQjFCcGdxd2o4UHFtSGNzN1Bq?=
 =?utf-8?B?RFl4RTRzNUhUMkxkaGRZd3NVejBaa1g5aGVKRXV1YVY0Yyt0d0J1TlhvaC80?=
 =?utf-8?B?VkhaYVdrdldMM05CS2plNkt4Y01Ga0tXWTM1R1ZMZ2QyUDZWOWlpWVdZSURr?=
 =?utf-8?B?SXdoaDdxWXFOMEJTWU40R2VEVjFDeG9EQUdHK0pibEtpWkwwY1NORWJveGx6?=
 =?utf-8?B?TGkrUUd6ZGlkMEFUa1ZyTHY5c1pmL2JCN01HVUR6dmVhRVJPNUJkWDJVZzZY?=
 =?utf-8?B?alZWV1IreStqMGw5eWVXbHRlSnpvbXc4cnFybmtydjBsMGdCZFVPQld4UG85?=
 =?utf-8?B?Z3kxQkZkaXcrQnRmMHl4ajNMOW1kelZCOW1LL1FIeEJlTGVpUlZUNDJCckY0?=
 =?utf-8?Q?XyNo0mCBMCPzs8CGDP6V?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anZnTDk1eTVmaWsxamdTU3cwQW8zdkNYSE9ZeGZNS2UxSm5JeXpVaHJvSEEz?=
 =?utf-8?B?MTlGRTJCUWYvRVpxR21KVjBlUTZOTTZtOS80Q1cwWGJBNy9LOEZFMzNZWEky?=
 =?utf-8?B?cytaaDlaM2J5OXdvVUkvdzRidmtZUjlKTVVuakd0amN1M3FwLzhOUnRhNEFP?=
 =?utf-8?B?REI4UHh2Yys2U2Z6Z3pXSFgxMFdjV2NrYWR5cVlzbWRkQndCSHR0SFFTczhB?=
 =?utf-8?B?OHlkNVl3SmtBNDRrWHpBQWVaeEg4Z3Z2cDdkV3dPOTBDb0NOenB5RDNWSitK?=
 =?utf-8?B?WXRYeEMzV3l0UVNZWVVDa0s0dm83cmJJNlcwTmhPc01xOGYwWUp2aGFLUmJq?=
 =?utf-8?B?dUlrRXRaUzVUWUJCQlNMSHJqTG85aXVzNGx6MklHdFA3dUxxb29GdmdZY2ZP?=
 =?utf-8?B?UHhMT2FLQmJ6bjdhWUJBZy81dkxUdmRLVGZia0pkUTZYdFVWTkdSNjNSTVk3?=
 =?utf-8?B?NmFGL3VGcXA3cXo0ZGxtbE1kN1BnV2w0Y3UvRFBRSkFPcG9qd09NdmZXT0xF?=
 =?utf-8?B?SkM0U092a1U2Q3VyakhsWDRXdHQzRUMxaVpXZTJESkhVWERoQ3BubDYyV3Nn?=
 =?utf-8?B?dHREZzl6UDJQalFwOEU0THhmSWwwa0hEQzJlcGdWblVKQm9LTElCR01pNFhr?=
 =?utf-8?B?R0pLRkRwUndxdnlPMnNSd0M2OE5rMTgzbG8vK0lZS1JXbi95MXRoUzhEK0Mw?=
 =?utf-8?B?RVBsbytJa0EzOG1CdlE5TzZnWlMyN1pxeXZqMnN1MytNUkpSQ2JBMEtzTVNN?=
 =?utf-8?B?T0J5TXpHNEd2QWdCK3ovbW5JSnE4OWI0MzAyWWdxMHRCNWM3V1Zwcnh2QkNl?=
 =?utf-8?B?Wk5vc2w0SUpzWFhKWnhNL29qYzRmOWtQZDV3Y20yMWpJM2tlNVRWSDFMSGl6?=
 =?utf-8?B?OG00VU1MbGxJa2xlWnNGVjdVQlYvSmVKdHBHZUtSdm8rTlI3VWdxTkNpdzdO?=
 =?utf-8?B?OTdHay9VZHJsSkVLZHRvWDhUZ0kvMk51dTgvWW9TNHl3aFF0NGRMMnZraXBO?=
 =?utf-8?B?RFlubDdWOHpTczd4QnlvOElOb3g0UVd1T3NrUFoxUGRoYjNpa2R5NlJKMXVn?=
 =?utf-8?B?eDVlTVBBMkh2R0JEZTFGRDVKeVZXWEYyQlVJVTN6enRmMExWTnNGM0tNT0dj?=
 =?utf-8?B?U0JBNkxOREhNZDNNdWF6eDJOajZkOVRwMkUyU01QWmdCYW1TWW5yRUFLT1Nt?=
 =?utf-8?B?SUhjaVYvSE13RGkyMTVUbXM2VGNjY283TFR4QUxOSGNVNi83ZmhJbXFnNyth?=
 =?utf-8?B?aHhwNTNHR1B5RGpmUjFRZEttQzFWR2JWbWhDUXhjT1V4RThMWGpCb1U0S0Fp?=
 =?utf-8?B?V1pLOEZtYzY2TDg0a3BHZCt0YWhOUldHK1NsMjdRRWd2bU5sK1NncW92Tk9u?=
 =?utf-8?B?b3pvTXVSalhpaVNNaFJXMUl5TkdBZkI4RzdlTGVtc1pla0ptNXBDQkVZZUln?=
 =?utf-8?B?NlBObnlUeHdEeDdWUGQyOTgvRkNzZXJ0R09zc3dSY212ZXU2SGcwbHZhK0Nq?=
 =?utf-8?B?OGZlWFlsYkNGL0wzRWJnUytBRFdPVk5xenN2WmQvYkgzNkgzczIvalVmTi9a?=
 =?utf-8?B?aEpkcytuRnFzQWs2RkpObysrRmZwUXM5MlF4T1RibnZVRlhzc0xlUTBIU1pD?=
 =?utf-8?B?SFk1Mi9YL3NPUXhPckdNbEN4aDg1NzI3RzBhK0ZhTC9ac0VhN2o5ZVlyS2NX?=
 =?utf-8?B?T0g4VXJzd3FnNnFjMEpMa2RTNm95SzQ1eE1BcGV4VDhIUnR6UTJ5clRqRW9u?=
 =?utf-8?B?REhCdVFBd1ZNZjk4VHhFaHlidkxPWGQ1WFJDVUpvb3N5Q0tuZFd4eWxqQ0xR?=
 =?utf-8?B?cFF0M2gwZ25oQVRQUW10U0htZXE4UUhpOW83dE9sUnp6a3pDUTR3Q1RMS3Ra?=
 =?utf-8?B?eTI0QjkrZ2RBZXc4YXN2N1lWMkNsa0tDYitBVXI0UDI5Y0Q3aG93N042dDFB?=
 =?utf-8?B?YllSWnpic2tSWUY5bTgyc1VzelhVdE4xVlNpMW1QMFFhYXRRTjJtNlB5ZEF5?=
 =?utf-8?B?Y0pjK051eGpBNTdRVTN5SEo4S0FFSkJJczdxc3ZCclNzcXRQU3BrTVZKNG5F?=
 =?utf-8?B?ZDZlNXdlVzc3citvMFZCRUZvSE0zT2tsazlJVnFDZGZkdzhpZmVhV2JHNU9B?=
 =?utf-8?B?Wjd3bFZEenNka0d3eXR5L0p6UE9hd1FmVTFDQkFtKzFvYUEwQ21KQkl1alVi?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a420e0-e3c1-46af-7d84-08dd09abba47
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 21:38:52.7460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lALSpo4K57b/NTfRZxu1brNAq92lv0B0EcbvlnUsqZXiLrnhOobVpdktu4qrj8AA3dXriqPt7pFNRaXdIXgpbYc6vVlsDy4faaj3IZufQ+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
X-Proofpoint-GUID: yb7j3OyO22Dbt5c2WT0W9fcSkOPCRIkO
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673e56f1 cx=c_pps a=CSNy8/ODUcREoDexjutt+g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=syMfazXBAAAA:8
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Y_UaLBkAy8DGvynPRL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=34Rgu48Vc-cA:10 a=agmpYwviDEw2m94xkjYA:9 a=Uhc0YTQvXZzxDxhV:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=uyKFD9ku5uKmkIuqXy1C:22
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yb7j3OyO22Dbt5c2WT0W9fcSkOPCRIkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_18,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411200153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207485

--------------yzOvsXcgScXaPPWt42W4ySu6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AKKt1kE006739

Hi Harish,

I have some questions and comments below so please don't merge.

On 2024-11-20 5:14 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> bitbake cargo is getting failed when building  with toolchain clang
> for riscv64 with the bellow error:
>
> error[E0512]: cannot transmute between types of different sizes, or dep=
endently-sized types
>     --> /usr/src/debug/cargo/1.79.0/rustc-1.79.0-src/vendor/dbus-0.9.7/=
src/ffidisp/connection.rs:298:50
>      |
> 298 |         if r =3D=3D -1 { Err(e) } else { Ok(unsafe { mem::transmu=
te(r) }) }
>      |                                                  ^^^^^^^^^^^^^^
>      |
>      =3D note: source type: `i32` (32 bits)
>      =3D note: target type: `DBusRequestNameReply` (64 bits)
>
> Issue will be fixed by changing TARGET_C_INT_WIDTH to 32 instead of 64.
>
> Referred TARGET_C_INT_WIDTH for riscv64 from the following link:
> https://docs.rs/crate/rustc-ap-rustc_target/587.0.0/source/spec/riscv64=
gc_unknown_none_elf.rs

Can you explain that this link is and why we should trust it ?
What is the 587.0 part of the URL ? If I were paranoid, I'd think this=20
was old data...
Indeed, this related link:
https://docs.rs/crate/rustc-ap-rustc_target/587.0.0/builds
seems to be from 2019.

If I look for a current version by changing the URL to:
https://docs.rs/crate/rustc-ap-rustc_target/latest
I just see:

|=C2=A0=C2=A0 rustc_target| contains some very low-level details that are=
 specific=20
to different compilation targets and so forth.

 =C2=A0=C2=A0=C2=A0 For more information about how rustc works, see the r=
ustc dev guide=20
<https://rustc-dev-guide.rust-lang.org/>.

I'd like a v2 to fix the commit log.


>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/classes-recipe/rust-target-config.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/clas=
ses-recipe/rust-target-config.bbclass
> index f7aa6c74d8..d5fcfa1e2a 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -247,7 +247,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] =3D "32"
>   DATA_LAYOUT[riscv64gc] =3D "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
>   TARGET_ENDIAN[riscv64gc] =3D "little"
>   TARGET_POINTER_WIDTH[riscv64gc] =3D "64"
> -TARGET_C_INT_WIDTH[riscv64gc] =3D "64"
> +TARGET_C_INT_WIDTH[riscv64gc] =3D "32"
>   MAX_ATOMIC_WIDTH[riscv64gc] =3D "64"
>  =20
>   ## loongarch64-unknown-linux-{gnu, musl}

I guess it avoids the error but how do we know if it's correct?
I'd like to see an RISCV64 doc that defines what these types should be.
I found this discussion:
https://github.com/riscv/riscv-isa-manual/issues/353
but didn't take time to find the published version of the doc; please do=20
that.

For context, the value of this variable for all arches is below (1)

I did come across this Rust Github issue comment that warns us that
we've taken a risk that has exactly this type of consequence:

 =C2=A0=C2=A0 I have recently discovered that yocto removes the very code=
 that exists
 =C2=A0=C2=A0 to check our data layouts against LLVM's, so that there is =
no drift=20
or inaccuracy in
 =C2=A0=C2=A0 ABI or code generation. This was done in yoctoproject/poky@=
c08c522=20
<https://github.com/yoctoproject/poky/commit/c08c522fc29445aef0c64f0dd8df=
8a3531c04afa>

 =C2=A0=C2=A0 "What this code was doing" was preventing things like this =
issue=20
from occurring.
 =C2=A0=C2=A0 That patch allows rustc's code generation to become unrelia=
ble.
 =C2=A0=C2=A0 It allows usage of yocto's patched rustc by unwitting progr=
ammers=20
against targets
 =C2=A0=C2=A0 which we do not know the data layout for, thus cannot gener=
ate=20
correct code for.
 =C2=A0=C2=A0=C2=A0 ...

https://github.com/rust-lang/rust/issues/100687#issuecomment-2266368502

If one does't already exist, please open a defect in the YP bugzilla to=20
track getting this fixed properly or
as Richard said in his commit log:
 =C2=A0=C2=A0 "...resolve it by someone who has a better understanding of=
 rust and=20
what this code is doing. "
and report the link here.

By the way,=C2=A0 TARGET_C_INT_WIDTH goes all the way back to meta-clang:

commit 141177fbf9bb4c2b2d3625554d101d312e80f02a
Author: Johan Anderholm <johan.anderholm@gmail.com>
Date:=C2=A0=C2=A0 Sun Nov 26 08:43:20 2017

 =C2=A0=C2=A0=C2=A0 rust: specify target-c-int-width

 =C2=A0=C2=A0=C2=A0 The "target_c_int_width field is added to librustc_ba=
ck since rust
 =C2=A0=C2=A0=C2=A0 1.22.0 because not all rust targets (e.g. msp430-none=
-elf, avr)
 =C2=A0=C2=A0=C2=A0 have 32-bit int types any more.


Finally,

Did you test runtime images built with gcc and clang? If you didn't=20
check runtime can you at
least build and run helloworld.rs and for bonus points something that=20
uses more rust, such as python3-cryptography?


../Randy



1)

=E2=9D=AF rg TARGET_C_INT_WIDTH meta/classes-recipe/rust-target-config.bb=
class
136:TARGET_C_INT_WIDTH[arm-eabi] =3D "32"
144:TARGET_C_INT_WIDTH[armv7-eabi] =3D "32"
152:TARGET_C_INT_WIDTH[aarch64] =3D "32"
159:TARGET_C_INT_WIDTH[x86_64] =3D "32"
166:TARGET_C_INT_WIDTH[x86_64-x32] =3D "32"
173:TARGET_C_INT_WIDTH[i686] =3D "32"
180:TARGET_C_INT_WIDTH[i586] =3D "32"
187:TARGET_C_INT_WIDTH[mips] =3D "32"
194:TARGET_C_INT_WIDTH[mipsel] =3D "32"
201:TARGET_C_INT_WIDTH[mips64] =3D "64"
208:TARGET_C_INT_WIDTH[mips64-n32] =3D "32"
215:TARGET_C_INT_WIDTH[mips64el] =3D "64"
222:TARGET_C_INT_WIDTH[powerpc] =3D "32"
229:TARGET_C_INT_WIDTH[powerpc64] =3D "64"
236:TARGET_C_INT_WIDTH[powerpc64le] =3D "64"
243:TARGET_C_INT_WIDTH[riscv32gc] =3D "32"
250:TARGET_C_INT_WIDTH[riscv64gc] =3D "64"
257:TARGET_C_INT_WIDTH[loongarch64] =3D "32"



--=20
# Randy MacLeod
# Wind River Linux

--------------yzOvsXcgScXaPPWt42W4ySu6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AKKt1kE006739

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Harish,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I have some questions and comments
      below so please don't merge.<br>
      <br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-11-20 5:14 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Harish.Sadinen=
i@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20241120101429.209176-1-Harish.=
Sadineni@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Harish Sadineni <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:Harish.Sadineni@windriver.com=
">&lt;Harish.Sadineni@windriver.com&gt;</a>

bitbake cargo is getting failed when building  with toolchain clang
for riscv64 with the bellow error:

error[E0512]: cannot transmute between types of different sizes, or depen=
dently-sized types
   --&gt; /usr/src/debug/cargo/1.79.0/rustc-1.79.0-src/vendor/dbus-0.9.7/=
src/ffidisp/connection.rs:298:50
    |
298 |         if r =3D=3D -1 { Err(e) } else { Ok(unsafe { mem::transmute=
(r) }) }
    |                                                  ^^^^^^^^^^^^^^
    |
    =3D note: source type: `i32` (32 bits)
    =3D note: target type: `DBusRequestNameReply` (64 bits)

Issue will be fixed by changing TARGET_C_INT_WIDTH to 32 instead of 64.

Referred TARGET_C_INT_WIDTH for riscv64 from the following link:
<a class=3D"moz-txt-link-freetext" href=3D"https://docs.rs/crate/rustc-ap=
-rustc_target/587.0.0/source/spec/riscv64gc_unknown_none_elf.rs">https://=
docs.rs/crate/rustc-ap-rustc_target/587.0.0/source/spec/riscv64gc_unknown=
_none_elf.rs</a></pre>
    </blockquote>
    <p>Can you explain that this link is and why we should trust it ?<br>
      What is the 587.0 part of the URL ? If I were paranoid, I'd think
      this was old data...<br>
      Indeed, this related link:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://doc=
s.rs/crate/rustc-ap-rustc_target/587.0.0/builds">https://docs.rs/crate/ru=
stc-ap-rustc_target/587.0.0/builds</a><br>
      seems to be from 2019.<br>
    </p>
    <p>If I look for a current version by changing the URL to:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://doc=
s.rs/crate/rustc-ap-rustc_target/latest">https://docs.rs/crate/rustc-ap-r=
ustc_target/latest</a><br>
      I just see:<br>
    </p>
    <p><code>&nbsp;&nbsp; rustc_target</code> contains some very low-leve=
l details
      that are
      specific to different compilation targets and so forth.</p>
    <p>&nbsp;&nbsp;&nbsp; For more information about how rustc works, see=
 the <a href=3D"https://rustc-dev-guide.rust-lang.org/">rustc dev guide</=
a>.</p>
    <p>I'd like a v2 to fix the commit log.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20241120101429.209176-1-Harish.=
Sadineni@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Harish Sadineni <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&=
gt;</a>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
index f7aa6c74d8..d5fcfa1e2a 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -247,7 +247,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] =3D &quot;32&quot;
 DATA_LAYOUT[riscv64gc] =3D &quot;e-m:e-p:64:64-i64:64-i128:128-n64-S128&=
quot;
 TARGET_ENDIAN[riscv64gc] =3D &quot;little&quot;
 TARGET_POINTER_WIDTH[riscv64gc] =3D &quot;64&quot;
-TARGET_C_INT_WIDTH[riscv64gc] =3D &quot;64&quot;
+TARGET_C_INT_WIDTH[riscv64gc] =3D &quot;32&quot;
 MAX_ATOMIC_WIDTH[riscv64gc] =3D &quot;64&quot;
=20
 ## loongarch64-unknown-linux-{gnu, musl}
</pre>
    </blockquote>
    <p>I guess it avoids the error but how do we know if it's correct?<br=
>
      I'd like to see an RISCV64 doc that defines what these types
      should be.<br>
      I found this discussion:<br>
      &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https=
://github.com/riscv/riscv-isa-manual/issues/353">https://github.com/riscv=
/riscv-isa-manual/issues/353</a><br>
      but didn't take time to find the published version of the doc;
      please do that.<br>
    </p>
    <p>For context, the value of this variable for all arches is below
      (1)</p>
    <p>I did come across this Rust Github issue comment that warns us
      that <br>
      we've taken a risk that has exactly this type of consequence: <br>
    </p>
    <p>&nbsp;&nbsp; I have recently discovered that yocto removes the ver=
y code
      that exists <br>
      &nbsp;&nbsp; to check our data layouts against LLVM's, so that ther=
e is no
      drift or inaccuracy in<br>
      &nbsp;&nbsp; ABI or code generation. This was done in <a class=3D"c=
ommit-link" data-hovercard-type=3D"commit" data-hovercard-url=3D"https://=
github.com/yoctoproject/poky/commit/c08c522fc29445aef0c64f0dd8df8a3531c04=
afa/hovercard" href=3D"https://github.com/yoctoproject/poky/commit/c08c52=
2fc29445aef0c64f0dd8df8a3531c04afa">yoctoproject/poky@<tt>c08c522</tt></a=
></p>
    <p dir=3D"auto">&nbsp;&nbsp; &quot;What this code was doing&quot; was=
 preventing things
      like this issue from occurring. <br>
      &nbsp;&nbsp; That patch allows rustc's code generation to become un=
reliable.
      <br>
      &nbsp;&nbsp; It allows usage of yocto's patched rustc by unwitting
      programmers against targets <br>
      &nbsp;&nbsp; which we do not know the data layout for, thus cannot =
generate
      correct code for.<br>
      &nbsp;&nbsp;&nbsp; ...<br>
    </p>
    <p></p>
    <p>&nbsp;&nbsp;
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-=
lang/rust/issues/100687#issuecomment-2266368502">https://github.com/rust-=
lang/rust/issues/100687#issuecomment-2266368502</a><br>
    </p>
    <p>If one does't already exist, please open a defect in the YP
      bugzilla to track getting this fixed properly or <br>
      as Richard said in his commit log:<br>
      &nbsp;&nbsp; &quot;...<span class=3D"ws-pre-wrap extended-commit-de=
scription-container f6 wb-break-word text-mono mt-2 prc-Text-Text-0ima0">
        resolve it by someone who has a better
        understanding of rust and what this code is doing. &quot;<br>
        and report the link here.<br>
      </span></p>
    <p>By the way,&nbsp; TARGET_C_INT_WIDTH goes all the way back to
      meta-clang:<br>
      <br>
      commit 141177fbf9bb4c2b2d3625554d101d312e80f02a<br>
      Author: Johan Anderholm <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:johan.anderholm@gmail.com">&lt;johan.anderholm@gmail.com&gt;</a><b=
r>
      Date:&nbsp;&nbsp; Sun Nov 26 08:43:20 2017<br>
      <br>
      &nbsp;&nbsp;&nbsp; rust: specify target-c-int-width<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; The &quot;target_c_int_width field is added to l=
ibrustc_back since
      rust<br>
      &nbsp;&nbsp;&nbsp; 1.22.0 because not all rust targets (e.g. msp430=
-none-elf,
      avr)<br>
      &nbsp;&nbsp;&nbsp; have 32-bit int types any more.<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>Finally, <br>
    </p>
    <p>Did you test runtime images built with gcc and clang? If you
      didn't check runtime can you at <br>
      least build and run helloworld.rs and for bonus points something
      that uses more rust, such as python3-cryptography?<br>
    </p>
    <p></p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>1)<br>
    </p>
    <p>=E2=9D=AF rg TARGET_C_INT_WIDTH
      meta/classes-recipe/rust-target-config.bbclass<br>
      136:TARGET_C_INT_WIDTH[arm-eabi] =3D &quot;32&quot;<br>
      144:TARGET_C_INT_WIDTH[armv7-eabi] =3D &quot;32&quot;<br>
      152:TARGET_C_INT_WIDTH[aarch64] =3D &quot;32&quot;<br>
      159:TARGET_C_INT_WIDTH[x86_64] =3D &quot;32&quot;<br>
      166:TARGET_C_INT_WIDTH[x86_64-x32] =3D &quot;32&quot;<br>
      173:TARGET_C_INT_WIDTH[i686] =3D &quot;32&quot;<br>
      180:TARGET_C_INT_WIDTH[i586] =3D &quot;32&quot;<br>
      187:TARGET_C_INT_WIDTH[mips] =3D &quot;32&quot;<br>
      194:TARGET_C_INT_WIDTH[mipsel] =3D &quot;32&quot;<br>
      201:TARGET_C_INT_WIDTH[mips64] =3D &quot;64&quot;<br>
      208:TARGET_C_INT_WIDTH[mips64-n32] =3D &quot;32&quot;<br>
      215:TARGET_C_INT_WIDTH[mips64el] =3D &quot;64&quot;<br>
      222:TARGET_C_INT_WIDTH[powerpc] =3D &quot;32&quot;<br>
      229:TARGET_C_INT_WIDTH[powerpc64] =3D &quot;64&quot;<br>
      236:TARGET_C_INT_WIDTH[powerpc64le] =3D &quot;64&quot;<br>
      243:TARGET_C_INT_WIDTH[riscv32gc] =3D &quot;32&quot;<br>
      250:TARGET_C_INT_WIDTH[riscv64gc] =3D &quot;64&quot;<br>
      257:TARGET_C_INT_WIDTH[loongarch64] =3D &quot;32&quot;<br>
      <br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------yzOvsXcgScXaPPWt42W4ySu6--

