Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B851CC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 16:47:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.756.1750783663215656284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 09:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82704a5857=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5jGOw011446
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:47:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2kd3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:47:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGv6jwAR4Pc/tUlyQBJLZWQTpIPbPdgqKtTimpXCgUlo/6X7Bjcxls9uhtO2YZsDdWL5/aQREBEU04s2JS4dwjjmWzMTofPmCyG6nmIClnQT2HcwaYtYfBK2Lc4LxIbDtWXQrqsBjOfGG9/Ixepx+kpjCfpAzYY4UdEnRYqMlaW81hyattx85iWJ9arJKPRgvMysLhAzFfVI8u3MNaRGPzZqh2sdzib0gpFc/Y4RMvIwKKbmiQ17AT8UwDKYX7Z2ns/RDcef8UKgm0prd4OiHEWtYEKQuP8XIHBlnUCx7Cn3Uy2zBaa2zmNvPQD/J4Xv0JfRzPJzY2uVgwb5E3/cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqQf2kt7Myl0i7bVwYngt2t2W5a7c0409tEFwggfc8w=;
 b=Y/27wY87OI7vbjPvkgsiX10m0lmou+b9rPdj6JZ8V+g1E+mOd5vKqE++7Wijf/NXLWb/L7h9vTgZRDtxU6YeShkuUbnKW77+rDV2AZwwRCdvDodw95CQknohv7h6lgSg4fa8W5xkUvxsg8uQXylUvzXV6OP/vGBWcOs5z/z/1qhfLIlSLJkvq3svBd4+F7TcjwvznOOF3MlBOF0TzstF2m3Ga26+6P9F0oaYNJeKg1MgVYxZ1CmpUTUsQRFy2FEFdgEthKeQKei02W/1YAgIWv5xb0wdOK6P8GORWG+WE0kYrVd5t1oIGpdngmdwlNAizw/VLJI3vjTwWbNtSUocSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 16:47:37 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8857.025; Tue, 24 Jun 2025
 16:47:37 +0000
Content-Type: multipart/alternative;
 boundary="------------ebdaeD0mvv3r4348OiWnzh6z"
Message-ID: <a2aa5a51-61fb-4fa6-a061-205d456b0be3@windriver.com>
Date: Tue, 24 Jun 2025 12:47:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: Upgrade 1.86.0 -> 1.87.0
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250624091403.2469860-1-Yash.Shinde@windriver.com>
 <20250624091403.2469860-2-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250624091403.2469860-2-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB4805:EE_
X-MS-Office365-Filtering-Correlation-Id: 10317250-c44e-4e00-8a5d-08ddb33ed34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0Y5OWkyYjB2a0E0d0xXOVRLaEZsdnNsbEd0eGx1dldBVzNSS1BlMEFGTVp5?=
 =?utf-8?B?Q3RpaDNZVHpjWlVmc04rQTNUd1Rib1JpbDJRRGZ2d2gyMUxWUlZJR1FySmpr?=
 =?utf-8?B?REdnN2RtYW5mSTV3V0FEVlQyY1ZvcGhKcnozQzk1bmNBZm1WWElBblcrS3Z1?=
 =?utf-8?B?cThYS3VtZmN1UVpuQVFDVGVpQndVTmhld1hSaUdTVVVSbmVJSEcwYnRzaEhy?=
 =?utf-8?B?NXV0TXZLVlYxeU4waG14TUY3aXFlNEdaUWsyTmNJVDJremlONXI5UzR1d3hS?=
 =?utf-8?B?Z3JDK2ZDZ0FkTzhsK1hhRzF4Mk1mU0E4VGlsaVlxTU9CNUJ4WlBpeEVveFFa?=
 =?utf-8?B?RVlUQ3ZDQlg0NjhMYWRmV1N1US9IMWFPZFRkTEVuNllubkEzblh2c1BrWm9y?=
 =?utf-8?B?UU12UWYvRUlKZVFDbitEQXR4elpMdHBpeE10bjZHNXlaMjdsZGtuVzFjR2Zi?=
 =?utf-8?B?c1lyU0ZMZkM5WkNmanZrOHVQVzhmNEt0NUNhWVlLeGprVWhtZ2Z2d0dJOXNR?=
 =?utf-8?B?aHVBYW9TVU9HYTA4eTRTaVkwSW10MDloSW1weHAwdVZiMjJMTERkbzhqUXdv?=
 =?utf-8?B?b1J4Vk9nYVkwcVlvNjNNOXlmcCs0QXNQTmJBd2p6UklmdHE4dldkWldBb0Fl?=
 =?utf-8?B?RzI2Uy8vdWtDTmI1K3lsT3Bld2UwNExFSmlZVk9Vck1BQVRjdGN4dFJncjJx?=
 =?utf-8?B?UTFCOFY5NkhFYTk5ZlZieG9vN0pwc2dDWDZQeGx3cmRCOTl5M3kzK045ZWFM?=
 =?utf-8?B?bW1SeDhpbDBKN0d5Q3FDUEFwbngzdWlXSkRrVW42cjB2akFXeVN5aXROMFV0?=
 =?utf-8?B?ckpjRUViZVpocVo4T3F2WGpCeFk4ZzRkdTRLZDAvcTMxT3MxeVJZTVZ2N2ZF?=
 =?utf-8?B?Y0JnWUVkZThIVFQyQnZ6Ri9WQzdXRlJ2SmkvT2kxNFB3aGJqUlVTdGhrQndR?=
 =?utf-8?B?TG03dHlyNGZUREc4QllhTjhUblRVcDdFUi9UcW1QdEx6K1pyREVXVzBLazJh?=
 =?utf-8?B?SlVPWGtzcHdxblFkbU5NUmR6WHlwSVlDQmF4ZlJyUWkrOElnbE1IVGo3UG5Y?=
 =?utf-8?B?L01LUFlIYUJtVEpIZ2NGME1ockprMFNtVTFtSFROclpXWDlQUGNwVnV2K0ZK?=
 =?utf-8?B?ckcvdG9tM2IzcWN0cEQ4N2NxQ0haLzZ2dk1nY1hlNXczcmt0VE8yVmJiOEJs?=
 =?utf-8?B?bWhsRXQxZFpkUVI1bzBIcUlEcnJEQlJBeXJwVms5YzEvdWhLWGJZek1xQ2E1?=
 =?utf-8?B?Mm1sSlVKOVJLY2F0Q1VNMGl3RXhmRjBhZTBwOEp1cU9DKzlneFFhRGZYWXk1?=
 =?utf-8?B?cklybDU5RWk0RWR4OHBrQk9RdHB6UWxyR0dISXlMUC9PeGVvYzBscVAxa0NK?=
 =?utf-8?B?SVBBZEhDNlNaSE9GTjY0WEppYWNJL2piaGRzVTdEVVUrRlVwMm5NNWNtZUgz?=
 =?utf-8?B?V1RuWW9iWDVmZ3ludDYrUkdBOElTQTkvR0xxbVNwcEc4SXJaNTBIdFlJbWRv?=
 =?utf-8?B?T0JOOEM1STMxUHZ6Y090clN4U2ZSM2dUOWJnVm9neUpac3NqZ3hqdGpvelRs?=
 =?utf-8?B?b3Q2ZXRZOUg2ZVdkc1A2WXBmSTRIeDRpQWcvR3hoaXNjZnRSVXdqZ2JEQ093?=
 =?utf-8?B?cFdtY2dkYVNoY1gzeHlCcWtWK2lMQjRWZStCYzhmZStXYVF5RHUvdGtFRjhx?=
 =?utf-8?B?dVdVNkVIS0YwQ0c4eDQ1NUFxODRjK2U0emRtcjkrV3hFaUQranVlSi8rcUJp?=
 =?utf-8?B?VmZicmVBRzZPUE1hTitUWFN4UGhUenhpbTVuRm9XbmV6NWxHZ2J5YitzcDVu?=
 =?utf-8?B?UnpEZy9lTldFbUNJR0dDUUVIMVEvQkR4VHgzM004TUFzVVgvNzRKbFptTTJq?=
 =?utf-8?Q?kJAhys4TuEXOQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmE2U05MbS9naStmSUtCZFhoWEFYQ1hJK0huT2d1aERWSFp6ZnpPSDdpb3dS?=
 =?utf-8?B?MGg2c1pON04xV0MycUJCNjBQbUFOQ1NFTGEyNzBLclJLNkl6TWlkR1VaT095?=
 =?utf-8?B?OU10UUw3QlBsYllqZ0VpMUlZMWR2akdRSTYvVC9sMU9LUWgvdjF4L3U2S0ZQ?=
 =?utf-8?B?V3ZXdnh3ZFhMa2UzMTNYN1ZtOUVyVGZmMzMwYWlneWJ0Nkc3L2c0enJvU3lq?=
 =?utf-8?B?dEFnaUc1RWVlRlFBNCtWWXd5TUdJcmRTa3p0OXFKWCt3eG9acmVZU0J1endY?=
 =?utf-8?B?ZTl3WFZyREVkL2xLaHJPT1hKMFA5bHZ3VjkxZml3ZWpub2Z4YUlwOERlcUoy?=
 =?utf-8?B?ZFFFaW1oVncxVWdIYnJjbFVha3BLUEhKekZES2VDWG5CZXJXdGhoNTJRWGNs?=
 =?utf-8?B?Mk15N2lkUno3cU1ZcFlGSGtTRFR4aTBHTUYrZVBrUXAwZ2RGck5BdVhZZUsr?=
 =?utf-8?B?K2VaWGRUNmdNcEE5ait0YnpWcTBjS0pZWUd6dS9mMHg0NnVvQ3A2Z05NRWEw?=
 =?utf-8?B?OWVlY2o1bXZIbk9zY3RzQ2FFb3F4WUM0TE1Db3hwR09UVHZ5S1dEN1llb3R0?=
 =?utf-8?B?Qk9QVFJlb0pHYVk4QUUzaHZ6TmJ5UFdTRzVmV21HMVd1L3ZSVlVZT0QvaFhs?=
 =?utf-8?B?ckFQY2xCWDZxQ1pKOHhTT25vQzZlOENmbHoveEVJM1ZRVXdrekhacjd5YjBZ?=
 =?utf-8?B?ZmdMd1BENk1mNkFDSDM0TzJPQndtTW1xZER0dVNWN2NqZ1o0STM3RVlWRk1q?=
 =?utf-8?B?cWt5VVR6cHl1Y3pDdFVQZ1NROFljbCtnOG1Nbks4UzR1Z1pZRndhWUlQV1dD?=
 =?utf-8?B?ZSt5TDFnVFlPeiswbDdMeWQ3dVAxcHBDTFZMTTJZNUJjZklJRjlOTGlKVmha?=
 =?utf-8?B?aFI3UUhWc3NzclNOa1ZIKzBRMmx4T2hFSEl0QUhlbG1aTGdFRlVma3Q5dGZF?=
 =?utf-8?B?S2VJdjNnbVBIOVZsNjBndXkyYll6V2J0WGIwQU15NWR0V2ppSDg0cHdoMTlz?=
 =?utf-8?B?NWs1SmNoUVhvN2xBbUZnNXpUamxyTjcydXVCYXRGRDVUM25IK0pZakxtR0xl?=
 =?utf-8?B?djVIaXVCdEREOUMvcUNHTjJzdzZIWXBoRm9penhNdEM0UVpyOElqd2JVeE9y?=
 =?utf-8?B?NTc5UWhGbHl2TDJCZUVPS1dBOFJTWXJEazFicWhSOHN5dy96ZkN5cW9RT2Jm?=
 =?utf-8?B?QXp3cXpqU01QTEhyMU9RY3h5V2hIMU9yd0tpbytYL050R1o5K1k1bVhiQmE5?=
 =?utf-8?B?dXRGR0g1cWF4cGpjMkxDSGRxV0pQQ0UrMzNVUFE3TlhZNkhwK2lsWEovU1Jh?=
 =?utf-8?B?RlgrS3M2RFVIOXVxQTVESUp5T296UFJPNkk5OUJKMktwUFMxcVgwNVJtdHg3?=
 =?utf-8?B?WmJRRlJQNC84bElGNUhMdUNlbW1Zd0FGUzNOejIxaEJFQWJPWmxLREViK1ZQ?=
 =?utf-8?B?QnphYW5tNlJ1QzlUR2NCNGQxMm1RSDkyRnBGTXBEcHpDQjNPUHZRL0dpeGsw?=
 =?utf-8?B?V09ZT3VHVHVxQ0pwQktOWVdqSTU2QzVFMnVrdU9VREszNGlka2F2OUFwdzR4?=
 =?utf-8?B?bGkvU3p3QkFDbVkrV2JFem1wdW9DYnVxK1JuNEx4aEUzdmt5d1h1amYrMERE?=
 =?utf-8?B?d0c5TlNmTE9VeTFHVlVUMUNFQWkyUVBSZEo4UDkvTkE2L2tTcGk4Ymw2N3Bw?=
 =?utf-8?B?R0RPVUFjV3NEM1ltdmVBc01pNExlcnYzK2I2dFVTUFVTSkYyZktWY1NUQUNr?=
 =?utf-8?B?WVFmUm05c0xwaTVxY3pJNTAvdUVud1hyaWRiL3RWN1QzS3dhVTJkSnZ4QUhQ?=
 =?utf-8?B?bG1DSitod2oxcVVnS2szVFdVeVN0emFZS1lGWmlHd0Z6TmVsVjZhY3B6cXRL?=
 =?utf-8?B?Z0lWTmRaYUtJKzBYZjFUU3RVMHE5NXhBb0tsUFdzdTNyOHpXTmtlM1dIK0tn?=
 =?utf-8?B?OUdzOS9uOHp5K05DV0x3UUV6cmhuZEhwNXBQWU1td2FRdGlrQ0N6TWwzdXJG?=
 =?utf-8?B?Skg1SkhmTXY0RWFaMkRtVFFiSzJldUpUS3RqWFY4eGhpTCtlWEtoQzVTdDdr?=
 =?utf-8?B?MTJNaFBzWmxuUUU3dDJWNlhqVXlES0JNUjVmbklKMHF6c3F0UEl6MnZKYjJp?=
 =?utf-8?B?dzRxWVd2dkZlSjl6cjhNbXFUNjFwUDBqdUNEVUNoeTdSVjczSXZ2aUFobGhu?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10317250-c44e-4e00-8a5d-08ddb33ed34d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 16:47:37.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBdiC/SXUKsx++Fc+wh7UQq9BhVSYpiNpV0+a5DIEmBzoVIYLXbbzhjtXtRz0I2oED0hEQ/15RphyQq8Gm6CrlUtU1QFBDNRMOFFUzSd5YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE0MCBTYWx0ZWRfX0ZvvfcffNYUE C6XEKWoJs/OONM36ekDtN3pnGqhhQQPJ0F3GF1vxem7wTX7Z7L/m4RcQucKsW885k7s1MGV/Ojc Y4P2pOhjShQf27UJU862rZ2ADg3QQEkKSXp9ihEgxvbefI9DiIAoVKssQxDVdwoegnkPbf+Q944
 /FuPY6Y6zW1B3uSpvvW6hciqzzgLAqQPQeovGOAgX0ExojDmPDyXK/2/MVkErcUYBHumxJsxFcE +qm106qm4xSFuYCt3sCgdlteUnJ7UTNIgqEGh6a3Yk06JlmG66IQ+2Ocz6qT63/6CdS/uGugeKH 4D+Iz/9gC+OAwtQr/xsF6CqAXdsCMhIBZoYM2Rx4VJkCPIN7zOutBYyqkt3ZTaixGNNUDyIia4L
 uPy3q3nwGMNZfNvhPjNZv5WTjA9OZb8bWkB6qrzycOE2bdBbYvxwFRYJ0kAkTQCVFYss0jnw
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=685ad6ad cx=c_pps a=+M2Hf4NIZF2Pi0mlSiStKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q3v7tJIzXIdyyCFvq8kA:9 a=LtcR_eMbLRPCTNab:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d4cjvEdwQiDf3vzdRTMA:9 a=CR3pm5MvBwHVYW3K:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: LncqqbrcTj_bLSVGet7Xq_76Amk5l0QV
X-Proofpoint-GUID: LncqqbrcTj_bLSVGet7Xq_76Amk5l0QV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219277

--------------ebdaeD0mvv3r4348OiWnzh6z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55O5jGOw011446

On 2025-06-24 5:14 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Rust stable version updated to 1.87.0.
> https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/
>
> * Update LLVM data-layout for arm64.
Expand this section. Why are you doing this?
How did you decide on this data-layout?
>
> * Rebase existing patches with v1.87.0.
>
> * Two tests from the `ui` and `codegen` modules now fail only on riscv6=
4.
>    Enable them on arm32/64 and x86-32/64 targets, while restricting
>    them on riscv64 via `only-<target_arch>` tags.
Nice! Can you mention the overall testsuite status briefly in the v2=20
commit log?
>
> * Add triagebot.patch file to keep running tidy checks.

Could you expand this sentence to explain what these checks do, please?

Is this a new feature in 1.87.0? Ah, I read the patch and think you=20
should just

include something like the first part of the patch in the commit log:

+Skip tidy triagebot linkcheck if triagebot.toml doesn't exist
+
+Distribution tarballs won't include triagebot.toml, which
+causes tidy checks to fail with the following error:
+
+=C2=A0=C2=A0 tidy error: triagebot.toml file not found
+=C2=A0=C2=A0 some tidy checks failed

but format it properly and mention that it's a backport.


>
> * During rust installation, some binaries were installed from
>    'stage2-tools' built path to '${D}${bindir}'. However, from
>    v1.87 the stage2-tools are no longer built by default.
>    Update logic to install from `stage1-tools` instead.

Okay. It would be nice to understand why but that's not essential, I=20
suppose.


Generally, this is a good commit message, albeit a bit terse as pointed=20
out above.


Can you also comment on the build time and FS footprint changes if any ?

I've looked through the changes below and I don't have any comments.

../Randy


>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   .../classes-recipe/rust-target-config.bbclass |   2 +-
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   .../rust/{cargo_1.86.0.bb =3D> cargo_1.87.0.bb} |   0
>   ...teps-tool.rs-switch-off-lto-for-rust.patch |  30 ++--
>   ...crease-timeout-in-process-sigpipe-ru.patch |   4 +-
>   ...d-statically-in-rustc_driver-feature.patch |  11 +-
>   .../rust/files/rust-oe-selftest.patch         | 147 ++++++++++-------=
-
>   .../rust/files/triagebot.patch                |  32 ++++
>   ...ibstd-rs_1.86.0.bb =3D> libstd-rs_1.87.0.bb} |   0
>   ....86.0.bb =3D> rust-cross-canadian_1.87.0.bb} |   0
>   ...ust-llvm_1.86.0.bb =3D> rust-llvm_1.87.0.bb} |   4 +-
>   meta/recipes-devtools/rust/rust-snapshot.inc  |  78 +++++-----
>   meta/recipes-devtools/rust/rust-source.inc    |   3 +-
>   .../rust/{rust_1.86.0.bb =3D> rust_1.87.0.bb}   |   4 +-
>   14 files changed, 186 insertions(+), 131 deletions(-)
>   rename meta/recipes-devtools/rust/{cargo_1.86.0.bb =3D> cargo_1.87.0.=
bb} (100%)
>   create mode 100644 meta/recipes-devtools/rust/files/triagebot.patch
>   rename meta/recipes-devtools/rust/{libstd-rs_1.86.0.bb =3D> libstd-rs=
_1.87.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.86.0.bb =3D>=
 rust-cross-canadian_1.87.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-llvm_1.86.0.bb =3D> rust-llvm=
_1.87.0.bb} (96%)
>   rename meta/recipes-devtools/rust/{rust_1.86.0.bb =3D> rust_1.87.0.bb=
} (99%)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/clas=
ses-recipe/rust-target-config.bbclass
> index 906a5083d7..cac6e90a9e 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -171,7 +171,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] =3D "64"
>   FEATURES[armv7-eabi] =3D "+v7,+vfp2,+thumb2"
>  =20
>   ## aarch64-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[aarch64] =3D "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:=
64-S128-Fn32"
> +DATA_LAYOUT[aarch64] =3D "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:=
32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
>   TARGET_ENDIAN[aarch64] =3D "little"
>   TARGET_POINTER_WIDTH[aarch64] =3D "64"
>   TARGET_C_INT_WIDTH[aarch64] =3D "32"
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> index e943ca77d1..c506bb3ad5 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>   GCCVERSION ?=3D "15.%"
>   SDKGCCVERSION ?=3D "${GCCVERSION}"
>   GLIBCVERSION ?=3D "2.41%"
> -RUSTVERSION ?=3D "1.86.0%"
> +RUSTVERSION ?=3D "1.87.0%"
>  =20
>   PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/rust/cargo_1.86.0.bb b/meta/recipes-=
devtools/rust/cargo_1.87.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.86.0.bb
> rename to meta/recipes-devtools/rust/cargo_1.87.0.bb
> diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps=
-tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files=
/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
> index 5e0f5912a1..a7da69dce3 100644
> --- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.r=
s-switch-off-lto-for-rust.patch
> +++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.r=
s-switch-off-lto-for-rust.patch
> @@ -24,9 +24,9 @@ diff --git a/src/bootstrap/src/core/build_steps/tool.=
rs b/src/bootstrap/src/core
>   index 087df2f8a..00790affb 100644
>   --- a/src/bootstrap/src/core/build_steps/tool.rs
>   +++ b/src/bootstrap/src/core/build_steps/tool.rs
> -@@ -1,14 +1,11 @@
> - use std::path::PathBuf;
> - use std::{env, fs};
> +@@ -15,14 +15,12 @@
> + #[cfg(feature =3D "tracing")] + use tracing::instrument; -use=20
> crate::core::build_steps::compile::is_lto_stage; use=20
> crate::core::build_steps::toolstate::ToolState; @@ -36,18 +36,20 @@=20
> index 087df2f8a..00790affb 100644 - Builder, Cargo as CargoCommand,=20
> RunConfig, ShouldRun, Step, cargo_profile_var, -}; -use=20
> crate::core::config::{DebuginfoLevel, RustcLto, TargetSelection}; ++=20
> +use crate::core::builder::{Builder, Cargo as CargoCommand, RunConfig,=20
> ShouldRun, Step}; +use crate::core::config::{DebuginfoLevel,=20
> TargetSelection}; use crate::utils::channel::GitInfo; use=20
> crate::utils::exec::{BootstrapCommand, command}; use=20
> crate::utils::helpers::{add_dylib_path, exe, t}; -@@ -658,19 +655,7 @@=20
> - SourceType::InTree, - features.as_slice(), +@@ -148,20 +146,7 @@ +=20
> &self.extra_features, ); -- -- // rustdoc is performance sensitive, so=20
> apply LTO to it. -- if is_lto_stage(&build_compiler) { + +- if=20
> path.ends_with("/rustdoc") &&
> +-            // rustdoc is performance sensitive, so apply LTO to it.
> +-            is_lto_stage(&self.compiler)
> +-        {
>   -            let lto =3D match builder.config.rust_lto {
>   -                RustcLto::Off =3D> Some("off"),
>   -                RustcLto::Thin =3D> Some("thin"), @@ -60,14 +62,14 @=
@ index 087df2f8a..00790affb 100644 - } +=20
> cargo.rustflag("-Clto=3Doff");
>   =20
> -         let _guard =3D builder.msg_tool(
> -             Kind::Build,
> +         if !self.allow_features.is_empty() {
> +             cargo.allow_features(self.allow_features);
>   diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/sr=
c/core/builder/mod.rs
>   --- a/src/bootstrap/src/core/builder/mod.rs
>   +++ b/src/bootstrap/src/core/builder/mod.rs
> -@@ -11,7 +11,7 @@
> -
> - use clap::ValueEnum;
> +@@ -13,7 +13,7 @@
> + #[cfg(feature =3D "tracing")]
> + use tracing::instrument;
>   =20
>   -pub use self::cargo::{Cargo, cargo_profile_var};
>   +pub use self::cargo::Cargo;
> diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-ti=
meout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa=
-selftest-Increase-timeout-in-process-sigpipe-ru.patch
> index bb27ca35ff..5bd1abffb4 100644
> --- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-i=
n-process-sigpipe-ru.patch
> +++ b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-i=
n-process-sigpipe-ru.patch
> @@ -22,10 +22,10 @@ index 11f363d62..c12d66016 100644
>   +++ b/tests/ui/process/process-sigpipe.rs
>   @@ -23,7 +23,7 @@ use std::thread;
>    fn main() {
> -     // Just in case `yes` doesn't check for EPIPE...
> +     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
>        thread::spawn(|| {
>   -        thread::sleep_ms(5000);
>   +        thread::sleep_ms(50000);
>            process::exit(1);
>        });
> -     let output =3D process::Command::new("sh")
> +     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` =
for `nto`
> diff --git a/meta/recipes-devtools/rust/files/revert-link-std-staticall=
y-in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert=
-link-std-statically-in-rustc_driver-feature.patch
> index 20a49d46dc..9bbbce0182 100644
> --- a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-ru=
stc_driver-feature.patch
> +++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-ru=
stc_driver-feature.patch
> @@ -200,11 +200,10 @@ diff --git a/src/bootstrap/src/core/build_steps/c=
ompile.rs b/src/bootstrap/src/c
>   index 27bbc8bd8f..a6fc4df2eb 100644
>   --- a/src/bootstrap/src/core/build_steps/compile.rs
>   +++ b/src/bootstrap/src/core/build_steps/compile.rs
> -@@ -1940,24 +1940,8 @@ impl Step for Assemble {
> -         let src_libdir =3D builder.sysroot_target_libdir(build_compil=
er, host);
> +@@ -2158,23 +2158,7 @@
>            for f in builder.read_dir(&src_libdir) {
>                let filename =3D f.file_name().into_string().unwrap();
> --
> +
>   -            let is_proc_macro =3D proc_macros.contains(&filename);
>   -            let is_dylib_or_debug =3D is_dylib(&f.path()) || is_debu=
g_info(&filename);
>   -
> @@ -214,8 +213,7 @@ index 27bbc8bd8f..a6fc4df2eb 100644
>   -            let can_be_rustc_dynamic_dep =3D if builder
>   -                .link_std_into_rustc_driver(target_compiler.host)
>   -                && !target_compiler.host.is_windows()
> -+            if (is_dylib(Path::new(&filename)) || is_debug_info(&file=
name)) && !proc_macros.contains(&filename)
> -             {
> +-            {
>   -                let is_std =3D filename.starts_with("std-") || filen=
ame.starts_with("libstd-");
>   -                !is_std
>   -            } else {
> @@ -223,6 +221,7 @@ index 27bbc8bd8f..a6fc4df2eb 100644
>   -            };
>   -
>   -            if is_dylib_or_debug && can_be_rustc_dynamic_dep && !is_=
proc_macro {
> -                 builder.copy_link(&f.path(), &rustc_libdir.join(&file=
name));
> ++            if (is_dylib(Path::new(&filename)) || is_debug_info(&file=
name)) && !proc_macros.contains(&filename) {
> +                 builder.copy_link(&f.path(), &rustc_libdir.join(&file=
name), FileType::Regular);
>                }
>            }
> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/=
meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> index 49d85072cb..b7ef806e65 100644
> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> @@ -47,61 +47,85 @@ diff --git a/library/std/tests/sync/rwlock.rs b/lib=
rary/std/tests/sync/rwlock.rs
>   index 1a9d3d3f12f..0a9cfc48806 100644
>   --- a/library/std/tests/sync/rwlock.rs
>   +++ b/library/std/tests/sync/rwlock.rs
> -@@ -47,6 +47,7 @@ fn frob() {
> - }
> -
> +@@ -74,6 +74,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_rw_arc_poison_wr() {
>        let arc =3D Arc::new(RwLock::new(1));
>        let arc2 =3D arc.clone();
> -@@ -72,6 +73,7 @@ fn test_rw_arc_poison_mapped_w_r() {
> - }
> -
> +@@ -87,6 +88,7 @@
> +
> + #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
> ++#[ignore]
> + fn test_rw_arc_poison_mapped_w_r() {
> +     let arc =3D Arc::new(RwLock::new(1));
> +     let arc2 =3D arc.clone();
> +@@ -101,6 +103,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_rw_arc_poison_ww() {
>        let arc =3D Arc::new(RwLock::new(1));
>        assert!(!arc.is_poisoned());
> -@@ -100,6 +102,7 @@ fn test_rw_arc_poison_mapped_w_w() {
> +@@ -115,6 +118,7 @@
>    }
> -
> +
> + #[test]
> ++#[ignore]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
> + fn test_rw_arc_poison_mapped_w_w() {
> +     let arc =3D Arc::new(RwLock::new(1));
> +@@ -131,6 +135,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_rw_arc_no_poison_rr() {
>        let arc =3D Arc::new(RwLock::new(1));
>        let arc2 =3D arc.clone();
> -@@ -127,6 +130,7 @@ fn test_rw_arc_no_poison_mapped_r_r() {
> - }
> -
> +@@ -160,6 +165,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_rw_arc_no_poison_rw() {
>        let arc =3D Arc::new(RwLock::new(1));
>        let arc2 =3D arc.clone();
> -@@ -192,6 +196,7 @@ fn test_rw_arc() {
> - }
> -
> +@@ -227,6 +233,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_rw_arc_access_in_unwind() {
>        let arc =3D Arc::new(RwLock::new(1));
>        let arc2 =3D arc.clone();
> -@@ -275,6 +280,7 @@ fn drop(&mut self) {
> - }
> -
> +@@ -326,6 +333,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_into_inner_poison() {
>        let m =3D new_poisoned_rwlock(NonCopy(10));
> -
> -@@ -299,6 +305,7 @@ fn test_get_mut() {
> - }
> -
> +
> +@@ -362,6 +370,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_get_mut_poison() {
>        let mut m =3D new_poisoned_rwlock(NonCopy(10));
> +
> +@@ -567,6 +576,7 @@
> +
> + #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
> ++#[ignore]
> + fn panic_while_mapping_write_unlocked_poison() {
> +     let lock =3D RwLock::new(());
>  =20
>   diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
>   --- a/library/test/src/tests.rs
> @@ -117,52 +141,22 @@ diff --git a/library/test/src/tests.rs b/library/=
test/src/tests.rs
>   diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync=
/mutex.rs
>   --- a/library/std/tests/sync/mutex.rs
>   +++ b/library/std/tests/sync/mutex.rs
> -@@ -193,6 +193,7 @@
> - }
> -
> +@@ -312,6 +312,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn test_mutex_arc_poison_mapped() {
>        let arc =3D Arc::new(Mutex::new(1));
>        assert!(!arc.is_poisoned());
> -diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/=
mutex.rs
> ---- a/library/std/tests/sync/mutex.rs
> -+++ b/library/std/tests/sync/mutex.rs
> -@@ -272,6 +272,7 @@
> - }
> -
> +@@ -391,6 +392,7 @@
> +
>    #[test]
> + #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwindi=
ng support")]
>   +#[ignore]
>    fn panic_while_mapping_unlocked_poison() {
>        let lock =3D Mutex::new(());
>  =20
> -diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/tests/=
sync/rwlock.rs
> ---- a/library/std/tests/sync/rwlock.rs
> -+++ b/library/std/tests/sync/rwlock.rs
> -@@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_rw_arc_poison_mapped_w_r() {
> -     let arc =3D Arc::new(RwLock::new(1));
> -     let arc2 =3D arc.clone();
> -@@ -86,6 +87,7 @@ fn test_rw_arc_poison_ww() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn test_rw_arc_poison_mapped_w_w() {
> -     let arc =3D Arc::new(RwLock::new(1));
> -     let arc2 =3D arc.clone();
> -@@ -431,6 +433,7 @@ fn panic_while_mapping_read_unlocked_no_poison() {
> - }
> -
> - #[test]
> -+#[ignore]
> - fn panic_while_mapping_write_unlocked_poison() {
> -     let lock =3D RwLock::new(());
> -
>   diff --git a/library/coretests/benches/num/int_log/mod.rs b/library/c=
oretests/benches/num/int_log/mod.rs
>   index 3807cd5d76c..018c5c04456 100644
>   --- a/library/coretests/benches/num/int_log/mod.rs
> @@ -199,10 +193,10 @@ index 9d4f52a092..d425e5f7b7 100644
>    fn thread_current_in_dtor() {
>        // Go through one round of TLS destruction first.
>        struct Defer;
> -diff --git a/library/alloc/tests/sort/tests.rs b/library/alloc/tests/s=
ort/tests.rs
> +diff --git a/library/alloctests/tests/sort/tests.rs b/library/alloctes=
ts/tests/sort/tests.rs
>   index 14e6013f96..b670f27ab4 100644
> ---- a/library/alloc/tests/sort/tests.rs
> -+++ b/library/alloc/tests/sort/tests.rs
> +--- a/library/alloctests/tests/sort/tests.rs
> ++++ b/library/alloctests/tests/sort/tests.rs
>   @@ -915,12 +915,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
>    macro_rules! instantiate_sort_test_inner {
>        ($sort_impl:ty, miri_yes, $test_fn_name:ident) =3D> {
> @@ -234,10 +228,10 @@ diff --git a/tests/assembly/dwarf-mixed-versions-=
lto.rs b/tests/assembly/dwarf-m
>   index 5b8e5ff4f4a..e558fbd7bd7 100644
>   --- a/tests/assembly/dwarf-mixed-versions-lto.rs
>   +++ b/tests/assembly/dwarf-mixed-versions-lto.rs
> -@@ -1,6 +1,11 @@
> - // This test ensures that if LTO occurs between crates with different=
 DWARF versions, we
> +@@ -2,6 +2,11 @@
>    // will choose the highest DWARF version for the final binary. This =
matches Clang's behavior.
> -
> + // Note: `.2byte` directive is used on MIPS.
> +
>   +//@ only-x86
>   +//@ only-x86_64
>   +//@ only-arm
> @@ -259,3 +253,30 @@ index 0e712bc3a4e..93965d990d0 100644
>    //@ revisions: OPT2 OPT3
>    //@[OPT2] compile-flags: -Copt-level=3D2
>    //@[OPT3] compile-flags: -C opt-level=3D3
> +diff --git a/tests/codegen/uninhabited-transparent-return-abi.rs b/tes=
ts/codegen/uninhabited-transparent-return-abi.rs
> +index face1577c3f..d69e5e34a7b 100644
> +--- a/tests/codegen/uninhabited-transparent-return-abi.rs
> ++++ b/tests/codegen/uninhabited-transparent-return-abi.rs
> +@@ -1,4 +1,8 @@
> + //@ compile-flags: -Copt-level=3D3
> ++//@ only-x86
> ++//@ only-x86_64
> ++//@ only-arm
> ++//@ only-aarch64
> +
> + // Seehttps://github.com/rust-lang/rust/issues/135802
> +
> +diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/=
ui/abi/rust-cold-works-with-rustic-args.rs
> +index 57027364699..3faa7ea035e 100644
> +--- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
> ++++ b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
> +@@ -1,5 +1,9 @@
> + //@build-pass
> + //@compile-flags: -Clink-dead-code=3Dtrue --crate-type lib
> ++//@ only-x86
> ++//@ only-x86_64
> ++//@ only-arm
> ++//@ only-aarch64
> + // We used to not handle all "rustic" ABIs in a (relatively) uniform =
way,
> + // so we failed to fix up arguments for actually passing through the =
ABI...
> + #![feature(rust_cold_cc)]
> diff --git a/meta/recipes-devtools/rust/files/triagebot.patch b/meta/re=
cipes-devtools/rust/files/triagebot.patch
> new file mode 100644
> index 0000000000..715664d081
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/triagebot.patch
> @@ -0,0 +1,32 @@
> +Skip tidy triagebot linkcheck if triagebot.toml doesn't exist
> +
> +Distribution tarballs won't include triagebot.toml, which
> +causes tidy checks to fail with the following error:
> +
> +   tidy error: triagebot.toml file not found
> +   some tidy checks failed
> +
> +Drop the triagebot.toml check which is mostly to catch broken
> +path filters *within* `triagebot.toml` and not enforce
> +the existence of it.
> +
> +Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/1426=
66/commits]
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +---
> +diff --git a/src/tools/tidy/src/triagebot.rs b/src/tools/tidy/src/tria=
gebot.rs
> +--- a/src/tools/tidy/src/triagebot.rs
> ++++ b/src/tools/tidy/src/triagebot.rs
> +@@ -6,8 +6,11 @@
> +
> + pub fn check(path: &Path, bad: &mut bool) {
> +     let triagebot_path =3D path.join("triagebot.toml");
> ++
> ++    // This check is mostly to catch broken path filters *within* `tr=
iagebot.toml`, and not enforce
> ++    // the existence of `triagebot.toml` itself (which is more obviou=
s), as distribution tarballs
> ++    // will not include non-essential bits like `triagebot.toml`.
> +     if !triagebot_path.exists() {
> +-        tidy_error!(bad, "triagebot.toml file not found");
> +         return;
> +     }
> +
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb b/meta/reci=
pes-devtools/rust/libstd-rs_1.87.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.87.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb b=
/meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb b/meta/reci=
pes-devtools/rust/rust-llvm_1.87.0.bb
> similarity index 96%
> rename from meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
> index 327e8e6b69..d70aa350ab 100644
> --- a/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
> +++ b/meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
> @@ -2,9 +2,9 @@ SUMMARY =3D "LLVM compiler framework (packaged with rus=
t)"
>   LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
>   HOMEPAGE =3D"http://www.rust-lang.org"
>  =20
> -# check src/llvm-project/cmake/Modules/LLVMVersion.cmake for llvm vers=
ion in use
> +# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
>   #
> -LLVM_RELEASE =3D "19.1.7"
> +LLVM_RELEASE =3D "20.1.1"
>  =20
>   require rust-source.inc
>  =20
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipe=
s-devtools/rust/rust-snapshot.inc
> index 445390fcaf..87b39a2cc2 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -4,56 +4,56 @@
>   ## The exact (previous) version that has been used is specified in th=
e source tarball.
>   ## The version is replicated here.
>  =20
> -SNAPSHOT_VERSION =3D "1.85.0"
> +SNAPSHOT_VERSION =3D "1.86.0"
>  =20
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "e742b768f67303010b002b5=
15f6613c639e69ffcc78cd0857d6fe7989e9880f6"
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "8af1d793f7820e9ad0ee=
23247a9123542c3ea23f8857a018651c7788af9bc5b7"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "cdebe48b066d512d664c134=
41e8fae2d0f67106c2080aa44289d98b24192b8bc"
> -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "f3b8e769021a6bcee8174a=
c49a60c367effb6d97af0f2a6c44dc9ea39ff2bda9"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "ccece9e59546d2e6ff3fc3b=
8f4b033aab21631c271eefbe814b3cbace6628c6e"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "176129577a5d560bbd94=
bcd2d24c0228bb495b73219df02556b4e4b4f0815bf7"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "37156542b702e8b4ffd1c5c=
75017632582343e93ca378285cdc92196c85c77e3"
> +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "e70edcf560e6b50861618d=
7045d2b38cae9e2a555f489062570e2e7041563f42"
>  =20
> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "c5a5751f3cfa027b53fee83d01=
dec8e555f3622b6993335aed12b1747aa9543c"
> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "401571adfe1223d83ed041e=
5a8c54c1f3afb3010d1d5b0c1fd79e7da1ab0a0de"
> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "3832027242911ab96fd8612858=
7fc563596a5b10e8e38a073facf61c1ac9668f"
> -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "74ed13a67c6ea0452c0d9e869=
7c6cfdd8280f983b207187ac93c287f72b65066"
> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "976f4604d949d722738a9fe953=
13035226571128396e942b0fc678180be487b0"
> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "ce9f0fa4b0760730e26bf31=
5cebe099f0b883436e095c5fc4b94ba20bd9f121a"
> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "24f20bdc1bb14f4ffbdc2f5404=
88bebc3340437418725c3162215ae03cdad480"
> +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "6788449fa0eceebe4ea8c797b=
baf27495dad152087b3085d58dc05cacab0617a"
>  =20
> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "d43d2119ff25d879b2d=
280d3e5a03fcd21c57a32d479ad5626500c32432f18c9"
> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "2d05f5e13e7cb3ee=
6b0ca0dcd13a231a28eeb0faa4d15257a35cf7284149cd6a"
> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "9aa447eefcd3ba2f9db=
ab77596c8669849899ab243543fc8f1914089707081ac"
> -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "d437b39465343a71ff=
475a65acb6c03bc0f800861f293f48accf1fa170458432"
> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "970089ad61f8ca82017=
b59444aee483c1fc005e3f7a6af63cd5f146df8287cce"
> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "2f528377f57fbf81=
da35e2f08ec7ba50daddabebdce2cc86b6ec909fee157a33"
> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "c3b8ab03b64c824f2ea=
25db578b5760d44302be3fd1e4a78404c98cba39301f4"
> +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "1ab711423497a1d024=
08a240da28ad366450574dd7f528ffaee80d1d5ed10550"
>  =20
> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "fbe7154abc641d6cacfdc62=
39ed4701fc7a09b5046c6d1bd209b59e7f2b2d0f0"
> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "ab2d5ac7cd295adaa4d9=
59e8abbf42b372292c95d1a9f18aad64951ad6e2ab2b"
> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "e67c30a72f969c51ad19908=
4b3ce0cdc573a4e21f732b2cc39dafbcb9807a5ce"
> -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "497104d49803598cd38017=
49ac86cb26c88a2bd9c3a8c7bdc18fdf487f4650c0"
> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "21ea61181ba7daa04f61bec=
6a295ad76ce34bfbd74ad1d679c4548977bd82eb9"
> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "e5ed58a861619bcc89fc=
3f969174c84fd6ed8a26b5d4b196f06efb868653c1c1"
> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "fd832c269af81dd1ee9f383=
1991fccdc2c7312e9a9069908510eefe7c313d144"
> +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "c94578d31e4145a4169ab5=
761537a2a0133818278fb62ee76251ef8ef45228c8"
>  =20
> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f8e38291ba4241bc28e9c=
118d7a449ce3601abdeb2076f2f618858679fb3b929"
> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "e9ff89e759125ad278=
6ad2f6c40e820095720ea00fba66819d15fba79489430a"
> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "73cf850f6715acbf0029c=
7e5d4694825f61bd4e193e6413e65a78bcb13df97b7"
> -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "29b63f23cd9af95846a2=
46c9cc8349e514c3fb92ec0c840a38155e252d6cc668"
> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "a54bbe16e6a405f137a0d=
c51fd570140c80077ba769d29d885a60e74cb3196bb"
> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "06538b41a9351c449d=
215498d4ec2f072f728bd18df8fac7ef8534a0d0f34e27"
> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "4d398cd8da17d1a5f2673=
4b39cb17e791b243ac3570f8da2e5e5580a9dfad578"
> +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0abf31a8cb2762a7a81d=
bee8a5798e43e11a83326711ce00ad16c5587bcf5e49"
>  =20
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "371e40f9d6d82aecb05=
6f70f82868d98ddc1c20510aa7d388442ac8d2d86a6ca"
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "d0cfda4e18623d17=
922eb367e44ac9549ab3d5fe1c0bdbe0c2c95754255fa705"
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "e1469f4249a7e21f872=
af487dcd1bd10ce388b5b3679bdab0cb0965e1e30fe47"
> -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "d8c590bc2e6fc75800=
e41516427f5095ba0e15d7633167689499fcf6523dc61a"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "7585a20b02b7dd497e3=
93a2e7552a0c6aabb51556fcf7507c6f7ffde530f8c88"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "fcf940c0553a04cb=
9bd85cce524729c2f54b000b554fee95c7aa218d608b7e3d"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "8fefd2317023716a018=
986c4a62558a7b543ccf34e4e6d1104afc66edcae1c9c"
> +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "8cc65649396ccad73c=
ecd17b972ab8d4c34837136cf374425be63d697b541469"
>  =20
> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "2da33044f17a8bc49a147=
8dc1eb2536df491a44d6e6bb0ec7c86f46877d44e98"
> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "0f5ecfe54859bbe715=
821f982b1a5396784fdf55605d00ece05d3e57a965ed16"
> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "c9f28b519799fc2d80898=
65e30fad04bb5339604d13725365fcd7ad7ee6c1489"
> -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "9d21bc180196bccdb301=
e7e03034d3fd0df14b0c6520da0317bba7b1ce385fe8"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "4d1106b576221182f8441=
2f3377a5148eab6950d20e45e4274cd8b58df46f26b"
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "b28b9c2f183521a204=
f2899610253c11c86ee4aa903fe66d8410dfaa22c926e6"
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "7825556908e10a48320cf=
b2d812851271d7cf549977173e028a0dd23af9d7eac"
> +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "c39c53a82fdaaa974137=
28a4f3f9feb5b31bdf3e3e563c64651bd01713e79166"
>  =20
> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "308361737ed522aa77dd8b4ea=
91b5db244113ada5fa234d3ed008b526d07e2e8"
> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d25053fbee1a0cb899bac8=
c8e4968aa35f9c3637e486cb5bb2c79ad43a78f3e7"
> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "7e1defd60095c91ded1612194=
f811ec5f2fc2e83bb914d35594d01fa3c54049d"
> -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "9780d8c4cfef9d05460b3e54=
0aad142391b2e3994accf8cfc8afb87fefac6cf0"
> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "18caf22fbfc4d26c80b39b4c6=
b1cd5fb42dba3e32d5d3600c22eae6f688d7f4c"
> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "3919f6962d0aefdd2cd75d=
8dba749ed826936065b64c9a8d54d1d85c2685fd66"
> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "1c6eb1be254574881a611a3b8=
904cdcfe43c79a285875673e59c890dcd5766c2"
> +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c87183b52ddb4085ddf2524a=
775fd255d5fd11ad2fdd6424574f08750a8cf378"
>  =20
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7436f13797475082cd87aa65=
547449e01659d6a810b4cd5f8aedc48bb9f89dfb"
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "285e105d25ebdf5013412=
38d4c0594ecdda50ec9078f45095f793a736b1f1ac2"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "0aff33b57b0e0b102d762a2b=
53042846c1ca346cff4b7bd96b5c03c9e8e51d81"
> -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "0dc3ca1708a6c9eed05d080=
2364377572b79ff079815b7bcbe8e3991f77c4117"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "4438b809ce4a083af31ed17a=
eeedcc8fc60ccffc0625bef1926620751b6989d7"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "67be7184ea388d8ce0fea=
f7fdea46f1775cfc2970930264343b3089898501d37"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "c5c1590f7e9246ad9f4f97cf=
e26ffa92707b52a769726596a9ef81565ebd908b"
> +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "02aaff2c1407d2da8dba19a=
a4970dd873e311902b120a66cbcdbe51eb8836edf"
>  =20
> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "3cb7318da10876de1407654=
9d79410a8441923a92d62b616d8c105f5f5cd831b"
> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "f0bddc6dba7d719b8ba131b=
cd634a8379e00fc825a51c0f17abf424c9cb5c052"
>  =20
> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "65cd47af46a5b74e61ff=
6ae4cce8a979ee8670a57b8aa61e732828d1da073f73"
> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "722238ae13e6e101d1b6=
98d2b3a7915d59bb7f485b594e8d833cce8b9460383b"
>  =20
>   SRC_URI +=3D " \
>       ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-=
std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> index 30b159a84f..ed15d9c763 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -9,8 +9,9 @@ SRC_URI +=3D"https://static.rust-lang.org/dist/rustc-${=
RUST_VERSION}-src.tar.xz;n=20
> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdi=
r=3D${RUSTSRC}=20
> \=20
> file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;pat=
chdir=3D${RUSTSRC}=20
> \=20
> file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patchd=
ir=3D${RUSTSRC}=20
> \ + file://triagebot.patch;patchdir=3D${RUSTSRC} \ "
> -SRC_URI[rust.sha256sum] =3D "d939eada065dc827a9d4dbb55bd48533ad14c16e7=
f0a42e70147029c82a7707b"
> +SRC_URI[rust.sha256sum] =3D "8623b8651893e8c6aebfa45b6a90645a4f652f7b1=
8189a0992a90d11ac2631f4"
>  =20
>   RUSTSRC =3D "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
>  =20
> diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-d=
evtools/rust/rust_1.87.0.bb
> similarity index 99%
> rename from meta/recipes-devtools/rust/rust_1.86.0.bb
> rename to meta/recipes-devtools/rust/rust_1.87.0.bb
> index b13ec116be..5d804c7398 100644
> --- a/meta/recipes-devtools/rust/rust_1.86.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.87.0.bb
> @@ -266,7 +266,7 @@ rust_do_install:class-nativesdk() {
>  =20
>       install -d ${D}${bindir}
>       for i in cargo-clippy clippy-driver rustfmt; do
> -        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/relea=
se/$i ${D}${bindir}
> +        cp build/${RUST_BUILD_SYS}/stage1-tools/${RUST_HOST_SYS}/relea=
se/$i ${D}${bindir}
>           patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
>       done
>  =20
> @@ -301,7 +301,7 @@ rust_do_install:class-target() {
>  =20
>       install -d ${D}${bindir}
>       for i in ${EXTRA_TOOLS}; do
> -        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/relea=
se/$i ${D}${bindir}
> +        cp build/${RUST_BUILD_SYS}/stage1-tools/${RUST_HOST_SYS}/relea=
se/$i ${D}${bindir}
>           patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
>       done
>  =20


--=20
# Randy MacLeod
# Wind River Linux

--------------ebdaeD0mvv3r4348OiWnzh6z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-06-24 5:14 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250624091403.2469860-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Rust stable version updated to 1.87.0.
<a class="moz-txt-link-freetext" href="https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/">https://blog.rust-lang.org/2025/05/15/Rust-1.87.0/</a>

* Update LLVM data-layout for arm64.</pre>
    </blockquote>
    Expand this section. Why are you doing this?<br>
    How did you decide on this data-layout?<br>
    <blockquote type="cite" cite="mid:20250624091403.2469860-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

* Rebase existing patches with v1.87.0.

* Two tests from the `ui` and `codegen` modules now fail only on riscv64.
  Enable them on arm32/64 and x86-32/64 targets, while restricting
  them on riscv64 via `only-&lt;target_arch&gt;` tags.</pre>
    </blockquote>
    Nice! Can you mention the overall testsuite status briefly in the v2
    commit log?<br>
    <blockquote type="cite" cite="mid:20250624091403.2469860-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

* Add triagebot.patch file to keep running tidy checks.</pre>
    </blockquote>
    <p>Could you expand this sentence to explain what these checks do,
      please?</p>
    <p>Is this a new feature in 1.87.0? Ah, I read the patch and think
      you should just<br>
    </p>
    <p>include something like the first part of the patch in the commit
      log:</p>
    <p>+Skip tidy triagebot linkcheck if triagebot.toml doesn't exist<br>
      +<br>
      +Distribution tarballs won't include triagebot.toml, which<br>
      +causes tidy checks to fail with the following error:<br>
      +<br>
      +&nbsp;&nbsp; tidy error: triagebot.toml file not found<br>
      +&nbsp;&nbsp; some tidy checks failed<br>
      <br>
      but format it properly and mention that it's a backport.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250624091403.2469860-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

* During rust installation, some binaries were installed from
  'stage2-tools' built path to '${D}${bindir}'. However, from
  v1.87 the stage2-tools are no longer built by default.
  Update logic to install from `stage1-tools` instead.</pre>
    </blockquote>
    <p>Okay. It would be nice to understand why but that's not
      essential, I suppose.<br>
    </p>
    <p><br>
    </p>
    <p>Generally, this is a good commit message, albeit a bit terse as
      pointed out above.</p>
    <p><br>
    </p>
    <p>Can you also comment on the build time and FS footprint changes
      if any ?</p>
    <p>I've looked through the changes below and I don't have any
      comments.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250624091403.2469860-2-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../classes-recipe/rust-target-config.bbclass |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.86.0.bb =&gt; cargo_1.87.0.bb} |   0
 ...teps-tool.rs-switch-off-lto-for-rust.patch |  30 ++--
 ...crease-timeout-in-process-sigpipe-ru.patch |   4 +-
 ...d-statically-in-rustc_driver-feature.patch |  11 +-
 .../rust/files/rust-oe-selftest.patch         | 147 ++++++++++--------
 .../rust/files/triagebot.patch                |  32 ++++
 ...ibstd-rs_1.86.0.bb =&gt; libstd-rs_1.87.0.bb} |   0
 ....86.0.bb =&gt; rust-cross-canadian_1.87.0.bb} |   0
 ...ust-llvm_1.86.0.bb =&gt; rust-llvm_1.87.0.bb} |   4 +-
 meta/recipes-devtools/rust/rust-snapshot.inc  |  78 +++++-----
 meta/recipes-devtools/rust/rust-source.inc    |   3 +-
 .../rust/{rust_1.86.0.bb =&gt; rust_1.87.0.bb}   |   4 +-
 14 files changed, 186 insertions(+), 131 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.86.0.bb =&gt; cargo_1.87.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/rust/files/triagebot.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.86.0.bb =&gt; libstd-rs_1.87.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.86.0.bb =&gt; rust-cross-canadian_1.87.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.86.0.bb =&gt; rust-llvm_1.87.0.bb} (96%)
 rename meta/recipes-devtools/rust/{rust_1.86.0.bb =&gt; rust_1.87.0.bb} (99%)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 906a5083d7..cac6e90a9e 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -171,7 +171,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] = &quot;64&quot;
 FEATURES[armv7-eabi] = &quot;+v7,+vfp2,+thumb2&quot;
 
 ## aarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[aarch64] = &quot;e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32&quot;
+DATA_LAYOUT[aarch64] = &quot;e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32&quot;
 TARGET_ENDIAN[aarch64] = &quot;little&quot;
 TARGET_POINTER_WIDTH[aarch64] = &quot;64&quot;
 TARGET_C_INT_WIDTH[aarch64] = &quot;32&quot;
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index e943ca77d1..c506bb3ad5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= &quot;gettext&quot;
 GCCVERSION ?= &quot;15.%&quot;
 SDKGCCVERSION ?= &quot;${GCCVERSION}&quot;
 GLIBCVERSION ?= &quot;2.41%&quot;
-RUSTVERSION ?= &quot;1.86.0%&quot;
+RUSTVERSION ?= &quot;1.87.0%&quot;
 
 PREFERRED_VERSION_gcc ?= &quot;${GCCVERSION}&quot;
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= &quot;${GCCVERSION}&quot;
diff --git a/meta/recipes-devtools/rust/cargo_1.86.0.bb b/meta/recipes-devtools/rust/cargo_1.87.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.86.0.bb
rename to meta/recipes-devtools/rust/cargo_1.87.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
index 5e0f5912a1..a7da69dce3 100644
--- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
+++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
@@ -24,9 +24,9 @@ diff --git a/src/bootstrap/src/core/build_steps/tool.rs b/src/bootstrap/src/core
 index 087df2f8a..00790affb 100644
 --- a/src/bootstrap/src/core/build_steps/tool.rs
 +++ b/src/bootstrap/src/core/build_steps/tool.rs
-@@ -1,14 +1,11 @@
- use std::path::PathBuf;
- use std::{env, fs};
+@@ -15,14 +15,12 @@
+ #[cfg(feature = &quot;tracing<a class="moz-txt-link-rfc2396E" href="mailto:)]+usetracing::instrument;-usecrate::core::build_steps::compile::is_lto_stage;usecrate::core::build_steps::toolstate::ToolState;@@-36,18+36,20@@index087df2f8a..00790affb100644-Builder,CargoasCargoCommand,RunConfig,ShouldRun,Step,cargo_profile_var,-};-usecrate::core::config::{DebuginfoLevel,RustcLto,TargetSelection};+++usecrate::core::builder::{Builder,CargoasCargoCommand,RunConfig,ShouldRun,Step};+usecrate::core::config::{DebuginfoLevel,TargetSelection};usecrate::utils::channel::GitInfo;usecrate::utils::exec::{BootstrapCommand,command};usecrate::utils::helpers::{add_dylib_path,exe,t};-@@-658,19+655,7@@-SourceType::InTree,-features.as_slice(),+@@-148,20+146,7@@+&amp;self.extra_features,);----//rustdocisperformancesensitive,soapplyLTOtoit.--ifis_lto_stage(&amp;build_compiler){++-ifpath.ends_with(">&quot;)]
+ use tracing::instrument;
  
 -use crate::core::build_steps::compile::is_lto_stage;
  use crate::core::build_steps::toolstate::ToolState;
@@ -36,18 +36,20 @@ index 087df2f8a..00790affb 100644
 -    Builder, Cargo as CargoCommand, RunConfig, ShouldRun, Step, cargo_profile_var,
 -};
 -use crate::core::config::{DebuginfoLevel, RustcLto, TargetSelection};
++
 +use crate::core::builder::{Builder, Cargo as CargoCommand, RunConfig, ShouldRun, Step};
 +use crate::core::config::{DebuginfoLevel, TargetSelection};
  use crate::utils::channel::GitInfo;
  use crate::utils::exec::{BootstrapCommand, command};
  use crate::utils::helpers::{add_dylib_path, exe, t};
-@@ -658,19 +655,7 @@
-             SourceType::InTree,
-             features.as_slice(),
+@@ -148,20 +146,7 @@
+             &amp;self.extra_features,
          );
--
--        // rustdoc is performance sensitive, so apply LTO to it.
--        if is_lto_stage(&amp;build_compiler) {
+ 
+-        if path.ends_with(&quot;</a>/rustdoc&quot;) &amp;&amp;
+-            // rustdoc is performance sensitive, so apply LTO to it.
+-            is_lto_stage(&amp;self.compiler)
+-        {
 -            let lto = match builder.config.rust_lto {
 -                RustcLto::Off =&gt; Some(&quot;off&quot;),
 -                RustcLto::Thin =&gt; Some(&quot;thin<a class="moz-txt-link-rfc2396E" href="mailto:),@@-60,14+62,14@@index087df2f8a..00790affb100644-}+cargo.rustflag(">&quot;),
@@ -60,14 +62,14 @@ index 087df2f8a..00790affb 100644
 -        }
 +        cargo.rustflag(&quot;</a>-Clto=off&quot;);
  
-         let _guard = builder.msg_tool(
-             Kind::Build,
+         if !self.allow_features.is_empty() {
+             cargo.allow_features(self.allow_features);
 diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/core/builder/mod.rs
 --- a/src/bootstrap/src/core/builder/mod.rs
 +++ b/src/bootstrap/src/core/builder/mod.rs
-@@ -11,7 +11,7 @@
- 
- use clap::ValueEnum;
+@@ -13,7 +13,7 @@
+ #[cfg(feature = &quot;tracing&quot;)]
+ use tracing::instrument;
  
 -pub use self::cargo::{Cargo, cargo_profile_var};
 +pub use self::cargo::Cargo;
diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
index bb27ca35ff..5bd1abffb4 100644
--- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
+++ b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
@@ -22,10 +22,10 @@ index 11f363d62..c12d66016 100644
 +++ b/tests/ui/process/process-sigpipe.rs
 @@ -23,7 +23,7 @@ use std::thread;
  fn main() {
-     // Just in case `yes` doesn't check for EPIPE...
+     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
      thread::spawn(|| {
 -        thread::sleep_ms(5000);
 +        thread::sleep_ms(50000);
          process::exit(1);
      });
-     let output = process::Command::new(&quot;sh&quot;)
+     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` for `nto`
diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
index 20a49d46dc..9bbbce0182 100644
--- a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
+++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
@@ -200,11 +200,10 @@ diff --git a/src/bootstrap/src/core/build_steps/compile.rs b/src/bootstrap/src/c
 index 27bbc8bd8f..a6fc4df2eb 100644
 --- a/src/bootstrap/src/core/build_steps/compile.rs
 +++ b/src/bootstrap/src/core/build_steps/compile.rs
-@@ -1940,24 +1940,8 @@ impl Step for Assemble {
-         let src_libdir = builder.sysroot_target_libdir(build_compiler, host);
+@@ -2158,23 +2158,7 @@
          for f in builder.read_dir(&amp;src_libdir) {
              let filename = f.file_name().into_string().unwrap();
--
+ 
 -            let is_proc_macro = proc_macros.contains(&amp;filename);
 -            let is_dylib_or_debug = is_dylib(&amp;f.path()) || is_debug_info(&amp;filename);
 -
@@ -214,8 +213,7 @@ index 27bbc8bd8f..a6fc4df2eb 100644
 -            let can_be_rustc_dynamic_dep = if builder
 -                .link_std_into_rustc_driver(target_compiler.host)
 -                &amp;&amp; !target_compiler.host.is_windows()
-+            if (is_dylib(Path::new(&amp;filename)) || is_debug_info(&amp;filename)) &amp;&amp; !proc_macros.contains(&amp;filename)
-             {
+-            {
 -                let is_std = filename.starts_with(&quot;std-&quot;) || filename.starts_with(&quot;libstd-&quot;);
 -                !is_std
 -            } else {
@@ -223,6 +221,7 @@ index 27bbc8bd8f..a6fc4df2eb 100644
 -            };
 -
 -            if is_dylib_or_debug &amp;&amp; can_be_rustc_dynamic_dep &amp;&amp; !is_proc_macro {
-                 builder.copy_link(&amp;f.path(), &amp;rustc_libdir.join(&amp;filename));
++            if (is_dylib(Path::new(&amp;filename)) || is_debug_info(&amp;filename)) &amp;&amp; !proc_macros.contains(&amp;filename) {
+                 builder.copy_link(&amp;f.path(), &amp;rustc_libdir.join(&amp;filename), FileType::Regular);
              }
          }
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 49d85072cb..b7ef806e65 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -47,61 +47,85 @@ diff --git a/library/std/tests/sync/rwlock.rs b/library/std/tests/sync/rwlock.rs
 index 1a9d3d3f12f..0a9cfc48806 100644
 --- a/library/std/tests/sync/rwlock.rs
 +++ b/library/std/tests/sync/rwlock.rs
-@@ -47,6 +47,7 @@ fn frob() {
- }
-
+@@ -74,6 +74,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_rw_arc_poison_wr() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -72,6 +73,7 @@ fn test_rw_arc_poison_mapped_w_r() {
- }
-
+@@ -87,6 +88,7 @@
+ 
+ #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
++#[ignore]
+ fn test_rw_arc_poison_mapped_w_r() {
+     let arc = Arc::new(RwLock::new(1));
+     let arc2 = arc.clone();
+@@ -101,6 +103,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_rw_arc_poison_ww() {
      let arc = Arc::new(RwLock::new(1));
      assert!(!arc.is_poisoned());
-@@ -100,6 +102,7 @@ fn test_rw_arc_poison_mapped_w_w() {
+@@ -115,6 +118,7 @@
  }
-
+ 
+ #[test]
++#[ignore]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
+ fn test_rw_arc_poison_mapped_w_w() {
+     let arc = Arc::new(RwLock::new(1));
+@@ -131,6 +135,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_rw_arc_no_poison_rr() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -127,6 +130,7 @@ fn test_rw_arc_no_poison_mapped_r_r() {
- }
-
+@@ -160,6 +165,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_rw_arc_no_poison_rw() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -192,6 +196,7 @@ fn test_rw_arc() {
- }
-
+@@ -227,6 +233,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_rw_arc_access_in_unwind() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -275,6 +280,7 @@ fn drop(&amp;mut self) {
- }
-
+@@ -326,6 +333,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_into_inner_poison() {
      let m = new_poisoned_rwlock(NonCopy(10));
-
-@@ -299,6 +305,7 @@ fn test_get_mut() {
- }
-
+ 
+@@ -362,6 +370,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_get_mut_poison() {
      let mut m = new_poisoned_rwlock(NonCopy(10));
+ 
+@@ -567,6 +576,7 @@
+ 
+ #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
++#[ignore]
+ fn panic_while_mapping_write_unlocked_poison() {
+     let lock = RwLock::new(());
 
 diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
 --- a/library/test/src/tests.rs
@@ -117,52 +141,22 @@ diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
 diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/mutex.rs
 --- a/library/std/tests/sync/mutex.rs
 +++ b/library/std/tests/sync/mutex.rs
-@@ -193,6 +193,7 @@
- }
-
+@@ -312,6 +312,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn test_mutex_arc_poison_mapped() {
      let arc = Arc::new(Mutex::new(1));
      assert!(!arc.is_poisoned());
-diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/mutex.rs
---- a/library/std/tests/sync/mutex.rs
-+++ b/library/std/tests/sync/mutex.rs
-@@ -272,6 +272,7 @@
- }
-
+@@ -391,6 +392,7 @@
+ 
  #[test]
+ #[cfg_attr(not(panic = &quot;unwind&quot;), ignore = &quot;test requires unwinding support&quot;)]
 +#[ignore]
  fn panic_while_mapping_unlocked_poison() {
      let lock = Mutex::new(());
 
-diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/tests/sync/rwlock.rs
---- a/library/std/tests/sync/rwlock.rs
-+++ b/library/std/tests/sync/rwlock.rs
-@@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_poison_mapped_w_r() {
-     let arc = Arc::new(RwLock::new(1));
-     let arc2 = arc.clone();
-@@ -86,6 +87,7 @@ fn test_rw_arc_poison_ww() {
- }
-
- #[test]
-+#[ignore]
- fn test_rw_arc_poison_mapped_w_w() {
-     let arc = Arc::new(RwLock::new(1));
-     let arc2 = arc.clone();
-@@ -431,6 +433,7 @@ fn panic_while_mapping_read_unlocked_no_poison() {
- }
-
- #[test]
-+#[ignore]
- fn panic_while_mapping_write_unlocked_poison() {
-     let lock = RwLock::new(());
-
 diff --git a/library/coretests/benches/num/int_log/mod.rs b/library/coretests/benches/num/int_log/mod.rs
 index 3807cd5d76c..018c5c04456 100644
 --- a/library/coretests/benches/num/int_log/mod.rs
@@ -199,10 +193,10 @@ index 9d4f52a092..d425e5f7b7 100644
  fn thread_current_in_dtor() {
      // Go through one round of TLS destruction first.
      struct Defer;
-diff --git a/library/alloc/tests/sort/tests.rs b/library/alloc/tests/sort/tests.rs
+diff --git a/library/alloctests/tests/sort/tests.rs b/library/alloctests/tests/sort/tests.rs
 index 14e6013f96..b670f27ab4 100644
---- a/library/alloc/tests/sort/tests.rs
-+++ b/library/alloc/tests/sort/tests.rs
+--- a/library/alloctests/tests/sort/tests.rs
++++ b/library/alloctests/tests/sort/tests.rs
 @@ -915,12 +915,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
  macro_rules! instantiate_sort_test_inner {
      ($sort_impl:ty, miri_yes, $test_fn_name:ident) =&gt; {
@@ -234,10 +228,10 @@ diff --git a/tests/assembly/dwarf-mixed-versions-lto.rs b/tests/assembly/dwarf-m
 index 5b8e5ff4f4a..e558fbd7bd7 100644
 --- a/tests/assembly/dwarf-mixed-versions-lto.rs
 +++ b/tests/assembly/dwarf-mixed-versions-lto.rs
-@@ -1,6 +1,11 @@
- // This test ensures that if LTO occurs between crates with different DWARF versions, we
+@@ -2,6 +2,11 @@
  // will choose the highest DWARF version for the final binary. This matches Clang's behavior.
-
+ // Note: `.2byte` directive is used on MIPS.
+ 
 +//@ only-x86
 +//@ only-x86_64
 +//@ only-arm
@@ -259,3 +253,30 @@ index 0e712bc3a4e..93965d990d0 100644
  //@ revisions: OPT2 OPT3
  //@[OPT2] compile-flags: -Copt-level=2
  //@[OPT3] compile-flags: -C opt-level=3
+diff --git a/tests/codegen/uninhabited-transparent-return-abi.rs b/tests/codegen/uninhabited-transparent-return-abi.rs
+index face1577c3f..d69e5e34a7b 100644
+--- a/tests/codegen/uninhabited-transparent-return-abi.rs
++++ b/tests/codegen/uninhabited-transparent-return-abi.rs
+@@ -1,4 +1,8 @@
+ //@ compile-flags: -Copt-level=3
++//@ only-x86
++//@ only-x86_64
++//@ only-arm
++//@ only-aarch64
+ 
+ // See <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/135802">https://github.com/rust-lang/rust/issues/135802</a>
+
+diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
+index 57027364699..3faa7ea035e 100644
+--- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
++++ b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
+@@ -1,5 +1,9 @@
+ //@build-pass
+ //@compile-flags: -Clink-dead-code=true --crate-type lib
++//@ only-x86
++//@ only-x86_64
++//@ only-arm
++//@ only-aarch64
+ // We used to not handle all &quot;rustic&quot; ABIs in a (relatively) uniform way,
+ // so we failed to fix up arguments for actually passing through the ABI...
+ #![feature(rust_cold_cc)]
diff --git a/meta/recipes-devtools/rust/files/triagebot.patch b/meta/recipes-devtools/rust/files/triagebot.patch
new file mode 100644
index 0000000000..715664d081
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/triagebot.patch
@@ -0,0 +1,32 @@
+Skip tidy triagebot linkcheck if triagebot.toml doesn't exist
+
+Distribution tarballs won't include triagebot.toml, which
+causes tidy checks to fail with the following error:
+
+   tidy error: triagebot.toml file not found
+   some tidy checks failed
+
+Drop the triagebot.toml check which is mostly to catch broken
+path filters *within* `triagebot.toml` and not enforce
+the existence of it.
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/142666/commits">https://github.com/rust-lang/rust/pull/142666/commits</a>]
+
+Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+---
+diff --git a/src/tools/tidy/src/triagebot.rs b/src/tools/tidy/src/triagebot.rs
+--- a/src/tools/tidy/src/triagebot.rs
++++ b/src/tools/tidy/src/triagebot.rs
+@@ -6,8 +6,11 @@
+ 
+ pub fn check(path: &amp;Path, bad: &amp;mut bool) {
+     let triagebot_path = path.join(&quot;triagebot.toml&quot;);
++
++    // This check is mostly to catch broken path filters *within* `triagebot.toml`, and not enforce
++    // the existence of `triagebot.toml` itself (which is more obvious), as distribution tarballs
++    // will not include non-essential bits like `triagebot.toml`.
+     if !triagebot_path.exists() {
+-        tidy_error!(bad, &quot;triagebot.toml file not found&quot;);
+         return;
+     }
+
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.87.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
similarity index 96%
rename from meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
index 327e8e6b69..d70aa350ab 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
@@ -2,9 +2,9 @@ SUMMARY = &quot;LLVM compiler framework (packaged with rust)&quot;
 LICENSE ?= &quot;Apache-2.0-with-LLVM-exception&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.rust-lang.org">&quot;http://www.rust-lang.org&quot;</a>
 
-# check src/llvm-project/cmake/Modules/LLVMVersion.cmake for llvm version in use
+# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE = &quot;19.1.7&quot;
+LLVM_RELEASE = &quot;20.1.1&quot;
 
 require rust-source.inc
 
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index 445390fcaf..87b39a2cc2 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = &quot;1.85.0&quot;
+SNAPSHOT_VERSION = &quot;1.86.0&quot;
 
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = &quot;e742b768f67303010b002b515f6613c639e69ffcc78cd0857d6fe7989e9880f6&quot;
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = &quot;8af1d793f7820e9ad0ee23247a9123542c3ea23f8857a018651c7788af9bc5b7&quot;
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = &quot;cdebe48b066d512d664c13441e8fae2d0f67106c2080aa44289d98b24192b8bc&quot;
-SRC_URI[clippy-snapshot-aarch64.sha256sum] = &quot;f3b8e769021a6bcee8174ac49a60c367effb6d97af0f2a6c44dc9ea39ff2bda9&quot;
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = &quot;ccece9e59546d2e6ff3fc3b8f4b033aab21631c271eefbe814b3cbace6628c6e&quot;
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = &quot;176129577a5d560bbd94bcd2d24c0228bb495b73219df02556b4e4b4f0815bf7&quot;
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = &quot;37156542b702e8b4ffd1c5c75017632582343e93ca378285cdc92196c85c77e3&quot;
+SRC_URI[clippy-snapshot-aarch64.sha256sum] = &quot;e70edcf560e6b50861618d7045d2b38cae9e2a555f489062570e2e7041563f42&quot;
 
-SRC_URI[rustc-snapshot-i686.sha256sum] = &quot;c5a5751f3cfa027b53fee83d01dec8e555f3622b6993335aed12b1747aa9543c&quot;
-SRC_URI[rust-std-snapshot-i686.sha256sum] = &quot;401571adfe1223d83ed041e5a8c54c1f3afb3010d1d5b0c1fd79e7da1ab0a0de&quot;
-SRC_URI[cargo-snapshot-i686.sha256sum] = &quot;3832027242911ab96fd86128587fc563596a5b10e8e38a073facf61c1ac9668f&quot;
-SRC_URI[clippy-snapshot-i686.sha256sum] = &quot;74ed13a67c6ea0452c0d9e8697c6cfdd8280f983b207187ac93c287f72b65066&quot;
+SRC_URI[rustc-snapshot-i686.sha256sum] = &quot;976f4604d949d722738a9fe95313035226571128396e942b0fc678180be487b0&quot;
+SRC_URI[rust-std-snapshot-i686.sha256sum] = &quot;ce9f0fa4b0760730e26bf315cebe099f0b883436e095c5fc4b94ba20bd9f121a&quot;
+SRC_URI[cargo-snapshot-i686.sha256sum] = &quot;24f20bdc1bb14f4ffbdc2f540488bebc3340437418725c3162215ae03cdad480&quot;
+SRC_URI[clippy-snapshot-i686.sha256sum] = &quot;6788449fa0eceebe4ea8c797bbaf27495dad152087b3085d58dc05cacab0617a&quot;
 
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = &quot;d43d2119ff25d879b2d280d3e5a03fcd21c57a32d479ad5626500c32432f18c9&quot;
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = &quot;2d05f5e13e7cb3ee6b0ca0dcd13a231a28eeb0faa4d15257a35cf7284149cd6a&quot;
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = &quot;9aa447eefcd3ba2f9dbab77596c8669849899ab243543fc8f1914089707081ac&quot;
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] = &quot;d437b39465343a71ff475a65acb6c03bc0f800861f293f48accf1fa170458432&quot;
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = &quot;970089ad61f8ca82017b59444aee483c1fc005e3f7a6af63cd5f146df8287cce&quot;
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = &quot;2f528377f57fbf81da35e2f08ec7ba50daddabebdce2cc86b6ec909fee157a33&quot;
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = &quot;c3b8ab03b64c824f2ea25db578b5760d44302be3fd1e4a78404c98cba39301f4&quot;
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] = &quot;1ab711423497a1d02408a240da28ad366450574dd7f528ffaee80d1d5ed10550&quot;
 
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = &quot;fbe7154abc641d6cacfdc6239ed4701fc7a09b5046c6d1bd209b59e7f2b2d0f0&quot;
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = &quot;ab2d5ac7cd295adaa4d959e8abbf42b372292c95d1a9f18aad64951ad6e2ab2b&quot;
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = &quot;e67c30a72f969c51ad199084b3ce0cdc573a4e21f732b2cc39dafbcb9807a5ce&quot;
-SRC_URI[clippy-snapshot-powerpc.sha256sum] = &quot;497104d49803598cd3801749ac86cb26c88a2bd9c3a8c7bdc18fdf487f4650c0&quot;
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = &quot;21ea61181ba7daa04f61bec6a295ad76ce34bfbd74ad1d679c4548977bd82eb9&quot;
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = &quot;e5ed58a861619bcc89fc3f969174c84fd6ed8a26b5d4b196f06efb868653c1c1&quot;
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = &quot;fd832c269af81dd1ee9f3831991fccdc2c7312e9a9069908510eefe7c313d144&quot;
+SRC_URI[clippy-snapshot-powerpc.sha256sum] = &quot;c94578d31e4145a4169ab5761537a2a0133818278fb62ee76251ef8ef45228c8&quot;
 
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = &quot;f8e38291ba4241bc28e9c118d7a449ce3601abdeb2076f2f618858679fb3b929&quot;
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = &quot;e9ff89e759125ad2786ad2f6c40e820095720ea00fba66819d15fba79489430a&quot;
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = &quot;73cf850f6715acbf0029c7e5d4694825f61bd4e193e6413e65a78bcb13df97b7&quot;
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] = &quot;29b63f23cd9af95846a246c9cc8349e514c3fb92ec0c840a38155e252d6cc668&quot;
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = &quot;a54bbe16e6a405f137a0dc51fd570140c80077ba769d29d885a60e74cb3196bb&quot;
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = &quot;06538b41a9351c449d215498d4ec2f072f728bd18df8fac7ef8534a0d0f34e27&quot;
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = &quot;4d398cd8da17d1a5f26734b39cb17e791b243ac3570f8da2e5e5580a9dfad578&quot;
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] = &quot;0abf31a8cb2762a7a81dbee8a5798e43e11a83326711ce00ad16c5587bcf5e49&quot;
 
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = &quot;371e40f9d6d82aecb056f70f82868d98ddc1c20510aa7d388442ac8d2d86a6ca&quot;
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = &quot;d0cfda4e18623d17922eb367e44ac9549ab3d5fe1c0bdbe0c2c95754255fa705&quot;
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = &quot;e1469f4249a7e21f872af487dcd1bd10ce388b5b3679bdab0cb0965e1e30fe47&quot;
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = &quot;d8c590bc2e6fc75800e41516427f5095ba0e15d7633167689499fcf6523dc61a&quot;
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = &quot;7585a20b02b7dd497e393a2e7552a0c6aabb51556fcf7507c6f7ffde530f8c88&quot;
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = &quot;fcf940c0553a04cb9bd85cce524729c2f54b000b554fee95c7aa218d608b7e3d&quot;
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = &quot;8fefd2317023716a018986c4a62558a7b543ccf34e4e6d1104afc66edcae1c9c&quot;
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = &quot;8cc65649396ccad73cecd17b972ab8d4c34837136cf374425be63d697b541469&quot;
 
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = &quot;2da33044f17a8bc49a1478dc1eb2536df491a44d6e6bb0ec7c86f46877d44e98&quot;
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = &quot;0f5ecfe54859bbe715821f982b1a5396784fdf55605d00ece05d3e57a965ed16&quot;
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = &quot;c9f28b519799fc2d8089865e30fad04bb5339604d13725365fcd7ad7ee6c1489&quot;
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = &quot;9d21bc180196bccdb301e7e03034d3fd0df14b0c6520da0317bba7b1ce385fe8&quot;
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = &quot;4d1106b576221182f84412f3377a5148eab6950d20e45e4274cd8b58df46f26b&quot;
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = &quot;b28b9c2f183521a204f2899610253c11c86ee4aa903fe66d8410dfaa22c926e6&quot;
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = &quot;7825556908e10a48320cfb2d812851271d7cf549977173e028a0dd23af9d7eac&quot;
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = &quot;c39c53a82fdaaa97413728a4f3f9feb5b31bdf3e3e563c64651bd01713e79166&quot;
 
-SRC_URI[rustc-snapshot-s390x.sha256sum] = &quot;308361737ed522aa77dd8b4ea91b5db244113ada5fa234d3ed008b526d07e2e8&quot;
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = &quot;d25053fbee1a0cb899bac8c8e4968aa35f9c3637e486cb5bb2c79ad43a78f3e7&quot;
-SRC_URI[cargo-snapshot-s390x.sha256sum] = &quot;7e1defd60095c91ded1612194f811ec5f2fc2e83bb914d35594d01fa3c54049d&quot;
-SRC_URI[clippy-snapshot-s390x.sha256sum] = &quot;9780d8c4cfef9d05460b3e540aad142391b2e3994accf8cfc8afb87fefac6cf0&quot;
+SRC_URI[rustc-snapshot-s390x.sha256sum] = &quot;18caf22fbfc4d26c80b39b4c6b1cd5fb42dba3e32d5d3600c22eae6f688d7f4c&quot;
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = &quot;3919f6962d0aefdd2cd75d8dba749ed826936065b64c9a8d54d1d85c2685fd66&quot;
+SRC_URI[cargo-snapshot-s390x.sha256sum] = &quot;1c6eb1be254574881a611a3b8904cdcfe43c79a285875673e59c890dcd5766c2&quot;
+SRC_URI[clippy-snapshot-s390x.sha256sum] = &quot;c87183b52ddb4085ddf2524a775fd255d5fd11ad2fdd6424574f08750a8cf378&quot;
 
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = &quot;7436f13797475082cd87aa65547449e01659d6a810b4cd5f8aedc48bb9f89dfb&quot;
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = &quot;285e105d25ebdf501341238d4c0594ecdda50ec9078f45095f793a736b1f1ac2&quot;
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = &quot;0aff33b57b0e0b102d762a2b53042846c1ca346cff4b7bd96b5c03c9e8e51d81&quot;
-SRC_URI[clippy-snapshot-x86_64.sha256sum] = &quot;0dc3ca1708a6c9eed05d0802364377572b79ff079815b7bcbe8e3991f77c4117&quot;
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = &quot;4438b809ce4a083af31ed17aeeedcc8fc60ccffc0625bef1926620751b6989d7&quot;
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = &quot;67be7184ea388d8ce0feaf7fdea46f1775cfc2970930264343b3089898501d37&quot;
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = &quot;c5c1590f7e9246ad9f4f97cfe26ffa92707b52a769726596a9ef81565ebd908b&quot;
+SRC_URI[clippy-snapshot-x86_64.sha256sum] = &quot;02aaff2c1407d2da8dba19aa4970dd873e311902b120a66cbcdbe51eb8836edf&quot;
 
-SRC_URI[rust-std-snapshot-i586.sha256sum] = &quot;3cb7318da10876de14076549d79410a8441923a92d62b616d8c105f5f5cd831b&quot;
+SRC_URI[rust-std-snapshot-i586.sha256sum] = &quot;f0bddc6dba7d719b8ba131bcd634a8379e00fc825a51c0f17abf424c9cb5c052&quot;
 
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = &quot;65cd47af46a5b74e61ff6ae4cce8a979ee8670a57b8aa61e732828d1da073f73&quot;
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = &quot;722238ae13e6e101d1b698d2b3a7915d59bb7f485b594e8d833cce8b9460383b&quot;
 
 SRC_URI += &quot; \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 30b159a84f..ed15d9c763 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,8 +9,9 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC}\file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;patchdir=${RUSTSRC}\file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patchdir=${RUSTSRC}\+file://triagebot.patch;patchdir=${RUSTSRC}\">&quot;https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;patchdir=${RUSTSRC} \
             file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patchdir=${RUSTSRC} \
+            file://triagebot.patch;patchdir=${RUSTSRC} \
 &quot;</a>
-SRC_URI[rust.sha256sum] = &quot;d939eada065dc827a9d4dbb55bd48533ad14c16e7f0a42e70147029c82a7707b&quot;
+SRC_URI[rust.sha256sum] = &quot;8623b8651893e8c6aebfa45b6a90645a4f652f7b18189a0992a90d11ac2631f4&quot;
 
 RUSTSRC = &quot;${UNPACKDIR}/rustc-${RUST_VERSION}-src&quot;
 
diff --git a/meta/recipes-devtools/rust/rust_1.86.0.bb b/meta/recipes-devtools/rust/rust_1.87.0.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust_1.86.0.bb
rename to meta/recipes-devtools/rust/rust_1.87.0.bb
index b13ec116be..5d804c7398 100644
--- a/meta/recipes-devtools/rust/rust_1.86.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.87.0.bb
@@ -266,7 +266,7 @@ rust_do_install:class-nativesdk() {
 
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
+        cp build/${RUST_BUILD_SYS}/stage1-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
         patchelf --set-rpath &quot;\$ORIGIN/../lib&quot; ${D}${bindir}/$i
     done
 
@@ -301,7 +301,7 @@ rust_do_install:class-target() {
 
     install -d ${D}${bindir}
     for i in ${EXTRA_TOOLS}; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
+        cp build/${RUST_BUILD_SYS}/stage1-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
         patchelf --set-rpath &quot;\$ORIGIN/../lib&quot; ${D}${bindir}/$i
     done
 
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ebdaeD0mvv3r4348OiWnzh6z--

