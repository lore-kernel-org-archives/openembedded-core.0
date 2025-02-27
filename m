Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D23C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:43:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13681.1740671000044904602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41537a6821=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RATnAa023244
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:43:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pu22agb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:43:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQp5FbsMvuvHGyWSJKTln0HOb0/R+mY7pgCLQFqn/CDFKtHsF7QyKAFp36faylZJRrenEOwJVOClBzegJq5xGbxdg9wllY7x7WqCFLC4yA0wI7vDgz5CxR2uDUanypxb4kG8dVjtG1xtXPEgiLK6+j14MgtLFCeZ5qJYLXHZM4sfi5b1XHNRp+2E29OpNVkIqP2pbULO0poy+PHx7zB+zA61mK5Z4PyBEjINga32dW8aMC/JqSCw2CNVU5oRgCgppUr/liR+TYqO6ZErgogS4K4C5T0oiZUNFCwcUhvwU5U84/A4IrzTm0gXiYP4qoknf1dVLD1YaR6hrdxZrcsooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gGRv8XzWpfFx+4Wn3+ChQoFJoTSd9I95+qK1ghPMx4=;
 b=SuuybhukMGGuBUAvfKUbTXWFJK1xeqbpXmEZq3ktl9cyJB95s413hbNvibPBoZkVlUSzyIpQsUzrxIVpHl7OSgN2tigLRm8a6w09XNWllBXwzqdk81tZZRs+rUKPKI683akKsrU8/+deBd3Y3rJqQ2jXeiOup1szQU7cmaCOx2t5ckXQT8kw1HtrmxszgVChbFRY+MAiu+P7PDXzAm0r+GnFnGqMzUsPvGaVSg9KG3SB77Y/pLSOPQUho8kTCNVSxqtKylbkJEdy7fHAIU7aQ3azEqqTgPsutklWfcBfp1N+TjyLjB7Z1QXcKfnu2Ob/O9OOCISJ49tIK1X33byxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 15:43:15 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Thu, 27 Feb 2025
 15:43:14 +0000
Content-Type: multipart/alternative;
 boundary="------------o8c3sbHEcDrnY2J07JjRIb2P"
Message-ID: <afb1c86b-aa0d-4b12-8ad1-33629d178e63@windriver.com>
Date: Thu, 27 Feb 2025 21:13:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] rust: Upgrade 1.82.0->1.83.0
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
 <1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com>
 <28c4058f-9a62-4774-91c9-77fe14629163@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <28c4058f-9a62-4774-91c9-77fe14629163@windriver.com>
X-ClientProxiedBy: BYAPR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:74::42) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ac4cbc-02f3-42f3-9ebf-08dd57457299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N0dscUlCWTJRRCtrVU5NYURTdHVPYTJaa29kMWhzT0tZc1ZpUFdmRGNjRUtv?=
 =?utf-8?B?QW50dktQNEljL2J5M1NxSTEzZ2NodDZkTUM3bFI3UDVuRnZzWFBDZGQvd2d4?=
 =?utf-8?B?WmV0a25jQThiR3J6cHRvY040KzJYODJQTFNjaFhSVWR2SWxUMGRIbE1pTXRl?=
 =?utf-8?B?R2R6RDZoQ3NTY2tGZm9yQnJYSEdsK3BpZzR0eVVhclRjRzZ0elppL0dXeHlN?=
 =?utf-8?B?WUxzMGtGeWdKOU9TaTRGYiswRzAvODBaTTZCK2M1K1Z0K0poamxCbW5Ud2tu?=
 =?utf-8?B?OFdxZkNscVlYVlBqdS9rYjd3czNjWTRBQXJteEVlMnRPSFY3UDRJanVWNVRu?=
 =?utf-8?B?UFNjVGNkdDN5c1VMcmo2SkVVWGZJMXRRK3dCMllYQVlIMmkzZzB3TmpJODdp?=
 =?utf-8?B?RTA1SjRJOXUvbEdDcWhHSmhnbEtNK0pqbithTWUvaU9vOXFHbFhsS0VHTGN0?=
 =?utf-8?B?WkI3QnhJZEJXdm13WTFteEREbVVpQUhYU25ocFJ5UDIrR1FEMjJrNnNyUS9I?=
 =?utf-8?B?LzJjbTRjVjB1eHFLOE05NnFlV2IwbzZzaWZpeG53ZUozcnZiNS84UllaUmpZ?=
 =?utf-8?B?cFNxQ1VGVk9jZkdKbUdneGNQS1EyN2trSk1nM2RHZGh4ZEZyamZEeitWNjdC?=
 =?utf-8?B?MG1TOEd1RUozSFZ4TWFnYjc5L2gzMlNBcXJDZFNGZ3JVaVd0QzJ1SEZ4SkFp?=
 =?utf-8?B?VmljbVhLK3BjMjhDVGZEUlJwV2pKUlJiS1pNSEhhZmE0bG1WTVpyT0hOdTlQ?=
 =?utf-8?B?TDJGVVhNUjFqVEtIMHA5czFoNVFGdkR2YTNNc1Y4STEwdm9tZmEyS2E5c3Zh?=
 =?utf-8?B?N2o3YUlJRTlGbzl0N1J3dHBQK2E4elJBRThvTC95bms1WHB1UTE4aHE5LzlM?=
 =?utf-8?B?Q1RwUEQxMU1DdXVGTzJBc2ZSeFdHUnhkd2UwZGlDdVE4eG5veHZmMDc0M0ht?=
 =?utf-8?B?ZWRyWENOVG9IaWJ2TDdRcmZHdXJYUVN5UzczZGYxeXE2aXVVeURSNWgzRTQw?=
 =?utf-8?B?Q01BbXduajNlZG9VK2d2S1g0SGtmU0pOZ0tFWDlCbTg4aXYyOHpnM2FYOXF5?=
 =?utf-8?B?YWpucVRDWWJROVJxaHliV0xIc0RBWDBKR0tHTlh6QXIxU2hRZGxTcnBjRVRr?=
 =?utf-8?B?L3JLYXo2MjVmYnFFRWFjV2VDUXFnbFBUaitQQkNBM25lcEZ4S2c5U1FpUiti?=
 =?utf-8?B?aXBBK3FLallPczVrNVRCaDJyWDljT0FJMk1MMUV0bHVmM1hzREhIb001ZEsz?=
 =?utf-8?B?VmNDVmdWblY4MDhpemVhcmc4NVdXcWZEWFFCSUkvV3g5ZlRoTy9nbklhc1Jr?=
 =?utf-8?B?VThiUmlKWnBiMXFkN0QrS1hCV29NVXFCc0NudUxyMDZXOTJBY1BvaHgvVWNj?=
 =?utf-8?B?c0FxRmdhNFpYVkIxMkNKSUN5NENldklibm9kTDlPS1ltYlZGbXR1Q1BtanJL?=
 =?utf-8?B?SkxJWVdldjJmbGRBRGd6MEZCbTczUXMra2xHaEw3UGU5TFE2Q3RtVFVTWE8r?=
 =?utf-8?B?blB6S1dOUWc3UEhMay9pdjlnbUMzK1AxNWFvOVdhdllrNGpMQ3FZSHViRTh1?=
 =?utf-8?B?R2kwWmhpYm1RWGdNcW41eVBxUG5teld1WTJPVnQvM3RtbisyOEFXRzdWNTBT?=
 =?utf-8?B?M21tb1Q2cCtjVXdxOUVCLzBDL2pjejZueVRmM1Jsbm9xdDhtSy9xWllCdHpJ?=
 =?utf-8?B?MkxpTHVQZVBzd1cxUXp1QjlwL0ZGZWxBWHdWd2FoaU5qcyt0cE1PZnV1dkZC?=
 =?utf-8?B?STZSTDdmQ1FVNkdVZTJMQldQTFpQNnBwOG1NSXUwTHBLek5Ib09XRlhWb1lF?=
 =?utf-8?B?T1ZPL2tFNUJoQzZpMkNkNGxtTGNzRWxMa2l1MkoxR3hJQXRTcGo2ZHlsbTN3?=
 =?utf-8?Q?JntYAPn4gdbT4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3dYZEFZZmNpNnpxM2RWNG1LS0dHbVdkL0JVZ25LbFE4VzlrRHNwTU02N0k4?=
 =?utf-8?B?S3UxVXNIMUJtUU1LN1RybldZb2ViYTF0UHY0bHNwaFdKOXR2aGNKdHBnQmRI?=
 =?utf-8?B?WWlVdG56MXcwT1J5UndENXdKUVMxL0w0bVd0bnpJaDJ3WmtPNk1VMXY0N3VY?=
 =?utf-8?B?UkVHZ1Vjd1FXc2RPUGcvaUU0OTErV0ZDdE9JZStiZGl5aVBNQStZQVYzQzRk?=
 =?utf-8?B?WnFUdlB6bkxCZ3pSL014d3VMa21uZGdOeDdTckdVT2o2K2pla2tNN0lZSVk1?=
 =?utf-8?B?d2ErZFBRREMvSXVPMjJYSHBldXpKV1dTcllKcFJRRDQranUwUklEcTJoY3Rv?=
 =?utf-8?B?OGk3OGxzN3BWK2tUMEl5eVZrMWdOdnROYnRVSFgzVko2dVJTV0VjL2JlYzA0?=
 =?utf-8?B?M2kxQzk1OFNBeCt5Y2RWWXk0RUJ3OTl3RVhMdnhCVUNuOXE2WWgxcmtTYmx0?=
 =?utf-8?B?bnJmSVZNMm5PWFNzbmIxWDdmQkxKTnM3akdzZWFjNWJQY0xkNGRvbXRrdC9B?=
 =?utf-8?B?SnVKZE9QbEY1bW5mUm9Bcm9YMmtjbXZxN1hmODZvVVNkQW5KWFIycmEwT000?=
 =?utf-8?B?bS94cGsybFlPeHI5MzQzYTRUY2hMY3p4YkJZVVlZSzZaQmptWFpaWEtLeFVH?=
 =?utf-8?B?dkNBWURFRVU0SmFzMnBOdHBCNTVEeWJpTHkwV3hrd1FDa0JiQTVDYXFvUzlx?=
 =?utf-8?B?ZVNhSHY3Y05kOHNkNlUyNkk0NlIzQ05MZXcvekY4bm5nNGtXUzlnR1c2N0Uv?=
 =?utf-8?B?SkE2VWtPMDl0R2JQM01XbG96SVpDb2huVWttcE5UQ2VLaGdDUFFsWVlBSkxN?=
 =?utf-8?B?V1ZrdU9tdmpFSnZoNkxnWHhlVVNadk9ZSXRFZDFYRkYwQUxla29sMmpJS1gy?=
 =?utf-8?B?RFNWTG1UT2t1L21lQzRPZ3JGM0RaSHZRcm54V2JPS3M1YlJDVmRvZXhWdWV3?=
 =?utf-8?B?Wm1CQWE1K0dxTDIyYnZvbTJzM1ZKZ2V4RkJVa0wveitkc0x0SzRPNVUxOGFI?=
 =?utf-8?B?d1Z1Yjc2dXdJc1BlRDk3eFpCenlaRHp3MWNPVk1yWStyWTRGUXFkdnZoODFC?=
 =?utf-8?B?L2JNN1FlYld3K1NnM3NPM253eUd3RUhucmtRNFZ6K2xpTHV0MTJyWjVjZWxj?=
 =?utf-8?B?MmxWeE9vTVJ6OHhEZjNpVTEvd01FNVFPdHpma3VPQVhORUxkQ1ZpN3pJZGs5?=
 =?utf-8?B?d0FPck5nVWJsRzZtS1BYcDNGbzhPSFJaWEd4N3JUdjAyUWlJbGhHeG9WZlZt?=
 =?utf-8?B?N2FZNSsyWkVoWmFJcUJRbVZvTFFuSmxkZjlPUnBMZnJMMU93RVQxSVB1cFRt?=
 =?utf-8?B?KzhFQzd4dmVXMVJYaWovZVZlNnRIMVNaMmhEcnhNQkVROXZ3WVhEQ1JjZ0Y3?=
 =?utf-8?B?NWRkQ1Y3YWVVck5LZlJ0ZG9OeFNXQ09LMnk4SkhlNXV3ajNpcW04b2U3d2Q4?=
 =?utf-8?B?d095R3JmT1JQdnRLbWdTQnFIOGRlTGRDcEZ3b3lFMWRVRVNxcHJqeDJ0aDll?=
 =?utf-8?B?MlRTcTBzWTlXOW9tWURESU9PZldFSi9UbTdGaE1pemM1VUl5V0FGL2J1dnhR?=
 =?utf-8?B?WkxucTNVaSt2dTgxWnkzOFBDMTA1WHZZdXdjeEhiMmVjTnlZRUUxbml2Wk5V?=
 =?utf-8?B?WkdOenloZVN5UFBXazN0MGpzTzFQdTBycGNEM1FrZ1FHTmg1eEJoTUtyYWt3?=
 =?utf-8?B?Ylo1TlJxVkx1ZE1KY3NxRWdka24xajlNSXJKWjlNYkhacE5uNEhxWXNsK2Zt?=
 =?utf-8?B?K1FhR2Ewd1BaaC9aZ3hxdjVNMUtaVVNhTC8rU3lPcUw0dkRCakRPNHQrQlhy?=
 =?utf-8?B?dGJSN2RZVFhCeGoweUJ6d3pta0lyVnhFS1hod0ExeWwxZXR3SVB6Q2JXUXAy?=
 =?utf-8?B?L2pObDFpUmxUWVFJZ3k1VFBtVExaTFZ4S2Jud3NxczdwTHltUDJ2Q29DSFdz?=
 =?utf-8?B?TzE1TTNvRVU3YTVMMkNLQ21XYk4rYzY5YlZyVXVpZW5lbU5hTXVEREtKODhR?=
 =?utf-8?B?eHJoUkZBdmdEQ1RoTE9sUERDYVhxcEYxNWdiZVBTU1ptZE9jejRxUHptcEd4?=
 =?utf-8?B?TGkrdDQ2YVRNdGpHcXkvaG5qSU5CQjBaTWpkZW9lSjRrMmNLWnZkc2dwSHEz?=
 =?utf-8?B?dmlmOVo2OFdEa2lFM3pGK3pjODE0dXhCK2Yvd2FNL2hFZmRsei9MVVMwTWtV?=
 =?utf-8?Q?TYVUeQ3u6Wpxg24n4jZX3I8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac4cbc-02f3-42f3-9ebf-08dd57457299
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:43:14.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wlk2+yPgxtxB38tYzEnm9BrRMdcKn+tXWTBcw04T76pUb4C994ZSIuCQnuUfoUMabzboJCXVj4MCdpi5duvvt1CB+Nm/rtx4KXFEgWfiq2+3KnCAZ80R0bMBp72sjvc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
X-Authority-Analysis: v=2.4 cv=K7bYHzWI c=1 sm=1 tr=0 ts=67c08816 cx=c_pps a=kSx+wkOqrR7DBdLtetN7AQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=TjV73JPptr-7zTCyIgEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=ZQC9c92jgzq8WOARh6AA:9 a=dMsqkwmxIYg0dyOi:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: k2jNdmlphoe_EnHGF1HmJ5N991YQlbno
X-Proofpoint-GUID: k2jNdmlphoe_EnHGF1HmJ5N991YQlbno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=909 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212019

--------------o8c3sbHEcDrnY2J07JjRIb2P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 51RATnAa023244

T24gMjctMDItMjAyNSAyMDo1NCwgUmFuZHkgTWFjTGVvZCB3cm90ZToNCj4gT24gMjAyNS0w
Mi0yNyA4OjUyIGEubS4sIFZhcmF0aGFyYWphbiwgRGVlcGVzaCB2aWEgDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+PiBUZXN0ZWQgdGhlIGZvbGxvd2luZzoNCj4+DQo+
PiBiaXRiYWtlIHJ1c3QsIGNhcmdvLCBuYXRpdmVzZGstcnVzdCwgY29yZS1pbWFnZS1taW5p
bWFsLCANCj4+IGNvcmUtaW1hZ2Utc2F0byAtYyBkb19wb3B1bGF0ZV9zZGssIGNvcmUtaW1h
Z2Utc2F0byAtYyB0ZXN0c2RrLCB3b3JsZA0KPj4gb2Utc2VsZnRlc3QgLXIgcnVzdCwgcmVw
cm9kdWNpYmxlDQo+Pg0KPj4gb2Utc2VsZnRlc3QgcmVzdWx0cyBmb3IgYWxsIGFyY2hzIGFz
IGJlbG93Og0KPj4gVGFyZ2V0wqDCoMKgwqDCoMKgwqDCoCBwYXNzwqDCoMKgwqDCoMKgIHNr
aXBwZWQNCj4+IHg4Nl82NMKgwqDCoMKgwqDCoMKgIDE5MTQxwqDCoMKgwqDCoMKgwqDCoCA0
MzgNCj4+IHg4NsKgwqDCoMKgwqDCoMKgwqDCoMKgIDE4OTU0wqDCoMKgwqDCoMKgwqDCoCA2
MjUNCj4+IEFSTTY0wqDCoMKgwqDCoMKgwqDCoCAxODk4M8KgwqDCoMKgwqDCoMKgwqAgNTk2
DQo+PiBBUk3CoMKgwqDCoMKgwqDCoMKgwqDCoCAxODkzN8KgwqDCoMKgwqDCoMKgwqAgNjQy
DQo+PiBwcGPCoMKgwqDCoMKgwqDCoMKgwqDCoCAxODg5M8KgwqDCoMKgwqDCoMKgwqAgNjg2
DQo+DQo+DQo+IElmIHlvdSBoYXZlIHRoZSBudW1iZXJzLCBwbGVhc2Ugc2hvdyB1cyBob3cg
dGhhdCBjb21wYXJlcyB0byB0aGUNCj4gdGVzdCByZXN1bHRzIGZvciAxLjgyLiBTaG93IGJl
Zm9yZSwgYWZ0ZXIsIGRpZmYuDQo+DQpPZS1zZWxmdGVzdCByZXN1bHRzIGFzIGZvbGxvd3Mg
Og0KDQpCZWZvcmUgVXBkYXRlIDoNCg0KVGFyZ2V0wqDCoMKgwqDCoMKgwqDCoCBwYXNzwqDC
oMKgwqDCoMKgIHNraXBwZWQNCng4Nl82NMKgwqDCoMKgIDE4ODk4wqDCoMKgwqDCoMKgwqDC
oCA0NDUNCng4NsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTg3MTLCoMKgwqDCoMKgwqDCoMKg
IDYzMA0KQVJNNjTCoMKgwqDCoCAxODc0MMKgwqDCoMKgwqDCoMKgwqAgNjAyDQpBUk3CoMKg
wqDCoMKgwqDCoMKgIDE4Njk0wqDCoMKgwqDCoMKgwqDCoCA2NDkNCnBwY8KgwqDCoMKgwqDC
oMKgwqDCoMKgIDE4NjU0wqDCoMKgwqDCoMKgwqDCoCA2ODkNCg0KQWZ0ZXIgVXBkYXRlIDoN
Cg0KVGFyZ2V0wqDCoMKgwqDCoMKgwqDCoCBwYXNzwqDCoMKgwqDCoMKgIHNraXBwZWQNCng4
Nl82NMKgwqDCoCAxOTE0McKgwqDCoMKgwqDCoMKgwqAgNDM4DQp4ODbCoMKgwqDCoMKgwqDC
oMKgwqDCoCAxODk1NMKgwqDCoMKgwqDCoMKgwqAgNjI1DQpBUk02NMKgwqDCoCAxODk4M8Kg
wqDCoMKgwqDCoMKgwqAgNTk2DQpBUk3CoMKgwqDCoMKgwqDCoCAxODkzN8KgwqDCoMKgwqDC
oMKgwqAgNjQyDQpwcGPCoMKgwqDCoMKgwqDCoMKgwqAgMTg4OTPCoMKgwqDCoMKgwqDCoMKg
IDY4Ng0KDQpEaWZmZXJlbmNlIDoNCg0KVGFyZ2V0IHBhc3PCoCDCoMKgIHNraXBwZWQNCng4
Nl82NMKgwqAgKzI0M8KgwqDCoMKgwqDCoCAtNw0KeDg2wqDCoMKgwqDCoMKgwqDCoMKgICsy
NDLCoMKgwqDCoMKgwqAgLTUNCkFSTTY0wqDCoCArMjQzwqDCoMKgwqDCoMKgIC02DQpBUk3C
oMKgwqDCoMKgwqAgKzI0M8KgwqDCoMKgwqDCoCAtNw0KcHBjwqDCoMKgwqDCoMKgwqDCoCAr
MjM5wqDCoMKgwqDCoMKgIC0zDQoNCj4gSWYgeW91IGRvbid0IGhhdmUgdGhlIGV4YWN0IG51
bWJlcnMsIGZyb20gdGhlIHBhdGNoLCBpdCBsb29rcyBsaWtlIA0KPiB5b3UndmUgb25seSBh
ZGRlZCA2IG1vcmUgdGVzdHMgYXMgW2lnbm9yZV0uDQo+IElzIHRoYXQgcmlnaHQ/DQo+DQpG
b3IgMS44MyB1cGRhdGUgLCB3ZSBhZGRlZCAzIHRlc3RzIGFzIFtpZ25vcmVdLiBPdGhlciB1
bml0IHRlc3RzIGFyZSANCm1vZGlmaWVkIHRvIGFkYXB0IHJ1c3RfMS44MyBzb3VyY2VzLg0K
DQpSZWdhcmRzLA0KRGVlcGVzaA0KPg0KPiAuLi9SYW5keQ0KPg0KPg0KPj4NCj4+IFJlZ2Fy
ZHMsDQo+PiBEZWVwZXNoDQo+DQo+IC0tIA0KPiAjIFJhbmR5IE1hY0xlb2QNCj4gIyBXaW5k
IFJpdmVyIExpbnV4
--------------o8c3sbHEcDrnY2J07JjRIb2P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 27-02-2025 20:54, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:28c4058f-9a62-4774-91c9-77fe14629163@windriver.com">
      
      <div class="moz-cite-prefix">On 2025-02-27 8:52 a.m.,
        Varatharajan, Deepesh via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com">Tested
        the following: <br>
        <br>
        bitbake rust, cargo, nativesdk-rust, core-image-minimal,
        core-image-sato -c do_populate_sdk, core-image-sato -c testsdk,
        world <br>
        oe-selftest -r rust, reproducible <br>
        <br>
        oe-selftest results for all archs as below: <br>
        Target&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; skipped <br>
        x86_64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19141&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 438 <br>
        x86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18954&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 625 <br>
        ARM64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18983&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 596 <br>
        ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18937&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 642 <br>
        ppc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18893&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 686 <br>
      </blockquote>
      <p><br>
      </p>
      <p>If you have the numbers, please show us how that compares to
        the<br>
        test results for 1.82. Show before, after, diff.<br>
      </p>
    </blockquote>
    Oe-selftest results as follows :<br>
    <br>
    Before Update :<br>
    <br>
    Target&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; skipped<br>
    x86_64&nbsp;&nbsp;&nbsp;&nbsp; 18898&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 445<br>
    x86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18712&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 630<br>
    ARM64&nbsp;&nbsp;&nbsp;&nbsp; 18740&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 602<br>
    ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18694&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 649<br>
    ppc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18654&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 689<br>
    <br>
    After Update :<br>
    <br>
    Target&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; skipped<br>
    x86_64&nbsp;&nbsp;&nbsp; 19141&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 438<br>
    x86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18954&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 625<br>
    ARM64&nbsp;&nbsp;&nbsp; 18983&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 596<br>
    ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18937&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 642<br>
    ppc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18893&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 686<br>
    <br>
    Difference :<br>
    <br>
    Target&nbsp; &nbsp;&nbsp; <span class="hljs-keyword">pass</span>&nbsp; &nbsp;&nbsp; skipped
    <br>
    x86_64&nbsp;&nbsp; +<span class="hljs-number">243</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<span class="hljs-number">7</span>
    <br>
    x86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +<span class="hljs-number">242</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<span class="hljs-number">5</span>
    <br>
    ARM64&nbsp;&nbsp; +<span class="hljs-number">243</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<span class="hljs-number">6</span>
    <br>
    ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +<span class="hljs-number">243</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<span class="hljs-number">7</span>
    <br>
    ppc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +<span class="hljs-number">239</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -<span class="hljs-number">3<br>
      <br>
    </span>
    <blockquote type="cite" cite="mid:28c4058f-9a62-4774-91c9-77fe14629163@windriver.com">
      <p> If you don't have the exact numbers, from the patch, it looks
        like you've only added 6 more tests as [ignore].<br>
        Is that right?</p>
    </blockquote>
    For 1.83 update , we added 3 tests as [ignore]. Other unit tests are
    modified to adapt rust_1.83 sources.<br>
    <br>
    Regards,<br>
    Deepesh
    <blockquote type="cite" cite="mid:28c4058f-9a62-4774-91c9-77fe14629163@windriver.com">
      <p>../Randy</p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:1e5a8005-c2fc-45c7-b27b-1e061954508c@windriver.com"> <br>
        Regards, <br>
        Deepesh</blockquote>
      <br>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------o8c3sbHEcDrnY2J07JjRIb2P--

