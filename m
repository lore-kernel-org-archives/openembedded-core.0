Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF69C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 02:07:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2325.1742263630773745767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 19:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5172dd3528=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I1fHdl028048
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 19:07:10 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jtf1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 19:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeVoa8t45kYcJVV50wYf4o/oJjQkgDs4IrgjEMP2GILkeqkB9VttHnW5pNLRUzcVoR3DX/7CXxyJv2DhsBWqhKossEYSTP9RIyRlfovnynnWHJfekCQJU0ppXX/nsfQ8n5MQKyr4IVvQOQofXCGDQjWV3HLOFinCLajYulLzUiociPbZ9w3CUUVzigbbNCJIsA1Utlj0KuK4DBA9OKqth9y30P6cjRxjI+UzANcCQCD7DSeovB1c+t0ckQ/yhZArHrQAGj0Q0bxYz2t8PFYFKuSlnd+zpEL18moUFjSHG9G27lSKkqmKomlbwwxRut8Sp8cuNldcKHFhBgmB9YcK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHmAgWbDarw9INaLO7nDyP+RDC0cYPo0Kr6GTlld+O8=;
 b=OD1wl/61YMpWuv+J0f1f6rNul4eaUJfeRCT8TT8gDK0exBRJwkkFvuhL9hRhErOpb6+O3nL6U/UyN/PKe049JDfZCmK9oSC6Zk3KHJOItZyKpgyw14KjtBaGqSp8AR6WNpicPRNngE7/1D6tv2l77tkSvyfUmbONDJOFD5ZOLsxJnyjSJrMmuSyxOwu/1cOIbJhn7NWVTOMf3Jo34nl/+MYudxVJPW0b9PmsDCBTav8tZKSYe+2a/bJWIszQvnLkYlVNgwRq4wI5zFhSH1SkuRG7cA/Fv80UkHTtMRHpBCgLbAV3+EEFi3KydyQ4RqY153fMsXYx8gR4yemIsroLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 02:07:05 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 02:07:04 +0000
Message-ID: <5eb97d61-ad69-49bb-b15a-dc106c2609d8@windriver.com>
Date: Tue, 18 Mar 2025 10:07:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v6 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20250314130840.84700-1-bin.lan.cn@windriver.com>
 <20250314130840.84700-2-bin.lan.cn@windriver.com>
 <69571582-71aa-44ea-9601-88da0d8da117@windriver.com>
Content-Language: en-US
From: Bin Lan <bin.lan.cn@windriver.com>
In-Reply-To: <69571582-71aa-44ea-9601-88da0d8da117@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY1PR01CA0188.jpnprd01.prod.outlook.com (2603:1096:403::18)
 To CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|DS0PR11MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 70002bb4-0472-41d5-3cce-08dd65c1940a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1YvY2hwYi9lUDVla2xHcGdXTnYxN1ZIc1ZXQTFIL3FTTmRSTEFrdXZOMThx?=
 =?utf-8?B?TXpweUJjRjYzdUlUeGxXZDhYQWx4WncwQy92S1RJOVl0UWpFNjVXOTBrYXNj?=
 =?utf-8?B?MXkxU1gzeldHRTRLN1JDWi93c1pZVUtQRm9DR3V1ZW8xOS9IZlVMUktxcnZX?=
 =?utf-8?B?TDEyM0RzczRzZmdialhXZEJwL1Nva3Y4OXJ0YVc5NWI0c2FwWlZpMHdSRDBs?=
 =?utf-8?B?Z1Zkbm52ZHByWjhNVk1WSEJRZEM2SXhwbGNCMFg1MDRhSHU2VFVZSW9wOVJP?=
 =?utf-8?B?SjZvMGlZY2hWYXlNblJwTEkvVG14TUVkemJFV3dwNzQrQ3k2MXBteFo3UHZ1?=
 =?utf-8?B?cUxGdktoQVVveDBzSTVKMDhiaVRLOHJ3dWhHRjZMSVd1SG9ZSHZyenZQUWNR?=
 =?utf-8?B?ZUlTVDVjb0l6a1RNOUYxZWZLS0ZheFQ1aStxdFNZVDlHanliWVN5SVI0VzE3?=
 =?utf-8?B?VEp6Y2ZTZi9Jbys4aGZuSTROVm9xSXQ3RGFmajdKeEsyVUZ4VFBkNlpGY1o1?=
 =?utf-8?B?dnVraXNxSWdJR1k0MUhjOGY2TTdEbTdxOTRpbGRnUUdVTTB0dnlEeHcwVExa?=
 =?utf-8?B?Rk1tVFVYb1BlZWhQZ0ZqaFlndSsxTXloWDNVMzd6bGJSRGZoaDIzcW9sZURt?=
 =?utf-8?B?a3hianpmMDIwTjJnRE9jUDNTTTlnZkNBc2Z4dmRVTVRac0JpWThXRTR4L05P?=
 =?utf-8?B?VnphNTU5VVBBNzI4c2V3NGg0U2Jpa3M5Q2Rna0lONXpQamg5UWJKSFJGaGZG?=
 =?utf-8?B?THNWQ2NFT2Z6eUpKaWdBYnh2UmtaMEw4WFlzUTg2TXM1b3JUc2ZHWXg5ZDNl?=
 =?utf-8?B?UG1IaVVBMkhlSWF6Z3lLNnNxbnN5Z2NNUW5ZNUgyK25KWEJKdnB0V2FpQko0?=
 =?utf-8?B?d0J0TlZnVGZtdm41TlFvSjRtNTJGWVk2T0JURDZzMHJvN0VZYk5UQ0NKeGFi?=
 =?utf-8?B?VUR2azRtMnJ0OGUrZndTbGxqeDBKNUFIY2w0VXp6VVNzZXNva0QrSHNyblBX?=
 =?utf-8?B?L2tkeE9VQWlCUzh0Qm5jckUwNUNqbzVqVGF5YURSMnV4akZFRjVqTm5BaVpo?=
 =?utf-8?B?end5b3RPR25rRFRrZ2lKdEsrV1AzallXcjQxYmhpVmJaSmJJUG5ubjFXbkY1?=
 =?utf-8?B?MlZTY2I3ZHI3QUlWNmZONkNNU0cvRVN2eU1ybVFLakR1Q1Vid3NVZFpWUU0x?=
 =?utf-8?B?WTlrUk1EdHh0akhVeW93WmNDNk9ZanVxODhGVVFCQlVNbmpPc05uaVA1UTds?=
 =?utf-8?B?ZmEwcWVLWURWdnlIc05UZmNndkFDZytnSFVkWlNGbUxGRFRpc2RCVE9Kc3Jl?=
 =?utf-8?B?dExWdEVCWFowZkVnSDZXTWZYUjI0SUNHSEdwUVQ4Rmk3YVd2YVRVdy9HTjU2?=
 =?utf-8?B?TWVER2RieGpaajJZMUFEMzZobDg4R2JTMEhtZlJDSm4rWDZQK1lEMnhQSXlW?=
 =?utf-8?B?dVdaOUJsclBRYUl2bGE3SzlSMjZlY0lkSlJYeWdpeWxGenNwRU85bzdkUjRM?=
 =?utf-8?B?NXZWR1EwajJkbGh0dm4zOThma3dZZWQzTk5RMjBLL1g0N0FjdEtUTkxiK3dG?=
 =?utf-8?B?aU05bmpRZVdqOXVhaDRXK21NbzNTL2pRdU9zVnlEZDRHTmxGR2VwZ1krRWtr?=
 =?utf-8?B?TjhOb05POFVQS1p0YWJoNVNTRm1ocTVjWXFSWnI0YzJFYk1ZL0cxbHl1Z2xS?=
 =?utf-8?B?WTVUanpzRFBtTFp6L3BoNDNMOTMwak5GZ3VQNFpHRFRZRE9tM0orRUtia1dK?=
 =?utf-8?B?Kzd2KzdXRXV1emhxRzJ3aUVmWUxoRVhIZDZOa3B2N0NqbC8rQU1NTnB5OWN1?=
 =?utf-8?B?cDF4TTQ1cDc0U2RsdGNMZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ekViTFA0bVo1MUl2QmhEdjBnRmpMd3RDSWQ4VDZVSFZOamE1bC9OVmp5T3FG?=
 =?utf-8?B?SmVCbm1Dd2h4T0xrWXd3RmpIejFQeEZIcXZKVmgxcmFKWnBSOWFnbVQxdmIz?=
 =?utf-8?B?ZllkUHNVWkdtTWJKcVJ2TDFUeURzRFVYL2lhcnduTEJwdUtaci9IdXZXYWpy?=
 =?utf-8?B?THZDaVoxVFJLU01nenhhOHAyUDRiampsbENucTBhWXd6R0tuL05QVEEvWVNw?=
 =?utf-8?B?UW8zSzFCRTN4YzR4N3dmNjdEYXU5R2NkbU10RnlKeFVqRHozRUpNZ2NGUFVj?=
 =?utf-8?B?ZEZ4TXQ5TjFVRHExdThsMjRyUFZwaU9hSTFHSlR4OG5nQkxJRGl1eWRvcGV3?=
 =?utf-8?B?SVM2MWpkNlB6M2w1MUxBWmJ0UkcwQmdNUUwrckhrL1Y4c1d2QjhXQkVJalhC?=
 =?utf-8?B?bHpXdWhBcTdlbUpqZ2luZFF1UEN4YlZVb2JpZkNTZ2ljbmJQZGF1MGt1Nm1j?=
 =?utf-8?B?YUtSRDNvd1NzQzZ4NjNiT3BESGErUlFUNlZBQkROQy9ZWVNiSTFDci9nYkhG?=
 =?utf-8?B?QVdUeHZxeS8xTVdEdnVzSHN3Q0dtWFBqVWhyK1Npd2gzQ3A3Snp2WWJjVVdl?=
 =?utf-8?B?OHo1czRKWFpObjdzSGlncWNaMlV6OTZlS2pOZmI1eHA1eC9hdDNiaGMvZGFG?=
 =?utf-8?B?K1M4NlQwRC9KSFlVb3oxemFoeDZLOExQRm1MWnVmQ2xwa0NZYWtLazAva0Fo?=
 =?utf-8?B?MHM5UzN1UEc2bUZuUFhuZkhFQ0Vrd0dXUzNvS1BabCtmVXRFYXlScTNEaHNF?=
 =?utf-8?B?SUVjNW45R25kaGUvRkM1M0NtR2ZIaTAyM0REYnRRVUlZSVFTLzBxWlJjTGgw?=
 =?utf-8?B?akNjUEwyYTBzVEU5S0hhaEZlUmRPZGpTRS9sbGVqSXlId20rQ2ZJTSswb081?=
 =?utf-8?B?aHd5Ry9RUHFOa3l4Sy9XSTc0anJtNkFneWd5YkRFVTZzUkNsWXFBaWNwNVdq?=
 =?utf-8?B?SEFXUUVONGxRczlpSmkxaEJGTGM4Ty85VERoeEdZNng5dkIyZG8vcmRNTlhX?=
 =?utf-8?B?QWl1MWEwTFBLczhUNTFUZjJ5TFVWK3lwVzJ3RXNDMVNzaVVTQ3YyMDh0Vmpq?=
 =?utf-8?B?NHZzTWdRMzV4amcxY2oxMmZjSGRwUi9kSm1QTWpFWm93QW9qbGZDaHEySW1y?=
 =?utf-8?B?RUltM1lUWXU1dVJLQzJOMllESjVLRkZ2T081THd2NVo2VGFXa2tIMjZFbzVE?=
 =?utf-8?B?QUlFb3dVOUdpN2Q1clFMV0gwRkhlWlpuNjZNYzVtTXBkMW4ralBpRFVBa1pi?=
 =?utf-8?B?UEV6NWZYM0pNcnRNL3E0NEtMZWNIcmI1azhzL21lZmtKa2R4akxVMTVOL3dL?=
 =?utf-8?B?bThaMGtBemI2bllrZ0s1WTlhWldnWXhYUU44OUtwbjh5ZXJ0Z0dMVUpjb2RE?=
 =?utf-8?B?YnE2TGlOZVNGL2c2VTBhZGZmVTlOZFoxN2tMQjYraGpZQUZiQjYySTJJNlNU?=
 =?utf-8?B?Qm1LSFpCQ0FzU1JicGlhUndrRmgzZnRSSWJaZkdid0dnRDNBS0V3cDBZdm5L?=
 =?utf-8?B?dEh5dmgxSkFzYTJmUTY0d2VMOW9xUTVnNVA5K1ZrUkQyZWJ3S3JsT3Jha1Bj?=
 =?utf-8?B?cHRucllhSjd4RU9Iai9rVFg5THppd3lyaDgySEZNMDl4WWNvQ0lycXNrNUdF?=
 =?utf-8?B?QVhhUDFFNmhQenlLQTg1QzhZVnFjMDNCeFoyQk4rTFpzKzFLZzU3cy9icW96?=
 =?utf-8?B?cmdnMWVHY29KVUFnNjdyQmZRUFhoOFdsc1NqMFJGZG5PNk9WS0VNY09PcEVw?=
 =?utf-8?B?SFV6bEJIVXNyRXhHL0drckxnMUpMdzBPRUgxM2gzSndUZE02ZEcvV3lYMnBQ?=
 =?utf-8?B?VGVXN1NBNEhMcnpEMy9RZTh3bmxIbnRTKzdwZjVkSGdLd1VDNmMralQydU1z?=
 =?utf-8?B?ZmYrMEFmUnR4RnJRa0kxZ2VGSWY1WmVqTmxiWS9KQmdlYlNZNE1UZmU2d3NF?=
 =?utf-8?B?WEFLbUVvbFFjenhQbWY3V0hzU3VTYmM1dmtiZ2wxOTFqQzYxUTU0Q1EyOTFn?=
 =?utf-8?B?RlhVY3FMazV6djhmMk5yclpnSTR5NS9yWGsvMjRCaStiaE9tSWU2ZUJhUTl0?=
 =?utf-8?B?L2VqeTR0SjhQVU1LM0U4NCt3dWRQRytFQTRIaVVyaWk3bEFnMXhBQ210cTh5?=
 =?utf-8?B?dlVLaEs3S3R1Q09XZEJueEFYSklsb2NVUFVSYnZNcEwwSHY4ZnFzZ1FyNXFF?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70002bb4-0472-41d5-3cce-08dd65c1940a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 02:07:04.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yb8kgaV7elEfLsarPDMTxjBlDWyuHmfpfPsebleeLBmm+eNIRf82FtpD9fnao8vKEfv413TfqOV1hACw4zDafELw6uX8oYucjSOZ7QKx0h0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67d8d54e cx=c_pps a=1OKfMEbEQU8cdntNuaz5dg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=rl2nNezgqP_oE3HIwmUA:9 a=QEXdDO2ut3YA:10 a=BBahhS0D0WQA:10 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-ORIG-GUID: X2Pnxob8BRPUlpWDzX-fIoF0CcPmja5D
X-Proofpoint-GUID: X2Pnxob8BRPUlpWDzX-fIoF0CcPmja5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503180014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213132


On 3/18/2025 5:29 AM, Randy MacLeod wrote:
> Thanks for providing the version by version changelog; that's very 
> helpful to reviewers.
>
>
> On 2025-03-14 9:08 a.m., Bin Lan via lists.openembedded.org wrote:
>> From: Bin Lan<bin.lan.cn@windriver.com>
>>
>> Refresh 0001-Make-manpages-multilib-identical.patch with
> ...
>> Details about the 2.1.0 release:
>> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html
>>
>> Signed-off-by: Bin Lan<bin.lan.cn@windriver.com>
>> ---
>>   ...001-Make-manpages-multilib-identical.patch |  12 +-
>>   ...not-run-test-applications-from-.libs.patch |  28 ----
>>   ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
>>   ...sts-set-the-correct-plugin-directory.patch |  30 ++++
>>   .../lttng/babeltrace2/run-ptest               |   4 +-
>>   ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} |  38 +++++-
>>   6 files changed, 200 insertions(+), 41 deletions(-)
>>   delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
>>   rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (66%)
>>
> ...
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>> similarity index 66%
>> rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
>> rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>> index 6a0052f779..bf9df2a32d 100644
>> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>> @@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
>>   DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
>>   HOMEPAGE ="http://babeltrace.org/"
>>   BUGTRACKER ="https://bugs.lttng.org/projects/babeltrace"
>> -LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
>> -LIC_FILES_CHKSUM ="file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
>> +LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
>> +LIC_FILES_CHKSUM ="file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
>>   
>> -DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
>>   
>> -SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
>> +SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
>>              file://run-ptest \
>> -file://0001-tests-do-not-run-test-applications-from-.libs.patch \
>>              file://0001-Make-manpages-multilib-identical.patch \
>> +file://0001-tests-fix-test-applications-in-cpp-common.patch \
>> +file://0001-tests-set-the-correct-plugin-directory.patch \
>>              "
>> -SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
>> +SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
>>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
>>   
>>   S = "${WORKDIR}/git"
>> @@ -32,6 +33,15 @@ LDFLAGS +="${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld 
>> # coreutils since we need full mktemp RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
>> +RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-utf-16 glibc-gconv-utf-32"
>> +
>> +do_configure:append() {
>> +    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
>> +    # is not created by the babeltrace2 build system. It is need when generating
>> +    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
>> +    # So make this directory after configuration.
>> +    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
>> +}
> This works but would it make sense to send a patch upstream to get 
> them to add the mkdir to their build steps?
>
> Then later we can either update to 2.1.x or backport the commit and 
> drop this extra step.
>
Thank you for your review. I have created a defect 
(https://bugs.lttng.org/issues/1424) to track this issue.

If the upstream project solves this issue, I will either update to 2.1.x 
or backport the commit and drop this extra step.

--

Bin Lan

> Thanks,
>
> ../Randy
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

