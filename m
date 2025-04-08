Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D859C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 01:21:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.64825.1744075275290313484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 18:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61937040f4=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537N94Cl020202
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Apr 2025 01:21:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1k7be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:21:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsUll60vQoCpUCJzoNzaVssErONBTxofM9J/pb+CBS0VMhxpJkuS067tf27hg3WfpD6dQPsLRu9xGklqfXpDJpbNFBYSMLYePi8HJM+zs+0VWaJqNem2S0L0mdlN5WfiIH36CJiANMYhq4t4M0Ya2+1tqvgZ3QwkQ/wV5LrNyxaHHEHEssNzhkveaPL5vWLuiNH+BKSu8J546FDY96DX8z8NduAuDCK8OMrUPbqCW2XfJNVt86vw80EFYVnmMW/YMqvefWTsrF+4Wm50F/qf1x2fuIdbC/Kr30Rav3vlxfJs+bm4PHHPlj/t2Zy1H2AMp1Ousb7qDIm2q+gbtCMqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2mslz7w9lqRMfbxcEkQDX4Z/b93vvN9kPIt6KYDx1E=;
 b=EuZgZuLyXlGCWg66BzPh9RUNhWzSCob2ZspgVJ6Jin6Pk8++Fi3Ex+7pkaZNu44L3Kq1J9mqOxJFD8K6UJCVfkiqht2+A+wmz3MfnNyLk7Y+lrj53mnjjzpd0BWhMTP4OCdhRuD7MxlUlWfEglogiD/uz2X5pPSHen6ie0QLiYkt8FEwsU36CcfH7UklMIvw7M92fCXH/vYy5gCwEnyNEUDXzRnojtvFBjaW9uZPTeRwSaWr/LAX+5zeCqi/A0mfn5dUMDd7yN0uGKg3w1bSfK0KGAQ0UfsQNXgd3Oh+fczTEUfcd1loLwSsuZOOFc9KtrYEWvJKxGVgJ/TgSXpNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 01:20:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:20:59 +0000
Content-Type: multipart/alternative;
 boundary="------------y0U42RLo80NyDEhR1NHfN7Nb"
Message-ID: <c12f67c8-8151-4c00-8d49-dd0c8af9bf43@windriver.com>
Date: Tue, 8 Apr 2025 09:20:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] initscripts: add function
 log_success_msg/log_failure_msg/log_warning_msg
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20250403085305.3667237-1-changqing.li@windriver.com>
 <70560a18-cf98-40e8-a71a-6d3f90905d44@windriver.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <70560a18-cf98-40e8-a71a-6d3f90905d44@windriver.com>
X-ClientProxiedBy: SG2PR06CA0243.apcprd06.prod.outlook.com
 (2603:1096:4:ac::27) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN0PR11MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2393f9-e7e2-45ab-a713-08dd763b9e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0hkdVBoTHA4RWpGWmpxUnBSTlRYUy9Hb08wcTdhSStrTzJKQXgxcDdlc0ts?=
 =?utf-8?B?QzgxYXRVQlNhdjBOMWUzWnN5blNDQUxaQkhZaEVXTlJ2bTRBOHNvQWMzL3NF?=
 =?utf-8?B?RmxNUHNLcVU1TWpjdzc0QWQyYjV3RTB6MFUrd2I4SEF0YUt6a0pCZE5LMXNO?=
 =?utf-8?B?WnQwNEFkWkRSS2tGOGN1RVZiUjNraDF0RXhRbHlqOGhHYndva3NIMVl6TUZW?=
 =?utf-8?B?RVMwazRFWVZNN09obEdkSTdsZ3Q5VnI4dDJ6RVkyS21hNXNsRWNNS0FneitX?=
 =?utf-8?B?TzQxRFdES2Y3RE1PbFlTMi96akNiUmtuZ3Rkd0pPQmNGNGd1dktCbnF6WkdH?=
 =?utf-8?B?YzlXUW03N2lFVm8vUTJybGdQZksvUVFJaFBhMndQZUQwNHEvWDlaSkY2OUNQ?=
 =?utf-8?B?bWp4WUMvUmlnOEdKTE5XS0x1eExxbE0zc0hRUTF4Ui9ieU8zcE5OYkRYWGd6?=
 =?utf-8?B?TDdQZ09JaUVTb2czZ2dMNWJxcWtXbExUYW8yR2x6Y1hRSUJBUDEvQlZaVllB?=
 =?utf-8?B?VVpsYXpIVmE0aEYwVVZQeEUvNjFVNUxHRlhsd1N2Qk8wRnZyL2E2YWdzRGJD?=
 =?utf-8?B?ZjhDLzNkdDVnaDVwOUtITVptbDloYzh5eUE0aXo4TllzN3FwUHBaZWJlUm56?=
 =?utf-8?B?ZXpUeU9FY3p0aEV5M3V4U0ZZNkFWNFNOeUp5WVRGVzZ3WUxTZlNJd2ZueWdo?=
 =?utf-8?B?V0dxUytZUmdySHd3bThVb3BMUGEvbWYvQmJIaW1jdWlMZ0lKQU0yWHhjQ0Js?=
 =?utf-8?B?d2JXZ0hrTUhnQlhxMzh0VW5HdHdoTHBIcjZtdERUaVZHZVhxMHZNRTFXMkUw?=
 =?utf-8?B?aEtkYkFNa0tCaGxSOVJsQllnOVNGdURNM1FVNE44WVBKRzhJUTJUZTVoa0tu?=
 =?utf-8?B?d0hsUlk3ajFlNGdZWTVWbFRNdFJrOTJ4c21sV0J2bjdNSFlWSjI0ejIybTgy?=
 =?utf-8?B?T0ZLbExwamlENE83c2t6aXVIazhZcTR1TDQ4K1VURVBtZDQzWGRjMVM4QnMr?=
 =?utf-8?B?STFCZDlEeHIydS9RTlBXZWZXUkV3UkJObWJpU3BjTjBKNkJOYTdxTmhIald3?=
 =?utf-8?B?L2pTSnZybFk2TmdJS2NxRUZsT3N3TVM3eGgyQ0tNN3o2VDhYaEZ0T0ZRUHh4?=
 =?utf-8?B?U1g3Z0RUVUZXQlBzT1NGWm5UOGpkbEdBbzdBQzk1Q1BscVhkZ2ZrU1E1UHFt?=
 =?utf-8?B?NHlTZ3ZnUEYxeEZQWFNERFlWb2liSEd0a2F3MjZSZ3BPaHRJS2M5V0xibnF3?=
 =?utf-8?B?OWZJQ3ZKUjUxWUYxOXZiWENJNUJMbENpa2pueG03RnpyKzdGbXVNWEY1TkNI?=
 =?utf-8?B?V3AxYU5raG9BcTZONkNSUVE5N3hJWWFtM3pUREZpMVJDOGN6ZnQ0dWJxY25m?=
 =?utf-8?B?WGtHNHZGWkRHT3NUQlBRTTR1RU9xRE10c1IvTXJqNkFoRk5SYldYeUZkMnIr?=
 =?utf-8?B?NldjREZ5K2Y3NzBjcXZCYStyK0l2THdQc3pWdUlhUEZqRnplVGJHeElaL2lM?=
 =?utf-8?B?UkVsa0VFeE5sa3Y3K1k2akU5S1B0ampVRGR5T3NMVGxkSzU2YllhQzI1YnBu?=
 =?utf-8?B?di9Hcjh6cXNyZGl3QjZoN09RbkE4dHJvakE0TVlHSWNzcmFSc1VmUmJkUEJj?=
 =?utf-8?B?YzNXWG5UYkowVHVJblJQVlBCcnY5OXIyeUt3OU9mK3o2WFNPZDNTNXhFbXlk?=
 =?utf-8?B?d0lrbzRnRzlTMGVwR0hQZzE0TUlWa05aQklWU09qRWd1b1JienVoZjh6SFJ6?=
 =?utf-8?B?UTB2TGwvVW1IdGNIMkxUbE14Nk5CL1EvWGhHaWc2N3UrTWdqZkhYZnhDM091?=
 =?utf-8?B?RlRtYkszTEVxS3ltWi85QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Unk3SkNBb2Q0bE1YSUlyTnlFbmROSjVQUklDOXRvNksxWmZpODEzZHBHTHFS?=
 =?utf-8?B?aDZpNW91TmlPdWt4alI5eXVMYi9zc01jbFVKc1N1V2VuVldQeXJlTUs2cThx?=
 =?utf-8?B?ZFJVejZsZUhXTlZhQkxFQUVIV0xEazlJeGVUQW4reEtTeVFjWERkL0tUMkw5?=
 =?utf-8?B?akpYdDl3VVUzbjc4d3k2enc3eHY1UE5GUXdUZXpzbXJPRVRKdFR4MU4rMnd1?=
 =?utf-8?B?MXlCb0FnZmtYUUNTMzAwUjJYQkVUU05NSVlVbXJSdnpjQXNKMUJjUnR5WURM?=
 =?utf-8?B?RmJxK3JBOVRhTEIvL2FqMnhyM1NDWlQ3SzhjVnZ0bzM5cjBZeHpUMHpCN2Z5?=
 =?utf-8?B?SUp5RC9hVkdWeW1XaDhSb3pHM0Q1ZVUrTU52V25ydTBueDdLbkovWm8vVVd6?=
 =?utf-8?B?Yk9wUzA3d3YvUm8rYkNLdkFnYzdHZjBHdlc3WDVoMXRpZTVrNkJ1VmlaU3Jy?=
 =?utf-8?B?YlhpOHJGTkQwc2VUcG1BaEcydVBFeGx4dy9IeCtNNUg3MkFJcE90UHg0WlMv?=
 =?utf-8?B?OVUxZEI1K09KbjlQeGpDcXFUd1Z0QWhTaVBpU2ZUcFd2L3lqMlh5bHk5elRM?=
 =?utf-8?B?L3BjYm9EWTZ5TFR3MHZaRUdWL2hBTGZOb1FSRlQyV01UUURoNUdDOVdUS0x3?=
 =?utf-8?B?VG5pNkU4VTBJR09ablhaUFFRRTgxL0VSRFJQUEtPRmtrL2s1Sm5zMnd6VWZv?=
 =?utf-8?B?UmVkMFNxdExQMnZhUU1CaVM1cFlONkVoZ2YxNThGajkrSk9PekxKSG5vei9N?=
 =?utf-8?B?akQrdmNQbkp4UUN5eEJ0Z2ppWnlsdjRFVGlrWUtLYTdweisrajE4R1UxYnNl?=
 =?utf-8?B?SnBweGozTlhuSVcyaFhQbFpPU2dCblNEODhoaUg5Y2hmNU1BTmNPemFGcy9a?=
 =?utf-8?B?U2xRMnhTbUQvVWJodWJ6OUxNSnZNaUlQR1NXb09sd2x3aElGdWYzUHhCZEp0?=
 =?utf-8?B?cjhCSnpYZE52UldWVmpYU3AzUCtpVVE0QWFNSnJaWHEyZEZ1cC9iaDgrS1Qz?=
 =?utf-8?B?RDVhbXRvMjY1d3FuOElEL1U2MndaZUZqVGpuaDF3VXNMbHd2aVF3TFdSQlFt?=
 =?utf-8?B?RVFYV2N3MlAyQmdPemwxWWdTMFdqL3hnbEhMbGwzVmJNZE0xNVU0SzV2WGV5?=
 =?utf-8?B?dEFLL2lhc2RLc3dCV3hiSEtkU3ZRZ2Z0aGljcjZHN3Bxb1RHZmVzUTNSeXkw?=
 =?utf-8?B?WkJINmQ4cGJiWkhIQTVaTnc1MFlFQlVPTmlmSEJwM2JZVzgyT3lkYWJKcmEx?=
 =?utf-8?B?ZnZhOTRNTzhUNEM0eno1S3ptUFVQR0tNcG0xVzErZWpIV0VNcG1VM1VrNVcr?=
 =?utf-8?B?UFdGNnNHd2dIZGtMVVlhU3VQdnl1NGhYZ21GR1pDT0xlUnk5d0VnL3NZL0RR?=
 =?utf-8?B?TkpPWElHS01OQmNpVXJKd04wN0Vkd3Zya3puaUtxdzdiL2wrOUJ5c0lUZ2xD?=
 =?utf-8?B?Y0ZqK2FpOFpBbG94VU1VVCtWbVBqZUZ2VDhrM3dBbFRsRUhWUmFOMENJdlVl?=
 =?utf-8?B?TnJHcytRcTlWSldCTUFOdms4d1RpLzBUQ0NuQ3dSY3J4dzhLVVlhbGNrZXI5?=
 =?utf-8?B?N05PYkZ3Z0xLR2tZRTlSL0QxTGJ3c1VuczNnVUtDWk15TmNuY3I2MlFNalEr?=
 =?utf-8?B?SVQ3TnB5T3dhVnMxM2N2akpoWWRlY3VIK3BHTmlsY0VxcDNVSXV1OXR2SGF5?=
 =?utf-8?B?RVQ0TWttQWpxQkV3aS9pNDhYeEtKMk1UZFFGSWZCa2dHR0U2QnJRQklvVXNO?=
 =?utf-8?B?bjhiR29PU1MwcjJTdERSczduT2pNbGNjbnBveHpObVZjVmdRbkI2VFJtTzNo?=
 =?utf-8?B?cVNPcWV3SkxseGh2WlhOOStoV3Era2JmNitiQTIrd0Qwb3JaSjcxemI5RUVR?=
 =?utf-8?B?SzZraTBpMU9oUTZ1a0swUmcvblp2WU9HblBtL0E5OXFoeWpIVXdXQ0Y2Tjdp?=
 =?utf-8?B?RTlpTC9Oemw5K29MMW9JSE1RQ3VrckQwS2VqaTl6ZU5KT2IrU1JKWE1vVTMv?=
 =?utf-8?B?b216RkNXUHlTMXNEOG5ncW9Xb2IvZzZsS0FURi9RekZPWkx4dytURlhnTUNY?=
 =?utf-8?B?TUNONWJwalFaQkVKdmJuZGkvUFJXNVFKQ21OTVJ3MFFXaUNsYUVvZVV1MTdv?=
 =?utf-8?B?MExsQ3hKQmdZczdqd2Y3aUNsN1grRzRVMDJPa2JZYjcrRUU2b2JCSjRZcGl6?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2393f9-e7e2-45ab-a713-08dd763b9e4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:20:59.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSwpPpd8fmsD9HD5+2qQCmdFwWty9zGxlElM+xiqCyOsjaSYZqKITiQbMdxhZdvvc9xFuGBLnd59cmDmUYaAS2SVKbsDDk8OQv7eVh/SHaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f47a06 cx=c_pps a=CSNy8/ODUcREoDexjutt+g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=IHY4GhH-AAAA:8 a=t7CeM3EgAAAA:8 a=erf4Il86T06Lm8AcbvEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5V7z7r4ZuTEA:10 a=YLSQhJjyMgTEWjMK2jEA:9 a=nQUN_6b3kSw1VxEy:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=D2-2_G0xO5IXdrd33UjC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VMWBzowI-qkz0u8oD5Mt8uYkmnCyNEiv
X-Proofpoint-GUID: VMWBzowI-qkz0u8oD5Mt8uYkmnCyNEiv
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214500

--------------y0U42RLo80NyDEhR1NHfN7Nb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 537N94Cl020202


On 4/8/25 03:21, Randy MacLeod wrote:
> On 2025-04-03 4:53 a.m., Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> * add function log_success_msg/log_failure_msg/log_warning_msg, some
>> packages still use these functions, like mariadb, refer [1], without
>> these function, with sysV init manager, mariadb will report error:
>>
>> root@qemux86-64:~# /etc/init.d/mysqld status
>> /etc/init.d/mysqld: line 383: log_success_msg: command not found
>>
>> * remove RCONFLICTS with lsbinitscripts, LSB support already remove in
>>    [2]
>>
>> [1]https://github.com/MariaDB/server/blob/main/support-files/mysql.ser=
ver.sh#L104
>> [2]https://git.openembedded.org/openembedded-core/commit/?id=3Dfb06435=
6af615d67d85b65942103bf943d84d290
>> [3]https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-=
generic/iniscrptfunc.html
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++=
++
>>   .../initscripts/initscripts_1.0.bb            |  1 -
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b=
/meta/recipes-core/initscripts/initscripts-1.0/functions
>> index 35aebd4a55..7fc19c808b 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/functions
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
>> @@ -92,3 +92,24 @@ passed() {
>>       echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
>>       return $rc
>>   }
>> +
>> +log_success_msg()
>> +{
>> +    echo -n $@
>> +    success
>> +    echo
>> +}
>> +
>> +log_failure_msg()
>> +{
>> +    echo -n $@
>> +    failure
>> +    echo
>> +}
>> +
>> +log_warning_msg()
>> +{
>> +    echo -n $@
>> +    warning
>> +    echo
>> +}
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/r=
ecipes-core/initscripts/initscripts_1.0.bb
>> index 98693fa66e..0bc078c5eb 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -54,7 +54,6 @@ RDEPENDS:${PN} =3D "initd-functions \
>>   # Recommend pn-functions so that it will be a preferred default prov=
ider for initd-functions
>>   RRECOMMENDS:${PN} =3D "${PN}-functions"
>>   RPROVIDES:${PN}-functions =3D "initd-functions"
>> -RCONFLICTS:${PN}-functions =3D "lsbinitscripts"
>
>
> Patch discussed in patch review and while this will likely get merged,
> since if your distro has these functions scripts, then your distro=20
> should have the log_* functions
> or you get an error as Changqing described above.
>
> By adding these simple initscript functions we'll have to carry them=20
> indefinitely
> since it'll never be clear if someone who doesn't have a recipe in the=20
> layer index
> is making use of them.
>
> In the last 3 or 4 years people have added conditional code to handle=20
> the non-redhat case:
>
> https://github.com/MariaDB/server/blame/main/support-files/mysql.server=
.sh#L93
>
>
> Changqing,
>
> Are there other recipes that need these log functions that you know of?
>
> Are there other functions missing?
>
Sorry,=C2=A0 I don't know if there are other recipes and function missing.

//Changqing

> ../Randy
>
>
>
>>   FILES:${PN}-functions =3D "${sysconfdir}/init.d/functions*"
>>   FILES:${PN}-sushell =3D "${base_sbindir}/sushell"
>>  =20
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#214308):https://lists.openembedded.org/g/openembed=
ded-core/message/214308
>> Mute This Topic:https://lists.openembedded.org/mt/112062232/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------y0U42RLo80NyDEhR1NHfN7Nb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/8/25 03:21, Randy MacLeod wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:70560a18-cf98-40e8-a71a-6d3f90905d44@windriver.com">
      
      <div class="moz-cite-prefix">On 2025-04-03 4:53 a.m., Changqing Li
        via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20250403085305.3667237-1-changqing.li@windriver.com">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

* add function log_success_msg/log_failure_msg/log_warning_msg, some
packages still use these functions, like mariadb, refer [1], without
these function, with sysV init manager, mariadb will report error:

root@qemux86-64:~# /etc/init.d/mysqld status
/etc/init.d/mysqld: line 383: log_success_msg: command not found

* remove RCONFLICTS with lsbinitscripts, LSB support already remove in
  [2]

[1] <a class="moz-txt-link-freetext" href="https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104" moz-do-not-send="true">https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104</a>
[2] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290</a>
[3] <a class="moz-txt-link-freetext" href="https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html" moz-do-not-send="true">https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
 .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 -
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 35aebd4a55..7fc19c808b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -92,3 +92,24 @@ passed() {
     echo -n -e &quot;${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}&quot;
     return $rc
 }
+
+log_success_msg()
+{
+    echo -n $@
+    success
+    echo
+}
+
+log_failure_msg()
+{
+    echo -n $@
+    failure
+    echo
+}
+
+log_warning_msg()
+{
+    echo -n $@
+    warning
+    echo
+}
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 98693fa66e..0bc078c5eb 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -54,7 +54,6 @@ RDEPENDS:${PN} = &quot;initd-functions \
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = &quot;${PN}-functions&quot;
 RPROVIDES:${PN}-functions = &quot;initd-functions&quot;
-RCONFLICTS:${PN}-functions = &quot;lsbinitscripts&quot;</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Patch discussed in patch review and while this will likely get
        merged,<br>
        since if your distro has these functions scripts, then your
        distro should have the log_* functions<br>
        or you get an error as Changqing described above.<br>
      </p>
      <p>By adding these simple initscript functions we'll have to carry
        them indefinitely<br>
        since it'll never be clear if someone who doesn't have a recipe
        in the layer index<br>
        is making use of them.<br>
      </p>
      <p>In the last 3 or 4 years people have added conditional code to
        handle the non-redhat case:<br>
      </p>
      <p>&nbsp;
        <a class="moz-txt-link-freetext" href="https://github.com/MariaDB/server/blame/main/support-files/mysql.server.sh#L93" moz-do-not-send="true">https://github.com/MariaDB/server/blame/main/support-files/mysql.server.sh#L93</a></p>
      <p><span class="ws-pre-wrap f5 wb-break-word text-mono prc-Text-Text-0ima0"><br>
        </span></p>
      <p>Changqing, <br>
      </p>
      <p>Are there other recipes that need these log functions that you
        know of?<br>
      </p>
      <p>Are there other functions missing?</p>
    </blockquote>
    <p>Sorry,&nbsp; I don't know if there are other recipes and function
      missing.<br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:70560a18-cf98-40e8-a71a-6d3f90905d44@windriver.com">
      <p>../Randy</p>
      <p><br>
      </p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:20250403085305.3667237-1-changqing.li@windriver.com">
        <pre class="moz-quote-pre" wrap=""> FILES:${PN}-functions = &quot;${sysconfdir}/init.d/functions*&quot;
 FILES:${PN}-sushell = &quot;${base_sbindir}/sushell&quot;
 
</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#214308): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/214308" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/message/214308</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112062232/3616765" moz-do-not-send="true">https://lists.openembedded.org/mt/112062232/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:openembedded-core+owner@lists.openembedded.org" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:randy.macleod@windriver.com" moz-do-not-send="true">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------y0U42RLo80NyDEhR1NHfN7Nb--

