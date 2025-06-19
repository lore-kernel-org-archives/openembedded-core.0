Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED10BC7115D
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 19:17:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1502.1750360632143161038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 12:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8265627ed3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J3DuoM004385
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 19:17:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c83x0xjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 19:17:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuNzVKX3ZQoEWt2DB67/j4gGDZBoHOasIZlNCAFcyuG3PbRl2xba9icR+gydNNfa0V5NOxJxJqvKdfD+0HNK8bDcUf4w3e8A9D9qS2NkgJDFJ/I1mOkIxFT1yWESdcJeSTS0Ut2wKJfjLNc8D/wT2Ue4leI8+KzoFgACvX0FR4rixgzelwvg167X0fMpJLe/5MpCTb5ODnfYwNZS4oHckwNHOhdgiQqnM7p9rswCwsgbHLQaXe4X+FdadZF89nP5CISTMT8m27mRDitUnq291n+pF8bdfhCdIy5HJPFzxvUPJU53zMVTzdL+oz8GsS9MwAJ5GiAIWiMfQhkRlU4WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqbTZt4+9ftOJYWjJ02I3t8vums8lEV84M/6L9uMTR0=;
 b=EWqdfV1hZJKsqMQ62wUmXZuq1/8Rdujkxpyrht1NUYHVMDG5EI2voDoh7Z4bDwaQplMThDKkEaELIsCk/8tvkNQ8aQ0i7IuhADN/JLhEJjy1kf2UW+2/eCBHPqt1OMI79TRh1HVodbJyQ8TA+e13hHhkdi5iY3nUNi+JFJ2zUN9ZAAv0UTvLpxIP5BQuOe8u4WnIhxAGi+T7N0orDFS96ot0OsUeqnvHTHhrGFPKQl2hGD01O787GEGUiodvGk+PoUwWRFcmV4Knmfr53nvE4j+CIqWvYR4IRtp2Wy8SyILYQNiQXfdbimXjFLLYesSi6XR2rlEMWgh/4ZuGUYQIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8685.namprd11.prod.outlook.com (2603:10b6:8:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 19:17:07 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 19:17:07 +0000
Content-Type: multipart/alternative;
 boundary="------------hmGncEcpq0SLjazLl37LjF3b"
Message-ID: <4c25d4fc-faca-4973-b21e-9a8f4678c88e@windriver.com>
Date: Thu, 19 Jun 2025 15:17:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Gcc-15 test results summary
To: "Sadineni, Harish" <Harish.Sadineni@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d1b0eb-1a94-47c2-f27a-08ddaf65e1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWZ4cmlXSDF1VFJMQkRncW14bkRtMEFXRFlCZmxscS9SSTZtdy9tcklJUXJU?=
 =?utf-8?B?OWMwdENlTFRrd0Fobi8xZXEvTTZIUkhVV09wN0ZuT2JHVU1VcXVwOE8waFpr?=
 =?utf-8?B?cTV5UWR5Zm1qbmREUnFOaGNNSDNkM3lrQ1Q5RDMrQkZFNU92WFp4SmdzK2di?=
 =?utf-8?B?VEE4b21ycXdBSXowY3ZzbU9mWFBzTnc1NGRFekVkNXpwZERXbDZQbGhlVERI?=
 =?utf-8?B?VXU3ZXlJUDZIcFp6N3BueVRkWVJKMXZGd2FjaFBWa1NJV2F2V2k0TWQ2MXdr?=
 =?utf-8?B?MFRjMU1yUWZaWFZMaDAvRzU0NkRvVVppeFVndkhTL1JIOENEUnlvSVpYWHN5?=
 =?utf-8?B?d2k2Tm53U1hmdzZoUTBKVGxENmM5aXJ5TlhQNmpWcDdyeFF2NkI1STIzUjNj?=
 =?utf-8?B?UlVPd3p1TVhBY3RFRnFkQjlTUkJkdTc1S0RVMXN1aGkyb25IalI1SkI2RWZu?=
 =?utf-8?B?Z2t6TVJ5UnJpL2lhSHhuKzlhcDNIbXZhVHpiSWwxMUhITE9iNGtYSWxXQ1dC?=
 =?utf-8?B?RUtJRHFER3VmejU1RS8vUmdLN3BrWVlMWlR6eXpLSk5mZFhxSCtybWhFQjFi?=
 =?utf-8?B?eFVjcXJkRU5nWVhFYlVubyt0OEJUcEczTW9TNGU1dnhxRmpXOE5hNWlTaHRC?=
 =?utf-8?B?UzNnYUl1MGdPS2t2N3FoN0gxVVFFVUpWZncxNXMxQzV3SDluNGhpUFZGcnFS?=
 =?utf-8?B?QVl3clV6bCsvWHd2STQ4R0dRMTNKS2JmZjk5VzZmZ0pVcTEvN3ZtMHRpNVR0?=
 =?utf-8?B?N2pzU0RYYXJSWXd6RjNFalM2dHo1ZmkvV2FVY21jQ1hJM25TTHZKeklXRU8x?=
 =?utf-8?B?aDIxeFAxaGs4UzJhOW1RN1YwZGFwMG9QbDBXTDRkRWp1QzJzN09yTjU3dlRr?=
 =?utf-8?B?MVl1cGgyaEhCQzZ5RFZjcEl6bUJlZG1tbERYck81R21UQ2MrakFDck05UVVM?=
 =?utf-8?B?dU15S3lMc3pSVU9kdUZpUFp5T0hEdGY1czFsL0xqdUxsOTBiUzYxMXZIbUd2?=
 =?utf-8?B?OW9PeFFnYTJjdk5BTU1HQnRBV1hUdE1hNE9YaWxMT210VndrV0RCZmIzOEtk?=
 =?utf-8?B?R1NIQzBUNno4K2NucTNNTnhEbjZvbEdVcm81Sms1VXZKVmh4YjZ0RFJoTk9w?=
 =?utf-8?B?Q1FVR3c4NVVsQlFHQ2VOaTdkL01DUVVFN29QR1VQcUZMSUIwSXhHVnBMc1Ev?=
 =?utf-8?B?Ny83YXpzV2UwY3F5Qm9yN05kaU9tejJhZGV4RmlZMWRFQWtCOHd6dzBKclFi?=
 =?utf-8?B?T0N2OGV4Nng4MEtIQUh6S0JkdXB1OVo5VzZWUnJtNWVBQzFNSUV4ZG0vMGhB?=
 =?utf-8?B?dndSZGJzcVlwQTdHZFBSMWhSOVI3VFFsZ3NjKzkrd0xRODloQ2dZZkpVVnlp?=
 =?utf-8?B?ZVVaem5VYVkrenhtL09Jc2VEaEFkeXBtaFZpWEoraGRoNWlxRXpPa0ZiRVI1?=
 =?utf-8?B?b1FVR1JwRWQwY1dGK3ZvVFp3a2RDRE9hd2ZpM1dEQWw4K1hrYWM2cldKVnJu?=
 =?utf-8?B?aEgrT0ZlR0RXeDlEa1NMcVRlYmFzc1pNQzMvcUkzdU5jMEx0b1I5RUhWcFBU?=
 =?utf-8?B?ckJCM1drbEdITFZ3RStLd2lyOEF1eEhydVFSTzlQT25nekVLblY0bXkwMHdJ?=
 =?utf-8?B?NGhoTytubUVtbHlJSG8vVUM5TmI2Q3BjSVpVQXE0OVAralVUS0JzK1RsMEFn?=
 =?utf-8?B?dG13bDJ4Z2xhRXhMWkJpc3pRaWNCMzFiUW5Uek0xSktjNloxVFAwTmhZck5v?=
 =?utf-8?B?L1p2cEhoRGM4ajRFU0FwRkJVV1g0emVraERoQnc3U1JSWkd6YkhWSUNqQWh1?=
 =?utf-8?B?ODlUTlJubFBrV2h3RVpZN0pSWGl2Y3hma2hlVFBuYU5Dd2RlZ0FjaUFpdnlz?=
 =?utf-8?B?Z0kzd0lEVCtnM3pQNHA3cDFOQitpMlh4QjVmdzVVVjJyZnprZFNxcEFvYjQ5?=
 =?utf-8?Q?5CSe6xEWv7U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnNVNENOUmxNbU95Vi9SRHVDQlFxc3ZEVCsvV2xwTWxnVEY5NDNBaFo1VVNP?=
 =?utf-8?B?OHZOdTVDRnkrZUpOUW05dXZwZWE2bDNGTEtaaHF2MEtRSGI5YXliN0pyeVBk?=
 =?utf-8?B?ZVhMS1VBZWJON2dsRTVpbXFsMCswUHFRWFJiUWRKMjYraktFaU1Rb3R6c0RO?=
 =?utf-8?B?TjVUQk5JR0lldEdFSmEzVS9MN2ZKQ1U3Q25CNndRaEdVRVlCdUZjd1FVRU1x?=
 =?utf-8?B?ZVBYV2JUd3oyNGRGTVQzbDZDTDBtOTBzTGdXWkdSY3FUSnFiMWpvS3hyYXZF?=
 =?utf-8?B?cGJvWkFNaXZyWFpadTkwR3VoT0J6d0NFcDZ2bmw1M0N6Sy9UdzNxNmxGSHVx?=
 =?utf-8?B?U0c3K2svS2c4MnpWZWl3Y0lPSkFjbkRRRytIZmxPV25sVGEycnQrWGZiWFZS?=
 =?utf-8?B?c2JCOXlTcTdIanp6Y0RJQU16aU56UEpvMGlRSGczaVJvbitYQ3NlLzM5UTlw?=
 =?utf-8?B?QW1aVDY1dlR0S21lcWorUjc3MGFRcHZFWTkxVi9LeC9GZ1AvbWpNb0lrdVlt?=
 =?utf-8?B?VlFqbStLblpLUVJ6T1dKKysrelpUNTYzVmF0d3RIWEI3MVpDQ09BNnhNWUxu?=
 =?utf-8?B?TUJ0UzUxMWlYQjEzZlRpaFNuR0crRWUzRFN6YW13SHBDbmhJN292bVZEdDZx?=
 =?utf-8?B?LzA3QUM4U3d1djFoMm95UUd1OHg3SkVjN2xOTENNZWFjcW52WFlKb0d1ZTJB?=
 =?utf-8?B?ZXdjQmF0WUZmbUpYSjlabEtJVUorN3pEajNyTmlwa01IM095cHR1djJiWHc4?=
 =?utf-8?B?UVBaR051eWFNK1gvSzEzdXZ5aUNhb2lBdnpkbU5lYzE2UXJQRlEvSElRTGJI?=
 =?utf-8?B?MUprdFVoVW8yckdZUTRPajNYZXFsK3pvTjhIbHBGN1Y0SGRNU095MEYvWVUy?=
 =?utf-8?B?STFLVXlHNVN6OFkyQ0JKQmV4TzdobGFYbHB3M2dsRnZFMHZidUdSd0IyYm9I?=
 =?utf-8?B?VkFIN2k5S3JzcllkcWpCVG93M0ZBV2ZrODhzVFV1ekhNUjhzNmlNUGtUL1c5?=
 =?utf-8?B?cy9GYlpuMm1ETkUwNCtnYWpBeHdjUVltdlNJM3F2RFVTY2NIRHNVVG1ReDdx?=
 =?utf-8?B?UG5aZjZ5MzZBZko5OHZvTWNDL25sTUFNVkFpV2ZFekhlZ1hRZjlucFRaNld5?=
 =?utf-8?B?L3ZMa00rTnMvM0J6SDFxd3BXeTNreHZmVmpyaVg5M1hrTTUvYnFmWHVnZXM2?=
 =?utf-8?B?S2RHanRWSFdoN1VaUnN2bXVXRm1vMDJNdmcyRDZVSjJoS3Y5THR6S2N5REM5?=
 =?utf-8?B?Q29xeVFLb0ZMVFRyZ3gzSWM0eGdTaFEyMkZjOC8rakd0U1lzNHUxWmZaN3RY?=
 =?utf-8?B?WXFlT1ZzNXJNTTFweXpjVGJ0VWhjRCtydWJkTEdoY3l1TTdkQm1mdUJOVSsy?=
 =?utf-8?B?MHV1NVNlQnBhQ20yRWUyUXRQaFJOZFFZcVdBM2RYRXJTeTZOZllqdm9jMXF4?=
 =?utf-8?B?SWQ4SGwxMW5Wa0poaUM0TUlwMXZ6Ynk0UlpqZXNXYzZnUElvVWZyMXRpejJh?=
 =?utf-8?B?ZVhTQWFOcmcycEQySmFwTnAvNEZXQ0sxOTZ1aXZhdHhxL1pUM1g5czROdzd4?=
 =?utf-8?B?cEFPSzlyK3g1a2lCTC9ZRExKWU9EK1oycm5RcVRiUjRsVDFkTysxc3NLQ25r?=
 =?utf-8?B?ZE5rbWZEMkZZcUFWaHc3QXdOTE9tNllYSTl3c1lWdDc4c0pFUHNpKyt1LzBP?=
 =?utf-8?B?QjRnTG55S0p1OEtmUUJVU3F1c21HQ1ZIVEtJMDI1MEdYRm9CdURvQUpLZHJ3?=
 =?utf-8?B?QTByYVJQWnU3YWdlY3o1MTQ4SWs3WGlVdmlrRFZ0OXFpbDBETzdxOTBRcjhx?=
 =?utf-8?B?Rk8yVFBPM2ZZcW0wL3RzTTJGMGdkQ3MyYW0zVTlmcitaN2RCSG9iUktrbnlh?=
 =?utf-8?B?Vk11ZlZlOG5Ha2ZBc214UzlOa1QxSlFRU1VET2Z0TERycDRnVFYydXZvQTdU?=
 =?utf-8?B?dzJWNHVGSHNEdE5LL3ZuUE42S0hmMzR6NE5BbllQMWVRb2lzWFU4Q1Zkb2Jr?=
 =?utf-8?B?ZWlLYXN3aENEd09BU285VjBWNjlXbzBDMVBoajMxMEYydUpnL0F2eUt1YzlU?=
 =?utf-8?B?VVFyeFNPOGI1aDdVUmhSSFRJNWNBZGFPaTByZUNUbnM2V3RtUTl2TTloUTZj?=
 =?utf-8?B?M0QxV3g5QU9EZ0J3UlhJVVFNMlowNFZYSExKeUpEQnVCT2pwdjdUcWU3S3Vy?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d1b0eb-1a94-47c2-f27a-08ddaf65e1bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 19:17:07.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaiceWxPw4WMzt0mHmMj0xDGy6K79uvgzljQwhb1z0ujJs4+Ja+x7f/BO0/nu0Py8yo9ehD2PIUAPhr8QkW/NDOWSM9fWUN2VKMbKysoCTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8685
X-Proofpoint-GUID: PKU8Pkc43zoYxdIBYAhlrBJNPziXkYWp
X-Authority-Analysis: v=2.4 cv=cuabk04i c=1 sm=1 tr=0 ts=68546236 cx=c_pps a=OUM1w/RX8+2X2JTftP90HQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=J7_zYugF1qPbCvRXOloA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=tvjTnXi5YLB0y2IjuLYA:9 a=O_0VCt1qPXe2z3na:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
X-Proofpoint-ORIG-GUID: PKU8Pkc43zoYxdIBYAhlrBJNPziXkYWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE1OCBTYWx0ZWRfX2Wp8C2zNFmmn rtf6p5JJmQo9eCcP3sSDHHGS3+CI1ouU48STJIEu7E6T11eR3CZ4Vn3984tNgDJvYcAxMIGV2T6 8ifk+aDK9rPLXG8ENn5ErY/+/+25GcIK62jZcoxyT4zTB0WOVYUN8sq765g6c7G7c+iKQWtMQr1
 RxLDChtOSgikXM4+TqBeuRcnUD3ruS/LwY81DM4+M+RQp0ylaGhX2kzH+UUkgkeC9Feszllxv9B O0lSTlGy/kJB5AHP4ybP8aOSOaRL8l88WHKdolOvFEr6yttf04KpNLrHf/8xbvYVfbDPCugIngE xdKW/D0QXD1fY1YLmeizCbsQaQg8Bw0woSsoSneSOWAaCgWlGL+Vze9lTmd4VC8XsuiMvQm80on
 pDKKAKMYA0VVnqItsGsGt5CfgJkC4xqUQwZLm+YabZRLM59B0Wlz/R6IapKfNmNoB5KxJ6iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 19:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219094

--------------hmGncEcpq0SLjazLl37LjF3b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55J3DuoM004385

Hi Harish,

On 2025-06-13 4:05 a.m., Sadineni, Harish wrote:
> Hi All,
> *
> Gcc 15 test results diff between yocto and upstream gcc
>
> For x86_64 architecture :*
>
> Component
> =09
> Metric
> =09
> Yocto (gcc15-yocto-x86)
> =09
> Upstream GCC 15
> =09
> Difference (Yocto - Upstream)
> *GCC (C)*
> =09
> Expected Passes
> =09
> 202,970
> =09
> 203,217
> =09
> -247
>
> =09
> Unexpected Failures
> =09
> 69
> =09
> 23
> =09
> +46
>
> =09
> Expected Failures
> =09
> 1,462
> =09
> 1,465
> =09
> -3
>
> =09
> Unsupported Tests
> =09
> 3,163
> =09
> 3,226
> =09
> -63
>
> =09
> Unresolved Tests
> =09
> 4
> =09
> 0
> =09
> +4
>
> =09
> Unexpected Successes
> =09
> 0
> =09
> 0
> =09
> 0
> *G++ (C++)*
> =09
> Expected Passes
> =09
> 240,928
> =09
> 241,892
> =09
> -964
>
> =09
> Unexpected Failures
> =09
> 21
> =09
> 69
> =09
> -48
>
> =09
> Expected Failures
> =09
> 2,271
> =09
> 2,277
> =09
> -6
>
> =09
> Unsupported Tests
> =09
> 1,649
> =09
> 1,486
> =09
> +163
> *libatomic*
> =09
> Expected Passes
> =09
> 54
> =09
> 54
> =09
> 0
> *libgomp*
> =09
> Expected Passes
> =09
> 5,704
> =09
> 5,824
> =09
> -120
>
> =09
> Unexpected Failures
> =09
> 4
> =09
> 0
> =09
> +4
>
> =09
> Expected Failures
> =09
> 46
> =09
> 46
> =09
> 0
>
> =09
> Unsupported Tests
> =09
> 475
> =09
> 382
> =09
> +93
> *libitm*
> =09
> Expected Passes
> =09
> 24
> =09
> 44
> =09
> -20
>
> =09
> Unexpected Failures
> =09
> 19
> =09
> 0
> =09
> +19
>
> =09
> Expected Failures
> =09
> 3
> =09
> 3
> =09
> 0
>
> =09
> Unsupported Tests
> =09
> 2
> =09
> 1
> =09
> +1
> *libstdc++*
> =09
> Expected Passes
> =09
> 18,244
> =09
> 18,354
> =09
> -110
>
> =09
> Unexpected Failures
> =09
> 36
> =09
> 0
> =09
> +36
>
> =09
> Expected Failures
> =09
> 131
> =09
> 131
> =09
> 0
>
> =09
> Unsupported Tests
> =09
> 781
> =09
> 744
> =09
> +37
>
> =09
> Unresolved Tests
> =09
> 0
> =09
> 0
> =09
> 0
>
>
> *For arm64 architecture:
>
> *
> Component
> =09
> Metric
> =09
> Yocto (gcc15-yocto-arm64)
> =09
> Upstream GCC 15
> =09
> Difference (Yocto - Upstream)
> *GCC (C)*
> =09
> Expected Passes
> =09
> 369,469
> =09
> 369,509
> =09
> -40
>
> =09
> Unexpected Failures
> =09
> 33
> =09
> 47
> =09
> -14
>
> =09
> Expected Failures
> =09
> 1,814
> =09
> 1,824
> =09
> -10
>
> =09
> Unsupported Tests
> =09
> 6,171
> =09
> 6,188
> =09
> -17
>
> =09
> Unresolved Tests
> =09
> 0
> =09
> 0
> =09
> 0
>
> =09
> Unexpected Successes
> =09
> 4
> =09
> 4
> =09
> 0
> *G++ (C++)*
> =09
> Expected Passes
> =09
> 424,871
> =09
> 425,745
> =09
> -874
>
> =09
> Unexpected Failures
> =09
> 6
> =09
> 63
> =09
> -57
>
> =09
> Expected Failures
> =09
> 2,852
> =09
> 2,588
> =09
> +264
>
> =09
> Unsupported Tests
> =09
> 3,240
> =09
> 3,133
> =09
> +107
> *libatomic*
> =09
> Passes
> =09
> 54
> =09
> 54
> =09
> 0
> *libgomp*
> =09
> Expected Passes
> =09
> 5,664
> =09
> 5,784
> =09
> -120
>
> =09
> Unexpected Failures
> =09
> 4
> =09
> 0
> =09
> +4
>
> =09
> Expected Failures
> =09
> 46
> =09
> 46
> =09
> 0
>
> =09
> Unsupported Tests
> =09
> 489
> =09
> 396
> =09
> +93
> *libitm*
> =09
> Expected Passes
> =09
> 43
> =09
> 44
> =09
> -1
>
> =09
> Unexpected Failures
> =09
> 0
> =09
> 0
> =09
> 0
>
> =09
> Expected Failures
> =09
> 3
> =09
> 3
> =09
> 0
>
> =09
> Unsupported Tests
> =09
> 2
> =09
> 1
> =09
> +1
> *libstdc++*
> =09
> Expected Passes
> =09
> 18,248
> =09
> 18,338
> =09
> -90
>
> =09
> Unexpected Failures
> =09
> 2
> =09
> 0
> =09
> +2
>
> =09
> Expected Failures
> =09
> 131
> =09
> 131
> =09
> 0
>
> =09
> Unsupported Tests
> =09
> 798
> =09
> 754
> =09
> +44
>
> =09
> Unresolved Tests
> =09
> 0
> =09
> 0
> =09
> 0
>
>
> The results looks good,


They do look good and they're much better than they were a year or two ag=
o.

Comparing to upstream's results on a native build is clearly a good idea=20
that
will help us focus on YP specific differences.

Next time, please include a commit ID so people know exactly what you=20
tested.

If you have the ID at hand, please include that when you reply to this=20
email.



> however there were some minor differences we will analyze further.
>
I think you should start with the "Unsupported Tests" since that's where=20
most of the differences exist.
Do you agree?


Also, I think you have checked that the large number of unsupported=20
tests for the Upstream GCC 15
tests are arch specific, right?=C2=A0 I ask since I'm wondering how we kn=
ow=20
if we have a new enough distro
for self-hosted gcc testing and how you know if you have all the=20
required packages installed there.


Hopefully, these tests will be supported if we add a few small=20
additional dependencies.

Good work,

../Randy



>
> *
> *thanks,
> Harish
>
>
>

--=20
# Randy MacLeod
# Wind River Linux

--------------hmGncEcpq0SLjazLl37LjF3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Harish,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-06-13 4:05 a.m., Sadineni,
      Harish wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Hi All,<br>
        <b><br>
          Gcc 15 test results diff between yocto and upstream gcc<br>
          <br>
          For x86_64 architecture :</b><br>
        <br>
      </div>
      <table style="text-align: left; background-color: rgb(255, 255, 255); color: rgb(36, 36, 36);">
        <tbody>
          <tr>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Component</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Metric</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Yocto (gcc15-yocto-x86)</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Upstream GCC 15</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Difference (Yocto - Upstream)</div>
            </th>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>GCC (C)</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                202,970</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                203,217</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -247</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                69</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                23</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +46</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1,462</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1,465</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -3</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3,163</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3,226</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -63</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unresolved Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                4</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +4</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Successes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>G++ (C++)</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                240,928</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                241,892</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -964</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                21</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                69</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -48</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2,271</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2,277</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -6</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1,649</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1,486</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +163</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libatomic</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                54</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                54</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libgomp</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                5,704</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                5,824</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -120</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                4</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +4</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                46</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                46</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                475</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                382</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +93</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libitm</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                24</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                44</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -20</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                19</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +19</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +1</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libstdc++</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                18,244</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                18,354</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -110</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                36</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +36</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                131</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                131</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                781</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                744</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +37</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unresolved Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        &nbsp;</div>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <b>For arm64 architecture:<br>
          <br>
        </b></div>
      <table id="x_x_table_0" style="text-align: left; background-color: rgb(255, 255, 255); color: rgb(36, 36, 36);">
        <tbody>
          <tr>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Component</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Metric</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Yocto (gcc15-yocto-arm64)</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Upstream GCC 15</div>
            </th>
            <th style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Difference (Yocto - Upstream)</div>
            </th>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>GCC (C)</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                369,469</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                369,509</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -40</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                33</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                47</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -14</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1,814</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1,824</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -10</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                6,171</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                6,188</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -17</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unresolved Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Successes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                4</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                4</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>G++ (C++)</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                424,871</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                425,745</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -874</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                6</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                63</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -57</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2,852</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2,588</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +264</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3,240</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3,133</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +107</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libatomic</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                54</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                54</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libgomp</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                5,664</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                5,784</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -120</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                4</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +4</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                46</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                46</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                489</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                396</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +93</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libitm</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                43</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                44</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -1</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                3</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                1</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +1</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <b>libstdc++</b></div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Passes</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                18,248</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                18,338</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                -90</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unexpected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                2</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +2</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Expected Failures</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                131</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                131</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unsupported Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                798</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                754</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                +44</div>
            </td>
          </tr>
          <tr>
            <td style="text-align: left;"><br>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Unresolved Tests</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
            <td style="text-align: left;">
              <div class="elementToProof" style="text-align: left; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                0</div>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        The results looks good, </div>
    </blockquote>
    <p><br>
    </p>
    <p>They do look good and they're much better than they were a year
      or two ago.</p>
    Comparing to upstream's results on a native build is clearly a good
    idea that<br>
    will help us focus on YP specific differences.<br>
    <br>
    Next time, please include a commit ID so people know exactly what
    you tested.<br>
    <p>If you have the ID at hand, please include that when you reply to
      this email.</p>
    <p><br>
    </p>
    <br>
    <blockquote type="cite" cite="mid:PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com">
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">however
        there were some minor differences we will analyze further.<br>
        <br>
      </div>
    </blockquote>
    <p>I think you should start with the &quot;Unsupported Tests&quot; since
      that's where most of the differences exist.<br>
      Do you agree?<br>
    </p>
    <p><br>
    </p>
    <p>Also, I think you have checked that the large number of
      unsupported tests for the Upstream GCC 15<br>
      tests are arch specific, right?&nbsp; I ask since I'm wondering how we
      know if we have a new enough distro<br>
      for self-hosted gcc testing and how you know if you have all the
      required packages installed there.<br>
    </p>
    <p><br>
      Hopefully, these tests will be supported if we add a few small
      additional dependencies.<br>
      <br>
    </p>
    <p>Good work,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:PH0PR11MB56580BF59A4AB6491B2982F1EF77A@PH0PR11MB5658.namprd11.prod.outlook.com">
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br>
      </div>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <b><br>
        </b>thanks,</div>
      <div class="elementToProof" style="text-align: left; text-indent: 0px; background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Harish</div>
      <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------hmGncEcpq0SLjazLl37LjF3b--

