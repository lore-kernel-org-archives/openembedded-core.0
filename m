Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1007.1794339822987959230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 11:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RiVn48qe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5774d2e964=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIqBHK1086019
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 11:43:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=woWj1pvVHpZwDMQXZeZbfg
	RATB7c82xUtx5RWPhMLuI=; b=RiVn48qeJg5tRxnaznp+iDF2QklMnrW73ZpDAX
	KJZU42uSwe4Fy69i9mj1NVy/OuW5ryNP0pxvIz2T8QsJT3AMHe29XtBLkvi8uUp2
	76t19W8l4DhaovGXn9VoRDOwya00ULrYNzw/fbdF6j1NWs9ruy1XJa+9hWGSxufq
	V+SXU4zwPfw2v3stW/VucvA1T+/YstjX1WQh4OYUKnvGgCs2VMXDme7lZ/VnQ0jU
	IEv7/tRcTn6avijofVCyuwptwUCVpn2uux2/lRG5GG3tBw32Y/Wd2mNG7b2Qok6M
	YmSg9NqOyJ5qTSfnwlAYToZ/o4Zl/k01Na9u1srwYly8kekw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020141.outbound.protection.outlook.com [52.101.201.141])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ht4cje0jv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 11:43:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa8K+A7c0vnTaqpdeXArIWs3hlkMSpWysKAp8Lb30xT3UeC1+E1LXq8FVaBn9pSOjsBH17gI3qcecMmi6ue4Els/64v5UHyFo9Phf1BnM7SXwlEVYhz1XV3UJVYRvqUTlzraJQRDHZeqf6qGh2+96kcWdfftgSHTgLkubu/Oh51WNAKjU+0+coO7munko2YTiFQP2HIx5s+D6tfpofKSNEGwzv2dPtHg0/YF2K76jlC8FavfFrqiuJ3GpuXkcrzZ9AfAtJh2yPgrDosGKMCRKjZwu+rlqOXMf75gJ2oViXxBNUIXzrZ800FYEBDBKeOMQ3spcXOQNCbna1qtCpMqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woWj1pvVHpZwDMQXZeZbfgRATB7c82xUtx5RWPhMLuI=;
 b=GOB8PUB/S2VPjN84O/QOHtUqTLRsNawmTr1LlChJB6Ui+JJKwJIMlsKue6MjL2LG95atTE19qsB9H2f4UFb8R56hYW9E5eUY1tqCJTgl968oH09hA8F9FOCQHN4bU6kxPClsSHZHemWN64FgNRlMbw8H2Sl8bt80RmEBtkN0V//sk4Dq1kbjS1cEzuZVZZay0Q4Bg9yjllMAbVVztzzCviG+8hiOWY492lkche8Umr+B3g/TLlHo+kdLB2kxsTrjlMhT+1NqvxJ9DDjdhu0c4M9t9zPLJZFoEPcxqSFi7cOb1aF+XNAhum1B+sSEJ5Cqb5l8W0ZG3/FGs0zuQQkGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 19:43:38 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 19:43:38 +0000
Content-Type: multipart/alternative;
 boundary="------------BEHn3lu0VAv6iVs4UkfuMS9A"
Message-ID: <1cd5c40a-0ce2-439c-9591-0a2826419e6c@windriver.com>
Date: Tue, 10 Nov 2026 14:43:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] igt-gpu-tools: fix build on non-x86
 platforms
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        "Mahajan, Ajay" <Ajay.Mahajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261029093738.1507-2-jose.quaresma@oss.qualcomm.com>
 <1905cd5a-760f-4f3e-99af-4aea68136154@windriver.com>
 <CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZD-mZrQ4B5G_4Sfxcvxow@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZD-mZrQ4B5G_4Sfxcvxow@mail.gmail.com>
X-ClientProxiedBy: YT4PR01CA0201.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::9) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d132e2-76e1-41f0-45ef-08df3f62ea7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|23010399003|18002099003|22082099003|6133799003|8096899003|3023799007|10067099003|13003099007|11063799006|261021135927099003|261028144727099003|261026121527099003|261022075727099003|261021123027099003|261026135527099003|261022115727099003|261021130227099003|261021121427099003|261021133027099003|261022105027099003|261026140227099003|261009223027099003|56012099006|261022113327099003|261026130827099003|260925021311599003|260925022911599003|4143699003|261102123227099003|260925021911599003;
X-Microsoft-Antispam-Message-Info: eUNdSJcgh1rbI1XL4CPcOKXB2xcki2pftAGgr8oeANrkqAccBIIuU6BBjP8zlZjykzD9fmfvAYChByiGJ7QgW7lHI55HDcNo0UaugrFq2YnCQiMW8gc0sMmxcc5Pb5Uc/EGSUrUQ8AhAbIh2lvM7ncExyO38tO+NabBjWKPabFM4qWbDYKBvdXBRyZjwL6417nGGBnHJj938iZuCpxOqUoKoyYFeUaYPVm/idSart5b1KCY68lkyF0M4OCd4tfwylEwYJDKqU4D1oqJKOdb/To60GSmiqb+kHi+UDYv4Ywv+uPvj7T3XWaSacS92SwznFw17puc4wV+dbNCoOMoazSEGca2Vvrx/vVtTxNKn67K3p8YA1qJivapLihi3pWtlHtDUeqVPw4OJ+//tGAEgzFiCaKiOhi5MhJ6XJ1nAsitFN5OPFoDCOaakf1Clq2ha6lQW7/0eDSAP5qPv0RH1E0nbR3HYqECoOsHt6QumW4srTRu9ZbmYxeIZt+bt7vcWjaZFKcmNbyImfMTmZSA6LtJy54zd3I7F0B5dEbPEP1EWD6JyhSNtD9unon3OVDMWVP9EB8ZF2SqSqbs0K8kEVisQvFsCxQ3SCoy4Hni1wyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(8096899003)(3023799007)(10067099003)(13003099007)(11063799006)(261021135927099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021123027099003)(261026135527099003)(261022115727099003)(261021130227099003)(261021121427099003)(261021133027099003)(261022105027099003)(261026140227099003)(261009223027099003)(56012099006)(261022113327099003)(261026130827099003)(260925021311599003)(260925022911599003)(4143699003)(261102123227099003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFpNaU5BZ0NxdVN0cVpmL3F4clZiL3c1S2JCZlljT1lvckQ1VmFKa1dlYTA1?=
 =?utf-8?B?c3pYalgwZHJUY1F3a01SeEJyeGc2UHErVmxoVDFSaThRRWhlRk9iRXB4MHQr?=
 =?utf-8?B?ZzhkdmY3MjYvSDB2VzhpUFlHd24zWGhCZGpHeG9rVnZ2S1JCRkNXcGlsZFJt?=
 =?utf-8?B?YnJldG5Pdkcvc3o4djc1dDBYN3ZLVTB0MDQveWxjYUZRcnkyT2xqenBBUGRS?=
 =?utf-8?B?MTdiQnZoam1XWVdSRVhxdWxoOG1xbU9EcTlkVVNSbnpaTVFkNitIWGYxeHdH?=
 =?utf-8?B?OFI2RUg0aDA0QTlmMDZ6czNZM1hLZGh0bGt6YmV1dzAwWUh2KytFeVBJeGlq?=
 =?utf-8?B?N0lHcFVWb3pRZDdXN01LVnc4dFltazhTcmRCZ1ZHOC9kYlU3MzAycmZKUHJL?=
 =?utf-8?B?RG1ObXc2bVJna2tjUU00U2FiTVNuQThOcWxhS3NpRjc4Q2U0cDBCWElDUlpu?=
 =?utf-8?B?S2NDcUhoRVNsMENEdnhrd05ReTRxaC8xVFVhSHpyQmpVL0FMdWl1c01xRGZs?=
 =?utf-8?B?ZU80cm1DWlhQM2JwSE9yRlNuZkRScGc1WXhFb1RHR2Fla0hkKy9ISFJCWDBj?=
 =?utf-8?B?TVlSdjhGMjV0b28vZXhpNWhRR1VIVVVJRlBDdi9LemlHK0VsSkFHM2J6SjYz?=
 =?utf-8?B?TTRtcFpVc3dEd1N6cGZlQTJkMkdRK3hWNGl6NzlaVStvb09SdG5KZlN1YzZh?=
 =?utf-8?B?bnpuQTNid2lodGlNNmxRUUREZ2NHMzNaU0dycUNlVE9BbE1haXpCZXJITTVm?=
 =?utf-8?B?dHgxdU1pSitCNWszTjZUb09nSEVkYzZPZ1dYNGVEQjRhS2tENmNPWHFwbFRH?=
 =?utf-8?B?WEZuTURGVm51elBRUkxDVnBJbzZGOWFiSXVncktRQm9ERnNTUk5CT0phMDQ4?=
 =?utf-8?B?VWU5ODc2RlFMaURKbDZQL3F6b1R0MUU3MkMyaGJmZ2dYK3BYSE1zN2JrcHpN?=
 =?utf-8?B?enlsYkhiM0VpZFppWjU1bjNKSDlwSTN2OVVZcWxkN3pjdlhLOGVpNzdubnEz?=
 =?utf-8?B?L1Qzdm9OSFBqWFI3UEE3UzZPSCtybkFIeldlMytkZ1ZrZHFQY1Ryd3pOaG5i?=
 =?utf-8?B?dG0vYWZ4NHR3WkoyTnAyRGVCVjZCZkxTUHQ4NmVuYUIrT01QeUcvbWZubUxX?=
 =?utf-8?B?R1YyMVZ3blFremxXeS9pN3J1dVRNTVZ0bGJVeWw1RmNMalI0dnVmVnZidFZu?=
 =?utf-8?B?U3MxNU84ZGpVWTB1VmRFN05JTEZXbWF3SnhSK2g2Z1RGN1d1dG5xeGtzWDJu?=
 =?utf-8?B?NHVFOWx0Nkxyekp2b1Z0bzFzUFFlQnJuMG1qd0M2d25JcExoNDdaZ0lKVUZs?=
 =?utf-8?B?WFFsdWIwUU1NU3d1eWVlMEhTUUg5eHRVaElYbWVQZGd0L3dBWnpQS2phbC9R?=
 =?utf-8?B?SmVjS0lNL21mVXpRbURNVEZNVGI5UTdlbmJrakd3c0tVK3IrQjF2L1J5UktM?=
 =?utf-8?B?TEVyYk1KVnE0SXVpd0hVRFFoZGp4eEx0cWJnTXJQK1BBUlUxVE1TNjFxN3E3?=
 =?utf-8?B?T2xUUnBpdEY2V2RNTm1GQ0RtRXdYQ2p1bERQZlIvTmpOSk5HN2lSem1FUk5N?=
 =?utf-8?B?TmV0L1pUY1hMYXN6dWlKZzR4eHRiY2ZkSGM3Qm9GNzAzWlFnSDluVm85eVFL?=
 =?utf-8?B?STNXWXNKa3J2Z08zRC96aTRHWHpLcmxsYURNMXd1ZXFrTjVEeDZHNkNJc0pv?=
 =?utf-8?B?a0NCOHdBTS9ZUUlpWVpza1lRMmd2eHF6Yk1udGNyaWJmb3pZU0JFY3BLVkpD?=
 =?utf-8?B?WElBdHA2ekZMQk9sZEc1bCtxNXIzOUNaQjZHWTR6TEpOUTlPcjNWT2E2bFM2?=
 =?utf-8?B?VE9qWDhIYzNydHhhbk9QMXBpMzd6RW9XaDl4N0RYVGhuTnZMOTh5TXVvUEdw?=
 =?utf-8?B?QjI2TWIzZFk4cmNhQjd2YlArbTZJZWt4THFpNjlFbkJMUUU0MGFJTFo2Q1NR?=
 =?utf-8?B?UFo2WHdGMTZ4K09QbS91MDRGOW5pRWFNR1dML1hLcXQvYXNuZzhhd2JzUVBV?=
 =?utf-8?B?T0llNVhQU2xsMVlYcjNoN2FpTTlaZW9OQUVTelY4ME5ldUxKR1UzZlVsQ1k5?=
 =?utf-8?B?QXVlRkFJVHVnNmhkbmxEQm5hRStCcWZoTmM3SDAwK2l2SVh5ZWp6OGZPdXlu?=
 =?utf-8?B?UXo4Q2ljMHB1d09XS3BwUTdMb0MwUmYzWG1kS1VZQmFNQkhhVTF3NnBzcHNX?=
 =?utf-8?B?OWVUdTFjYnJCbThPTnFEM0xJRGkzQ0dTTGVHa1VadlNKTENZRzlrU0svbEJO?=
 =?utf-8?B?STIxK29KcTE5TW1IdG1RenZiS1NIQ010bnpjWjdieGlpZG1qd3BIazFoeHlt?=
 =?utf-8?B?bGJqOVp4K3ZDNkpaTllxdDhXdHVNQnFvcUwxdUp0OGF0akNlampKMnVtcUE0?=
 =?utf-8?Q?EwQINyrqOxkF2SdA=3D?=
X-Exchange-RoutingPolicyChecked: 02EJf84bCyiTUdB8fS+j2qt3RsmtBm3EZVMRCghPuGPug0bvm3744VZnAZIaFltsLlcwbtU7zm5fn+olIE2ZLnIdsT7hzv8ym4bmOq+aarX2OblIXstd+9BGp/VBihf+B5gF/b2xAxt4H/Lpex8huJ6NpyALQ4kr8nur/HDjUZvE1gFByXbQ7lgEWQME2FcBKbVVj2IWzO9ggfLhJ1JyD654V+KwYwVjjV1mFfkcJz3Mez3PqsnfORahiP0z9HlnT6m9DShcjFVucjl+1CMyBLCfE5Zw/HojFhF1wxP+qN1dWIYqiLxd/9WQaGGknCKYbBbODnKCaKWPFnbiibDROA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d132e2-76e1-41f0-45ef-08df3f62ea7f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 19:43:38.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lk1keZg9QvGeIgfWCTLwB2kseR5AxaenCf5xQGgbb5aJPG2r2YNYeBJu46XUOSpDn01o0fzWNKYYzVocQ8XPn5uu+fRB1dgtA6SHxVlN8DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: qMJv6HF0mIBaHcnOTFYonedYwoDf4dWW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3OCBTYWx0ZWRfX2whIVpz9A82Y
 2vwUrj7Jm5Sb4lfj3QrVLh5jlQoa5hbmuqRSHl5nWNzV/CjwB9Lzg4w0SV+P0KpjtQ09CHUJUiT
 hAvuRjnjoqrI0f7KkfFZCfMr4LiuZY+9XllrvG6uqV5orD3C5tNZ
X-Proofpoint-GUID: ZtxDC4fEz6EBMckvdMlQ2Z13r-2Nag3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3OCBTYWx0ZWRfXzwt6vTww7vYL
 CvDFxiB15YICl6gbyjNNkB6q6kJN3JaEQ6Gzia28k6VdDW63b4QBXxavzBDKk7w2KZBil4JshFV
 w4rxOVVAd7LlEpRfeEUIgpikU6E46Y3urj7cgfcZsxvp7D61v7eTjpE6J8Q//rzbUe15jNliCb2
 AgPgOBey1LAKuinBfq/6b5KDg9jlS1QUEcB3ymkuSfRBdlH6ES3l0tS90BkzCq40387xY649Zrs
 zAwbLCp5c/N369o6RINXn17GbYFtkZVOD+/pHSYZKye0wb8Sc9qgO1W4a3UJRJIUIeqxmmuSSRQ
 ubA/FN0h6q/h8IQ8l8HPJFV0CMv7FnNHPh2qLJT+xxhINRrqFsBhQWAMlCJKxi2zDFIj6R5QIuI
 C5PmMMBSos7Ven/ghDzqoEZMr5sRMThUIA3sHUQmeWFAYSRMLHlJhm9jycAZb8ObZB3mfAq4mRA
 U7Xtsg4O4C23vK9AhZA==
X-Authority-Analysis: v=2.4 cv=X9bHu2Te c=1 sm=1 tr=0 ts=6af373ee cx=c_pps
 a=QyNrOpZ8ttbodQqJgga0rw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=iuqZZovRtkq_OkQOiccA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=v_8XfsD2siLktM4FwqwA:9
 a=gCBCHQmJbfwqno_t:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 19:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249931

--------------BEHn3lu0VAv6iVs4UkfuMS9A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AAIqBHK1086019

Hi Jose,

Add Ajay, explained below.

On 2026-11-04 05:22, Jose Quaresma wrote:
> Hi Randy,
>
> On Tue, Nov 3, 2026 at 10:04=E2=80=AFPM Randy MacLeod=20
> <randy.macleod@windriver.com> wrote:
>
>     Jose,
>
>     Thanks for the fix. When people were discussing it on the YP patch
>     review call today,
>     the question arose: Why didn't the YP autobuilder catch this error
>     and are there more
>     inline assembly issues that we are not testing and catching at
>     build time ?
>
>
> Taking a quick look at the layer, I observe that this tool is not a=20
> dependency of any other
> package, nor is it included in any image.
>
> However, it should be included in the bitbake world building.
> I don't know if it will be excluded due to some setting.


Yeah, that's a bit odd.


>
>     Can you look into that or explain why it's not worth doing so?
>
>
> I would very much like to be able to help with this part, but my=20
> knowledge regarding
> autobuilder is very limited.
Understood.

Ajay and I are hoping to make use of, and ideally add to, the YP AB=20
tests so
we will try to consider that as we ramp up that work over the coming mont=
hs.

Thanks again,

../Randy


>
> Jose
>
>
>     Thanks,
>     ../Randy
>
>
>     On 2026-10-29 05:37, Jose Quaresma via lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!Y1KNjcfrqKOJg8dyHnKeTia9K_6kTfsfJHGUrnLTN_4W2ErtNcU508mS5-JSMPP44=
e1V4Zh_TjJwpW94TwU0Ph7_avOUN81Tmt0$>
>     wrote:
>>     From: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>
>>     The "pause" assembly mnemonic is only available on IA-32 platforms=
,
>>     breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
>>     assembly with the preprocessor checks, making sure that other plat=
forms
>>     don't see the invalid assembly.
>>
>>     FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
>>     Assembler messages:
>>     {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>>
>>     Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>     Signed-off-by: Jose Quaresma<jose.quaresma@oss.qualcomm.com>
>>     ---
>>
>>     v5: Move Upstream-Status to the carried patch
>>
>>       ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++=
++++++
>>       .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
>>       2 files changed, 38 insertions(+)
>>       create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-t=
ools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
>>
>>     diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/000=
1-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recip=
es-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnem=
onic-only-on-x86-x86_64-.patch
>>     new file mode 100644
>>     index 0000000000..38582bf1d4
>>     --- /dev/null
>>     +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-a=
mdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
>>     @@ -0,0 +1,37 @@
>>     +From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00=
 2001
>>     +From: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>     +Date: Fri, 26 Jun 2026 22:34:06 +0300
>>     +Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / =
x86_64
>>     + platforms
>>     +
>>     +The "pause" assembly mnemonic is only available on IA-32 platform=
s,
>>     +breaking e.g. debug IGT builds on ARM / AArch64. Guard this inlin=
e
>>     +assembly with the preprocessor checks, making sure that other pla=
tforms
>>     +don't see the invalid assembly.
>>     +
>>     +FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
>>     +Assembler messages:
>>     +{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>>     +
>>     +Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt=
-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc]
>>     +
>>     +Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com=
>
>>     +---
>>     + tests/amdgpu/amd_basic.c | 2 ++
>>     + 1 file changed, 2 insertions(+)
>>     +
>>     +diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>>     +index 3ad023472136..e5475f337549 100644
>>     +--- a/tests/amdgpu/amd_basic.c
>>     ++++ b/tests/amdgpu/amd_basic.c
>>     +@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_=
t *ptr, uint64_t expected,
>>     + 		/* Sleep if interval specified, otherwise tight loop */
>>     + 		if (check_interval_ns > 0)
>>     + 			nanosleep(&sleep_time, NULL);
>>     ++#if defined(x86_64) || defined(i386)
>>     + 		else
>>     + 			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for s=
pin-wait */
>>     ++#endif
>>     + 	}
>>     + }
>>     +
>>     diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6=
.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
>>     index d76c2355a1..a46b002b83 100644
>>     --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
>>     +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
>>     @@ -12,6 +12,7 @@ inherit meson pkgconfig
>>       SRCREV =3D "916c79cfb7675ca01607dcd821f8c49d4f633a6f"
>>      =20
>>       SRC_URI =3D "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;=
protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV} \
>>     +file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.=
patch \
>>                  "
>>      =20
>>       DEPENDS +=3D "libdrm libpciaccess cairo udev glib-2.0 procps lib=
unwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansso=
n"
>>
>>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>     Links: You receive all messages sent to this group.
>>     View/Reply Online (#248920):https://lists.openembedded.org/g/opene=
mbedded-core/message/248920
>>     Mute This Topic:https://lists.openembedded.org/mt/121991366/361676=
5
>>     Group Owner:openembedded-core+owner@lists.openembedded.org
>>     Unsubscribe:https://lists.openembedded.org/g/openembedded-core/uns=
ub [randy.macleod@windriver.com]
>>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>     --=20
>     # Randy MacLeod
>     # Wind River Linux
>

--=20
# Randy MacLeod
# Wind River Linux

--------------BEHn3lu0VAv6iVs4UkfuMS9A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AAIqBHK1086019

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">
      <p>Hi Jose,</p>
      <p>Add Ajay, explained below.</p>
    </div>
    <div class=3D"moz-cite-prefix">On 2026-11-04 05:22, Jose Quaresma
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZ=
D-mZrQ4B5G_4Sfxcvxow@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div><span style=3D"background-color:transparent">Hi&nbsp;</span>=
<span style=3D"background-color:transparent">Randy,</span></div>
        <div><span style=3D"background-color:transparent"><br>
          </span></div>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, 2026 at
            10:04=E2=80=AFPM Randy MacLeod &lt;<a href=3D"mailto:randy.ma=
cleod@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">randy.macleod@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Jose,<br>
              </div>
              <div><br>
              </div>
              <div>Thanks for the fix. When people were discussing it on
                the YP patch review call today,&nbsp;</div>
              <div>the question arose: Why didn't the YP autobuilder
                catch this error and are there more<br>
                inline assembly issues that we are not testing and
                catching at build time ?<br>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div><span style=3D"background-color:transparent">Taking a quic=
k
              look at the layer, I observe&nbsp;</span><span style=3D"bac=
kground-color:transparent">that this tool is not
              a dependency of any other</span></div>
          <div><span style=3D"background-color:transparent">package</span=
><span style=3D"background-color:transparent">, nor is it included
              in any image.</span></div>
          <div><br>
          </div>
          <div>However, it should be included in the bitbake world
            building.</div>
          <div>I don't know if it will be excluded due to some setting.</=
div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Yeah, that's a bit odd.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZ=
D-mZrQ4B5G_4Sfxcvxow@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div> <br>
                Can you look into that or explain why it's not worth
                doing so?<br>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>I would very much like to be able to help with this part,
            but my knowledge regarding</div>
          <div>autobuilder is very limited.</div>
        </div>
      </div>
    </blockquote>
    Understood.<br>
    <br>
    Ajay and I are hoping to make use of, and ideally add to, the YP AB
    tests so&nbsp;<br>
    we will try to consider that as we ramp up that work over the coming
    months.<br>
    <br>
    Thanks again,
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADWMC-bB9oEOe_KdGxQj-pzXrx5_iZ=
D-mZrQ4B5G_4Sfxcvxow@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>Jose<br>
            <br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div> <br>
                Thanks,</div>
              <div>../Randy</div>
              <div><br>
              </div>
              <div><br>
              </div>
              <div>On 2026-10-29 05:37, Jose Quaresma via <a href=3D"http=
s://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!Y1K=
NjcfrqKOJg8dyHnKeTia9K_6kTfsfJHGUrnLTN_4W2ErtNcU508mS5-JSMPP44e1V4Zh_TjJw=
pW94TwU0Ph7_avOUN81Tmt0$" target=3D"_blank" moz-do-not-send=3D"true">list=
s.openembedded.org</a>
                wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <pre>From: Dmitry Baryshkov <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.barysh=
kov@oss.qualcomm.com&gt;</a>

The &quot;pause&quot; assembly mnemonic is only available on IA-32 platfo=
rms,
breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
assembly with the preprocessor checks, making sure that other platforms
don't see the invalid assembly.

FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Signed-off-by: Dmitry Baryshkov <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualc=
omm.com&gt;</a>
Signed-off-by: Jose Quaresma <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jose.quaresma@oss.qualcomm.com">&lt;jose.quaresma@oss.qualcomm.com&=
gt;</a>
---

v5: Move Upstream-Status to the carried patch

 ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/000=
1-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-a=
mdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-grap=
hics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-on=
ly-on-x86-x86_64-.patch
new file mode 100644
index 0000000000..38582bf1d4
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-i=
nsert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,37 @@
+From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com=
&gt;</a>
+Date: Fri, 26 Jun 2026 22:34:06 +0300
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
+ platforms
+
+The &quot;pause&quot; assembly mnemonic is only available on IA-32 platf=
orms,
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
+assembly with the preprocessor checks, making sure that other platforms
+don't see the invalid assembly.
+
+FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
+Assembler messages:
+{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba=
7ee376ea1d8aabd2ff5afdc">https://gitlab.freedesktop.org/drm/igt-gpu-tools=
/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc</a>]
+
+Signed-off-by: Dmitry Baryshkov <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualc=
omm.com&gt;</a>
+---
+ tests/amdgpu/amd_basic.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
+index 3ad023472136..e5475f337549 100644
+--- a/tests/amdgpu/amd_basic.c
++++ b/tests/amdgpu/amd_basic.c
+@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr,=
 uint64_t expected,
+ 		/* Sleep if interval specified, otherwise tight loop */
+ 		if (check_interval_ns &gt; 0)
+ 			nanosleep(&amp;sleep_time, NULL);
++#if defined(x86_64) || defined(i386)
+ 		else
+ 			__asm__ __volatile__(&quot;pause&quot; ::: &quot;memory&quot;); /* C=
PU hint for spin-wait */
++#endif
+ 	}
+ }
+=20
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb b/m=
eta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
index d76c2355a1..a46b002b83 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
@@ -12,6 +12,7 @@ inherit meson pkgconfig
 SRCREV =3D &quot;916c79cfb7675ca01607dcd821f8c49d4f633a6f&quot;
=20
 SRC_URI =3D &quot;git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;pro=
tocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV} \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-lib-am=
dgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch">file://0001-lib-amd=
gpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch</a> \
            &quot;
=20
 DEPENDS +=3D &quot;libdrm libpciaccess cairo udev glib-2.0 procps libunw=
ind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson&q=
uot;
</pre>
                <br>
                <fieldset></fieldset>
                <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#248920): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/248920">https:/=
/lists.openembedded.org/g/openembedded-core/message/248920</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/121991366/3616765">https://lists.openembedded.org/mt=
/121991366/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
              </blockquote>
              <p><br>
              </p>
              <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------BEHn3lu0VAv6iVs4UkfuMS9A--
