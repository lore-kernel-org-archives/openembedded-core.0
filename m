Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AE1E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 03:40:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23808.1735875633358699044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 19:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=30984f2bf6=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5033Z25a007039
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 03:40:32 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0msr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 03:40:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xf3sdTLTF/0tCJfTlWRC87qA6+4wLPj1khsdEH05Qctq7oRoxM5RsE+Bic2USNA89F91ZfvFA+M8xeDxPfp5fHOqBWm+PeODOtBnc6ECobapV19u5khyIy7s3jF9ELe3T1cMXZVM0xzojGjqrN+PBzWiuUybAPKiZ9/HSDGE+Q0X26pICv4n23dPFRNi77U2DowGH0W/Y/gBewpqounG4kTvia3mXKXF9hQWBWdJOwhZfRNypEfoBudE8eppmGlAwiekIzK4Oq45Ia3A1SWySI+BGg5xR6taZlVIcQGmH5ejZ3j6Tz46fMqYEqwdpLAl4ONdysEmF0tmSGXLA8IZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex9K2YJnBq0+oVp3dgu1L0SpGkcn1ZUlmo81687B7+4=;
 b=FuuOHRtbrZ/GisPdqXcbJSv/KYXMQPhRdICWIvIDRVMTG8HLJoLXPjfv7gzSbffblP1ywR7nnHf2kqvJSOdO36aO5sU0FZeRpzhicQzBT7EPAgFdfepFYGnE6jX/tAAueZMzyEIkpxFW2LO4ooiOL5UorwhqXBUeROiZsaCM8oSAllSTkW4DccEGplARSi/nkp6czb5+xRJ1M9FnV5+vtFucYO9xHhK0yWPm9qo3yyayuwqcmla8AeD1F460/S7JrbHfFvt4tClnSQxyDSFnpPFO7LYdpG0Z9PLCWim/ZIsqmpCHU12onbfpJ6rXwvrAE7+AVXQA4o+katQ5leY5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 03:40:24 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8293.000; Fri, 3 Jan 2025
 03:40:24 +0000
Message-ID: <fba56623-2ad6-4456-a13b-3e100d6860fa@windriver.com>
Date: Fri, 3 Jan 2025 11:40:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/1] libx11-compose-data: Use
 CONFLICT_DISTRO_FEATURES to skip when x11
To: openembedded-core@lists.openembedded.org
References: <cover.1735023394.git.liezhi.yang@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <cover.1735023394.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d71dee3-a171-4168-a491-08dd2ba85b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dGVwSHFtUndFOWtPcTFhc2NQeUFCV3ZCMXVtSEgyU3o4U1FNQjFEZ3NNaFln?=
 =?utf-8?B?RWJDZjhzcWlyM2RZMFNkbG1VdklyWU1PMzVJcW9PQXgyL1hXdG5ZNStobUZv?=
 =?utf-8?B?ZHRJVjlndkJrazZ0bURRRmZMZ0JweWVWZGJ5WW5udmJrU3c1ampGMnJpbjZL?=
 =?utf-8?B?cmhnYjkvV1ZhQi91VXZabmo0VXNWcU1Mb3NuRWI0YkpRd3kzRmdRdCszSVV2?=
 =?utf-8?B?N3RTZGVDclIzdDlka2oyODRwdzIzdmhaenZMUWs2dnlsTTdmT3BDQzB5YUZD?=
 =?utf-8?B?d3gvN0FMK2NyVVNHZDY3ZmFmcnQvNXdZQTVLWTNSaDRINHBVVkNWc0NCalNY?=
 =?utf-8?B?dTBxR1dzSkNqbmZHZnZUS0NEZUsyNDVLd0dQWE0xYlcxVVMxa08xeE82d1dl?=
 =?utf-8?B?bU04QWI2akFjTENLbWZWcEhmY21OdVA2N3oycHNqc25uN3Z6YWNQS2EzUUsx?=
 =?utf-8?B?WjlQancvbG84cWw2MTR1amptWG9VM3Y3dTVLa2dvQ3MzdGh4Z1VKVzJPaGVi?=
 =?utf-8?B?T2plWnhFVFVGcjJYR25pOGhJRUZBRFNIRmhRQlFFeTdGRmtzaDZwbTJndWU0?=
 =?utf-8?B?dk9pay9nRE9XcmNHbWVDWVpHbXJBdXlPMnZBTEpDekdpZmE2ek1OZ2lTRmw3?=
 =?utf-8?B?OUdPSjVXUzNEM09qZWNPTWZ4aXdDN0NCV2Z3RVZnWW94UGxvaHd0WjRucXcv?=
 =?utf-8?B?bVkyRkJMRTJYc25PN1Q1Y0RHcGZEWnBmbWhCMldLVUJyV0VINmVPTjZpNm53?=
 =?utf-8?B?N1pxYXhVNVI0VkVZajYvc203Z3dhWmZ5QmNwUjg5cXY0a0VWbjMxTnpYZFN4?=
 =?utf-8?B?SHZ6dHJDTlB1VnNDL3RjZjF0RmdSbDcxMjZDdGRqdG9qbXA4MU1VUHYxRHBa?=
 =?utf-8?B?d0VpT2N0VGQzSWpIOUhJNWtra2NYcFgzbDB1anRDQmtGUk0vdFhYWkdpVXU1?=
 =?utf-8?B?V3FlOUNkdGFYeEhnblVhVWh6N3FwWGFCZ254TGt1TjdqU3I2VEsremVwemtx?=
 =?utf-8?B?ZzhiN3VBT3Q1SGhWamxpY0hQNFplWVFWTUpISWRmZXQ4QU0xbmJVSUg0TWlz?=
 =?utf-8?B?RVFmTzduc0lKemhySTNlV3IxaGUySHRkSU5VUW5XZC95NTVXWEg4bWJSa1BY?=
 =?utf-8?B?MVhRTEZXZXBqZEsxVFBaTnhEcUh4UnV4dVZCSXRtUHJMRjJjbE5oam42aWJ2?=
 =?utf-8?B?RGp4TVJSeWhsRk5TSDFGSkNTOUJRN1dlYmVDZDd4Qm1rZmUyeFFKYlZ4cUN1?=
 =?utf-8?B?SlRibVE2SVFwYWEyekhUNW9tc2pteGxCRC9idlNHVEFLd1ZmRDE4Ri91aTgz?=
 =?utf-8?B?YmRaOExBcnVtNmRycFZCeWx2emFoZEQ4by9hYXB0TnlJcnN1Wk9wQm5pQkNy?=
 =?utf-8?B?L3FrSkFkdmRzYmJ0WFJzWWF3dHZ4VEZjb1Y2RnZIUTkxTU9YRGhHQkNhTGhp?=
 =?utf-8?B?UVVYbEs3SjZCYi80aExtWWxjYi85bmpvazF4Nmh3aXJrNmVWbHZ0WEx1eVpu?=
 =?utf-8?B?dDF3Q0dvSGZ4bXNtUEtNRmhLWVlhWGV6Zm5BZ2dadXpSTFU0SE8yWnZsS0gv?=
 =?utf-8?B?QTBFbnU5ZjMwanRiYk9KdUlKZ2ZIdlJTN1ZYQVRDcFl2VmtGZHdHNlJmcDlM?=
 =?utf-8?B?REhmRHZVY0ExTUFFMm1nTy91UFBwRU9Zdm93SFhtbmM0WklWSlluNnRxbEFG?=
 =?utf-8?B?RVlTM1JXV041NU0vek45ZktZalcrNlFqdVE1Qm1xajZkQU5MT1daM1BoQWVF?=
 =?utf-8?B?ald2UWdkZTE0eXMyb2JaNHMwazlzaE1TUVJYT0NTaUpPQURVRXVUR0I2VUhD?=
 =?utf-8?B?OFZMbWpTYWJTbWhUUG9CaU9qdm5zWEVwcFo1ZFRlZmx5YkJZVlhCcm5ZL0Vr?=
 =?utf-8?B?VUE0N0xTcmVsMC96VVJVNWYwRHB2cFJaNFpPTlF4bGRNOXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NURnNk9UQ1luZWVmeWYwOXhmc3NuZnNnWUt2a1dMOFVUNGRoZnZ3bjd0NUVv?=
 =?utf-8?B?UUhUVU9pTk9Kb0gzRFdEd3F2TUlYcW5GZ0pvZkxjN3Jvd0Q5UWhDdGgrVFlM?=
 =?utf-8?B?cjRLQTV5akpad0lXT0ZmTkVUd0NORW1yNjc1MExUbE5WNGUyUS9CeEZXMFFE?=
 =?utf-8?B?aHg4YmR5NTdITlplVTl6VHNmWTAwL0FoT1ZkUHRYWDc5QTRBRzU1M0lZSHdQ?=
 =?utf-8?B?QmFnWDQ1OFUvN0pleFhTck5sZUloUE9HNE1IRnNOazM0eFpwQkdxa3E1RVpi?=
 =?utf-8?B?VkMvTGFHV1p6THNYbGtuN0c3cnI3OVZtY0NSWkhHM3Z5QlI5NzNpZ2g1V0l3?=
 =?utf-8?B?U3NXdW4vZTJLR0FlUG55cHlqQmZQTlRRRWcwWW9VK0xPMUxhOXNVazVPbzJj?=
 =?utf-8?B?RXhueHAwY0MwODROb0prWkxWQTJGOHFLZG9kMUxTYXNuY1dKdTAwUDdRNU5Y?=
 =?utf-8?B?QnNGMXdMekVBK3lLL2NBWDFqZEdrbnJqWmJEbGdiSWJ4Ynl6aFJwSTR3WUQ5?=
 =?utf-8?B?ME43UFlqVEcrTTBXcWRCRm5RblRkOWxqdjdxWG55a25QM05WemlkdHVaNGxE?=
 =?utf-8?B?ZEk4d1lyVVpoa3cyczlCL3k5WGtLYXNucEwzQ091TXd0OGE3eTVqa1pNVVd5?=
 =?utf-8?B?UnY0a1Fld29leXRqaHAxMFlGNGhrRFZTSVIzODZOOFdVTHlJQlA3UUcwN2J1?=
 =?utf-8?B?bzRlV21VZjlsUTFzU0FOMitDblJUY3dHWFRRL0xIaUtoeC9LR3F5SCtEUTN0?=
 =?utf-8?B?cUxxbG0rTVdoV3VyczlsZHV2NVV4TVNYdkR4NWR3SGJrWisxUTdrS3VYd0o0?=
 =?utf-8?B?cjJGV1QvQjg2cnM5Nndpcyt5L1BsaHhFRUdZMzgvbVJIUS95SktiMURpbkdR?=
 =?utf-8?B?NE1iSHRkNDE4YWY0Sk10ekVwdUZ2dVBoZ3hvTmNYVU4xOGt3KzFTT2hQR3Zt?=
 =?utf-8?B?NXJiNjhYTzR2cUtjRC9IUFNNUW9JV0phNkRTYnc4b295NHNOTUhlZEJ3bENl?=
 =?utf-8?B?MjBOalp3RTdDWGJzRWNhWVFPTVRhV3ZDeHFqT1NwbkptTi8wVHFWV1dhSkhC?=
 =?utf-8?B?NldDOCtNUTdZTFJNd2lNekFKSXF5anJaZ245bHZoa051SmlHQUcxZHpWdTlB?=
 =?utf-8?B?YUFZWm9ON21HNXUxTGpkWlJ0TW56WFY2Wmk1MGhYWkJEMWdLbXRXOWE1OWFP?=
 =?utf-8?B?MnFjOFNoYkF5OG5paVNqTlBjL3dPWXdyMzQrL2xNY3VtWWw3SGhoSTZpZitz?=
 =?utf-8?B?c1A3M0taTmE3VWdvK1lZZitJdS93QVd5dFI0ZWdGaFgxSWV5SDViZ1BCc2Q4?=
 =?utf-8?B?S2RuU0RET25HaEtWNncyUGs1VDFDQXp2QkdpQWdnaHQzSitjNUFSMWV6dHZE?=
 =?utf-8?B?K2lLRDdCUm5DTXNzdC9uM0IyREg5ZnN5c2xOSmhCcktTNmJsVEV6N3FhQlBN?=
 =?utf-8?B?ZVZTNERWRTNmRW5qVkxLNkZSWWlVaTZjdXI1MFNvRmZTMHRodU9lMlJtTUpM?=
 =?utf-8?B?cjllVnJ2SUJLVi84QTBlb29TV1d2ZmRtMG9YRFZXNk96NU9KMWlDYjd1a1d2?=
 =?utf-8?B?dXJaN3ZoSjhlZHVyQVJrdThCWUZ3UFVDNHVhSVpCbGxPSnloZVIxcWxuQVZJ?=
 =?utf-8?B?LytRaEFMblpYRTR4bWRmVkEzSElIc0xtSi9FMnd5aWFlbWUrVEtCK3pFd29T?=
 =?utf-8?B?U1Q4aFBqajc4YTF4aEg5ZWorSHNrcVp6cUtOR2Nqejl0Wm8yVzBmNm5UZDZX?=
 =?utf-8?B?SGlXdUJMZm9lSGdrVGovZjV2dGVkakVtV1ZUY3J2VENwdkdBekxZT01ubndU?=
 =?utf-8?B?aEVEVG1SSE1wQ1pmRitqMmFjY0Q5M3prKzl5NGdXUFVubkJmVUJZNjQwWTRn?=
 =?utf-8?B?NUdDeVIya2YvN0tmdm9IVThYRmxtQUxjbEMrNGhyODlMR2FtdXRaYjVqbjFH?=
 =?utf-8?B?aXJ5bXpqdDg3dU4yUjhySmpWaUFHMEtadDVXKzJjYjQzUGMrampEc05nTDBa?=
 =?utf-8?B?TWR6YnloSnl3aVlJbE9LM09uMVhrOHVNdSsrck1WS09KTm9hd3ROWXVIMk1W?=
 =?utf-8?B?VTJ5T3I4NzI4NUZyTS9zWGl6TXArYnN2NklpNEJoSUJ3SlZFTFU0OGV2UDVX?=
 =?utf-8?B?SEtLYXV0d0pCUTdBdmh0YlBJZzhpZExSc3h6aXA4MXY3QnNzUzl2eExNc1gr?=
 =?utf-8?B?c3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d71dee3-a171-4168-a491-08dd2ba85b0c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 03:40:23.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJPJpGSwPBobqygABNbpoCPSew+H2zKgxn6H4OZQgAiiCKRRtGln7owB6X+oHbXP7UunVIvhoFT5tbDcNeKwOfZu5XuJ41Xun1d1dt6ZydQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=67775c30 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=uUhNFPakAI9FsCNHz7gA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _GRaEEBxBwo5n1OKm1wcVm4ezMR8Esxz
X-Proofpoint-GUID: _GRaEEBxBwo5n1OKm1wcVm4ezMR8Esxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501030029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 03:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209316

ping.

// Robert

On 12/24/24 14:58, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> The following changes since commit 1a2afcd0773c5ec5946d1dfc27bde585c52a5724:
> 
>    base/features_check: Make PARSE_ALL_RECIPES and SOURCE_MIRROR_FETCH boolean (2024-12-23 11:41:13 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/robertlinux/yocto rbt/x11
>    https://github.com/robertlinux/yocto/tree/rbt/x11
> 
> Robert Yang (1):
>    libx11-compose-data: Use CONFLICT_DISTRO_FEATURES to skip when x11
> 
>   meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209058): https://lists.openembedded.org/g/openembedded-core/message/209058
> Mute This Topic: https://lists.openembedded.org/mt/110269162/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

