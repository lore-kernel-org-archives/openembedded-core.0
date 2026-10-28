Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39043.1793180287965588444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 02:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aRxCCOQh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47618183db=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8HCoI187982
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 02:38:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=H5wRt5W6jxtK+JoKP0hHkoWPiP2cWZ5Pb9L8mJuIZSg=; b=aRxCCOQhSq02
	rFjWkQTIZ9bdPnsY9LDkhHZTcQNf+Z/3vJ7zvTrH2kucWjtaXbMYlwN6SmYTjbu9
	jpVapYWLBmLjSmmMLjyN9zc0n9hs/lisgh4xctJeauaALZ4neaMFcr9wYjbbfkAR
	sQZCJDrr0Qxu4hzoc/AWmY6MD2DlofH76AoToe0WO0nO+w0hj6SVVNq8kbpim9UQ
	VMjFEvtbr35AnuJpsWG0UR+d6bZqF91YZlbgHMJTN2zutGelGsSxfw2+mP65rHI3
	r52+O7KQk2krv+mqjLV1CYoDohKiFdAr5FsA+/Ef4jHuE22o9k8Pu0TgXrdD9dSn
	jX26WLC69Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021133.outbound.protection.outlook.com [40.107.208.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgqy1nskh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 02:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h68aCa9tRlF9jHnySjJs5BCM7oYGr5EBgizeVQAq2c6Ex63ElZmjKHLlXdV9tV2qKhAyJyLj1CEo4HZ1GHkocdkJ3iGE6GL0Qelkiny4X2vpbSfGxnjgREb6cOO5LdBNN9ezReH1WzRmCu75GXe0dXa29yVZw/FA0x/6m0d8pubeF6GQxlLO9fyWFg8MnCdDVd2tT7VuiJX7EuFuFrec4woSXUFAYEQuKLNSkxtEh/gg7yP7lwYv5A+pTNf2hMdxBER+vfdElmYCGuW3zJV/VjVxi3VSk2TNtyVGr+vVfwcBRqRdFuSwDN4Afl83TMIWmw9XD6TwSOtAx5JqM4D2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5wRt5W6jxtK+JoKP0hHkoWPiP2cWZ5Pb9L8mJuIZSg=;
 b=ohNifb9Ls4gdPZ36ByOiQjctm+0RIdFz0dE91W2HleZgnNWPeshnxI+7GGS1J94radU+k27xelTBUFtJE2qY/vQdookKsOwzDCJTtXHc7RlVxZl8Ab5LF/SAmdVACwqDbQ+OZ5zRv/sb2mLtBfuO2MZxTA84HqQYJ95JAmHJzgO8Gg+9EJLKIKFz/uuY/Fhzx5x7QJPWAqJbt7XjyLzISyLFAI5p8BuXTW98rikDxLOG2yhYW9N8MtYgEGKOxoloryORtyxjtJaq9yHepFxaaS43I6SUJA/IHRWgr5n+NNFup+4o8lgjs5215sQ9MQTDL2jz8BUn8HDtk8eAerdcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LY0PR11MB972267.namprd11.prod.outlook.com (2603:10b6:404:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:38:06 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:38:05 +0000
Message-ID: <d4af0c80-de8d-4b78-aaa9-db66b31116a4@windriver.com>
Date: Wed, 28 Oct 2026 15:08:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [blacksail][PATCH] gcc: Fix for CVE-2026-95619
To: openembedded-core@lists.openembedded.org
References: <18E25C41E5F47FE9.189163@lists.openembedded.org>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <18E25C41E5F47FE9.189163@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LY0PR11MB972267:EE_
X-MS-Office365-Filtering-Correlation-Id: 61afc03a-39c5-47c7-5119-08df34d72b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|23010399003|1800799024|366016|3023799007|6133799003|18002099003|22082099003|261026121527099003|56012099006|5023799004|11063799006|261009223027099003|261021121427099003|10067099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 320/Lx8xgM8Nzyy2qnFZAehh4gIMINmNBsTOp4/d6T0EclrBCLLaNUy5e0UaQPYcA9r2uuXGOiuP2/Emb5/hNQLlShH8FIpu1mBkmLkNJzvKJGAneEoZbI9wxUwIywqAYBaNWY7HzRuUndVCyLnwsoELtaVNArU5uXeEfjdRDJthfBTEoTZwskKUJ5cv/UBfJ2kLEpSIPaw+Ihn+vzpodD0avQPHeLhGbwc05pV+JYDrZXV7B7JePbHzkbXx/dmHa9xRggvHLCs5ZqJFMe4ODH3UC1KOyAdv3hKG5h9iZ5dGBlqZijlUf3vrH4NAPKye3EFgPr2fXPg2SvSmTjnXeYy/2RY2t8Uzg22upfHZEwgspXXS5x9dzZ68MhLnMfH+dvO2ST/eobz3fVWvIVLxTCMhyNXhBeL/pF/CkIvBIQ31C1Nx9Udh0BFqfpPeY1xw35OTFLemoemGtNY0DlAByR2zJzx3WKkjCVs1OLMDX9jeBN78LkuHaRtx8Y1CN4MaUC7Bb+PX9q26nDV2veSyTFvFnJ9Hp+w/M1AVXMQNSjUdxpbwnzw+9FWhu+mTKpi4Ezs5VuFGwWgK07G7Z9TU9qn90CdHi8bD70WicV5FWY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(23010399003)(1800799024)(366016)(3023799007)(6133799003)(18002099003)(22082099003)(261026121527099003)(56012099006)(5023799004)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elBvMUNIb0NNc09FOHBuUCtaVlhPUmVjSjFNcWszVHhzSlN1ZWlMcUdLb0xh?=
 =?utf-8?B?OU9MUWNwM3hJaHVsbHpIU0VRU01HeGVFY0h1VW80bW9mTHVDQXFPa1FSd25Y?=
 =?utf-8?B?SFJ3SnF4eHV4YkJSSWJhampVUDdPNnFMWWpwSHEvdm5KZXVNUG5QWEVDK2VZ?=
 =?utf-8?B?eFZrallCNWN0WWcveGsxeldvRHdWaHJHWmtidFR1V1FUMkE2UTkxYnRBNFM0?=
 =?utf-8?B?ZXNGdFZjeEtBSW9JUisvNU5XQ29FMWxCUGE4ZkZYMlRZSmlIa0lvNGVlNUZr?=
 =?utf-8?B?aHMvcTRrT2lCTDlCSSt3ckxnSy9tcWo0d2w3ZklrR3QyQ1RsTUlZWXU3c2Rm?=
 =?utf-8?B?MUZSdWsvV2Z0d3N6ZEordXd5bDd4MXV2UVdnWmRuOUhOWHhSbjdJN0dhbERn?=
 =?utf-8?B?VkJ3a3Zwd2dldHFqK1RwZ0hBS3Rpdi81dmlHOG5iaStCb2V3MEZLYmRYUUlF?=
 =?utf-8?B?bVZqdHZJcWx5aVhWNFc0bUtWNzIwMGM5NDF4RFp0QzRWalRFcXhXcU9OUWdE?=
 =?utf-8?B?cUZmK2Zkelc1cFpMc2NSSVprSDEyelVXWWgvaUppaXFrZG1URVprVTR3U3l6?=
 =?utf-8?B?NzdIYXRpVDVsMlFhNjliTDJsOFl1d3l3SGlyMllydzFOem1wbmt1QW5Lb2N3?=
 =?utf-8?B?ZUFEWktYalNyd1Z2QnhxUTNkbjFJZDhzcGhoR3NRb2lQRTYxem10V1ZPYjZF?=
 =?utf-8?B?a2srdmQvV3loMWJiOE1xRG8wSGdNNkc4eFNDQ25OVmxmZE90TjR2elhKaUtZ?=
 =?utf-8?B?SGN0eXBIVktDL21hc0ZpcndzcXNhMlpONXdJVzlYTUhQbm96QXA1eWxGb1ps?=
 =?utf-8?B?MkxCK04zdXRPb0pubkRRKzBkbW1ld0wrSHdGZ3FGakJMcFRlQURINEs1L0xy?=
 =?utf-8?B?c2NpZjNLZlFPalFpNVBxS3BEa0ZJQ0lqRXh5VFNad1NXbjNtaHUybEJqaVRJ?=
 =?utf-8?B?cmYvd0xVSVhIa0ZwVTJEZlp1ZjJzR28ybmtUSis0ZXcxcjZRWk4zekkyNXRm?=
 =?utf-8?B?bU1qVlhtelFheXpRTWJNemxKejVSNFNIbmRyS0laRWdQVTI4TkVlTnVDRzVY?=
 =?utf-8?B?Yk15c0FwUUlDSGl4RVZ5YlFPaU1sU3Z0aGtaNmcxdDNGSU85azgydDlrMnBl?=
 =?utf-8?B?TStYZUhMOWJsM3FZUWcyZ2xsSFFuTkVjM0xQa3NEdlhqV3ZOVmozVzJ3Wkxa?=
 =?utf-8?B?dmFtVVdsWFE1ZklPTy9xMklQUmpqVGxLeUhhbUVSNUJzNDVWNmk3cFY3UUls?=
 =?utf-8?B?dUhFZWQwelNGQjg3SkFVM2pNY0VSYmUxajM0eVJKdUtjMmtRSGpNdS9rOVpl?=
 =?utf-8?B?UXZtNTIyeU1BMlBQdkp2MUZCWnlQcEo0TG1wNUdjK09RUGpXYjhCSnp3VU1G?=
 =?utf-8?B?b1FrTkFRM2Rmd2V6RC81STl2ZGU3cjcxYXJ2SXR4cE54SDEvd1dYZTFra1Mz?=
 =?utf-8?B?WWtES0FqZkp2VjZ1ODdCZ21Ka2Nud1M1RUdIdUozWXkwYktUYWVmaWNsVmVE?=
 =?utf-8?B?UGhBM1lKSGRoZG1TSFNrSkEyVTkyYWNYL0pISGl2WkJreFE4dFEvM3U3eTdu?=
 =?utf-8?B?ZGhYWVdOYkJrVTY5YzZjeElxSmRiaDhXVmFJc1R1ZXN1eklzV0xCQVVmT1pQ?=
 =?utf-8?B?Sm9ycDJ2MlM4UEVGQkdVaFR5enpHTWl1VHVhajZId2pYNGUyZEQwT2xQM3lJ?=
 =?utf-8?B?V2JENTNaQjhvemdZdElvYnFsYTRrMEEvU1VlMDVSS0diZnlheTROVmNqUFRr?=
 =?utf-8?B?NEJiTXdpaXJSWHBlMTVMK0hEQW5wVktTRDE0ZlNZYTdDelh1VFRzNTBtVVVn?=
 =?utf-8?B?b0h3WUxzMmt4Nms2MXJjOUN0NHZ0R3lPRTAyRHJtZ0pCSWs2Tit5K3B2eVVC?=
 =?utf-8?B?cGV3MVlvVVVaazc5N1lwSXN6cjNmRWoxRXBOZWxxSXpHMlhmTG91NUZjMGhR?=
 =?utf-8?B?MHA3WE40NGt6M2wvY2JtN1RjSm9mSXNMbGFFaFY5b3RhVzNvTDVsNGo3cFdv?=
 =?utf-8?B?NmpTbDhLWm9PdUhlVVRKY0FrY1g1TExnbCs2ajEwMGJJbmFIYXNndkdNVy9U?=
 =?utf-8?B?VWdiV0l2MVBETVVEN09Mdy9rMnI5M3NxN3p5SkdoYVFvSDk2Zys2QTBXcDJk?=
 =?utf-8?B?TEkzUzFzL0wyeSttdmc5TTltdnMza1F6Vk9oelA5UG5lMUovWkJoQ0xxNm1n?=
 =?utf-8?B?cVNZeDlMaVM4YSt2ZGdrWFBJaERYcmJxaEp6LzlpQlV2bDFORVlqRHRWcmUy?=
 =?utf-8?B?Y0x3L09NNiszSEpoWjJ4WnpKY2R2WUlqbGxlWGFZR0JISEU3ajcxTkN2N01u?=
 =?utf-8?B?NlREQTMxSEhIN25GTmxzdys5WEZ1ZU5LTGpEZXkvRjJlbGg1dWM4MHFNWDZv?=
 =?utf-8?Q?XOn+kmdBfl2znAPA=3D?=
X-Exchange-RoutingPolicyChecked: Tg16T8n/YHFufK9X3NGcvvZzXL+X6+wlRMuvf8kjfebKL6yKcXIPvM4UPAlzJh3G2rCAOS6K+/wSIu/p1fsKd1nNStzZblfi5Ou8CGcPSNHcNNYyyIobClZ0W9+aNQJbLxawrKDy9QsVMuZud0tHD3TaIxCmt8XmZBY1jfUmrBeDa2ZUyDHY8pJYas3PreJ+TSCGarYBsA0fvdHsMVFDgzrVMmDuwjTzbbm4yrdIKW1cSUUPwvPyfmx5v5XHmvAmNjf8ay9kLbkRwCM6RV6KQXMCw0HxId4veJVd3qjKvCCEaBCjSN0tgh1r7M/CVFNywBPq9k1VOQcdBimaf9aJGw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61afc03a-39c5-47c7-5119-08df34d72b17
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:38:05.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va9COXBuQ6EFzEnZdg2RItJ6B1qgkB3id+2c6aLxW96MQQR9v3qRWg1EPrqBgzTnYoo4p/N5l+sZXkCddV27tgmGB7VotMwhQ05PsCLIDIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB972267
X-Proofpoint-ORIG-GUID: z84p7hRWo75L-KQqZGe6msU1Bt3CHBAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXx9/+Vj+Jo8Lg
 YkGrXkAbQEU4J5wtLzDFmwtpgqqiy8CvH0OdiPFdPGem+GuId4N4MYWncdgj9BjCPRQZHO7JUYA
 lpZUSBq0mABXhwMock6PyfJMEP6qyHPOiEjlgcadGHrXAjS/yAkWdyWIQPxbRIuQlCnPwidDXaG
 23xKGOch6Gmyoh+tb/vkxP7NuO9qvl6DHz6JHBzMQAHV84yGTH+kkNwF1whNcS1U2dNrxRxToaz
 xY+XpokvhCuk3gA/mMTNwV3UaMZ2+vQK0j8BIwwychOSBQgfEFkjx4EM+E60NrQvQvDqcnC4a08
 7KtQ5QHHZtzRwDi1cbA3+WPYFihA15CNpfJz1RETRic3+s5Ks8A6SMlhg8hfzHxpdxEEyDMSWXK
 uxkPKr/7TYMf66YFGGHZWq3JAcVD7/nyu9d4fS86BGbwK+etZHgIYpkchjiAIaXapQVNgODfRGk
 PMeQJiwL2uH0GnLvOBg==
X-Authority-Analysis: v=2.4 cv=dr1OmFg4 c=1 sm=1 tr=0 ts=6ae1c27f cx=c_pps
 a=oB12z6Vl+/cAOQgROE5n3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=PfnOd_Vne-10dN2E4cAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX+0157fAtKxwg
 IFp9eDpLp7WLFT5j0QN/7RomSRhvq9vP6q5roPjLpuHGfNpq0lCdI1o2gEpYifEnc/lSOqYc7Hu
 fM6o25w3AkVohshT24S/2oxi55bc2LABMZeoyPue/klDG27MrNJs
X-Proofpoint-GUID: z84p7hRWo75L-KQqZGe6msU1Bt3CHBAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248801

Hi ,

Please ignore this CVE thread for now. We're checking applicability with 
upstream, and based on their direction we'll send a v2 if needed.

On 27-10-2026 04:00 pm, Hemanth Kumar M D via lists.openembedded.org wrote:
> From: Sowmya Sathram <sowmyasathram12@gmail.com>
>
> libstdc++: Ensure that aligned new detects size_t overflow
>
> Depending on the implementation used for aligned new, the size argument
> may be rounded up to a multiple of the alignment. If the size or
> alignment is a huge value the rounded result could wraparound to a small
> value and be successfully allocated, returning a non-null pointer that is
> smaller than requested. Add size_t overflow checks so std::bad_alloc is
> thrown instead. The using-directive for ::aligned_alloc is replaced with
> a new __gnu_cxx::aligned_alloc function and the parameter adjustments are
> moved from operator new into it, with the added overflow checks for the
> aligned_alloc, _aligned_malloc (Wine) and malloc fallback paths.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-95619
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=59d235ffa5a69231eb42e5290d52dc8c90d28b7a
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
>   .../gcc/gcc/0027-CVE-2026-95619.patch         | 183 ++++++++++++++++++
>   2 files changed, 184 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
> index 3497493619..31a630ce8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-16.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
> @@ -75,6 +75,7 @@ SRC_URI = "${BASEURI} \
>              file://0001-mapper-localhost-might-not-be-known.patch \
>              file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
>   	   file://0026-CVE-2026-102010.patch \
> +	   file://0027-CVE-2026-95619.patch \
>   "
>   
>   UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
> diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
> new file mode 100644
> index 0000000000..373323a02e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
> @@ -0,0 +1,183 @@
> +From 59d235ffa5a69231eb42e5290d52dc8c90d28b7a Mon Sep 17 00:00:00 2001
> +From: Jonathan Wakely <jwakely@redhat.com>
> +Date: Wed, 23 Sep 2026 13:15:18 +0100
> +Subject: [PATCH] libstdc++: Ensure that aligned new detects size_t overflow
> + (CVE-2026-95619)
> +
> +Depending on the implementation used for aligned new, we might need to
> +round the size argument up to a multiple of the alignment. If either the
> +size or the alignment is a huge value then the rounded result could
> +wraparound to a small value which would then be successfully allocated
> +by the underlying libc allocation function. This means that we return a
> +non-null pointer but not of the requested size. Instead we should throw
> +std::bad_alloc because the allocation cannot succeed.
> +
> +This doesn't affect most modern targets because they use the
> +posix_memalign implementation, which doesn't do that rounding.
> +
> +On targets without posix_memalign we use C11 aligned_alloc and round
> +before calling it. That rounding needs to be checked for overflow. The
> +using-directive for ::aligned_alloc is replaced with a new
> +__gnu_cxx::aligned_alloc function and the existing fix-ups for that path
> +are moved from operator new into the new function, with added check for
> +the overflow we need to fix.
> +
> +On *-*-mingw* we use the Windows _aligned_malloc function which
> +correctly checks for overflow on Windows. But the Wine version of that
> +function does not and has the same overflow problem so we need to do our
> +own checks before calling it. We include a conservative 2*sizeof(void*)
> +adjustment in our own overflow check.
> +
> +On targets without any aligned allocation function we provide our own
> +__gnu_cxx::aligned_alloc in terms of malloc. This also needs an overflow
> +check.
> +
> +libstdc++-v3/ChangeLog:
> +
> +        * libsupc++/new_opa.cc
> +        [_GLIBCXX_HAVE_ALIGNED_ALLOC] (__gnu_cxx::aligned_alloc):
> +        Replace using-directive with new function. Check for size_t
> +        overflow.
> +        [_GLIBCXX_HAVE__ALIGNED_MALLOC] (__gnu_cxx::aligned_alloc):
> +        Check for size_t overflow.
> +        (__gnu_cxx::aligned_alloc): Likewise in fallback definition.
> +        (operator new) [_GLIBCXX_HAVE_ALIGNED_ALLOC]: Move parameter
> +        adjustments to new __gnu_cxx::aligned_alloc function.
> +        * testsuite/18_support/new_aligned_wrap.cc: New test.
> +
> +CVE: CVE-2026-95619
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=59d235ffa5a69231eb42e5290d52dc8c90d28b7a]
> +
> +Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> +---
> + libstdc++-v3/libsupc++/new_opa.cc             | 49 ++++++++++++-------
> + .../testsuite/18_support/new_aligned_wrap.cc  | 39 +++++++++++++++
> + 2 files changed, 71 insertions(+), 17 deletions(-)
> + create mode 100644 libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
> +
> +diff --git a/libstdc++-v3/libsupc++/new_opa.cc b/libstdc++-v3/libsupc++/new_opa.cc
> +index 7bda847a925..bd0098ac09e 100644
> +--- a/libstdc++-v3/libsupc++/new_opa.cc
> ++++ b/libstdc++-v3/libsupc++/new_opa.cc
> +@@ -81,12 +81,38 @@ aligned_alloc (std::size_t al, std::size_t sz)
> +   return nullptr;
> + }
> + #elif _GLIBCXX_HAVE_ALIGNED_ALLOC
> +-using ::aligned_alloc;
> ++// We have C11 aligned_alloc but we need to satisfy its preconditions.
> ++static inline void*
> ++aligned_alloc (std::size_t al, std::size_t sz)
> ++{
> ++# if defined _AIX || defined __APPLE__
> ++  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's requirement
> ++   * that alignment is a multiple of sizeof(void*).
> ++   * OS X 10.15 has the same requirement.  */
> ++  if (al < sizeof(void*))
> ++    al = sizeof(void*);
> ++# endif
> ++  /* C11: the value of size shall be an integral multiple of alignment.  */
> ++  if (__builtin_add_overflow(sz, al - 1, &sz)) [[unlikely]]
> ++    return nullptr;
> ++  sz &= ~(al - 1);
> ++  return ::aligned_alloc(al, sz);
> ++}
> + #elif _GLIBCXX_HAVE__ALIGNED_MALLOC
> ++// Use Windows _aligned_malloc
> + static inline void*
> + aligned_alloc (std::size_t al, std::size_t sz)
> +-{ return _aligned_malloc(sz, al); }
> ++{
> ++  // The Wine msvcrt.dll version of _aligned_malloc doesn't detect overflow
> ++  // so do it ourselves. We know al + 2 * sizeof(void*) won't overflow because
> ++  // has_single_bit(al) was already checked by the caller.
> ++  std::size_t check;
> ++  if (__builtin_add_overflow(sz, al + 2 * sizeof(void*), &check)) [[unlikely]]
> ++    return nullptr;
> ++  return _aligned_malloc(sz, al);
> ++}
> + #elif _GLIBCXX_HAVE_MEMALIGN
> ++// Use memalign (and assume that what it returns can be passed to free).
> + static inline void*
> + aligned_alloc (std::size_t al, std::size_t sz)
> + {
> +@@ -103,8 +129,10 @@ aligned_alloc (std::size_t al, std::size_t sz)
> +   // We need extra bytes to store the original value returned by malloc.
> +   if (al < sizeof(void*))
> +     al = sizeof(void*);
> +-  void* const malloc_ptr = malloc(sz + al);
> +-  if (!malloc_ptr)
> ++  if (__builtin_add_overflow(sz, al, &sz)) [[unlikely]]
> ++    return nullptr;
> ++  void* const malloc_ptr = malloc(sz);
> ++  if (!malloc_ptr) [[unlikely]]
> +     return nullptr;
> +   // Align to the requested value, leaving room for the original malloc value.
> +   void* const aligned_ptr = (void *) (((uintptr_t) malloc_ptr + al) & -al);
> +@@ -131,19 +159,6 @@ operator new (std::size_t sz, std::align_val_t al)
> +   if (__builtin_expect (sz == 0, false))
> +     sz = 1;
> +
> +-#if _GLIBCXX_HAVE_POSIX_MEMALIGN
> +-#elif _GLIBCXX_HAVE_ALIGNED_ALLOC
> +-# if defined _AIX || defined __APPLE__
> +-  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's requirement
> +-   * that alignment is a multiple of sizeof(void*).
> +-   * OS X 10.15 has the same requirement.  */
> +-  if (align < sizeof(void*))
> +-    align = sizeof(void*);
> +-# endif
> +-  /* C11: the value of size shall be an integral multiple of alignment.  */
> +-  sz = (sz + align - 1) & ~(align - 1);
> +-#endif
> +-
> +   void *p;
> +
> +   while ((p = __gnu_cxx::aligned_alloc (align, sz)) == nullptr)
> +diff --git a/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
> +new file mode 100644
> +index 00000000000..dbd642d6ba5
> +--- /dev/null
> ++++ b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
> +@@ -0,0 +1,39 @@
> ++// { dg-do run }
> ++
> ++#include <new>
> ++#include <stdint.h>
> ++#include <testsuite_hooks.h>
> ++
> ++#pragma GCC diagnostic ignored "-Walloc-size-larger-than="
> ++
> ++void
> ++check_aligned_new_overflow(std::size_t size, std::size_t align)
> ++{
> ++#if __cpp_aligned_new
> ++  std::align_val_t alignv = (std::align_val_t)align;
> ++  try
> ++    {
> ++      (void) ::operator new(size, alignv);
> ++      VERIFY(false);
> ++    }
> ++  catch (const std::bad_alloc&)
> ++    {
> ++    }
> ++
> ++  void* p = ::operator new(size, alignv, std::nothrow);
> ++  VERIFY(p == 0);
> ++#endif
> ++}
> ++
> ++int main()
> ++{
> ++  check_aligned_new_overflow(-9, 32);
> ++  check_aligned_new_overflow(SIZE_MAX, 8);
> ++  check_aligned_new_overflow(SIZE_MAX, 32);
> ++  check_aligned_new_overflow(SIZE_MAX, 1024);
> ++  check_aligned_new_overflow(SIZE_MAX, 65536);
> ++  check_aligned_new_overflow(SIZE_MAX -     1,    16);
> ++  check_aligned_new_overflow(SIZE_MAX -  1025,  1024);
> ++  check_aligned_new_overflow(SIZE_MAX -  1024,  1024);
> ++  check_aligned_new_overflow(SIZE_MAX - 65536, 65536);
> ++}
> +--
> +2.49.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248723): https://lists.openembedded.org/g/openembedded-core/message/248723
> Mute This Topic: https://lists.openembedded.org/mt/121957280/10244482
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Hemanth.KumarMD@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-

-- 
Regards,
Hemanth Kumar M D

