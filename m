Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DA9E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 19:51:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.24051.1733341857458720763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 11:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20682b3ba7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4A00Z7029364
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 19:50:56 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp7567p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 19:50:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsJdQQXxV/F4L1Pv3e4wWdurAw+DI7s40HtEZVXtfi8h2lUiNNLH+dB019IKo+rHysRxfVKL5aHfovz6yDloTB/3RsvvrRFpYLv24ZBdRoZfwtgenD/vx7y6K8jJh86oc/AQEa9kiMMr7LpXysXOLffoCIcbkNtV8XOhHgdE2EuwzVV9q1yj9eNQu6GzdnYtoOtaRs6+gn+0ngKFUug97a0GLJBe02bzPddQyyPD80r7RxrEI/6U/bvxoPQQaI6Dt+ddufVGEf+/apjUugvQTmKZHczjx6bXfpNAtqLWOdGAs4fTq/10OE5S/S1Jnt9tlXT9JzpIkLRL2inXkVcoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4JoYbqSJrNqCtUHXgzubVE0c07XhGt6Zi5p1O6NTXE=;
 b=NwfxawoDREKv1UPcMKFSLVlHXxReMHgtrGiQW1AxkkdmVHeoj4KaSYQhNvZNxNO8oYYSFYrIozyrq2O9SgxvS8PMWet+o7ZWO0+uvvin6O0KI/vZlUKLtxnUp98G1g9JS5Yst6j5191dz3D82Ysfz9ZodYYJj77+SmMtGGIxLSgfuWkkoHipNs+qdnvcKZCsVtzaYLkXqhy8Gd5G85wP5pjtvsJYt4vbsWZwnw8UrrsTbAmLq1+eVAJdTxAU/rvCq4YJLaxTP6Ui944gxM63SnL7eziDuQBi7k3nIdkkyAM1iZb+7N6+hTBi47HwBTZBXj5g69MM6elYbiK5wo7xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 19:50:46 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 19:50:46 +0000
Content-Type: multipart/alternative;
 boundary="------------XO0xpFsE8v2WRDQOUaky37Un"
Message-ID: <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com>
Date: Wed, 4 Dec 2024 14:50:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 ->
 3.3.5"
To: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org,
        "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <20241203101426.2227535-1-yogita.urade@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20241203101426.2227535-1-yogita.urade@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA0PR11MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e37b980-90eb-476b-436b-08dd149cf1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vk1za2FNbTZycE1INHYwVGNSRjdEbktJMHdmUkhkb1UrU3VBNEJ2L2ZFdUp6?=
 =?utf-8?B?TzN3ekZpTTRCbE5YS1JoMmlWRTNMZll3ZkZrblNsOUxINVpHR0xFNDRZTUd3?=
 =?utf-8?B?UXMwUFZTWmtzVnExWmN5cjlCRDBhemYwRHl1dE52VmJiTzZkT3BkemkrL05Y?=
 =?utf-8?B?YytVdTVtbXhiZVBmcDJBZ2VGMkdYUGo5c1NoQlZ2bHJpc1VLZm9nWEJvSnRP?=
 =?utf-8?B?SVQ3emV1UWdhM0VxeG1xbVRwdlAzUUVCY3hObDZKZHA3VlRxQjNJbiswMll4?=
 =?utf-8?B?NlhmK29sNTBtbUxXaWVXRlA0NGFVN1NOZG92cnpOWEtYMFVZTXNJWDl0Umdk?=
 =?utf-8?B?UGlzU3AyRWpuVmRJdEpqRGxnYXQzNEE5VkJYWXFrQ0JlWnZhL0JUQ0UvYXBn?=
 =?utf-8?B?OTU1UGZoU3pHTkpEYXBQc21NUXRMZTh6Qnd6T3N5TENrd3JQM1FYQStKTm42?=
 =?utf-8?B?eFoyQ0NBdEo3TFRtc25mZ0pGcEhUeis1eHBYL1Y3djZSSUgzcm9oMnlTVFNH?=
 =?utf-8?B?Vmw5dUlRZjVDdXlsSzRmcFRTL1YzODJabFk5ckJ6WTlIWVg4bFdkRWNzcFRl?=
 =?utf-8?B?eVNtSGU2SURUTml2M3JNcFBTamdQUHMrTG1FNDVHcmkwSDMrZGNjbkRyd1dG?=
 =?utf-8?B?N2lzK0h1M0Q4Z2NmcnRpWjdvNXZFRWtzaG9Fc3dYaWwyVUZXZ1Exc2lFbFVo?=
 =?utf-8?B?SFVTbzAxNmZtOEJmRjY0aHNaZ3dZWFYydTYyUlJEeWY2ZlVDNC8vcFBKaTJS?=
 =?utf-8?B?VTd6Qk1IZ3RWNU15RitWS09YODhrVXo5N1RPM2Y5NXRrcUNpdzdMMnVXTzd5?=
 =?utf-8?B?NXFMMS8vR1NTQWhkVU01ak53R2d3VkJLbXB2Q2FuRm04TXphUitnU1pJS2J6?=
 =?utf-8?B?bmRLUVZrTXl3Qk5aWXd1eTE1U09qeXppTjFBQVFXQXlxc21hQ3NRWDYrTTl3?=
 =?utf-8?B?M2xMd0FYTkVHalg2ZnQ0NkJDYlNJQVp3QjZGTFcrejBDU1ZGSmJKTm5nRjJS?=
 =?utf-8?B?Y3BYcFhCT3ZkQUJJZHNyZXlLZFQ1NVdkbU5BMTN2b3dDSmtMYUQyLyttd2xw?=
 =?utf-8?B?eXNGLzltelFkNTliazZUTTlrVCtDZjlWemc2TUZHejBoYmtUUmRZNE01SGtx?=
 =?utf-8?B?QXg2MTRHbmx2ZWF5b0FwRWpKVGRPMWN5UnFTUjhjL2pJN2cxNjNVODZQK3h1?=
 =?utf-8?B?bVExV0hNNFhlalB4bzluQXJOMjRTZG9zSlNtUW00UmttN2ovb2NBdm1sK1NE?=
 =?utf-8?B?OGNidXpKdmd4cE9IUjIrZmJFLzFmM2h5UUlHWUhFUkpmMUQ0bkJVN0EwM2U1?=
 =?utf-8?B?WFIrYm1HSmRrOENVUThad0pmUWlrbk44M29qNXNrdWFweGZveGJ2ZmV2TUVu?=
 =?utf-8?B?Uk4rZWZIL1gydThlWmdoVy9pZ0VhK091dTd1dWNmM0ZtOEN4TVpUNjlFL1Vj?=
 =?utf-8?B?TDZoK0R0dFlHclhQL1A2RVgwZ1oxT0NaV0ovdDBSNXdBOHBzZk5yd3BueEhn?=
 =?utf-8?B?bXVWVmJxOFl1TXQxb3FHdURpNjhyTmZUd2xYVUpodnU1Z2RrdXozNWVia0Fz?=
 =?utf-8?B?YW5FelNGUWpkQmd1eDRmU0tnYXBsMlkrTHpITFdmUStPRVk5MUhndG00VURr?=
 =?utf-8?B?RjZjTDZTcFdCOW5uc0QyeklrM2g3all5eklYNkV4aEVWQm5Gdy9DK1lNaFpG?=
 =?utf-8?B?K0Z1dzNnV1cyTEZkTzNQVnNMNDRaZlRtTWpycGhadjdGQ1YrNWhUaFJMRjNF?=
 =?utf-8?Q?65Fkv8rcuj5XK/8TNk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?algrT04vd3JsY2diSDNqeXBTaGF0eUQvQWVBd29sU1Nob2Q3YmZtZDFnTTRB?=
 =?utf-8?B?NUZQSDBxZU5UMXpmVm9jUnBYQ0o2V3huaUJLWmZnZm5ycVI4TzI2ZFRXdko3?=
 =?utf-8?B?OWJsNlAvN09vOEhFZ2ltMEcvN216Z213N1JzcHFzb3VQRE1Hbm93K0RVaHRp?=
 =?utf-8?B?b1U2aW5jQk9qUmZlR3ByZ3VoOTFDTmozNE82NFFtMlFRcHhBYTdCUmZYKzJx?=
 =?utf-8?B?VkNtMEF1SzFVTitHWFNaNE04YzBvTEZsOElnZlZnSTFYQWZPeXczeGZRVjZq?=
 =?utf-8?B?cVBOVVZHL0VxOXZBaWt0aUJnVmZrelFsMU9EQzlLZFRIZ1Q5cWs2OXF6bi9u?=
 =?utf-8?B?bWt4T3hnVzFlRGluVmZjS3dDNlJSY3V0cFBYcGZaMFJqOHJ1RG43RXhrQytq?=
 =?utf-8?B?TExkd3pCMTFFRzNzTTBYSjJqalYxZlpNNjNwcFF1ZktvREFRREpodnowcHNL?=
 =?utf-8?B?T3VyQ2xDQU8veUMrMEpMcUN2MWx3SEYyaHFQWCtRaVMyeFE5TVRVLy9pRENh?=
 =?utf-8?B?eitNOC9vUTlqWUk1SzFmdGNud1RlbVdJR3pHQ2gwRHJLQ3NpZFhLN1dBTzlp?=
 =?utf-8?B?TlJlaGNpUHJ1OTVoSys1WDFiM1V6ZFV6bHpKbFFqOW10a3RlU1U2Mmd6QjZm?=
 =?utf-8?B?Nm55UGZuQ1o2cVZrZ1BoNVcwZUkyb1pkS00rTmdGMXEvS1BXWnVDbU5rM2JT?=
 =?utf-8?B?aGpNTk1meUI2Zm43enlwYjZ6SDY4cGhYVEV2NUp0UFVmK25jNVZ1bE53dVpO?=
 =?utf-8?B?SzJ0K2cra3diYVFhL0dLb1BRMHlaRm5oZ241ZzVUcFpSTG9aU3J4cEx2UGxh?=
 =?utf-8?B?aGdUWjdndndQd2NaUE5tZXZFMmozcVF2WWhNa2RKNWZjdG5HUStKQmhYNzUx?=
 =?utf-8?B?TlJVUjNvTi84N1A1ZnphTnlhL3hjTU80WHdsNGs0YTRFY2ZRWVhUdCtZSUda?=
 =?utf-8?B?Y1A1Z0NWQzVqQ0lKS1NVaW9yR0xMenpLd2FuTkR2ZnNvSzI3MTh4MmhMdzVG?=
 =?utf-8?B?YkxmaU5Ha1FTdHVzTXVDRG1OdEhnUGlLKzF1MkVRZGlOOXRUZFZlbkgzK1No?=
 =?utf-8?B?VSsvK0lmRm9Kc2Q3dWRiV0w2emZlT0JvQUVWdm9DZG94UFpONFVDbGdLdmtU?=
 =?utf-8?B?SlVHY213NHkycVFBS0txVFg4NllTM0dCVnc3OXp2Q2VYVW5ick1yYmpjMDU2?=
 =?utf-8?B?UG5XWjRWZ1pSQTlUQS9WY293MmIwcTVIVU5OM3IzdXBBN2l0N2tZNitsRGVN?=
 =?utf-8?B?aEwzcnVnTFVGTEM5b3M0UUFkcHhBUGtOMytPUGNXOTM1OWVGUVllOVc2K0Nv?=
 =?utf-8?B?bzM4YnNrWVNjQ3BDcS93U1N0TDg4N3dMUzdXVGtMM2F4V0p3QWpuazdtVE1a?=
 =?utf-8?B?cTFPSXM5OW9JZHNJUFFDV21tSVNEa2RVSit5YjNYNkNTYmg5UzZRMlhyVDIr?=
 =?utf-8?B?Z2VXZ1ZYSURCQnphUXo0YTkyeW81VUIzZUFyTEVmZjh2ZDFSVDBMM0R2K3g5?=
 =?utf-8?B?OUREckhLek1NMTF2TDVveUlla1h6ZHZJVHZIMDUvM05LTnc0Yk1CVzlnM2Vx?=
 =?utf-8?B?TUVQK251SUd1UGJ1NmdkcGJFN3ByemhsdGE3c29KZE9hY1VWTXZLWE9iaDFV?=
 =?utf-8?B?WGN1WHlnYWxlT1RJN2FOdXY3YnBHRWxBT25PbGxhYXc5R29hOXpoWHIya1U3?=
 =?utf-8?B?M2pyMFljRkpNYm82MFpTN0R0eXJaeFFhMHMxV0pHMlhXb0hHOWkyUlZIeFFX?=
 =?utf-8?B?aE9QNUtTRjdmV3JKY3NGcVh3MGVwODBmSlgxZTFSL3JBYi84MnR1NnV4ODNW?=
 =?utf-8?B?WFI2UEFsRkF0RXRsNVJ0QWdNTWNmeDRMVVBtT0ZoR3JjY2dLQzFxV3k1L3NS?=
 =?utf-8?B?WXlCdHg2QXQyem16bU53bkFZS21aNWwzMTBHOW1HSHlsY05scHZVY0ZlbUVX?=
 =?utf-8?B?aWtVY1oxZjZ0eEw0T2ROWWkvcllQYjlWS3g3U2REZDN2UXQyY0VvWnRRbWZr?=
 =?utf-8?B?Mmt4Z21OcE1CUmQ5YU9NcVZma3FpNTFOVUVYaDl6T2tSSTZtTnNzQ0U5YTdp?=
 =?utf-8?B?bnpDOUlWbklXOWxLQ1NxT0pGMzFSbm5rS3pPTkNTNHdCNnp0bFJpWDMrNk5H?=
 =?utf-8?B?cnFIcUErc2tYZHN1N1kwVGpseE5xN2dpUmFzbnNxa2tTZ0ZwaG5DZDhhcUxS?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e37b980-90eb-476b-436b-08dd149cf1cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 19:50:46.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdS3QxoUHskTG9GkXCW+GD9gZf9BO+NyVU/SYVuctPvlC/cbHf8benr66H8lmptxh3Rw6I2QeFgdca4KMtgrIK1Ol8ZWb88NbL03yqIN0fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
X-Authority-Analysis: v=2.4 cv=Qvqk3Uyd c=1 sm=1 tr=0 ts=6750b2a0 cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=w2PP7KgtAAAA:8
 a=b4LDLZbEAAAA:8 a=Twlkf-z8AAAA:8 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=-fKjk79AAAAA:8 a=A1X0JdhQAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=9Wbp7B8dAAAA:8 a=svO6gwnVAAAA:8 a=v12xRLZ1AAAA:8 a=fk1lIlRQAAAA:8 a=MlhercUbnwpeiKP18GMA:9
 a=5JiWv8sOlejQMi-5:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=g_-jsAev3ssA:10 a=cd34Doh_AAAA:8 a=cETuxoCwAAAA:8 a=u0xS5zAO0qTWHkaT18kA:9 a=iDtnprDos4hehLVp:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=CDB6uwv3NW-08_pL9N3q:22
 a=20T61YgZp4ItGotXEy2O:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=yfRUlTaMxgxjPDvNZr5O:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=BESxJfN36ujmTJQqZ0Zq:22 a=5awQwY9Y38-QVGG67zo_:22 a=AgWhkyGJzIdW_ONjbm8h:22 a=U75ogvRika4pmaD_UPO0:22
 a=DGTqSDpDppWLBvRNt63D:22 a=tb6VMGFFq-HsUJGUQiVL:22
X-Proofpoint-ORIG-GUID: yR4VrVrAmsmilndp3QNwzfzNx-RDtsCF
X-Proofpoint-GUID: yR4VrVrAmsmilndp3QNwzfzNx-RDtsCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_16,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412040152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 19:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208324

--------------XO0xpFsE8v2WRDQOUaky37Un
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B4A00Z7029364

Add Robert and Hongxu who working with Yogita on this, iirc.

On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade<yogita.urade@windriver.com>
>
> This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.
>
> This isn't a minor version upgrade.
> $git log v3_2_2..v3_3_5 --oneline  | wc -l
> 6924

Do we have any ruby experts to comment on the stability of the 4.2 branch
and the update to 3.2.5?

They claim to be following a semantic versioning scheme:
https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-changes-=
with-2-1-0/


Ruby is a fairly large code base:
-------------------------------------------------------------------------=
-------
 =C2=A0Language=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Lines=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Blank Comment=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Code
-------------------------------------------------------------------------=
-------
 =C2=A0Ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7914=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1480730=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 202190 82299=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1196241
...
-------------------------------------------------------------------------=
-------
 =C2=A0Total=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9409=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2188=
531=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 271762 197233=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1719536
-------------------------------------------------------------------------=
-------

The git repo does have a branch for each release which would indicate
that they are at least familiar with the idea of stable releases.

Other than the number of commits being large, do we have
any data to support the idea that this is not a stable release update?

Yogita,
 =C2=A0 What are the before, after and diff ptest results?

../Randy



>
> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> ---
>   ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
>   ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
>   ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
>   ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
>   ...eproducible-change-fixing-784225-too.patch | 26 ++---
>   .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
>   .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
>   .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
>   .../ruby/ruby/CVE-2024-27281.patch            | 96 ++++++++++++++++++=
+
>   .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
>   .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
>   .../ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}     | 13 ++-
>   12 files changed, 446 insertions(+), 25 deletions(-)
>   create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C1=
1-_Alignof-to-define-ALIGN_OF-when-poss.patch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Make=
file.in-do-not-write-host-cross-cc-item.patch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-=
for-the-link-of-libruby.patch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Make=
file.in-filter-out-f-prefix-map.patch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.p=
atch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.p=
atch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.pat=
ch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.pat=
ch
>   create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include=
_macros.patch
>   rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb} =
(88%)
>
> diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Align=
of-to-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0=
001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
> new file mode 100644
> index 0000000000..ab7ae1eb23
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-d=
efine-ALIGN_OF-when-poss.patch
> @@ -0,0 +1,51 @@
> +From 6b3c202b46b9312c5bb0789145f13d8086e70948 Mon Sep 17 00:00:00 2001
> +From: Khem Raj<raj.khem@gmail.com>
> +Date: Sun, 15 Jan 2023 02:34:17 -0800
> +Subject: [PATCH] fiddle: Use C11 _Alignof to define ALIGN_OF when poss=
ible
> +
> +WG14 N2350 made very clear that it is an UB having type definitions
> +within "offsetof" [1]. This patch enhances the implementation of macro
> +ALIGN_OF to use builtin "_Alignof" to avoid undefined behavior
> +when using std=3Dc11 or newer
> +
> +clang 16+ has started to flag this [2]
> +
> +Fixes build when using -std >=3D gnu11 and using clang16+
> +
> +Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though =
it
> +may support C11, exclude those compiler versions
> +
> +[1]https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
> +[2]https://reviews.llvm.org/D133574
> +
> +Upstream-Status: Submitted [https://github.com/ruby/fiddle/pull/120]
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +---
> + ext/fiddle/fiddle.h | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/ext/fiddle/fiddle.h b/ext/fiddle/fiddle.h
> +index 10eb9ce..ffb395e 100644
> +--- a/ext/fiddle/fiddle.h
> ++++ b/ext/fiddle/fiddle.h
> +@@ -196,7 +196,17 @@
> + #endif
> + #define TYPE_UINTPTR_T (-TYPE_INTPTR_T)
> +
> +-#define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;},=
 align_x)
> ++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52=
023
> ++<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D52023>.
> ++   clang versions < 8.0.0 have the same bug.  */
> ++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
> ++     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
> ++         && !defined __clang__) \
> ++     || (defined __clang__ && __clang_major__ < 8))
> ++# define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}=
, align_x)
> ++#else
> ++# define ALIGN_OF(type) _Alignof(type)
> ++#endif
> +
> + #define ALIGN_VOIDP  ALIGN_OF(void*)
> + #define ALIGN_CHAR   ALIGN_OF(char)
> +--
> +2.39.0
> diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-=
do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0=
001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
> new file mode 100644
> index 0000000000..e35a461f76
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-=
write-host-cross-cc-item.patch
> @@ -0,0 +1,32 @@
> +From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin<alex.kanavin@gmail.com>
> +Date: Tue, 17 Nov 2020 18:31:40 +0000
> +Subject: [PATCH] template/Makefile.in: do not write host cross-cc item=
s into
> + target config
> +
> +This helps reproducibility.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin<alex.kanavin@gmail.com>
> +---
> + template/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/template/Makefile.in b/template/Makefile.in
> +index 10dc826..940ee07 100644
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -657,11 +657,11 @@ mjit_config.h:
> +	echo '#endif'; \
> +	quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
> +	sep=3D,; \
> +-	quote "MJIT_CC_COMMON  " $(MJIT_CC); \
> ++	quote "MJIT_CC_COMMON  " ; \
> +	quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
> +	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> +	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> +-	quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
> ++	quote "MJIT_LDSHARED   " ; \
> +	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> +	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> +	quote 'PRELOADENV       "@PRELOADENV@"'; \
> diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-=
link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS=
-for-the-link-of-libruby.patch
> new file mode 100644
> index 0000000000..96ae86263b
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of=
-libruby.patch
> @@ -0,0 +1,25 @@
> +From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
> +From: Christopher Larson<chris_larson@mentor.com>
> +Date: Thu, 5 May 2016 10:59:07 -0700
> +Subject: [PATCH] Obey LDFLAGS for the link of libruby
> +
> +Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> +Upstream-Status: Pending
> +
> +---
> + template/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/template/Makefile.in b/template/Makefile.in
> +index 1456313..15b98a4 100644
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -127,7 +127,7 @@ ENABLE_SHARED =3D @ENABLE_SHARED@
> + LDSHARED =3D @LIBRUBY_LDSHARED@
> + DLDSHARED =3D @DLDSHARED@
> + XDLDFLAGS =3D @DLDFLAGS@
> +-DLDFLAGS =3D @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
> ++DLDFLAGS =3D @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
> + SOLIBS =3D @SOLIBS@
> + ENABLE_DEBUG_ENV =3D @ENABLE_DEBUG_ENV@
> + MAINLIBS =3D $(YJIT_LIBS) @MAINLIBS@
> diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-=
filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-temp=
late-Makefile.in-filter-out-f-prefix-map.patch
> new file mode 100644
> index 0000000000..b0d9a2e0ed
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-=
out-f-prefix-map.patch
> @@ -0,0 +1,42 @@
> +Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
> +
> +If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no long=
er
> +reproducible.  Fix this.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Tony Battersby<tonyb@cybernetics.com>
> +---
> +--- a/tool/mjit_archflag.sh
> ++++ b/tool/mjit_archflag.sh
> +@@ -7,6 +7,20 @@ quote() {
> +     echo
> + }
> +
> ++quote_filtered() {
> ++    printf "#${indent}define $1"
> ++    while shift && [ "$#" -gt 0 ]; do
> ++	case "$1" in
> ++	    -ffile-prefix-map=3D*|-fdebug-prefix-map=3D*|-fmacro-prefix-map=3D=
*)
> ++		;;
> ++	    *)
> ++		printf ' "%s"'$sep "$1"
> ++		;;
> ++	esac
> ++    done
> ++    echo
> ++}
> ++
> + archs=3D""
> + arch_flag=3D""
> +
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -666,7 +666,7 @@ mjit_config.h:
> +	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> +	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> +	quote "MJIT_LDSHARED   " ; \
> +-	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> ++	quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> +	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> +	quote 'PRELOADENV       "@PRELOADENV@"'; \
> +	indent=3D$${archs:+'  '}; \
> diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproduc=
ible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/000=
5-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> index 0902a201ec..41f206523e 100644
> --- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-ch=
ange-fixing-784225-too.patch
> +++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-ch=
ange-fixing-784225-too.patch
> @@ -12,20 +12,20 @@ Upstream-Status: Backport [debian]
>    1 file changed, 3 insertions(+), 1 deletion(-)
>  =20
>   diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specificati=
on.rb
> -index d6eac7f..4b2e95e 100644
> +index 0d72cee..eb7bc25 100644
>   --- a/lib/rubygems/specification.rb
>   +++ b/lib/rubygems/specification.rb
> -@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecificati=
on
> -                 raise(Gem::InvalidSpecificationException,
> -                       "invalid date format in specification: #{date.i=
nspect}")
> -               end
> --            when Time, DateLike then
> -+            when Time then
> -+              Time.utc(date.utc.year, date.utc.month, date.utc.day)
> -+            when DateLike then
> -               Time.utc(date.year, date.month, date.day)
> -             else
> -               TODAY
> +@@ -1691,7 +1691,9 @@ class Gem::Specification < Gem::BasicSpecificati=
on
> +         raise(Gem::InvalidSpecificationException,
> +               "invalid date format in specification: #{date.inspect}"=
)
> +       end
> +-    when Time, DateLike then
> ++    when Time then
> ++      Time.utc(date.utc.year, date.utc.month, date.utc.day)
> ++    when DateLike then
> +       Time.utc(date.year, date.month, date.day)
> +     else
> +       TODAY
>   --
> -2.40.0
> +2.25.1
>  =20
> diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reprodu=
cible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproduc=
ible.patch
> index d32e209129..0a87cae17f 100644
> --- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.p=
atch
> +++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.p=
atch
> @@ -7,6 +7,7 @@ Without an explicit date, they will get the current dat=
e and make the
>   build unreproducible
>  =20
>   Upstream-Status: Backport [debian]
> +
>   ---
>    ext/bigdecimal/bigdecimal.gemspec | 1 +
>    ext/fiddle/fiddle.gemspec         | 1 +
> @@ -16,12 +17,12 @@ Upstream-Status: Backport [debian]
>    5 files changed, 5 insertions(+)
>  =20
>   diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigde=
cimal.gemspec
> -index f9f3b45..b9a469d 100644
> +index d215757..5148d56 100644
>   --- a/ext/bigdecimal/bigdecimal.gemspec
>   +++ b/ext/bigdecimal/bigdecimal.gemspec
> -@@ -14,6 +14,7 @@ Gem::Specification.new do |s|
> -   s.name          =3D name
> -   s.version       =3D source_version
> +@@ -4,6 +4,7 @@ Gem::Specification.new do |s|
> +   s.name          =3D "bigdecimal"
> +   s.version       =3D "3.1.3"
>      s.authors       =3D ["Kenta Murata", "Zachary Scott", "Shigeo Koba=
yashi"]
>   +  s.date          =3D RUBY_RELEASE_DATE
>      s.email         =3D ["mrkn@mrkn.jp"]
> @@ -40,10 +41,10 @@ index 8781093..efdca32 100644
>      spec.email         =3D ["aaron@tenderlovemaking.com","hsbt@ruby-la=
ng.org"]
>   =20
>   diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-co=
nsole.gemspec
> -index d4f5276..8f89611 100644
> +index d26a757..cc88c55 100644
>   --- a/ext/io/console/io-console.gemspec
>   +++ b/ext/io/console/io-console.gemspec
> -@@ -4,6 +4,7 @@ _VERSION =3D "0.7.1"
> +@@ -4,6 +4,7 @@ _VERSION =3D "0.6.0"
>    Gem::Specification.new do |s|
>      s.name =3D "io-console"
>      s.version =3D _VERSION
> @@ -64,7 +65,7 @@ index 1f4798e..48743cf 100644
>      spec.email         =3D ["knu@idaemons.org","ume@mahoroba.org"]
>   =20
>   diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
> -index 93a281c..cc5c155 100644
> +index 3c96f7d..fec0872 100644
>   --- a/lib/rdoc/rdoc.gemspec
>   +++ b/lib/rdoc/rdoc.gemspec
>   @@ -7,6 +7,7 @@ end
> @@ -75,6 +76,3 @@ index 93a281c..cc5c155 100644
>      s.version =3D RDoc::VERSION
>   =20
>      s.authors =3D [
> ---
> -2.40.0
> -
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/m=
eta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
> new file mode 100644
> index 0000000000..0b1eb23801
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
> @@ -0,0 +1,55 @@
> +From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada<nobu@ruby-lang.org>
> +Date: Thu, 27 Jul 2023 15:53:01 +0800
> +Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
> +
> +https://hackerone.com/reports/1958260
> +
> +CVE: CVE-2023-36617
> +
> +Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee25=
36adda10a0555ae1ed6fe2f5808e6bf1]
> +
> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> +---
> + lib/uri/rfc2396_parser.rb |  4 ++--
> + test/uri/test_parser.rb   | 12 ++++++++++++
> + 2 files changed, 14 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
> +index 76a8f99..00c66cf 100644
> +--- a/lib/uri/rfc2396_parser.rb
> ++++ b/lib/uri/rfc2396_parser.rb
> +@@ -497,8 +497,8 @@ module URI
> +       ret =3D {}
> +
> +       # for URI::split
> +-      ret[:ABS_URI] =3D Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\=
s*\z', Regexp::EXTENDED)
> +-      ret[:REL_URI] =3D Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\=
s*\z', Regexp::EXTENDED)
> ++      ret[:ABS_URI] =3D Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '=
\s*\z', Regexp::EXTENDED)
> ++      ret[:REL_URI] =3D Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '=
\s*\z', Regexp::EXTENDED)
> +
> +       # for URI::extract
> +       ret[:URI_REF]     =3D Regexp.new(pattern[:URI_REF])
> +diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
> +index 72fb590..721e05e 100644
> +--- a/test/uri/test_parser.rb
> ++++ b/test/uri/test_parser.rb
> +@@ -79,4 +79,16 @@ class URI::TestParser < Test::Unit::TestCase
> +     assert_equal([nil, nil, "example.com", nil, nil, "", nil, nil, ni=
l], URI.split("//example.com"))
> +     assert_equal([nil, nil, "[0::0]", nil, nil, "", nil, nil, nil], U=
RI.split("//[0::0]"))
> +   end
> ++
> ++  def test_rfc2822_parse_relative_uri
> ++    pre =3D ->(length) {
> ++      " " * length + "\0"
> ++    }
> ++    parser =3D URI::RFC2396_Parser.new
> ++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |u=
ri|
> ++      assert_raise(URI::InvalidURIError) do
> ++        parser.split(uri)
> ++      end
> ++    end
> ++  end
> + end
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/m=
eta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
> new file mode 100644
> index 0000000000..0ee295210e
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
> @@ -0,0 +1,51 @@
> +From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada<nobu@ruby-lang.org>
> +Date: Thu, 27 Jul 2023 16:16:30 +0800
> +Subject: [PATCH] Fix quadratic backtracking on invalid port number
> +
> +https://hackerone.com/reports/1958260
> +
> +CVE: CVE-2023-36617
> +
> +Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1=
e6ad23c9c6e4932f297fb737888144c8]
> +
> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> +---
> + lib/uri/rfc3986_parser.rb |  2 +-
> + test/uri/test_parser.rb   | 10 ++++++++++
> + 2 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
> +index dd24a40..9b1663d 100644
> +--- a/lib/uri/rfc3986_parser.rb
> ++++ b/lib/uri/rfc3986_parser.rb
> +@@ -100,7 +100,7 @@ module URI
> +         QUERY: /\A(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*\z/,
> +         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*\z/,
> +         OPAQUE: /\A(?:[^\/].*)?\z/,
> +-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
> ++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
> +       }
> +     end
> +
> +diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
> +index 721e05e..cee0acb 100644
> +--- a/test/uri/test_parser.rb
> ++++ b/test/uri/test_parser.rb
> +@@ -91,4 +91,14 @@ class URI::TestParser < Test::Unit::TestCase
> +       end
> +     end
> +   end
> ++
> ++  def test_rfc3986_port_check
> ++    pre =3D ->(length) {"\t" * length + "a"}
> ++    uri =3D URI.parse("http://my.example.com")
> ++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |p=
ort|
> ++      assert_raise(URI::InvalidComponentError) do
> ++        uri.port =3D port
> ++      end
> ++    end
> ++  end
> + end
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/met=
a/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
> new file mode 100644
> index 0000000000..ab8e3f7c4c
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
> @@ -0,0 +1,96 @@
> +From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada<nobu@...>
> +Date: Mon, 15 Apr 2024 11:40:00 +0000
> +Subject: [PATCH] Filter marshaled objets
> +
> +CVE: CVE-2024-27281
> +Upstream-Status: Backport [https://github.com/ruby/rdoc/commit/da7a0c7=
553ef7250ca665a3fecdc01dbaacbb43d]
> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
> +---
> + lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
> + 1 file changed, 26 insertions(+), 19 deletions(-)
> +
> +diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
> +index 9fc540d..5b663d7 100644
> +--- a/lib/rdoc/store.rb
> ++++ b/lib/rdoc/store.rb
> +@@ -556,9 +556,7 @@ class RDoc::Store
> +   def load_cache
> +     #orig_enc =3D @encoding
> +
> +-    File.open cache_path, 'rb' do |io|
> +-      @cache =3D Marshal.load io
> +-    end
> ++    @cache =3D marshal_load(cache_path)
> +
> +     load_enc =3D @cache[:encoding]
> +
> +@@ -615,9 +613,7 @@ class RDoc::Store
> +   def load_class_data klass_name
> +     file =3D class_file klass_name
> +
> +-    File.open file, 'rb' do |io|
> +-      Marshal.load io
> +-    end
> ++    marshal_load(file)
> +   rescue Errno::ENOENT =3D> e
> +     error =3D MissingFileError.new(self, file, klass_name)
> +     error.set_backtrace e.backtrace
> +@@ -630,14 +626,10 @@ class RDoc::Store
> +   def load_method klass_name, method_name
> +     file =3D method_file klass_name, method_name
> +
> +-    File.open file, 'rb' do |io|
> +-      obj =3D Marshal.load io
> +-      obj.store =3D self
> +-      obj.parent =3D
> +-        find_class_or_module(klass_name) || load_class(klass_name) un=
less
> +-          obj.parent
> +-      obj
> +-    end
> ++    obj =3D marshal_load(file)
> ++    obj.store =3D self
> ++    obj.parent ||=3D find_class_or_module(klass_name) || load_class(k=
lass_name)
> ++    obj
> +   rescue Errno::ENOENT =3D> e
> +     error =3D MissingFileError.new(self, file, klass_name + method_na=
me)
> +     error.set_backtrace e.backtrace
> +@@ -650,11 +642,9 @@ class RDoc::Store
> +   def load_page page_name
> +     file =3D page_file page_name
> +
> +-    File.open file, 'rb' do |io|
> +-      obj =3D Marshal.load io
> +-      obj.store =3D self
> +-      obj
> +-    end
> ++    obj =3D marshal_load(file)
> ++    obj.store =3D self
> ++    obj
> +   rescue Errno::ENOENT =3D> e
> +     error =3D MissingFileError.new(self, file, page_name)
> +     error.set_backtrace e.backtrace
> +@@ -976,4 +966,21 @@ class RDoc::Store
> +     @unique_modules
> +   end
> +
> ++  private
> ++  def marshal_load(file)
> ++    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
> ++  end
> ++
> ++  MarshalFilter =3D proc do |obj|
> ++    case obj
> ++    when true, false, nil, Array, Class, Encoding, Hash, Integer, Str=
ing, Symbol, RDoc::Text
> ++    else
> ++      unless obj.class.name.start_with("RDoc::")
> ++        raise TypeError, "not permitted class: #{obj.class.name}"
> ++      end
> ++    end
> ++    obj
> ++  end
> ++  private_constant :MarshalFilter
> ++
> + end
> +--
> +2.25.1
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/met=
a/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
> new file mode 100644
> index 0000000000..0740ad81e9
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
> @@ -0,0 +1,27 @@
> +From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
> +From: Hiroshi SHIBATA<hsbt@ruby-lang.org>
> +Date: Fri, 12 Apr 2024 15:01:47 +1000
> +Subject: [PATCH] Fix Use-After-Free issue for Regexp
> +
> +Co-authored-by: Isaac Peka<7493006+isaac-peka@users.noreply.github.com=
>
> +
> +Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a235=
5808a63fc45367785c82ffd46d18c900a]
> +CVE: CVE-2024-27282
> +Signed-off-by: Ashish Sharma<asharma@mvista.com>
> +
> + regexec.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/regexec.c b/regexec.c
> +index 73694ab14a0b0a..140691ad42489f 100644
> +--- a/regexec.c
> ++++ b/regexec.c
> +@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const U=
Char* end,
> +     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
> +       GET_MEMNUM_INC(mem, p);
> +       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-en=
d. */
> +-      STACK_PUSH_MEM_END(mem, s);
> +       mem_start_stk[mem] =3D GET_STACK_INDEX(stkp);
> ++      STACK_PUSH_MEM_END(mem, s);
> +       MOP_OUT;
> +       JUMP;
> diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.=
patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
> new file mode 100644
> index 0000000000..1808a6384a
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
> @@ -0,0 +1,35 @@
> +From e74b57febec9bd806e29025e6eeb8091e7021d75 Mon Sep 17 00:00:00 2001
> +From: Khem Raj<raj.khem@gmail.com>
> +Date: Sun, 26 Jan 2020 11:27:40 -0800
> +Subject: [PATCH] Filter out __has_include* compiler defines
> +
> +They are internal to compiler and this header is later on includes in =
C
> +files, but newer gcc >=3D 10 complains about it.
> +
> +error in initial header file:
> +| In file included from /tmp/20200124-86625-14hiju4.c:1:
> +| /tmp/20200124-86625-11y6l6i.h:13849:9: error: "__has_include" cannot=
 be used as a macro name
> +| 13849 | #define __has_include __has_include
> +|       |         ^~~~~~~~~~~~~
> +| compilation terminated due to -Wfatal-errors.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +---
> + common.mk | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/common.mk b/common.mk
> +index 664f750..3b8fbe6 100644
> +--- a/common.mk
> ++++ b/common.mk
> +@@ -238,6 +238,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=3D)$(MJIT_HEADER_=
SUFFIX).time: probes.h vm.$(OBJE
> +	$(ECHO) building $(@F:.time=3D.h)
> +	$(Q)$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
> +		$(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPP=
FLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=3D.h).new
> ++	$(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=3D=
.h).new
> ++	$(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@=
F:.time=3D.h).new
> +	$(Q) $(IFCHANGE) "--timestamp=3D$@" $(@F:.time=3D.h) $(@F:.time=3D.h)=
.new
> +
> + $(MJIT_HEADER:.h=3D)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_H=
EADER:.h=3D)$(MJIT_HEADER_SUFFIX).time
> diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-de=
vtools/ruby/ruby_3.2.2.bb
> similarity index 88%
> rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
> rename to meta/recipes-devtools/ruby/ruby_3.2.2.bb
> index fb0d711765..508154dad5 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
> @@ -10,7 +10,7 @@ LICENSE =3D "Ruby | BSD-2-Clause | BSD-3-Clause | GPL=
-2.0-only | ISC | MIT"
>   LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D5b8c87559868796979806100db3=
f3805 \=20
> file://BSDL;md5=3D8b50bc6de8f586dc66790ba11d064d75 \=20
> file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \ -=20
> file://LEGAL;md5=3D81e6a4d81533b9263da4c3485a0ad883 \ +=20
> file://LEGAL;md5=3Dbcd74b47bbaf2051c5e49811a5faa97a \ "
>  =20
>   DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
> @@ -20,12 +20,21 @@ DEPENDS:append:class-nativesdk =3D " ruby-native"
>   SHRT_VER =3D"${@oe.utils.trim_version("${PV}", 2)}"
>   SRC_URI =3D"http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV=
}.tar.gz \=20
> file://0001-extmk-fix-cross-compilation-of-external-gems.patch \ +=20
> file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \ +=20
> file://remove_has_include_macros.patch \ file://run-ptest \ +=20
> file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch=20
> \ + file://0002-template-Makefile.in-filter-out-f-prefix-map.patch \=20
> file://0003-rdoc-build-reproducible-documentation.patch \=20
> file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch=20
> \ file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch=20
> \ file://0006-Make-gemspecs-reproducible.patch \=20
> file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \=20
> +=20
> file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch=20
> \ + file://CVE-2023-36617_1.patch \ + file://CVE-2023-36617_2.patch \=20
> + file://CVE-2024-27281.patch \ + file://CVE-2024-27282.patch \ "
>   UPSTREAM_CHECK_URI =3D"https://www.ruby-lang.org/en/downloads/"
>  =20
> @@ -46,7 +55,7 @@ do_configure:prepend() {
>  =20
>   DEPENDS:append:libc-musl =3D " libucontext"
>  =20
> -SRC_URI[sha256sum] =3D "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a=
9ff8cf99ecbce75196"
> +SRC_URI[sha256sum] =3D "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37be=
fa0e8d94e7b8a423bc"
>  =20
>   PACKAGECONFIG ??=3D ""
>   PACKAGECONFIG +=3D"${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208185):https://lists.openembedded.org/g/openembedd=
ed-core/message/208185
> Mute This Topic:https://lists.openembedded.org/mt/109897713/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------XO0xpFsE8v2WRDQOUaky37Un
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Robert and Hongxu who working with
      Yogita on this, iirc.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-12-03 5:14 a.m., Urade, Yogita
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20241203101426.2227535-1-yogita.u=
rade@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Yogita Urade <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:yogita.urade@windriver.com">&lt;yogi=
ta.urade@windriver.com&gt;</a>

This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.

This isn't a minor version upgrade.
$git log v3_2_2..v3_3_5 --oneline  | wc -l
6924</pre>
    </blockquote>
    <p>Do we have any ruby experts to comment on the stability of the
      4.2 branch<br>
      and the update to 3.2.5?<br>
    </p>
    <p>They claim to be following a semantic versioning scheme:<br>
      &nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://www.ruby-lang.org/en/new=
s/2013/12/21/ruby-version-policy-changes-with-2-1-0/">https://www.ruby-lang=
.org/en/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/</a></p>
    <p><br>
    </p>
    <p>Ruby is a fairly large code base:<br>
---------------------------------------------------------------------------=
-----<br>
      &nbsp;Language&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Files&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lines&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blank&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      Comment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Code<br>
---------------------------------------------------------------------------=
-----<br>
      &nbsp;Ruby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7914&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 1480730&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 202190&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
      82299&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1196241<br>
      ...<br>
---------------------------------------------------------------------------=
-----<br>
      &nbsp;Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9409&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2=
188531&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 271762&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
      197233&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1719536<br>
---------------------------------------------------------------------------=
-----<br>
    </p>
    <p>The git repo does have a branch for each release which would
      indicate<br>
      that they are at least familiar with the idea of stable releases.<br>
      <br>
      Other than the number of commits being large, do we have <br>
      any data to support the idea that this is not a stable release
      update?<br>
    </p>
    <p>Yogita,<br>
      &nbsp; What are the before, after and diff ptest results?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20241203101426.2227535-1-yogita.u=
rade@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
 ...eproducible-change-fixing-784225-too.patch | 26 ++---
 .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
 .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
 .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++++
 .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
 .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
 .../ruby/{ruby_3.3.5.bb =3D&gt; ruby_3.2.2.bb}     | 13 ++-
 12 files changed, 446 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Al=
ignof-to-define-ALIGN_OF-when-poss.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.=
in-do-not-write-host-cross-cc-item.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-t=
he-link-of-libruby.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.=
in-filter-out-f-prefix-map.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macr=
os.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D&gt; ruby_3.2.2.bb} (8=
8%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-t=
o-define-ALIGN_OF-when-poss.patch b/meta/recipes-devtools/ruby/ruby/0001-fi=
ddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
new file mode 100644
index 0000000000..ab7ae1eb23
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-defin=
e-ALIGN_OF-when-poss.patch
@@ -0,0 +1,51 @@
+From 6b3c202b46b9312c5bb0789145f13d8086e70948 Mon Sep 17 00:00:00 2001
+From: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@=
gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Date: Sun, 15 Jan 2023 02:34:17 -0800
+Subject: [PATCH] fiddle: Use C11 _Alignof to define ALIGN_OF when possible
+
+WG14 N2350 made very clear that it is an UB having type definitions
+within &quot;offsetof&quot; [1]. This patch enhances the implementation of=
 macro
+ALIGN_OF to use builtin &quot;_Alignof&quot; to avoid undefined behavior
+when using std=3Dc11 or newer
+
+clang 16+ has started to flag this [2]
+
+Fixes build when using -std &gt;=3D gnu11 and using clang16+
+
+Older compilers gcc &lt; 4.9 or clang &lt; 8 has buggy _Alignof even thoug=
h it
+may support C11, exclude those compiler versions
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://www.open-std.org/jt=
c1/sc22/wg14/www/docs/n2350.htm">https://www.open-std.org/jtc1/sc22/wg14/ww=
w/docs/n2350.htm</a>
+[2] <a class=3D"moz-txt-link-freetext" href=3D"https://reviews.llvm.org/D1=
33574">https://reviews.llvm.org/D133574</a>
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://github.com/ruby/fiddle/pull/120">https://github.com/ruby/fiddle/pull/1=
20</a>]
+Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+---
+ ext/fiddle/fiddle.h | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/ext/fiddle/fiddle.h b/ext/fiddle/fiddle.h
+index 10eb9ce..ffb395e 100644
+--- a/ext/fiddle/fiddle.h
++++ b/ext/fiddle/fiddle.h
+@@ -196,7 +196,17 @@
+ #endif
+ #define TYPE_UINTPTR_T (-TYPE_INTPTR_T)
+
+-#define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, ali=
gn_x)
++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
++   <a class=3D"moz-txt-link-rfc2396E" href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D52023">&lt;https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D52023&gt;</a>.
++   clang versions &lt; 8.0.0 have the same bug.  */
++#if (!defined __STDC_VERSION__ || __STDC_VERSION__ &lt; 201112 \
++     || (defined __GNUC__ &amp;&amp; __GNUC__ &lt; 4 + (__GNUC_MINOR__ &l=
t; 9) \
++         &amp;&amp; !defined __clang__) \
++     || (defined __clang__ &amp;&amp; __clang_major__ &lt; 8))
++# define ALIGN_OF(type) offsetof(struct {char align_c; type align_x;}, al=
ign_x)
++#else
++# define ALIGN_OF(type) _Alignof(type)
++#endif
+
+ #define ALIGN_VOIDP  ALIGN_OF(void*)
+ #define ALIGN_CHAR   ALIGN_OF(char)
+--
+2.39.0
diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-n=
ot-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-te=
mplate-Makefile.in-do-not-write-host-cross-cc-item.patch
new file mode 100644
index 0000000000..e35a461f76
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-writ=
e-host-cross-cc-item.patch
@@ -0,0 +1,32 @@
+From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
+Date: Tue, 17 Nov 2020 18:31:40 +0000
+Subject: [PATCH] template/Makefile.in: do not write host cross-cc items in=
to
+ target config
+
+This helps reproducibility.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
+---
+ template/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 10dc826..940ee07 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -657,11 +657,11 @@ mjit_config.h:
+	echo '#endif'; \
+	quote MJIT_MIN_HEADER_NAME &quot;$(MJIT_MIN_HEADER_NAME)&quot;; \
+	sep=3D,; \
+-	quote &quot;MJIT_CC_COMMON  &quot; $(MJIT_CC); \
++	quote &quot;MJIT_CC_COMMON  &quot; ; \
+	quote &quot;MJIT_CFLAGS      MJIT_ARCHFLAG&quot; $(MJIT_CFLAGS); \
+	quote &quot;MJIT_OPTFLAGS   &quot; $(MJIT_OPTFLAGS); \
+	quote &quot;MJIT_DEBUGFLAGS &quot; $(MJIT_DEBUGFLAGS); \
+-	quote &quot;MJIT_LDSHARED   &quot; $(MJIT_LDSHARED); \
++	quote &quot;MJIT_LDSHARED   &quot; ; \
+	quote &quot;MJIT_DLDFLAGS    MJIT_ARCHFLAG&quot; $(MJIT_DLDFLAGS); \
+	quote &quot;MJIT_LIBS       &quot; $(LIBRUBYARG_SHARED); \
+	quote 'PRELOADENV       &quot;@PRELOADENV@&quot;'; \
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link=
-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-t=
he-link-of-libruby.patch
new file mode 100644
index 0000000000..96ae86263b
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-lib=
ruby.patch
@@ -0,0 +1,25 @@
+From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:chris_larson@mentor.com">&lt;chris_larson@mentor.com&gt;</a>
+Date: Thu, 5 May 2016 10:59:07 -0700
+Subject: [PATCH] Obey LDFLAGS for the link of libruby
+
+Signed-off-by: Christopher Larson <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:chris_larson@mentor.com">&lt;chris_larson@mentor.com&gt;</a>
+Upstream-Status: Pending
+
+---
+ template/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 1456313..15b98a4 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -127,7 +127,7 @@ ENABLE_SHARED =3D @ENABLE_SHARED@
+ LDSHARED =3D @LIBRUBY_LDSHARED@
+ DLDSHARED =3D @DLDSHARED@
+ XDLDFLAGS =3D @DLDFLAGS@
+-DLDFLAGS =3D @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
++DLDFLAGS =3D @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
+ SOLIBS =3D @SOLIBS@
+ ENABLE_DEBUG_ENV =3D @ENABLE_DEBUG_ENV@
+ MAINLIBS =3D $(YJIT_LIBS) @MAINLIBS@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filt=
er-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-M=
akefile.in-filter-out-f-prefix-map.patch
new file mode 100644
index 0000000000..b0d9a2e0ed
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-=
f-prefix-map.patch
@@ -0,0 +1,42 @@
+Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
+
+If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
+reproducible.  Fix this.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Tony Battersby <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:tonyb@cybernetics.com">&lt;tonyb@cybernetics.com&gt;</a>
+---
+--- a/tool/mjit_archflag.sh
++++ b/tool/mjit_archflag.sh
+@@ -7,6 +7,20 @@ quote() {
+     echo
+ }
+
++quote_filtered() {
++    printf &quot;#${indent}define $1&quot;
++    while shift &amp;&amp; [ &quot;$#&quot; -gt 0 ]; do
++	case &quot;$1&quot; in
++	    -ffile-prefix-map=3D*|-fdebug-prefix-map=3D*|-fmacro-prefix-map=3D*)
++		;;
++	    *)
++		printf ' &quot;%s&quot;'$sep &quot;$1&quot;
++		;;
++	esac
++    done
++    echo
++}
++
+ archs=3D&quot;&quot;
+ arch_flag=3D&quot;&quot;
+
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -666,7 +666,7 @@ mjit_config.h:
+	quote &quot;MJIT_OPTFLAGS   &quot; $(MJIT_OPTFLAGS); \
+	quote &quot;MJIT_DEBUGFLAGS &quot; $(MJIT_DEBUGFLAGS); \
+	quote &quot;MJIT_LDSHARED   &quot; ; \
+-	quote &quot;MJIT_DLDFLAGS    MJIT_ARCHFLAG&quot; $(MJIT_DLDFLAGS); \
++	quote_filtered &quot;MJIT_DLDFLAGS    MJIT_ARCHFLAG&quot; $(MJIT_DLDFLAG=
S); \
+	quote &quot;MJIT_LIBS       &quot; $(LIBRUBYARG_SHARED); \
+	quote 'PRELOADENV       &quot;@PRELOADENV@&quot;'; \
+	indent=3D$${archs:+'  '}; \
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible=
-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark=
-Gemspec-reproducible-change-fixing-784225-too.patch
index 0902a201ec..41f206523e 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change=
-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change=
-fixing-784225-too.patch
@@ -12,20 +12,20 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index d6eac7f..4b2e95e 100644
+index 0d72cee..eb7bc25 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1707,7 +1707,9 @@ class Gem::Specification &lt; Gem::BasicSpecificatio=
n
-                 raise(Gem::InvalidSpecificationException,
-                       &quot;invalid date format in specification: #{date.=
inspect}&quot;)
-               end
--            when Time, DateLike then
-+            when Time then
-+              Time.utc(date.utc.year, date.utc.month, date.utc.day)
-+            when DateLike then
-               Time.utc(date.year, date.month, date.day)
-             else
-               TODAY
+@@ -1691,7 +1691,9 @@ class Gem::Specification &lt; Gem::BasicSpecificatio=
n
+         raise(Gem::InvalidSpecificationException,
+               &quot;invalid date format in specification: #{date.inspect}=
&quot;)
+       end
+-    when Time, DateLike then
++    when Time then
++      Time.utc(date.utc.year, date.utc.month, date.utc.day)
++    when DateLike then
+       Time.utc(date.year, date.month, date.day)
+     else
+       TODAY
 --=20
-2.40.0
+2.25.1
=20
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducibl=
e.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.p=
atch
index d32e209129..0a87cae17f 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -7,6 +7,7 @@ Without an explicit date, they will get the current date an=
d make the
 build unreproducible
=20
 Upstream-Status: Backport [debian]
+
 ---
  ext/bigdecimal/bigdecimal.gemspec | 1 +
  ext/fiddle/fiddle.gemspec         | 1 +
@@ -16,12 +17,12 @@ Upstream-Status: Backport [debian]
  5 files changed, 5 insertions(+)
=20
 diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecimal=
.gemspec
-index f9f3b45..b9a469d 100644
+index d215757..5148d56 100644
 --- a/ext/bigdecimal/bigdecimal.gemspec
 +++ b/ext/bigdecimal/bigdecimal.gemspec
-@@ -14,6 +14,7 @@ Gem::Specification.new do |s|
-   s.name          =3D name
-   s.version       =3D source_version
+@@ -4,6 +4,7 @@ Gem::Specification.new do |s|
+   s.name          =3D &quot;bigdecimal&quot;
+   s.version       =3D &quot;3.1.3&quot;
    s.authors       =3D [&quot;Kenta Murata&quot;, &quot;Zachary Scott&quot=
;, &quot;Shigeo Kobayashi&quot;]
 +  s.date          =3D RUBY_RELEASE_DATE
    s.email         =3D [<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
mrkn@mrkn.jp">&quot;mrkn@mrkn.jp&quot;</a>]
@@ -40,10 +41,10 @@ index 8781093..efdca32 100644
    spec.email         =3D [<a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:aaron@tenderlovemaking.com">&quot;aaron@tenderlovemaking.com&quot;</a>, =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hsbt@ruby-lang.org">&quot=
;hsbt@ruby-lang.org&quot;</a>]
 =20
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console=
.gemspec
-index d4f5276..8f89611 100644
+index d26a757..cc88c55 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@ _VERSION =3D &quot;0.7.1&quot;
+@@ -4,6 +4,7 @@ _VERSION =3D &quot;0.6.0&quot;
  Gem::Specification.new do |s|
    s.name =3D &quot;io-console&quot;
    s.version =3D _VERSION
@@ -64,7 +65,7 @@ index 1f4798e..48743cf 100644
    spec.email         =3D [<a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:knu@idaemons.org">&quot;knu@idaemons.org&quot;</a>, <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:ume@mahoroba.org">&quot;ume@mahoroba.org&quot=
;</a>]
 =20
 diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 93a281c..cc5c155 100644
+index 3c96f7d..fec0872 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
@@ -75,6 +76,3 @@ index 93a281c..cc5c155 100644
    s.version =3D RDoc::VERSION
 =20
    s.authors =3D [
---=20
-2.40.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
new file mode 100644
index 0000000000..0b1eb23801
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
@@ -0,0 +1,55 @@
+From 2ebb50d2dc302917a6f57c1239dc9e700dfe0e34 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:n=
obu@ruby-lang.org">&lt;nobu@ruby-lang.org&gt;</a>
+Date: Thu, 27 Jul 2023 15:53:01 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid relative URI
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"http=
s://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1">ht=
tps://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1</=
a>]
+
+Signed-off-by: Mingli Yu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ lib/uri/rfc2396_parser.rb |  4 ++--
+ test/uri/test_parser.rb   | 12 ++++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
+index 76a8f99..00c66cf 100644
+--- a/lib/uri/rfc2396_parser.rb
++++ b/lib/uri/rfc2396_parser.rb
+@@ -497,8 +497,8 @@ module URI
+       ret =3D {}
+
+       # for URI::split
+-      ret[:ABS_URI] =3D Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*\z=
', Regexp::EXTENDED)
+-      ret[:REL_URI] =3D Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*\z=
', Regexp::EXTENDED)
++      ret[:ABS_URI] =3D Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s*\=
z', Regexp::EXTENDED)
++      ret[:REL_URI] =3D Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s*\=
z', Regexp::EXTENDED)
+
+       # for URI::extract
+       ret[:URI_REF]     =3D Regexp.new(pattern[:URI_REF])
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 72fb590..721e05e 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -79,4 +79,16 @@ class URI::TestParser &lt; Test::Unit::TestCase
+     assert_equal([nil, nil, &quot;example.com&quot;, nil, nil, &quot;&quo=
t;, nil, nil, nil], URI.split(&quot;//example.com&quot;))
+     assert_equal([nil, nil, &quot;[0::0]&quot;, nil, nil, &quot;&quot;, n=
il, nil, nil], URI.split(&quot;//[0::0]&quot;))
+   end
++
++  def test_rfc2822_parse_relative_uri
++    pre =3D -&gt;(length) {
++      &quot; &quot; * length + &quot;\0&quot;
++    }
++    parser =3D URI::RFC2396_Parser.new
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri|
++      assert_raise(URI::InvalidURIError) do
++        parser.split(uri)
++      end
++    end
++  end
+ end
+--
+2.25.1
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
new file mode 100644
index 0000000000..0ee295210e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
@@ -0,0 +1,51 @@
+From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:n=
obu@ruby-lang.org">&lt;nobu@ruby-lang.org&gt;</a>
+Date: Thu, 27 Jul 2023 16:16:30 +0800
+Subject: [PATCH] Fix quadratic backtracking on invalid port number
+
+https://hackerone.com/reports/1958260
+
+CVE: CVE-2023-36617
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"http=
s://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8">ht=
tps://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8</=
a>]
+
+Signed-off-by: Mingli Yu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ lib/uri/rfc3986_parser.rb |  2 +-
+ test/uri/test_parser.rb   | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index dd24a40..9b1663d 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -100,7 +100,7 @@ module URI
+         QUERY: /\A(?:%\h\h|[!$&amp;-.0-;=3D@-Z_a-z~\/?])*\z/,
+         FRAGMENT: /\A(?:%\h\h|[!$&amp;-.0-;=3D@-Z_a-z~\/?])*\z/,
+         OPAQUE: /\A(?:[^\/].*)?\z/,
+-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
+       }
+     end
+
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 721e05e..cee0acb 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -91,4 +91,14 @@ class URI::TestParser &lt; Test::Unit::TestCase
+       end
+     end
+   end
++
++  def test_rfc3986_port_check
++    pre =3D -&gt;(length) {&quot;\t&quot; * length + &quot;a&quot;}
++    uri =3D URI.parse(<a class=3D"moz-txt-link-rfc2396E" href=3D"http://m=
y.example.com">&quot;http://my.example.com&quot;</a>)
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |port|
++      assert_raise(URI::InvalidComponentError) do
++        uri.port =3D port
++      end
++    end
++  end
+ end
+--
+2.25.1
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch b/meta/re=
cipes-devtools/ruby/ruby/CVE-2024-27281.patch
new file mode 100644
index 0000000000..ab8e3f7c4c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
@@ -0,0 +1,96 @@
+From da7a0c7553ef7250ca665a3fecdc01dbaacbb43d Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:n=
obu@...">&lt;nobu@...&gt;</a>
+Date: Mon, 15 Apr 2024 11:40:00 +0000
+Subject: [PATCH] Filter marshaled objets
+
+CVE: CVE-2024-27281
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"http=
s://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d">h=
ttps://github.com/ruby/rdoc/commit/da7a0c7553ef7250ca665a3fecdc01dbaacbb43d=
</a>]
+Signed-off-by: Hitendra Prajapati <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ lib/rdoc/store.rb | 45 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 26 insertions(+), 19 deletions(-)
+
+diff --git a/lib/rdoc/store.rb b/lib/rdoc/store.rb
+index 9fc540d..5b663d7 100644
+--- a/lib/rdoc/store.rb
++++ b/lib/rdoc/store.rb
+@@ -556,9 +556,7 @@ class RDoc::Store
+   def load_cache
+     #orig_enc =3D @encoding
+
+-    File.open cache_path, 'rb' do |io|
+-      @cache =3D Marshal.load io
+-    end
++    @cache =3D marshal_load(cache_path)
+
+     load_enc =3D @cache[:encoding]
+
+@@ -615,9 +613,7 @@ class RDoc::Store
+   def load_class_data klass_name
+     file =3D class_file klass_name
+
+-    File.open file, 'rb' do |io|
+-      Marshal.load io
+-    end
++    marshal_load(file)
+   rescue Errno::ENOENT =3D&gt; e
+     error =3D MissingFileError.new(self, file, klass_name)
+     error.set_backtrace e.backtrace
+@@ -630,14 +626,10 @@ class RDoc::Store
+   def load_method klass_name, method_name
+     file =3D method_file klass_name, method_name
+
+-    File.open file, 'rb' do |io|
+-      obj =3D Marshal.load io
+-      obj.store =3D self
+-      obj.parent =3D
+-        find_class_or_module(klass_name) || load_class(klass_name) unless
+-          obj.parent
+-      obj
+-    end
++    obj =3D marshal_load(file)
++    obj.store =3D self
++    obj.parent ||=3D find_class_or_module(klass_name) || load_class(klass=
_name)
++    obj
+   rescue Errno::ENOENT =3D&gt; e
+     error =3D MissingFileError.new(self, file, klass_name + method_name)
+     error.set_backtrace e.backtrace
+@@ -650,11 +642,9 @@ class RDoc::Store
+   def load_page page_name
+     file =3D page_file page_name
+
+-    File.open file, 'rb' do |io|
+-      obj =3D Marshal.load io
+-      obj.store =3D self
+-      obj
+-    end
++    obj =3D marshal_load(file)
++    obj.store =3D self
++    obj
+   rescue Errno::ENOENT =3D&gt; e
+     error =3D MissingFileError.new(self, file, page_name)
+     error.set_backtrace e.backtrace
+@@ -976,4 +966,21 @@ class RDoc::Store
+     @unique_modules
+   end
+
++  private
++  def marshal_load(file)
++    File.open(file, 'rb') {|io| Marshal.load(io, MarshalFilter)}
++  end
++
++  MarshalFilter =3D proc do |obj|
++    case obj
++    when true, false, nil, Array, Class, Encoding, Hash, Integer, String,=
 Symbol, RDoc::Text
++    else
++      unless obj.class.name.start_with(&quot;RDoc::&quot;)
++        raise TypeError, &quot;not permitted class: #{obj.class.name}&quo=
t;
++      end
++    end
++    obj
++  end
++  private_constant :MarshalFilter
++
+ end
+--
+2.25.1
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/re=
cipes-devtools/ruby/ruby/CVE-2024-27282.patch
new file mode 100644
index 0000000000..0740ad81e9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
@@ -0,0 +1,27 @@
+From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hs=
bt@ruby-lang.org">&lt;hsbt@ruby-lang.org&gt;</a>
+Date: Fri, 12 Apr 2024 15:01:47 +1000
+Subject: [PATCH] Fix Use-After-Free issue for Regexp
+
+Co-authored-by: Isaac Peka <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:7493006+isaac-peka@users.noreply.github.com">&lt;7493006+isaac-peka@user=
s.noreply.github.com&gt;</a>
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"http=
s://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a">h=
ttps://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a=
</a>]
+CVE: CVE-2024-27282
+Signed-off-by: Ashish Sharma <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:asharma@mvista.com">&lt;asharma@mvista.com&gt;</a>
+
+ regexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regexec.c b/regexec.c
+index 73694ab14a0b0a..140691ad42489f 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar=
* end,
+     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
+       GET_MEMNUM_INC(mem, p);
+       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. *=
/
+-      STACK_PUSH_MEM_END(mem, s);
+       mem_start_stk[mem] =3D GET_STACK_INDEX(stkp);
++      STACK_PUSH_MEM_END(mem, s);
+       MOP_OUT;
+       JUMP;
diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patc=
h b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
new file mode 100644
index 0000000000..1808a6384a
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
@@ -0,0 +1,35 @@
+From e74b57febec9bd806e29025e6eeb8091e7021d75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@=
gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Date: Sun, 26 Jan 2020 11:27:40 -0800
+Subject: [PATCH] Filter out __has_include* compiler defines
+
+They are internal to compiler and this header is later on includes in C
+files, but newer gcc &gt;=3D 10 complains about it.
+
+error in initial header file:
+| In file included from /tmp/20200124-86625-14hiju4.c:1:
+| /tmp/20200124-86625-11y6l6i.h:13849:9: error: &quot;__has_include&quot; =
cannot be used as a macro name
+| 13849 | #define __has_include __has_include
+|       |         ^~~~~~~~~~~~~
+| compilation terminated due to -Wfatal-errors.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+
+---
+ common.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/common.mk b/common.mk
+index 664f750..3b8fbe6 100644
+--- a/common.mk
++++ b/common.mk
+@@ -238,6 +238,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=3D)$(MJIT_HEADER_SUFF=
IX).time: probes.h vm.$(OBJE
+	$(ECHO) building $(@F:.time=3D.h)
+	$(Q)$(MINIRUBY) $(tooldir)/mjit_tabs.rb &quot;$(MJIT_TABS)&quot; \
+		$(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAG=
S) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=3D.h).new
++	$(Q)sed -i -e &quot;/#define __has_include __has_include/d&quot; $(@F:.t=
ime=3D.h).new
++	$(Q)sed -i -e &quot;/#define __has_include_next __has_include_next/d&quo=
t; $(@F:.time=3D.h).new
+	$(Q) $(IFCHANGE) &quot;--timestamp=3D$@&quot; $(@F:.time=3D.h) $(@F:.time=
=3D.h).new
+
+ $(MJIT_HEADER:.h=3D)$(MJIT_HEADER_SUFFIX).h: $(TIMESTAMPDIR)/$(MJIT_HEADE=
R:.h=3D)$(MJIT_HEADER_SUFFIX).time
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtoo=
ls/ruby/ruby_3.2.2.bb
similarity index 88%
rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.2.2.bb
index fb0d711765..508154dad5 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -10,7 +10,7 @@ LICENSE =3D &quot;Ruby | BSD-2-Clause | BSD-3-Clause | GP=
L-2.0-only | ISC | MIT&quot;
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COP=
YING;md5=3D5b8c87559868796979806100db3f3805\file://BSDL;md5=3D8b50bc6de8f58=
6dc66790ba11d064d75\file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263\-file=
://LEGAL;md5=3D81e6a4d81533b9263da4c3485a0ad883\+file://LEGAL;md5=3Dbcd74b4=
7bbaf2051c5e49811a5faa97a\">&quot;file://COPYING;md5=3D5b8c8755986879697980=
6100db3f3805 \
                     file://BSDL;md5=3D8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=3D81e6a4d81533b9263da4c3485a0ad883 \
+                    file://LEGAL;md5=3Dbcd74b47bbaf2051c5e49811a5faa97a \
                     &quot;</a>
=20
 DEPENDS =3D &quot;zlib openssl libyaml gdbm readline libffi&quot;
@@ -20,12 +20,21 @@ DEPENDS:append:class-nativesdk =3D &quot; ruby-native&q=
uot;
 SHRT_VER =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@oe.utils=
.trim_version(">&quot;${@oe.utils.trim_version(&quot;</a>${PV}&quot;, 2)}&q=
uot;
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://cache.ruby-l=
ang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz\file://0001-extmk-fix-cross-=
compilation-of-external-gems.patch\+file://0002-Obey-LDFLAGS-for-the-link-o=
f-libruby.patch\+file://remove_has_include_macros.patch\file://run-ptest\+f=
ile://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch\+file=
://0002-template-Makefile.in-filter-out-f-prefix-map.patch\file://0003-rdoc=
-build-reproducible-documentation.patch\file://0004-lib-mkmf.rb-sort-list-o=
f-object-files-in-generated-M.patch\file://0005-Mark-Gemspec-reproducible-c=
hange-fixing-784225-too.patch\file://0006-Make-gemspecs-reproducible.patch\=
file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch\+file:/=
/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch\+file://CV=
E-2023-36617_1.patch\+file://CVE-2023-36617_2.patch\+file://CVE-2024-27281.=
patch\+file://CVE-2024-27282.patch\">&quot;http://cache.ruby-lang.org/pub/r=
uby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-extmk-fix-cross-compilation-of-external-gems.patch =
\
+           file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
+           file://remove_has_include_macros.patch \
            file://run-ptest \
+           file://0001-template-Makefile.in-do-not-write-host-cross-cc-ite=
m.patch \
+           file://0002-template-Makefile.in-filter-out-f-prefix-map.patch =
\
            file://0003-rdoc-build-reproducible-documentation.patch \
            file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-=
M.patch \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.=
patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.p=
atch \
+           file://0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-pos=
s.patch \
+           file://CVE-2023-36617_1.patch \
+           file://CVE-2023-36617_2.patch \
+           file://CVE-2024-27281.patch \
+           file://CVE-2024-27282.patch \
            &quot;</a>
 UPSTREAM_CHECK_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://=
www.ruby-lang.org/en/downloads/">&quot;https://www.ruby-lang.org/en/downloa=
ds/&quot;</a>
=20
@@ -46,7 +55,7 @@ do_configure:prepend() {
=20
 DEPENDS:append:libc-musl =3D &quot; libucontext&quot;
=20
-SRC_URI[sha256sum] =3D &quot;3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24=
a9ff8cf99ecbce75196&quot;
+SRC_URI[sha256sum] =3D &quot;96c57558871a6748de5bc9f274e93f4b5aad06cd8f37b=
efa0e8d94e7b8a423bc&quot;
=20
 PACKAGECONFIG ??=3D &quot;&quot;
 PACKAGECONFIG +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb=
.utils.filter('DISTRO_FEATURES','ipv6',d)}">&quot;${@bb.utils.filter('DISTR=
O_FEATURES', 'ipv6', d)}&quot;</a>
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208185): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/208185">https://lis=
ts.openembedded.org/g/openembedded-core/message/208185</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/109897713/3616765">https://lists.openembedded.org/mt/109=
897713/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openem=
bedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/ope=
nembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mai=
lto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------XO0xpFsE8v2WRDQOUaky37Un--

