Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D67D597C4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 01:22:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1669.1731460940984729518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 17:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1047b5ee64=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMTUKs017270
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 17:22:20 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwpp9c09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 17:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+1KNAPIrDUMD86eJPVUeIdXwc0m95PeGHYjVM/4ucH4yFzi4UV/pTVaRRQ7UaK2sr8N4a+PWiCopmzIkOvpowG5yMLXYRLJ4O7q9fIruGJ3JtQJkqNsSTwnMIUmwEciVVq6C44oZohc6YvTyiGGysIaEO6jRF5APCh+S7zNTg91wXQ4bWNzvGvDrqd9EMSKdOYfxojv5iGolEwM+dD+3x0rcZya69HWmWVOGkVLzaeqxMrcipISzle7Owe3IvTBlr+gh1gMTH5Ss8DVWU6H2mE/061PQ+mAbgVIqF4hJb9XBWyfYwjKzUFYpItuOkzHXUeaOWGyXrFBKj1VF6HldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E96hvLJMuyWVEc9pjpZrbcvDox+AGco4q5EyVTZAN50=;
 b=ChryBET9eEQrSzB4AKKM++L6lU/8h/6iI/E3FBzT52oVwGmVX9c3CMSC1b8cQeSvNFNemHc75GWnODrebDA4w8JAfDQNojGv9MPBivX8TI5AUy8scL8xeOn84iL7vKzy4Vi79cicu0hX/KKib1gb2vtHJwWjBBFLnacUrGHOqlUT/aYSc0D7kBkAzP2LXDKHtPEuhahzkG+Ub8GC73tFYAAVt7XKmNx5Lio88CnclXV3XkZa3ldyK6EeuP9spgwKdWeyXz/yu46d1X2dadoEfdL3wqG8OvEeFAlvvzWN7RXyiIUiMhmzLxFRgwONINq85WK3WnYwXhNgsQ2ax2oqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5531.namprd11.prod.outlook.com (2603:10b6:408:104::18)
 by IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 01:22:15 +0000
Received: from BN9PR11MB5531.namprd11.prod.outlook.com
 ([fe80::2d59:8261:c261:1d9e]) by BN9PR11MB5531.namprd11.prod.outlook.com
 ([fe80::2d59:8261:c261:1d9e%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 01:22:15 +0000
Message-ID: <15c3fee0-514c-42ce-a235-4a355b396704@windriver.com>
Date: Wed, 13 Nov 2024 09:22:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/2]v3 tzdata&tzcode-native: upgrade 2024a ->
 2024b
To: openembedded-core@lists.openembedded.org
References: <1804B3B536644BBC.30502@lists.openembedded.org>
 <25b5bbc0-ec05-418a-bd30-6edb7dfbbf92@windriver.com>
 <ZzNZxr5mKWHXQ6vm@bootlin-mathieu>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <ZzNZxr5mKWHXQ6vm@bootlin-mathieu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:404:e2::18) To BN9PR11MB5531.namprd11.prod.outlook.com
 (2603:10b6:408:104::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5531:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ae320e-781c-41d3-5a7a-08dd03819b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmhNRktMVmk3cUM4N0dLeVd6cHdVT1dwS0VhdG9RYzA3aUt4WG8wNEJ1MWV4?=
 =?utf-8?B?VHNMK2d6a3A3L2JBUjN0djZVbGZhMG54OWxwWlBUNXhneDZiNTlqS2hKWm4x?=
 =?utf-8?B?ZFYyZ2JwbjU4OUdveG5UaUxzMXZ1bEN3ck9BOCtRMEt0azVVZk0yV01ib2tn?=
 =?utf-8?B?bkdsK0dTRXdlMkF0S0NqM0p6cThiSkp5VmUxS3dOVVFEbjdLTHJLT3NNaThW?=
 =?utf-8?B?bTFzRk5tcEd5eWJBWk5FbDhUeUpPbjJ4MTBzdVpDOWoxb0Q5ZHVmdWdlODd4?=
 =?utf-8?B?NFhRZkhiTXpHcEt3NjlpUHhCT3lnaXRML1NYZGlMMTFmanQweW54N0R4SEk1?=
 =?utf-8?B?L0ZUb0I5c1AvT1lPOXJoZEhwbk0yU3F5a2VTcVlUZS9yK1NTNVJDejNPRGpO?=
 =?utf-8?B?L0VyQ2xzY0RMc3F2a0hJMVV6Y1daZUR3eU1yaWxvVzFwVGZKSUEvVkVSczBN?=
 =?utf-8?B?SGpuU25kYTZRZE5Sazc0b0NBTk4rSEZxa1ZjbEtZbXFYb2NYOFcra29KSm5y?=
 =?utf-8?B?QTVUeGlRTGVGQVBJdlkvenFxWmFTUGxaRDRkRTc4TnZSdWtBR1lMTE9VY2k4?=
 =?utf-8?B?MW5qK2sxR1BGclc5ZG1ES1lFZWlEMHZqZHBJYlAvTVFnUzIvK1VVQjB4L2VR?=
 =?utf-8?B?MEVPbVZscDJWRVdNMDdtZDdVZGlnMEpkRmQxY25ya216b0JIMkFSRW0vSDFr?=
 =?utf-8?B?bWZQS1VRd0tWTkRiaGFDTkZmZ2dVSHp6a1R4bGdvNVhsanFYMFF0T2tNejNM?=
 =?utf-8?B?eUh0c1FKNExXdkQwMm9BdWtRQnpPRWpSaGdrUWY4bTNzMHdvbmxZZW81eEIw?=
 =?utf-8?B?UEZqMmlydG82ZUtSQlpOYnFQNEZZMTZneHJydmVyVGFNZlhDVHFKY2dHQXRw?=
 =?utf-8?B?czdjeW1Wd3RBcXBxTmE5QW9WSGlTZE54dlZ0dUxJbi81RE9LVHE4TklhQkdH?=
 =?utf-8?B?MUJuQWQ5MnFGc0NTcUw0TmlURVZZVW9EZlBlU1ZZNlZxTkhhb09FMm9tdlFh?=
 =?utf-8?B?WklYNTYrNjhIQUZETW9QSS9vLzhvU1E0SDRUc0RNMHdEUUF4ZkJXa2o5V2lE?=
 =?utf-8?B?dHJxMUQ0T0dKMlRQVXBVNHp1cHhiOCtNbmpPd2lZOTkrOUMyUGZlekF6T1Z2?=
 =?utf-8?B?SUxjcFFVaXR4ZGZPR1ZtRWpwVDFEbDdNRTlHUno2NTRNcWJnMy93UHlNRE1i?=
 =?utf-8?B?eHVabnFnVmdGYllhWjlYQUs4NDNuL3ovc1lnTHQxemxrY2F5T01WK0ovd1Fl?=
 =?utf-8?B?Zm9VUFd5NjkyUU9KOUt5dFp5d2M4c2VXYWRNNTF4MmlueWNFQTczY2E5eTVM?=
 =?utf-8?B?MnlhMDkwNkZINkJBOVpzMldBREFXVGRzeVZFTk01cGV5akNQVFB3OTdXZlc1?=
 =?utf-8?B?OUdET3NneEdhb1FEUEx2SFVsQk96KzFiWEtNUGZTKzByeHBtaFBVZlQrMjJ6?=
 =?utf-8?B?QWdGbGVOTHoxbzZvK2Z1NEs3VlZZNzFKZTF2SjVWMjVWWjllekUzNEp1Z2s5?=
 =?utf-8?B?b29Yc0ZoVTNZSnRibnpBSXlodUltRWlvbnNSTC9JcUpiKzI3QWpkUmd4VkFL?=
 =?utf-8?B?c0JwZDZabmh4ZUdVWWtTYUpTaVdLUVgwNFVJZzFRS3RyWG5yclVxZUExZWVL?=
 =?utf-8?B?MFNYWjEwbUg0bm9tVE83Y1l4bWdVVG9KbnpSOGpTR0ZyemEySXYvVjJWT0xV?=
 =?utf-8?Q?5sqOD8CwHwDSr80zRdwF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFFSTUtmZDVMQ0xFSWtOZk1NdmhyYk16bjNGOGYxbml3Und2eVdOWHZJZFZ2?=
 =?utf-8?B?RE1jRVp6V24yTG5kWU1EL1hBM0xUM1ZMdGlvZERMNUZOWjZsd280a0pOeTBp?=
 =?utf-8?B?bVFhcUx5TXBLbHhrdW96UkVyVWp2Vm9GQUNtTDdiMTJHdEdWSWdMa054WTdt?=
 =?utf-8?B?MzlDWkNMclFFalhsMkMzRmJnODV4amlpUlVIUFViL0gvQnVVditxZnlZTDFY?=
 =?utf-8?B?RjhNU1NmWmxUNmZTenl4eXQ2V21QV1ZTSUdRcGxybFNpL0JjMXZNczhqZ1lW?=
 =?utf-8?B?RE1tdktEd1BlUHpjUUN0OGdDTlBHRWFCUWxaemliUXdFVUczYmJWbXgzL09G?=
 =?utf-8?B?RnVhZjZ2RFRVa2E0NXNjRnFUUW1kc0xQTkoyTFRZS1ZnaXJiNjlTdThMeWl5?=
 =?utf-8?B?Uzlzc3BlYngrajJlUjY0ZUNpUDh1SkU1eGxFL0g3dkpNTzE1bFduSWZoRVZO?=
 =?utf-8?B?UFhvN2dORTJwUEQ1SWt1a0REdFRhM0FzeHJiVWp1Yjc1eWhFUE16TXJPUmUy?=
 =?utf-8?B?MlB4Y2xGMEsvQkVsU2JVdjdhOFFXWWxacUFEMHluNUJPMUdkSEY1b2ZUQjQ1?=
 =?utf-8?B?SHhUVGZjejdlZkd0UFJudGZ6ZFl0blF2ZlZ4ai9KWW5hTTJybFVJUDhtTmho?=
 =?utf-8?B?ZGF5Skg0d1JBa3NacW5wZ1VLRUx0eWcrUWpMUDIvR2VMNUI1Q293TVJJMi9H?=
 =?utf-8?B?bjFPSWt2KzJvQ1hlUkQ5c2VseGNZU0JRclRMaWRucUx3b2ZiTDBoUWpmYzFY?=
 =?utf-8?B?QU1tODNqWXZhYU9QRm54bDRHSkxYWStRaU9kRXZNRlhGMWZDeUNBWGdiMjht?=
 =?utf-8?B?ZkpBSldFTE43UjladTF5V3NCMFQ3K0VlTG9IbkUrZmpxSVhKTGZ3b0dwVEov?=
 =?utf-8?B?M2p5M3M4Z3NBamdQYU41SWl6ZWdMZ3k5dCtSYUNRd05XaGM3WTVmd3M3UnRw?=
 =?utf-8?B?KzZOTHU4ZUY5NVpHK0JZanpzbktXcUN6d2Zmb1RUQm92UGVwV3l2c2xNcG5a?=
 =?utf-8?B?N3Y5NW0yOFdyZWZKNE5KNzdjR0FIeUZ2VVEvMlF4cCtSbXpxcUU2dFlxQkZS?=
 =?utf-8?B?WGMvVlhaME1FVXFJR2VicE5BTHovYTZUVUpjNW4wYUowTnJ2SnB0VndtbXI3?=
 =?utf-8?B?Y0FLWWwvU3pPVlpuRmpBTkZYbmZ1WlErSkEwYm9vSE8zck1jM2F0ZlYxWFJn?=
 =?utf-8?B?WFFld25rZXpySEswWHNKbFZEQzNxaVR1em5menBTWEdPcjRSWkdXU1ExYjgz?=
 =?utf-8?B?QVo3SlE1MDZjRFI2K2VNWlQrdW5OY0pMSjBoUjZOWm9vNjZkSUhZUzVNUE13?=
 =?utf-8?B?cjgxMmVvOWJXQ05XU0FtclRZT25TYjJOS1REckliUlJ4Qis3a2tnSnBIZVcr?=
 =?utf-8?B?QkpuVVdJOGlVcUYwRnhvby9ocXNpOGRPOE16bCt0VWdZZUpjbFowUis5VGk3?=
 =?utf-8?B?V2EzL2RiRndLRjJETDU1Tyt3U1ZyVmVpcXljVU95UHJTNjJ5R3QxWEtjdjlX?=
 =?utf-8?B?MXRpbG92S3EyVGE0enRobXphOE5SbGVodjZQbG00bHAvaU02S00zNmVHMVNR?=
 =?utf-8?B?cTFxNDV6OVNhZ25lbW9aS05kR1o2NktieGJxa2RieGxXR1pjTURWWkRXQko1?=
 =?utf-8?B?SXI5bmZSMFNUS2ZpcjlNLytvQXFWZUpFNDVpZ1VRZUlHNVl5OUI0WVU5US9G?=
 =?utf-8?B?ZStZaFNPR2RETkl3QTUzRlpjTTRzK1JyQzh2cnF6cXJIaWFkc0hDMDRoSUlO?=
 =?utf-8?B?bTByZG5JSmMxOUNZUlNxUnNhd0ExNHFhUktwZ0FmQ0x6UnhYU1BITVE3c0ZD?=
 =?utf-8?B?NXovTHRLNm9HdnFaMEFKWllhTmNwcWdqRTl4YXFnTVE5YUxuSVZCQURJMDhu?=
 =?utf-8?B?TkpNZ0Y1VDBlUTJyRnJ2L01Bek9PVFZJQ0Y3U2FvM016WVJLQjRZSHczQVJj?=
 =?utf-8?B?M0ticlJyMENjK0ppQS83WURqdkFFWjlkdmh0aTVXYm9iSnUwcjNrSHB0dnlR?=
 =?utf-8?B?S25xbytqbkRqd0hBVFJCMUhMR2RQeGgvdVYzdEtvV1VnT0twblh4SkpSUTNn?=
 =?utf-8?B?RXordjZlYzNQRHhCSk5LVk9SenFLdXNiTy9OUVAvc2o2a3RUYUZXUGVWL01j?=
 =?utf-8?B?S1duYU5WUnozaG9iUURUNzBjRlFnOThvaFVDakdOMzg5VUo0VWdyY1oyVVRC?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ae320e-781c-41d3-5a7a-08dd03819b37
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 01:22:14.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uihBFAGaR2FUO2za7j8IwC5WC5V4jnqKyVj6EeA7t9mQ42LhrK6RSBO0CxY+91nU0GmiHXzhLL2aEW14LX/qiUZKOAeczNIBTpsWS2B6/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
X-Proofpoint-ORIG-GUID: ahydF4haO8uiT3Rx--aLNR45uj3XL65F
X-Proofpoint-GUID: ahydF4haO8uiT3Rx--aLNR45uj3XL65F
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6733ff4c cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=8CazkcCuUbgzYE1e_OcA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=956 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411130010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 01:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207072


On 11/12/2024 9:36 PM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, Nov 11, 2024 at 10:35:30AM +0800, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
>> Ping...
>>
> Hi,
>
> I believe these patches were already merged in master:
>
> https://git.openembedded.org/openembedded-core/commit/?id=0c8f87d5d4ec9f286b1e85d114cb9a728c1ff64b
> https://git.openembedded.org/openembedded-core/commit/?id=b84b29b1827624270cc1698feda2ee87d55c01e4
>
> Is there something missing ?

No.

Sorry, I missed the commit.

Thanks.

Jinfeng

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

