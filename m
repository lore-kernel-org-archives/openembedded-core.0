Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB47ED12D60
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 02:35:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50157.1731292544424320041
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 18:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1045cd4154=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB1P2dw025420
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:35:43 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42sxq8hehk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:35:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWm38UZpqFyO4vUlFDiSUZyNPiMfvdmiNlMKpUd/4lnWSsR8M5c8PWDgji2eqp9sRcNlqDsmiFfFg48QmQflugxso4+68kujMIBRlxOWT0uwIY1xv3+RT92jhquyINdvnZZOxD/DLGGR8TB5rnbLrsap0/J1zOwmBlFdiB3O9HsI9zxSKTZFC2lnAXLfkjbjeHptde4CQGGx03CBdL5wxPxK37Lp+dlWfFBK6kaXnO1T5ougOBTTBeY64kXguFXIb3ZNO+HTYqbCGZLYZKLCWTTofTqH88QjZusDgN2ugq3msso7PVhrm5+Qg/Mrc9EUJBIENMnUAjqlLqcx5hLmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxJTRnS6vCFnMt+8e3bvmQuijtaAlKHjGjpyY5AGwSc=;
 b=nbH+5IniaB3vEuaND0yeoD6NoLAd7BdPPBt9vSBS76mEr/E1B9bCE/FGo7NIvlTvAChKU7kbXLC2Gzb+V+A8nQMY3Dr3a9gDX0lPZq8YCsAAzKqhyB3zTLSLL9OixKFc6dpXQu3uSjv8qy+Qi2cHksCXXWIy9ZijdKH1GcW22dKIYVEL9vtfFAtl/yaMM1lkC5j1fNzGwKFvirvL1bJdoBqTufy2o+3CBS2IQuKg75mEF3cB/YlAJiqJiaPuc3oqNO7ogTInQ/8lKpR6qhNLEXLf5oxGYsRQ469XZu2KhUg8cvSYJjT3R7fKetRKbaDLP9+4UdRWlgzXuNumBTjXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.28; Mon, 11 Nov 2024 02:35:36 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8137.021; Mon, 11 Nov 2024
 02:35:35 +0000
Message-ID: <25b5bbc0-ec05-418a-bd30-6edb7dfbbf92@windriver.com>
Date: Mon, 11 Nov 2024 10:35:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2]v3 tzdata&tzcode-native: upgrade 2024a ->
 2024b
To: openembedded-core@lists.openembedded.org
References: <1804B3B536644BBC.30502@lists.openembedded.org>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <1804B3B536644BBC.30502@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|SJ0PR11MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: 0799f629-dd85-49d4-df11-08dd01f98523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFd5cG5KUmtRQjR2UDBGSDRmcys0N0xweWRDSXhhR3ZjTlA2UEpYK0VkdTNk?=
 =?utf-8?B?K0tHNVROVkcxdjkrQnVkbmIwblY3UWxpSEdtZVpmbndRa0Fia1hnUk9OMVJs?=
 =?utf-8?B?Z1N6Q29CQ1JaT3BTTzFnTldaNThQenpBQzIvZWE2Sno0c1E3bkhUNWdTSTNK?=
 =?utf-8?B?cS9iSW5DajhrVi8yOEwyZ1lidkFYQlgvQzllYWJwbjBCZnd0M2ZVdTJFSkNw?=
 =?utf-8?B?TkcwaVZ4MHV2ZFBQRXhNcVB6d3VOekhuQlZ4bVJxT3IycGIvNDR2OUUxdmVS?=
 =?utf-8?B?WFNORHQvMEtCUHRMeFdHQXB1WDJoVHBGWlUxNHhFQXB2dWUyS1RkWURwdnFZ?=
 =?utf-8?B?T0pYWDRNcUFZK0oyeFpnVHRvTTY1NFBTYWJTOURJZHQ5SUdRM0ZFK0FVS291?=
 =?utf-8?B?K0h5dlBuR2dQY2hLaTk5YlJHOXhCV0FOK2RHMStMQklsL1VPNlZKT2RlQXJk?=
 =?utf-8?B?QVA1bnFNSXlkQi94WmV1T3dMU212UnRQR2luK09abTliSDJUdG5aRzl2YjZM?=
 =?utf-8?B?VEpKdjhUZGVOTUJGblIwcU83V1FCNFV3ekE5Ni83M2xweFJWZmlaRHBDZkxE?=
 =?utf-8?B?Q1B5Qmo0YUVUd2xxTjZBWU93YWZ0TTNoQnJSaGJEQk41aDhCSVUySTJrRmZI?=
 =?utf-8?B?RHRRb3Q2RjUwWnc4Y0pPd2NkRENvR2hPTGh5d3N6R3dUZllhQmtwbTgwWWdL?=
 =?utf-8?B?dnNKVUFhalhpMGVqb1lUREp1NXczTlNLRjA0Ukw4aWk1U3pQWGU1MWw4MEhw?=
 =?utf-8?B?QVkxcG1UbWlVNkE0RTVWZFVRVzZHU1VRK3B4bUJ5WUlBQy9uZHFoSlMxTGQ0?=
 =?utf-8?B?ZXQxZGNORjQ1VjBJT0tGSnRMaHJHcmhWc0JHbERHYjU0K09HSVhlQUlaN2t4?=
 =?utf-8?B?Z3hOcjdhOUxhaFF0YzhJVUhhYzc2UC95cGpDNDVMNW50dXB3UlR3TGtDRnZU?=
 =?utf-8?B?YlpxaGQ0ODB4SEgzeVVjUVhxaXIweDdLSnpoNHlibmJFTnRZRW55ZU5vdmdV?=
 =?utf-8?B?ZlFFaGhLcHc2U3kyZHhDYUdqeUZnalA2RDFqU0dtWUJQQUxIUmE5Wkdlc21k?=
 =?utf-8?B?RFlzZ0F5eS9kRERNYnp5TnRuTklER1R3UmtDUTdwdkcxNHBDOXRPRHh1SDJ3?=
 =?utf-8?B?L0hRTDE0MDhod1hvTFBLeW0yc2Eyak11RDJYUzdFcWNiZWJ2OG5obzVCbC9T?=
 =?utf-8?B?M1RndUdXemZTVXRtYmRVK3J4WlU2UlhkQVl5OHBWS0NuV3NmQzZpOFBBRm93?=
 =?utf-8?B?NzFDQTZPTEdEOXpiY3p6aUt4TU9mSnhTUGFPZWZET1RhWUNMclhubmZRcDlF?=
 =?utf-8?B?UWt5WUNpWE9DOEVSSmhlcGlocm1qSDU4MkYzcnNyamFndnI4Znc3TDRQV2Z6?=
 =?utf-8?B?RHRKSGNqZXRYbThCeG93UmdlamphSW1Pdm5WOVNOM2cvclhPb3dvcXROWlNQ?=
 =?utf-8?B?czYvSGVmVm42dXZKWEEyZmx4c3lvMnExL3FPVmgxREprQng1MmRRZGdkUnVq?=
 =?utf-8?B?eGhTZGx0S2lKZlVGYVhQSnIydUtQZ2ROZVdpa2R6VFIvbTJiZVR0VG5oVDlh?=
 =?utf-8?B?ekhxUjh3OU1jQWNuS0VxdDJPdkNnb25remdFeE9sRlVhMWd4c0pkS1VBZnhv?=
 =?utf-8?B?UTVzU3dPZ2p3NlM5RTV0N0xHYVpzNkR5dStUM3paRE5uSDYrdGthRUdVWERW?=
 =?utf-8?B?ZnJxWG0ramR3TDdtcWVEY0poZml1VG9QTXNXVGE3S3FZZGhRS3oxK2FRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXVhMTIvaXBlUlEvL2J6UElkOEh3UHRzWDZmMGp3bElvZ0orVTdlWjBoc1JV?=
 =?utf-8?B?VUw4YTRmNk1GWVRLSXp3OFoxMUZvUDZDTXcyWFR0RU5VSnhtcEVnV3Vab1Az?=
 =?utf-8?B?MitWTmMxcVNlRjdWb3JkTy9zWW9nbDZ4Nk1SV28xaUhCYVo4c2lTTUxLM2xa?=
 =?utf-8?B?K2VaWEYxeG10THhYeUJjY0hnemRoUDFMM2VHejJPQ1ExVzJJeUZSUjlobEx2?=
 =?utf-8?B?c0lQZlMvWUR6U3BFdnZvdjI4TlFweWw5dmZNSnZQZjMzUFlsd2VwRE1NV01i?=
 =?utf-8?B?WlZ2ZjBYY3pnckFhdHBoeHEzaU1LNy9ZazFxTHg1bzBIV24vU01zOFpUNmZC?=
 =?utf-8?B?RlIzN0ExNDBVZTJiRTdZck9RejFtd1FxNHp0TVVkcFROWExRdWc2bTB0Yjhs?=
 =?utf-8?B?VDl6WmpRRXNtcFFLMXhKK2phZ29RREFKb3FZbjB6bUpONUtOVlpqR3d5Ukp3?=
 =?utf-8?B?OHRMMkhta1NMY051bzU2T0Y1c2JCS1JDdDVpZTJLSmlsLzhxbzROSVpzZE1D?=
 =?utf-8?B?eFVmM3c5bG9waFR0RVdyMFkyTEV0WmFEc0JuZWNTamd6Um4wdXlRTWl5ajR4?=
 =?utf-8?B?cFNseEQ4WGlOMmVNWVYybEJUL0haVFQ3STBaRG9UanVaL0lEUUF6YTExK3dF?=
 =?utf-8?B?Y3JBQmlGNkVaL3JQU0JndkZPaHh5d2ZsWktZSExGS2NYRGN6T0trUExYRGQ1?=
 =?utf-8?B?NXpJcEErTjZYY0FEUUIzUTVEcFdEc3BySGZtVWxreHE3Ky84UkExZEVVZ0VW?=
 =?utf-8?B?ZXh2YWx6RHVabk1pZUNyYkhqU29jY1BURkxYVGx0WDhFVmlxR1ZYbGo1bUFE?=
 =?utf-8?B?ZEtQUjQvQTRvNTJHZitCNjIxcFFIRmZ1bGVFMmlrYW1jRWpKTEQyb1FpT0dk?=
 =?utf-8?B?UTA0Q1JzYnI5OThJQlNrKzBRMlZoTTgxWEFtL1hRT1JsamZ1dXpsamxoWXor?=
 =?utf-8?B?RDBUV3B3VGF6Sk5aMDZLVFFUNlNUN0hvK2RKSm5vYXNkODJZTkNWcVZuOUxk?=
 =?utf-8?B?Mk9oMThLcFJHRE5xMGM3MEVQYWdhYmxkeE91dlZIb3FlMVlFazVYTHBORG14?=
 =?utf-8?B?U3VlaFVtbFlxNXduS2NTT0lPR3huME1oU1M4ODJJcHVZcStGZklnZ0ZmNVNj?=
 =?utf-8?B?VFJ5Qmh4N1UxeWhwTzFhWUR1REpQM1R3Nml6MGlCMzl5TnRNRi84c0puY1du?=
 =?utf-8?B?SCs4elgwZDRjRFZtczJEdmZxZ3BSeUZBY2xnbW5GOVM4NUxVUkc0ZUFUQWhm?=
 =?utf-8?B?L0doMmNjNU1tSFBQcCtLVGZMaFdHSTVHZXMrTTJlMldBd2NWa2NOZnkxWjFu?=
 =?utf-8?B?cFZQdHloQnVvdkFpODRndzlxRXJRMVVDVFo1K0pnTWlNV1k4RHc3eG9nVFlt?=
 =?utf-8?B?WiszL05QTDlpeXF6V2tXR2VoM3VNSVlGais3OUcwVjUxcEhJRE1GUmF5ejMz?=
 =?utf-8?B?NFpZcytBbnBxWEdWdG9UMGVtS2xWWGtQNFgzT2FnSE1SWTd5dWNFWGR3OUxV?=
 =?utf-8?B?QmlzUG1rTUdYR01PMXYxcHpmTldua05vcUx0ejdjcmhSNFhpVHhvWm9PRThD?=
 =?utf-8?B?QWtyeisxTjZBazBvSGJOQzlRS2hJazBlS0tLRW1pc2ozeHQ2eCtkQU5ZVUFs?=
 =?utf-8?B?OStQMjhOT2d4ZGFHVE9xOG0rL0hKTW84b21mdTJaOUZtNTlxd0h2b0dJd3pL?=
 =?utf-8?B?cTJGR1RMaGZ5YmV4NVRrKzhOMGdobWcvVnFZeUpWK3UxZVJiN3JxNmxGNjE5?=
 =?utf-8?B?bXlrZCtwRWxweisxNWJHTGZKUWZyZVoxVzViaENFeWwzQVcxdUFvVE1JZUFX?=
 =?utf-8?B?OHRHSmZvVHFhb21EZm1pYzNCQWhJUVFBeWhtWVl1OEV0Qi9kZnVvdU9Fdi90?=
 =?utf-8?B?YWN3VzFKT0M4Qi9KOWp5VE9VZXFDVVZHUEhQclR4dFhoSjd3bGFGRmhXcUl1?=
 =?utf-8?B?dzZLL1JwclVQRmlac0Q0WldPRUMzSy84dFg1U3VTYjJ3QUkyMzYzb3R2eFB5?=
 =?utf-8?B?Q0UyOG1lY0RLdm5LVi9hdlZoV0piQVozTUprODU5elM3bmFTV1p0QXJIanpJ?=
 =?utf-8?B?SjJpai9ZRlVsSUxmNXZJcjg1MG1CQmE0RVRqR2Jsc2FJQzlOaEpVZnpoU1R3?=
 =?utf-8?B?RXZHKy90WHhVU0ZVWWxjUXZLejc5WllVNkJoekNXc3JaQjJqNmswaXBVQVps?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0799f629-dd85-49d4-df11-08dd01f98523
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 02:35:35.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXaI+PHUOj5BtbQX1X5evoPYwkhBBwPm9lV3CxVYMs57qFUly8sfSBzkciPnDJbB75p4SEr4bsa3y7KfakFKOoQx5MFg5kD2QwUhgaOWhAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
X-Proofpoint-GUID: aTUjifPb6Bd_Ptaxo15HUgBTv3ELFaR5
X-Proofpoint-ORIG-GUID: aTUjifPb6Bd_Ptaxo15HUgBTv3ELFaR5
X-Authority-Analysis: v=2.4 cv=Z+m+H2RA c=1 sm=1 tr=0 ts=67316d7f cx=c_pps a=7V8mf9/socFTThwl5N0qNQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=I0CVDw5ZAAAA:8 a=yuZo-0fufJu_htIUpLYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_02,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=986 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206929

Ping...

On 11/4/2024 3:35 PM, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>   meta/recipes-extended/timezone/timezone.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
> index 4734adcc08..adf095280f 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION = "base"
>   LICENSE = "PD & BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>   
> -PV = "2024a"
> +PV = "2024b"
>   
>   SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
>              http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
> @@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
>   
>   UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>   
> -SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
> -SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
> +SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
> +SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206675): https://lists.openembedded.org/g/openembedded-core/message/206675
> Mute This Topic: https://lists.openembedded.org/mt/109381276/8617462
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Jinfeng.Wang.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

