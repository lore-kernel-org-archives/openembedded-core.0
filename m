Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4610CC02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 09:40:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84221.1738575641240517763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 01:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4129e85224=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5136tHWf007604
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 01:40:41 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8hbxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 01:40:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnj4vgapHKwf14VXvOqtPyUgY9Z9n540Gbnsyui1JX077Xqcm2PD6iiXFo/8oKfkQfGqSMSjpn1seka56Cw1x1ryiDgda7MNo+MTnAr4AR43UX27J0XXZxMoThWr+laiAMVQTap0bSVjPizG4MtD6/a4h3TVZel0jKi48K1XE4tPPqq+Rfu1zl1P9jZvM/V50Zg4vcUaSxB1zfk4TddxGNg5PdeodqfTQvmuJOLths2a8YEuIUpI4Lbbvm6ID0nD24/eAde653M/cqZgU2GqcaQ7C0soSGMmPtOW+03pI3SnfmVE/0DtTwcUaNK5zqwLg1LYlbmC5I7k4wVUsCJ6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4E07es1q9AG+j+b6GPQet/CFmc3zglP3VzL/zDV/cY=;
 b=QzPZDbRW7PcJsV3WzkQi1T71MZbmNk6/gRG/leESQz3Pks+qo5lxX3/mH+PQDIy3ZW9OIDGinqFr6Xb7ko2cDWOsl+3NsG+FZdwo9gBdmnwGmvq4y8F1qGLHGo9ixNj9Y0FcDkaxq8zOIiDRvFHBvzJ2ruN3YPPC2g3r5rAqR7VjrsWSktHlnd2qFxHtKfTGtmmuQbr19jVbgDFZZJDMkB8MtC9sb9wgVKncConaH2HPHPdj5eA+zAvxEzQfseL6pfVHMdiX/An3BxrwGHEVPfPT98KJ4s5WEx8lJ/E7R5ImCm31I4tD6Rx3jTuQixhbfGlgzOPAbbg0uDivGJhmOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 09:40:37 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 09:40:36 +0000
Content-Type: multipart/alternative;
 boundary="------------EJgu7eRWHPflNaI2GdUkKtd0"
Message-ID: <88fcf076-e9e9-443e-8412-b2801569b308@windriver.com>
Date: Mon, 3 Feb 2025 15:10:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] qemuriscv: Enable Sv39 memory address scheme by
 default
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250203091519.1205884-1-Yash.Shinde@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <20250203091519.1205884-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: b89db2ba-417c-4ef5-49dd-08dd4436cfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WncybHdoWlA1NC9LdVd5UFhtZFpMdm0wK3NrTTMxTnBSRkhOczNVdUxCejBW?=
 =?utf-8?B?QkZWL0RWc2xyaVRiZW01a0ZJRStRL1RzTFVwditreDFDQXZRYnhwc2hkdXRC?=
 =?utf-8?B?SEQxNDZIZG1OdGxIYjJYQUNaK0ZMcGdQRHU5TFBnY21Na1ZzOHpRZHN1ZE1i?=
 =?utf-8?B?OXR6N2tXYjIzc3VYZEJpa29wVjJuWmQ4YjRtMUY5WG04eWRXdlVZazZYckJN?=
 =?utf-8?B?SU5JVGdtTHJXcTIvZnJsRnZpT3RMbXE5Y21xaDdhWEFSbzJpVnlldTBaZ1FL?=
 =?utf-8?B?L3lwbGNNaGZpNjRTa2UrNkd3SFJpRzUwVm5sUnhCcllvcWV4NUZQSEdQaGxO?=
 =?utf-8?B?SUFhVnhvclc5Ykt3cXNyakpLUG5aaktTTGtJeXhNSDc3QjBXcDJDb1IwRlNl?=
 =?utf-8?B?bWJid3lmckp0Y2dJNzIzLzFsczJ4b1NWUGszd1lvM2lGNnI2WExhWGdUQjZQ?=
 =?utf-8?B?NStXWUxJMXh1QXJCQnJrcEt0dEVCdVY0RkNNdEFqMVF4Z0hZVTZTNTFDV0Nh?=
 =?utf-8?B?UVFHVnVodDRDUFltRTVHUTdFSlcxVFBSa1cyK2w2cEFSV2tHOVYzN3h5ZllJ?=
 =?utf-8?B?UU40WE5aVGYrVVd4KzhhbVNsZU9XSmljRFUzYmtCdTdaUjJuKzVZV1Q4MGZD?=
 =?utf-8?B?ZU8xeVE3YVRXdFlvZGNodnZKS2N2eFNaYUdmUHVHZ1FrclVITTRYeHB0SjBk?=
 =?utf-8?B?K3ZkMmVqcEh3R1V2Z3ZsY2xDVDhnRUpCSnJkd1AvK3EwbzYxdlRBZFBmTm1s?=
 =?utf-8?B?L3NmVWwwZmNuOHRFRzNzcEtUSWhCS3djNHhOWGl5NkZsSWhYYmxndTJWWklZ?=
 =?utf-8?B?WTRuOXJRcEVuaXk3WUVvY3NteHcveG9sQ1pHNU9MZFJ3djVoUHBmZXd0ZG9y?=
 =?utf-8?B?Q3VoSUpXd1YvZ2JoRmc2cWVWY041bVNwcVFJdXRTdFJ0MmNVQnp0Qjgza1Fp?=
 =?utf-8?B?SmU4REhiT1R2NGZOczNmTVBndVh4TzQxSENjUUZvRURkU2thQ09PcjIyZ1dm?=
 =?utf-8?B?aWxJT3pZbm93WUFtWHJqU255Ym5kcXNLL0ZPQTVpbjdVSi9nNnQ3TjBMdDQ3?=
 =?utf-8?B?eVc2cWFhZ05TdlljWi9sd0FUVC81Rjd5bDVudzBkRm9kaEVpREhwWTY2QndU?=
 =?utf-8?B?MnFKYm1vNW16Zmw5OElJeWlteTJnZ3pQeGJCMzFFRCtWN1B4MmFBVCtoalRF?=
 =?utf-8?B?TXM3SytXS1VTM0w2UlhQOThUdzZ3TWVMbVA2dzhwRUZ3aGJoektFSmVzeWtV?=
 =?utf-8?B?My92bHR0MldSNlpwdEszeU04a0NxRDVIMlV1a2I0dGJ4cENHZGZjUmtyN0p4?=
 =?utf-8?B?UjU2VytkOUFLVWJLeXE5aTZyall2SGJUaFFEQ0VBTEsvZGRoUWcxZmsvRVg2?=
 =?utf-8?B?UTdLYlRXNmZ5V1k2YVVBNHI5akRQT3RRblNLcFIxci9qbTFrZWpESnlIZWpS?=
 =?utf-8?B?VlEzSzg5QjMwYjZpUExOMzJIbTk4UUNnZ01EdWhRNXJDbjRoV01DT20zeXk0?=
 =?utf-8?B?b1RVeXZ5aG9aT01VZ2labmdzSDNNL1YyMHlONUUzVFE0RlloeExLRk5rTVlr?=
 =?utf-8?B?dXl5NXozbXRzY0NpU1BWUkdJR3p5K1VydG1YUWI0ak9JdWdyOW9LTzd4aXU5?=
 =?utf-8?B?QTVNM0ZLM2ltQ01oSExVelNsdzVSbU5jZTVJcU52bnpnMi9MZ01nTXdIVTRp?=
 =?utf-8?B?eUk5ZXM4ZWdtNElrRDhwaldoMnd6TStxcVVaVWltU2ZCTUNhanQ1bHFNZlpC?=
 =?utf-8?B?YVFISmU4R3NFbUJGbXkyZ25WWTdLNUxNSlNGb3hHMEI2Zi8rRTBUQU5ZZDZB?=
 =?utf-8?B?enNjb0FrMTQrSXJXaWRyQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmtmOFV5VGZiL3NadGFTODRlTm5Ib1ZxLzNpNVRCZS96SHo5Q3N2anMxWFBM?=
 =?utf-8?B?OEFqMk5hQzNlN3l0d3hacWNobTRUbGR4aVBEcjV3bUxzWGo3Z3NpNGtwNkxH?=
 =?utf-8?B?bHZ6R1k1QW90MHV5MnZlc1dhSTZadVppSWNSM1VjQXplSzRNTDU4ZWJjNFJi?=
 =?utf-8?B?UU00MTU2SU12aTlNNVN3Wjl2S2lmQy9SbW53d2FKaXlnb2tSWm5SdU00L0cr?=
 =?utf-8?B?U3o3YStER21JdTE0R2hnUzlMNkMxYkc1YURYR3JDQ1FUQklPSkNHQUF0QWM1?=
 =?utf-8?B?bGhML0o3UHFoL21OeDRRcno3SkRYb1Zmdm1XbW9KU2dLNm9DeVJybVpxckNX?=
 =?utf-8?B?RjErRklrNm9tOUxTSEZuNlI0UE1kSkhTL0JXMUZPWVFhS1F2U1pXSXllUmNW?=
 =?utf-8?B?UkJnYk9wNlA5VDVsb2tTWC9WV3RyejFBbEZBSXhjVFBuSlppSk1CandwY3Zw?=
 =?utf-8?B?TTVsOU5ob2ZEM1JSalJUNXlhRnhFR2plNzg5djk0Wmdxd29KZWY0ZnB5czU4?=
 =?utf-8?B?bmlOMkZiNU1tdHNlaDRKZFcrcGp6ZDJCUktkNVpFdndZTlozQVViVHI1RE14?=
 =?utf-8?B?UzAvcnZxSWZJTC9ZcGlnS1d3MUdpcWdZVUVINmlzaDBDZDByNUVuWG8zcGdY?=
 =?utf-8?B?eE80ZlFQWWpEbGNYc0l6NTZaZ1FnRk1vVllNRy80ZHIzRUJqQkM2MURTTzly?=
 =?utf-8?B?VWFKWlAvKzBlU1pzLzlaT0pUVy8xcWhUL25BWjYvOVo3bHhkRUhsYllhWHF2?=
 =?utf-8?B?alMydnZMRkZSbmt5ZEQ4UTQxT0I5Q1Z5YkdQbHBTN0tBeGhyRGszNHNrYlJu?=
 =?utf-8?B?djB0bGE2ZWk1SVVSQmZKUEM5UUovV3Y4R3NjYURON29CdTRtaXM1a3E5bWty?=
 =?utf-8?B?WEVyL01rT1d5aklSUmplcXYxRTUvZDREeG55RmNpcWxwNFVxWjdoMDE0cXZt?=
 =?utf-8?B?OUJXV2dFQ1FKUUtud0M1NWR1MU9FNlNVaW9rK0JYTktqaFA5bnZkbHFubEl2?=
 =?utf-8?B?ZkF4QkVDb2Y1VmxEWnVsVFdObXl5SkwzMmlLZUQ3NVJTYVVMRGgyY0J4NmNJ?=
 =?utf-8?B?MW1HeGRBQkNkQ2ViTHA4bGZ0VDNTM29zN1Ardm5RbFZxWGxBVjRhYnBWV1BY?=
 =?utf-8?B?dEtNSEZ3clVNUVVUUlFTTjFhUWowNEptbFBvSitINC90MFg5L3AyUGg4MzBL?=
 =?utf-8?B?WmZkYU4rcHNlaVBYSWFRdk1qekZNTDgrR3Q2U0ZuUWtPbVVUaTNBa1VQRlpQ?=
 =?utf-8?B?VTd2MWlVWWM4ZXpjcGh6dVF2TEdYMnBEZFNoQTRKRHZhVng2UitPUmJWUGw2?=
 =?utf-8?B?Sk5MVXVTMGJHWm1TelBGWWQ3bEpzWmEwcVVvSElDaTlqL1A1UzJPUEQ1NFIr?=
 =?utf-8?B?MDRUNVZxYVZkcmkwTUdFMzNZelhXOUdIeVFjd1N5SFZGa0x2M24zVnp1RVVQ?=
 =?utf-8?B?WTEwckFRSUxRU2l4WW9HbzM0RklycmVRWnp0MDZBQjBHZ2ROZWJNZjAyY0hN?=
 =?utf-8?B?NlIrcXlwZmpGUER3KzF0YnArelBnSkZxTmEvbGtXTjNpczhwK211WCs2UzI5?=
 =?utf-8?B?VzIxcVBvZ2tLbDBXRDQ4NjluTG5LNjIvbjd1QnpUcVBGQnIrQlY4a2pHSmRh?=
 =?utf-8?B?UkVxNVpHMXFVWTRMazF0cVovM2RIOUh3RG9qbC9EdzFHaWNsbU1NTitFQURZ?=
 =?utf-8?B?bVJwNzlGTngrL0JoU0JOeGpzSy9aK1kyaVRnSFZzUCtvazJROXlxUEgyczJr?=
 =?utf-8?B?UWI4MmRWZmtEZkZCYlZ1cGRDM3ZUVUZzYkVna1FlVTZoOWE0dE85dTJwRlBD?=
 =?utf-8?B?cCtOQ1laS3ZIczJZbWhHeWh6ZWNJYjNWbHNkY2FIMjhTU1A4ZVc0YjdxaHlR?=
 =?utf-8?B?bmFjUkdKby9LdWs3V3hEUEZ2R1JKRXpJMGhDbGhuSk5QbE9iYVRRZnZTT3h3?=
 =?utf-8?B?TmkwM2dsb1htc3ZkZWdXU0VvMjhFcXVRcjBDQStGUHZDaDNVQmhSMHhhM0V3?=
 =?utf-8?B?SEdYUUo2L2ZBSVpkK28xZkpZemZFTDNTd2M2ZFZqQmVzVFJlVXNWWFJzRFZO?=
 =?utf-8?B?N0w4UkJ2cEtOaW5qUUtiTUQrLy9UbGJ3WEx6NmhhSHlHQk5TMmgxWnJ0Q0hM?=
 =?utf-8?B?RjZHNkp4MlUwdWU2QUV4VGVoZlVycXhSWmMyUVJJSUxZSVh0dXg0WnBaTUhr?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89db2ba-417c-4ef5-49dd-08dd4436cfd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 09:40:36.6247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV2qbjxbFMYyPlLUWn67JY5KfiJSkl6NBEd+CB27jmTCfGf1inUzIgetqGF8oespZKXsZ+BrZe4TlY+bFHBp0+kYzCiNH8Er8T1K7Vt6mq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
X-Authority-Analysis: v=2.4 cv=JrcLrN4C c=1 sm=1 tr=0 ts=67a08f18 cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=1NWNoF9oAAAA:8 a=t7CeM3EgAAAA:8 a=4r1r7OBXoNtUVM4N2iUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ysvUurNRf-XiGyqYmOkA:9 a=PaFUsVwohlwntArf:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=97APRTa-CG6DvPMFVxHL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: MZfxTFBS-40p57VmaVTezg8FvR42w4ij
X-Proofpoint-GUID: MZfxTFBS-40p57VmaVTezg8FvR42w4ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502030076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210636

--------------EJgu7eRWHPflNaI2GdUkKtd0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5136tHWf007604


On 03-02-2025 14:45, Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Currently, GCC Asan supports only Sv39 on RISC-V 64 due to custom alloc=
ator configurations optimized for large allocations.
> These configurations are incompatible with larger address spaces like S=
v48/Sv57.
> This fix enables RISC-V 64 configuration for RVA22S64 profile(which has=
 sv39 mode and other extensions) by default when running `runqemu nograph=
ic`,
> eliminating the need for manual configuration via command line flags (`=
qemuparams=3D"-cpu rv64, sv39=3Dtrue"`).
>
> Fixes [YOCTO #15691]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>
> Reference:
>
> https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425d=
e550c
> https://git.openembedded.org/openembedded-core/commit/?id=3D4b4450ff695=
ef73bf7a2437e142d2e0730d6a547
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/=
machine/include/riscv/qemuriscv.inc
> index d01d988eee..65cbfd66ee 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>   # qemuboot options
>   QB_SMP ?=3D "-smp 4"
>   QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> +QB_CPU:riscv64 ?=3D "-cpu rva22s64"
>   QB_MACHINE =3D "-machine virt"
>   QB_DEFAULT_BIOS =3D "fw_jump.elf"
>   QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,down=
script=3Dno"

As suggested by Randy in=20
(https://lists.openembedded.org/g/openembedded-core/message/210411),
I performed the openSSL ptest and the results were positive with no=20
deviations.
Additionally, I tested the GCC oe-selftest for risc-v 64, but it seems=20
to be currently unsupported. I triggered several full GCC test suites,=20
which did not finish
and I did not observe any errors. Also, there are no risc-v 64 GCC=20
testing AB logs available. (For eg,=20
https://autobuilder.yocto.io/pub/non-release/20241006-8/testresults/testr=
esult-report.txt=20
)
If anyone has further insights regarding the risc-v 64 GCC oe-selftest,=20
please let me know.

Also, tested Asan test as follows with command "runqemu nographic"
(with IMAGE_INSTALL:append =3D " libasan=C2=A0 libasan-dev"):

root@qemuriscv64:~# vi asan_test.c
root@qemuriscv64:~# gcc -g -fsanitize=3Daddress -o asan asan_test.c
root@qemuriscv64:~# ./asan
Running AddressSanitizer test...
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D326=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address=20
0x003fbb70002a at pc 0x002ac9fb5b88 bp 0x003ff203b910 sp 0x003ff203b8e0
WRITE of size 1 at 0x003fbb70002a thread T0
#0 0x2ac9fb5b86 in cause_buffer_overflow /home/root/asan_test.c:9
#1 0x2ac9fb5ca2 in main /home/root/asan_test.c:16
#2 0x3fbda737b4 (/lib/libc.so.6+0x277b4) (BuildId:=20
89440b2a8f8e9f78366a816e4685a39d6a4de4c5)
#3 0x3fbda7385c in __libc_start_main (/lib/libc.so.6+0x2785c) (BuildId:=20
89440b2a8f8e9f78366a816e4685a39d6a4de4c5)
#4 0x2ac9fb5a1e in _start ../sysdeps/riscv/start.S:67
Address 0x003fbb70002a is located in stack of thread T0 at offset 42 in=20
frame
#0 0x2ac9fb5ac4 in cause_buffer_overflow /home/root/asan_test.c:5
This frame has 1 object(s):
[32, 42) 'buffer' (line 6)<=3D=3D Memory access at offset 42 overflows th=
is=20
variable
HINT: this may be a false positive if your program uses some custom=20
stack unwind mechanism, swapcontext or vfork
(longjmp and C++ exceptions *are* supported)
SUMMARY: AddressSanitizer: stack-buffer-overflow=20
/home/root/asan_test.c:9 in cause_buffer_overflow
Shadow bytes around the buggy address:
0x003fbb6ffd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb6ffe00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb6ffe80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb6fff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb6fff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=3D>0x003fbb700000: f1f1f1f100[02]f3f300 00 00 00 00 00 00 00
0x003fbb700080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb700100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb700180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb700200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x003fbb700280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Shadow byte legend (one shadow byte represents 8 application bytes):
Addressable: 00
Partially addressable: 01 02 03 04 05 06 07
Heap left redzone: fa
Freed heap region: fd
Stack left redzone: f1
Stack mid redzone: f2
Stack right redzone: f3
Stack after return: f5
Stack use after scope: f8
Global redzone: f9
Global init order: f6
Poisoned by user: f7
Container overflow: fc
Array cookie: ac
Intra object redzone: bb
ASan internal: fe
Left alloca redzone: ca
Right alloca redzone: cb
=3D=3D326=3D=3DABORTING
root@qemuriscv64:~#
root@qemuriscv64:~#

Regards, Yash

--------------EJgu7eRWHPflNaI2GdUkKtd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 03-02-2025 14:45,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wind=
river.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250203091519.1205884-1-Yash.Shi=
nde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Yash Shinde <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yash.S=
hinde@windriver.com&gt;</a>

Currently, GCC Asan supports only Sv39 on RISC-V 64 due to custom allocator=
 configurations optimized for large allocations.
These configurations are incompatible with larger address spaces like Sv48/=
Sv57.
This fix enables RISC-V 64 configuration for RVA22S64 profile(which has sv3=
9 mode and other extensions) by default when running `runqemu nographic`,
eliminating the need for manual configuration via command line flags (`qemu=
params=3D&quot;-cpu rv64, sv39=3Dtrue&quot;`).

Fixes [YOCTO #15691]
<a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D15691">https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D15691</a>

Reference:

<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/qemu/qemu/com=
mit/af651969eb23ecf018bcaa8e0761b58425de550c">https://github.com/qemu/qemu/=
commit/af651969eb23ecf018bcaa8e0761b58425de550c</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/ope=
nembedded-core/commit/?id=3D4b4450ff695ef73bf7a2437e142d2e0730d6a547">https=
://git.openembedded.org/openembedded-core/commit/?id=3D4b4450ff695ef73bf7a2=
437e142d2e0730d6a547</a>

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/mach=
ine/include/riscv/qemuriscv.inc
index d01d988eee..65cbfd66ee 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D &quot;0x80200000&quot;
 # qemuboot options
 QB_SMP ?=3D &quot;-smp 4&quot;
 QB_KERNEL_CMDLINE_APPEND =3D &quot;earlycon=3Dsbi&quot;
+QB_CPU:riscv64 ?=3D &quot;-cpu rva22s64&quot;
 QB_MACHINE =3D &quot;-machine virt&quot;
 QB_DEFAULT_BIOS =3D &quot;fw_jump.elf&quot;
 QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,down=
script=3Dno&quot;</pre>
    </blockquote>
    <br>
    As suggested by Randy in (<a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/210411" class=3D"moz-txt-link-freetext">https://li=
sts.openembedded.org/g/openembedded-core/message/210411</a>),<br>
    I performed the openSSL ptest and the results were positive with no
    deviations. <br>
    Additionally, I tested the GCC oe-selftest for risc-v 64, but it
    seems to be currently unsupported. I triggered several full GCC test
    suites, which did not finish<br>
    and I did not observe any errors. Also, there are no risc-v 64 GCC
    testing AB logs available. (For eg, <a href=3D"https://autobuilder.yoct=
o.io/pub/non-release/20241006-8/testresults/testresult-report.txt" class=3D=
"moz-txt-link-freetext">https://autobuilder.yocto.io/pub/non-release/202410=
06-8/testresults/testresult-report.txt</a>
    )<br>
    If anyone has further insights regarding the risc-v 64 GCC
    oe-selftest, please let me know.<br>
    <br>
    Also, tested Asan test as follows with command &quot;runqemu nographic&=
quot; <br>
    (with IMAGE_INSTALL:append =3D &quot; libasan&nbsp; libasan-dev&quot;):=
<br>
    <br>
    <pre><div style=3D"color: #fffaf4; background-color: #00000000; font-fa=
mily: &quot;con&quot;, &quot;monospace-fallback&quot;, &quot;monospace&quot=
;; font-size: 15px;"><div><pre><div style=3D"color: #fffaf4; background-col=
or: #00000000; font-family: &quot;con&quot;, &quot;monospace-fallback&quot;=
, &quot;monospace&quot;; font-size: 15px;"><div><span>root@qemuriscv64:~# v=
i asan_test.c                                                              =
                                                                           =
                                     </span></div><div><span>root@qemuriscv=
64:~# gcc -g -fsanitize=3Daddress -o asan asan_test.c                      =
                                                                           =
                                              </span></div><div><span>root@=
qemuriscv64:~# ./asan                                                      =
                                                                           =
                                                     </span></div><div><spa=
n>Running AddressSanitizer test...                                         =
                                                                           =
                                                            </span></div><d=
iv><span>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                     =
                                                                           =
                                               </span></div><div><span></sp=
an><span style=3D"color: #ff000f; font-weight: bold;">=3D=3D326=3D=3DERROR:=
 AddressSanitizer: stack-buffer-overflow on address 0x003fbb70002a at pc 0x=
002ac9fb5b88 bp 0x003ff203b910 sp 0x003ff203b8e0</span><span>              =
                                                          </span></div><div=
><span></span><span style=3D"color: #008df8; font-weight: bold;">WRITE of s=
ize 1 at 0x003fbb70002a thread T0</span><span>                             =
                                                                           =
                                                             </span></div><=
div><span>    #0 0x2ac9fb5b86 in cause_buffer_overflow /home/root/asan_test=
.c:9                                                                       =
                                                                    </span>=
</div><div><span>    #1 0x2ac9fb5ca2 in main /home/root/asan_test.c:16     =
                                                                           =
                                                                           =
</span></div><div><span>    #2 0x3fbda737b4  (/lib/libc.so.6+0x277b4) (Buil=
dId: 89440b2a8f8e9f78366a816e4685a39d6a4de4c5)                             =
                                                                           =
       </span></div><div><span>    #3 0x3fbda7385c in __libc_start_main (/l=
ib/libc.so.6+0x2785c) (BuildId: 89440b2a8f8e9f78366a816e4685a39d6a4de4c5)  =
                                                                           =
              </span></div><div><span>    #4 0x2ac9fb5a1e in _start ../sysd=
eps/riscv/start.S:67                                                       =
                                                                           =
                     </span></div><div><span>                              =
                                                                           =
                                                                           =
                            </span></div><div><span></span><span style=3D"c=
olor: #8ce10b; font-weight: bold;">Address 0x003fbb70002a is located in sta=
ck of thread T0 at offset 42 in frame</span><span>                         =
                                                                           =
                               </span></div><div><span>    #0 0x2ac9fb5ac4 =
in cause_buffer_overflow /home/root/asan_test.c:5                          =
                                                                           =
                                      </span></div><div><span>             =
                                                                           =
                                                                           =
                                             </span></div><div><span>  This=
 frame has 1 object(s):                                                    =
                                                                           =
                                                    </span></div><div><span=
>    [32, 42) 'buffer' (line 6)</span><span style=3D"color: #8ce10b; font-w=
eight: bold;"> &lt;=3D=3D Memory access at offset 42 overflows this variabl=
e</span><span>                                                             =
                                                              </span></div>=
<div><span>HINT: this may be a false positive if your program uses some cus=
tom stack unwind mechanism, swapcontext or vfork                           =
                                                                     </span=
></div><div><span>      (longjmp and C++ exceptions *are* supported)       =
                                                                           =
                                                                           =
 </span></div><div><span>SUMMARY: AddressSanitizer: stack-buffer-overflow /=
home/root/asan_test.c:9 in cause_buffer_overflow                           =
                                                                           =
        </span></div><div><span>Shadow bytes around the buggy address:     =
                                                                           =
                                                                           =
               </span></div><div><span>  0x003fbb6ffd80: 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00                                              =
                                                                           =
                      </span></div><div><span>  0x003fbb6ffe00: 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00                                       =
                                                                           =
                             </span></div><div><span>  0x003fbb6ffe80: 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00                                =
                                                                           =
                                    </span></div><div><span>  0x003fbb6fff0=
0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00                         =
                                                                           =
                                           </span></div><div><span>  0x003f=
bb6fff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00                  =
                                                                           =
                                                  </span></div><div><span>=
=3D&gt;0x003fbb700000: </span><span style=3D"color: #ff000f; font-weight: b=
old;">f1</span><span> </span><span style=3D"color: #ff000f; font-weight: bo=
ld;">f1</span><span> </span><span style=3D"color: #ff000f; font-weight: bol=
d;">f1</span><span> </span><span style=3D"color: #ff000f; font-weight: bold=
;">f1</span><span> 00[02]</span><span style=3D"color: #ff000f; font-weight:=
 bold;">f3</span><span> </span><span style=3D"color: #ff000f; font-weight: =
bold;">f3</span><span> 00 00 00 00 00 00 00 00                             =
                                                                           =
                                       </span></div><div><span>  0x003fbb70=
0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00                      =
                                                                           =
                                              </span></div><div><span>  0x0=
03fbb700100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00               =
                                                                           =
                                                     </span></div><div><spa=
n>  0x003fbb700180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00        =
                                                                           =
                                                            </span></div><d=
iv><span>  0x003fbb700200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
                                                                           =
                                                                   </span><=
/div><div><span>  0x003fbb700280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00                                                                     =
                                                                          <=
/span></div><div><span>Shadow byte legend (one shadow byte represents 8 app=
lication bytes):                                                           =
                                                                           =
      </span></div><div><span>  Addressable:           00                  =
                                                                           =
                                                                           =
             </span></div><div><span>  Partially addressable: 01 02 03 04 0=
5 06 07                                                                    =
                                                                           =
                    </span></div><div><span>  Heap left redzone:       </sp=
an><span style=3D"color: #ff000f; font-weight: bold;">fa</span><span>      =
                                                                           =
                                                                           =
                       </span></div><div><span>  Freed heap region:       <=
/span><span style=3D"color: #6d43a6; font-weight: bold;">fd</span><span>   =
                                                                           =
                                                                           =
                          </span></div><div><span>  Stack left redzone:    =
  </span><span style=3D"color: #ff000f; font-weight: bold;">f1</span><span>=
                                                                           =
                                                                           =
                             </span></div><div><span>  Stack mid redzone:  =
     </span><span style=3D"color: #ff000f; font-weight: bold;">f2</span><sp=
an>                                                                        =
                                                                           =
                                </span></div><div><span>  Stack right redzo=
ne:     </span><span style=3D"color: #ff000f; font-weight: bold;">f3</span>=
<span>                                                                     =
                                                                           =
                                   </span></div><div><span>  Stack after re=
turn:      </span><span style=3D"color: #6d43a6; font-weight: bold;">f5</sp=
an><span>                                                                  =
                                                                           =
                                      </span></div><div><span>  Stack use a=
fter scope:   </span><span style=3D"color: #6d43a6; font-weight: bold;">f8<=
/span><span>                                                               =
                                                                           =
                                         </span></div><div><span>  Global r=
edzone:          </span><span style=3D"color: #ff000f; font-weight: bold;">=
f9</span><span>                                                            =
                                                                           =
                                            </span></div><div><span>  Globa=
l init order:       </span><span style=3D"color: #00d8eb; font-weight: bold=
;">f6</span><span>                                                         =
                                                                           =
                                               </span></div><div><span>  Po=
isoned by user:        </span><span style=3D"color: #008df8; font-weight: b=
old;">f7</span><span>                                                      =
                                                                           =
                                                  </span></div><div><span> =
 Container overflow:      </span><span style=3D"color: #008df8; font-weight=
: bold;">fc</span><span>                                                   =
                                                                           =
                                                     </span></div><div><spa=
n>  Array cookie:            </span><span style=3D"color: #ff000f; font-wei=
ght: bold;">ac</span><span>                                                =
                                                                           =
                                                        </span></div><div><=
span>  Intra object redzone:    </span><span style=3D"color: #ffb900; font-=
weight: bold;">bb</span><span>                                             =
                                                                           =
                                                           </span></div><di=
v><span>  ASan internal:           </span><span style=3D"color: #ffb900; fo=
nt-weight: bold;">fe</span><span>                                          =
                                                                           =
                                                              </span></div>=
<div><span>  Left alloca redzone:     </span><span style=3D"color: #008df8;=
 font-weight: bold;">ca</span><span>                                       =
                                                                           =
                                                                 </span></d=
iv><div><span>  Right alloca redzone:    </span><span style=3D"color: #008d=
f8; font-weight: bold;">cb</span><span>                                    =
                                                                           =
                                                                    </span>=
</div><div><span>=3D=3D326=3D=3DABORTING                                   =
                                                                           =
                                                                           =
        </span></div><div><span>root@qemuriscv64:~#                        =
                                                                           =
                                                                           =
               </span></div><div><span>root@qemuriscv64:~#</span></div></di=
v></pre><span>                                                             =
                                                                           =
                                                     </span></div>
Regards,
Yash</div></pre>
  </body>
</html>

--------------EJgu7eRWHPflNaI2GdUkKtd0--

