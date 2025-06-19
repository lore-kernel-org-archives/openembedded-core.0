Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E02C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 12:49:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14071.1750337377806629488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 05:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8265627ed3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6eDi8024005
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:49:37 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c8728jpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2Hvorxf7hGwyNgwm3UfY+xGIEzppFB4OMW0NFHevRdkRcKYeKIFO03Dvd6cKGqnTOtTVp2sM9oIYME4sU9NwZv7dgB7WBFYs0yU2cLIestD+MHwgt5StQb/ivC66wfndafe7TxwAu5sWEz8wYDpKdo+Apj3BsAE7z4VeRXrMGHAbVCqoH2GMILKnIUrVUVJteXcaOnSFhkdi58lYY5ckCCt0jHCudwN/kYRE/Kc34KdL8ML02/QzWW+j3hvC27ce+Hsf36OAuF37ew3hZ58vuPYtijrCfQ9MZj80Jv1T/SkKOurhWxeQMOWHXKatSpA2w/JLI1sou6hmf5lzX0nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ibJDawk28qQn7p4w0wPTIkHatIIiAWhwi295MMYz1s=;
 b=gyLdrsF4Pz5Ea0E5NuM5Xhqb4DS9W7BZZ1rh4r1O4p6G+ptl3E8OzucQOgKDpdLdBarF2paY+mQwmEGB8H6uXoy8EfsVSFFFekWrsbPqkAo6XdhkCxkXkZDOxSQpS+T/d+UimgwjDlTVfmXaWvh6kbaQAch8ReVytlay03mua9tWg45J9mfU47moE1rWs5hp9ePitHzMwChBn/053lzApQM27be8NE2niUAOYABBhYCsd7u+0gDGgYDLACSiWyAXd1TlL7270BDGeJTCrVGIQD3gVEgS4I6lNwBjIhf+3qO48E44eukczYfbkkkz18On+TDijYKEHq1yUt3CYGeC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 12:49:34 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 12:49:34 +0000
Content-Type: multipart/alternative;
 boundary="------------wRMjHkMZIBBz0gwfajkUDHhx"
Message-ID: <f230a45d-af12-4700-a167-426734131bfb@windriver.com>
Date: Thu, 19 Jun 2025 08:49:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: rust: Enable Nightly Builds
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
References: <9453b61f-4e0c-4736-81da-157c82d45051@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <9453b61f-4e0c-4736-81da-157c82d45051@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc6cc49-3bd6-4c24-c722-08ddaf2fbde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnJ5VDBpcXczR1R5UitPdDhONW4xeC80b0tYUXZTTUlkTm1uRDF1UWVnc1BZ?=
 =?utf-8?B?UWkwQnlLWS9DVFh3a3hLdHAvVXd5YWxBTmFqRitNZUx1UHE3RTYxb0ZiM2Fw?=
 =?utf-8?B?RXlhNkxKNkNDODdGY2dKM1ZQQktsUkpOTHFJK2hOOTJsN2k1TnloQjk2cEZ0?=
 =?utf-8?B?dklGSENtODl5MytRQTJNUkkrM05mbitOQmdUR25kRjNOYjNKVmlpTGNkSFl0?=
 =?utf-8?B?SXNoblVkQ01nOThNOVdqMHFBa2JjZ2RQd0xNZEg4TkN4cU5jdVJseGNRYUow?=
 =?utf-8?B?ZXJHOTNWcml2aW5tZFR6bkwvZGFvUEtxR29peEZGN05QVWhES3FoTTVxZlVC?=
 =?utf-8?B?YVR1bC84VUlqdmRjVnVFbklEVFJYNVJCWTM4bTYyZHVHeDhmMmE1MkVKVkRF?=
 =?utf-8?B?cEJhK003eTZjOGJ2dGowQUpNb1NhSU5HVjNTVTMzc0dTSTF4WSs4MXl6dkZX?=
 =?utf-8?B?Wjh3QzV6WDZjK28xTVI1RHVWM2xRV0k3VFRuU1NzNXBCWXVqQ21PT1hDa3J2?=
 =?utf-8?B?NHFJa3lyb1dVbzlpamtDRmxBWTlMMSsvb1ZMQ3RnSTFLWkEyWVZiZld5eE9v?=
 =?utf-8?B?MEFhdWM3Ui9TdGgzc3c2RGdTeUdpNllwdEtZcHNOaTNDeG4yMmU1WjNKWEt3?=
 =?utf-8?B?eVNMTmt0S3l2aFFEbkR4SDk5bG5xbmdkY1FRNXJjVHpPNndaOFVRRVRhOTlE?=
 =?utf-8?B?RTU0aldybDgvUXUwaWk4d0RIVXJrSEg2M01udDRKYmc2bURxUVFlenk3Rmto?=
 =?utf-8?B?MmJ0Q2NCMGxzRkdWcDNMTHliQjl4WlVnZ09MejdlMzdBMHZieEV4OHgranRk?=
 =?utf-8?B?eHdPZmk5MjZPZ0dIbTlqR3VzbUZVQk1JR3JxcFZkUnlVY0owYXp1bEpKRUMv?=
 =?utf-8?B?Z1VVZjI3ZUNvbEY1MWpxM0MvMmZtYkpsZXpSQjN1RVRwandPYTMwek15ZVJw?=
 =?utf-8?B?VHVBTDlUai9neG9reXBGcmo5eHZVWUNqOFR6NVdmaDJ2MXMrdTBSK0pqTEZK?=
 =?utf-8?B?ZlkzU2lkMitPVlNXNFpWYk5xRHI1Yng0YXlyQjZQVEJMVC93aGVnSGRoak9K?=
 =?utf-8?B?cXdweDZjSkRpK1hqaktJMnA4dWkveHpuaVBEaWJ0OTJrMFdjbHozQWlieWNy?=
 =?utf-8?B?SW5hQis4NFlXRDdTTFUyKzdDUlJIVEJvZTZrUjE1Q1MzYUk5aGZMZ0RSQjZZ?=
 =?utf-8?B?VjdlS3luMEJnS0YzYnRnQnhsbGJKWVl2amYxNEpiSCt5TVltUStRS0c4bDM2?=
 =?utf-8?B?cVRRV09tRUl0b3lWanFxbTBYVXJMS3orZmxTanB6UGZ4MjFhUGxRYmcyTmdo?=
 =?utf-8?B?WkhBUjR0YXBzdnNhZGo2OHM0ZEU0SGMwcGNIOFphbmF1eE9zWGdmYjFiNW54?=
 =?utf-8?B?dkdvY0VPbksrQmJnNUpIYktWU0I4QWU3SkQ3YS9XWGlhaDBTaC8rcUxWRmZa?=
 =?utf-8?B?UVppeGFBVGdaWTRTZm9uUUZpQTcyS0JiRkZWSUlOVmYzNzQzR1J3Y0tjaHVt?=
 =?utf-8?B?cGtpZHhZeWRUQ3BVbEg1bVdVNmEvaHh3V2xGQ2JuOVVoY3U4eFk3dEZaZVZH?=
 =?utf-8?B?OStuOHgyTnRvMzUwYm5FOURsWGs4TCtZUkppZ0tuMUw1d0JydFQwRG1idU5n?=
 =?utf-8?B?YzBONVk2VkVhblN4ZHBXK0hOd3VySmIxRE1lMGxDajE5Z20rV3JMaXRnRGJJ?=
 =?utf-8?B?Mzc4MXFJSnJkUVZwMlhFWktZNU9nWnNSYmplV3dRd0Vrdnc3blVSRmtTSit4?=
 =?utf-8?B?NmZJRVptOHJSVEtIQkdEZlVDN3pSVXJRU2pHRjkxNXhkMllUbVZCb2VtZjdl?=
 =?utf-8?B?dlZJUkJueThBbWU5Y2lYeHFLVGtCK1BxTG1odVJUUHpmN0ZibzdZdlZra05T?=
 =?utf-8?Q?7KZ8tugq1uD99?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2ZWZFJ6cUtLQVRkMzBBQlROQm9mL0hHcjhlUWduQmZrZEVBOWpYT2xxOVpl?=
 =?utf-8?B?SUwzbkNCaGFOSyt0SlNWZllSZXUvd1ZzOGZuMFV1ZzFwOFk2T1Y4eitjUFVs?=
 =?utf-8?B?emlrTlVEWVYzbTJGbEhXR0xPMS9JK2xmNDk3a25zSlkzK20vemlkbUpJeDhX?=
 =?utf-8?B?MHpQa1hUVVo5eWVWUVBZRitpR3VVM1BFSi9jTHdEdGRneHNuTFk0RFF6ZFpz?=
 =?utf-8?B?WEJUUWdFdzFhK3NrZGR1QUROZDRNVHd0bzBRRTE0QzAveWlZUVVVMldBNEQ4?=
 =?utf-8?B?TlpENys3MXBPUXY3SzB1akJKYzQ4eE5kZTBWMFFJNlVxYzhkcUpjcnFyZTlh?=
 =?utf-8?B?OHVOY1NZMm9nT1gxcnpxcXEwanhLNEpPK0IwTHNjODVPOStjTkErdytoL0tT?=
 =?utf-8?B?UEJGZWhRcFFGZHExWVlJVHFzckNoTU5WSUNyWStCaFNaS2FDdmhsL2QyU1Ns?=
 =?utf-8?B?eGNVQWc5VHAvSE42R3J6aU83LzVUcFJtcGo5eXdmVUo4RFBVL0hSVkZ5dG9B?=
 =?utf-8?B?VklXMHVBalRjWWkxTHZyOUw0b055OXRnU0pjUXVkaVduMGJ1YUozZ3Q3ZnFJ?=
 =?utf-8?B?WmU2TjkxTE44dmJKVmxCYkU2eVBGd200aU9JVXI0NC9TelJwdmYzbDBsUXQ2?=
 =?utf-8?B?UDhoL0pkMkZyaEdublExQXV0MTJaZVZqOGFJUU9zQndoTHpZcFh5Z2ZqT3lr?=
 =?utf-8?B?aXdUU2ZQTVBRS1BjSWU1aHNxaThYVS9hbzBzNGY0NTYyaldpQlp6eG1PaGtI?=
 =?utf-8?B?QU9zU3lkTGNhS2R5Z0dDU1Y0NWtxYXd6Y29vSlExM0pFMnVSRHlLdmhpVUow?=
 =?utf-8?B?OUpFT0VEdy9VSFlPbVpNVVNKWDlhdERRbng1Q1paVUJMR1YyMWRxMnlDVXJ0?=
 =?utf-8?B?Si9Bd3d2em02TTdIVnV0V2gwZVpRaHk3V3c5TS8wTkNBUjB6ZkhmcnR5SnlF?=
 =?utf-8?B?VzM4RkJlVzQ1Sm1MUS91d2pBbXgreFpWelc4YklMNlJ6bDIzSUl5ejBRZ1R0?=
 =?utf-8?B?aHV1cTUxQTMzelRDa2JLWjhKSDFTdmFtZ1ZKWlp5MWwxZ1pjQWZVeTAzaDY2?=
 =?utf-8?B?U2pzNG1UY1BFTE50YTJsa0dSMmg1RTVnR0N1Y0d5S3lwZUJqMFZrT0YzdXVB?=
 =?utf-8?B?d1V1RUhSRWg2SG12RmdVdVFMTHcrSVZydWJPdVVpd2JhaGV6NTJWZkZqT0lT?=
 =?utf-8?B?WHd4TFB0WW43cDZWVjJSWldDejFkbFRIMzJydTc2MWFBSTF3MCswRHlZbDBy?=
 =?utf-8?B?ejdYeHAyeStnYTZkZzhFVHVqcmNZT05xbGFHeFdUd0dIUlBRMFFlcHhCUGhK?=
 =?utf-8?B?a1VKZnVDK0pEWWx5bnRRbkpnUE9Fb1ZxR3RFdS9CdDFLdFJ2eGlRTEtPekp2?=
 =?utf-8?B?VGVZWHpsbGIvbm9oNXMvQ2QwUDJoa0MzMExjQk5WTVE0SXcrSnhWbUczY25B?=
 =?utf-8?B?TWtjTlZlUDRDUnBJRDFDaXZhcWhhem54c1B1dTU3UW5QcVkwZktkWnhLbEpl?=
 =?utf-8?B?N1RNOGV6NGFnR1BhQU1qY0p3T2R6ejVoTEMxUVVjclRzdGpZcVhSa3RqVDZz?=
 =?utf-8?B?ZGNSS3dvRG5mY0FweEpmOGFYYmN4OEZzQTJkQkM2MzJsN08xOU5uK0VBSDZD?=
 =?utf-8?B?N0c4bmgzNFFGRWc3THJ6ZnUxL1Jsd2ZtRVpDeFV4WDhWYUV2NCt2YWpLODdU?=
 =?utf-8?B?OHJRcFNwOVBseFB2N1RRWm9PY2svYkQ2bmVGVUFNTGZFaE5TdlRTRk5sVWxR?=
 =?utf-8?B?R2o0YXU4THhNVFBiMk9wYlUwdEFvNGViRmdxUThaYldCVTFhRTdETzRuY2Ft?=
 =?utf-8?B?QWp1K0NqSGlaRzBpb2JqNnZZbHVZemM4MHltalJ4NkdVWUM1czB6ckpROVM5?=
 =?utf-8?B?bWJyRHNHWkZJaUdzNnNYK0hkSS9hN015SVFSY3dsMFI5ZHRoeDdwYXdaVCt2?=
 =?utf-8?B?U1FDN2NCV1J4eWx6NThQOHE2Yk5hUmorelZ0Zk5Gd2pYZXAxOVFuWGVYZm5V?=
 =?utf-8?B?OXc0UUZmRWpUa0ZqbUl0TUk1Y1g1Qng3QmZXYWNCc3RNTnZVZUN0dXYxVDcv?=
 =?utf-8?B?WnpoaCszWDVpTWlHd3ZoMkExeFRxRy9VWjlJSkY1QTAzcEZmeWYwNEdNR2Nw?=
 =?utf-8?B?TlVKVjBrWm93T1BkLzllcEIzZWJ4czFrQm9QaEhYSmpFKzROWXUzMzMwVUEw?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc6cc49-3bd6-4c24-c722-08ddaf2fbde2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:49:34.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgTgdOWc3GKANPZLJPurie5uIkKzLztLu3WS2rm7taVGnTVUyOv/k8PXBjLSCJdPk6DQUQphnddgMIjsObmBoftvK6Eo14ElnN8eqVx7I1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwNiBTYWx0ZWRfX+VL/mmGPwOnG 8qmjhysXqq9iA/j8aSaQ1EOuLqEd9yIWA1u+W3Emg7KTde16ILNhgXHAoqTQpubbOUNud2d0/T7 oveh5oGAr2XFrI8ZdCVu+a6Mts9ypD45SlOc+gkfVtinniniWf8V34PkWtPRDoEfr9zGk4qhrn5
 KOq01XFweTm8QO8SB0ZlkqwR4KyupxGdBsbgZFIYsHv4D19GhHMzVshRWnuGQ1492H4JbNgVKuc sompA5A5SmSThmhdWlaTouVc1zEMivu2kf46t1MVF7mtJrd9bx59i1C1L63hXvdoMbBFhggHdKs NqJTdXNfo8f3oiEeYiOIDvZBW11AUlZ9uouYsNe0BUdf244uHhw3uE2jUy5LM+eM+NYYJ2Mz65b
 wbkOCMe0gNV/QbrCrbpLF62mGYfDQbKoMlM9mm1iR8e3o545FIZ1nynoIUuC/UE/b4Du/Dmm
X-Proofpoint-GUID: bIevfG4uDwfNir_HZLCBwW8mB_l3Oqyf
X-Proofpoint-ORIG-GUID: bIevfG4uDwfNir_HZLCBwW8mB_l3Oqyf
X-Authority-Analysis: v=2.4 cv=RpXFLDmK c=1 sm=1 tr=0 ts=68540761 cx=c_pps a=u3YE/0tSJtPf+I++xSQ12g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=iYXpIVDHID0R0FBtz_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=ymUC3UL9ly5Luul-rsYA:9 a=KRZ7QyzfJQJc0ghr:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 12:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219074

--------------wRMjHkMZIBBz0gwfajkUDHhx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55J6eDi8024005

On 2025-06-19 3:34 a.m., Deepesh Varatharajan wrote:
> Hi All,
>
> We=E2=80=99ve successfully integrated and built the Rust nightly toolch=
ain=20
> within Yocto environment.
> The rust, cargo, and nativesdk-rust builds are verified with latest=20
> available nightly tarball (2025-06-16), and are working fine.
>
> Changes/Patches:
> 1. disable-rustfmt-check.patch (skip the rustfmt check during builds)
> - This check is mainly useful for upstream nightly contributions and=20
> isn=E2=80=99t necessary for our use case. It also tries to fetch a rust=
fmt=20
> tarball, which was breaking the build =E2=80=94 so we=E2=80=99ve disabl=
ed it for now.
>
> 2. The rust_1.86.0.bb recipe is updated with stage1-tools copy to=20
> image (as from 1.87 onwards the stage2-tools are no longer built as=20
> part of the standard build process). This change can be merged with=20
> upcoming 1.87 upgrade.
>
> 3. The stage0 compiler used in the upstream Rust toolchain updates=20
> roughly every 15=E2=80=9320 days.
> - Current build is with 2025-05-26 stage0 compiler.
> - Once a newer one is released, we=E2=80=99ll revalidate the build proc=
ess=20
> with it.
>
> TBD:
> - Local patches haven=E2=80=99t been rebased yet
> - Oe-selftest/repro is not yet tested
> - Automation of build process (stage0 compiler updates and nightly tar=20
> ball fetch)
> These will be updated soon.
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust-nightly
>
> Regards,
> Deepesh
>
Thanks Deepesh.

For those wondering, the intent of this work is to see if the nightly=20
Rust tarballs
can help us when debugging official releases. We are open to ideas but I=20
think we'd
start with updating this rust-nightly branch once a week. If we=20
encounter problems then,
we only have 7 days of commits to look through rather than 6 weeks of=20
commits.
This will also enable us to catch upstream changes earlier to decide how=20
to deal with them
and to notify upstream of the impact to Yocto and when needed send=20
patches to get integrated
before the official release is done.

This will require constantly doing more work so we'll have to see if it=20
ends up being worthwhile
after trying this approach for a few Rust release cycles.

../Randy


--=20
# Randy MacLeod
# Wind River Linux

--------------wRMjHkMZIBBz0gwfajkUDHhx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55J6eDi8024005

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-06-19 3:34 a.m., Deepesh
      Varatharajan wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:9453b61f-4e0c-4736-81da-157c82d=
45051@windriver.com">Hi
      All,
      <br>
      <br>
      We=E2=80=99ve successfully integrated and built the Rust nightly to=
olchain
      within Yocto environment.
      <br>
      The rust, cargo, and nativesdk-rust builds are verified with
      latest available nightly tarball (2025-06-16), and are working
      fine.
      <br>
      <br>
      Changes/Patches:
      <br>
      1. disable-rustfmt-check.patch (skip the rustfmt check during
      builds)
      <br>
      - This check is mainly useful for upstream nightly contributions
      and isn=E2=80=99t necessary for our use case. It also tries to fetc=
h a
      rustfmt tarball, which was breaking the build =E2=80=94 so we=E2=80=
=99ve disabled
      it for now.
      <br>
      <br>
      2. The rust_1.86.0.bb recipe is updated with stage1-tools copy to
      image (as from 1.87 onwards the stage2-tools are no longer built
      as part of the standard build process). This change can be merged
      with upcoming 1.87 upgrade.
      <br>
      <br>
      3. The stage0 compiler used in the upstream Rust toolchain updates
      roughly every 15=E2=80=9320 days.
      <br>
      - Current build is with 2025-05-26 stage0 compiler.
      <br>
      - Once a newer one is released, we=E2=80=99ll revalidate the build =
process
      with it.
      <br>
      <br>
      TBD:
      <br>
      - Local patches haven=E2=80=99t been rebased yet
      <br>
      - Oe-selftest/repro is not yet tested
      <br>
      - Automation of build process (stage0 compiler updates and nightly
      tar ball fetch)
      <br>
      These will be updated soon.
      <br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-contrib/log/?h=3Dharish/rust-nightly">https://git.yoctoproject.org/po=
ky-contrib/log/?h=3Dharish/rust-nightly</a>
      <br>
      <br>
      Regards,
      <br>
      Deepesh
      <br>
      <br>
    </blockquote>
    <p>Thanks Deepesh.</p>
    <p>For those wondering, the intent of this work is to see if the
      nightly Rust tarballs <br>
      can help us when debugging official releases. We are open to ideas
      but I think we'd<br>
      start with updating this rust-nightly branch once a week. If we
      encounter problems then,<br>
      we only have 7 days of commits to look through rather than 6 weeks
      of commits.<br>
      This will also enable us to catch upstream changes earlier to
      decide how to deal with them<br>
      and to notify upstream of the impact to Yocto and when needed send
      patches to get integrated<br>
      before the official release is done.</p>
    <p>This will require constantly doing more work so we'll have to see
      if it ends up being worthwhile<br>
      after trying this approach for a few Rust release cycles.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------wRMjHkMZIBBz0gwfajkUDHhx--

