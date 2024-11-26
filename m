Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F13D3B98B
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 12:35:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45113.1732624520954526304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 04:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1060d39f8d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQBpUZ6015097
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 04:35:20 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433b79ayw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 04:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDyQ/9dYuQCY/AvlcJBAYDbw5L0kkt3W2dYopzt+Xbbx+gVvIs6/QSfjcXc11wT6urqkYMARFGEIvQJMBSiEAYmOkHOQ25IJF+LG+vNQuPSA8JJHjJGRVhqe0L7OhAcEnQkTTrED80/5PFECJMG0QMtpyRQGOMpPQKbKJanBsLvr+T9q3HZzgrU6P5BlTqMhS/4afiCGByGS/p/8ha/vr6mHsMqFrEWwVMcdHO+dS4oxgopxm+zcEv2M3AeROUfNnsMCWLe0e2/nuQKTJAzk5qC2hdj28Z3rNFwd2a6XbQzmHru+RBsZLyTeplxhuPCnDQ1Ohr6fhTWovRE+th1j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KbwDcaq/W2Ub7/8+ELQo1LZUuTQpyiBKXoVbXGxPH4=;
 b=xsSJOOVadG1zslWrzZX/K99CYsNH58TfS+cBWd43BdJthjWoV3RiuFim1uKpIoF5rttAx1hQZNXzrX2EpZ2A55ton0KQ5DGJwLXsvqaHub32rjX9uRAMBm+iU84Xxzna5XJkSVjxaOst/FUlxQVRQBZS99APinp+5XpJ3Wbvf1DkATjIH+xfjGTDJuMWWCYPtSmUaEeUOOelc3+8r8sdfzM8WfpkiELlGU9Oyd+jeItbY9kxRQpCmhCzX0DDyTvisD0LQA1Rms0zPO+nnMr87Q6p6gl2TknrZJCFfLJRSXgdhX748y8bqOnWorNRStq1iulNB4MNWfWPM+Rc/1dI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA1PR11MB7728.namprd11.prod.outlook.com (2603:10b6:208:3f0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 12:35:15 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 12:35:15 +0000
Content-Type: multipart/alternative;
 boundary="------------o7W1XNVolREQMoxqwj0wDuP9"
Message-ID: <8848f492-0527-4db5-80eb-c7b49ab05b61@windriver.com>
Date: Tue, 26 Nov 2024 18:05:11 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Naveen Gowda <Naveen.Gowda@windriver.com>,
        deepesh.varatharajan@windriver.com
From: Yash Shinde <Yash.Shinde@windriver.com>
Subject: rust: Updating to v1.81.0 gives errors for multiple shlibs in
 do_package
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA1PR11MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 879c1f25-aa1e-4c96-3ba4-08dd0e16c747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUg4Y2xFY3Q5UjdLK0Z2WVdlWHV5eE1PUDZqQUhuTVlkVkpVMFh5L0M3ejZD?=
 =?utf-8?B?azA4MVVXeERYeXUyeklpSXlxeDZ6RVptY2ZNRWRIaDJHMkM0ZTBTZDAwRkV0?=
 =?utf-8?B?cVpHYU5HK0t6UXF1QnRROE1zS1RWM3pPbHNpZFNnL1hUSVp0UlJCYUMydmY5?=
 =?utf-8?B?ODZnMEQ4ajNwUHJ1MHlOWVlrdDBnVStHc243Zk1yazhYK0dNVllkUDJWODlW?=
 =?utf-8?B?Q1I5Sk8vSHp3SGpsTHRuWTNnblFsbGE3N2NrcHA4VHZTYkt0L3pzTUpsNHpx?=
 =?utf-8?B?MHdUSmdWRDdwU3JWeC9NY0Z1SGhNUEdJOHp3d25rQ3dHWnF2alJubnk3b3VX?=
 =?utf-8?B?bytqZ0k5ODR0Ly9aT1EwWlc4YWNaMkplc21PMWlBa1pPUUVnN2JRcThTNTI0?=
 =?utf-8?B?ODNLZnpETWtnSVNmc212SzgxdDFQdGw4NHBQbWhTVHRuK2xOemNySEhyZFJ2?=
 =?utf-8?B?a0IvbWY2NCtPaHBnTERqc3h5OFF5TlBOdXpFclBkaTRlckZhTVdnaE9uSXNY?=
 =?utf-8?B?SEc2SEZDWU4yQjVKNU9LYVArVjlDdG9mVW5sdUdieStHOHloSk4xQllUV2dJ?=
 =?utf-8?B?d1lTUHhqTm9MMkdCZjZOZmRXTDhZRmdSVDZ2a2IrVUNFbVY1V3dPNVE4a2t4?=
 =?utf-8?B?QnE5ZU5JV0g3MGJKOXkrMytLK2Y3am1mdlkvVjlDVnNsRGJkV0R4cXFOQ2NJ?=
 =?utf-8?B?cE1mNWUwdzVtUzRLelVvMXNMeHZ3ZkhETnN0KzQ1K3JLK3NMZFZ6bDBzbi9U?=
 =?utf-8?B?NkJyZUZsd3JqQ0JHUmJkN1llUFlENEZFc1ZBdVJtN21VTjlvVDNxeUluczlr?=
 =?utf-8?B?MmFOb3ZKQkFybjZ1cEZyb3VwdVdlL2RtTnhtNUhoMitOYXM1dDZ0MW4zT05L?=
 =?utf-8?B?cms3SjUyandWN1l6eElWUXNLSnFqWko5S2NuZGcvQ1BGTFJianhwaVFndjV0?=
 =?utf-8?B?YU5PTXBMa0hpdE5oK2JTenU2bWRLYUtKb2VYaDJrM21VV3A3cEJ5MVY5MmdC?=
 =?utf-8?B?SHJ3UlRFM1BoUFd6amRiaUhhWmFhMjhESkREL0RNZ0ZJZXRIOXVOcGtSNE1C?=
 =?utf-8?B?bEI1QVZ6T0ZHYWE2MGJGZXRFOGxnc3h6TXJqcjNYZ3BWeUo2Y3B4d0RGbFV2?=
 =?utf-8?B?RXhjOFF5VUZObi9xb0oyem0vaUNyMXBUc2FNbkQ1S2p4OUx1VUhuaUhRa1RK?=
 =?utf-8?B?T2tFTUw5V0hNcEhydU00eHBhaVY5SE90R0oxWktoSEdkTmorMmM1b2tFQVZ3?=
 =?utf-8?B?SjFMZFhObElRMElMbFVueFRFMkVST250V200STBDWlFhVlJCajN6TGVjSzNC?=
 =?utf-8?B?aGRkRnRWelVEWVc5OFM3dnVxR1FEbkk5bkIzUHUxa2lvbmVhQlEzbC9KRElq?=
 =?utf-8?B?cWF4akIyVGJuZFZyL2xieW1McENhUmhTci9WakRxOEFUa3BFdThodjVGWUVH?=
 =?utf-8?B?bXhya0NjWkk0YkVXbXUyL0dJWnFsWFZGdDlQcFZPQ2pYOHFHTENpMTUwMTJx?=
 =?utf-8?B?RUtJVzQxS29ZcEdycUk0NSt6b1ZMOHNPQSthRFdBUmlDc3B0T2dQZG1nS0Jj?=
 =?utf-8?B?U1VjRnZMSnBId0xpNzF1WjkxQmcxbVdKeXZrUnprRi9Zb1VaVzkwRXd5Z1RJ?=
 =?utf-8?B?RWdKd0ttNEhXOEFtc3VZYityWVZ1bkhMS1MrczhodzExbEVBY0s1UDdrT2Jo?=
 =?utf-8?B?SFV2dGI0eGhIODdsNjdsQ2ZXT0JldnlMaFl3NTcxMXoyK1kzRE1TRDVtV21F?=
 =?utf-8?B?RzQ0SnJFSytYV3ZnZldkbVl3bFR4YWo1Q2prZWNwcGJ2c3NpWkNWR2hOUUZw?=
 =?utf-8?Q?dvYKSugpqeGKL2zzlZfEK4L/+rm1ZAR2/PPeU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFIwL2RycGw1NU5NWFd5QjB5VXZCWExTTHVyQVo2OHpPQVRIYUtNUWN2Tk5r?=
 =?utf-8?B?dC8vSEtNZEp6aWhkaU9pckNQZGFNK1BVanZEZDJHemJqbWl3RldUUkJxem1Z?=
 =?utf-8?B?d2FUM1NXNy9XOHN4TDhleTZwaGRrcWhlaFBNVk9BNmx6czJYTytnaXhiSDlx?=
 =?utf-8?B?MjJaNTBVU1RrQ3VURS9vUnRxQUZLanhTMmJ4VVZLdS91Q3QyUkNPdEpjRFRy?=
 =?utf-8?B?bW5YRHU3Nys1ZUdwNzljOVYxcE8yekRPZGhvWjFheFEzU0FqSFlKVE5FMTVj?=
 =?utf-8?B?d0MydzVJQUdSV2xhZEQvNTJHVTltRENKcmlQZXVVaGdtQjlwMlphTUNxb1p4?=
 =?utf-8?B?UDJOZTZWUlZSYnRhNUdYWkdxazlVRW9OL1M0WFlhN0FNTGlzZGdjUmc0U3pq?=
 =?utf-8?B?TEtZTStGTnE4dG9OVGMxdkZUM2hzMEkrRGtBV0U1enlkTWlsb1ZKejl4TTdY?=
 =?utf-8?B?TXdBOVk1ejdHWjdLTXpyTTljSGU1VUxaaW1yTmFYd0pzRk5jT1BpNGRUc1Vv?=
 =?utf-8?B?bnFINkVvYWw4TzVraU0xRXZoUVZ6dStvOHFVRjdUU2NjeGY1dlltZVh2Nkhr?=
 =?utf-8?B?T3M2Vm9KVDRUY2FRYllHQm1VMHZuSUhzTEROaEk4S0x0NHk2ZVFGdlBERDQz?=
 =?utf-8?B?VlEvTTdkYVR3dWk1RG1PSDFxMmZvT2x4YitxajBKQnQ3VDZsWTIyaStsSEhP?=
 =?utf-8?B?djg0VHAzZ2tFaEVJVUkvckNtQVhMcVBwOEdFRmNKNGc1M240dmpxV3JWRC94?=
 =?utf-8?B?QzhOYm1ZY2ZEQUY5a1JJNnhxbXRQMk9GZzRNRGRVMDZvZjZFT09aL1QwOEh1?=
 =?utf-8?B?UXpyREs2QkdjMnhJZ0VNL092amhRbGJ4aUZMdGljU2kxZmoydXlMNFRJQmFr?=
 =?utf-8?B?dWhIM0V4aVJyNnRJME5WaTV3dGwxTDl2T0JWdktUOWFOZ0RiRUlKTFhOZS9I?=
 =?utf-8?B?RDF3TFMvTGFiNnYxdmh4RzVJK2E1MVo5RHRNR1d2eWltd1hLY3FUM0lpMTFS?=
 =?utf-8?B?K3Z2dlFEZWlTU3ZOS09KYURhZWRDeXEycTVxWGVNSkhDRTB5QkFzeTRPYTRs?=
 =?utf-8?B?eldMVnJNd2piaGZQUEVLTUtIaFYyUnJDZWxPazRlMmprVjNUWXpPa2FFVDdS?=
 =?utf-8?B?M0cwaThPY1pZTFZKcmE3RmhsR1hWblhORXRwcVJENTJPUmZnajRWcDF6OFlN?=
 =?utf-8?B?UC8wbUVXd3U4dkRUQkM2UXhNOVVsUHNKKzk2Wkx2YUdkYTNhbWtCOTAyeU5k?=
 =?utf-8?B?SUk2M2xoRXhhL1lwYjYzN3pDU1JRcDdSbTJXdG5tR3NwMWRYajdSUnppK3RX?=
 =?utf-8?B?VEVOT1dRUEgwQWc3YnNBaVUweStPdnZFUzh0eFdkS25lVEpwbHlLZFlZSXRY?=
 =?utf-8?B?NHlMZ0g2cHNRVlBpOXZJRUNTMlRrZmlaLzFIL1ErVzFGdWtvTXNXNDdBOWNw?=
 =?utf-8?B?amYyQ1I2YjR6allXWkoxS3RhU3czaTdsdHNkRHJDWjQvMFFoV1plZWtjaHdN?=
 =?utf-8?B?UjJsdDdNcnBaMUJiZ0ZqdlpyOXFuOUN5Vnh4amVab2xVK0pNVEltS1YxdUox?=
 =?utf-8?B?SkR1KzB1cGNXSkdhTHpuUk1sTGNMZ3JiQ2VaKzJQa2k1aG5HSSttZU1wRzlW?=
 =?utf-8?B?dU51YU4rRlFXL2twb3JnRlZMY3p6Szl5SVAyWC9WcTFBM0tubUM1TFVMNFc3?=
 =?utf-8?B?b015SGRvZWlqanNxUzNhSGtRaG5XMC85dXpVNUFVRmdFRXhweUc0ajZ0K1h3?=
 =?utf-8?B?UHNHODNoMVRlelRGaXg4S1IyYm41eDZQc3dZQmEvMjFyN2Q2N3UyWnQ1RWJw?=
 =?utf-8?B?VGtmUStteS9CSnEzWlc0eHp4c0lyTGdQVGMxY05zUm9zQm9Jbm9VVDFXTlVO?=
 =?utf-8?B?UU5kUTJnMFZMaERTOTNLZjl0RnNvQTVDQjBoQnNWM2JUdWJ2SktPRXJPdjcz?=
 =?utf-8?B?WmM5U1U5cnFFdWpna25sSWpET29ScXc0UTZ0azJBYU0yUjNUdmtvTGh2bitT?=
 =?utf-8?B?Y1BkRHpkMC9WdmpWUU96UDhtRG1tdm5mbWI5NGtQeVEvcFpmOWtzd3ZjVVRN?=
 =?utf-8?B?aDNXL0FHN1dza25tTFp0bUgyQ1dsTmVpZHd6VWgrcTBMR0tZdjZMNktqc3BR?=
 =?utf-8?B?SzJWRVFjZHdPVXJEbEVablFwS1FUekxHMUZDNjFPOWwyTkIrMFhhN0ZqdEVF?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879c1f25-aa1e-4c96-3ba4-08dd0e16c747
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 12:35:15.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuMcujnN01Z+VT3EhWxLXpfHfLfdQvXsw7y2uPFC9OEqNh/q4TPfs+nbu69VtnWPKvoB2SMAcDyjdlNMAtdqKU3XtEPSq8Antk3X1EK5nHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7728
X-Authority-Analysis: v=2.4 cv=atbgCjZV c=1 sm=1 tr=0 ts=6745c088 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=qhlJWnRoo2NVvU_yCxgA:9 a=QEXdDO2ut3YA:10 a=bwQzbW4dEnmcWXTpZI0A:9 a=jxZ_fxo7pnyrRF-S:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Ea2yuR96Ez_gPuuHTC0W6LvnlT1jgAol
X-Proofpoint-ORIG-GUID: Ea2yuR96Ez_gPuuHTC0W6LvnlT1jgAol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_10,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=388 bulkscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411260101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 12:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207850

--------------o7W1XNVolREQMoxqwj0wDuP9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While updating rust to v1.81.0, "bitbake rust" fails as follows:
/
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for 
libstd-20c3de2d9292cd03.so: rust, rust (used by files: 
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustfmt)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for 
libstd-20c3de2d9292cd03.so: rust, rust (used by files: 
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustdoc)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for 
libstd-20c3de2d9292cd03.so: rust, rust (used by files: 
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for 
libstd-20c3de2d9292cd03.so: rust, rust (used by files: 
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for 
libstd-20c3de2d9292cd03.so: rust, rust (used by files: 
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/librustc_driver-fc36770e343ef852.so)
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for 
libstd-20c3de2d9292cd03.so: rust, rust (used by files: 
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)/

This kind of error is very unusual. So we investigated more and it seems 
there are multiple shlibs generated for
rustfmt, rustdoc, rustc, clippy-driver and cargo-clippy packages.

The rust recipe has some /do_install /tasks separately for these 
packages which might cause this error.
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/rust_1.80.1.bb?h=master#n276 
and the lines following it.

We suspect that the issue may be related to the Rust recipe, as we are 
reinstalling some packages and probably need to remove them.
We are further investigating and keep posted.


Regards,
Yash
--------------o7W1XNVolREQMoxqwj0wDuP9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    <br>
    While updating rust to v1.81.0, &quot;bitbake rust&quot; fails as follows:<br>
    <i><br>
      ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers
      for libstd-20c3de2d9292cd03.so: rust, rust (used by files:
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustfmt)<br>
      ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers
      for libstd-20c3de2d9292cd03.so: rust, rust (used by files:
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustdoc)<br>
      ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers
      for libstd-20c3de2d9292cd03.so: rust, rust (used by files:
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc)<br>
      ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers
      for libstd-20c3de2d9292cd03.so: rust, rust (used by files:
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clippy-driver)<br>
      ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers
      for libstd-20c3de2d9292cd03.so: rust, rust (used by files:
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/librustc_driver-fc36770e343ef852.so)<br>
      ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers
      for libstd-20c3de2d9292cd03.so: rust, rust (used by files:
/poky/rust81/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo-clippy)</i><br>
    <br>
    This kind of error is very unusual. So we investigated more and it
    seems there are multiple shlibs generated for <br>
    rustfmt, rustdoc, rustc, clippy-driver and cargo-clippy packages.<br>
    <br>
    The rust recipe has some <i>do_install </i>tasks separately for
    these packages which might cause this error.<br>
    <a href="https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/rust_1.80.1.bb?h=master#n276" class="moz-txt-link-freetext">https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/rust_1.80.1.bb?h=master#n276
    </a>and the lines following it.<br>
    <br>
    We suspect that the issue may be related to the Rust recipe, as we
    are reinstalling some packages and probably need to remove them.<br>
    We are further investigating and keep posted.<br>
    <br>
    <br>
    Regards,<br>
    Yash <br>
  </body>
</html>

--------------o7W1XNVolREQMoxqwj0wDuP9--

