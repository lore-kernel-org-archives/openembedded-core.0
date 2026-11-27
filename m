Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11652.1795762048575060395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Qgz4hQHl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6RFw0505046
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Fs1+q/yxip2o3FoAXAHkAcustaymycCbGI7rciLmNak=; b=Qgz4hQHltz3S
	xGtRzBK0MQ4JxJDdCuHfHlJTNmCuLEYDEi/9TVlilcHYCfvVupRv3XtZfe4Fc7eN
	FuqYHXOWO5GibAjMXXPUOR0AtR9TWFuC0oBuQZ5LNHymVARSuDDN1IaUHn/uDsXU
	p0+dS5KoT+cs1il6+MHCS1iNtw5GAZ7tPIdEZ6M3dOCy8GvQlma3q/RZOGwy775h
	ZbSI7O5TV2xuJICVSsggCcJxMZAIB5WADA2mxQce55mcJo8adSbLwRwELDvQHRcu
	Ryu2u2P30QlLFCIJ7CVAMemea29BbQS6Qz7G4YO7XxIEY5w59zI0faL7S+DNiBE0
	HHRlraQDhg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023099.outbound.protection.outlook.com [40.93.201.99])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wym5h-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGJGLX6D6LYh0EmP0P0q30LKGqGZ6TeZBwwCDKeIsm5gCI5x0x9le/Ppy+YG3/mCF0/QDqQDwy8YC0mmsyIm4KjiJ1tiqvGmFHBHpBOao49bCAWRUNC+Og6cVXV52hZxtMPSyPHmLsu4IzxM8ITAtLtJ3mFGDgns3s25fyLbEvHtY/neyS9LdxlmyNlEpauFwXydgB3IcJEDf9thPTaiax9c8w4bK9gY684rD59ZrtuEyUiAeVSEpYQsX0xHgdL3MJ01RVkEvi3ybE3j36wIuUIGXz0wFfauYJPXKM5SZerHbuhilyAJup+F3LzhES+HKHmqvqliYh6F4BXZ2/8Onw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs1+q/yxip2o3FoAXAHkAcustaymycCbGI7rciLmNak=;
 b=NgF7vbWzp6BbXktiKxERCcpOQxDm59SBwidAb+AlDXrRvPzHDfVDAnvwDGZPOZ0opQwxQoAkveBe3vANZ+00V0+Ohs7uoxfrMCQMiZAXDPobD8lDDwH7ov1JhaPu3eDAWqs28wt/BnaTfUnecqsA268YywjOInzug14+UoCBqSSpJPF084k1qf7jmsCsxopJLyZ+2NNqvpAKHS6oVYwblgNGPT0WhOOCTHKzE+3nh7RWBx6yyWpYHnXPG85+j08sLfs2U5728byyT0PcAhWCsYbX4DyXgoPcsn9h3eaLaacJy6XuwV9EbZyoYcwbnXyJNbX5b/wWWxFDWao7Jb/hTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:26 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:26 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 2/8] libconvert-asn1-perl: fix CVE-2026-126568
Date: Fri, 27 Nov 2026 12:16:53 +0530
Message-Id: <20261127064659.2169695-3-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
References: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|FT1PR11MB780136:EE_
X-MS-Office365-Filtering-Correlation-Id: 827adacd-cffa-41b7-015f-08df4c524c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: I9MdjQEnFSSMD3OvupZVaDBVr8V+eRhHyvFNTq1frDnmb0IR+T4byvrn61ONSK7Ig/a40QeoVFL16qfOsO6FreEwg/bHVRQmDCxkK4vWwWw1k/Qk2E0RR0NaWYg8vuqZqaXtNtwAUhrRaTI7NlWMM/EJUjMwZFNZcXF8UsOG4Z/RYzLBP6NUoEq7X2pIccon58As3snOK0w6sUTbt/79Myq5xtmjRBtRXb7I7ag4UG5L0YW+INdzm76KfUwXMdXhPS5E+IVLE+NrA4SLqH2rAVH+3Rb/nYg/sovIQKJNJsOSmlrTsnhd+8WbccQRxz47yhn5IYJQxdc8LP/u9MT5Gw3Lb3Jx5Wj9BAgzr7EEapnKL5zSU7FIIZNILfA3T+54I9IIaJYpd1AWmUvxXakdRgmuKsWFs0YOJIJ2RzMRxVRSEFIBN8WE3Omrhxs/jbJXQEEA7B4LaOh0afJRuG1xAqEsRApKoEx8C3pYozzjyvFN2796Tu7X9P5Nq8no7KMxouDgMsJC0habBeUBWVlzYVnhCco07ehOCVBZEuV4zJvvy4M4SMPbtINbsLGVfqU6G1NeIjL1xcKo5eMVsI0OWR/IS7dJOhr2NMXjVSFxbDNnJHeZNfp1R6GuqfPlxv/AfK9TIrHU3cS7yixQfq6aH4f4YkQsENmOZ7j3mzNu0ZAfAApbTH0HchXLWDmNh/+7S3i24FzKb+6SJljnDjGnQeTGsFDlRxBGbimeWwXYCtk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alFBYTFRWEY1eURyekJWMnl0WkNxdjVjY2J3MEVsYkRsUDI3VFBQbGs3aElD?=
 =?utf-8?B?QXRwVHFhMFRtZkVkbE9wbzJJd2I5RDNkOXFKeGYySGF2b1FsZkkyZ3lhTVEw?=
 =?utf-8?B?anRvRXUzYkFzQXFvSUZPOUFsZFYvYXF6Q1cwZ2NIc2o1QWxBK2JSL3pMWnFs?=
 =?utf-8?B?VUR2TVJCUkJ2dHlnd0VndVk1OTJVSUVoVHkvS1c0VG0wcnV5SC9MV0xRRkFO?=
 =?utf-8?B?MkwyNGRBVUdHMDVobkpWMzFFZWNkQWRDZGRDZWdpN1lBQnNmL0N2U1F4bW1s?=
 =?utf-8?B?a0I0V3BObnJZYzJ3bzQ4dzFremtDckNSUmo2NHhnQ0l2L1o3NFhXZTZ2LzQw?=
 =?utf-8?B?SVFYR2J4SjZzdzhpcTBhUDZiTS9TKzUzTjFLZ0R3ZXdFREVpQ29sUmpQNkt2?=
 =?utf-8?B?dzhoVnlSWWdDekFxV3NWYkpEQlBnYnJDTWxmTlI0MDQ4L2NRdFFKa3pxMVJL?=
 =?utf-8?B?cTlQZzdaVnlEcnJKcnRyYVBHaFNVd255c3JzTjNLMDdnSnRMWlhSTEdpRHdN?=
 =?utf-8?B?RllHdTMyRHNQYXhBd0dYYnhrMlVQbHVKbloyalQ3WnB0eFVtMVVZWHpuQ2pM?=
 =?utf-8?B?ZlZBL2tDV1hyZWg1bjh0ZFNFRSt1aXNyMG5ZSU13d0tva29JZXErWW9lK3JG?=
 =?utf-8?B?aWh0QkpOV0QrbmJPRndFR3JVcjZuUDJwQk9oc1NaTVBUQ1pNazlyUjJyNjNJ?=
 =?utf-8?B?akFpWVJiUTdaNTViVXJ5clEzNEdxek9kdSt2NkFMZ0ovYXdjdXJ1Rzd3S0hl?=
 =?utf-8?B?VGpyR2RZZDJEeWkzeG5VY2daV0xBUzRJbUFyUFdpZXJhYTMrTy9WSlhyQ0c0?=
 =?utf-8?B?eTBkWXNiWmdRcEc4RkVrOVZuN3cxQ1JCMTRGT21oU3VuKzh2bnVHS0dCTmgv?=
 =?utf-8?B?dlpDbkpWbFJEUDhHS1lURkRFU2RLNVphWHAvU0VteFIvZ0N1Y1EyK1M3RlIx?=
 =?utf-8?B?eUZkZ1c3Mm8rMEJ6cS9jTVBvUmpHQ2c0R3FscmNybUpUeGQ0YXNFTkVaR3lV?=
 =?utf-8?B?c2JjZ25udWlaYUJ6OUVSdU51R0VpNWZZQ2JsU0Fob3I1cjlrcm0rVkFMOXZ1?=
 =?utf-8?B?TitTZzEwbCtPVnBOV1pyNmp1T1JhemMrRXNGM0FMRjN5Nk9SVEJZOFM1SWZF?=
 =?utf-8?B?eWp5MzRwNy9zVFFEeGxoNG5KNDhUWll3VGtFbFR6YnpENDZTdldDSER0dFdK?=
 =?utf-8?B?LzUwVUlGYytKZE5hWjE4cStSNUtGVGFvU1V4aGpybmVKTzJ2RDFSeWNaMU1a?=
 =?utf-8?B?bVA3d28vemFCcVhCNjJSNHFYTWZFb2c2M1lCYzlpYTFqcFZaRWh0anpKZXQ3?=
 =?utf-8?B?U1ZCR0UwTU5qejg1blkrYnNTdUE0RE9wYllIR1RhMXVvZGJzTDNHdGhnQjh3?=
 =?utf-8?B?OHc1TURWMDZUY2grM2tRT1cwTmRZU3EwN1I4aklDM1pHbG1vOFlFWmNCUFVL?=
 =?utf-8?B?R1BYVW1rRjd1WmdqQzd1YXFQUnFLQnNKU3dUS3NXWUJhL05wNzhpaFB0cGVM?=
 =?utf-8?B?MHFOaTVGeFREalpFUWRROHN2NnFta05yc2ZuRVJDeVpWWnBGNUdxanF1MGNs?=
 =?utf-8?B?K2JJMzR6L0h5Uk5hUnpmd0g5aWFEd094OWtweldnZThIeTV0YS9qb2w0c2tD?=
 =?utf-8?B?Qk1QblJxS1M3S2FmVTh0NnVWRlhvMzhhTk1ZNWxXcm4vQXNxMkRiQmppckpu?=
 =?utf-8?B?ZGdadTRKYVJiakpSdDNjY0dwV0NyS0VWdllGZzZjSW1CdE1kdWxud3hrRURB?=
 =?utf-8?B?cFpCTHZwODRxRTRiaVRMaUNIbGpRd1ArQUU1YXlHMkErQTNBWmZvN3ZxL0JL?=
 =?utf-8?B?Mkhrai8xVXYvcUhrcTdNcGJSNmo4Z0FIdnV4cjhYWUhaakU0eUlTRzJnSnda?=
 =?utf-8?B?SlRWbFdSWHBuS1RtdVh3RmdVeXJjVVZXalhhVDdaZFRveG1XeXBYMm5lV3o5?=
 =?utf-8?B?MUYzTEVqOGtrdmdVMVd0L0lzT0RmMERiYVZyRU85SVg4NUx0RjlOQisvUWQy?=
 =?utf-8?B?YWpudFJ3blFHbUhrNjQ0UytuZjRGZHdxVkM1eVlMZW5WTmZla2xWOEEreGFQ?=
 =?utf-8?B?UlVoR2cvK1dwUGxLUmU4YkxjbUx6c2ZjWFpDMU42L2VxeU51YnhkWmRtSkpj?=
 =?utf-8?B?YThjVVlrNkFoLzR4ZVNOTi9QbENEUys4THpkR2ZyRnVvWmdYaTRWNjFrQk1k?=
 =?utf-8?B?eXFMY3BvUElQWS9DeTdBTlFINnFQOEtWOTBvV1RRNVRGdUZtTXRzTzNtWFpv?=
 =?utf-8?B?dDV3SXN2UnpSbVB4eEtxamhYTWNXWEpoazlYV3RwWjJwL0hsT2sxR3QyTEFx?=
 =?utf-8?B?VktqdzJ6ZzZzTnVkMXVaUEZjcDJ4ZkFWdGowdlczQkVUR2dSZ3hwWkVSMFgz?=
 =?utf-8?Q?bqU1Znptn94WI3Og=3D?=
X-Exchange-RoutingPolicyChecked: YdHtspxRTxoDzHlQU15cpThwvq0eWWcl7OZuLo52qcDy6//z+VYK6SIOf9oQtDqDe6U5E+WS1VpGTCEhWY196DDuyc1uBPflSO+PE00vbY6JehBwObpW12deEAxPdzXyHLIu6qVb63PYLAQ8+Sw7f6kmhOoXnmMVXN9AgSmCbMA7TFY5T0vMbfhDwBhGMV17OpMutL8+S7Fggbv43X0koVXDLQ/7BgEkniR2FLLFdKrpDfnFD7V7uhsuLzg7hfpCH8+eesL63QU94c/MnLq5OfylrP29Pz2lADuPHS7RjbS3Jqy5SlgbdBuVKHUnGSZkBdtXeOV/JWkrqvjlipJM0A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827adacd-cffa-41b7-015f-08df4c524c3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:26.2624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2jgzt3w/C7jkdiz1u2xaStXlbjkdL9v741aOE3GX9q3Gwc6GzMiVteuKZoFVXzPB9IkkTSP33I7yqPmyDu2YbpgTkTBUE4lgpVC4OLIlOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Proofpoint-ORIG-GUID: yGjnzd8Jd0ujE9VLfALGHS0mWakRBXak
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX1SFzdESK1gwy
 JB3mgAEKMIAB3BHukkDR1Zn/0HQqG2iY9ZJyRjL1v+ThVswFB0NBXsrcEHemLMwtcHgIYRueczV
 qPB5wtMgnirBRFyNk+IpHH5OVJP5nFC0zkIliuiVuibtXbjM48AE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX07GMoMi4DK/K
 89FJmIERZAs05aJyxFGbXfR9EiyVnDpeb1M9+hHLAqjodj6ROVJpKn5K2H07JvmctjdoxTsVN8q
 sqGoQFeA+CY17s+7gORPOgLJ1ff8ROhe2wZUvnHbjNUbaeHDEqk2FWKkHt3V9D+kD9TdNv2bhCD
 jAwvx5y8G6OXBhYTkF/rAVUWSnqLt/DPgbg24e9rCJkFxJ02TCCnxImvQq5bNWA/dlJqvRMI+y0
 515x11eOlJ8QyGLy5VEQLU84d+lIhHMNTOJfzSc0Tq1zq2HVnUMJ+VqGmedk3PLcBLS4Xk67wpD
 crSaDGrlluhWZmUogwbZQ+BGYKmA+V5o1Qa1CEdCHVvmNvtwxJW3W/NY87yAsSIqbt1lY817tgu
 qXVKUV6w96zg6amLikSGssXPJjD6ybZejOub4AxGBaq/UOk32m+vBqe38VhUIklU2sTw+atJXci
 1Tsqj3Tq0wuo2zZW5qQ==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b092780 cx=c_pps
 a=ajv5h6Eily4lkhfMD1AUMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=1XEwo8SM1LyFxscmbgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yGjnzd8Jd0ujE9VLfALGHS0mWakRBXak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6AR6RFw0505046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251346

Convert::ASN1 versions before 0.37 contain a flaw in asn_recv()
that can cause memory exhaustion (DoS). A specially crafted
incomplete BER message causes the receive buffer to repeatedly
double in size while using MSG_PEEK,eventually consuming all
available memory and crashing the Perl process.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-126568]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/a30eae1dc6a9777=
16b76f79f228fa0432e28bc5a]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-126568.patch                     | 88 +++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2=
026-126568.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126=
568.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-1265=
68.patch
new file mode 100644
index 0000000000..82a9fad622
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126568.pat=
ch
@@ -0,0 +1,88 @@
+From 0b9240ff7df48916d4ddcc13d61de4a1d3f8c31b Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Wed, 11 Nov 2026 02:00:09 +0000
+Subject: [PATCH 2/8] Fix CVE-2026-126568: asn_recv OOM on truncated or
+ oversized BER header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix || =E2=86=92 && in the tag-decode guard (|| bypassed the need-more-d=
ata
+branch once any tag byte arrived) and add a missing else branch for the
+incomplete-tag case. Both caused unbounded recv buffer growth until OOM.
+
+Peek for the full element in doubling steps instead of calling recv
+with the declared length, so a complete header declaring a huge length
+no longer makes perl allocate a buffer of that size.
+
+Document the incomplete-BER behaviour in the pod.
+
+CVE: CVE-2026-126568
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-=
ASN1/commit/a30eae1dc6a977716b76f79f228fa0432e28bc5a]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1.pod   |  5 +++++
+ lib/Convert/ASN1/IO.pm | 20 ++++++++++++++++----
+ 2 files changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/lib/Convert/ASN1.pod b/lib/Convert/ASN1.pod
+index 4eb4a5d..3e9614b 100644
+--- a/lib/Convert/ASN1.pod
++++ b/lib/Convert/ASN1.pod
+@@ -236,6 +236,11 @@ of the peer address when the socket is a connected =
socket, in these
+ cases the empty string will be returned. This is the same behaviour
+ as the C<recv> function in perl itself.
+=20
++If the available data does not contain a complete, decodable BER elemen=
t
++(truncated tag, incomplete length field, or declared length exceeding t=
he
++datagram), BUFFER is set to the empty string and the sender address is
++returned.
++
+ It is recommended that if the socket is of type SOCK_DGRAM then C<recv>
+ be called directly instead of calling C<asn_recv>.
+=20
+diff --git a/lib/Convert/ASN1/IO.pm b/lib/Convert/ASN1/IO.pm
+index a9cdaba..5284d06 100644
+--- a/lib/Convert/ASN1/IO.pm
++++ b/lib/Convert/ASN1/IO.pm
+@@ -46,7 +46,7 @@ sub asn_recv { # $socket, $buffer, $flags
+=20
+     # If we can decode a tag and length we can determine the length
+     ($tb,$tmp) =3D asn_decode_tag(substr($buf,$pos));
+-    unless ($tb || $pos+$tb < length $buf) {
++    unless ($tb && ($pos+$tb < length $buf)) {
+       next MORE if $n =3D=3D length $buf;
+       last MORE;
+     }
+@@ -70,13 +70,25 @@ sub asn_recv { # $socket, $buffer, $flags
+ 	last MORE;
+       }
+     }
++    else {
++      next MORE if $n =3D=3D length $buf;
++      last MORE;
++    }
+   }
+=20
+   if (defined $peer) {
+     if ($len > length $buf) {
+-      # Check we can read the whole element
+-      goto error
+-	unless defined($peer =3D recv($_[0],$buf,$len,MSG_PEEK));
++      # Check we can read the whole element. Peek in doubling steps so =
the
++      # buffer perl allocates is bounded by the data available, not by =
the
++      # declared length
++      my $ask =3D length($buf) || 64;
++      while ($len > length $buf) {
++        $ask *=3D 2;
++        $ask =3D $len if $ask > $len;
++        goto error
++          unless defined($peer =3D recv($_[0],$buf,$ask,MSG_PEEK));
++        last if length($buf) < $ask;
++      }
+=20
+       if ($len > length $buf) {
+ 	# Cannot get whole element
+--=20
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/me=
ta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index f4aaa4f579..f4460bf324 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D91;end=
line=3D97;md5=3Dceff7fd286eb6d8
=20
 SRC_URI =3D "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.=
tar.gz \
 	   file://CVE-2026-126540.patch \
+	   file://CVE-2026-126568.patch \
 	   "
=20
 SRC_URI[sha256sum] =3D "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e=
8e3587d7713e4ee7"
--=20
2.40.0

