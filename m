Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D5C021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 04:31:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.81981.1740371474122657526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 20:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=415024d1b4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O4OHVw013728
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 20:31:13 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqhdvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 20:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3ILRnO4qt/rjjWDBv+faYaYu6dbYZg7N5h6IsiIFNqRIF+nP2NXwqfEsCRmPCAlDgeSxyn4qf4QcRG5RLhLESvpociZPj2WTa7xEV6OWV/Q5PXVFe4ziCi+94TXOFJPec4HwR6HhImezUpo0LQniPcar051FhoqN3erWZx3A4ZZISubvIYiZ7BzmuBXysHpm2l4ekXIcBwA1qeBbbdvdogpSbjGQyP3Y3qOo2G96NFYa2qJw2zj580ULXVm+6tk9FGL5jSG2nmEpCuREaC6Ts8JDTdcJuswD6Td4IfOc8oZ4jDiFK8NTf5JNPWQhzmVs5f3qCS8nefI81s5Ut816g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haDdl3LYfZDkXK4lHO4nHirrh5crMGrGJDmhlCzLQl4=;
 b=w/r1OxYDLGirRM9v38p11T6yI9CXdR8nYQZFWOU7p4rAfZMXgU3L1yPEH7TCqT6VKjB7n8Im/+CTooeSqBwNq8E1UXAJ89N5r14/xQfJ3ORj3fUp53ykHqPKnHgaRrm2dkoWFQ5kPlJGxApCsBp5q2p3R8Fc6N6nRQ7DI3FUp22h7/D2AAWSmWgOtseg0pYddWj+kR1YEegOt1nZMhLS25elMFg0jhmyFVHMZbiJS+zktJFDpVVkah5vA4o4B3M69jCU2ZqbE3OWvWx1aRPu6wyvaWe/iM2mbkw7VwZauAvzgzrLHqdROl4I+ZOeFB6lzHDMKua+Mi9hghLiJC4hWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Mon, 24 Feb
 2025 04:31:01 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 04:31:01 +0000
Message-ID: <a7337f17-17e1-4251-b8ae-7ad5c78d8a81@windriver.com>
Date: Mon, 24 Feb 2025 12:30:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] man-pages: upgrade 6.9.1 -> 6.11
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250217071432.4144843-1-hongxu.jia@windriver.com>
 <1824ED7D0E1D557B.4193@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1824ED7D0E1D557B.4193@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA0PR11MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: e0737bfc-6772-4dab-6eac-08dd548c0ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXV3TzRZSi9vamFZeHk0eXBSNGdiZ3lZY3p1YzNMOHRSYkJxRllURlVsRlRX?=
 =?utf-8?B?OFdOUmlIcFJHbDZ4L0lDcTg1amU2RzBxRlJFQVVFbVR6WGR3ZUdEUUlTUkNY?=
 =?utf-8?B?UHpjY29ibmtaSG5yM2xzREFldlY5R01QOVUvQXROalI0SHpaVlpyenU1dFNQ?=
 =?utf-8?B?ZnQ5RUI0c1VQU3ZaVjlBbTJVNGVFTU5vMmRFVU9sbFlhcitveUdYTzZINitI?=
 =?utf-8?B?aHRGSVVJYXBISDVBQ2JJVDM0VE1PRTVTQWZLQ2c2K3BGWHZIZjdhRFlGSDlv?=
 =?utf-8?B?YVFtVDRIa3k4WFRZZzdOZzlONkZSa1VDS0FCRzJvSEphUHFpbXU0VjhkNzd5?=
 =?utf-8?B?aVVqY2VBNXBMTTJKZVNuSmhSTVJsa2wydDFGWit5YUZqZDR0bnp0VlA0Ykt0?=
 =?utf-8?B?MjNNRVUzSnQ4b3YrVGF5a1B6NVFBd2JTN05zNHlqR1BJdWdaMmRjZW5HK2lO?=
 =?utf-8?B?UUtiZStXNDQ1NUhQbVVBUjNNVXd3MDlUVEpEQVFNVkFMY1RWeFl5akRlVTNu?=
 =?utf-8?B?RC85WCthQjkwcnFXL2dZQ2tscktjSFVMZEZzbjN2SW04L3hXSG9WNXNiSDE3?=
 =?utf-8?B?angrbytRVGQ1NlhtYk5OVXNEUG9FWC9CeDVuUW80Z2NDQmNFeCtENDFSZm1n?=
 =?utf-8?B?YkJuQWpvRFdjaGpSYlF6YkUrM0pRaWU1ZGZ6ZGtURWxmcDF6NzdkMnpDaW5i?=
 =?utf-8?B?b3BnbGJpLzBFbm1ubTdxMHRVVHdscmRTWmYrWkVRSDFFTEY0NXUzVHpabTVN?=
 =?utf-8?B?UEljR0RFTW5Va2dOVGN3TzBPdG84NXNhRFp2V3RqaDFJcDBsYkpEUlVZSzZr?=
 =?utf-8?B?ZkFVOEp2ckpGVWk4MzVFT1FyVnRpaTdxVTN0QnBaYXJrb0hENHpwdDBHeEU5?=
 =?utf-8?B?UVlmY3phK05PeUlsZjhwaTQwUCtiVUFJK1dieWYyV1F6WjdCbFNnMG9iVThL?=
 =?utf-8?B?VDI5VTdGcjV5UDNwMlRBa2p0N3JTMEQ5MUZPM0lidVZET1UwTzVhS1UrUjMx?=
 =?utf-8?B?WVFucndKWDRiaHNZOTBKc0wzdVhPQ0dNOE5wRlZxRTRQQUluTmpTUzZOZlhi?=
 =?utf-8?B?Q3FIekl6ZTBTMW9SeWtRekQ4ajBWa21VQXcwMjJGeThkR25iNE56TTU4eDBh?=
 =?utf-8?B?S1NrK3NHOW9WRCtMZTZDSDVnc2hSY1lodVJ5Rmg1TEliMEpaaS90L1lDQ0k2?=
 =?utf-8?B?dHdEOXhEdlU2bjBaaWxjbzRBenVNaWYrUjkva2xhOVgwY0FYOUxCZnhNMkFl?=
 =?utf-8?B?eWVMTU5VTS9lS1daYTZvekd3U1Era2YyUXA4VUhQa2VTaFJkTENHeG01V0Vl?=
 =?utf-8?B?V05lK2RkU25LcHFORGxla1FaNWRnNlBNbktGeWU0MGhraUR1RXhLMENqZWRn?=
 =?utf-8?B?K3FlY3JTN3hkOFd6OTBlN2NxR1lRZHZ6c1FUUHBpbHpBbkRzSWVFRVZwVVJR?=
 =?utf-8?B?NkMzYytLNENvNnV3TlQxS0FmeWNCN2JabzVtL0RTS3ZTNkI4QWRzSGpHQ0lw?=
 =?utf-8?B?T1VKbm1sVWNndVJWL3g4d21Yd2Z5bXI5U044QTQ5a2VwLytRMHZoTHJDbDVL?=
 =?utf-8?B?TFZjTUZISm53Q0VuWXJ4STlGKzMybmxTcksrelduRGRoclVHS3FwREtleVpZ?=
 =?utf-8?B?cDZ3SmtQYS95MHd4dWpRN283dE03b3ZlK0pPbFpqcDVyZ1NhL1gveE16RmxS?=
 =?utf-8?B?SEFBSkNQVzZEYjdrV1dRMHZBNXNNYmVxeWZWb3RidHhXdFdFNEkyY2F0Ymoy?=
 =?utf-8?B?Wk13MFNVbkxJV1F6YlZpUmxWaEJIOVZ4d2VicFlHM1NLaXBjM2RGcjZzUE9T?=
 =?utf-8?B?Z0VvREI0ZU5PYk03aHB0aGZzbGNvVEJXb3BGU0lZb2VZWHBSOEg1SkNZMDg1?=
 =?utf-8?Q?M9W4uHJ7DpSJV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enBnUlFoWEdRMDkrckVQVS91d21PNE1UemF3MkExRUxiZktka2FQUGEzTVhz?=
 =?utf-8?B?dmR3eExRY3FkM3ArN2R6VEpsS0pBR0FhVVZxa1hSdm8wVTBxSXRHbk90QlRQ?=
 =?utf-8?B?OE9zTWxhdUw0WUJQRmdPSnRYK1lhRDQrN3dBNEF1Rk0xYW9UVHpNWjhDcTBZ?=
 =?utf-8?B?blFyYjg5RTZ4cEptQjlCUVFzOGM1R21La0Q2ekVzWXFrVmVUVmI0cWVtTkNi?=
 =?utf-8?B?MnZiM3FzZEdJN01MM1dXS3JIOWNUV1EzRjZjQUx4NVFrZFQwNEszTklHNmRV?=
 =?utf-8?B?YUhVc0JKWGZDcXdJNmFnemcyQjRLV1ZjVFZtdjduSmV5b0tjSmluZE8yaENT?=
 =?utf-8?B?YTFxWWpvN0ZNamt5MW9Wdmk3UzBuUk9nTG80NHAxZGpqZUs5Z1Q1MG9WdkZP?=
 =?utf-8?B?LzdNeDFWaHlEWlRHaDdvTU1kMDlYQS9BdEFqRW8vVnk5eVpQL3ZpQ2I1QlRQ?=
 =?utf-8?B?K1QvdVlnNHV4eklha2w1UXl6c2J2R29LWFd6OUgxTURFOGVmbmRuRmVqc0V2?=
 =?utf-8?B?SXIzUzFWTzBXM1RJV3BaOEsvTVZTMUFNMnNGR21JRUh6RjU1UTA5MysxTE83?=
 =?utf-8?B?dHpJRnV5NVo0bFFTczhGUTVZZmZtV3hhRkRJUkxJN2xoMmF4RUVpZkFoZGUy?=
 =?utf-8?B?Wmt6Z0xBNGQ1N2pYTjdyN0pyRThrU0dwc2t1N3c5ZlZJRVFqWEtvMy83Qnlj?=
 =?utf-8?B?OXlXalBCUERzM2t0QkV4dzJySHhDQm5pcGFtd3lsTkdrYlM1SkMvMHd1bkxN?=
 =?utf-8?B?ODd5RHFKbE03N2grRXUzYlRFUVVHaEhzRklQTFdqUlVmbklNZmpzV1g4MUhW?=
 =?utf-8?B?OVNtL1BpOG9SWWpJTG9MdEJBdU5XNHlKMFNjZEI3aUZNTzZibzRLU1M5U0NH?=
 =?utf-8?B?WWxQdTBlbVhpNDBHWXhHSEVFSHNJMnBBb0dUN2pJNVFxNFQrWS9XclRHT2Fi?=
 =?utf-8?B?ZXdVcU9YVWxSZUsyR2o5bWZDbjZGaEpDMmlHUlluaVN2RTNVbnBtQk16MnIr?=
 =?utf-8?B?eTVjeDRKa0UwK3dQcGxPbHZZTkQwOElGenBUNXlmTzdocHNnNk1ITGIzUjMz?=
 =?utf-8?B?TThrcVZIK2p1aHdCVDMwUVpSUEhjL2lEa2RFWDUxNnVGbmRkczN0VngzVVZz?=
 =?utf-8?B?K09XT0x0eFgvRko1WW1PcDdRUnBwTTcyeHlCSHZBbDR5RUVOZ1lGbTJScHph?=
 =?utf-8?B?dWw4d29UZDArQmgvdGU4TWJSRy9teVFTcjBHOUVTeDhEeDFXYmphSTRpTjNl?=
 =?utf-8?B?d0IwN25QazZ6dExrWE5ESFUrNW5Oa1EvbHpGTkhJRjlnQm1WQy94UElJNXU5?=
 =?utf-8?B?MFpmdzV3N3YramV4dFVnSzkzajkwajJZYjBYdEdpZ0JGOXEzci9ONCt3RGYy?=
 =?utf-8?B?ZXpTU0Y2WjFPNXhKYUNNWjlxd1ZxWnV2aFYwdFBuQjU4cVJFenJFREFNYnM2?=
 =?utf-8?B?ZmlsUHdSMFl5cUF0R01EZjU1RWJSbGtaWEtjbitZeWpkYjNaWWJCdWtiTnYy?=
 =?utf-8?B?RGZQTlZxZ1I1ekZxZFhaV3R4dFhsS0FtSEsvUUhtUTZScnQ1VDBiT3JqWWdu?=
 =?utf-8?B?T2p4MW5UTjErbzRNQkhNcndyN0RpU0huZ3padUVDRk5Hc1hrS2w2OW8xUlBF?=
 =?utf-8?B?LzdJQml4VEV2S1JkenMvUHhtK1p6NitIRTBtaCtwWkNpUzh6ZnF3ZkJaNnZi?=
 =?utf-8?B?RFhlTURJbXpkN1BhckdsSWllSGxRenJmSCtPTWR0bVluRFM5NmpGcGJZUE90?=
 =?utf-8?B?dlZIR1pnb3p1WXptNDlSWUd3MFN6NW1VQW5rcXZFQyt5UVo0SW5iLzRMblMx?=
 =?utf-8?B?T01RMDd6YUlNRWdOWkJJbURoODRvQ1JtOWsvRGppK0M1VHVMWUhaZ1dGTzNY?=
 =?utf-8?B?Q0VTNVY5QzhXRmQ4WWxjd3Vic2wrNVNxcG1qbkY1NHpZVXhqdWx6enZ4Qm01?=
 =?utf-8?B?TmZIUHN2cm8vRG50RmN2L1hPQzl4QWJCajkwWVNINlhvQmtJbEUxbkNhdTRG?=
 =?utf-8?B?UzhIY09YbGlmNThxbGlGdjhXUjY0b1BBMWpEdytvTldoWmtvbm5wL3lpNWRT?=
 =?utf-8?B?bUpzRWZXZEZkbFN6ZUxoQXcyWmUrZDQ4MWpEVHVpRlZhVkZQL2FHM0d2czdx?=
 =?utf-8?B?RExNdjlyVS9rSmFWYy9KeitmUGtqZEQ4Ry9iUHFxZ0Jjb3l4cWtkL3JLMm1x?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0737bfc-6772-4dab-6eac-08dd548c0ac8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 04:31:01.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlkyqS9ufAETYh8CCkIHHAQMzRRBy6/HwCcc/wcIv8V8Bibt99bB46MP8JUbsmfA3XALCi+RdWhmtPeYB80TFNszwcvN6XETVvr/UUsb46U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-Authority-Analysis: v=2.4 cv=AbBLH2XG c=1 sm=1 tr=0 ts=67bbf611 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=JuWQrhNb23crj1esyJ8A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SL3Q8hsc_mv1kybtLBtDsEAqI6Lmvn6e
X-Proofpoint-GUID: SL3Q8hsc_mv1kybtLBtDsEAqI6Lmvn6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 04:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211835

Ping

//Hongxu
On 2/17/25 15:14, hongxu via lists.openembedded.org wrote:
> 1. Due to upstream commit [GNUmakefile: Require the user to specify
> '-R' if their make(1) is too old][1], add option -R to make
>
> 2. Due to upstream commit [src/bin/pdfman, scripts/bash_aliases,
> pdfman.1: Make pdfman a standalone program, and add a manual page][2],
> inherit bbclass lib_package to use package ${PN}-bin to collect newly
> added scripts and runtime depends on bash
>
> [1] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=50c914d25b40ac6a4d63ce10ed146653098014a2
> [2] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=ed9bc1e3277befd6e165270f14e458a5ec4074f1
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../man-pages/{man-pages_6.9.1.bb => man-pages_6.11.bb}  | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/man-pages/{man-pages_6.9.1.bb => man-pages_6.11.bb} (92%)
>
> diff --git a/meta/recipes-extended/man-pages/man-pages_6.9.1.bb b/meta/recipes-extended/man-pages/man-pages_6.11.bb
> similarity index 92%
> rename from meta/recipes-extended/man-pages/man-pages_6.9.1.bb
> rename to meta/recipes-extended/man-pages/man-pages_6.11.bb
> index 8258874dd7..52a1fbda14 100644
> --- a/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_6.11.bb
> @@ -20,9 +20,9 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
>   SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
>              "
>   
> -SRC_URI[sha256sum] = "3ae3f8ad97487d2c1b14258231d97d03b4e569b915377f6dd4f6be7141c57ee0"
> +SRC_URI[sha256sum] = "44c09f43ae7a0b327efef5285a30d56ecc5fd4a07056f77e806f6c65196ba7f3"
>   
> -inherit manpages
> +inherit manpages lib_package
>   
>   MAN_PKG = "${PN}"
>   
> @@ -32,6 +32,7 @@ PACKAGECONFIG[manpages] = ""
>   do_configure[noexec] = "1"
>   do_compile[noexec] = "1"
>   
> +EXTRA_OEMAKE += "-R"
>   do_install() {
>           oe_runmake install prefix=${prefix} DESTDIR=${D}
>           rm -rf ${D}${mandir}/man3/crypt.3
> @@ -40,6 +41,10 @@ do_install() {
>           rm -rf ${D}${mandir}/man5/passwd.5
>   }
>   
> +RDEPENDS:${PN}-bin += " \
> +    bash \
> +"
> +
>   # Only deliveres man-pages so FILES:${PN} gets everything
>   FILES:${PN}-doc = ""
>   FILES:${PN} = "${mandir}/*"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211518): https://lists.openembedded.org/g/openembedded-core/message/211518
> Mute This Topic: https://lists.openembedded.org/mt/111227800/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


