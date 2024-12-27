Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2C6E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 07:23:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9254.1735284208995740639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 23:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2091eecf1c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6s6P3003508
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 07:23:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0wbju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 07:23:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZjvaZ0qxasJhJ0slKpOkI3+gne9spBgGvVSQtw9DJA/rKNWwUxlEF9f600iTNq4Xjf4364uk9+HJANzZvg+C96NgPEQNgVQ5y0slGyQtD1EtoVbIlgrG26KkTrM8xOMD7DV6GMj9M7C5QYcvoOWX+UYAWK6690hWKqv4E5rEnMSi+bfmyILLU7dv2rDRo14KD8iYfPfXUb2oKHz9eiKxZKmHA2QeNYiDer31B4vrKyxot8paByWgHe7QhHJSFYJCQJ/5XuyTDStY7p2Hh6hAhYY4DCe3i3xnLUNQpb2jkzIia5N2uDvznS2jBo77lnGYccm86rbxpPjcQgb8z+tQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC4waAMYR8nKBsHHa1+b27okusGKsn9QtyEuhUsTwrw=;
 b=nsrGv2I/cpUKA3tSSQMpg2Q5P6jbZEAQzXUrr6r5Ovw0isZSfur/SakqS4EnbShIiHeHBJs28vT0r0VhmY+CfBB9jeHBqXVguAr0kUBGb+P+J9pYnzBI0zIc1fNn+b5Pty+XY+Nq2BjT/sIN+kv6qkXjBtioTiPgNjg/P49/ntc9PpXDThl92i6KBvCE2u7XohaFQ7Q7/OjWMZUO8lHu8BcS2CFTv/FxOboE6/A38sO4NlaTRW5PCyGsISt9JvxYRronXzU2767xjeZwA087D7CkNdq1h/SCZ0ODl6gdber/WM2M6HbuUYdeOWOYMLKNHBforOBThJHt9i8jNdSUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Fri, 27 Dec
 2024 07:23:19 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%6]) with mapi id 15.20.8272.013; Fri, 27 Dec 2024
 07:23:19 +0000
Content-Type: multipart/alternative;
 boundary="------------eFnmI5bsHUVNMFCTh6SlsPqP"
Message-ID: <5b4b789a-62df-42d7-9e93-1584d15133e4@windriver.com>
Date: Fri, 27 Dec 2024 15:23:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] rust: Fix for duplicate libstd.so
To: openembedded-core@lists.openembedded.org
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
 <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com>
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 76474c60-d756-4fd8-5381-08dd26475662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QXdnNFM1Y1pFZTJsemt3Mkc5WlJLejd2NFdEVUp5c2xXMGVzTW9uN3FJZFBE?=
 =?utf-8?B?ZGpBZktHOTQ2QVRTUDNjLzN2eldoZWVQODBBVGJKSHJRZXI2cmJtWjlHWWV0?=
 =?utf-8?B?V2FLWDJOSW16eFhCNWxuL05IRDRuejhOQW84U0h0UW1KdjF3dnZGeTYvWWhE?=
 =?utf-8?B?aXhKZTRMcm1TZXZRaVdhMGdVQnRSOTVidHRtOGtzUXJaWDJBM2dPRkFzVmta?=
 =?utf-8?B?elhDdEF6RTgrWjNpSlRESjJZWVU5Vm9OU2tDelVLVUFyRFczTm0zdHVRYlBY?=
 =?utf-8?B?V3VHSU1ZTk1iUXBZTFlRWGpiOXpTaWRWL3VDemhQYVYvWWVyd3RYTmpYQ3po?=
 =?utf-8?B?UjJ3cUZKVHFFbkVINHhMV2JGSFBEWW4wQisweEswRWlMeFVVN25kVExKWk1Q?=
 =?utf-8?B?ZzdFTksvQlhsY2s5UkF3TVRUNEpmWEJHQmFZWG00V3F3SndrVzhjMU1FYzRx?=
 =?utf-8?B?STZ5Q1FYNFk4R3IrTEZMMlJyNHF6QTZMdXh2c21SbGhvL21NNUh6amNyY0RO?=
 =?utf-8?B?WmllK2cxVkdNdThNY3l6Z1RqNWJMV21pTW5Nd3RNN2FZVEJZSE1IbnRuWE13?=
 =?utf-8?B?UzJJaTJKcUV1c3pjSHdBM3JXOFI5WkFNSnY4cW1Kd1IxbzArYjZpV2c5S0lE?=
 =?utf-8?B?SW5zd3ZFc1RQUDAzK3FsYnJPcmJLLzFsOC82ZUU0c0hkNHQ4Qk5IZnAxbmFG?=
 =?utf-8?B?VGdyc1paN0E5STlEUVB4YUdPaTAyaGczcWQ0cXdiRjZiT3dEd1RDVkhSOS9Q?=
 =?utf-8?B?RVprUjBYbEF4OU1jUUlxMm9sNVl4UEFVN1FsekdPL0JXNVJrWTRVRm0yM09w?=
 =?utf-8?B?QWx3eU9nZ0ZtQWEvY0haR3RxQkU1c3phNmN3Z2hUUmlVNlVMR1ZESng1VytD?=
 =?utf-8?B?WjM3OHR1OG5QVXhLc1JNMFB5NUdCZGFWTFFzVlZHZ2VRYnFtbGhsM3AvQkhN?=
 =?utf-8?B?dzBZNU1CY1dVUDIzclk1K2c3cVRpM1RoTWp0MEw5VGRQUGNCV2dxOUZDcWt0?=
 =?utf-8?B?Z3A1d3dscFdZWTlDZ0piSWh3VnN2TEVzUndUQWtGR2xVUjlFUFRlTUgvMXZH?=
 =?utf-8?B?dVJETVVmL3c5eUxSUWEzRVhReU8vWkNLRmxVM1o4SkZ5a3BRV21oVm90MUY2?=
 =?utf-8?B?c3Y0K01ZbW4xNFN0SGcyVjU4Y3gvNUxTallQdEhSTEhKM3Z0MHhNT3hRbmJD?=
 =?utf-8?B?NWNIeEFJbEgyaU16Smo0RHo2bWF1M0o2OHdjVkNadks1c29ZS2loT0l1eWxW?=
 =?utf-8?B?YnU0MkkyeXJWMTIvSjUwNmRrdGRSdG95cDNzWTBpSUtDWU92L2FkM1AwUGVw?=
 =?utf-8?B?Wk1BbVo1eWY4RHNkUVAwa3p0TjZkY0ZFdTJWa3RZYjhGL2RnSzFCNmJRcG9x?=
 =?utf-8?B?RDZGMDBra2RjM3BSdk1MT2VyWFRsb094Vyt4Mk5ST2QzY3JCSEkvOVhFZkI3?=
 =?utf-8?B?dFhUWjNTbFVQdHVGZnFxVEpuTysyVGhKUjdiMDlscFJCbVdGV201SEE4alZm?=
 =?utf-8?B?UTcxZ3RLK3ZIQ1d1cGxESUJ3UGkrVU5GNW1GQ1pEZE81bjM4ZGkwcU1KS3Br?=
 =?utf-8?B?emNZTDVSMVBUTkFjSGEwbHVLeXk5M1JqZFA4cUZkRDc3SnlWTUxIbDVxQzhR?=
 =?utf-8?B?Szc0V3lYVFpKQ0JEM1IreHpZcTBvMm1XVk1mMEVUQk55ZVVrUEFPWkpWd0ln?=
 =?utf-8?B?UUsydlpUaFc0T3dCTGhSMW85Ymg2NE5ER3pqc3ZUVGNtSi9kenFBbWliZDg2?=
 =?utf-8?B?dnBhcHd5bXhYRU9LOVRHMHZVTTZzenppdHlxTkMwa2JwODlhaHg2QU0xYkhE?=
 =?utf-8?B?Q3g0REFYT216c2JLaFV2YVdIRURsbjdDM2tUd0prUjYzSFY3cWpNSkJGRHhV?=
 =?utf-8?B?WGhZQ2QzQzFjZ2FMVDRJdUtSdk5oTGF0QThlb2xRTzhzMFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmNuL2dVMXlUR1V4Wk1GWGZzV0Fvb0pOU2NGc3hOVE85dGdrVFVmbjJrT2Ja?=
 =?utf-8?B?c2wvR0FvL2M3MEhoZDFGelJGY1c3UDI3WGhCbC9YcStMT3pydWZTS2hEZ0Zj?=
 =?utf-8?B?NXJoRkIyNHNaU3cxY0p1bk1wdkxqSnY3VEEvR0xab1U4RSs4SldIQ0VpbjJJ?=
 =?utf-8?B?WVpHYkY0TUVpdkNHQ2ROa3gxaXo0My95Rm41R3B5bVRkL3pzZEFORTNpNVBa?=
 =?utf-8?B?L2JESUdOZmFoZWp0bWJ2NmJJRGRYWi9CZDNGNFl4V2tHTmtUTUQyY0cvclZz?=
 =?utf-8?B?TFhDK2FXMDJWZVlVZ0lOMXlpWDZVR0RmVTd1cy9SOVY5TSt2RFhDUVlNWUxp?=
 =?utf-8?B?bUErUmpLK2tzelJhVkVwZDUzYWIwL1cvUkgrRlFPb0xsb2hzYVFucGIzeTdu?=
 =?utf-8?B?OEhLVTZoV005WGxuaWY4eDZXV0JOUUl1c0lMSG9lM2puQkVKZTZqeklhKzla?=
 =?utf-8?B?S29kQ2RMR2R1WHAxYjBXVVFnNWUrRXZDMTk0N0szcmxxTWsxUFVoK09FWEJu?=
 =?utf-8?B?ZHJGSVg3a2F3blBqWEd0VC83UWM0N2UrOEk2VzFoZ2poQ1ozaWFLMkE4Y2Rt?=
 =?utf-8?B?ZVhScDRwSWFiZXY3MUw5alFYSUxNMjFzOXdIQmJFbTdRQ2tXLzVNTnplNzlv?=
 =?utf-8?B?ZEdyMm9qOHRxdy9icWNsQ1FDM25FRlVZS2dRenhxL2hEQk5Sc1phbjI4bWRI?=
 =?utf-8?B?cmVOSUNLbXNuQThhNG85aitXeDV0bWdvd2EzZ1J2VjdKNWNSaTV5OEtJelRE?=
 =?utf-8?B?cGJ4UERKbU1DZUswM0cyNVNMNDk2eGxDQ0lxcnV2aEtaaU9hNnpyc0xrZVZk?=
 =?utf-8?B?QXhJbzdQL3p6bHRoUmFZNk1Deml0SWFjZ2t4eUpyNVVoam1pVlIwNnhyVGlo?=
 =?utf-8?B?dmU0ZXlnTzB1VGlqeGVLSkVSbjZXU1cwNVNPOW5tWmcvcWg3bFNGNDhQRjgx?=
 =?utf-8?B?OWRWZ2xRVFNod0NxWVkwaVpSa1p1VDBodTljdGEwaUdVTUxjczk4NnVTRk1Y?=
 =?utf-8?B?WENHMENpRFdhbWlZbVNxZTViSUViYTNrem9YV3NHRmdwdWNzK2ZvekJVcy9Z?=
 =?utf-8?B?WmEzTHlUZ0F1c2ZFZ1ZoRnd1YzhkK285K1JvUEl1dXc4Ky9nUThhWDBtQ2pL?=
 =?utf-8?B?MjY3OGpvQUN1WERjYXpUbXExS3RJT2JqTjlJQldXeUwxZVJEalpOSXdLRkNv?=
 =?utf-8?B?Q1VLYTAvOFY1MjBqN0Z5TEhiQlQwOEEvQXk3bkx2aTVialBPS2IxalF0TW9H?=
 =?utf-8?B?cnF3TXZjYmhSVHJ1SnJZeFFBNi8xYk95T0p2UWxNeExBZm9EOXhKUEpqdjZa?=
 =?utf-8?B?WkZWZ0cweUtlL256Z3R3M25vTkY4YThaZGtPM25kdFR6azBHWHlmdXFHUWNG?=
 =?utf-8?B?VzlUdU95dGtiUGw2VS9XSFdXbExpRm5uNnZIZ2x6ZktrK2FIQ292eXRUdmZW?=
 =?utf-8?B?bzNKTzdZUnVpMFpGV1l2eU10VVdQcjdJTnJ1cm0wYmtBNG44UU4zRW5rVGhI?=
 =?utf-8?B?SFZEMCtvbHZVYnJWc0NCdmdqWWF5ays1K0tsdytHa0lTNVI1U3UxVFBBWGtN?=
 =?utf-8?B?MFp3cTJYWkptcUxzMHBmSTVURlhFeXF3WU5kOS9hM0VsdndPVU1BckIwTGYw?=
 =?utf-8?B?VEYrNDFYY1NDTzVXZjBwZ2t1TGI1UFlyVkFvWTJhQmlTVTJ0TlU2YmV5Z0tx?=
 =?utf-8?B?S3NyWkNvOU5oVS9DWUdNMkJwU241RkhzYU5LdGJJa1hpQmtMKzJTZXR4eExN?=
 =?utf-8?B?OFFVMjJtS0pvTTVnR3VYTk0zUTlEMlJpeDRBeFlVeGhFZEhxSU0wV3BYNE5C?=
 =?utf-8?B?VTZ2ZHl6c3pOcjVrMnV0T1FKS24zeUNkVkZCZXJRMm9XWmFUc0p0Y0svTWR2?=
 =?utf-8?B?UXR3ZDAyMU9teDFRQklKSFNWK0tscG1yb1NPdzByMlljaXRKY3RiOU15Nngz?=
 =?utf-8?B?NjlnVE9USkNBOFdvY0ZSOXh3UTFJREpFeVZQMFBJcmIzWkNIQWp1bkFmTjFv?=
 =?utf-8?B?WHc1cUFrY040bkk2NHJzOExEQnBMaXh6N1lhT3NreW9hdTUvVDBEOXRnYU1D?=
 =?utf-8?B?VEp5MFZFVjc4THo2NTYwUnpoOFQ5YUY3NWpNNSs4YVV3TkExdElKVVo5TWtR?=
 =?utf-8?B?bk8xTFc2dkQ2NjM5dFNqR3l5bEZYeXhYNk5YaStaU2dLYWwvUEU3VHMxdlZH?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76474c60-d756-4fd8-5381-08dd26475662
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 07:23:19.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFrcC8fYtFpHIESLGsIFtN2mhdotM1t0x4xoPC3ba9xNVBj1/CG+OpiMyEJIui2zpfNITKz5EgG4gEW9kPbZYQZjrISF+k/1gE/UTI5z9Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=676e55f0 cx=c_pps a=di3315gfm3qlniCp1Rh91A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=8K2slX0ETY9lElBSk7kA:9 a=QEXdDO2ut3YA:10 a=JZ-T-SLG2RnevwI_bg4A:9 a=wTREJ_K7_LjWuR9g:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Zth-nRlDeN-thndQgG8bjwwtU0Xygjwk
X-Proofpoint-GUID: Zth-nRlDeN-thndQgG8bjwwtU0Xygjwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=904
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 07:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209098

--------------eFnmI5bsHUVNMFCTh6SlsPqP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/27/24 14:53, Varatharajan, Deepesh via lists.openembedded.org wrote:
> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>
> The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.
>
> ---------------------------------------------------------------------------------------------------------------------------
> ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
> ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
> ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
> rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
> librustc_driver-fc36770e343ef852.so)
> ---------------------------------------------------------------------------------------------------------------------------
>
> To fix the redundant `libstd.so` files are removed from the usr/lib/.
>
> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
> ---
>   meta/recipes-devtools/rust/rust_1.80.1.bb | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
> index eae1f28bb8..2118c2fe9d 100644
> --- a/meta/recipes-devtools/rust/rust_1.80.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
> @@ -271,6 +271,7 @@ rust_do_install:class-nativesdk() {
>       rm ${D}${libdir}/rustlib/uninstall.sh
>       rm ${D}${libdir}/rustlib/install.log
>       rm ${D}${libdir}/rustlib/manifest*
> +    rm ${D}${libdir}/rustlib/${TARGET_ARCH}-pokysdk-linux-gnu/lib/libstd-*.so
>   }
>   
>   EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt" @@ -294,6 +295,11 @@ rust_do_install:class-target() { rm 
> ${D}${libdir}/rustlib/uninstall.sh rm 
> ${D}${libdir}/rustlib/install.log rm ${D}${libdir}/rustlib/manifest* + 
> if [ "${TCLIBC}" = "musl" ]; then
> +	rm -f ${D}${libdir}/rustlib/${TARGET_ARCH}-poky-linux-musl/lib/libstd-*.so
> +    elif [ "${TCLIBC}" = "glibc" ]; then
> +	rm -f ${D}${libdir}/rustlib/${TARGET_ARCH}-poky-linux-gnu/lib/libstd-*.so
> +    fi

Hardcode "poky"/"pokysdk" here should not proper.

//Changqing

>   }
>   
>   addtask do_update_snapshot after do_patch
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209095):https://lists.openembedded.org/g/openembedded-core/message/209095
> Mute This Topic:https://lists.openembedded.org/mt/110301947/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------eFnmI5bsHUVNMFCTh6SlsPqP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/27/24 14:53, Varatharajan,
      Deepesh via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

The `do_package` task fail with below error due to multiple `libstd.so` files installed in lib dir.

---------------------------------------------------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust-rustdoc: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-rustdoc/usr/bin/rustdoc)
ERROR: rust-1.81.0-r0 do_package: rust-tools-rustfmt: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust-tools-rustfmt/usr/bin/rustfmt)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so: rust,
rust (used by files: poky/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/
librustc_driver-fc36770e343ef852.so)
---------------------------------------------------------------------------------------------------------------------------

To fix the redundant `libstd.so` files are removed from the usr/lib/.

Signed-off-by: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>
---
 meta/recipes-devtools/rust/rust_1.80.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..2118c2fe9d 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,6 +271,7 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${TARGET_ARCH}-pokysdk-linux-gnu/lib/libstd-*.so
 }
 
 EXTRA_TOOLS ?= &quot;cargo-clippy clippy-driver rustfmt<a class="moz-txt-link-rfc2396E" href="mailto:@@-294,6+295,11@@rust_do_install:class-target(){rm${D}${libdir}/rustlib/uninstall.shrm${D}${libdir}/rustlib/install.logrm${D}${libdir}/rustlib/manifest*+if[">&quot;
@@ -294,6 +295,11 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    if [ &quot;</a>${TCLIBC}&quot; = &quot;musl&quot; ]; then
+	rm -f ${D}${libdir}/rustlib/${TARGET_ARCH}-poky-linux-musl/lib/libstd-*.so
+    elif [ &quot;${TCLIBC}&quot; = &quot;glibc&quot; ]; then
+	rm -f ${D}${libdir}/rustlib/${TARGET_ARCH}-poky-linux-gnu/lib/libstd-*.so
+    fi</pre>
    </blockquote>
    <p>Hardcode &quot;poky&quot;/&quot;pokysdk&quot; here should not proper.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:20241227065337.1257972-2-Deepesh.Varatharajan@windriver.com">
      <pre class="moz-quote-pre" wrap="">
 }
 
 addtask do_update_snapshot after do_patch
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#209095): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/209095">https://lists.openembedded.org/g/openembedded-core/message/209095</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/110301947/3616873">https://lists.openembedded.org/mt/110301947/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------eFnmI5bsHUVNMFCTh6SlsPqP--

