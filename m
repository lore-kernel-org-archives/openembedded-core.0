Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11587.1795082905966139996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=o85TfA2a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5783957acd=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ88CEh1603013
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 02:08:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=RUwFUx8Fq
	fH52PT01DuR/tgnKQDCISKXvOZFRamFz38=; b=o85TfA2a+VaC9Fz+H8RRwfDEe
	UjS56gydwnqoBYsnBgvEs2zIQloeKQUIVqx01rbDIrqhUmD+vCDHvYxo6ZzuykhI
	wAwJCVjoUMiHUcxJN6rcLXzCueRR+t0l3i0XasLwBGyKbMC4hEP3ilJ/JM6+Ss9F
	50vv6mrhCDMFZk5vRt0A+w8DwUWYQkYmBHYnw6Itm5mxgjBeSB7meGVNgCELCAv6
	DjK9ZRBe0MoXCPFtKjmlsUr6mqa0IMoHeYYAHv1qybNASA/Nm+okxh/r3dwvHAXz
	WCPls8Fy1aRLaBAk7aoA/1SY8bsRY58Mlr8elukVaoomo/br/+6b4p828aBGQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022119.outbound.protection.outlook.com [52.101.43.119])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvgdw5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 02:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quehCvCHZ617+ZU5SFYPqy/UA3D78B7homymwo2p9kXY9odrbIWVvSLiR4e2Xf6eFqkMHX5/H1fcKX7MbZyA6eQsGuaC5YrMUVTegmqEWA7nToRieGAMnBt1TUTid5MXwQN3enP0ruwhmNyr9n5yle/2TiwJcZVRGniiYxoK9ZB4LgWaAVGDcbsAp/qFrrwl2m9UK39EqNQbEEsWbOfo1y5iZa+YXSA4jl/EsABEaWpIN85E6CXPSEzjgCDHrb3U0fVG9V8M3DX4kleLDwLsQ7S2EkAUI0B+UtN5bBjDx3ErMaLhC2w/t2kyta0c0dDAj/Zk7paJf+d5R4/+mfQH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUwFUx8FqfH52PT01DuR/tgnKQDCISKXvOZFRamFz38=;
 b=jeRM1MZqmYFSqioRUMvjCPaJ7TYd2kfgswVtcRG7r9900+ZswDZqLc+30RQTOFWQYqFWwiFDsiiX7S3voOJAZpClqMOV8kCS3lK9Z3hEkJxqb9ss4n3P3gjLXENPHXZWwC0juAQQBiaKv/IwaOAlFz3ekl51bXevAQUhhbvOQKw9iDK9Lhvm4CCAu9AlK24Xj4lgV0rpIT0cqfqx5hFfVCuBUhSXClo2GHjNHseCGbNkg+0X9OzXh5BO975IVV3bug+46sPRMWlviKRjfSJTowSGgh2h8UrKq2VIK/pqzS7L9KX/wx5acN+x0Cpk2nJYunYGCNyb4vaUzQpBGPz5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by LV3PR11MB8460.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 10:08:22 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 10:08:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [wrynose][PATCH] gcc: Fix for CVE-2026-125709
Date: Thu, 19 Nov 2026 02:07:57 -0800
Message-ID: <20261119100801.3598966-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: b45e504d-e9b5-48a3-c272-08df46250aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|6133799003|18002099003|3023799007|11063799006|5023799004|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info: O5HEue7yimLw9fscKfsO0nci/H1VDPWJPNK8M5Qp3zyGVXYbTiVN/vNQDjmV2QuNeMiItAUmUAt3nPBTyY9cepTdNJs6qlKubl+j9N9LWL49KcDO3tCq63wuazdZfzdUV66iOechFK/2WARz5tc2AUGsctqgzNJlCWcNYPRyOn0F+G9hRk67TdRz4SjG346t6w/wAB861APh+yEMWRE1Tf6rMqjHqosLKhZWgKyxVhYgwaTGmtiMEfRKDJJKXOvJmUSQhsYhwAz2gjuEcoCC79ws+bC8HbMWoxx1rJ7VMzLGC+yPdfvVXXfJjI3bA7iSB8pO4votoJ0RRXwqx0teYzMPY9FO5didtuWSm6XHMZjIUOm1aU8khLg+t6GusM5YTahpU4F8v/siLm1hUbQ1nvvxM/UPH0X7YA7sH5shO3LscjPgtokuA5FPqS+4oGP3kN24ZK+Ybdc9BdM70Inz9ipzNdSXeA4PT6fLNlIzVwGUW7MWeQ0IC9EZ1dQkGgK5K3tIqsfEBomhWH0GSdywgtlbZcrMiXs/Boof7WwqsFWlf9e3/Z/KSzZ5mVAywPe+iAm1tp/WQwLRSK+muw1Zpt6qBjFmiY4bjhxzXdo4Z2kOZNLsQ2Ids6BxgLwqks/BpkTL7aAgw/bpySfHwL+zknuKGbZamYCcAs7CY4AzaN0IVfvcpARrq+dqFkJmh4zDUhtVmnyvRDVpetXEk99SRdY5/mxMg0GLAPzrvAPRfaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(6133799003)(18002099003)(3023799007)(11063799006)(5023799004)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekE0VW9oYm9mcXJtT1dwTkNwNlFtUy9GenlyOWR4V0NxWEVZNktkNEhWUGov?=
 =?utf-8?B?VGN2WUlYc3l6M3RoWEZ2RGNCZTJNOFRQTERoMnhYMnpvbzBXendpUFRENFg0?=
 =?utf-8?B?Vk9IOWl1ZWxYR1J0MEpKVDY1SUpjV0tBMlVIWjJEZVlxbWZMTnJXTTViLzBh?=
 =?utf-8?B?VVlkQ2ZiVkhjMGxKTm5SVmtZWWllSG1pQVlieWlDVWlzWXdKcW8rSXFBTmlS?=
 =?utf-8?B?dm91ODZuRGxXc1k4NVJqNnpJYkhaRTZxN0lLYTBzTm1vMGU1RVpyZUI2UXZo?=
 =?utf-8?B?WmtQcFFYKzlHVFJqMWFDbGNwRUNUUjMyQStJNkJEU3JRd3I1YTEvWk9XeGht?=
 =?utf-8?B?UlRLL09QUWNseGZTNHFINWlndGRhSENSZ2dSMkM1ZTYwVVlhMXpwMzUxc1JI?=
 =?utf-8?B?Z0hyUmhxQjdYeExzY1c5cm5ZMmY4QmQxOGZEeEVhWUI0OHdtY0xUVFV2MkVm?=
 =?utf-8?B?UExwQjIwdStnVjJZV0ZVQ0pES29RT01ROHN4ZDYxVjdlV2Yrc3VsL01HYmFC?=
 =?utf-8?B?aElCckJzc2kwQmVtTFlwVithN1o1TC9lWHhuYmZNY3pOblNTVXZ3Nk5UYVYr?=
 =?utf-8?B?WjlPUUpaWmFTamNCbnZSb2x2WmMycVpaVUVYdHJsTzBEWmVMZHhVQUlCaHZW?=
 =?utf-8?B?S2UvZnkxcTJXUVlFRGJoVzBKWm51ZGNManBhaEgvNjNzcWdvY2tTdWhLa0JZ?=
 =?utf-8?B?UkVuY3Z5MjZPeHJqS3ZmZlMzeXhPbkNlTFhkTmVLMmVab2FTMEw0bGJ0UUxX?=
 =?utf-8?B?Rnl3T0FPMlBTUVZHdjlQUFhFN0NLOUVaTGN4dFg3bDhETERIZ1RZajBFRHhJ?=
 =?utf-8?B?L0RJQ2VCeTVLNVlaMWFTN0F4alRmMy9vdHd0dlJHK3RGY3lsQVhzS1poaThC?=
 =?utf-8?B?OERNRFhXQUJUQUtJbUhpc3F3WnFJZ05oNldSTWlYQkprMXpzMW9xWDU1R0Vk?=
 =?utf-8?B?alloMy9QVjlLQzh2VVc4SmRzQ2NlTGI4WTJaYVZTREZRNlNXYUI3Mk5DUUJM?=
 =?utf-8?B?V3ppN2JGTkdrUEJVSTBwbGVTLytCZDJDVVNaU2NlSmU3QVBhd3gyaW9WazdW?=
 =?utf-8?B?L2pvREIrVkx4S2Q0aG42K21ITE5NOFV1ZjhtMUtkaXhZYnRlNkJESnNUTENP?=
 =?utf-8?B?U2hTaUJhYVdNUndOTzhGRERVQ3J3Q2lDRFU4bkJpY29VL2JuNlpwckZpQ1oz?=
 =?utf-8?B?SnBGc0VuQ0pWcFdCLzlpQzg0S1lCRHllMzF4Sm1HWStHc2RyY2FmWkxrZGha?=
 =?utf-8?B?UnQvVEZGd251MDM5QlQ1cDdsVldQS1A3dUNTMWRhY1VWdThDYTNaMDBpTytQ?=
 =?utf-8?B?aXk2YjQ5cWl3OXkwM1loSjNuUDAyM0VOTnFhclRzblZhdnIyNWNXbUVpNzVH?=
 =?utf-8?B?Tm83K0VJTTVtQStsRXhXd1gveTlwTXBMKzRLcThDbVoxdkxwUGFuZ2RuMU53?=
 =?utf-8?B?eVhtSjZFR2FmemJjU1hXZDQvRDFkdVF4ZXdqTE9ac3BTR2ZTZmw0WldyeFNj?=
 =?utf-8?B?T3ZkZDNRV0l1U2Y3UDhML0RVL1dzQ3VuaXBTRWdJdWNHZkdoVDJyUTU1cytP?=
 =?utf-8?B?b2prZTZETElobkNKeWJZUmVCNXpQeUNjNEtNNXFLRTYrYW1KVjVqR0JqK0NK?=
 =?utf-8?B?akpkWHVnWGErbjNwRWw4WW1sVWJLaXE4RlhsRGRSQndpc3pOa1lBRzc0S3c1?=
 =?utf-8?B?bWppaGppbWdJRXJxNEwyV3gyNkJxemNic3llZVJSZURqZGNGSUhuaWcyVXpI?=
 =?utf-8?B?bXpCNEE2Mkc3Rk5oaW8xNld1KzU0dHZWMTZ6OCs2VHJpUklQZ0RpWHJaejFt?=
 =?utf-8?B?ZEF3bHdmU2srQWJ3bnR6bjVHL25IKzV5Rm5HQktqNC9hUTJOa3cyMVZyRHgr?=
 =?utf-8?B?eEhMdENmdjIzMFNzN3JJaHROQXl6T2JPRTAvQWM5SENZaU9EQnFieWdsbGZB?=
 =?utf-8?B?Wnl0ckE4YlIvTm1WNTFmKzhTdjc1OWFLZkgyRml0bkVwT0JoZ1M4R3ZXNy96?=
 =?utf-8?B?Z1RzUFhaeGdycmkwK2ZLYkkweFo1dTNYTFhxWkp5THRCWW5BeEhMZUpVU0NB?=
 =?utf-8?B?OWZIcjdrd25td0I2U3Z1Y1k5c0pyVjhpOFRSTHVFNkhoaFlTQ1d3dFpBeWxs?=
 =?utf-8?B?V3lwQ1pkMkFSRjdDNk1nN1pLMjZmS3NLc3JKZldsQXlnbUZXSjY0Z0Y0cHBJ?=
 =?utf-8?B?WWJKWE1CN3BxVjY4RTJST29HenJrajB0enY1LzROSkhGTWRXc2FRNHlBMEh0?=
 =?utf-8?B?aEFGazBzdWpQd1JlR3N5dE4wME9ac0xWSktXc2hVckNYaW9ONjBkMlJkeUJX?=
 =?utf-8?B?aDJGSXZVbXF2TGNkd01MdmdRRVhMM2E1dVlDM1V1bUxiM09qR0dHQUxyYVRz?=
 =?utf-8?Q?f0TOysiguVvgmNJ8=3D?=
X-Exchange-RoutingPolicyChecked: GKprgBTfObIamBvCGDxxZBwLlHYEsiWn8wQtorRnky1XqgZsToOG/XMgKgL/j2sld68CYAU0RCuTnJcEK4w/bn4Uh8BH4J9dXDJYmbPpe+F+EUhgdlP5hWGL1ITys7v+xiOgBJY7Zh2F5RlvwZchef7DmdJJdph9OHkFk5qc75ldoyDN78yJ1JKwYa79SrGq1VOw5c55BLnn6X90TWIIBdWT7BfLB1TbtOg2bNSehFKA09MTZveyYsMMTdQw5bhdao6fTDsyuuygZBADxIAbqYl0STi+/OP33P4sIFm5d/iwYPBtn1aaTi6uIwAjOVwmAsP6LKz3FZQLpF71yIXeMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45e504d-e9b5-48a3-c272-08df46250aee
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:08:22.3402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb5s+whijhiJw5/KJIJ7PLccKz7YDtX75omzWR6wisW1ZFppqf8PLwfVLIgaS505yWqq0hvtpO1cdPhKpFXJfC0bKkGnWhisJWpNccM8xv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Authority-Analysis: v=2.4 cv=EudHPicA c=1 sm=1 tr=0 ts=6afeca99 cx=c_pps
 a=ONh++nyoOH37ENyuzPCuVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8
 a=y3uGcEjebmHySJOeytAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MCBTYWx0ZWRfXyp0Cweb5knrm
 0mxQ0F+Qdfzrx6yNUc/avWYU0Jnlfl1zeP8wXL8yHtTHHwKRgACgQ7E9S7ieDumiwnLm7F4Z7TX
 Y5r42U0UGpKj1v6k/uL7Q4+SuPMZ3lpjpFA7tc0JERoL5Di1QQ7Ta5dkyWpl9kA5xyhLpkqS1jc
 qOPjq7sTVx4R6pkvGdSm89cwvSUROlXmWGayIa474nV5WjznQPU7kQj7uLbmRxpOdOkFCUYtJoF
 Z03/C/p67qeVqSGdG7kg8MG8SrIfDXfz/yLJIekke2zeF42M3jM74972ZMjGfxlIvBjFA9zd/dd
 9tSI8B1I1ezqRJmpmjcvpvSZllnCtwuSBabP7RTg7FO9djpfqc7ab85ZRBz0FtAKTz1CUtcX+Yi
 6apMahESuPn2R4UsfqjBf9DH8HtE9/BpGFdcbg1a9A7yHazAhAO/DlrKTsaa6XiIn4OMZVe8uWY
 YaluJ+cWjmIePzY9qFw==
X-Proofpoint-GUID: gGV_pLkXP-LRjt_aPLUaHk3G68iLsdGI
X-Proofpoint-ORIG-GUID: gGV_pLkXP-LRjt_aPLUaHk3G68iLsdGI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MCBTYWx0ZWRfX7qdk8OWBo1gZ
 K2DhaJ16RBNAQMFQ/SJUNM6G5mfd+fSNcFbUX3bqLcGLeqv/1tVF5sHOiHR4S1qTOvrwhSGfl95
 lCsOARBj2kcyZEy3tymMbowGaI842DF9/R2PlJNMCfUiRK3sb3bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AJ88CEh1603013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 10:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250658

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118099]

If we fail to write the content of the buffer after inserting the
overflow character into the end of it, then remove that overflow
character before propagating the error back to the caller. Without this,
the caller is left with pptr set past epptr, and successive calls to
overflow will write further past the end of the managed buffer with each
failure.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-125709
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118099
https://bugzilla.redhat.com/show_bug.cgi?id=3D2569390

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.3.inc        |   1 +
 .../gcc/gcc/0030-CVE-2026-125709.patch        | 378 ++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-CVE-2026-125709.pa=
tch

diff --git a/meta/recipes-devtools/gcc/gcc-15.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.3.inc
index ed719197bc..5110f22ca3 100644
--- a/meta/recipes-devtools/gcc/gcc-15.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -76,6 +76,7 @@ SRC_URI =3D "${BASEURI} \
 	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 	   file://0029-CVE-2026-102010.patch \
+	   file://0030-CVE-2026-125709.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-125709.patch b/m=
eta/recipes-devtools/gcc/gcc/0030-CVE-2026-125709.patch
new file mode 100644
index 0000000000..3283126475
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-125709.patch
@@ -0,0 +1,378 @@
+From 68b1b9056c70acb31f2964963b51c480ff820602 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 28 Oct 2026 10:34:17 +0000
+Subject: libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR1=
18099]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If we fail to write the content of the buffer after inserting the
+overflow character into the end of it, then remove that overflow
+character before propagating the error back to the caller. Without this,
+the caller is left with pptr set past epptr, and successive calls to
+overflow will write further past the end of the managed buffer with each
+failure.
+
+The new 118099-codecvt.cc tests were assisted by an LLM because I was
+too lazy to remember how to write codecvt facets.
+
+Assisted-by: LLM
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/118099
+	* include/bits/fstream.tcc (basic_filebuf::overflow): Rewind the
+	put position if outputting the put area fails.
+	* testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc:
+	New test.
+	* testsuite/27_io/basic_filebuf/overflow/char/118099.cc: New
+	test.
+	* testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc:
+	New test.
+	* testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc:
+	New test.
+
+CVE: CVE-2026-125709
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3D68b1=
b9056c70acb31f2964963b51c480ff820602]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
+(cherry picked from commit 2d296e9f024edbb49cad1f3ebb5ae34c71ea5f7a)
+---
+ libstdc++-v3/include/bits/fstream.tcc              |  8 +++
+ .../basic_filebuf/overflow/char/118099-codecvt.cc  | 76 +++++++++++++++=
+++++++
+ .../27_io/basic_filebuf/overflow/char/118099.cc    | 57 +++++++++++++++=
+
+ .../overflow/wchar_t/118099-codecvt.cc             | 76 +++++++++++++++=
+++++++
+ .../27_io/basic_filebuf/overflow/wchar_t/118099.cc | 57 +++++++++++++++=
+
+ 5 files changed, 274 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
char/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
char/118099.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
wchar_t/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
wchar_t/118099.cc
+
+diff --git a/libstdc++-v3/include/bits/fstream.tcc b/libstdc++-v3/includ=
e/bits/fstream.tcc
+index 99aa296b83c4..0d1d9491cb6a 100644
+--- a/libstdc++-v3/include/bits/fstream.tcc
++++ b/libstdc++-v3/include/bits/fstream.tcc
+@@ -561,11 +561,18 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+             }
+ 	  if (this->pbase() < this->pptr())
+ 	    {
++	      struct _Guard {
++		~_Guard() { if (_M_p) _M_p->pbump(-1); }
++		basic_filebuf* _M_p;
++	      };
++	      _Guard __g =3D { };
++
+ 	      // If appropriate, append the overflow char.
+ 	      if (!__testeof)
+ 		{
+ 		  *this->pptr() =3D traits_type::to_char_type(__c);
+ 		  this->pbump(1);
++		  __g._M_p =3D this;
+ 		}
+=20
+ 	      // Convert pending sequence to external representation,
+@@ -573,6 +580,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 	      if (_M_convert_to_external(this->pbase(),
+ 					 this->pptr() - this->pbase()))
+ 		{
++		  __g._M_p =3D 0;
+ 		  _M_set_buffer(0);
+ 		  __ret =3D traits_type::not_eof(__c);
+ 		}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/11=
8099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/cha=
r/118099-codecvt.cc
+new file mode 100644
+index 000000000000..e4b1106b9b8d
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-co=
decvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++//
++// Companion test of 118099.cc testing the throwing failure path in ove=
rflow:
++// a codecvt whose do_out always returns error makes _M_convert_to_exte=
rnal
++// throw after the overflow character has been written to the end of pu=
t area.
++// If the put pointer is advanced before the throw (and only rewound on=
 the
++// non-throwing error path), a caller that catches the exception and ke=
eps
++// writing will cause overflow(c) to write past the end of the managed =
buffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef char C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++	 const intern_type*& from_next,
++	 extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next =3D from;
++    to_next =3D to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2];
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt))=
;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::tru=
nc);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error =3D false;
++  for (int i =3D 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r =3D fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof(=
)))
++	got_error =3D true;
++    } catch (const std::exception&) {
++      got_error =3D true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (int i =3D N; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary ); // nothing was written past buf[0..=
N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/11=
8099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099=
.cc
+new file mode 100644
+index 000000000000..2407119dcb1b
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef char C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular fi=
le
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2] =3D { };
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i =3D 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) !=3D std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed=
:
++  VERIFY( i =3D=3D (N - 1) );
++  // Overflow some more:
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t=
/118099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/=
wchar_t/118099-codecvt.cc
+new file mode 100644
+index 000000000000..add23cc99500
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099=
-codecvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++//
++// Companion test of 118099.cc testing the throwing failure path in ove=
rflow:
++// a codecvt whose do_out always returns error makes _M_convert_to_exte=
rnal
++// throw after the overflow character has been written to the end of pu=
t area.
++// If the put pointer is advanced before the throw (and only rewound on=
 the
++// non-throwing error path), a caller that catches the exception and ke=
eps
++// writing will cause overflow(c) to write past the end of the managed =
buffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef wchar_t C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++	 const intern_type*& from_next,
++	 extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next =3D from;
++    to_next =3D to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2];
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt))=
;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::tru=
nc);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error =3D false;
++  for (int i =3D 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r =3D fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof(=
)))
++	got_error =3D true;
++    } catch (const std::exception&) {
++      got_error =3D true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (int i =3D N; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary ); // nothing was written past buf[0..=
N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t=
/118099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/=
118099.cc
+new file mode 100644
+index 000000000000..bcbbd58ee9c1
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099=
.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/=
O error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef wchar_t C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular fi=
le
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val =3D C('x');
++  const C canary =3D ~val;
++  const int N =3D 8;
++  C buf[N * 2] =3D { };
++  for (int i =3D 0; i < N * 2; ++i)
++    buf[i] =3D canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i =3D 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) !=3D std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed=
:
++  VERIFY( i =3D=3D (N - 1) );
++  // Cause some more calls to overflow, which should also fail:
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) =3D=3D std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i =3D 0; i < N; ++i)
++    VERIFY( buf[i] =3D=3D val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] =3D=3D canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+--=20
+cgit=20
+
--=20
2.49.0

