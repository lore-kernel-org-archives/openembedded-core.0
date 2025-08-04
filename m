Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063D0C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 16:47:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.382.1754326049980110193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 09:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03117c3097=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 574GJhXO2779194
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Aug 2025 09:47:29 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489dy11qjj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 09:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUR6xDsXcE8NqgBDkjPoRQy636vLMBqAkgIytFBuYSTCz8rig55G8h8Z8HbFJydSZBTmEUgt3s6Q4ZxxnPqcXj9paEgTXIpm8EzNYdtH78e1mVckjzKcLuayNCCpsPIdWthfIb9+Iz0N9uu0+//vQY+OcGno/83/S0GdwxU4m/KSRD+Yp77XOyU75q9fC3EMlXZDLD0mqY3IbFpTVxLHG230JGNnlnW0uQJO8lUP7mE6VL1Qk6HlGsi2Cu+PAd0Kg8Dqs/de8Uf2LO/Jhme06r6cTahpdbqP7NTHuglQNVs1SWRHu/ZxwU48XnAbHxTmmSf6GwRBgyjyVHbqMR2ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9QKA83GcpeDJwOig9t1GgKJgEFPfcdkdpXsYy7qfYo=;
 b=jcO3pCbQNRUHQdDnShIA59EaTWGTnxOsJJsctBET7MtD+nzyhJolxKunx5lPjFBU8vcnvskCJuvK54Bo4Q0uLm4k5gY5cIcE0C3rJUaTMigCm2MaLo3yl2wNr4oz3czEN2Ui7kvfOtkvUuaTfqEtHo21yuFQUVRlum6yz81uKQudpHFS5qIoomZNI1Nld6hJ/0WofuSgvQkH/8pD/oXhL2CsetQUyemSO/C8jmVBa0ejKq6OUbP5UeL9/ET72gDbWGgAPgiK8zoCh9jOaTQXFHnQSEnD2x2YbZLjFucTYOFLyy9qvJUOW4iY7JxWsKOzembiaC2rAjLWc/1CM3lcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY5PR11MB6535.namprd11.prod.outlook.com (2603:10b6:930:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 16:47:25 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 16:47:23 +0000
Content-Type: multipart/alternative;
 boundary="------------0aHjYwGNuU1msmzFVgrpCII9"
Message-ID: <baffe880-1bd3-4552-8067-671642b5619f@windriver.com>
Date: Mon, 4 Aug 2025 12:47:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] vulkan-validation-layers: fix compile failure
 with DEBUG_BUILD = 1
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250716073233.3020439-1-hongxu.jia@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250716073233.3020439-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY5PR11MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: a36708e3-77e8-42ef-48c8-08ddd3769645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWxyWnF1eWpMZ1JoejNodURqampxT0lsR3pZcnlNY24yMzZkQk9uWVFPWGRG?=
 =?utf-8?B?VkExb21DdUN4S1pmWktRYmtIMlhOelhDRlBiQnY3aGpOd1dKQjJMd1grVDV5?=
 =?utf-8?B?MzlTWk9hZTE4QTZZV0JHMkp3WmhPaDcrVVVPbjR6aURsbFpJTkZKRHkvWWhw?=
 =?utf-8?B?bjlnQmZRV0pBZCtJZnF5cXVzUElFeS9Ta0xKZFAvZmc3MlgxdHBRd0x2MDV3?=
 =?utf-8?B?NG5Wd2hzRTIxZ1gzNmJuR081ekcrY3ltN0l3NTRqSVB2TjNCT3pkbG1MUW1w?=
 =?utf-8?B?VjFpUmJlK1IzaXpHZlR5Si9jaElyaElYdmdLWkFId1plSS9lNlZGYWpveWxq?=
 =?utf-8?B?SzRtbVBuOWxSNkpDS0RqRjVZVzh0VEovTCtwMDhZOUFLNmNIKzg4STNPVTUw?=
 =?utf-8?B?WVM5ZDVkSzJMVk8xZGxvamhTNWt0QVdjbHF1ZXB5dkprQkhvcncvb3l3RFpP?=
 =?utf-8?B?c0k5dnBBNFlCcThlR09ZL1ovZEcveGRwRVROWFB5WStaRjhac0FQaHFIWmVO?=
 =?utf-8?B?THJaNlVCcWxFVXZQTHcyQmd6a2FxUVIyZFBzRmtKZklaTGxZYXVYbmVlZ2R5?=
 =?utf-8?B?Z1BuOXp1YUNOOFYvQm5NeEowM2dQT3BBOStuOUd2R0hFdzRFZ3JaUFNaQi9h?=
 =?utf-8?B?ZXpyL1Y0UXptWEJ0SHRZdXhucXlHTjNLenREcitNM0NoUVY2SWYvbWRGcFc5?=
 =?utf-8?B?WkdHTHdyYVloV3lpMGw2OGJoVTVoZEEvYlR4ZUlZQTFYcXhCeXo3LzZuM0ty?=
 =?utf-8?B?VzEzQnJZSXZTczU5S0VHK1JkYXkrNkpoZVJUYUdvZE9VdURqa2dZdXc3TUI4?=
 =?utf-8?B?UERkMUJEVXJtV3g1OUpuL1FsdW82d0pPZzhUdGE0eklmTXd0NGwvRU5VYU9I?=
 =?utf-8?B?dmd1QmFpbmNiY2JBZGFGVmlFWlo4a0p2aEduOTJCbDZNeENUWUxUMks1enlv?=
 =?utf-8?B?VmdyNjFNOXQ2c0xNWjc5dDFNZ2szUnhuYzU4YTZ2OXRWbDVnM1ltVlBleERR?=
 =?utf-8?B?SXI3VjhtbnVTRGhUU2toV2RwVWZicjUzL1ZZeXVPWFlrbkdFSXR1eDd1NW9Q?=
 =?utf-8?B?RnFHY1B4amtHUTJzaUx0N0dTRmRYRU1FMTI5TTZ1d3ZNcHNFWENYU0lOTTBo?=
 =?utf-8?B?OU5MNVpYaWFtdGtGN29BYzByNldaYnJrb3FOY2FzSUpWVnFiUDE4V2xBbmVS?=
 =?utf-8?B?NGpWbytoYVNJVEZsVEZsRitKUThMVWxVSHNZSWJ3WWcvRGRSSTIvamE2VTJz?=
 =?utf-8?B?VG55V2hVRnYzcVRqbE1vcGVkZWpGdURma3luWWRCOUlaT2Y3VVovY3pIeEFM?=
 =?utf-8?B?bGUwRVRSMTNPaEw0NUtiT1NmbXlGbHhVWk5OMFNZaDZkU0t2MjI2NlVJbllT?=
 =?utf-8?B?SmNPVE1zU1hwdHE2QmJtczlIdHVITXJ3QjNKMUkzbGtYeStpWFF1ZWxFNEg1?=
 =?utf-8?B?b0lPVURQKzVEblVMa011R3dYUERnWmJRRU5lTTVmem0xMmRIQzQ2UllrUlZp?=
 =?utf-8?B?TjMxZU1hMmg4dC9yY3I5MW1Cd1VxRlZ2L1BzMmV1Z2liME9mV01Oby9MeUs1?=
 =?utf-8?B?cGRXNWFia2JSUFV6SkpNaFg4Y1ZrYnFzU0wyOU16SmR4SnVZRlBsUE5FQUM0?=
 =?utf-8?B?c0x4VW9QODNwNnNvZnNWR2JGaW03djM5TUhMY1BLOEZBN21PTmpNL0s1U01w?=
 =?utf-8?B?Wm5MTTlqNzYxdndvL0I1K1lzbWZENVFodUlrYzRIcGl0UHF6UEphM3FOUHRa?=
 =?utf-8?B?ZWx1UlhoUG94d0hYaUE5OURDRWZJcXhDYnJBRE9kc1RKdi9SUEwxcExSNkg4?=
 =?utf-8?B?TFR6TDVJT3VheFNtSWYwREZjcVljYzBkYmZFVFY2MDRGaEM4ZW9YNUVFTmxi?=
 =?utf-8?Q?DNnyGEi2UFaLf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkF4ZmVMNlkxVWN6Q0FMVWhSL01KRWozQ0o2UjJLR2gvWnI2SXpobE8rZUtY?=
 =?utf-8?B?M3NIS2dudVM3QWNYMnFNenNLQ3J0VlN4d1luSVZXdEUyL0padVBHNVYyVWc4?=
 =?utf-8?B?ZzJldWVKTEVwNHBFcWozME9OVXlZYlR3MzRyZ0ZNSTY3YStqVUNJcll6Q1Nl?=
 =?utf-8?B?WEMwSHBKNkJFeGZjTk5kT0FKa0ErUkpsZ0dDT05wZTFBSWxTRWJMME1NMGdy?=
 =?utf-8?B?RHZQQUlSdDkySmsrRFl6VlRlTkE3bWNOUjZETXp6UTh0UTBibkV4KzFNWUlF?=
 =?utf-8?B?Y1hLek1wS2tOak5FYklaQ2MwVUVLZVdlUWgwMHdwTy94WlNqZjh3TUhBdzFm?=
 =?utf-8?B?RHFjdmc1RWN5NkJlWUozNkdwclkvcXFYOVJzMml0VXJIUjFPMnM5dXRSSGQw?=
 =?utf-8?B?N2FTZGZhbExwNE4vVGgreWxnTlczaWdhbkQveE1YL2F2dE4yRHdEZndCOWFP?=
 =?utf-8?B?TUlobUEzNC9oRzcyOWhaV0FRWWF3LzZHVDZyVFlGUnZNOXpSazNHbGhJaW9p?=
 =?utf-8?B?Vk9jT3lROEhTVEpkSVJHR0t4TVNUaDBwY0YrclBkSk9HTjdpYXAzQUppbkxQ?=
 =?utf-8?B?MytMeGNuOE0vbld1V1hyUEZyNjZWdTBVMWk2VlVGQkxYWkgwdjhDOU1TTHF6?=
 =?utf-8?B?eEZ5a3l1U0NIVzdYZENNTFdHLzJPenpyYkdHNDdxVHNqNHdNT1B0b2NCc1JM?=
 =?utf-8?B?YTB1WGdvVVBsK0tJSTh2SGwzU0puODdsTThVUjhzNzJuY29yeGZOb29ORTBD?=
 =?utf-8?B?RFBibkxvU0tvT1hkM2V4S084WGFwMTRJMmNKcEpXZU5Qemg3YUZ5UHNvM3NN?=
 =?utf-8?B?Q29uYnV2QTZvWmZ0aU1wN05PR3d0Y0VTdENHVWExcDU5eG9MWm5pYUtyTmNX?=
 =?utf-8?B?eXVhRjFWQVdLQWxIL1o4b1JSNWpsenIvOEVLbEtxcC92U2Y2NUVLUG5FQk9h?=
 =?utf-8?B?eFIxTXI4RHYwRVFiWWxtNlk0cERRcmFrLzZJNGJOWkJ6ZjQ5ZTdxTHZZUHdi?=
 =?utf-8?B?SmN2WmpKZ3dpa0RKN1FWaWhpdk5xdys5YVpuWS8xWkRoL0U2ZVE5L0pGeXJT?=
 =?utf-8?B?eVJlSzZoRVdiS0NVV2Y1THJwSDg3NWt4enpjcUpPeDFkYmtQR25zMWFwSFNs?=
 =?utf-8?B?ei85Y0FES2RHbTdxWmFBQVZiS2FIR05EbUxIYTJSdHdFUFg1WSt0RXFITFZz?=
 =?utf-8?B?b1JVR0tVLzloK2hsempqUXhLYzNmOWRNSkczcVBJRXdrOUhRdHB3aGQxU0da?=
 =?utf-8?B?ZmpOVXZsakpOeWJQQ0ttNlJOaVdLaXU5WDhWY1EvRWEwMUY3SWo0MExOM2t3?=
 =?utf-8?B?RVlMM1F0WXFzVXNFNnl2c2liVnhKMmNMNGlzc2w3UUVHRUtkQmc0ZXM4VGFW?=
 =?utf-8?B?ZXZaUWloSGp3cVFqbEtwNXNET2kvRlp6T2x3dVVRMEc2b3lla3ZlWi8xeHQ0?=
 =?utf-8?B?MGNMa3FVQnlOcWRiYzlQVXRGSUkreEtwd1MzTXBKc0dIaFdNV1FkOXQ2MlhX?=
 =?utf-8?B?aWlRWUR2aDFhdEVKeE1nRDVxYWwzOE1RaVpIS0xRT1ZKWk5HbFBaMkhXb0hJ?=
 =?utf-8?B?eTF4UEtxVXNLMVl6bzdLN00zeC95WEN1YzRIdFFWb3pQeEp4bE1SUW8rdzlS?=
 =?utf-8?B?NHpScUFFWEFSZTZEdG53aHhnZ0ViaWlJY0VzWTdIKzU4S09IWmtkbjFwQlJZ?=
 =?utf-8?B?U1FvK1pVUzEzNFlzWG1vdVp4T1BZM3g5dFU0QktZbGFNM2pWQ3Q2cjVXYzNr?=
 =?utf-8?B?RzhkcDlDVUlFaTljaWpYNFpXMnpSVWxDVlJMVHBKT2pPV1Z2VXI4K04xZ0Js?=
 =?utf-8?B?enU3TjVabHg3bzFsOUN1Qk9naEJEbjRrUmoxMlB4WkpwWkE0SUo4OVBaYnJS?=
 =?utf-8?B?dnN2QlA4a3RVYWIzelM3L1N1V1pteHlZSjZuak1iV2dicUk3M3FPZDhuL2Yw?=
 =?utf-8?B?U2RZcGZVc3VNVFhEVkg4cWZnYjVNNGM5Tm9acVkxcUp3VUVkYmJRQW5ubGFR?=
 =?utf-8?B?MjM3dW5oTmtFWlJxMFR1MTFTRUpSbjlEUUdhTSswNUgxd21uOS95bEJRYjFx?=
 =?utf-8?B?ckI5UFAvYTMvNGZweGZEWmFyTXMzVHM4angyM2dwV08zVlU5SVdBRmxHa0lv?=
 =?utf-8?B?VWRqZ3hRcW5DUzlFZzRTTmJCdFA0a0krSThwVEpoVW5NZjVjSHljcms4c3FH?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36708e3-77e8-42ef-48c8-08ddd3769645
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 16:47:23.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /s9oprl6Ane/TcOWmh4sHKPCNfjvlIy7+0zImqTpcAIdqAgDMm4sqn933gQDSwqrVoO9eKMMm9GZJ9SKNRBBUMtjpnedG/vI9Pl6fY/mQTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6535
X-Proofpoint-ORIG-GUID: MOPyIVXtMJA6ryXoNlLgNSDo73GPcxob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA5NCBTYWx0ZWRfX1VluNptGtHFQ
 peeJSy1kupFGKXLAho/CzVJxvJ9TX9d4mdUybK08gEZ/DRYGkHE3Rcyix/kEaXIA2Y8FBX0bQ/Y
 aFTJXCK8XiFkf2CEiNKq+B/+xcS5/QjHmV6iglJboZMkFavcmpBuK/NcfC9D55lMJ/llb6Eol5C
 4Cq88TkCRluWtKRK9Ve+d5asuifWvstfxBOzzpnduZMEm6xVpES4+LfvZpn0ZGgyip1Gak2hVc4
 cLRobjlQL8dkyfT6ltn2/GNL+udS/WSxy+pMqW2pFfMoh2clDiuOV6ud9HVZz3W/yAghUMlli3T
 lMOfFvjpCp8/+FOOj/hKTor6h9YoM0kOB4tJRsfJLeegg707LbV8mKy3niAlKN+I8mNp6z52ukn
 X9YvxlkK
X-Proofpoint-GUID: MOPyIVXtMJA6ryXoNlLgNSDo73GPcxob
X-Authority-Analysis: v=2.4 cv=LtOSymdc c=1 sm=1 tr=0 ts=6890e421 cx=c_pps
 a=2GB9L8dNip6y3bDgyjjg1g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=5mNhgPiPsN5K-zSXBaMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=86TALEUNG43LT7YjXBUA:9 a=GMpSkYfKasG-pmkm:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_07,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 16:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221434

--------------0aHjYwGNuU1msmzFVgrpCII9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 574GJhXO2779194

On 2025-07-16 3:32 a.m., hongxu via lists.openembedded.org wrote:
> When building with GCC 14+ using -Og (DEBUG_BUILD =3D 1), got
> the following errors:
>
> $ echo 'DEBUG_BUILD =3D "1"' >> conf/local.conf
> $ echo 'DISTRO_FEATURES:append =3D " vulkan"' >> conf/local.conf
> $ bitbake vulkan-validation-layers
> ...
> |tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.4.313.0/source=
s/
> vulkan-validation-layers-1.4.313.0/layers/./external/xxhash.h:4822:1: e=
rror:
> inlining failed in call to 'always_inline' 'void XXH3_scrambleAcc_sse2(=
void*,
> const void*)': function not considered for inlining
> ...
>
> Refer [1], using XXH_NO_INLINE_HINTS when compiling with -Og (DEBUG_BUI=
LD =3D 1)
>
> [1]https://github.com/Cyan4973/xxHash/issues/943
>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   .../vulkan/vulkan-validation-layers_1.4.313.0.bb                | 2 +=
+
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.=
313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.=
0.bb
> index 63a3aa4ae64..c05a1d87007 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.b=
b
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.b=
b
> @@ -26,6 +26,8 @@ EXTRA_OECMAKE =3D "\
>       -DSPIRV_HEADERS_INSTALL_DIR=3D${STAGING_EXECPREFIXDIR} \
>       "
>  =20
> +CXXFLAGS:append =3D " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INL=
INE_HINTS=3D1', '', d)}"
> +
>   PACKAGECONFIG[x11] =3D "-DBUILD_WSI_XLIB_SUPPORT=3DON -DBUILD_WSI_XCB=
_SUPPORT=3DON, -DBUILD_WSI_XLIB_SUPPORT=3DOFF -DBUILD_WSI_XCB_SUPPORT=3DO=
FF, libxcb libx11 libxrandr"
>   PACKAGECONFIG[wayland] =3D "-DBUILD_WSI_WAYLAND_SUPPORT=3DON, -DBUILD=
_WSI_WAYLAND_SUPPORT=3DOFF, wayland"
>  =20
>
Hi Hongxu,

The issue was resolved upstream but fixed in a slightly different way.

Rather than carry this change in oe-core and have to remember to remove=20
it or rather forgetting about it for a release or two,
can you=C2=A0 get upstream vulkan to update to pull in the xxHash change =
and=20
then update vulkan for oe-core/master?

Meanwhile, we should carry this in WR Linux until the vulkan update gets=20
into oe-core.

This is probably a good approach for DEBUG_BUILD issues in general=20
unless other people
on this list speak up and explain why they are also interested in the=20
DEBUG_BUILD working.

../Randy



> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220435):https://lists.openembedded.org/g/openembedd=
ed-core/message/220435
> Mute This Topic:https://lists.openembedded.org/mt/114181365/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------0aHjYwGNuU1msmzFVgrpCII9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-07-16 3:32 a.m., hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250716073233.3020439-1-hongxu.jia@windriver.com">
      <pre wrap="" class="moz-quote-pre">When building with GCC 14+ using -Og (DEBUG_BUILD = 1), got
the following errors:

$ echo 'DEBUG_BUILD = &quot;1&quot;' &gt;&gt; conf/local.conf
$ echo 'DISTRO_FEATURES:append = &quot; vulkan&quot;' &gt;&gt; conf/local.conf
$ bitbake vulkan-validation-layers
...
|tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.4.313.0/sources/
vulkan-validation-layers-1.4.313.0/layers/./external/xxhash.h:4822:1: error:
inlining failed in call to 'always_inline' 'void XXH3_scrambleAcc_sse2(void*,
const void*)': function not considered for inlining
...

Refer [1], using XXH_NO_INLINE_HINTS when compiling with -Og (DEBUG_BUILD = 1)

[1] <a class="moz-txt-link-freetext" href="https://github.com/Cyan4973/xxHash/issues/943">https://github.com/Cyan4973/xxHash/issues/943</a>

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../vulkan/vulkan-validation-layers_1.4.313.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
index 63a3aa4ae64..c05a1d87007 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
@@ -26,6 +26,8 @@ EXTRA_OECMAKE = &quot;\
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     &quot;
 
+CXXFLAGS:append = &quot; ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}&quot;
+
 PACKAGECONFIG[x11] = &quot;-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr&quot;
 PACKAGECONFIG[wayland] = &quot;-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland&quot;
 
</pre>
      <br>
    </blockquote>
    <p>Hi Hongxu,<br>
    </p>
    <p>The issue was resolved upstream but fixed in a slightly different
      way.<br>
      <br>
      Rather than carry this change in oe-core and have to remember to
      remove it or rather forgetting about it for a release or two,<br>
      can you&nbsp; get upstream vulkan to update to pull in the xxHash
      change and then update vulkan for oe-core/master?<br>
      <br>
      Meanwhile, we should carry this in WR Linux until the vulkan
      update gets into oe-core.</p>
    <p>This is probably a good approach for DEBUG_BUILD issues in
      general unless other people<br>
      on this list speak up and explain why they are also interested in
      the DEBUG_BUILD working.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250716073233.3020439-1-hongxu.jia@windriver.com">
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#220435): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/220435">https://lists.openembedded.org/g/openembedded-core/message/220435</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/114181365/3616765">https://lists.openembedded.org/mt/114181365/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0aHjYwGNuU1msmzFVgrpCII9--

