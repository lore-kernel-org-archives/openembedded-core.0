Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF17E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:40:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14654.1736325607518831497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31033019da=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5087rN5Q013028
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 00:40:07 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp8a15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:40:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpfAWNUtELLiAsGkwXik6+hUB5PDAiXOlK45xHS49jSuX1/naN5pgXOFLi0MwicqOgOKB6VqmhBpAgU9KcNWx7fG3zQqJGozF8KW/EETfdWw5msV7El55IRmNpANjtg/XluGsnoly0pcF+he01iP3k9OcXEUsTuIUbvi3wpaA75kQUsSCF/JtVonvqMGxflMd+SghKb0BD0wifgGV5i84weCVG/sDATM2AG7Z2J7Hkx2HbaP7jTGq65J4RpDdIoL+NFwswrFjpHaSDgnmjXgjPAh6T3JbLfI2iyc+nYr5qHNptR+O6QbBOIhmFdlVnMbkwm596t52n0DxWgyErA6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfc4Nz7dK/PB9dqIfwQj8AD9i1rURu+CMS/M0KwNBwY=;
 b=Z7I7j4P93TT2n6QLQfl96fymtFCGITpb7hVb89QZfjbQc56/N8NQuOS1WtJkCainn843qoSeq5NFbjCNID4HdXYp0EDHLZXlDItHpkMsoo2tsBPjtwAE1+aGjrJ628/UJ144U0fTTQ6HEH1EhJmTjcBhxwThXOCcOtXBhzu+g65EABvk2pugFI/+Fxp6iue01V027K8OuZN2iH/FbOsmwmaOgwLJdnlysV+LV/JGNVwg1EhhUTN2WhNdUW/lUKe8hVoeQxYzNFZWWf8K96Hu5TcqX41s5UkELaIbKpD9jv/Fs8JSh8GvRy0aC25qxOsMIEeR07N/Tjpg/PLXEMAIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.15; Wed, 8 Jan
 2025 08:39:54 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 08:39:54 +0000
Content-Type: multipart/alternative;
 boundary="------------Bz8nfoaMHCUWzVJhBiX1db01"
Message-ID: <7bee8171-1a79-4234-8a54-464dbe93d569@windriver.com>
Date: Wed, 8 Jan 2025 16:39:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libunistring: fix do_configure "Argument list
 too long" error
To: openembedded-core@lists.openembedded.org
References: <180DE8BF16906A93.17678@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <180DE8BF16906A93.17678@lists.openembedded.org>
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 444f5b99-37ae-4d58-bcf5-08dd2fc005f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlpWUjR4aUd5Q3FqaEdYejV6OWdnSEk4bkM0N1NpYUNZVTdqcG1SYTZYTUhE?=
 =?utf-8?B?dFBjWFB6cUhWbHVPVmg2bkVJM3dsS0cyTW1qalBqZmJuaTBxNGFWZ3FlNHZx?=
 =?utf-8?B?QkxnY1BabVNGcGhwZzBNMllwOW9HaVMrbWNETHB4TTdxb2RKVDcrOFV5RVpV?=
 =?utf-8?B?V0h0d3hkMWhGUzhNMElkdUszRVpwVS9oQ25yT0VuZTZvQS80R0xpQm5JWVV4?=
 =?utf-8?B?NXc3cEt6REVwbmQwbmlqZlhZZG5rTk5CK1dKK1loSzIzS2gwRzRwUHZ5SnlO?=
 =?utf-8?B?Z1VPQXhCMWgzYkY4NkVuaGhDcGx0WEZQVmlzeVVGUmlndTdpTDdPNk5jWC95?=
 =?utf-8?B?U0c3Rml1d212SmpCREJTbEFvTVdhT3kyQUFDOGtkaWxWL2d2bjlBbS9hRWVy?=
 =?utf-8?B?dGRCTEI5bzI5Q2tNdElFMEl6cmdvcnhTK3dsdU5LdEdkS2cvZmFKM3drOFlF?=
 =?utf-8?B?OFBDZisrdlNXYk8ra2pGSzdqZDRVOEE5d001R0ZQcXZMdEZrN01JVk9QU2lY?=
 =?utf-8?B?Y3pUbG9odnI0a1hZdG00ZlJCdzFqa0VHd1VTSTBqZVRlbURoUUp1ZHRPdElE?=
 =?utf-8?B?TGdUR09QZUNGQkxWQTFrdzVWckFLYVJpUjUrbWM0VFYxSVkyQ0tkb3Y2S3d4?=
 =?utf-8?B?c2dyMFl1NTNKT0ZDUi9vU1N6RGNkczlmdVZwVFJTM3VLbWZJS29NdFJRWWl6?=
 =?utf-8?B?dzB1UjlacHp5ZUdWTVAyZCt5dkdLSFl1aDh5dVBNZmFVbnRBTGQ0c1FmZndU?=
 =?utf-8?B?aDhQMm9acUtYdzRFTVVlSnBDRGxyMTF6a0dibEdmZU0vSGdBWmw5TlZ3QjZ1?=
 =?utf-8?B?OC9CN0JZM1Y4UFF2ZDdXYkt5Wk0wU1R3KzRmRHpkNVlPamN5cWFrMmYxTy9v?=
 =?utf-8?B?aGZWbHRnN09KVlpOVkQyNWl3VFlRNGI0a1ArZUk4NXduRTREaXlJa01ueWMx?=
 =?utf-8?B?cFdDZ3dFYUw4aGNtYnk5Slk2bSsrRGpjdFljd0gxQ1RQQjhRSWRiVkllOWxU?=
 =?utf-8?B?bWRuWGl0S2U4OGNHb3NvdWk4eU44NVhtdGd6ajJleDJKSlN6VjdSNGN1bTNS?=
 =?utf-8?B?WGRLSHB1UW9SNHVveld0am5YaWZQdHNVVHJxc1gzYmhKemZJZTE0THI1OVp5?=
 =?utf-8?B?UTErZURtUUY4WmFCN3dmdldvQ0ZMdlFxVXhwVmhyVFNCME56dTVxVXpJNXR3?=
 =?utf-8?B?T0doMUF0bVVqWjVlV3k2Nk5DM3hXeUcxVE5uUWJQZURWbzZqOFNUc2k3ekNk?=
 =?utf-8?B?djZCTUlXODNXRFJER0FRYjNHZDg0eklOQU1nb3FZSGxPR3RpVzRZdmdyY1BJ?=
 =?utf-8?B?L25GQUtPZERqZmlNKzZ2M01QV2JTRHJjT3lkR0pYT2RjeXhiQmRFaGpYZ2FD?=
 =?utf-8?B?UnRCdzhjNVEycmxvcWdLQTJHOG9XOWNnODMra1hab0liZ0h5dENJSHYrdzdz?=
 =?utf-8?B?MnNScllaZE9lblp0K29PSmJiU0cxZTc0OWxscDZXZFdHOERNc2dwb1pCQUdO?=
 =?utf-8?B?NDNpU2FjSUVtR2s3dDNGZnZCcnNDYm9ZS2RUYkdBa3NzYllnZEVpN3JHQm56?=
 =?utf-8?B?amhsM0ppdERvbXk5R1haYVJNSFhrMitWMlJ2UjM0K1lsU3BJMTllMEdEWHpK?=
 =?utf-8?B?T0NYRTN3OHRZYnFxZTNWcHlUMzNJS2EvdXBmelZTVkxZYkJiU3NGcmYrK3A2?=
 =?utf-8?B?d1BOUnp1dzBpNktXTk5STE8zazZKV2prQ2dzSzl6T3g3YzhNWG9XcUQ0dmU2?=
 =?utf-8?B?VW93NjMyOXlydWF6emRlc1IvR3NjVkVHNFFtS3hYcVowSGk1cllSTmJuMzJh?=
 =?utf-8?B?RS85eWVSOXF2ZFRneDV4QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S29XU25HUWM4Uk04ZHBmYThDRm80b0pPQ041MjQ4d3VRdHY1d1dwT0ZuWUN2?=
 =?utf-8?B?c1AyQThOKy92cUQraitqVDBldHUzbHRRYkVMdUJ4S3NrVVUrOS92d1pFR1BD?=
 =?utf-8?B?Y242bnMwOFMvZkhjSEV0Q1kwQVloVHJkM2ZxU2lRYnNXRFJzTEh2ai9raXNO?=
 =?utf-8?B?czJ3Y0IwL1JyWWlCRTNWR1pORldJbzF4SGwxSHNhRmtVWEFZaE1WTFRqdjBK?=
 =?utf-8?B?c1lWYlk2VTJ3bDVoTm8yU25kNHh0ZEZvbTBuVDUxMThOQnl2cXFuRmdTZUZn?=
 =?utf-8?B?VFNMT3J0dHRhS0NQMVEwaTB4cFR3ZUVKb3dmeDlvZXJGVldUZkdzQXM1Rk5B?=
 =?utf-8?B?RGpxWjNVVVM2OHVJb2NCaEdCclJVNEk5L1BzZ0tJZmtKb1BKMG5DWVlYYUFD?=
 =?utf-8?B?R0NFWU9pa1crZVpVdHR0T0FraC9lcXUwQURYSGE1VmxWS2NvWkIyL04rRkMz?=
 =?utf-8?B?VjBTeU1ScHhjUVVSVGF0ZExYNVNKVGduWE9POHk1QzFsQ2NzaXFvQlduLzRt?=
 =?utf-8?B?OWtGdXA1NVg2V2sxYVRpSlMwelVWT28wNEFMK09Gc0RYVzlDc210eUVKRVZh?=
 =?utf-8?B?TGxRcHplNEN0K1ZsNTRsQmFxRERvTEZGTXFpaTFRaEhYME5UYktHcCtHTjRB?=
 =?utf-8?B?L0NFUWhISTJpN0czNjcvdUpJbnc3VzVMTEc2YnFBQ2tKS0hYazcySm5ENGFw?=
 =?utf-8?B?eWJyRW43RitqaHpiZlFTZXRuRU5sUGVMY2JpNTNYL3A0UkxJMS81RDBOLzkz?=
 =?utf-8?B?ZFNnclJNRHdQb3JrK2JoK091b2pDajliMVJMUmJqRmdkWGhkU29UTFB1TWFo?=
 =?utf-8?B?bkU3LzZIaTE5dk84bTByaHV0WkFXcTREUyt4SFd1b0Q5bUpGQy96UHJMY1NB?=
 =?utf-8?B?K2VCZ2tIaHdhUFFvRWxyWk1tcUh1bUk1Vm9jNU9FN05WQWtySWJ1aWlJdzQ2?=
 =?utf-8?B?eWlwRXVyVk11bzNzbENPYVlOU2w4L3doTjRNRVpHQ3Aza2JDU0tmT1ErcjlE?=
 =?utf-8?B?eVBnTTJzS29OU1FYVEtmQlhvY2Z2QkVxWDNENGRVYVd1cUJlYVZuT3I2L1Rp?=
 =?utf-8?B?MGFncWhLR0JaUUNqeU9UcUlpbk9DTWhLcC9NWnFCQUhsb0JhbE14OTI4WnlZ?=
 =?utf-8?B?aWhQZHNhQnc4OExIbzF2dEpqdkxUSFpyZUNGanVvVXJ6aFhuWEd0djBHSTRk?=
 =?utf-8?B?SThvVUN6OTExa3o2WEFMbENCWnNHVTQyK0FURDFaNGxpSjc2TWlGdkhxMzJn?=
 =?utf-8?B?SE5XSVhNS3VFWDlGOUZNZ2lORTRRdEtSTlVJZGRDWVdyWCtHMWpGS3FBMllG?=
 =?utf-8?B?SXVIUlBiQWlMalA0YWQveXZLKzBhWmlPOWZOWVUzQ05NNWtrSVJUOFNhUHc5?=
 =?utf-8?B?N3luS0VTVEVURFVvb2RZWXVLWHlXTC9WMTlEcGFiS2J2d3V2cFdRcTB1Q21C?=
 =?utf-8?B?Y3phL3VhNDllOGQxTzhuZXdtWVZLZUhpaGZ5ekVQWjlDNjZlSnhqUFRIb3hr?=
 =?utf-8?B?TjZhNzRUOWluZ24yY0owMDBteG5tK3d2Y2JFUG9SZ3ROOVpxVmh5Z3lWU3Ni?=
 =?utf-8?B?TTk5eFd4K1pwVm0wSzA2NjljRWdpcnYvaHU1V2NBbUtUMHJrNDJnZk1RMHov?=
 =?utf-8?B?bHQybndmRjMxWktweER5cTZHcWtwUWFYR0dYdUdBYzlLUEtmR0NubjNIbkJy?=
 =?utf-8?B?Q0FiamVQaTBjbFN0OS9rSTVFbFpEblF0OXFuK0NHT1NKemd0UW5XMHoyYmMw?=
 =?utf-8?B?YjE2ejJvSTZYT04vbXp3WkxMcHNCUlRkLzFCVHZidjY3L0NFa25xZTRkMG9S?=
 =?utf-8?B?a205WVJYTUV5cm5xbmpWTDRhOXNlcmhWOWlVT3MyZ3QvNHIxR3owUmtJMWc5?=
 =?utf-8?B?N0oxTHJXanRwSmhJRitmTFpnUmphczVjVjk3NmtERElTYzZoUmhiOVRMMlh2?=
 =?utf-8?B?dEFFekg4WG9KeW5OTit3WEJ2aVB0UjI0dDduSVFvU0tmWTcyQnNIeDJRY0xQ?=
 =?utf-8?B?V3lsSmEreHpyeUsxbC83QVhWMFR4bGZWSEtITDNrK0dEMWZycmhhWWE4Zll1?=
 =?utf-8?B?TndxM295b3dXWjNLVlZFempPK3BNcGpMVnVZeCtMYVFKaUVReXRDOFpEMTBn?=
 =?utf-8?B?TEtEaEZ5VStqL0pIemtEYzRtSWNWTWFQMVNacU9aUklZYUp1ZUlRcXlmOHNx?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444f5b99-37ae-4d58-bcf5-08dd2fc005f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 08:39:53.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr46/j82xboxHAP/pZCMGY5bnmY8cH1zy2eLEnPF+OZ1ts3oT1xvssyVexC2Mt/rXCp9JiuTFuuOT2gSb11CBLNzuG1u1L5KDT1nB5MInUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677e39e6 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=ffpA48qg7jfxx058qR4A:9 a=QEXdDO2ut3YA:10 a=d0Yrwc3F8cFwlIZiQdcA:9 a=s9V53I5j7uP0zHA6:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: makSKdRDTq7kVy1S8YPKTpk0r2wn5FJB
X-Proofpoint-GUID: makSKdRDTq7kVy1S8YPKTpk0r2wn5FJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_01,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=934 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501080069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209521

--------------Bz8nfoaMHCUWzVJhBiX1db01
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 12/4/24 15:28, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> libunistring uses a lot of m4 files, with acpaths set to absolute path,
> and the TMPDIR is long/deep, for example when len(TMPDIR) = 350,
> do_configure failed with "Argument list too long" error.
>
> [snip]
> aclocal: error: cannot open xxx  Argument list too long
> autoreconf: aclocal failed with exit status: 1
> ERROR: autoreconf execution failed.
> [snip]
>
> Let aclocal use the relative path for the m4 file rather than the
> absolute would fix the problem.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-support/libunistring/libunistring_1.3.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/libunistring/libunistring_1.3.bb b/meta/recipes-support/libunistring/libunistring_1.3.bb
> index 08531acec10..3b6dd61a34e 100644
> --- a/meta/recipes-support/libunistring/libunistring_1.3.bb
> +++ b/meta/recipes-support/libunistring/libunistring_1.3.bb
> @@ -24,4 +24,7 @@ SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
>   SRC_URI[sha256sum] = "8ea8ccf86c09dd801c8cac19878e804e54f707cf69884371130d20bde68386b7"
>   
>   inherit autotools texinfo
> +
> +acpaths = "-I ./m4 -I ./gnulib-m4"
> +
>   BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208267):https://lists.openembedded.org/g/openembedded-core/message/208267
> Mute This Topic:https://lists.openembedded.org/mt/109915999/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------Bz8nfoaMHCUWzVJhBiX1db01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 12/4/24 15:28, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:180DE8BF16906A93.17678@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

libunistring uses a lot of m4 files, with acpaths set to absolute path,
and the TMPDIR is long/deep, for example when len(TMPDIR) = 350,
do_configure failed with &quot;Argument list too long&quot; error.

[snip]
aclocal: error: cannot open xxx  Argument list too long
autoreconf: aclocal failed with exit status: 1
ERROR: autoreconf execution failed.
[snip]

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-support/libunistring/libunistring_1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libunistring/libunistring_1.3.bb b/meta/recipes-support/libunistring/libunistring_1.3.bb
index 08531acec10..3b6dd61a34e 100644
--- a/meta/recipes-support/libunistring/libunistring_1.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.3.bb
@@ -24,4 +24,7 @@ SRC_URI = &quot;${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz&quot;
 SRC_URI[sha256sum] = &quot;8ea8ccf86c09dd801c8cac19878e804e54f707cf69884371130d20bde68386b7&quot;
 
 inherit autotools texinfo
+
+acpaths = &quot;-I ./m4 -I ./gnulib-m4&quot;
+
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#208267): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/208267">https://lists.openembedded.org/g/openembedded-core/message/208267</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109915999/3616873">https://lists.openembedded.org/mt/109915999/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Bz8nfoaMHCUWzVJhBiX1db01--

