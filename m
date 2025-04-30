Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8525C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 09:04:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12512.1746003864007219156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 02:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7215f10e62=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4oW0C032126
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:04:23 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uggjc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nxwh+kGy+H1h2RHnm2dXr11bjEBfhpGEhcdJdti3MhvuYpZ3GZfef3ei1qLQNCbep2c0YTpAZj0s75Eq2xFRJDkYnjwmanjEE9rukLiwnkDvDe2wCZBgrvpMseOCB/a97ZQJD+j6KpjUnaa3FXmAxLAeWKxNkjgto1uDrFn0iqZOouBQQMjqyk1Ex2XOi/slBFigWdI63RrxuTRejSEYMZT/MBxhCfdsn1aqTVj5Yox6IuHptg7I/jMNciTrIpcgooW73u+TnO2zGyYPEwQccVJkCXpraOnZKWZ1X0isMS8Q8o3NxATY9Gufp5TMUhBwAOGpOjSBpGEsnLyP/yWwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyVwE6apYZE6dZu4i6qXQqXjn47xCLX3szIU/QCBI+I=;
 b=KMIe1LnVX8vgToMzernnfEO+/L5w115Lbzdr0jIZEkigBYWKk3OZ/7hR3Pt5ZZrfcg4o80zv40bizYhZtY3Dv6JvZ/jwPB09B7t8RFweK1rkLOtKn7qM95s1SlhdtV67FB/FDXArv/VhPeXkjbgaE0dlEuvLTA9wHcCTNHjPJgZo36hyZyarKTRg9l7tcIbVefnEs6qSBmcMLecE1lKoNXj6qv6FPF4LVWZE/tMLX+S38GE45DMBi8eHhdZDKSDm4+ZbGbV8QyheDfGDHTx2JzhqoWXemZsDyF5Lli1R6ykZx7GpQIjo6gIZ5UMuoKZ4RlE41CalmVrZjo0E5TfcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 09:04:20 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:04:20 +0000
Message-ID: <4258e1b0-195b-4550-a020-87d40ea03f06@windriver.com>
Date: Wed, 30 Apr 2025 14:30:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][scarthgap][PATCH 1/1] xserver-xorg: fix
 CVE-2022-49737
Content-Language: en-GB
To: openembedded-core@lists.openembedded.org
References: <1834A1B89737CFD0.7383@lists.openembedded.org>
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <1834A1B89737CFD0.7383@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|IA1PR11MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: d6487ac6-d674-4ee4-b95c-08dd87c5fe66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFRFdlpTR2xrMFA2QTdqN0duMFR5OENqd2N4Zm5YYU91czNVWitHdkVwb2ds?=
 =?utf-8?B?bGxvSGYrc21wLzhLU0Jpa0l5b0h4TVhwL0dLNWg5TWtMTGxQV1UwT3ovWmZl?=
 =?utf-8?B?cEVJVkxiRHBSWEhqTUg4dENyYXZDL1NORkI3UlIreEhpeWNXNERBalFseHlF?=
 =?utf-8?B?ekVpR2hmOEk3YVZBUjJUelFhNXcySC80RExXZTQ3QjZQOVdSTXhoUG5Hb21y?=
 =?utf-8?B?cWNFSzk0ZTFTYUFPUXVGbTRSQmErS1NFclVHSWJsdjdESm40dUROQjZhSUw1?=
 =?utf-8?B?YWkrVzMvWTdsaUNlTHRkUDk5N0l6TldiY2lUWVJoWDJrL015QVZlR2l4RGNh?=
 =?utf-8?B?WU05OEVJY3FRTkpoTFZUS2l1UXB5NlY0WjFBT1pDUTFTZkZnTFM1TVA2TG53?=
 =?utf-8?B?SFhwYk1HeWRlc3VCSUI4U0FrSVkveHB1MmE3N2N2NEZLbS85SnoySGczZVNm?=
 =?utf-8?B?bU1sYVVHa0c1WUFqNWZwdFdrL01ucGRSeFR3cm1kWWVSWVFPMmF3K3pQU09y?=
 =?utf-8?B?UXJNL25SZklyMktETlA0QlZDc1ZHWUNlT045OURVZ3pmR3kzMWRLMjkzdnVP?=
 =?utf-8?B?eDM4TlppcmJoYUVBSFZlOEo3MXlvSjRaeUY4Mnc3dG1GUGQxM1NCS09tc09u?=
 =?utf-8?B?bkNLTlZEY2paSktxYVh4TzRtYXBYR2hzSUtnSkpmTzFSSGVPa2svQTRnVWJ4?=
 =?utf-8?B?QjJ1c0RIMVZsMS9UYzhaT3k1MjNQK2hxL2Q0dWlHZnhUZm1YRHpBajFtUzBh?=
 =?utf-8?B?a0syaVJMK1dkYmJZMDhDdmZRaTVpOTdLYUY2RWVMVkJycVp1YUpTeVdrWVNl?=
 =?utf-8?B?NDYxbitXblh1ZDd6bHp0dHNROWdrcEpLMldmcnBpNWhYU3ZHSnM3TDFJQUJw?=
 =?utf-8?B?MHduelVhTlo1S3pzRGFvTldQWlFwWVdvS2NCNVdsVEN3OUNyRmgrTFNIcW9X?=
 =?utf-8?B?dTVJNzJhVWhId0ZDVmpoanpNTk1BRWovbm9zejR2d2JyRGh4Zk5BZ0FZekJG?=
 =?utf-8?B?VVNHRUJzMmw1c0NZcVJibTE5V3pCNE5oSnRqTWFKTDZWbWJMbDRIVERTcVVk?=
 =?utf-8?B?YzN6UVVsNGtGam5rZmxqMWQxTFFXL2xkUGtEMjQ2dmxnMExYZUdJeUlXM1I4?=
 =?utf-8?B?RGE5dmk5MmpQRHRDdTJlaVVBWHg4clkrMklqdC9mSjk4LzNUd3dPM0NhMk5O?=
 =?utf-8?B?TGlRR3ZCQzRTVlMvMDBEK1JleHh1dkJncTBGNXVVWXlvWWlaSVlTNThxNnpV?=
 =?utf-8?B?SWgyVXJiaXRRVGoxUlBrS1ZLWDBhZ214czZvaUU1azJwYXRwWlNyNkZBY0xN?=
 =?utf-8?B?eW1QVlFONzZXbHRzSmsxVU1kRTJzWVJxUFFkUGpBNXR5eDdzL0hKZWZkTkNy?=
 =?utf-8?B?R1V0Y0dZdXh1bHhTZlkzTDZtRGdqSllaZmRHbEx4UWUrR2hTUE5FSEszVmZ4?=
 =?utf-8?B?TkFRcUVqbVF3OGp3TTM1Yi9MU1BDbXlhSCsveTRlbWthZU5EU2F3MVJNZHFw?=
 =?utf-8?B?clQ2WVdFUjFtNEw4d3loR1NJNHljQURQaTQ2SkZON3FTOG9LckVqeDhzRUxj?=
 =?utf-8?B?Zmc2VVNSYmdsSE9ZL2R3cjI5SXVvZGpYb3BZOXBpdFNlQ3ZyaWlCV3pGVHJK?=
 =?utf-8?B?c3R4bGw3TTh1Z0g1RjJTNVZSLzNvUWE0TnR3WjcrZkdVbFQ1b0JhZ2ZqdVg2?=
 =?utf-8?B?REd0MlBsUlMrRGRLQVczUEN6K2wram5zMVR1S1ZyYTllRDliNDg3WFNzc1di?=
 =?utf-8?B?SEprem4zNmJzNmhnQXJ2TmVRdmVWODU0NHgrYnk5aHB0WmlYZGJGdnV4QjNT?=
 =?utf-8?B?a0JRNGpKN01MUENaMnFWMEhwOVVKclEwZG5HYTdNUy82WjFrL0NIZzZ5K2Zw?=
 =?utf-8?Q?9Anh1mj+4Y0O4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bS9EN0lIaE9MQ0tmVUlZcjdvQ2N4dVJNSkUySXRSQ1BrOG1pRnFOVjlBSGF1?=
 =?utf-8?B?dFNUcWxOYWhQL2dsRm50WlFQdGNlUmZScDFhelZTbSs1d1BTbm9wSGVvQUJq?=
 =?utf-8?B?NVgzTTlaamlPeUlpb0RFaVRHbkpUeFVZL092cHpEMXlVSE5GV1dYbitBZG85?=
 =?utf-8?B?Tis2dWdFSmQyS09pbUY3eUMyYWJSTHpQcTg1b2QvTWRGVW00M2NGM2tBQWpi?=
 =?utf-8?B?QUE0OU5qWk5FYzQ4V2Y3ZDFjOWVRaGVCMFZhYlhVa1JsdjY0alNMQkZEVjFJ?=
 =?utf-8?B?NGpEU01ldGFuQW91NXByUUEyejNBUENieFpoaWptY2VPYVdkRTNySlNSbzhE?=
 =?utf-8?B?cmtqdTc4cDhzRWUyUytZSEx1VzhmQVVnbTZBb2RUTXlBUENhLy8yZjFDTk04?=
 =?utf-8?B?eW90czU2NHR4U2FkVFlzcWh6SUJUSy8xSk51dlpFUzZEc0ZXWFZjOUhZMHBB?=
 =?utf-8?B?L3ZBNkJvSWI2WStOVDlyb095UmIyTUFBZENZRnJ6ZmV4VCtOQU43Y1JoZ2ZL?=
 =?utf-8?B?aGQ0UFdneDJacXpzbWgwaFdsWXFPZDQ0d21EZENKUGtaeUNYUDB4bWVxYm1o?=
 =?utf-8?B?OWh4cFJKbHJ4THBEMXh6dE91aC9rWktWdUx4Y0xmVEZLWU5tZDJqTlZtOS81?=
 =?utf-8?B?ZWVmeE5sZnpoTUptWXdnVDhHLzZsaGovWENFK3JHaXd6VFN0UWszVStwNlcv?=
 =?utf-8?B?dWJkVDhEY1FHb3lFa2VlQU04TTJ1UDJKRVNKM1dRa1ZCLzJLZVRBUnFmVXBG?=
 =?utf-8?B?R0czSnR3KzRRQUljU25YbVNZMjNlNFVyNVVmVHFJL1VqSnFBYmQvUTJjRkxq?=
 =?utf-8?B?Vmg5Y2xFdHozUkZQNWF0RENHMER0UThVQ1RkRUdsL0NYNmQ2dTNzTDRSUGVu?=
 =?utf-8?B?Uk4vZkV4bi9FVHR4Tlkzek42V1RCdFdQR3lMaW1zekxtUlFpT3FmaVFhQWZM?=
 =?utf-8?B?MEIxaXhQSjFGNWVYUHVLamlKblVOeXZFakxUQkZCamVBNnFOUHBWNTd5Q0g5?=
 =?utf-8?B?M2toR2JVZlZQSGtLRGhHSXA0NnBFd05pMEhjdTBIZUtQV3JBRUJEK3dSR3Fq?=
 =?utf-8?B?UFBWZzlzWHVjTDZoT2Q3aW11MWVKaGNsbjhiVmxkRmZ6cXlMK0dxMEY4ZmdP?=
 =?utf-8?B?SXdNcjJWbzNwNldkUGJjRDBsZm1KU3NTekpPU2pyNklvVjRpSlhRVzhJRFd4?=
 =?utf-8?B?SUh2OERTa01oN2QxdjBLeHJrOXM2QXZDVjkwd0Z6K05jTzhmQzBxRTRLV1cx?=
 =?utf-8?B?MXFGQXZ1R1VJOHNnTEsxNVBDYVlqMVkrMG91dFd0UldBdnRFckExWnA0L1V6?=
 =?utf-8?B?N2Y0M01DOFdlZWIvVmxCWlcyZUVjcjBIUyswdno0blJIejQxT3l0NUpUZGhY?=
 =?utf-8?B?T3NwNC9hcnFpQXo3ZURZSTdGemNrMUNTSmRLTXhtV3REZHhUNWE4MGdGMm95?=
 =?utf-8?B?Y285bitVS3FNeGRzTm1jRDVqSmY0Um4xRE9sZUc2b2tnbFllbDhCRVdBYnZ1?=
 =?utf-8?B?dmNvTkhGbDdGR2FveGVsVlIwbG5ZQzVibVlJY3lhbWhkbkc3Q0lGNFFyaElv?=
 =?utf-8?B?WG5JVklNSG0xQnJjeUJUa1pMV1JtRFdYL0UwVzc1SHozeWdCM1hHb0x1VGtO?=
 =?utf-8?B?bFVieWxWaFNRR1ExM2dPaFRZZ0VKWWJaSWNiMG5XS093QVNSaUtxZjFDY0Q2?=
 =?utf-8?B?bkwzU0ttUmRDc1g2VXhuRnMvL09SMnNCMTRZeUM1d3ZONkw2ZFNEbjNFOEh2?=
 =?utf-8?B?Vkc0bUM5QjBObjlBVml1VnhXZjJlcmZTMlJsMUFKUjgwcG1ubFl4Vmw5UTBV?=
 =?utf-8?B?S29NZzFGckRxSXg0dnZFc281TDZ3V3R4YmxxZmlwYkRhODNPSzhLLzZrY2lZ?=
 =?utf-8?B?bGZQRW5QSG1HbGxoY3E5cnA4WGZxM3E1OTVXL2c5OWh0bXZQeExta1pPOS91?=
 =?utf-8?B?ZGNxckFjNE9nd1EybmtSNmVBMC9sYWp3ZjRnbEEwL3dYTndnbnF4VXR3YzRk?=
 =?utf-8?B?SWx4SkNOK0RCR1hIWlFrL2dTcW1UNnlHQTJURE84cldPU2h5QThPMDNjQWRl?=
 =?utf-8?B?aUtnYUkyUzJPa2M4R1J1a2x3a0J2ZHNhYzJJOFBmY1R2OURJb3B5VldLVkk4?=
 =?utf-8?B?Q3VXNWRybG1sTkMzUnovRS93YkFHS200Zng5QmpGZ1IvSGVHeFZXc1ROcnlJ?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6487ac6-d674-4ee4-b95c-08dd87c5fe66
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:04:20.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nw/vhSbddssJ89icOkwNj5zIGstIUBpE61aRaofAoiYBXHY5HAqDKzMAx+4LKqwDea6ZztCWE1JLaeSfidJc77EDrbpldriqQXUz34t90Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2MyBTYWx0ZWRfX+/Ns+EWnTkr/ 3BlVu72ki4X1RvfcQgVtw7hMCoLdKVHYpuZKVUqJORScSmsAO6XLQ+HClD/RnxBPr02bmDD9GFT VG37kzEqD8QQntrRnOPnYXe9QKWx0U240Ed3cJCfYLuxmqOC4LxgzWFjjS1jyL/zapzvPap4+JF
 Iq2vYAd0isifvcEOUos5WTVqS46GiCvnH3kwmZHdzlxovzRJBSJo6V7P/kQ2TJaEPYzQtXk6yIi HAWxsKuQyVQoNzoOiui6G+DTohEMeAcX+9WBcH2JPVAxBgODSYb8KA8/Yk5scIsM7wsXBOrrbCR EEY2/DjI8NmDgM2rm6/p8U99tuCNQHyAG3rbKZP26JePKZVCfbk8Eeg8+ik4LcVk57jUIqBpEX4
 ZJ4BpBrznqRvl5uoWBZyq8g6pJtVPlBVcMIufbA1JinNZSZK0zxP5mPgMkOwi0W9CIHqQ98S
X-Proofpoint-GUID: Q4f5PYTzk_GyY5ADCOU39KOFPOLoE6mU
X-Authority-Analysis: v=2.4 cv=MKNgmNZl c=1 sm=1 tr=0 ts=6811e797 cx=c_pps a=CSNy8/ODUcREoDexjutt+g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aR16PxjQAAAA:8 a=pGLkceISAAAA:8 a=hh8PzdnGHEKhSft7l5IA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-ORIG-GUID: Q4f5PYTzk_GyY5ADCOU39KOFPOLoE6mU
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215733

Gentel Reminder!


On 09-04-2025 16:35, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> In X.Org X server 20.11 through 21.1.16, when a client application
> uses easystroke for mouse gestures, the main thread modifies various
> data structures used by the input thread without acquiring a lock,
> aka a race condition. In particular, AttachDevice in dix/devices.c
> does not acquire an input lock.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-49737
>
> Upstream patch:
> https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   .../xserver-xorg/CVE-2022-49737.patch         | 90 +++++++++++++++++++
>   .../xorg-xserver/xserver-xorg_21.1.16.bb      |  1 +
>   2 files changed, 91 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
> new file mode 100644
> index 0000000000..765625d333
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-49737.patch
> @@ -0,0 +1,90 @@
> +From dc7cb45482cea6ccec22d117ca0b489500b4d0a0 Mon Sep 17 00:00:00 2001
> +From: tholin <thomas.lindroth@gmail.com>
> +Date: Tue, 4 Jan 2022 12:08:11 +0000
> +Subject: [PATCH] dix: Hold input lock for AttachDevice()
> +
> +Fix the following race:
> +
> +Possible data race during read of size 8 at 0xA112510 by thread #6
> +Locks held: 1, at address 0x366B40
> +   at 0x14C8B9: GetMaster (devices.c:2691)
> +   by 0x15CFC5: IsFloating (events.c:346)
> +   by 0x2B9554: miPointerGetScreen (mipointer.c:527)
> +   by 0x1A5136: xf86PostButtonEventM (xf86Xinput.c:1379)
> +   by 0x1A52BD: xf86PostButtonEvent (xf86Xinput.c:1345)
> +   by 0x485F45B: EvdevProcessEvent (in /usr/lib64/xorg/modules/input/evdev_drv.so)
> +   by 0x485FDAC: EvdevReadInput (in /usr/lib64/xorg/modules/input/evdev_drv.so)
> +   by 0x195427: xf86ReadInput (xf86Events.c:247)
> +   by 0x2CC113: InputReady (inputthread.c:180)
> +   by 0x2CE4EA: ospoll_wait (ospoll.c:657)
> +   by 0x2CC077: InputThreadDoWork (inputthread.c:369)
> +   by 0x484A336: mythread_wrapper (hg_intercepts.c:406)
> +
> +This conflicts with a previous write of size 8 by thread #1
> +Locks held: none
> +   at 0x14D2C6: AttachDevice (devices.c:2609)
> +   by 0x15CF85: ReattachToOldMaster (events.c:1457)
> +   by 0x1647DD: DeactivateKeyboardGrab (events.c:1700)
> +   by 0x25D7F1: ProcXIUngrabDevice (xigrabdev.c:169)
> +   by 0x2552AD: ProcIDispatch (extinit.c:398)
> +   by 0x155291: Dispatch (dispatch.c:479)
> +   by 0x158CBA: dix_main (main.c:276)
> +   by 0x143A3D: main (stubmain.c:34)
> + Address 0xa112510 is 336 bytes inside a block of size 904 alloc'd
> +   at 0x4846571: calloc (vg_replace_malloc.c:1328)
> +   by 0x14A0B3: AddInputDevice (devices.c:260)
> +   by 0x1A31A0: xf86ActivateDevice (xf86Xinput.c:365)
> +   by 0x1A4549: xf86NewInputDevice (xf86Xinput.c:948)
> +   by 0x1A4B44: NewInputDeviceRequest (xf86Xinput.c:1090)
> +   by 0x1B81FE: device_added (udev.c:282)
> +   by 0x1B8516: config_udev_init (udev.c:439)
> +   by 0x1B7091: config_init (config.c:50)
> +   by 0x197970: InitInput (xf86Init.c:814)
> +   by 0x158C6B: dix_main (main.c:250)
> +   by 0x143A3D: main (stubmain.c:34)
> + Block was alloc'd by thread #1
> +
> +The steps to trigger the race are:
> +1. Main thread does cleanup at mipointer.c:360 setting the slave device's
> +   miPointerPtr to null.
> +2. Input thread use MIPOINTER in mipointer.c and get the slave's
> +   miPointerPtr = null.
> +3. Main thread updates dev->master at devices.c:2609.
> +4. MIPOINTER would now return the master's miPointerPtr but the input
> +   thread already got the slave's miPointerPtr in step 2 and segfaults by
> +   null ptr deref.
> +
> +Closes: #1260
> +Signed-off-by: Thomas Lindroth <thomas.lindroth@gmail.com>
> +
> +CVE: CVE-2022-49737
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/dc7cb45482cea6ccec22d117ca0b489500b4d0a0]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + dix/devices.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/dix/devices.c b/dix/devices.c
> +index 77bac49..5f6d32e 100644
> +--- a/dix/devices.c
> ++++ b/dix/devices.c
> +@@ -2672,6 +2672,8 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
> +     if (IsFloating(dev) && !master && dev->enabled)
> +         return Success;
> +
> ++    input_lock();
> ++
> +     /* free the existing sprite. */
> +     if (IsFloating(dev) && dev->spriteInfo->paired == dev) {
> +         screen = miPointerGetScreen(dev);
> +@@ -2715,6 +2717,7 @@ AttachDevice(ClientPtr client, DeviceIntPtr dev, DeviceIntPtr master)
> +         RecalculateMasterButtons(master);
> +     }
> +
> ++    input_unlock();
> +     /* XXX: in theory, the MD should change back to its old, original
> +      * classes when the last SD is detached. Thanks to the XTEST devices,
> +      * we'll always have an SD attached until the MD is removed.
> +--
> +2.40.0
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> index 38c81f2372..d7ed16c8ec 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> @@ -2,6 +2,7 @@ require xserver-xorg.inc
>
>   SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>              file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> +           file://CVE-2022-49737.patch \
>              "
>   SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
>
> --
> 2.40.0
>
> pLK@tY:ATbOf1"dW
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214587): https://lists.openembedded.org/g/openembedded-core/message/214587
> Mute This Topic: https://lists.openembedded.org/mt/112169932/7312273
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

