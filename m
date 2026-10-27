Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14785.1793092572896751090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gQ40yvdv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=476085ac17=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5cZSm2349580
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 09:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=98v6suPAl
	SdfeA7E2lz/elx9jzWnfQNngFQ9kMK5VNw=; b=gQ40yvdvAKNYiB71S1y6QCVhE
	D90fk6oDV7iSRIkVhSwF6QHY22iAA5bC462652YsOw0837BMvtD2HuPFhHhhibzV
	Hb6xbEXyG6bKBnq+8BPwsCXWzdtpyH0RGMd+xV0cFvU6CSwPFiaLblDQVG+t9auq
	IdGWceyJtxaXALquMVz/ggfCXM3olgUEwm12PVHoMjWkTy14Sodp4e6fAgCwd3Yl
	BCdzQAl662FHvRph9YnKs4s4Dd06FIA/occDP8FNAp+G2SvKh2sFN6XT9YM+i9k8
	kpQDdXHL3axvSXGVkltSpe+2VMFoTi+CWtLC5neGorN0FzC+l/eOhW502QtcQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020110.outbound.protection.outlook.com [52.101.46.110])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hghvxby3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 09:16:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alJwisiMXOdWT/DRxXSjy/SdK2eEuHOdtWoeMZX2zz5NEztSZqs4kFHu45g1eUOYzDEZsTfMdAXQIS+zTyyYbIMwrefdpg/xCJT0wqHo+5QJSJvvIleLdtlc6PhyVgF0ustDEjpq7DTtIiXqagKLqd2lwyunNXI3ul6d3c5VUEFtw6clx2nT4rwnKy+BZK7cJioffGSYKFtc7AaQ6sf57PPv+CHHclcujS+w+M0FOh3Y5ieZnM/WQWQxtvZxeq/KIxYIKMcvL2ppKY6LhtmbSwnj2hvltHY0MI1blYkLnUUCJPs+b0JnPZ5+iTpe4jDsFBFRo6hphYaJvAEMA4zpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98v6suPAlSdfeA7E2lz/elx9jzWnfQNngFQ9kMK5VNw=;
 b=HujeW6seMyosvSJ7sG3jBqiAF7AhXN/LKmU/5bPLF369hD2D1MIQOmxHpdDUsCCpKNvd2tyhV8CWRkX2NJ3d6xRYbXqOIV2c0SOr1j1W8oxmcIIOKVQYNWNM30/7l2AfmyeuE9LWizwlyv7rBGP1cmi41bkBGTX4/qhjElHcbCI3e58jR+hZugBJ3RDb1e29yCKo/nJ/pO1TEjfGZsCOgXBYkjnJ6Vzi3NGC0vK2nBbjXCxK/nBxsxZ1OqXawoFRmPFzSNriIJAlWfqwRjKuX7Al0UEJwd78GhV1qgE1SGyxRuf8a075nNzDAIQZvu0CNTgX4QUJ2WVnbZKLFJdBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA1PR11MB8574.namprd11.prod.outlook.com (2603:10b6:806:3b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:16:07 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:16:07 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [PATCH] gcc: Fix for CVE-2026-95619
Date: Tue, 27 Oct 2026 02:14:14 -0700
Message-ID: <20261027091547.3224168-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::6) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA1PR11MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: c2128889-dbf5-4ad1-9a00-08df340aeef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|23010399003|376014|366016|3023799007|6133799003|18002099003|261026121527099003|5023799004|11063799006|10067099003|261021123027099003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|56012099006|260925021311599003|260925022911599003|38350700014|260925021911599003;
X-Microsoft-Antispam-Message-Info: dkKQZrWC8eO9w/AbITzPotLaTxpeX4AvOSMqpaAVOAvBErzLlifi+rktKvLcdCG6kjlWzQu30Osmq7S8tbaqIa3nznJzSO/v9bZ+OZd16O7L8vcq0UtaGwGD9liWcXZGAAq5xC1Api2gHnMl40gtdhiYbqmBWeA8cFMOqT8S3R2JScNdPHjeds6vROhL8OK2JtHCIxlnwPYSfmkUY+U+YkB/CkshuWbapA9j08ukkeR1yNGgJDS8Rd3ByFZtn8rsxmRytyW9WWxvfq2s0gGdWRbvhQXPE3YQbkxsxcavQzSCESoJo50cYj8TSghLjxnhskWvgAMZlwMyqigTfhaa1MLdt2sLu9+M7UrQS0w+u8630dNE+mRF/Xq00CqYz4cnFXPuUYsB4T8LTy+J/Moo6GPANnbBWGF905PxnHGyvgxzgog01DNBWKJsUtD4RJO85VfG4owsiT//bFDyapPMTmEvacSJoUk2MCzb076VTE7BOrZQe1g5gRgeh7F1I4evAKafIXY7B4pH5eAROchBCcK2+CuNTyhPkhLpMe9FqGdUowxqmgTc/ZYhZIsW9K92rvt5265UDVOZd3RUiXlY8h/b2IZR12gltRjTjqurSeFVHOldet6x03NmVeTl5D0LBSt7YvWdjS5v4OgYnhI7wUx24mlTYFCVshey4Sj4FbUwH8d9TMp/XlpBeu/22UoVLVLOnyJYH0aeFVEDlhVml9AqECNiJLONkyD1MHSG9Co=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(376014)(366016)(3023799007)(6133799003)(18002099003)(261026121527099003)(5023799004)(11063799006)(10067099003)(261021123027099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(56012099006)(260925021311599003)(260925022911599003)(38350700014)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFZ4dzZoYlFTZmRrbUtYcXhqVzAyYnlCZzhtVXhqZVJwejVYTkRXNHIyT2tN?=
 =?utf-8?B?ZXpocXhUV3pwZmVreVpPeUgzMGcxeks3c2VmdnFlYzM5N0FlTnpCOVUwLzRW?=
 =?utf-8?B?S1FKa2h2cGFmTWdoSUxDVWRPN1JmUllTRE1Oby9hYWZUQnI2ZUZUbkRNeWpZ?=
 =?utf-8?B?ODIyUjF0OUFmcFBhSzF5UVV1bWVhd2cxYkx2blFocVF1OG1KTXkvUmo2MEU3?=
 =?utf-8?B?SzBGRXVWb1p0Sk5HTkplb3c4THlUeXZXdStDNmFWTVFoc0V6aTc2T2R5S2J4?=
 =?utf-8?B?STh3Q3ZvbStDblZzdkt3a25GSlVYbUZUNk5TNWx3Wis3MUNwRzNPTzVGakpH?=
 =?utf-8?B?UlphMVpwenFXendMb3M1TkYvZmVlQU1WWFdmdVVITDF3TmRtVDg2cjArbE13?=
 =?utf-8?B?VExHRHpGTEV0bjUxMkozV2FJcjBaTmZWRHp1bjJxeXRmTThCd1FHMDNFS3Bo?=
 =?utf-8?B?NythOHQrSGRvajZiV01DUmVYK0M4RXFrckkxM2Y3OTJEVWVvUDRsbUNVclpt?=
 =?utf-8?B?dGNSN2haMmMxRGhDRUc0TDNIaVN6bzFqcGV0Wm1sdTd4K083bEtlcGVMVUtm?=
 =?utf-8?B?MW9mN05jUHRzaU42eG5qcTl5bWZPdTQ0YWdDbDJIZENrNU55TmdSK3pmeXNo?=
 =?utf-8?B?WXBITEw4Q3ZCK0svdE0reTZhU0NzaUNyVnUxZThtaHE3YTV3ckVoajA0dmI4?=
 =?utf-8?B?bHpjUXJFUU9QczE3N3ZCQXlhQ2FKZ3V2MUNDeGRBTFk3SUNPNUdkMjJLelBW?=
 =?utf-8?B?NnhNU0hDZDJ6T0JmMUQ1TFVZa0RuOVpCeEFlUXpBOTQvbzJCRVBRb3JVZnZo?=
 =?utf-8?B?dzFvd3dPSTBad3BZMGVxbWZlMFhGVlN0OTZxdlM4WW1WN2Z1T2JZQ1QrTW5C?=
 =?utf-8?B?QUNBZzczZWYwbjNxTzFBbzBxblMrNmVkeTlLdTNQQU5DaEJDdE1KOFcxRkJu?=
 =?utf-8?B?OXlRR3Z5VW9iMVAyUmF1V2RGNXVVY1ZHVm84OWxsN3BCNkNnRDFiamFiL2hl?=
 =?utf-8?B?NCtjWUxOYXg0VmI4QmJ5UTRmK3p5a0pJV3RiTXFFWndQbTlDOE92OFF1aDIw?=
 =?utf-8?B?TXRjUFBOR0lLRnQ3MEloOGZvRGUrNTFPN05LWS95K3V6V1hmaGRETmYxYllN?=
 =?utf-8?B?eURrblNWbGJqOXFOVitPdkkwNnlHYi9IYnZndHBZeFpmRlZWbk85WXZLM0tM?=
 =?utf-8?B?ck5mODJYSXdrckVwNUdNbXVsUEQrcVFVSmJaVVkxbjlsRFdxK0lGZDJyYUJ1?=
 =?utf-8?B?Nm5mTGFIWStyZ2gwbkFwZTJ5OW1yRElNUFZDVjI4RkFySDgvdjdDVGh6UzRa?=
 =?utf-8?B?dGlpOXBXN292WFUrL2tpbm1hbTlYRTZhY3ZKZjJ0RVhtUjZkQ1I5Q3FVUFJ4?=
 =?utf-8?B?RzlBMlVPTStRblp3U0dOcS9lTEtpc0ZPNU9NWmZFLzJOQW1mSkZaeUJ0czhy?=
 =?utf-8?B?R283RC9ocHpQZkFOTDZZZmxHcm1TOUJNOXJaNXRWeGNjZFdaU3BwTnJiMVhy?=
 =?utf-8?B?NWwzSEplTUVnOUtUeTlCdVFkWnVyU1NtTnoxNWpKZVVwOFVJT25iMlczdHVk?=
 =?utf-8?B?alBKVnhXQ1FXdnNIRnh4UHYzMTQ0NlNCdmUyWTl6TG9Cc0YvOEM4N2R5amFL?=
 =?utf-8?B?RjlhQnVTNDlwcSt0MVhoYjVUVUdPNnJIT3MyN1hEd3hTeU1vTFg3Uk83eS93?=
 =?utf-8?B?Z1kzQ2k0VjlpbFM4cUl4b3dMN3g0cHlFWG9ieXB4UHhEYTJBSExiSE9neUVK?=
 =?utf-8?B?TnlHTzAxbGp4TzVMVXV6UHFEeFljdlNHQ1pKUkpCNkJjY0F5Zyt0TTZiTkhD?=
 =?utf-8?B?Nmx4eXQvZW0wbHV6TGJQWWYvTzFJcTdsem1tWG1yVm5nSjg4U1A0K3l0YlN5?=
 =?utf-8?B?VkZnOHl4NzBUaU16cHh2U1pSbTFHRExRM1d6b2FTNEdjUXZVQUFQQ2JMdnkz?=
 =?utf-8?B?cWIxUHJMd1ltQXhQREFvcER3QWhnOUNMTUl3ZGwwRUtKUkxVZW5rMldlM3VP?=
 =?utf-8?B?bkJJc3JjYmdpUDhLbzBOaXZNcGhzRW42b1RsU2ZKMG5tZE1Fdzk2K0lRQzdU?=
 =?utf-8?B?SWdMQnc5cS90b0MvbXlCL2VNSU9mek9TblVIUU1oUnBGeTRQT1RRaFpONWRS?=
 =?utf-8?B?aFUvZDh5dWFJeFQzQXV4NjgwTjY2czVjcmdKVnpwbWIxZmUxWDZXK1VIT0Yx?=
 =?utf-8?B?TktRM0NDdmJFN1ZvZHBNSXM5bGsvc3lOZ2lia2xLZE1TcVU4U1kvWEkwNDdK?=
 =?utf-8?B?SDE3KzhsWEpFbzlobXNmRHpMb0tETE5mTzhTejcvS1FNMmNmUUhYeFVhb1N0?=
 =?utf-8?B?MEI5UUFjaU82bXVvVTViOThSZ2lvT0toNm5QSGFjWEp0Q21UK3V1NG1HUEN6?=
 =?utf-8?Q?r6UK9DFa5z2kA7gs=3D?=
X-Exchange-RoutingPolicyChecked: okDvkTzIUINlhiwPiv1kVYXChmXivIAVydnt1a1RRjR9790PZkTo82Kfc5Ku6WzBUnxCt/3z0LfUmDlYVs3zrd9RXO9F/wYAntmqF/FGPmq9R+Pb+CmGFSTZXUg1Fq6Q9claUo4aShuVAqIVZELjWgfmfj59KPlQKEBOHhoJamft2Hi8+AGrWtj4rsvAo+C3s8uYFlLXyPfNAmYWcGDDqhuQWLTy81GMp03TXVL+b33yjGu8+bgsg59I52Glj9HkKBI1iRx7lYgnGpRD/AWBtNKIBkegjzrdduRlqoE1ywH82m9EGxaFBU9Ki2iEW40gfLuQXFmZjzovBO3m/aWYNw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2128889-dbf5-4ad1-9a00-08df340aeef8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:16:07.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71o1vuAF0yfLSaYD8b5YHNt09xfgCkMOzcuLOOIu7HgzZ4avk2m79IdoOVl08a0NlTWiqX76//iKlwxZKpT/lHzDG5HEpAvQ8THk2FsRNPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8574
X-Authority-Analysis: v=2.4 cv=Q55HcI2a c=1 sm=1 tr=0 ts=6ae06bdb cx=c_pps
 a=GpMrALTSj0NtuSyXwlNXWg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=pUjUj6oU-fdMQ6dj_Z4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX2f+FpDgZr+ee
 D5bvtnOhnCwlidOpnZ3DP1BJJdmetMfA4KnH/X0oAYYrHUkbSRQ2QDDBw8m7EprAiuvJFO0ESVg
 FvLwUnLFKOAPKrrMPAp4ajlb6w9z9rOdq/Hy/cA9zli9h2FI1ypM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX4RuhWpuKZWhd
 V0m5jcW+0bpTZvYTYG1VhCls7QUUTANZYW7hoK8R5kkHrPZnf7J+163Z9FFTcMpqMPP/9OwtHBU
 je71I6+dXjhm+9RHMn1hVBlToDTItvrbWY1D9EKR41dcouzvf/J8shGIGfQrw9mv2hHVKjTsYp+
 gPq2BQlxiaD5JIWbtnywKY5GDGtlb0ybtrvJkCR+hquvGwgAC3vpY9Dlu98W7OJ8Afl+8PfAJHA
 6o7fb3aHj/OdSsnRJB8OYZX597wjc3+LeGdFabgZK8vAT3m976y0BTIsoLLYw+Cmdv+20cn9g7F
 rzoxymAO4FXMlji7F7y9TNC0vNGyJbYvGFaG6GhhYRo/yE3K3arzQUZkEDs81gyQCICiJyEkek4
 VZtjplmULEdMhRh9qJb0tSGrSPVjtFDsZh8S55cmKc/MsMDkp9mbz1z23E+H42zJH5s2lzbdD2Z
 08vmgo0HAUbaIU6qryw==
X-Proofpoint-GUID: 1SASvkqw5RYhvRbtTjpy3W82Vnzh3Blr
X-Proofpoint-ORIG-GUID: 1SASvkqw5RYhvRbtTjpy3W82Vnzh3Blr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270036
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69R5cZSm2349580
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 09:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248722

From: Sowmya Sathram <sowmyasathram12@gmail.com>

libstdc++: Ensure that aligned new detects size_t overflow

Depending on the implementation used for aligned new, the size argument
may be rounded up to a multiple of the alignment. If the size or
alignment is a huge value the rounded result could wraparound to a small
value and be successfully allocated, returning a non-null pointer that is
smaller than requested. Add size_t overflow checks so std::bad_alloc is
thrown instead. The using-directive for ::aligned_alloc is replaced with
a new __gnu_cxx::aligned_alloc function and the parameter adjustments are
moved from operator new into it, with the added overflow checks for the
aligned_alloc, _aligned_malloc (Wine) and malloc fallback paths.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-95619
https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D59d235ffa5a69231eb42e=
5290d52dc8c90d28b7a

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0027-CVE-2026-95619.patch         | 188 ++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.pat=
ch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-16.2.inc
index 3497493619..31a630ce8a 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.p=
atch \
 	   file://0026-CVE-2026-102010.patch \
+	   file://0027-CVE-2026-95619.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch b/me=
ta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
new file mode 100644
index 0000000000..e984344eac
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-95619.patch
@@ -0,0 +1,188 @@
+From 59d235ffa5a69231eb42e5290d52dc8c90d28b7a Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 23 Sep 2026 13:15:18 +0100
+Subject: libstdc++: Ensure that aligned new detects size_t overflow
+ (CVE-2026-95619)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Depending on the implementation used for aligned new, we might need to
+round the size argument up to a multiple of the alignment. If either the
+size or the alignment is a huge value then the rounded result could
+wraparound to a small value which would then be successfully allocated
+by the underlying libc allocation function. This means that we return a
+non-null pointer but not of the requested size. Instead we should throw
+std::bad_alloc because the allocation cannot succeed.
+
+This doesn't affect most modern targets because they use the
+posix_memalign implementation, which doesn't do that rounding.
+
+On targets without posix_memalign we use C11 aligned_alloc and round
+before calling it. That rounding needs to be checked for overflow. The
+using-directive for ::aligned_alloc is replaced with a new
+__gnu_cxx::aligned_alloc function and the existing fix-ups for that path
+are moved from operator new into the new function, with added check for
+the overflow we need to fix.
+
+On *-*-mingw* we use the Windows _aligned_malloc function which
+correctly checks for overflow on Windows. But the Wine version of that
+function does not and has the same overflow problem so we need to do our
+own checks before calling it. We include a conservative 2*sizeof(void*)
+adjustment in our own overflow check.
+
+On targets without any aligned allocation function we provide our own
+__gnu_cxx::aligned_alloc in terms of malloc. This also needs an overflow
+check.
+
+libstdc++-v3/ChangeLog:
+
+	* libsupc++/new_opa.cc
+	[_GLIBCXX_HAVE_ALIGNED_ALLOC] (__gnu_cxx::aligned_alloc):
+	Replace using-directive with new function. Check for size_t
+	overflow.
+	[_GLIBCXX_HAVE__ALIGNED_MALLOC] (__gnu_cxx::aligned_alloc):
+	Check for size_t overflow.
+	(__gnu_cxx::aligned_alloc): Likewise in fallback definition.
+	(operator new) [_GLIBCXX_HAVE_ALIGNED_ALLOC]: Move parameter
+	adjustments to new __gnu_cxx::aligned_alloc function.
+	* testsuite/18_support/new_aligned_wrap.cc: New test.
+
+CVE: CVE-2026-95619
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3D59d2=
35ffa5a69231eb42e5290d52dc8c90d28b7a]
+
+Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ libstdc++-v3/libsupc++/new_opa.cc                  | 49 ++++++++++++++-=
-------
+ .../testsuite/18_support/new_aligned_wrap.cc       | 39 +++++++++++++++=
++
+ 2 files changed, 71 insertions(+), 17 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/18_support/new_aligned_wrap.c=
c
+
+diff --git a/libstdc++-v3/libsupc++/new_opa.cc b/libstdc++-v3/libsupc++/=
new_opa.cc
+index 7bda847a9257..bd0098ac09e4 100644
+--- a/libstdc++-v3/libsupc++/new_opa.cc
++++ b/libstdc++-v3/libsupc++/new_opa.cc
+@@ -81,12 +81,38 @@ aligned_alloc (std::size_t al, std::size_t sz)
+   return nullptr;
+ }
+ #elif _GLIBCXX_HAVE_ALIGNED_ALLOC
+-using ::aligned_alloc;
++// We have C11 aligned_alloc but we need to satisfy its preconditions.
++static inline void*
++aligned_alloc (std::size_t al, std::size_t sz)
++{
++# if defined _AIX || defined __APPLE__
++  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's require=
ment
++   * that alignment is a multiple of sizeof(void*).
++   * OS X 10.15 has the same requirement.  */
++  if (al < sizeof(void*))
++    al =3D sizeof(void*);
++# endif
++  /* C11: the value of size shall be an integral multiple of alignment.=
  */
++  if (__builtin_add_overflow(sz, al - 1, &sz)) [[unlikely]]
++    return nullptr;
++  sz &=3D ~(al - 1);
++  return ::aligned_alloc(al, sz);
++}
+ #elif _GLIBCXX_HAVE__ALIGNED_MALLOC
++// Use Windows _aligned_malloc
+ static inline void*
+ aligned_alloc (std::size_t al, std::size_t sz)
+-{ return _aligned_malloc(sz, al); }
++{
++  // The Wine msvcrt.dll version of _aligned_malloc doesn't detect over=
flow
++  // so do it ourselves. We know al + 2 * sizeof(void*) won't overflow =
because
++  // has_single_bit(al) was already checked by the caller.
++  std::size_t check;
++  if (__builtin_add_overflow(sz, al + 2 * sizeof(void*), &check)) [[unl=
ikely]]
++    return nullptr;
++  return _aligned_malloc(sz, al);
++}
+ #elif _GLIBCXX_HAVE_MEMALIGN
++// Use memalign (and assume that what it returns can be passed to free).
+ static inline void*
+ aligned_alloc (std::size_t al, std::size_t sz)
+ {
+@@ -103,8 +129,10 @@ aligned_alloc (std::size_t al, std::size_t sz)
+   // We need extra bytes to store the original value returned by malloc.
+   if (al < sizeof(void*))
+     al =3D sizeof(void*);
+-  void* const malloc_ptr =3D malloc(sz + al);
+-  if (!malloc_ptr)
++  if (__builtin_add_overflow(sz, al, &sz)) [[unlikely]]
++    return nullptr;
++  void* const malloc_ptr =3D malloc(sz);
++  if (!malloc_ptr) [[unlikely]]
+     return nullptr;
+   // Align to the requested value, leaving room for the original malloc=
 value.
+   void* const aligned_ptr =3D (void *) (((uintptr_t) malloc_ptr + al) &=
 -al);
+@@ -131,19 +159,6 @@ operator new (std::size_t sz, std::align_val_t al)
+   if (__builtin_expect (sz =3D=3D 0, false))
+     sz =3D 1;
+=20
+-#if _GLIBCXX_HAVE_POSIX_MEMALIGN
+-#elif _GLIBCXX_HAVE_ALIGNED_ALLOC
+-# if defined _AIX || defined __APPLE__
+-  /* AIX 7.2.0.0 aligned_alloc incorrectly has posix_memalign's require=
ment
+-   * that alignment is a multiple of sizeof(void*).
+-   * OS X 10.15 has the same requirement.  */
+-  if (align < sizeof(void*))
+-    align =3D sizeof(void*);
+-# endif
+-  /* C11: the value of size shall be an integral multiple of alignment.=
  */
+-  sz =3D (sz + align - 1) & ~(align - 1);
+-#endif
+-
+   void *p;
+=20
+   while ((p =3D __gnu_cxx::aligned_alloc (align, sz)) =3D=3D nullptr)
+diff --git a/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc b/lib=
stdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+new file mode 100644
+index 000000000000..dbd642d6ba58
+--- /dev/null
++++ b/libstdc++-v3/testsuite/18_support/new_aligned_wrap.cc
+@@ -0,0 +1,39 @@
++// { dg-do run }
++
++#include <new>
++#include <stdint.h>
++#include <testsuite_hooks.h>
++
++#pragma GCC diagnostic ignored "-Walloc-size-larger-than=3D"
++
++void
++check_aligned_new_overflow(std::size_t size, std::size_t align)
++{
++#if __cpp_aligned_new
++  std::align_val_t alignv =3D (std::align_val_t)align;
++  try
++    {
++      (void) ::operator new(size, alignv);
++      VERIFY(false);
++    }
++  catch (const std::bad_alloc&)
++    {
++    }
++
++  void* p =3D ::operator new(size, alignv, std::nothrow);
++  VERIFY(p =3D=3D 0);
++#endif
++}
++
++int main()
++{
++  check_aligned_new_overflow(-9, 32);
++  check_aligned_new_overflow(SIZE_MAX, 8);
++  check_aligned_new_overflow(SIZE_MAX, 32);
++  check_aligned_new_overflow(SIZE_MAX, 1024);
++  check_aligned_new_overflow(SIZE_MAX, 65536);
++  check_aligned_new_overflow(SIZE_MAX -     1,    16);
++  check_aligned_new_overflow(SIZE_MAX -  1025,  1024);
++  check_aligned_new_overflow(SIZE_MAX -  1024,  1024);
++  check_aligned_new_overflow(SIZE_MAX - 65536, 65536);
++}
+--=20
+cgit=20
+
--=20
2.49.0

