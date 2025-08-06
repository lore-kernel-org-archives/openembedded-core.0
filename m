Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98ADC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:14:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20135.1754468081262050705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0313fa0978=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5766RROj2829854
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Aug 2025 01:14:41 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7gkrg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 01:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0DCxT2ZiU4tB2RfPL54Ws0s6KTrtw+BNyuO8N6IZWQOcu2yWhNEgaz2SLrk3OshYruuUN6XdMQyvr4mq5UgP3na9XWXH4EmNaycjbHuwB6QIsD2M4gC9MbZAp6Qxlhv3hURzmABAQbAcoMskS4M3v0xNeVlJINFvvvAp/gw/VsqczIXzCHR7E6ap82gxzE539wgf7n1jg+sGCQEu6lPfwUiZqKZnpmhVd+i7PCuaeQU4hzKcAu/wKPToHxkCb4EXKRlX1yQS+ywR2XfMH2gxjy3Zm3BoWm7NY2rfZP3Fn6LymMth98EUHQJK0gypN5zgMCisTx4VZQpLHQgrFTIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKL6MCtuohwmksOj5LlkdgdMc3XfeUnK7JfEGv61DBc=;
 b=CJsy7UhdF1jlvEARnc6DADuK1t+4Dm5UBPOD+jhRdbhNHE3xA1psMGuRT/o3ukaiqFAq9hFVgkL6wsqCz313o9VZFUb7Rd1FBP9A6lY82mMFjCKL/9Mo/SGoyB3nAxNA2YT1V9EqyBuVF+AKRkiaP5Ta9W8FkYXJ8ZBxIPfy5Yc0DkzqhumtWrygJRJ6ms2cjBj0qXgpWCes8UHgah9qxWHjxJaxcN00I72XhRFv5fZd9iReKR1bqN3Yhb8qJabRIGrFHMFDKlCYVgzteXpS9//04UpBL7B47o3NTXzQ4Mto5ee1MTodgPYqtQrN4usGa8haQOqqSVC04ynBILMPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 08:14:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:14:38 +0000
Message-ID: <08667a3b-822c-459b-977d-75ab8ee9eb1e@windriver.com>
Date: Wed, 6 Aug 2025 16:14:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [oe][meta-oe][walnascar][PATCH 1/2] protobuf: upgrade
 from 5.29.4 to 5.29.5
To: openembedded-core@lists.openembedded.org
References: <20250806081208.2620835-1-Qi.Chen@windriver.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250806081208.2620835-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4cd0fa-ee9d-4a0a-d459-08ddd4c14968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjFSZ2gwalphYlZLNXVpRE5FbjlKeUJCbDVFaG4zYm5hZnV3OThJMXN6emQ4?=
 =?utf-8?B?aGc4UEF2MGRJNkQya1F3czM0bUY4NjNnb0RtK1B3dXVKUXFlOFYyN0RTdHFK?=
 =?utf-8?B?MHY5N3Jtc2RHOVZZdndPeDFqWjMvUkY0M0RtUElTWEtiOXdWTlR3NlBnUThN?=
 =?utf-8?B?UmdCeUg0cGp4bUtLS0NSdE9OT01sc293dmRkNUc1L240ZVVvdGtiNWkvZ3hn?=
 =?utf-8?B?ZTY1OFlwUnZDQ09Vd3VyQWNmRzhrRFBvODNDdDRmejc5VXlNTytTOHF3bXZU?=
 =?utf-8?B?WkxLTHVubGdHTzJWK2NyT2NjNmo5dk5BT1VWTVIyckZoNXFIRFJhUktPM3hH?=
 =?utf-8?B?M2N1OFV6MHFtUE1CNUpyWVJkVXZNVS9sandmS011Rmxua3NiQVNnZ25YelQv?=
 =?utf-8?B?SEEyNHpIK1RWODAzcFdrZVpKT2JzNnI3WnkwNDZhTFVVbVBBZWFxV1pHVnd0?=
 =?utf-8?B?NUhWaU9rQzUxUDdBWmdMNnpaSnpSU0p6L3VFMXYvNmthcHpSYWxUbXVqa3Rt?=
 =?utf-8?B?M09PR3FicjZsRmNzT1hJa3lPc0lBRXladS9ac1doZzJXU2tTczFEcnR4N25q?=
 =?utf-8?B?SFlaUWxLYWNHWmNjMEJIbFZ1SGIyd1JpeU1EWFljVmc1Vm5haTJqT0s4WG91?=
 =?utf-8?B?VmdMRFdPN0NVa1YreDZnQUZzRFdOTzV4SkRPQ2UyZXZGTGI5NWN6RXpwMi9a?=
 =?utf-8?B?MGVBWUpjWUUwakZsMHVvdTY0emVMNi90OW9xUlRQNFViK3IxbzVpNXo5MFla?=
 =?utf-8?B?Qms1a25rTVFPOUluQVJHdG14VVFxc1d0UGxsa1FKUjdHZ011VGFvWHBPbVhh?=
 =?utf-8?B?UUZtamV0dTlyM21VYXpHTGIyTVR5SmRVZWNmZjZnL1ZSK05tdlYyZkJCTUFU?=
 =?utf-8?B?QVFmcHU3R3NnUXJRa2lvSmRIUm9kVWlBeDllNHRrcjlHNXZqVXQxODZVT1BR?=
 =?utf-8?B?d2N6VitzMmtBTkQ5VWc1cm1BU3hZRjE3TjI5aVZ5V29rcUxqTG5ONkovSUZB?=
 =?utf-8?B?cFVySUlWWFd6c3dURTVIZEk3ZG1wUTYvdC8yWG8ybW9ib2xxN25EMXNPbTZs?=
 =?utf-8?B?VG5ITFpwMmZLYnJCVERRSEl2NkJFYkZ6cGVuVFZGa1pSdFZwSUtnQXYrSDlE?=
 =?utf-8?B?cFR1SEl1U0RTWXBBUnRUN1EvNTNuV0lQMnJ6TTFZSlNCQSt5dWNhM3M2MUgw?=
 =?utf-8?B?MXBFV0RLSmpxUjZnekRDQ3ZZWVRJY2VDcnV0SThlVUZFY3gzcjRLNC9WMkF0?=
 =?utf-8?B?Z2U2V3Z6VTNCS0FVVkt1aUplZVRCdU5oT3VlRlFsVWFEUXFXK2o2NEZOZ2RE?=
 =?utf-8?B?dWZ5Yzh4SExIQWl5dU5sYU5BczdOTjhiMG9MOUZHQUlPSStNY282c3Y3bStM?=
 =?utf-8?B?ME1UUUdxKytJbWFqOWpFYWhTeDdYQnduUzE3V3RQbTlpeDhMNEZJRzl1VWlI?=
 =?utf-8?B?eGo0blFhR2JCbGFsaEZ1dVZGRU5VTTFTaFQ5ZVRpSlRvVktmT3dteGJneWM3?=
 =?utf-8?B?SnR3SnRYbWFsWWYvbVA1TXFhTE9mbWNURWFTdzdCUExXU2sveHUxaTU5Qmlm?=
 =?utf-8?B?cnBJQUdsazZBTzBMMklSU0ppU09CTkZiRGU2M0pZWXVjT2JqSnB1cDFSYkUy?=
 =?utf-8?B?TVVhU0FtSjdmQjhHZVdWN1p0NGNiUko5bUhoczlBM3pzYVM2dGRRVUh5R21i?=
 =?utf-8?B?TUtzc1ZEaVBSZHNETmV6QnZPN2RMRmlZaHN2THdIMzZybEdLcE9ub2VOemN5?=
 =?utf-8?B?UWJrZnZwSDVxdXNRMG44Y2d5c3AvQ1Z2bVYwdmJOaUJCR0xNZUg5THR2UUV5?=
 =?utf-8?B?L1E3V0N4QWY5RXJjNmZ4amo1WHZZbGRIYWFZVmZRUkpwSXBkZjFUVGd4Nmp5?=
 =?utf-8?Q?9bg1s2LyVcuxI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXhsTm1tNitmbE84RW1UazRxTUIwS0FjdlFJWmJreHd5VVhtdEtQRjNJcE1I?=
 =?utf-8?B?cGJBS1o0RkVZY1VQUEc3d2h2NTFCcjJReE9hL3ZwNjNid04xQ25IeC9zU2lG?=
 =?utf-8?B?ZldNT3Q1eVRYL3N2YzNyWTNhNWwrbzF4RVBYWkhwQjJwRGFCUjAvM2kwSWNh?=
 =?utf-8?B?Y2JHZnJPZGx2Q1h4NE16YWZLNVZYaWQ5SUhlRUdnVU1XNGFVMFJPdGtSVzRm?=
 =?utf-8?B?TFp0TFJTa0FvMnNhZHR1b25VMmc5dmRqMkxKM1VZVGtUYVpmK2dpdXNSU1NG?=
 =?utf-8?B?RlhaeXE3V0hKRkxjcE84NXhSOS9ZK0lBVU1JNGVmNktuVE1lQjdUVkw3cmlu?=
 =?utf-8?B?aXhveGptWmJHY2U4SHJuK3dFVE1RWEg3R3dnM1JUU2xXanFMeXFuTmUwbXJZ?=
 =?utf-8?B?c2FXT093czY3bVZERGtQWnJnS0ZsUDNDT200MzNVbThtTzc0QVF5bk1JZ3Bx?=
 =?utf-8?B?dTNici80TW1yVUMxcFJLQ29IeUNTN2s1Y2srdGlUd0Y2SkJYSW5YTERJUGlY?=
 =?utf-8?B?WExueGtuaktMaHl2SUJZVHpMRGYvbjFFL05mMHR3TEZteUxocW5NUWJoSWtC?=
 =?utf-8?B?cFRnR2UwcDhaSzhJNnJtNWRVYmlTaFNnUUkrY1d1eXVWeTE4Nyt6NUN6aFNL?=
 =?utf-8?B?ZjdGemFibEt2M0tLOHVrdVRsYnA2OHVWR3dORzR2SmZ2YmI0Q0puMnJPT3Jp?=
 =?utf-8?B?bjdBMlY4cjh4aFhjMmgyV0Z3TnphWVg3elZRa29WMlBycTlvb0dmbDd3SGE4?=
 =?utf-8?B?YTFIZXlnNEdNZGQzallzRXprdnlxMEJ1V2JRR3dxSVAxTHhSZWVXY3UxSStD?=
 =?utf-8?B?VVBWN0t3N2hGTGJ0bGNGcmF3bUp5UjRROWtOODJodjd6bFZvZ2JodFlRSjla?=
 =?utf-8?B?ZFRuTTFIak9nWDh5ZlJMV1F6ZnZPeFJuQTE5aDFPbC9zbDYzR3ZJcHZaclVJ?=
 =?utf-8?B?L0xpQjRsOTMxamsyQWVGZlFSYVF3V21SRVhYTjMvd1pFTHE2bzNZOElkYlhK?=
 =?utf-8?B?TTRXYUZJc3B3UXZuNVFHMHMySTNVV0lQdlkxUDJnMVd0RitFS3NoTU5LZTBL?=
 =?utf-8?B?ZDlQNG14WnoxMElwZjBDVXFFN3J2d0JHQ0lhRmovazBidVNaWVlUVXJoK3Vv?=
 =?utf-8?B?RHNyVmNLc0xaK2VIVStaUWxVTVlVRDh2REliMUxxb1BPQ3kzU3A3M3k4d09n?=
 =?utf-8?B?Uml0VUhscm95dTA5SE11RnVsOTd6UWVaTE1LMjFmaFRuckNXa3VIQ1RlcURv?=
 =?utf-8?B?WnN2Qzl2OFpaWUtBb2JLb3RsYy9ITXMyb1N0eURoVjY2akdqdVNQWndFSlNt?=
 =?utf-8?B?SkJhTE15Rm80U1pKVDc4dW41Y3lIR3pabThmb3d1SUI5SXZZL2doTUdsSVJY?=
 =?utf-8?B?RjNwWldxN3RUQ01FWlVuMSt0OGZtUFp4a2NBS29FRVZOZnZZOEdvUmhtNlho?=
 =?utf-8?B?SUFVKzZyM0E1REFVb2I3bmRtaGc0aGdNS3ZjZTh5dHh5Zlc0TVlkcnlwSERn?=
 =?utf-8?B?U1hIUnNyOTZSdUNhQ0NRSUgxUDB6ck4zNXJndHd1NHFRenl1N2pVQkM2eUR4?=
 =?utf-8?B?UlN5Uyt1R1NBM1lQNDF2N0dzVWkvS3JIYW1uMXUyQW10ejZaZkRMZUI1ZWFl?=
 =?utf-8?B?YkQ1YStEOUlvY2JGV0VGMzJXdERaS20remtOV0R3Q0UrMzVHQitDeks2SGpN?=
 =?utf-8?B?RTVTNCtVVW03TGwxS3h1NURHMjRwc0RTRnl2b3ppeFZrM3QvaXd6QVVsc3Za?=
 =?utf-8?B?TWdNaTRhQkh1azgyN0RZaStXUUo2VHQ1aUdhdGFKbis0S2Vmd2lRTy8xR1dX?=
 =?utf-8?B?cXozUTRqMCtSZlU2QnAwem5NdTk4eXZYbUtMeW5NQ1cvZlBWckRlaHpPekFE?=
 =?utf-8?B?ZHVsUnNRMHk1c0NDWFY4MituZ3VsYmMxS21VbjVPcnBZN0ZTaWFHZE9FZWJy?=
 =?utf-8?B?TzZmL2c2LzR2dnNJZEhRcXEvUFJwM1FTTURFN1dzcFVlaTMwOWZKb2phQ1k1?=
 =?utf-8?B?MWJKZldva0NBRlVSR2ljZ0RmMEEwYUJvanhZQW5oL2FSMGtuSFZEV0JLQkFw?=
 =?utf-8?B?YUtnUUhVUHlMNXIzZ2VPL0hMeWVjT1RINktoNjh3VU50R1FzVkgrZ1RPbUNC?=
 =?utf-8?Q?2cWDVbSv0WtI81VEuWrk+lEWn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4cd0fa-ee9d-4a0a-d459-08ddd4c14968
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:14:38.4239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vuET9LUyZ5+XvUIxttolfg+x/rfgNYZHHsg327cNXfumGYhZTLHa4UOExMon6LGeLf7pKG/CQ6WEL8FNyvq9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=68930ef0 cx=c_pps
 a=wvsir5P7kk4xrHLnrmk4uw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=nQnj-N-2p8cSofkvP60A:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MqDnk0dLZzUp9UoGt3hJnfTwctwFZYiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA0OSBTYWx0ZWRfX0WLRLKqY4d74
 IRJEd6ou44DevqQn/CWIKKX6/YPDIQWtN7GHAfY6TVYc8i7LzjWj2/n+zVHHQlszOKV5ZpMUGnP
 G9Gxb+zn+/+L8a7i8kj22o4yredtJJZMzlvgomo+rfrJZwXeydDhT3jd8wgpw9JXmsFMSWQQ4fR
 6OyOxjCJZy52yB6o9Uk0TTbQJHUPBxwcNCVY/ZXQo041JMuWGxhv97OZM6ts7AqM4LqZDAzr0Hu
 tA1XA9twd3ycDDzIXPQd15PfxMTLnsm6zaGbdNkEBtjkwhCBv/hOpKAq7eqERYJyyNXqn7rU5RK
 Zbmtp7O6zNK0DmVKQreUjGUFNBwEQe1ChzIxelqeCXfpySzkvUobo6LiQa1R6M=
X-Proofpoint-ORIG-GUID: MqDnk0dLZzUp9UoGt3hJnfTwctwFZYiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221503

Please ignore these two patches. Wrong mailing list. Sorry about the noise.

Regards,
Qi

On 8/6/25 16:12, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This is a small version bump. It includes to following two
> commits to fix CVE-2025-4565.
>
>    05ba1a810 Add recursion depth limits to pure python
>    1ef3f01c4 Internal pure python fixes
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb}         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb} (99%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
> similarity index 99%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
> index 30b805e6b1..88a979d0af 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
>   DEPENDS = "zlib abseil-cpp jsoncpp"
>   DEPENDS:append:class-target = " protobuf-native"
>   
> -SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
> +SRCREV = "f5de0a0495faa63b4186fc767324f8b9a7bf4fc4"
>   
>   SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
>              file://run-ptest \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221501): https://lists.openembedded.org/g/openembedded-core/message/221501
> Mute This Topic: https://lists.openembedded.org/mt/114562663/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


