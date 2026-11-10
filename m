Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14348.1794291392723746443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sM52kSep;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5774fcad27=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4CNAn3615102
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FcVgbpwW7oGjMptgcMkWKeBEE9KWfRfjjQCx3//JJfU=; b=
	sM52kSeptovTOBNpP5vsJWR7NLPFBclkd7e+EtaOyS2knxH2qD4ak1dXZDNap9Dk
	6KSXARBH9SmthRM+GHFCnjeiNqsvETMVqyRa4Li1/e/kDasMM40D/VdJVO9vsT9k
	+23Imz3t9nJBEQM1Wc5DTl6/Up4ZBZUBTifom9yW9WiwTGkUjLAWAPty0NEEQHvH
	mt8mJ9jXfk0/XVH2P7/Sa0PavcIbbh/gYBNf1QAVbJkGqPQ+mgnSWBNHhsOsm20V
	YJ6uda5xMPz+Sa1Bi1AxmsKlafGqnBehqWqn5tiTX+EzPUnMqffBKFw9BRPX+/2s
	qBWCoGPpOwp4fIfdoEtvNA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020087.outbound.protection.outlook.com [52.101.85.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hss70nnnt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 06:16:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+x/HUZYPReatzNMT0f8/+juwQXURjHKxrZPc7I1t6FipgBo0k7jqvyZdmwT5eC4x9u3vrOI4SNfZhLUuNrXR3+L1wlomnrSlD13kLVrb2Gv08hy7sAG/dxmaROBJOZBF3EMXFAOUbrl1t6gjWABOmESaZAr63Ix9xSiCY4pwoY0hMY1pJ/yvfTpo1BkN7K9GzR9vf+owt8drK2mw9z234fZY/Ztb69A5qKJrwCEsBoI7hWmMa0NfP8C6LoV+/rCTuJiyqSPGjMPYCiL+udCuyRQ+Lz1EAVTuDiQomothaX/YdXQHE4fxD+hLBcZwTvqZ7077QhxlewTNpfEInjKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcVgbpwW7oGjMptgcMkWKeBEE9KWfRfjjQCx3//JJfU=;
 b=JsorB4YUAHq8+eIEyAnFOhFnQLVFhZhxSVqS6o7P96OsG/5d8pBfIf241kJM0acg4MDpppCc11FKPAfO4UaaHwWG4vW0OyQ8PnHvDmPFmA+upsMnndcdgRrJDjlHMMyguhdMsu5hTY8QiyzgNAmIHiNRKg+qCESeFEhwdKbo4JMt67hwzq3PHuS4nvetZ5/6MuDLnpvUI8eEjPCa6i2B2As5SQc6oAhc7A/5YqZE97bA4cmj9T6oRFYgJ02m/qod1zeNEk7Tw/5a7jdOn16AcluYKslZFpeuEg/ZXC5KCmvJEBGkEJaQ7Ywxd9bb1NhwBHSBiu1+B5aWG8Ar+dewsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:16:28 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Tue, 10 Nov 2026
 06:16:28 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, sunilkumar.dora@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH 1/3] clang/llvm: Upgrade from 23.1.3 to 23.1.5 release
Date: Mon,  9 Nov 2026 22:16:06 -0800
Message-ID: <20261110061608.4043909-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
References: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 43be31d6-25d6-4263-5508-08df3ef227ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|261009220027099003|261009221227099003|261009221727099003|261009223327099003|261009223027099003|10067099003|3023799007|261028144727099003|261022105027099003|261102130727099003|261102124527099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|38350700014|56012099006|11063799006|6133799003|260925022911599003|260925021911599003|260925021311599003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AblT17bZVv/hk+e3dciBj+Oy+44BQvAQJPE7Yv5Vf3ce104yD1i+7AmOpxfDMdU8UruO4ASVq9XG8SLwyp49gK5P9rRcmMH2FVbpLhKsGFf0Ck9DuKZQ6zGLou4xwhgv2PTY1SzJF3BGif7wPQOOrJJuF27g+WlHfnkHCpRqmDpkXgC8Z8tTzp4kfrI6rsBbHn56/wPUaa1KE9Kh44E0mIp1tBPDGcn6k6T0UDES6fL9UO+gqYpG9/VYKCFSYbmUsJrrINfQ/0qXBksawSUghTiPDyacSOFnBs1sU17rV38K+Dcyw1Scd7zRrD3XqDme9M+9kjuDTOzb2rVqBv9QStHwH7jHEocIQfAtuQwQxVA9m9Us8lagy8lt/Nlng3VBbXphHpIzknhMA7pSFWJl+nUqFuaDwJdwgQH+wIYZ/FhO97KQcKehz+VtRp/HBzdRxR6Musr52WINJxUo0f99fxjcsG1nMSm+yUiBQoNEwgy7SU6f04+dNrnzfmU99lQPvq+Fib6f4u2kkE01PHS0V5A36zt0SRsaAD8P/R1fHDB93G3wQ8MCOJHpTBbd87b9K6JXdaGXgiW+2y7qrGgqbrRK90GznNQI4/MIYxt4KXy/QNrUDNebUEdyC+H35FuxGaM/nP3ZwjTKekVHy0Gx9BcqL9i98rDlGr/TD3RHFvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(261009220027099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009223027099003)(10067099003)(3023799007)(261028144727099003)(261022105027099003)(261102130727099003)(261102124527099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(38350700014)(56012099006)(11063799006)(6133799003)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlsVjNKWUdZcmpIaC8rRFN1TS9xSUJpZGxnaGo0d2VNc0NaUEpHQ1RWRVNy?=
 =?utf-8?B?V1d5VzZlWTFUeVVaRUd2WUVvWFZEOXdGdHhXdjZBaStHdHZmOHd2bXFjT0lB?=
 =?utf-8?B?cDBLSE9pQjh5cVFiNVlybzVFR3BQUmNTRmVzcllYRHFWTjlyL0c3Wno2a0FP?=
 =?utf-8?B?aEc3dTUxK2JxQ2t1R1IyR3B3ckhxN0l3bE5FdlQzODFRaEhFUHBHcGl1ZUxE?=
 =?utf-8?B?ZUNqOGVLUk1Dd0Jsb1FQWVp6bGtwclhQZm1rdi9MZ0xRMzNwenFsMnUzTllo?=
 =?utf-8?B?d0hhY0c1K3pWZUJhdG9aUDMvTUxQRW8yNnhFNkFOKzdTL1JFSXNpbjBIRXhO?=
 =?utf-8?B?N3dwcGNrNEw5NlRsTWxiSS9RRjF4S3RsSVdRdXFhTTdtMC95aFZXd2RpK1p5?=
 =?utf-8?B?Z0VRZndUL3JJMUtyYmp3T3BhQnd4VTh2c29tWVBELzY0US9sMUdGd3lpQWwy?=
 =?utf-8?B?S2lyRllFdXFHd0JLelpjQll2OFNYVkljZkZ4N2RTRDYyOUUrU2hhSnk3NjVy?=
 =?utf-8?B?aXU0bUR0UW1YdkxMNGN6SDZhME93VmtxaGEyTFNKbXRIM3ZIK1BzYzJPeU16?=
 =?utf-8?B?MzhkUzJxZ3pYRHE4SythRzJIUU1lV2R3RHZoaUtGRnFVSnZjRUErZ1R2c0RX?=
 =?utf-8?B?YjZiQk9wN0JRZlRmWUduVHlPanZSdWRmOGN2Qm4wanJvNEQ4bCs4VFpia2hh?=
 =?utf-8?B?VFpUbzgxNDdBL1ZMNEhCZXNobURrT29qWDNIMjZCS29HcFprbWhkbnNWS25L?=
 =?utf-8?B?YUNvcHpEeE1kdEFnRWVJNlhCMEVYRHhocUVKZHdTS1NUOTdJdXZhU0hnM1Qx?=
 =?utf-8?B?cEpRckFzUlhEWVpyWnZFZVVYNFRoQUVUNis0MVRBbjZacE1XQjdkbDF4aSs1?=
 =?utf-8?B?UXpwM0pzd1ptaG5LOU8rMTJKNnUvMHR4cnpOU0t6dkZVMTJhM2lnL0pHL2RJ?=
 =?utf-8?B?K0JDSmJhUU5LK3owRmFmUTlsWng5bVp5MzJUWEY0bjZmM1RpQUhGTnVicmpX?=
 =?utf-8?B?R2k1UDdBeHVuTU5ST3lmWUtZbnJUNURBUUNqQ2JXckRKZkcyWkR4TXhuZkQ5?=
 =?utf-8?B?L2x4TEpRMGRvWUl6U01Fb0U5bUo5K0NVdmlnQjVCaXJxV2RrenlGaVpUMGN4?=
 =?utf-8?B?OE5JQTJRUUtZMEVmUlJCNEZCbkpoLzJwdW0vcTB0UEdUeEM4dStiOUlFV0Mz?=
 =?utf-8?B?S1hMa3NHVTRtK0w5UGhRSlFyRzRLeVBXMjYwSGhRTHpUSXZWZzJnbmR3dS9G?=
 =?utf-8?B?eHZFRnhJSm9LdkdKUVloMDIxdTNmeGh2NTFaMU8xMDYwMXlwUUZUaXU2S01a?=
 =?utf-8?B?Vk9jVWpFNFhNckNyY2FQUGoyUkJuU0cwTmRlczh1cTJabkVxay90YjZYbksz?=
 =?utf-8?B?YmFJUE5BdUpmd2c5ZTBRTXJoemZVanFnRkJIb0ZSUTdXSmhSRXM2SGZuTzd3?=
 =?utf-8?B?bVp0YmUxejZ0KzBydVd5OFprcWRpS2hCU0NOTlJXeStEaUJOUVVRMkVldUZD?=
 =?utf-8?B?VC9jVWRHbEFqenMwOVlxdE9hS1VlVy9tQ2FVZXJnOWlZSVNNVWZlOGdYN0xD?=
 =?utf-8?B?YkgrMmltcEdmR0dxdUNMYk9kSC9WdldjNytHUTBNWEVkOE9RQVZ5ZlRyNzha?=
 =?utf-8?B?bFpzL0RHU1E4emxqQWtVVkxwelpDNWphbkIwU2QyVHkwSENIZFArd2R1SXlj?=
 =?utf-8?B?cHlqMWxmV0JYMWtqOFBlaEZEcmNaRUt2cUdsbUd6dlp0MnA0ZnMreTh4N2xj?=
 =?utf-8?B?MXVFYVAwVHRlYnlXWjBWUmJNZ3NwMEh2LzVhTFlmM2ZJcUppTFFFU2p5clNC?=
 =?utf-8?B?WGpjVC9MQklaUjE4Zm1ERjNqMXlTVS84aU1zQ0N5WVl6a2tBNDRHNUNjRkc2?=
 =?utf-8?B?VzhQekl4T3hFNmk3WDRVZ05XOG1xTG9xM0tFeDlnM29NSk1Gb3BiMGNTemRL?=
 =?utf-8?B?c3BpVU02Y3dLVTBJNTY0bFA2QlpPR2lPUnQwNmRDdVhIN1djWGNZc2JRRzlu?=
 =?utf-8?B?bEtuRWpyRGdSaTZpMVc5b0NqZkpER3F2U254ZWdCY3doNjNKUjIxbFE4NnM3?=
 =?utf-8?B?US9RbHdDQ3BhRG1id0liR2F3OWlqcWdKcTZ5bmVhTGkyTW83ZktFMFQ3UXBJ?=
 =?utf-8?B?bVRWa0pSZHhrMVB4S2M5OUNhTnlFd2VCZXhUbzJQQTlnZEN1aXQ0OUwxbHcw?=
 =?utf-8?B?VnlsK1pVMlNPMHZrL3VqS3I0eG5lc2kwUDlYL0NoZ3FyTEFJeWNWdUhsdU5H?=
 =?utf-8?B?QkRIUmxzSisyYzloZW9aaDJsdTErZmF5WVFLTzVQVE5NMU9RaVRHZTkwZDdv?=
 =?utf-8?B?b0hlRWZtTmtzTWdCcHVrWmhVNllJWHlqWUp2ZERHWTliYXVUS2ZpNk8rbHV5?=
 =?utf-8?Q?h4gJ4xsoInw3OGvs=3D?=
X-Exchange-RoutingPolicyChecked: O8UjHAU9K9TlecZgXHEhZ48pxdixDEinZ/eDTAaXdl9D1CsAnLJkq7j85+Um3MgKRXolndn/n1AJZOe0H2IuLFTITgojuQd2VrNXtrDBk/ZQTjwQwceCPnZjliN+V8LFJbXHveZMgVctK7TLDZjskXqcKVCsAFkT1KJPzKHA2M7YPsa+jcefPJiqkmmetK+EMugbX8WFatneL2dooNTqkyysYimHPxKSFo2ce8tuF1EncG9+w2Yfma9jP5dxFSqsZrWe5WoNbspMFnhYSyKTxgfU4LidbVX9OnQ7L4tdcLzGOjGNquWD66hh6qvdOSS7JV1dg8OTdljdp7EgVU0xow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43be31d6-25d6-4263-5508-08df3ef227ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:16:27.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JanLIHOTmMGvM1iuXRWudoKGx1RnRLh7vQVS2UUfHsO65pxL3j/VKpofzVat2ZM1VVKvyUEdlg7YFbwU96Ru14CZkB/pcqOP2E5xsI0k84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fvlJ914f c=1 sm=1 tr=0 ts=6af2b6bf cx=c_pps
 a=R61xy7Sxgg6fOHg0EL+J9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Twlkf-z8AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=UKD4_kTtb-jr4eyNh_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX6FtMVH9PXjww
 HQQS2e4QjPu+H/6OPiyj4o1lrozkc+IuPmLlal1Y6/KBKfHnSPrhCz4pTvIQBK1wtGvYbHFDgMJ
 yTz0sKDCFUZ8RnPE/ExVTLRzlA37wPtynRmFCwGuwIHVpxUeuk+iOVKcrAiR3v3wO8IZmPnM9PG
 6gXuzYLRYL62YdunWAVrYAw+9u1qAq0iGAxVVmc4nKXC0CADiwahZhSVOYPBv8qPcOyz2xGYwAF
 mstRlrB//XbNOxMy6FtsetX99UPAvwdhJZPtlbwC8GN93BGLtWxK6J3tICrJIJKoLMKghbs7Vs3
 nOUhEmVrQKiqz6wAZRFf9b5G5xQvN1KeATsUtfZSK1Tir5Cx0Cq5XRw5jUmucNTqWIeo1zJcI+B
 j3lAbtOgTCK9CAS3yBNEfBoHE4Hb759gJi4MZvJ/qjySYooxfYLwJa6IO4sM7m4ACNXRjcuiyrS
 E+0Uie6SV5wLlMs6B2g==
X-Proofpoint-ORIG-GUID: 83bRk2zUxqcf8dBQzJnvCSSaXLqAJNIW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX2gCclmv3u3gA
 Wa5y6HplyTxtdr71a7TN9GYLnT2JgWvLGcjXF/6ECzF9J7o6rudVRY6PLgDO4v0vGEg1mRd85fU
 RhqdFVDN3H6BK1Yve9kMpulj1HlW9MeoHJ380izCjloK6Em4LUnT
X-Proofpoint-GUID: tdlth647vGdvN701ucXW3TeJiu9VBphk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AA4CNAn3615102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249901

From: Sunil Dora <sunilkumar.dora@windriver.com>

https://discourse.llvm.org/t/llvm-23-1-4-released/92564
https://discourse.llvm.org/t/llvm-23-1-5-released/92716

Brings following fixes:
392dfff97d29 [clang] Add release note for EmitDeferred re-emission fix on=
 23.x
8db94f824874 [clang][Modules] Keep existing global definition on type mis=
match in GetOrCreateLLVMGlobal (#223877)
32e470fa5c45 [Clang] Don't skip lambda constraints when substituting type=
 constraints (#236425)
20eceee39e49 Test-behaviour-changes from the cherry-pick of 46965cf.
b10c62b2d995 [VPlan] Don't merge allocas across lanes, parts or recipes. =
(#229929)
86fe084e4c5a [LV] Add tests showing alloca miscompiles. (#229911)
a738f2737189 [Clang] use `SubstConstraintExpr` instead of `SubstExpr` in =
`Sema::BuildExprRequirement` (#236286)
bdeee0d0397c [lldb][OpenBSD] Fix sysctl usage for process info (#122534)
99001e325442 [RISCV] Correctly restore libcall CSRs with SCS
ce24d5069509 [RISCV] Ensure Shadow Stack checks correct RA
5e1a49c5afaf [SelectionDAG] Don't always use abs(sub) when expanding abdu=
 (#235043)
ecf9bb207c8d [Allocator] Cap MinAlign at alignof(max_align_t) (#235373)
8ceacf8097bb [VPlan] Avoid recursive-fan-out of usesFirstLaneOnly (NFC) (=
#229130)
94467edd50bc [flang][OpenMP] Fix verification of REF modifier on LINEAR c=
lause (#232367)
093145f1e207 [clang][Driver] Fix libc++ include path on OpenBSD (#212979)
7ddf6cc19e82 [TailCallElim] Drop poison-generating attributes and metadat=
a from accumulator (#233527)
395ba2c4d274 [CodeGenPrepare] Drop poison-generating flags on extensions =
in optimizeExtUses (#234134)
5c71313dd978 [LoopUnroll] Invalidate epilogue exit phis with new predeces=
sor. (#234202)
f8bd9523ff44 [LoongArch] fix more `sitofp` missing instruction issues (#2=
34143)
1f43a9242e76 [debuginfod] Abort cached file stream if request fails (#232=
038)
2cc5b8ca55a1 [flang][OpenMP] Ignore DECLARE_SIMD and warn about missing i=
mplementa=E2=80=A6 (#232712)
fde947fd5839 [VPlan] Split legalizeAndOptimizeIVs in 2 phases. (#217765)
b2a8cf23b941 [libc++][ci] Retarget the ARM BuildKite runners (#224107)
7a941dfb2877 github-upload-release: Update script to work with draft rele=
ases (#229909)
4635269e3782 [X86] Fix constant vector i64 signed div/rem on 32-bit targe=
ts (#229244)
524ac171cd43 [GlobalISel] Drop nuw/nsw/disjoint when widening a result wi=
th G_ANYEXT (#218558)
fdf44b31a63e [InstCombine] Drop poison-generating annotations forming min=
/max for clamp (#231537)
d5f50fc559a2 [Mips] Fix symbol names for private functions in relocation =
hints (#230572)
52e90e1917a4 [Mips] Lower calls to private functions the same way as inte=
rnal functions (#229975)
d5ff1316673e [clang][bytecode] disable tail calls on mips (#229679)
41042adf8339 [ARM] Fix miscompile in MAC for 64b values (#231702)
6c859967be70 [SPARC] Lower dynamic v2i32 vector extracts on 32-bit SPARC =
(#222348)
71c76755a8ff [ELF] Move layout-changing transforms before address assignm=
ent (#232189)
d946f7b2b214 [PowerPC] Don't let optimizeCompareInstr define CR0 while it=
 is still live (#220999)
a5eac6566485 [Clang][counted_by] Load the count through unions by byte of=
fset (#228309)
beb6b7dfae46 [X86] Don't treat vectors with elements wider than 64 bits a=
s immediate-shiftable (#228840)
0cd28174a1f6 [SimplifyLibCalls] Fix ConstantInt construction based on cha=
r (#231159)
d66309da4d8d [SCEV] Add missing scPtrToAddr to getCastExpr. (#211899)
94ae4f86b8f3 [Passes] Run MergeICmps/ExpandMemCmps in LTO post-link pipel=
ine (#230562)
7909311aa6f3 [Mips] Remove experimental warning bits in a few places (#22=
3230)
1be9d5eb62e0 [llvm-objcopy][COFF] Keep COMDAT section definition symbols =
when stripping (#228783)
8451016186f2 release/23.x: [llvm-ar][GOFF] Implement symbol attributes fo=
r GOFF archives (#214528)
1b843902f5b4 Change release notes wording
ca0b6a823a5b workflows/release-binaries: Improve Windows installer (#2204=
14)
5177329b802a [Windows] Export Registry<T> members and accessors for plugi=
ns again (#221296)
bb46d66418b9 [X86] Don't double count the interrupt stack alignment push =
in StackSize (#224029)
15d373104a6e [GlobalsAA] Handle self-referencing stores in `AnalyzeUsesOf=
Pointer` (#213631)
705f593fb506 [AArch64] Restore always-inline behaviour for incompatible S=
ME attributes.
bbbf266c78bf pre-commit test
195209c5c105 [SanitizerCoverage] Don't create comdat for unnamed function=
s (#228959)
3dadaf417121 [PGO] Fix PGO instrumentation for selects with poison condit=
ion (#229002)
370eb8ddac24 [Mips][FastISel] Also add low part when materializing privat=
e functions (#229717)
d7cdb9b24351 [SelectionDAG] Do not flag undef bitcast lanes as known zero
13d7a167327c [CAS] Close the stderr temp file of the out-of-process valid=
ator (#226844)
affff9cc58ab [llvm][Support] Use ::closesocket for native sockets on Wind=
ows (#226613)
8e044a8f3ada [NVPTX] Set default value of nvptx-allow-ftz-atomics to true=
 (#206154)

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index ec7a93562e..72dacce3b4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -484,7 +484,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashf=
ield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.3 =3D "Khem Raj <raj.khem@=
gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.5 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-logrotate =3D "Venkatasainath Ravikanti <venkatasai=
nath.ravikanti@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index cf93fd0f62..9eb253d165 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
=20
 MAJOR_VER =3D "23"
 MINOR_VER =3D "1"
-PATCH_VER =3D "3"
+PATCH_VER =3D "5"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX =3D ""
=20
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index d1b784b450..dc1f8a7d8c 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/downlo=
ad/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] =3D "c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014e=
cc4e7e211d31ee34"
+SRC_URI[sha256sum] =3D "fb50b1eac93ddeb3aa8dab4cfe324dff74f4a9c2bdee6160=
c9e36188f8d06a6e"
=20
 SRC_URI =3D "\
     ${BASEURI} \
--=20
2.49.0

