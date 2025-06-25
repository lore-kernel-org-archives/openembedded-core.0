Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BE2C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:34:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23594.1750876472846836262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 11:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827148839e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PII3vj020949
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 11:34:32 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mmfa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 11:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXoyxscDAFxXbobtCWJemEt2HBZJcx+VC5k3r11ci+UJfZ3YiWiZxJR9SePoWiqqDxh9XTUiaPYoekXX8EAt8ara9W+8n9gn75aNONXRwQxPm+QatIK16e+Yi5U/TGEU1hjJXLiELqjkMcW//PzwlONyDqZtCJg99zzWfSJWZyi67eTIpZqKiyz/uXQeBhyq08fbOzianqlrle80OhQTZkd+qnJVpCxkBN2stp+e79Z43HUDT10ymMACV3RNn1ca3SMTxkOTHlkt/+QcpuIXk3dVBKQShTB3UiEd31EIdGmRQgJwqknjf3HpznkJZMqMwN5I+pRXPW4oPvC1K4eNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IefCKCOkBnapHvSvWKkLmII2+oSY7PulNfO0ijM9fY=;
 b=gkVH3QVCnGHAlrdpj4HjK1cbqgV2/YKp8Qyecl4Z+pcfv/SHWQBTDBlGAnIvBA4hiI6BFxShq2+gzkDcqQAHoPg9OkFAsa93GumiOSnXjY4pwNryAA0+tyGkdcDqfBSEuNkGYdiujX7VQCf8+dXne4U2x48NiPgRMfSF60XoRdabL6vdYA44xufP7iv0Ng1aAIxBerkxeSitO9QSmtfoYPfUHn+49VBEMLceVJMnZlYErwHFpfND793e2bjOiDJCS3rxwdBDW+X3ORkUNJC1yYXEPkewGeJNl363K16L2RSYEySVMRw23vyzviR7Yeuoc0TxhTTU1bY1zscmy22+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM3PPFED6629EA1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 25 Jun
 2025 18:34:28 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 18:34:28 +0000
Content-Type: multipart/alternative;
 boundary="------------lDO5TdABIJkIkvLIcL47foJ0"
Message-ID: <e5cea1de-4053-49c5-b409-31e79b15c9cd@windriver.com>
Date: Wed, 25 Jun 2025 14:34:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rust: Upgrade 1.86.0 -> 1.87.0
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250625102014.1199159-1-Yash.Shinde@windriver.com>
 <20250625102014.1199159-2-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250625102014.1199159-2-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM3PPFED6629EA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d93e92-f319-4022-dea3-08ddb416eace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cGJCK1BHalhEa0FNRnYxZ2FRVTViWDA5TW96bEw1OUQrai91T2x1bE9jVDF3?=
 =?utf-8?B?YzFaejZzdm1ybjRISnVJbVNrZEFBU2ZJdEE2Wk1sRGZWN1U0MXN6MkFvNWtH?=
 =?utf-8?B?MXFjbkVUNEhZc1V5T2ZTVDNUQXd2Si9FVXVHdm9pZXBEd21NNzdVSzVvV0hH?=
 =?utf-8?B?Q1N3RFMzRXdCQ3hUdHVWbmFlNnRiL3RzY0Z2c1UyK2FMVEV4U05wYVdqVnUy?=
 =?utf-8?B?ZWZqVGcyall1bnIycGRoN3FxUHhiMTg2dFAyYTVqSnQzYW1QRGVhbUVtZDB6?=
 =?utf-8?B?cFd2VFRpcGNNQ0pJQUp0ZWtuU3hkZk11V2pKZi93b0VRSFhYbDNGd3FveXVr?=
 =?utf-8?B?b25UNytxd1p2RG1HWFJES3BzQjNmVWFvZGdQZVVBVWxqSnk5OFFyWmxYSjBn?=
 =?utf-8?B?MXZNN2RiVnRIc0NuSFBtV1NNVUpBODVOQWZnSTVma1czVU1OalY4a0NLVmY0?=
 =?utf-8?B?TUM4azkwUm9neWFabnU5ak1DcG5pTlViUlNwdDN2QVRIbzV3QzlvOE9NU295?=
 =?utf-8?B?d1FYbThFTUlVZWdxdEZXWk8vemVqT1hab255eDZkaXFPZU00QmowS2xIMTRu?=
 =?utf-8?B?ZnpTNUhaRTdHTGJ0UEh1ZnFUTjY4VXUwQmlvb0ZZOUNkOWdPWHJnTzNoVUp5?=
 =?utf-8?B?Snhtby9zR0dHNVlNSHpyNTZpVHpzNlpVOEQ3RCtYY01XdVJrcDJYSTZUUXJN?=
 =?utf-8?B?bmFOOUhYcjJJU3Yva0swWVIvTmUyekdET3NVYktyWEFYSmtSUDFBeHo0SXRW?=
 =?utf-8?B?WU9aVHZmR2cyZ0lwWC8vMnlsL2F4VlVISE04emZkRlJxOHZvakNOeEVlaUtk?=
 =?utf-8?B?ZlYycXFZUEs3OHlpSnh3MnBDSExWbjVFa3VUemNVZTE4YTloMW4rUHV6a1Rn?=
 =?utf-8?B?ZjVVYXYwczRtbVI0c3VQMWxYYllqUkxET2UrRkhNZE82VThZYXpnZ0E5VlQy?=
 =?utf-8?B?NU1qMFBBTUxlc0VGZ0JZT0Vwa3lHVmd0c0xsYWNCcEMyVnZLaWs4WHBBemMr?=
 =?utf-8?B?U1lQTGJaaVRMaHhGYjVHZHlpQ01JWGNvMkFHdjJxT1dTeVROSG1LeVphUm9y?=
 =?utf-8?B?b2RmWGIya2dySVF1MlZsdVFtN2dWWS9XWFNpSTlrTWNaNGNJZGhxZjNqQm1Y?=
 =?utf-8?B?TC9La0hpZGIyZmp6aEhrL3ZlV0pNbjZ2MXBFVkx2MW9iTHdoM1pXUTZuMVMr?=
 =?utf-8?B?MVJtY2tOR1BCVG1KRTFSd2xhVWlvVUtuVDQwL3JEU01TTmxjUnNkOFQ3Vmxz?=
 =?utf-8?B?eVhCVjEweDdzcXFwUmxGd2Q3NVJrYUZRU0dxOFZiejkvano4aTJyaUZPQ1Na?=
 =?utf-8?B?RUxPamxqZmNDaU5GVkJnWm5OUFZMdithb0xTdWZNcG1rRW9hZGdPQmN2UnVY?=
 =?utf-8?B?L2ZKRHRRUG1HekpQakRVMWo3TjhhZVpNVUZoK1RNNitodG1NakRWNHFCVVd0?=
 =?utf-8?B?b0l2TEV6bUszTlZmN21JQzJtSDRMaUtEZjJPanhWS29nT2dXUnRLSFF2WFRY?=
 =?utf-8?B?VXoyVDVpSjFCdHQrY1JxblJoRGFnWTJzNG83Mlh2ckhhT1JMeGNBbTZ3b1Nz?=
 =?utf-8?B?c05DL3V6cnRmRjRwZEt4WURaRXY4U3J0QzZUTVVqdmRqL1M1alR1YlhDejU5?=
 =?utf-8?B?NlB0Nnd4RytibGxhVDFPenJsbjB1L1Jld3docFVtaXJwSnJieTVpcDllajlY?=
 =?utf-8?B?a3NjMmNKbzQveVU2eUdFd0NTc1lqK2VGY0w2UVdFMXg5SWlCeVMrY0d1R3Jp?=
 =?utf-8?B?cEdwT3daWGg4YUExUk1RdFFURWd6dEsxUDVDY2dmaUFKL2RSUWRQTk56cGl6?=
 =?utf-8?B?elMxNVBTME5UUHNVbzNaajNEVXdTaldrRkhaMkNJdFlZamZQVWFFY2NlWEU4?=
 =?utf-8?Q?O7wVfP8DJcTbr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3FlOU1ON2Z4K0JrZ1BVQmhMNjFkaXZSWVloVXZzdVRzT2FMeENreXpYMS8x?=
 =?utf-8?B?OG41MkRGMWN3RUppQzk0N1ErekszYmVxUzlsUEcxRWl5cVgxQ29kejBURmZW?=
 =?utf-8?B?cFAxSFp5UUJQOFNPNm85R0F2c1poOE5za2FzdnorSDJyelo3dGQvUUV4UjBZ?=
 =?utf-8?B?ek5FNXFTWTlSM0oxc2x3SWF2S1ovRjhMSkNUVEVTMk9reEhva2ZSZm4ya0J1?=
 =?utf-8?B?bGNUdktqVG1oZkNsWGEzRmZ1OVZRV2VPd0dGUDUyZlY3R3RNbTBwUlJNbHpm?=
 =?utf-8?B?c2FYL2oxakhoNDMwTjdFbStNTGxxTnZmME8yR0lPMmlpQXM0bXFGK293WW4r?=
 =?utf-8?B?TVgwcHNMWmJ6UzdnMm9uQ2xMMCt6WGtmRXZWY1RNUmRHQ0tBdTFmNCtZRjJI?=
 =?utf-8?B?aHl2M1FicGZGd2U4V2dqR3plYXJnRVA1N3kwZHhGaWVPTWorZWx5OHpYQUlO?=
 =?utf-8?B?aEx3TC9DT2NBbG0ySERoN2tPejdlZXZaZTdCK2dMT0s0Znp1YS9acXJpVDNj?=
 =?utf-8?B?Ykd0V0JQelEzZkZ6U3N0UTlRbTZ6Y2kwYjQxNzNkeDNOdWh6NkxUbnZidnN0?=
 =?utf-8?B?QVNkSCs2ZFlRRXBJSDBZMjlmUDREMmI3UVNsTnhIN3oxVWNnUElZcW82dTYr?=
 =?utf-8?B?RHdzUHhHTjZDc0JHZmFmamtMM0UwaXl6OEVIbzczdkM5RjlUaTdmTW9mZ05i?=
 =?utf-8?B?aXRGSDNMbXp3TkRsbVA5K2xhRzNYN3F5Wnh0ajl3N2RqNFBCaWNYdzFYdDJ4?=
 =?utf-8?B?SXlVMEsvOTF0OHRMYzdzZkE1ZE84Qng1RDcyejRyM0l1MG9aMXJzWEh2LytU?=
 =?utf-8?B?OXhGWTBDTTVIUzNQU1JtNFZ6eW9PSWlOUGs5R3dOWjdybkh6YklHZFF0VjZP?=
 =?utf-8?B?T1prMmxSYUlQT2VkS2JnZ0kyQlppN0RETXRybklNcTBoZ3JacnVsdStnVmhu?=
 =?utf-8?B?M255TGVxZkVyaGpZeWdHWU9pS0FKdWhiNjZvRFNYQk8wYjVHdlRPT3Y0UHJa?=
 =?utf-8?B?SXd1c3lWaktiWlBYalNPSTJjM0s2SEE0bVQwRWJVOHRCY1kzVFYwdTBrb0dw?=
 =?utf-8?B?UFQ5T3VzSlhtSmZOQnFxQVdIeHNWS3RXNnBYOG9OSHRwVXJ0MFhLcU1rdHVn?=
 =?utf-8?B?YzZuaUVoTG5JVW9sS3hlTDdNUnVaRitrazdaNWxRZXBKblBGYStkQlBwR1p6?=
 =?utf-8?B?YmxtSmRPRk1CUzhJa3lvS3F0VUFBQ091dVFkSDZGNExSS2xqaml0R3pSYVh4?=
 =?utf-8?B?cmRxVXI1eWVjNDZXWTB2MmNYUWFORVFKcVRTZWdzY2ROS0EzcW8ybmE5SE1a?=
 =?utf-8?B?NnVkcDRSTXlhUGVWd3BoNW5mTVVLSS9ycnVaWFlYZmVwTGxDZUlqam9KQk9F?=
 =?utf-8?B?YzA4bWdMR0t2L281c1Rzb2c0OFJJUzBnN3c1N2ZkTFZoOUc5Y2ZlcU5Id3ly?=
 =?utf-8?B?cUg1cWlVR01zTEpDNjZCN3paYm1yb2hVTFR2alNDM1h0VjJEQk5jeEpBZDhv?=
 =?utf-8?B?b3ZBWGliSTNRQjJFRHJRdnhEREtoZVhsSGtzeG5GWHlpalV1R1VCbXc1dFhS?=
 =?utf-8?B?RkZoamhXeEt0VndpRlErQTRXeUlsVy9LazBjMFRHK2FwUUpzQ0FLOUNkQks4?=
 =?utf-8?B?M080TUo1dy9EVUhJS3BnNmdQbTV2ZHIwYXZEWGY3QUVxaFJXM3pOS2xRcUJZ?=
 =?utf-8?B?L1U3ZWF0OVk1RG01Mno5eVdCQ2YxRHREYnY2U0ZJalF0TlVleDhzRDhpQjJh?=
 =?utf-8?B?VGdpWGw3amVLU3B3eGFDV0grRkQ2ZGxYd2I0WGZGdXdsSmc1eU9pQ0MwNFhs?=
 =?utf-8?B?SWVScjUzV0k5T2hTV2wrUDMrVVlCU20wNm5xS2k5blhwZ0dkS1F6YVMyTUx6?=
 =?utf-8?B?M0hmR1pDSXNvemh3Z3c0dUcreEMrejh5NzRnYXRIR3pnbEVta3BXaUxWTkxh?=
 =?utf-8?B?SkZTZHpKQVR0dytYaGxza1R3MGZ2cDE3aklKSDBZR0xyaGd3TGVtY0JOVGxx?=
 =?utf-8?B?b0hkeTRsQ0l5N2FlcHdSdFVHQzkxT2JaWmNGKzVnSUVENUttWGU3OWhESWhi?=
 =?utf-8?B?RzlONWF0OEJWUDI1aG9PbmJzZVJkVFRab1FiNmpKb3RKU0ZtY3FBUWRUYVRB?=
 =?utf-8?B?aDJ0UDM2WDNYUHVraUpkWEg3QXV3Y3BNRlFuejFxRlh3RDRyenVvTlMyNzlt?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d93e92-f319-4022-dea3-08ddb416eace
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 18:34:27.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQN195RGdJD6uE3cXW1tHOwQrMcxnE4VRb4Wub96f0QNZj/jPGLKSKpiOK6jQjdGri5NPCSN0C/cQ808tIyx7PG9BCzrumlpx4TjVMy8bMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFED6629EA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzOSBTYWx0ZWRfX9fJkwCcrLeCm EX51uI7zTl+TxmI+T2yNsYkDh+zuG4itVeNvXxGQ26vE7jDolPjEZeT/aMy8aoefeM5cBDeNjct urBqOYEdE6UAcbjm1E0dgjkK2pE+VL8gZ8r7HeUYUSFDmwlzfB1VYl3LgCTN9FOqdHBcp6OZdTJ
 7thQSLePIJcCjqE0O7W8Zinc1yJjVk908qRhbESrOGj+9KqlY81SDGKeK1NHDFLNN/J+T12AHEQ MPc8bRqdF/TRzbmxHUvrpHobzzqKotW0UfD9ya2KbqWXXACD7Lm85iPJjZ29Y8/2FTbPGsDBgZa Qed0x0Hpz+aiamrc8RqgcE4anS241kSgGMqKxyE2UJmjAIw4StHlr3CtWSlEtBNitBcfU+zQEJJ
 H3yizuVRvsNKKQGDztX4QXnAC70T6BefXSsgCBM6mVxuvQ1s4YFuyCbMPOCmI+wfUebbIVvS
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685c4138 cx=c_pps a=wVmz3cyIAFP1k0kvbcbXfA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=gHOQxHBEZSfhr2E3sw4A:9 a=QEXdDO2ut3YA:10 a=IvSf2wWeo5Qabfc-ds4A:9 a=zVIbGEfSuBTWR5Xb:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r5WuxrUXx4UW8G6FP4guk6yoaYql0KlZ
X-Proofpoint-ORIG-GUID: r5WuxrUXx4UW8G6FP4guk6yoaYql0KlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 18:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219330

--------------lDO5TdABIJkIkvLIcL47foJ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-25 6:20 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Rust stable version updated to 1.87.0.
> https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/
>
> * Update LLVM data-layout for arm64.
>    LLVM requires matching data layouts and
>    the aarch64 llvm data-layout was updated to to allow using
>    32-bit signed/unsigned pointers when building 64-bit targets
>    using 270, 271 and 272 address spaces.
>
>    https://github.com/rust-lang/rust/commit/e9853961452b56997cc127b51308879b9cd09482
>    https://github.com/llvm/llvm-project/commit/c9f27275c1330a325661bdf14fb3bc444a5e3648
>
> * Rebase existing patches with v1.87.0.
>
> * Two tests from the `ui` and `codegen` modules now fail only on riscv64.
>    Enable them on arm32/64 and x86-32/64 targets, while restricting
>    them on riscv64 via `only-<target_arch>` tags.
>
>    Test Results Summary:
>
>    +-----------+--------+---------+
>    | Machine   | Passed | Ignored |
>    +-----------+--------+---------+
>    | arm-32    | 28,320 | 901     |
>    | arm-64    | 28,400 | 849     |
>    | x86-32    | 28,285 | 885     |
>    | x86-64    | 28,518 | 676     |
>    | riscv-64  | 27,845 | 868     |
>    +-----------+--------+---------+
>
> * Backport triagebot.patch to skip tidy linkcheck when triagebot.toml
>    is not present. Distribution tarballs won't include triagebot.toml,
>    which causes tidy checks to fail.
>    This backport ensures tidy checks can still run successfully
>    even when the file is missing.
>
>    https://github.com/rust-lang/rust/pull/142666/commits
>
> * During rust installation, some binaries were installed from
>    'stage2-tools' built path to '${D}${bindir}'. However, from
>    v1.87 the stage2-tools are no longer built by default.
>    Update logic to install from `stage1-tools` instead.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
Much better commit log, thanks.
> ---
> Include test result summary and enhance commit message details.
The line above was likely a note for yourself but
it's harmless noise since it's below the --- separator.

LGTM.

../Randy

<snip>

-- 
# Randy MacLeod
# Wind River Linux

--------------lDO5TdABIJkIkvLIcL47foJ0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-06-25 6:20 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250625102014.1199159-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Rust stable version updated to 1.87.0.
<a class="moz-txt-link-freetext" href="https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/">https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/</a>

* Update LLVM data-layout for arm64.
  LLVM requires matching data layouts and
  the aarch64 llvm data-layout was updated to to allow using
  32-bit signed/unsigned pointers when building 64-bit targets
  using 270, 271 and 272 address spaces.

  <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/e9853961452b56997cc127b51308879b9cd09482">https://github.com/rust-lang/rust/commit/e9853961452b56997cc127b51308879b9cd09482</a>
  <a class="moz-txt-link-freetext" href="https://github.com/llvm/llvm-project/commit/c9f27275c1330a325661bdf14fb3bc444a5e3648">https://github.com/llvm/llvm-project/commit/c9f27275c1330a325661bdf14fb3bc444a5e3648</a>

* Rebase existing patches with v1.87.0.

* Two tests from the `ui` and `codegen` modules now fail only on riscv64.
  Enable them on arm32/64 and x86-32/64 targets, while restricting
  them on riscv64 via `only-&lt;target_arch&gt;` tags.

  Test Results Summary:

  +-----------+--------+---------+
  | Machine   | Passed | Ignored |
  +-----------+--------+---------+
  | arm-32    | 28,320 | 901     |
  | arm-64    | 28,400 | 849     |
  | x86-32    | 28,285 | 885     |
  | x86-64    | 28,518 | 676     |
  | riscv-64  | 27,845 | 868     |
  +-----------+--------+---------+

* Backport triagebot.patch to skip tidy linkcheck when triagebot.toml
  is not present. Distribution tarballs won't include triagebot.toml,
  which causes tidy checks to fail.
  This backport ensures tidy checks can still run successfully
  even when the file is missing.

  <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/142666/commits">https://github.com/rust-lang/rust/pull/142666/commits</a>

* During rust installation, some binaries were installed from
  'stage2-tools' built path to '${D}${bindir}'. However, from
  v1.87 the stage2-tools are no longer built by default.
  Update logic to install from `stage1-tools` instead.

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
    </blockquote>
    Much better commit log, thanks.<br>
    <blockquote type="cite" cite="mid:20250625102014.1199159-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">
---
Include test result summary and enhance commit message details.</pre>
    </blockquote>
    The line above was likely a note for yourself but <br>
    it's harmless noise since it's below the --- separator.<br>
    <p>LGTM.</p>
    <p>../Randy</p>
    &lt;snip&gt;<br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------lDO5TdABIJkIkvLIcL47foJ0--

