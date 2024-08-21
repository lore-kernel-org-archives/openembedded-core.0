Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE2CC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 01:44:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10442.1724204630948524092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 18:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8963c1c4a2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L1bp8L013726
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 18:43:50 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q543dux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 18:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oug3zMyUJ6OGkAaKr+BmUf4y8zowaFhbiT0ksODBbiMMCx1L7h9Ey8d3x6jrrjOLMk887cur6m3uFFJnDh9uu4Q2b2h9FWX8nMFiVwBaEwFgxz5uGb+AJzyXiozRA/y3XrB4xWwSH+ZVAfLBlfiOoxuhuktDdgavkBZWXJNocZuVzVpexday3UTQol6Ein3550BSh4r1Y6Uq3rK1VPDaKOZrDPFIS/+EG8W+6zuBZ+MRy9KVci5epUqrX5c/anqzAOCLFXFrrsUumWWi7L75bXx7Wq+2g81c0h+5WfRUGckPXpJ8N4hUj571vtWwYCw1DDIsViYKQObGfXQjBBVzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvQsoaTDnAk5eB6ROWzQMpL666KN2jWH1qoRiN5uzWE=;
 b=MtJYk+B5eCbR3KrKGNP3YQuMZgd5LPjdRwxitJvjBP+3onSer3nxab+wN4+0JRdAnvY0AXfDzOiTJpP9XiKnLnbsilvdM4Htj3xhulAE09ig5ugPWEGLIjK1zouqzPzSO5gLFsOV9TLUa26j8P4P3RrVh0iTw0ItaxHVXTKPT43KfBQUIy4Wbl0qmteTQ2iBy2D3HIpQ6WEfOsrYMd/4x/+PYVDPs+8/kLQJw3Irc0j1hAKo2jfHI3fTxQ29zPGqliwyXPFlbvLj49zZdxXqTtNbSS61hpU3y2QIeoNYcaij+riniHAwiHesTB13fy2lwhp7ynfdEybcPlnypv66Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 21 Aug
 2024 01:43:45 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 01:43:45 +0000
Content-Type: multipart/alternative;
 boundary="------------riadIykxQd0JZvITq0Nlx5JF"
Message-ID: <2a331ae8-3773-4cb3-9dbe-07b2eea418ad@windriver.com>
Date: Tue, 20 Aug 2024 21:43:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: Oe-selftest changes for rust v1.78
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20240816155419.213703-1-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240816155419.213703-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: BYAPR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::37) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a73c4fd-d184-41fd-30f0-08dcc182b1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cDZaa3ZWajZvUXdtVXR2bVNHdmlCMk5QMWJoNHZOZnhDam5JL0ZxOFd5TFFP?=
 =?utf-8?B?OXpvMkd6UWR0V1FZbnlaLzkrN2paSWpmYTEvZTQ3TnRNRTRTK2tKUFNMWmJJ?=
 =?utf-8?B?L2FFaFAvMkhnanpJYnFqRGNNR1ArY09OcklBY2s2anpZcHRQa1pCdmZUaFM5?=
 =?utf-8?B?U09VZGdwaXQvUUdxSDhETVNyeXdQZ0lKY0w2MkpqUSt5ZktUekZTUUprMTFH?=
 =?utf-8?B?SnFOQlV6ald2Q3djMTZTT2J3akZmbFhPOGI0M1h5dDB2WFZnc2RRdktma2hw?=
 =?utf-8?B?RjNmZ0kzbTRHQllDTXNncTJuRDRnSytZaWNxZWQ0MkRsT3FoaW5DdE1jbEVB?=
 =?utf-8?B?T1U5cHlkMUU4aVVrSzB1TGNlSlVjelR6Mmt3L2tSL2k5djgyWHNIbytHREN5?=
 =?utf-8?B?eWVNVERyTEN1eURXdzRWamZaYW8yMUxwbjA0MnFkcUhYc2ZCZlQ2VndNMzZv?=
 =?utf-8?B?ekxMK3VBOFYzeHJKSmJobjR5Q2c4UUZaM3JPK2RLQTZra0J6V3piQ09DcE13?=
 =?utf-8?B?QTFpdTVubTlkM0xIVDRUekZ5SXhoZHRZR0N0N3BkV3A2S1IyeVdPekVNeDk4?=
 =?utf-8?B?UHpmdzJNWVM0VjJVUzErRW9sZUlDb05mL1h4ejFYZTJKVFpTQW5RWnh0Q0Z1?=
 =?utf-8?B?YUVwR0s3N3FIVzhaLzNpSlpjMGkyZ3NwUEtrbHozL0V2OXlBTERwOVVXM2JP?=
 =?utf-8?B?N0sweVQzeGpESWM1S2cxVm9aZllvR3hqUXF1RTJUeG1zM1M3aVFqU3BOV3F2?=
 =?utf-8?B?d3Z2S0NaT0pUTXpNdkxYYkNYenFlWm53dFhKcjZIRFk4MEp3VEdNZ3l6d21J?=
 =?utf-8?B?LzFpUmxIZDMxWDZnaC8vbE9HREdwZEg0R2g0UEtNZ25WV1FiNDljYWtleVdZ?=
 =?utf-8?B?NDBvZ240UWxJOGpMSDEycXJTY1orWklybkcwSUE3SUNZcjNWT1VpN1NBY2RM?=
 =?utf-8?B?N0xncGcwNUQ0Z0VVMjhRZHQralltUW14clJtMndCbVE5bUVyRTFSbnZ6aTd0?=
 =?utf-8?B?V1hTVHJkcE9zVEVNRkVtaHkvbU1PUUlPWUM1L1BiRUhtcmkyajBrTXBaN3M4?=
 =?utf-8?B?STExby9kdW1EM1dvTUdqTmtvMGxQQmMxNzA1bXNLNWxTNjVjZXBRUW9vZE5T?=
 =?utf-8?B?SUk1VXlCMnN3TUord0VMQ1I1WkgvR05YQkF4TUpHbEs4S01ERVFqcW1DWXl1?=
 =?utf-8?B?aTNVcWtzbVpzK2dtVnZSeVoyajRwMWNaeFlpSUpqY3pBdS9lRHErdGVVWjZw?=
 =?utf-8?B?N1RXeFRJNDFmc3JrUkhEbi9oUVRYR0Vva28xZ25yOU9rZGdHQWFOQ2ZPMm92?=
 =?utf-8?B?RXJZVzNDeDJub3IxNllOS2hvenRlWjIvc0NFbTZnREZ2M3I3NzU4bjdaWWdj?=
 =?utf-8?B?Sm5Ka0tHUDFOb05ZMzQ1MFZlWHF3aW9oYSs0UGJKT09wMmFwSHd0a0FyQ0Jm?=
 =?utf-8?B?OWR4aFhLQ3dwS1ZFVVpPRjBSZ3dlc1lGRG1zdHlWa0R1Qm0rdmNVWERuTEhK?=
 =?utf-8?B?NW9TSFFmTkFuYWo4Qk0rUFZ5a2hXVnpBVkZiaGFaRFN1TXgvbUlWOEdYOTF1?=
 =?utf-8?B?b29PYzZpZ245M2lrZThVZ2lBdjhuRmdjYVdtQlNrWCtNekV6dlU1cXI2MzNK?=
 =?utf-8?B?RFgzc3pVWHlUclNNL3ZTcFRhOFRDVUV6QWVkNkdQVnNIbmd5elV1bDhXQXNv?=
 =?utf-8?B?aXJhVGhkZWUxaG83RWxKTnlEUVhubURYR1ljdWtNelllMG1lRnhDZXNVQTZz?=
 =?utf-8?B?VFVkZVpNaUo2T3E0b1ZNY2xaeFRHYXd4ank0YWNPMXVXeDBiQ0IvSUxXWU8x?=
 =?utf-8?B?bFJ3U0ZHb1FXYVdqaEd1Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXFnNFFaSVNIclRYZmdJV0gySklkTS9rRVFHaGJjYk1DenhuNWxLV0ZrY2Y2?=
 =?utf-8?B?ekVoMnh2bkJwQ0l1QTlmdTA2VXZwRnRTazdKK3BFMUxrSWkzSVUvZk9KNkxB?=
 =?utf-8?B?ZjAyYndwd3hRYXF3T2R4aFErblYrcE9QU0NQdlU1TVNjSEsyODRTZDMvMzB3?=
 =?utf-8?B?MG1iZGR6U0NqUTQ1Tkx3WWZnOU01akhTYXplNEY0ZXJQbHpaRGhvQ2lScnla?=
 =?utf-8?B?cUZHVjZ3ak5BeDBoUDRBVG5aM1A1ZUhZRlNwbVZBMmJwRXJicnZ1d2F2Uldt?=
 =?utf-8?B?NndtcHMxT1FUd3N1K2E4TlRPbjhjd1MxakN3ZmExVlBycVJIaWZKMkFHZnpN?=
 =?utf-8?B?UmZKcllZTlI0Mit0ZzhlQWZuMmhmZm1KTWJYbVlzL1NOQmRlS3hWak1XOUNl?=
 =?utf-8?B?NzlDVDVkUmFydFRpU3E4MDRDeUhNQ3d6Q0E2MWFrZDhDTVowN0lLT3crRWxl?=
 =?utf-8?B?U2M3TzZYQ0dUUzBibG04MGxZaEVaNHVLZEsyeW1xTysvQmN2YnNFTjZwUTJm?=
 =?utf-8?B?emE3QStWdDRaUEpDVHQzejlvcGhSNS9qTk0wL2QxSzV0cjNuRDJvNjdzOERl?=
 =?utf-8?B?eGF3OEFhVncydWRidGVFZEV5SlRlR3Mrem5yRWFONjNUUTNHaHhWNkVRdnEx?=
 =?utf-8?B?Ty9zVzhvdGlyQ3ZCYWlQSkVjaXN4S1ZHdFRrWHJjWFkvcU5HN2MwTWdEMG5K?=
 =?utf-8?B?R0VnUU9HWE1Yd2hQSmcveDJhcFhTcTJnZWZwMStRcDRELys1RmdLcnRpZllq?=
 =?utf-8?B?M3QrM1B3Z1R3dloxRXVMWXFsa3JCWk42c1Rsb3l1NklWQ21SNnB4V0FlUTQr?=
 =?utf-8?B?cWFDZnUwYVlIV3ZEQTFrRjNQQ0hkaGd6cUN4Yy9YTWZxbDlVenBMK0lDYVRW?=
 =?utf-8?B?STROT0pNQU53YytjL0hWUm5FWGRrY0NybWhKV0FoT3hxRzYwS0w5Z2dNblNy?=
 =?utf-8?B?TTJqbnNxZEUyWEphOUlyak9sSE5nKzRoQndtTWtPcmJqVTlHL1d0Y2RGYXFM?=
 =?utf-8?B?OTVoQzVLb1dzcS92NkhKMllMYmhBVllmTG9senNweHFCRjlsYmlkdU16eUE5?=
 =?utf-8?B?YXNFNlA5RGpGVWpWcW9nK0ZId0lBOXQ2RVNzUnVFNXJVR2xEY0RoRzFhSW5S?=
 =?utf-8?B?RUxYMFBnOXJGeFpXRGdDQ0hhWjQyTEJYTEhVVjExNkNGaTFnVWI1R0YvaWVw?=
 =?utf-8?B?NkRxRFFvWVZzZnlnTWVxNmFxTGxySmppR1F4ZDhCKzNrc2xEaUx5L1QvWDl3?=
 =?utf-8?B?cTFDVTVuSlBjTitFci9XVDF1Nzdoakc3ZWhnaVNJWEtOTE9MTFBpQTlubCsx?=
 =?utf-8?B?R0xOeW1CeU5XalRDN05ES3R0RE1NT0lCanBCZ2VDVnJaelFwcHMzRExCR3Rn?=
 =?utf-8?B?OGlpN3ZtdG16YlJmK3h0UnBid0JjNmVpKzB3L0paaHVoaW1FckVFNmxLQmpG?=
 =?utf-8?B?WkVvUHh6VVRHWWlWTkJuaWEweFRNV3Vka29UdWhWUXRzRTh5ZjN2UllBUXNW?=
 =?utf-8?B?eUxHYUk5RnZoQkV3bFZMZThXd0xGNG9Sa0xYN2tjdW1qWUhNbWk2RkQxVDBK?=
 =?utf-8?B?c20xZHk2OXEweDlERjhmVEFRRWpseUJtUnN4VzZUdGRXZzJ6bTBzN005REZM?=
 =?utf-8?B?dGxscnZRQysxdWhvTm41azVIVEZVS3J3TmdpRWo4MENMSGhjdjVsQklxTVZv?=
 =?utf-8?B?V2ZDUjZQQXo1aW54NmNYUTZpUzlJUkdkUkJLZEYyYUdZNk1CUS9NYmlqYkdo?=
 =?utf-8?B?TUh6QlYzaVBDc0F2OEZ6VGdvNDBHUGVTVHpBeFlpdkJ6UjhLUkdaR0FNT01r?=
 =?utf-8?B?UWhMVjExaFRKNloxQWlzRG5KTkNJTTJIM1FuMyszeEh1Y21udlRQNEN5L1lH?=
 =?utf-8?B?ZjZjYjNWZ0krSEhVMDFjK1N3Z2d6ckJaSWJHdkNYSDRtMEc4R2htVkpRZ2Fu?=
 =?utf-8?B?aHNnMjByZUtRck9IWFBHeTZIWmFuUkRhendHNnZocFF0a1NsVE9FRmRVWWlI?=
 =?utf-8?B?WUJZV3UwRUdXUGhhUUdpUy9kZHBEQUtTdnVDOWRCSWpxbjIyL3pMaFVzUTVp?=
 =?utf-8?B?SHdCRzBYbnJlejZrVlRLUHJ3cFFQaWdlcnhWK2RjdkRIMkRhN2hpWkhhQTNF?=
 =?utf-8?B?WVhLZUhIelcrZlZxelpoQzVYWVA2S2RjNS9pK3gvK254YWVTbDNZOFoxdmhX?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a73c4fd-d184-41fd-30f0-08dcc182b1c4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 01:43:45.3834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+F6rbRmVmZqIaOEKoTmCZOXFGSnlGYVK5oTdZFYuKYtrhIo2DByHhubgOcEzqdKXGyFvYlvP9dJhqgUsFZMrBEEP25SJEzxnHRHCdZy1b4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
X-Proofpoint-GUID: GRbhf6QxyP29OpcFjlJaAkI9AdwEeBwX
X-Proofpoint-ORIG-GUID: GRbhf6QxyP29OpcFjlJaAkI9AdwEeBwX
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c54655 cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=_raFRFi5KfYKNq0SfIAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=77xOguifIQGsPcss2dMA:9 a=Sd4EYgzBXkDooZQh:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_19,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408210011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 01:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203573

--------------riadIykxQd0JZvITq0Nlx5JF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47L1bp8L013726

On 2024-08-16 11:54 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Add some of the upsupported/failing tests to the exclude list
> and ignore the failing unit tests.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py          | 34 +++++++++-
>   .../rust/files/rust-oe-selftest.patch         | 64 ++++++++++++++++++=
-
>   2 files changed, 95 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> index 62ca762cd0..aa5814eccf 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -205,7 +205,39 @@ class RustSelfTestSystemEmulated(OESelftestTestCas=
e, OEPTestResultTestCase):
>                               'library/std/src/sync/rwlock/tests.rs',
>                               'library/std/src/thread/tests.rs',
>                               'library/test/src/stats/tests.rs',
> -                            'tidyselftest'
> +                            'tidyselftest',
> +                            'compiler/rustc_span',
> +                            'compiler/rustc_expand',
> +                            'tests/ui/array-slice-vec',
> +                            'tests/ui/associated-consts',
> +                            'tests/ui/associated-types',
> +                            'tests/ui/allocator',
> +                            'tests/ui/abi/extern',
> +                            'tests/codegen/non-terminate/infinite-loop=
-1.rs',
> +                            'tests/codegen/coercions.rs',
> +                            'tests/codegen/const_scalar_pair.rs',
> +                            'tests/codegen/cold-call-declare-and-call.=
rs',
> +                            'tests/codegen/issues',
> +                            'tests/codegen/bool-cmp.rs',
> +                            'tests/codegen/ascii-char.rs',
> +                            'tests/codegen/frame-pointer.rs',
> +                            'tests/codegen/common_prim_int_ptr.rs',
> +                            'tests/codegen/default-requires-uwtable.rs=
',
> +                            'tests/codegen/debug-accessibility/public-=
enum.rs',
> +                            'tests/codegen/meta-filecheck/filecheck-fl=
ags.rs',
> +                            'tests/codegen/float_math.rs',
> +                            'tests/codegen/debug-accessibility/tuple-f=
ields.rs',
> +                            'tests/codegen/consts.rs',
> +                            'tests/codegen/enum/enum-bounds-check.rs',
> +                            'tests/codegen/debug-alignment.rs',
> +                            'tests/codegen/export-no-mangle.rs',
> +                            'tests/codegen/fastcall-inreg.rs',
> +                            'tests/codegen/debuginfo-inline-callsite-l=
ocation.rs',
> +                            'tests/codegen/enum/enum-debug-tagged.rs',
> +                            'tests/codegen/adjustments.rs',
> +                            'tests/codegen/macos/x86_64-macosx-deploym=
ent-target.rs',
> +                            'tests/codegen/frame-pointer.rs',
> +                            'tests/codegen/meta-filecheck/check-prefix=
.rs'
>                           ]

Hi Yash,


There was a problem with a SDK test failing in 1.78 due to a linkage=20
problem for rustc in the SDK.
You replied to the email saying:
 =C2=A0 "This also resolves the "bitbake core-image-sato -c do_testsdk" e=
rror=20
for cargo."
but I don't see a patch or change that would resolve that problem. Can=20
you explain briefly what
the problem was and what you did to fix it for me and anyone who might=20
be interested, please?


It seems that we now have just over 170 tests that we're skipping! Ugh!

Skipping tests is okay as a temporary work-around but once we have=20
reached feature freeze next week on Aug 26,
please start looking at why these tests are failing and try to fix the=20
root cause so the tests can be re-enable.

$ rg -A 175 "exclude_list =3D " meta/lib/oeqa/selftest/cases/rust.py


Where should you start, you might ask? Let's look at this list...

Oh, it's not sorted alphabetically as we agreed it should be!
Please fix that as a single commit now or as part of the next Rust=20
update if that makes more sense for you
given that the feature freeze deadline is less than a week away.


BTW, you should be able to do this sorting within your editor (emacs can=20
do it at least! ;-) ) but let's do it in the shell:

# cut on the ' delimiter:
$ rg -A 172 "exclude_list =3D " meta/lib/oeqa/selftest/cases/rust.py |=20
tail -172 | cut -d"'" -f2 | sort > /tmp/after

The 172 was determined manually.

Here's why you want the list sorted:

=E2=9D=AF uniq -c /tmp/after=C2=A0 | grep -v " 1 "
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 compiler/rustc_interface/src/tests.rs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 library/std/src/thread/tests.rs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 library/test/src/stats/tests.rs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/codegen/frame-pointer.rs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/rustdoc-json
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/rustdoc-ui/doc-test-rustdoc-featu=
re.rs
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/rustdoc-ui/no-run-flag.rs

so there are "only" 165 tests being skipped:

=E2=9D=AF uniq -c /tmp/after=C2=A0 | wc -l
165

I'm most concerned about the compiler and library/std tests but
we do need to work on understanding and hopefully fixing all the skipped=20
tests.

Please take a look at say up to 5 tests, hopefully related, and work on=20
fixing them as a group,
rather than trying to fix the entire list in one work item and one commit.

In future commits, please include a summary of the total number of tests=20
that are being skipped
and the total number that are being run so we can have a numerical=20
indicator to track the rust
quality.


Oh, you had exact statistics in this poky commit:

commit c496b1eaf4b72ca979d47c37e73e44cd145fed1c
Author: Yash Shinde <Yash.Shinde@windriver.com>
Date:=C2=A0=C2=A0 Sat Jul 29 03:00:21 2023

...

 =C2=A0=C2=A0=C2=A0 * The tests that are passed and skipped are as follow=
s-

 =C2=A0=C2=A0=C2=A0 Target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 SKIPPED

 =C2=A0=C2=A0=C2=A0 ARM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 155=
07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 428
 =C2=A0=C2=A0=C2=A0 ARM64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15535=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 400
 =C2=A0=C2=A0=C2=A0 MIPS64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15479=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 456
 =C2=A0=C2=A0=C2=A0 X86=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 155=
28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 407
 =C2=A0=C2=A0=C2=A0 X86-64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15643=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 292

so it looks like things have improved. Yay!

Do you know offhand if upstream Rust passes all tests for x86-64 and arm6=
4 ?


I know that running these tests takes quite a long time so perhaps you=20
can run
the full testsuite for all targets once per YP release, on the final=20
Rust update so
that the results are in a commit log. Given that I've changed=20
requirements, late in this release,
if that's a problem then just send the update to 1.80.x in without the=20
full set of all target statistics.
Hopefully during the M4 bug fix cycle, you can fix some of the failing=20
tests and provide statistics
for all targets,=C2=A0 including riscv64.


Please let me know what you think.

Thanks,

../Randy




--------------riadIykxQd0JZvITq0Nlx5JF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47L1bp8L013726

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-08-16 11:54 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wi=
ndriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240816155419.213703-1-Yash.Sh=
inde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Yash Shinde <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yas=
h.Shinde@windriver.com&gt;</a>

Add some of the upsupported/failing tests to the exclude list
and ignore the failing unit tests.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py          | 34 +++++++++-
 .../rust/files/rust-oe-selftest.patch         | 64 ++++++++++++++++++-
 2 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index 62ca762cd0..aa5814eccf 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -205,7 +205,39 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
                             'library/std/src/sync/rwlock/tests.rs',
                             'library/std/src/thread/tests.rs',
                             'library/test/src/stats/tests.rs',
-                            'tidyselftest'
+                            'tidyselftest',
+                            'compiler/rustc_span',
+                            'compiler/rustc_expand',
+                            'tests/ui/array-slice-vec',
+                            'tests/ui/associated-consts',
+                            'tests/ui/associated-types',
+                            'tests/ui/allocator',
+                            'tests/ui/abi/extern',
+                            'tests/codegen/non-terminate/infinite-loop-1=
.rs',
+                            'tests/codegen/coercions.rs',
+                            'tests/codegen/const_scalar_pair.rs',
+                            'tests/codegen/cold-call-declare-and-call.rs=
',
+                            'tests/codegen/issues',
+                            'tests/codegen/bool-cmp.rs',
+                            'tests/codegen/ascii-char.rs',
+                            'tests/codegen/frame-pointer.rs',
+                            'tests/codegen/common_prim_int_ptr.rs',
+                            'tests/codegen/default-requires-uwtable.rs',
+                            'tests/codegen/debug-accessibility/public-en=
um.rs',
+                            'tests/codegen/meta-filecheck/filecheck-flag=
s.rs',
+                            'tests/codegen/float_math.rs',
+                            'tests/codegen/debug-accessibility/tuple-fie=
lds.rs',
+                            'tests/codegen/consts.rs',
+                            'tests/codegen/enum/enum-bounds-check.rs',
+                            'tests/codegen/debug-alignment.rs',
+                            'tests/codegen/export-no-mangle.rs',
+                            'tests/codegen/fastcall-inreg.rs',
+                            'tests/codegen/debuginfo-inline-callsite-loc=
ation.rs',
+                            'tests/codegen/enum/enum-debug-tagged.rs',
+                            'tests/codegen/adjustments.rs',
+                            'tests/codegen/macos/x86_64-macosx-deploymen=
t-target.rs',
+                            'tests/codegen/frame-pointer.rs',
+                            'tests/codegen/meta-filecheck/check-prefix.r=
s'
                         ]</pre>
    </blockquote>
    <p>Hi Yash,</p>
    <p><br>
    </p>
    <p>There was a problem with a SDK test failing in 1.78 due to a
      linkage problem for rustc in the SDK.<br>
      You replied to the email saying:<br>
      &nbsp; &quot;This also resolves the &quot;bitbake core-image-sato -=
c do_testsdk&quot;
      error for cargo.&quot;<br>
      but I don't see a patch or change that would resolve that problem.
      Can you explain briefly what<br>
      the problem was and what you did to fix it for me and anyone who
      might be interested, please?<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>It seems that we now have just over 170 tests that we're
      skipping! Ugh!<br>
    </p>
    <p>Skipping tests is okay as a temporary work-around but once we
      have reached feature freeze next week on Aug 26,<br>
      please start looking at why these tests are failing and try to fix
      the root cause so the tests can be re-enable.<br>
    </p>
    <p>$ rg -A 175 &quot;exclude_list =3D &quot;
      meta/lib/oeqa/selftest/cases/rust.py</p>
    <p><br>
    </p>
    <p>Where should you start, you might ask? Let's look at this list...<=
br>
    </p>
    <p>Oh, it's not sorted alphabetically as we agreed it should be! <br>
      Please fix that as a single commit now or as part of the next Rust
      update if that makes more sense for you<br>
      given that the feature freeze deadline is less than a week away.<br=
>
      <br>
      <br>
      BTW, you should be able to do this sorting within your editor
      (emacs can do it at least! ;-) ) but let's do it in the shell:<br>
    </p>
    <p># cut on the ' delimiter:<br>
      $ rg -A 172 &quot;exclude_list =3D &quot; meta/lib/oeqa/selftest/ca=
ses/rust.py
      | tail -172 | cut -d&quot;'&quot; -f2 | sort &gt; /tmp/after</p>
    <p>The 172 was determined manually.<br>
    </p>
    <p>Here's why you want the list sorted:</p>
    <p>=E2=9D=AF uniq -c /tmp/after&nbsp; | grep -v &quot; 1 &quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 compiler/rustc_interface/src/tests=
.rs<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 library/std/src/thread/tests.rs<br=
>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 library/test/src/stats/tests.rs<br=
>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 tests/codegen/frame-pointer.rs<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 tests/rustdoc-json<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 tests/rustdoc-ui/doc-test-rustdoc-=
feature.rs<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 tests/rustdoc-ui/no-run-flag.rs</p=
>
    <p>so there are &quot;only&quot; 165 tests being skipped:<br>
    </p>
    <p>=E2=9D=AF uniq -c /tmp/after&nbsp; | wc -l<br>
      165</p>
    <p>I'm most concerned about the compiler and library/std tests but<br=
>
      we do need to work on understanding and hopefully fixing all the
      skipped tests.<br>
      <br>
      Please take a look at say up to 5 tests, hopefully related, and
      work on fixing them as a group, <br>
      rather than trying to fix the entire list in one work item and one
      commit.<br>
      <br>
      In future commits, please include a summary of the total number of
      tests that are being skipped<br>
      and the total number that are being run so we can have a numerical
      indicator to track the rust <br>
      quality.</p>
    <p><br>
    </p>
    <p>Oh, you had exact statistics in this poky commit:<br>
    </p>
    <p>commit c496b1eaf4b72ca979d47c37e73e44cd145fed1c<br>
      Author: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a><br>
      Date:&nbsp;&nbsp; Sat Jul 29 03:00:21 2023<br>
      <br>
      ...<br>
      &nbsp;<br>
      &nbsp;&nbsp;&nbsp; * The tests that are passed and skipped are as f=
ollows-<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Target&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASS&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SKIPPED<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; ARM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 15507&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 428<br>
      &nbsp;&nbsp;&nbsp; ARM64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15535&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 400<br>
      &nbsp;&nbsp;&nbsp; MIPS64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15479&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 456<br>
      &nbsp;&nbsp;&nbsp; X86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 15528&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 407<br>
      &nbsp;&nbsp;&nbsp; X86-64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15643&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 292</p>
    <p>so it looks like things have improved. Yay!</p>
    <p>Do you know offhand if upstream Rust passes all tests for x86-64
      and arm64 ?</p>
    <p><br>
    </p>
    <p>I know that running these tests takes quite a long time so
      perhaps you can run<br>
      the full testsuite for all targets once per YP release, on the
      final Rust update so <br>
      that the results are in a commit log. Given that I've changed
      requirements, late in this release, <br>
      if that's a problem then just send the update to 1.80.x in without
      the full set of all target statistics.<br>
      Hopefully during the M4 bug fix cycle, you can fix some of the
      failing tests and provide statistics <br>
      for all targets,&nbsp; including riscv64.</p>
    <p><br>
    </p>
    <p>Please let me know what you think.<br>
    </p>
    <p>Thanks, <br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <br>
  </body>
</html>

--------------riadIykxQd0JZvITq0Nlx5JF--

