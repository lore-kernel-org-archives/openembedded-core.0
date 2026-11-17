Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18820.1794924813196418243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 06:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AOWOJabK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5781a53026=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBx3451075809
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 06:13:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xNUO80NmU
	N5A9Jwyl2xMsKtVVYvGt+NhEUBJiLXg32o=; b=AOWOJabKBTomxJinoLe/DzfVu
	kIm7c8iJ9QlzHGl927iCyM1E/vPNiq0SVHFi7CKiWV993/vAm+GL0nGbH8/zaoML
	Qzguhy/nuv7Dn3FCxBIALKZC1fDMeCxZlVDh/QOLuTI18d0mD1OCA8wxokl7gyvK
	DJHXxGsyGSmTWi6m/nLVrUFVYoybs6sV9oRWgVhMEFbdm+opAph2Bahn4rNxprNP
	rlpf2KVPSt5WPHE33GR2H9WtEFIqruiOXTOC9UETlMqZKRwwI6x23aw3zR+IBTDK
	x4TkmUh/M0lq3o+QpjIjQn1ee0/RAmwRSqTGTR7io9Wjf2W74/2JbEefp0+Mw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022077.outbound.protection.outlook.com [52.101.43.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxr1h4mbn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 06:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F98EjjD7rf43B/YkUQ+sKoqSEJ5hxK/ivZZFixpm3kqyR6Om701j6JPYiYse2lkf1fnTHguEKiisM9t8cBkCN368S7IlJ94UM1+zMhXJs77+MDUOz70+VMCEns46YYqw/waCXLE5G8vhHFw+D4pJ32BgAYhGAJ9ZKOGFA/bd5mZBga7ohRDpzEcbubTj2ZXFF7YKct3HQmVCuSab94fUB+ZL+0MCx9b5AqQyfsikqim5yHA0EXTTaTw9YWdNGnMXIXv3WYdDgKdlJ/3JGJX9NrQTkS+oakBLCqt2PD8/2kHz9RkLhPk+QfU6nMLQQd+GUW40BJSgnfs1dIFUcYlG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNUO80NmUN5A9Jwyl2xMsKtVVYvGt+NhEUBJiLXg32o=;
 b=PQGWsDXF2nx0VQMCJJLAee+XebRpIZB8dhjzuRi9YDgPsfSITdnNZCYk27n29161LFpmOnyUBHWUB2KCtp28WRLKTXjZMNeTTqkiJEqizacZoPNWtstkJXJG5LXshL9bixlH3YHDBpi9OOVGo8oMMxStNM9WA3qWFxDpE9wAnrqxdMPg2PcQn42GCl6K5LySVUFDOrdZcyf7VuAHTe0hPqwTTZ22FHPm2z76sli170aULjMfwjw2uyoPWaKCdlpdLdy3Co3r7oRHF7PFb4rdl51lCZEAb5m8gElh1wixUshEk1BcvOKozT0xP+mhDjqgwG3pOfBB7s0JjDDuh+3Tvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:13:27 +0000
Received: from MW3PR11MB4571.namprd11.prod.outlook.com
 ([fe80::3fec:2722:27b1:67f9]) by MW3PR11MB4571.namprd11.prod.outlook.com
 ([fe80::3fec:2722:27b1:67f9%5]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 14:13:26 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH 1/2] rust: Upgrade 1.99.1 -> 1.100.0
Date: Tue, 17 Nov 2026 06:12:54 -0800
Message-ID: <20261117141300.2193043-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To MW3PR11MB4571.namprd11.prod.outlook.com
 (2603:10b6:303:59::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4571:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: ada0cb13-a678-490f-0196-08df44b4f2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022113327099003|261022075727099003|261021135927099003|261022105027099003|261021123027099003|261021121427099003|38350700014|11063799006|10067099003|260925021911599003|260925022911599003|260925021311599003|56012099006|18002099003|261009223027099003|261009221727099003|261009223327099003|261009220027099003|29003799003|6133799003|12006099003|25016099003|261009221227099003|3023799007;
X-Microsoft-Antispam-Message-Info: TpfD7J3aULDutZXzo89/Bj7o1pacRJTmkwNAP6/grmLSRkkOkqKn/8zSoKDfbcwSvwrUv0RuHsxDouCWCyHCcHkhsBa8UwCVVpHdQTWSyWMmRrtdjhgKs80wAHV02hiUb2X2UQt2eOkTvI1BaNgt/vzxnac2ZKVFJFoLERxNodeeo732ZVUqyVrl+hERgl7pZPQVhrTWTTEsRhLKANm+HAx0QyLp3RgfHxmX2nxzmwtNX7HQPVr5JtBlqM++fm324fUywpiz9IAszSaWq5TKc/szAxvInNGyuwj1H2vhIXeE7QPGKI+czFAxCmsRpHOJhD278qA6nAbyyIj2BXZCJNq63amR6OBMYsjp8E6S01B4Ccm/TauFX1+p3W3fZmdPpqFhjBbOtLOXUHvtF3wWb2Ly1QahbfYzFzxLgtuIqgRDBSluw3/ObGMNt0vneQ45Qk6hfHI3bCqfWknq4NKf6qnxmTXUXUD+9ys7G3YFlPQnvk6RwoJXnCt5NHr1YbUwFI9J/S3zmhWXi/PwO+vc4a4muD+SevL2BMlZ1/YheLU7+YKefecYMuvnMLEtjHlva+ZLzR/MWnwKk+kTfSA7EDCo49rZk+8TPm55kRlidz6ZQttJBXnJuJrU0yAYdA1t8JCUoSZgCn148cjVuaGQe71fv5JH8nihatxTycyxtIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4571.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261021135927099003)(261022105027099003)(261021123027099003)(261021121427099003)(38350700014)(11063799006)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(18002099003)(261009223027099003)(261009221727099003)(261009223327099003)(261009220027099003)(29003799003)(6133799003)(12006099003)(25016099003)(261009221227099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnhQb3dWcVU1SnJoM2d5dEdSOCtoTmpRck5GN1Z2NnlrUFo2S2c1VnZzb3lE?=
 =?utf-8?B?KzE2eWxsUDFVaUlXTFdTNGdYYmF5d2txTVVtOHFsT0xqeFlrbTloeWZ5cXVq?=
 =?utf-8?B?UlpFcm5yRmpucEY2YmVGL3gzemhsNzNoNXl3UlNpZXpMU1dldnY3VlJFQ0pr?=
 =?utf-8?B?THU5dEdxT0pHdktnQmFuc3Jmd282SE9YYTR4RjRnMjI2RmNyMmYvYTRXWDZL?=
 =?utf-8?B?SVRab3pvS0paQXBiZTlERXdxOFV2bVlNUitGYlJEWXNvajBNYkExQVdiTllq?=
 =?utf-8?B?WUtRbXl5Z09PSmNXaGxNelhmSCtNTWF5SG1jV1R6TGt4WTNQVnV0V1pjZGhx?=
 =?utf-8?B?YS84dHZQYVhaMlJONWNZT1JGUWZEeFBLaDd4cDNNZUgxaHY0V0pRUGdRNEJj?=
 =?utf-8?B?ZncvdDlpamtXSlFNT1haRGJneWllNzBmcHRON3luRU5vVjI0QXhKeU5GWDZE?=
 =?utf-8?B?RWdyU05ZKzhpU2RWakRPOTRNaEk3RmsxMXdmVjVwZEJMa3BrQ3M3MkU2dEJK?=
 =?utf-8?B?UCtOcDVaSVVtb0hTanYrclQ1cXdhZXlOM3JqL1YvTWpNZlpSSk9aMzV0bzFw?=
 =?utf-8?B?aGFYVUxBUkZvMTRGRDRhTExwNGxVUmwxY3laZE9BY0Y2WEJxWGw0aUlVTllh?=
 =?utf-8?B?Ung2czdDNmY0TkRFYzhnSXY5Q1Q3UjdnSEFrT1I5VUFlZXc1Z3VWcGlIRzlG?=
 =?utf-8?B?THlmOW81QnRPZlB2cDNjNTF3ZkZ0a1p1V2ZNS1ZOL2tpaDJuRzYrRisvSlpR?=
 =?utf-8?B?TjRiTGxyeGVjRFlzd3pPT3V5eTFRalVmWTJqR3FLSVg2SXBTaS9DcUF2TkJL?=
 =?utf-8?B?czNBZmE5VjR3TFJ4ZXNjQ1hodmVYeXBPYXZOTGkxZndla3l0TzlnVlRxa0NF?=
 =?utf-8?B?MkJJWU02eXE5UXBqZldFSlRXMDAwdDc5NWllN1IwMm1qSCtoK2U0V3F1Z1Vs?=
 =?utf-8?B?Vk5ZN1dDbjlwa2tpbGNOYnN2azN1ZW8xVTJxanRqTks5WXVLejBsTGY2M0F2?=
 =?utf-8?B?Zzh2aTFQUWJ5K2M0MFJwSjBIYVVIRVI1eHBYMjdBYUl6WW5EanRRUzdabGty?=
 =?utf-8?B?dHZzZi9IT21uWXRaTVFvODhONnpEamNWamFhSFZRaHc0YncwT0JWZURTSnFl?=
 =?utf-8?B?U2RoVHFCWUlpdi9EVjZNZU1xc2F1YUt3MUh1N1g2SUJYakpUYStqdnZ0OWw1?=
 =?utf-8?B?cUF6UG9mTXlmYTdnSFF3RDgzd1podEVleVJHMm95cmdZMDRjUDRjT1NzWVE5?=
 =?utf-8?B?T2twZUh0MzFubDVJYS9yNGhoU1pBUVdMaXQ4a1lIajJseDRoTGNVcU9EWXJP?=
 =?utf-8?B?MlpJUE5xZzFIT0lVQ2lwbjY2YXN5aE00VHNWQWJ4cmpNUm9MS0dvL1VTRzg2?=
 =?utf-8?B?Q1ZZc3pCQVpOU0NzTHlHYVMxcDkwNmJKV1hlQUoyYTJoWmFVRVlNblBQeDRw?=
 =?utf-8?B?R0RaVmw1QkNWOXFFMGNUeldaeHdSWEJyaW04UjM4TUF0eTNSL3hzZWN4L08x?=
 =?utf-8?B?QjJ0WEZFeGs5Um9sL3gwMXZHb2dKT1FiQmVWenl6NXQ0TUpHK3J5ekJYZ25T?=
 =?utf-8?B?MitwekQ3cHkyYlFDdml1RWNnTVY5akl0dnJFeWRSZmFuTEhiZ2MzTDVuTlpO?=
 =?utf-8?B?WXpMODhUeG9IUXdnNUE5Z3I2YUhNQ2gzNVdnZzNVYUZuclh2QXFybmdWSGZE?=
 =?utf-8?B?aXVra3pjZzNnQXlhRVZaNVZqVjBaQlA0akx2ZWJOZ3IrR1dhbXN4M1NSdUwz?=
 =?utf-8?B?TGEwL1B3dWhEbmo0bXF3NzRMeUpnajJDclZpd0hBOWZ3VkhGemJMWXRWZWQ4?=
 =?utf-8?B?SzkzTE5vZmR6bkpac0tTUkZxYUlBKzBRTUJndnJmTXZKek9sRjNRSTQ5UFVp?=
 =?utf-8?B?K3pHQWEzd1BpNE5wTWRSUDN5SmRrY2kxbDcyQlV5ajh2L3BXVTRuY2lnMStV?=
 =?utf-8?B?Zzk0TGl1Znd5c2ZwQ1VCOW4wOFJwR2J2OHJjOE1XYndkbzZNRXE2QzF5dW1G?=
 =?utf-8?B?WSs0K3JIeXBaZ0FuRjFraks1bUtlNjNkVE9JTWdHTWdQR0c2TnNJOWxvRm8v?=
 =?utf-8?B?TERlaFJZbEJaTWVSTDZIUnRTUTNtZStuWUR4Q1dVMnpEaWV4TkJ4ZVQvOFdT?=
 =?utf-8?B?ZnJTajJMSnpON2NkWVU0Skh5OGxacWQ0cFo5VmpEUGhIQ05sRFRIZXhjNXNk?=
 =?utf-8?B?bmZwTURreTJZV0hBN0w4NTg2TXhLTTlPZ1dMc2laMTNOemx4MWxESjJQNHox?=
 =?utf-8?B?eHhlZm1uTXlWRktGcUpBM2Fsa205WG1vQm9Wd2hVOC9IMkU2R1F0WEV5bGh0?=
 =?utf-8?B?SWdqZGgyeFF4TDkyZGlONERmamk2TW53ejZvMENnK1JJazZlWlQxUTZOcVMv?=
 =?utf-8?Q?1cL4IvXG3LICOqZo=3D?=
X-Exchange-RoutingPolicyChecked: RP8xTtx5WY4ldSJHqVUiJnlFEi4a/5Bpc1hi9zWTm3NCTYbXgYmmu+CpF4121Pb9mJ/hf3058HtuAn2rYB44YLxNmpX4ZHdh/lbGsNBeLtyWF3n/B/mRsojMxgF11bfm3gr1kJleC6K0Lw3MH3hIUJ1rlOkMr/GMkJ9pyiTA3+MToGzRefAfFx7aOUkBlG620BmtmO1QhHe9B5vZDSac3d87Yx6GQXsYzOec0Xf26xnbJAZUglYwASa5lJROl1cs3Yt12C5Vno/7rNJKv9ftXUh+1dSGmdJYUcSEDVgooasA2W3sQUF8P+LyOU71d/Ap9p98GgDTQ1JpTMHwzxX38A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada0cb13-a678-490f-0196-08df44b4f2b1
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4571.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:13:26.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5At5AeGY4z9sN4JCfxN1PS8uifndHaiMfwshwgIadsYZnD/m+6QLd1ttPn/VM4i9OiPaDwsR8cDezhPWirCsly6WERyfqsMMN4YPsOIcoEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX1w3zpYw0BC2q
 9MqKr5rel1Eal85hqVdalLyEIW+LB8ScyqQeXpPE/O51kvsEOd9hC8sS8wiWKdqV7P8ptonC1dz
 XgprWcD57W08bb/XaJ4lwmxqtByM5WnzmZAlo21a25S/WZV7kqq06LjcUhwETdc432vmVVXrrBV
 f1DpSkXJ5VWU0He9CgHRWgFDYBYaYkPbubjqKHDbtKMTaRg6fiiD2q+3mbKWfVklBqqV9GwCOd2
 WSpnp1iCOE+tuzPODgErnQJy0ptmO3H+0CPtR+8RIAVC5lSV9yFb3CvYDC/HZsVlFoLYdCkoW6z
 b4UCo91/wV5w4qOTAUfAQvK7KdrH79kjaQu1k5Wi+FMv8PtauI9dP0Tihb+wv6fSspdg99AS0GG
 ASINgyZZwecW9udtdiacOPBMfrjVufw8kWKGnXJ8bR4hprSYVur8Wyk0RgxpqW7UwXFH99upx0L
 zENmynM1naNqEiRp7ng==
X-Proofpoint-ORIG-GUID: ATith1bl-owetRszvCpNBWd9_HNUGZ9v
X-Proofpoint-GUID: ATith1bl-owetRszvCpNBWd9_HNUGZ9v
X-Authority-Analysis: v=2.4 cv=WcmZ+EhX c=1 sm=1 tr=0 ts=6afc610b cx=c_pps
 a=7Kp79o39qosEjZWU4lqIzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=j57RdskLAAAA:20 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8
 a=ag1SF4gXAAAA:8 a=I3kfGSCJAAAA:8 a=pGLkceISAAAA:8 a=zjtiufAZAAAA:8
 a=fUgN62gMh-b4hKlZoN8A:9 a=61hOwWNymeJm83Ye:21 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=IQfVYk39sIGuNIfSrgEu:22 a=2tRhtM0yMehlNRDZlsEQ:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX6FAy5eCYU3O8
 C+Homb+jpIMqBdiAeJ6G0VOhtQM+NiW0hC+YomY81UcZ+rWuC4hfynTf2OsO6IBmG4QwzugEz5x
 lCvaH9RI7MikFPysJPRm9XOu+sJ0GUPSvHqp6wy3p/qf+Duf4lkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 14:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250456

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.100.0

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html

Update local patches:
0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
cc-hash-object-names-relative-to-source-roots.patch

Drop merged patches:
0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch
0005-rustc-span-make-hygiene-encoding-order-deterministic.patch

Backport 0004-Re-bless-tests-adjust-for-new-Cargo-lints.patch to fix
do_install with the new cargo lints [1].

libstd-rs: cargo now uses a new directory layout [2]. Each crate's
artifacts are in build/<crate>/<hash>/out/ and deps/ is no longer
created, so update do_install to copy the libraries from there.

oe-selftest: exclude only the baseline revision of
tests/ui/asm/arm-high-dregs.rs. It expects an error for the d16 register
on an armv7 target without neon. OE's default configuration for qemuarm
(tune-cortexa15.inc, DEFAULTTUNE cortexa15thf-neon) enables neon, so the
expected error is not emitted [3].

Excluded tests:
+---------+---------+---------+
| Before  |  After  | Skipped |
+---------+---------+---------+
|   44    |   45    |   +1    |
+---------+---------+---------+

[1] https://github.com/rust-lang/cargo/pull/17298
[2] https://github.com/rust-lang/cargo/pull/17354
[3] https://github.com/rust-lang/rust/blob/1.100.0/tests/ui/asm/arm-high-dr=
egs.rs

Test results:

rust v1.100.0 (from autobuilder)
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  24201  |  1083   |
| qemux86     |  23934  |  1352   |
| qemuarm     |  23914  |  1371   |
| qemuarm64   |  24028  |  1258   |
| qemuriscv64 |  23969  |  1315   |
+-------------+---------+---------+

Test results difference (1.100.0 - 1.99.1):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +510  |   +61   |
| qemux86     |  +506  |   +67   |
| qemuarm     |  +506  |   +66   |
| qemuarm64   |  +506  |   +67   |
| qemuriscv64 |  +505  |   +66   |
+-------------+--------+---------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |   1 +
 .../{cargo_1.99.1.bb =3D> cargo_1.100.0.bb}     |   0
 ...teps-tool.rs-switch-off-lto-for-rust.patch |  27 +-
 ...ip-StdarchVerify-when-remote-testing.patch |  30 --
 ...host-triple-from-unit-metadata-hash.patch} |   0
 ...ess-tests-adjust-for-new-Cargo-lints.patch | 287 ++++++++++++++++++
 ...hygiene-encoding-order-deterministic.patch |  59 ----
 ...bject-names-relative-to-source-roots.patch |  40 ++-
 ...bstd-rs_1.99.1.bb =3D> libstd-rs_1.100.0.bb} |  10 +-
 ...99.1.bb =3D> rust-cross-canadian_1.100.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 104 +++----
 meta/recipes-devtools/rust/rust-source.inc    |   7 +-
 ...ource_1.99.1.bb =3D> rust-source_1.100.0.bb} |   0
 .../rust/{rust_1.99.1.bb =3D> rust_1.100.0.bb}  |   0
 16 files changed, 385 insertions(+), 184 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.99.1.bb =3D> cargo_1.100.0.bb} =
(100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0003-bootstrap-skip-St=
darchVerify-when-remote-testing.patch
 rename meta/recipes-devtools/rust/files/{0004-cargo-omit-host-triple-from-=
unit-metadata-hash.patch =3D> 0003-cargo-omit-host-triple-from-unit-metadat=
a-hash.patch} (100%)
 create mode 100644 meta/recipes-devtools/rust/files/0004-Re-bless-tests-ad=
just-for-new-Cargo-lints.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0005-rustc-span-make-h=
ygiene-encoding-order-deterministic.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.99.1.bb =3D> libstd-rs_1.10=
0.0.bb} (77%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.99.1.bb =3D> rust=
-cross-canadian_1.100.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-source_1.99.1.bb =3D> rust-source_=
1.100.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.99.1.bb =3D> rust_1.100.0.bb} (1=
00%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 97582abe99..62de04001e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -787,7 +787,7 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burton=
@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.com>=
"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "Ra=
ndy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-source-1.99.1 =3D "Deepesh Varatharajan <Deepesh=
.Varatharajan@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-source-1.100.0 =3D "Deepesh Varatharajan <Deepes=
h.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.co=
m>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie@l=
inuxfoundation.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 6632f8ff97..4891d310ca 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
 GCCVERSION ?=3D "16.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 GLIBCVERSION ?=3D "2.44%"
-RUSTVERSION ?=3D "1.99.1%"
+RUSTVERSION ?=3D "1.100.0%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py
index 645b5d5fbf..03af98345e 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -93,6 +93,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPT=
estResultTestCase):
                             'tests/rustdoc-js-std',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
+                            'tests/ui/asm/arm-high-dregs.rs#baseline',
                             'tests/ui/codegen/huge-stacks.rs',
                             'tests/ui/codegen/mismatched-data-layouts.rs',
                             'tests/codegen-llvm/rust-abi-arch-specific-adj=
ustment.rs',
diff --git a/meta/recipes-devtools/rust/cargo_1.99.1.bb b/meta/recipes-devt=
ools/rust/cargo_1.100.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.99.1.bb
rename to meta/recipes-devtools/rust/cargo_1.100.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-too=
l.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files/0001-=
src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
index 0bd32ecf61..7482c2a295 100644
--- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-sw=
itch-off-lto-for-rust.patch
+++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-sw=
itch-off-lto-for-rust.patch
@@ -18,17 +18,21 @@ Upstream-Status: Inappropriate [reported at https://git=
hub.com/rust-lang/rust/is
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
 ---
- src/bootstrap/src/core/build_steps/tool.rs | 19 +++----------------
+ src/bootstrap/src/core/build_steps/tool.rs | 22 ++++------------------
  src/bootstrap/src/core/builder/mod.rs      |  2 +-
- 2 files changed, 4 insertions(+), 17 deletions(-)
+ 2 files changed, 5 insertions(+), 19 deletions(-)
=20
+diff --git a/src/bootstrap/src/core/build_steps/tool.rs b/src/bootstrap/sr=
c/core/build_steps/tool.rs
+index c4fae69..7c4e230 100644
 --- a/src/bootstrap/src/core/build_steps/tool.rs
 +++ b/src/bootstrap/src/core/build_steps/tool.rs
-@@ -13,14 +13,13 @@
+@@ -13,16 +13,16 @@ use std::ffi::OsStr;
  use std::path::{Path, PathBuf};
  use std::{env, fs};
 =20
--use crate::core::build_steps::compile::is_lto_stage;
+-use crate::core::build_steps::compile::{CargoMessage, is_lto_stage};
++use crate::core::build_steps::compile::CargoMessage;
+ use crate::core::build_steps::dist::LLD_FILE_NAMES;
  use crate::core::build_steps::toolstate::ToolState;
  use crate::core::build_steps::{compile, llvm};
  use crate::core::builder::{
@@ -36,12 +40,13 @@ Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharaj=
an@windriver.com>
 -    StepMetadata, apply_pgo, cargo_profile_var,
 +    StepMetadata, apply_pgo,
  };
+ use crate::core::compiler::Compiler;
 -use crate::core::config::{Allocator, DebuginfoLevel, RustcLto, TargetSele=
ction};
 +use crate::core::config::{Allocator, DebuginfoLevel, TargetSelection};
+ use crate::core::session::{FileType, Mode};
  use crate::utils::exec::{BootstrapCommand, command};
  use crate::utils::helpers::{self, add_dylib_path, exe, t};
- use crate::{Compiler, FileType, Mode};
-@@ -117,21 +116,7 @@
+@@ -121,21 +121,7 @@ impl Step for ToolBuild {
              cargo.env("RUSTC_WRAPPER", ccache);
          }
 =20
@@ -64,14 +69,16 @@ Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharaj=
an@windriver.com>
 =20
          let pgo_config =3D match self.path {
              "src/tools/rustdoc" =3D> Some(&builder.config.rustdoc_pgo),
+diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/cor=
e/builder/mod.rs
+index c221a97..4af0fda 100644
 --- a/src/bootstrap/src/core/builder/mod.rs
 +++ b/src/bootstrap/src/core/builder/mod.rs
-@@ -13,7 +13,7 @@
+@@ -13,7 +13,7 @@ use clap::ValueEnum;
  #[cfg(feature =3D "tracing")]
  use tracing::instrument;
 =20
--pub use self::cargo::{Cargo, apply_pgo, cargo_profile_var};
-+pub use self::cargo::{Cargo, apply_pgo};
- pub use crate::Compiler;
+-pub(crate) use self::cargo::{Cargo, apply_pgo, cargo_profile_var};
++pub(crate) use self::cargo::{Cargo, apply_pgo};
  use crate::core::build_steps::compile::{Std, StdLink, looks_like_codegen_=
backend};
+ use crate::core::build_steps::llvm::{LlvmKind, get_llvm_build_status};
  use crate::core::build_steps::tool::RustcPrivateCompilers;
diff --git a/meta/recipes-devtools/rust/files/0003-bootstrap-skip-StdarchVe=
rify-when-remote-testing.patch b/meta/recipes-devtools/rust/files/0003-boot=
strap-skip-StdarchVerify-when-remote-testing.patch
deleted file mode 100644
index a57765f6ea..0000000000
--- a/meta/recipes-devtools/rust/files/0003-bootstrap-skip-StdarchVerify-wh=
en-remote-testing.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ca4541f4241f48f8344bc8b8dd7fcbb476ea6900 Mon Sep 17 00:00:00 2001
-From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-Date: Wed, 26 Aug 2026 03:49:52 -0700
-Subject: [PATCH] bootstrap: skip StdarchVerify when remote testing is enab=
led
-
-When TEST_DEVICE_ADDR is set for cross-testing, the StdarchVerify step
-incorrectly attempts to run on the remote target. Since stdarch-verify
-is a host-only verification tool, skip it when remote testing is enabled.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/ca4541=
f4241f48f8344bc8b8dd7fcbb476ea6900]
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/src/bootstrap/src/core/build_steps/test.rs b/src/bootstrap/sr=
c/core/build_steps/test.rs
-index a2d05f8..3753aec 100644
---- a/src/bootstrap/src/core/build_steps/test.rs
-+++ b/src/bootstrap/src/core/build_steps/test.rs
-@@ -962,7 +962,12 @@ impl Step for StdarchVerify {
-     }
-
-     fn make_run(run: RunConfig<'_>) {
--        run.builder.ensure(StdarchVerify);
-+        let builder =3D run.builder;
-+        if builder.remote_tested(run.target) {
-+            builder.info("remote testing is not supported by stdarch-veri=
fy. skipping");
-+            return;
-+        }
-+        builder.ensure(StdarchVerify);
-     }
-
-     fn run(self, builder: &Builder<'_>) {
diff --git a/meta/recipes-devtools/rust/files/0004-cargo-omit-host-triple-f=
rom-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0003-cargo-=
omit-host-triple-from-unit-metadata-hash.patch
similarity index 100%
rename from meta/recipes-devtools/rust/files/0004-cargo-omit-host-triple-fr=
om-unit-metadata-hash.patch
rename to meta/recipes-devtools/rust/files/0003-cargo-omit-host-triple-from=
-unit-metadata-hash.patch
diff --git a/meta/recipes-devtools/rust/files/0004-Re-bless-tests-adjust-fo=
r-new-Cargo-lints.patch b/meta/recipes-devtools/rust/files/0004-Re-bless-te=
sts-adjust-for-new-Cargo-lints.patch
new file mode 100644
index 0000000000..6580b53af0
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0004-Re-bless-tests-adjust-for-new-C=
argo-lints.patch
@@ -0,0 +1,287 @@
+From daa24324904fa6aa460a22de733068c8dcb0323d Mon Sep 17 00:00:00 2001
+From: Mark Rousskov <mark.simulacrum@gmail.com>
+Date: Tue, 29 Sep 2026 08:13:20 -0400
+Subject: [PATCH] Re-bless tests / adjust for new Cargo lints
+
+Cargo 1.100 added its own lints (rust-lang/cargo#17298) and rustc no
+longer emits unused_crate_dependencies under cargo. The target and
+nativesdk rust are built with cargo-native 1.100, so do_install fails on
+the unfulfilled expect in rustc-main and on unused dependencies in
+library/sysroot, as warnings are denied.
+
+rust-native is still built with the 1.99 snapshot, so keep the attribute
+in compiler/rustc/src/main.rs as allow instead of dropping it.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/daa243=
24904fa6aa460a22de733068c8dcb0323d]
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ compiler/rustc/src/main.rs                                   | 2 +-
+ library/alloc/Cargo.toml                                     | 4 ++++
+ library/panic_unwind/Cargo.toml                              | 3 +++
+ library/std/Cargo.toml                                       | 4 ++++
+ library/std_detect/Cargo.toml                                | 4 ++++
+ library/sysroot/Cargo.toml                                   | 5 +++++
+ src/tools/clippy/clippy_test_deps/Cargo.toml                 | 4 ++++
+ src/tools/miri/tests/deps/Cargo.toml                         | 4 ++++
+ src/tools/miri/tests/deps/cross-crate-items/Cargo.toml       | 4 ++++
+ src/tools/rust-analyzer/Cargo.toml                           | 5 +++--
+ src/tools/rust-analyzer/crates/macros/Cargo.toml             | 3 +++
+ .../crates/proc-macro-srv/proc-macro-test/Cargo.toml         | 3 +++
+ .../rust-analyzer/lib/ungrammar/ungrammar2json/Cargo.toml    | 3 +++
+ tests/ui/array-slice-vec/vec-res-add.stderr                  | 1 -
+ ...st_equality_comparison_instead_of_pattern_matching.stderr | 4 ----
+ tests/ui/pattern/deref-patterns/implicit-const-deref.stderr  | 1 -
+ tests/ui/pattern/issue-115599.stderr                         | 1 -
+ tests/ui/pattern/pattern-tyvar-2.stderr                      | 1 -
+ 18 files changed, 45 insertions(+), 11 deletions(-)
+
+diff --git a/compiler/rustc/src/main.rs b/compiler/rustc/src/main.rs
+--- a/compiler/rustc/src/main.rs
++++ b/compiler/rustc/src/main.rs
+@@ -1,7 +1,7 @@
+ // We need this feature as it changes `dylib` linking behavior and allows=
 us to link to `rustc_driver`.
+ #![feature(rustc_private)]
+ // Several crates are depended upon but unused so that they are present i=
n the sysroot
+-#![expect(unused_crate_dependencies)]
++#![allow(unused_crate_dependencies)]
+=20
+ #[allow(unused_imports)]
+ use std::process::ExitCode;
+diff --git a/library/alloc/Cargo.toml b/library/alloc/Cargo.toml
+index b32e5e991cc74..a1071d2cde5f0 100644
+--- a/library/alloc/Cargo.toml
++++ b/library/alloc/Cargo.toml
+@@ -31,3 +31,7 @@ check-cfg =3D [
+     'cfg(no_rc)',
+     'cfg(no_sync)',
+ ]
++
++[lints.cargo]
++# compiler-builtins is claimed unused?
++unused_dependencies =3D "allow"
+diff --git a/library/panic_unwind/Cargo.toml b/library/panic_unwind/Cargo.=
toml
+index 72c1041b46795..3b7805a205492 100644
+--- a/library/panic_unwind/Cargo.toml
++++ b/library/panic_unwind/Cargo.toml
+@@ -18,3 +18,6 @@ unwind =3D { path =3D "../unwind" }
+=20
+ [target.'cfg(not(all(windows, target_env =3D "msvc")))'.dependencies]
+ libc =3D { version =3D "0.2", default-features =3D false }
++
++[lints.cargo]
++unused_dependencies =3D "allow"
+diff --git a/library/std/Cargo.toml b/library/std/Cargo.toml
+index 1d35b42a53947..67eebd820ca59 100644
+--- a/library/std/Cargo.toml
++++ b/library/std/Cargo.toml
+@@ -167,3 +167,7 @@ check-cfg =3D [
+     'cfg(target_has_reliable_f128)',
+     'cfg(target_has_reliable_f128_math)',
+ ]
++
++[lints.cargo]
++# panic_abort is not directly used but must be linked in
++unused_dependencies =3D "allow"
+diff --git a/library/std_detect/Cargo.toml b/library/std_detect/Cargo.toml
+index a6785bb20555d..c03fff827d5cd 100644
+--- a/library/std_detect/Cargo.toml
++++ b/library/std_detect/Cargo.toml
+@@ -24,3 +24,7 @@ libc =3D { version =3D "0.2.0", default-features =3D fal=
se }
+=20
+ [features]
+ std_detect_env_override =3D []
++
++[lints.cargo]
++# libc is definitely used in code but the lint doesn't realize that (uncl=
ear why)
++unused_dependencies =3D "allow"
+diff --git a/library/sysroot/Cargo.toml b/library/sysroot/Cargo.toml
+index 10562389d62d3..cef5532857b5e 100644
+--- a/library/sysroot/Cargo.toml
++++ b/library/sysroot/Cargo.toml
+@@ -32,3 +32,8 @@ optimize_for_size =3D ["std/optimize_for_size"]
+ panic-unwind =3D ["std/panic-unwind"]
+ profiler =3D ["dep:profiler_builtins"]
+ windows_raw_dylib =3D ["std/windows_raw_dylib"]
++
++[lints.cargo]
++# We expect some of these dependencies to not actually be used since this=
 is
++# just an aggregator crate.
++unused_dependencies =3D "allow"
+diff --git a/src/tools/clippy/clippy_test_deps/Cargo.toml b/src/tools/clip=
py/clippy_test_deps/Cargo.toml
+index 880df6599c1e4..c3d236a17e1bb 100644
+--- a/src/tools/clippy/clippy_test_deps/Cargo.toml
++++ b/src/tools/clippy/clippy_test_deps/Cargo.toml
+@@ -18,3 +18,7 @@ itertools =3D "0.15"
+=20
+ # Make sure we are not part of the rustc workspace.
+ [workspace]
++
++[lints.cargo]
++# Not all tests use all of the above dependencies
++unused_dependencies =3D "allow"
+diff --git a/src/tools/miri/tests/deps/Cargo.toml b/src/tools/miri/tests/d=
eps/Cargo.toml
+index a377141f98aaf..6b6d4a9e2f443 100644
+--- a/src/tools/miri/tests/deps/Cargo.toml
++++ b/src/tools/miri/tests/deps/Cargo.toml
+@@ -37,3 +37,7 @@ windows-sys =3D { version =3D "0.61", features =3D [
+ # Make sure we are not part of the rustc workspace.
+ [workspace]
+ members =3D ["cross-crate-items"]
++
++[lints.cargo]
++# Not all tests use all of the above dependencies
++unused_dependencies =3D "allow"
+diff --git a/src/tools/miri/tests/deps/cross-crate-items/Cargo.toml b/src/=
tools/miri/tests/deps/cross-crate-items/Cargo.toml
+index 1f9fc93cd5237..ca6818dc0fe25 100644
+--- a/src/tools/miri/tests/deps/cross-crate-items/Cargo.toml
++++ b/src/tools/miri/tests/deps/cross-crate-items/Cargo.toml
+@@ -5,3 +5,7 @@ edition =3D "2021"
+=20
+ [dependencies]
+ futures =3D { version =3D "0.3.0", default-features =3D false, features =
=3D ["alloc", "async-await"] }
++
++[lints.cargo]
++# panic_abort is not directly used but must be linked in
++unused_dependencies =3D "allow"
+diff --git a/src/tools/rust-analyzer/Cargo.toml b/src/tools/rust-analyzer/=
Cargo.toml
+index d77e89df45e44..54e82148665b6 100644
+--- a/src/tools/rust-analyzer/Cargo.toml
++++ b/src/tools/rust-analyzer/Cargo.toml
+@@ -68,10 +68,8 @@ parser =3D { path =3D "./crates/parser", version =3D "0=
.0.0" }
+ paths =3D { path =3D "./crates/paths", version =3D "0.0.0" }
+ proc-macro-api =3D { path =3D "./crates/proc-macro-api", version =3D "0.0=
.0" }
+ proc-macro-srv =3D { path =3D "./crates/proc-macro-srv", version =3D "0.0=
.0" }
+-proc-macro-srv-cli =3D { path =3D "./crates/proc-macro-srv-cli", version =
=3D "0.0.0" }
+ profile =3D { path =3D "./crates/profile", version =3D "0.0.0" }
+ project-model =3D { path =3D "./crates/project-model", version =3D "0.0.0=
" }
+-query-group =3D { package =3D "query-group-macro", path =3D "./crates/que=
ry-group-macro", version =3D "0.0.0" }
+ span =3D { path =3D "./crates/span", version =3D "0.0.0" }
+ stdx =3D { path =3D "./crates/stdx", version =3D "0.0.0" }
+ syntax =3D { path =3D "./crates/syntax", version =3D "0.0.0" }
+@@ -167,6 +165,9 @@ hashbrown =3D { version =3D "0.17.0", features =3D [
+ # We need to freeze the version of the crate, as the raw-api feature is c=
onsidered unstable
+ dashmap =3D { version =3D "=3D6.2.1", features =3D ["raw-api", "inline"] =
}
+=20
++[workspace.lints.cargo]
++unused_dependencies =3D "allow"
++
+ [workspace.lints.rust]
+ # remember to update RUSTFLAGS in ci.yml if you add something here
+=20
+diff --git a/src/tools/rust-analyzer/crates/macros/Cargo.toml b/src/tools/=
rust-analyzer/crates/macros/Cargo.toml
+index 8184cc6d1c03d..b0d0000268588 100644
+--- a/src/tools/rust-analyzer/crates/macros/Cargo.toml
++++ b/src/tools/rust-analyzer/crates/macros/Cargo.toml
+@@ -17,3 +17,6 @@ proc-macro2 =3D "1"
+ quote =3D "1"
+ syn =3D "2.0.9"
+ synstructure =3D "0.13.0"
++
++[lints]
++workspace =3D true
+diff --git a/src/tools/rust-analyzer/crates/proc-macro-srv/proc-macro-test=
/Cargo.toml b/src/tools/rust-analyzer/crates/proc-macro-srv/proc-macro-test=
/Cargo.toml
+index 78630ddb4d7d8..668188340e5c8 100644
+--- a/src/tools/rust-analyzer/crates/proc-macro-srv/proc-macro-test/Cargo.=
toml
++++ b/src/tools/rust-analyzer/crates/proc-macro-srv/proc-macro-test/Cargo.=
toml
+@@ -11,3 +11,6 @@ doctest =3D false
+=20
+ [build-dependencies]
+ cargo_metadata =3D "0.23.0"
++
++[lints]
++workspace =3D true
+diff --git a/src/tools/rust-analyzer/lib/ungrammar/ungrammar2json/Cargo.to=
ml b/src/tools/rust-analyzer/lib/ungrammar/ungrammar2json/Cargo.toml
+index 0fa08bbbd0485..f17587e3f556c 100644
+--- a/src/tools/rust-analyzer/lib/ungrammar/ungrammar2json/Cargo.toml
++++ b/src/tools/rust-analyzer/lib/ungrammar/ungrammar2json/Cargo.toml
+@@ -10,3 +10,6 @@ edition =3D "2024"
+ [dependencies]
+ write-json =3D "0.1.1"
+ ungrammar =3D { path =3D "../", version =3D "1.1.0" }
++
++[lints]
++workspace =3D true
+diff --git a/tests/ui/array-slice-vec/vec-res-add.stderr b/tests/ui/array-=
slice-vec/vec-res-add.stderr
+index 6d5ad1d3c9694..4e13dbd0366d0 100644
+--- a/tests/ui/array-slice-vec/vec-res-add.stderr
++++ b/tests/ui/array-slice-vec/vec-res-add.stderr
+@@ -8,7 +8,6 @@ LL |     let k =3D i + j;
+    |
+ note: `Vec<R>` does not implement `Add`
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<R>` is defined in another crate
+=20
+diff --git a/tests/ui/consts/const_in_pattern/suggest_equality_comparison_=
instead_of_pattern_matching.stderr b/tests/ui/consts/const_in_pattern/sugge=
st_equality_comparison_instead_of_pattern_matching.stderr
+index ab823c8fc73b9..38440af675feb 100644
+--- a/tests/ui/consts/const_in_pattern/suggest_equality_comparison_instead=
_of_pattern_matching.stderr
++++ b/tests/ui/consts/const_in_pattern/suggest_equality_comparison_instead=
_of_pattern_matching.stderr
+@@ -123,7 +123,6 @@ LL |             V =3D> {}
+    |             ^ constant of non-structural type
+    |
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<()>` is not usable in patterns
+    |
+@@ -144,7 +143,6 @@ LL |         if let V =3D vec![] {}
+    |                ^ constant of non-structural type
+    |
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<()>` is not usable in patterns
+    |
+@@ -160,7 +158,6 @@ LL |         let V =3D vec![] else { return; };
+    |             ^ constant of non-structural type
+    |
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<()>` is not usable in patterns
+    |
+@@ -176,7 +173,6 @@ LL |         let V =3D Vec::new() else { return; };
+    |             ^ constant of non-structural type
+    |
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<()>` is not usable in patterns
+    |
+diff --git a/tests/ui/pattern/deref-patterns/implicit-const-deref.stderr b=
/tests/ui/pattern/deref-patterns/implicit-const-deref.stderr
+index c03137fcc4151..7c176162ad184 100644
+--- a/tests/ui/pattern/deref-patterns/implicit-const-deref.stderr
++++ b/tests/ui/pattern/deref-patterns/implicit-const-deref.stderr
+@@ -8,7 +8,6 @@ LL |         EMPTY =3D> {}
+    |         ^^^^^ constant of non-structural type
+    |
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<()>` is not usable in patterns
+    |
+diff --git a/tests/ui/pattern/issue-115599.stderr b/tests/ui/pattern/issue=
-115599.stderr
+index 280516deba14b..f776623ff75b2 100644
+--- a/tests/ui/pattern/issue-115599.stderr
++++ b/tests/ui/pattern/issue-115599.stderr
+@@ -8,7 +8,6 @@ LL |     if let CONST_STRING =3D empty_str {}
+    |            ^^^^^^^^^^^^ constant of non-structural type
+    |
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<u8>` is not usable in patterns
+    |
+diff --git a/tests/ui/pattern/pattern-tyvar-2.stderr b/tests/ui/pattern/pa=
ttern-tyvar-2.stderr
+index 4761a4e829b85..6676d5129872b 100644
+--- a/tests/ui/pattern/pattern-tyvar-2.stderr
++++ b/tests/ui/pattern/pattern-tyvar-2.stderr
+@@ -8,7 +8,6 @@ LL | fn foo(t: Bar) -> isize { match t { Bar::T1(_, Some(x=
)) =3D> { return x * 3;
+    |
+ note: `Vec<isize>` does not implement `Mul<{integer}>`
+   --> $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+-  ::: $SRC_DIR/alloc/src/vec/mod.rs:LL:COL
+    |
+    =3D note: `Vec<isize>` is defined in another crate
+=20
diff --git a/meta/recipes-devtools/rust/files/0005-rustc-span-make-hygiene-=
encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0005-=
rustc-span-make-hygiene-encoding-order-deterministic.patch
deleted file mode 100644
index 47a713f82e..0000000000
--- a/meta/recipes-devtools/rust/files/0005-rustc-span-make-hygiene-encodin=
g-order-deterministic.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9c190d14f93bf27c7f1c94d400cda6f48f285a34 Mon Sep 17 00:00:00 2001
-From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
-Date: Tue, 15 Sep 2026 17:05:36 +0530
-Subject: [PATCH] rust: sort syntax contexts and expansions before encoding
-
-HygieneEncodeContext encodes the pending syntax contexts and expansions in
-hash-map order, so the encoded rmeta depends on the build host. Sort both
-before encoding. Upstream has fixed the same problem with a different
-approach in https://github.com/rust-lang/rust/pull/161450, merged after
-rust 1.99 branched, so this stays a local fix rather than a backport
-until a rust upgrade contains it.
-
-Patch by Alejandro Enedino Hernandez Samaniego, from his strict-version-ha=
sh
-v5 series for openembedded-core:
-https://lists.openembedded.org/g/openembedded-core/topic/120939810
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.or=
g>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- compiler/rustc_span/src/hygiene.rs | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/compiler/rustc_span/src/hygiene.rs b/compiler/rustc_span/src/=
hygiene.rs
-index 1c74205..a464eca 100644
---- a/compiler/rustc_span/src/hygiene.rs
-+++ b/compiler/rustc_span/src/hygiene.rs
-@@ -1313,12 +1313,12 @@ impl HygieneEncodeContext {
-=20
-             // Consume the current round of syntax contexts.
-             // Drop the lock() temporary early.
--            // It's fine to iterate over a HashMap, because the serializa=
tion of the table
--            // that we insert data into doesn't depend on insertion order=
.
-             #[allow(rustc::potential_query_instability)]
--            let latest_ctxts =3D { mem::take(&mut *self.latest_ctxts.lock=
()) }.into_iter();
-+            let mut latest_ctxts: Vec<_> =3D { mem::take(&mut *self.lates=
t_ctxts.lock()) }.into_iter().collect();
-+            latest_ctxts.sort_by_key(|ctxt| ctxt.0);
-             let all_ctxt_data: Vec<_> =3D HygieneData::with(|data| {
-                 latest_ctxts
-+                    .into_iter()
-                     .map(|ctxt| (ctxt, data.syntax_context_data[ctxt.0 as=
 usize].key()))
-                     .collect()
-             });
-@@ -1330,9 +1330,11 @@ impl HygieneEncodeContext {
-=20
-             // Same as above, but for expansions instead of syntax contex=
ts.
-             #[allow(rustc::potential_query_instability)]
--            let latest_expns =3D { mem::take(&mut *self.latest_expns.lock=
()) }.into_iter();
-+            let mut latest_expns: Vec<_> =3D { mem::take(&mut *self.lates=
t_expns.lock()) }.into_iter().collect();
-+            latest_expns.sort_by_key(|expn| (expn.krate, expn.local_id));
-             let all_expn_data: Vec<_> =3D HygieneData::with(|data| {
-                 latest_expns
-+                    .into_iter()
-                     .map(|expn| (expn, data.expn_data(expn).clone(), data=
.expn_hash(expn)))
-                     .collect()
-             });
---=20
-2.43.0
diff --git a/meta/recipes-devtools/rust/files/cc-hash-object-names-relative=
-to-source-roots.patch b/meta/recipes-devtools/rust/files/cc-hash-object-na=
mes-relative-to-source-roots.patch
index c128bd7144..e0218bf5ad 100644
--- a/meta/recipes-devtools/rust/files/cc-hash-object-names-relative-to-sou=
rce-roots.patch
+++ b/meta/recipes-devtools/rust/files/cc-hash-object-names-relative-to-sou=
rce-roots.patch
@@ -15,7 +15,7 @@ CARGO_MANIFEST_DIR as upstream already did.
=20
 The OUT_DIR part is generic and is merged upstream as rust-lang/cc-rs
 commit fe27e7b6262, in a slightly different shape: the upstream tree
-moved on from the cc 1.2.0 that rust vendors, so the change here keeps
+moved on from the cc 1.4.3 that rust vendors, so the change here keeps
 the form that fits these sources. RUST_COMPILER_RT_ROOT is set by
 rust's own build system, so that part stays local to this patch.
=20
@@ -23,38 +23,34 @@ Upstream-Status: Backport [https://github.com/rust-lang=
/cc-rs/commit/fe27e7b6262
=20
 Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
 ---
- vendor/cc-1.2.0/.cargo-checksum.json   |  2 +-
- vendor/cc-1.2.0/src/command_helpers.rs | 18 +++++++++++++++---
+ vendor/cc-1.4.3/.cargo-checksum.json   |  2 +-
+ vendor/cc-1.4.3/src/command_helpers.rs | 18 +++++++++++++++---
  2 files changed, 16 insertions(+), 4 deletions(-)
=20
-diff --git a/vendor/cc-1.2.0/.cargo-checksum.json b/vendor/cc-1.2.0/.cargo=
-checksum.json
-index 470ecbb..2ff8a08 100644
---- a/vendor/cc-1.2.0/.cargo-checksum.json
-+++ b/vendor/cc-1.2.0/.cargo-checksum.json
+diff --git a/vendor/cc-1.4.3/.cargo-checksum.json b/vendor/cc-1.4.3/.cargo=
-checksum.json
+index cc4144e..a8ab1fc 100644
+--- a/vendor/cc-1.4.3/.cargo-checksum.json
++++ b/vendor/cc-1.4.3/.cargo-checksum.json
 @@ -1 +1 @@
--{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"b766a70e39b8ea7bb57afd288bcac205a23f6a26ac561=
9cb1d5b10f70c5dfdea","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
+-{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"067dd1727a66bb81a833e7ff9ed732d0a26c4df=
b6f78600884cf20cc766b379e",".tombi.toml":"93f57361f60b03b6c14ede301446e5e26=
58abaa98cac39a4a96be0966b6b851a","CHANGELOG.md":"7e2c9bec874d564ceeedfa8858=
7ab86f45d8a3d3df4a6f6ef19ad3db3997d74e","Cargo.lock":"f309ad15b2b17d7ff090e=
11005112ad2ed04495da92d8d11f758adb69c87d273","Cargo.toml":"c424f930665aa062=
f43c448c2837c98f9aad434a95cce4400605b0f2af7c820e","Cargo.toml.orig":"d1fc79=
a63899b64a816fe5595b403c27ade4612ea58c0e88556c05d307b431f0","LICENSE-APACHE=
":"a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICEN=
SE-MIT":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397",=
"README.md":"cc952a506dc726eed3e128d47d62defbac4470bbb0e465f6a043ae8bf0c96d=
19","clippy.toml":"cf46251b0953d1a3c7a4f8f8941a08d8a416d5fc348dfe3f3c520eb9=
3fcc18ea","src/command_helpers.rs":"650c9682edc3d7732249e327c1026c7cc733f37=
02f4867b9580223e97522d3c6","src/detect_compiler_family.c":"97ca4b021495611e=
828becea6187add37414186a16dfedd26c2947cbce6e8b2f","src/flags.rs":"1a80855f5=
1db6808cdcb5c0e6bd1c0973e86463014082ef7ed1d0fbe7b89cf93","src/lib.rs":"6139=
1623eed3591d6d06977867b7a772348daa1385c1fefd8e82ab8e9adbc71b","src/parallel=
/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b919=
0d85b45983","src/parallel/command_runner.rs":"1d17d9a037de93b31cc7ee6a914a1=
e1f6c1ac156cf8619f0014dcbaca6a0b215","src/parallel/job_token.rs":"1aa1ecc63=
9e09845eea0f1e11a76c39ad2604eaac3268059652f56add8890089","src/parallel/mod.=
rs":"bf156170790d40a76015a8c78cc2a391cbe1b60bb96c1fac1d047d26e342386a","src=
/parallel/stderr.rs":"b68d728087667fd568921d61cd40d0dc6b56c59bde6e671cb50cb=
0c43dcdf56d","src/target.rs":"a9d2d347a3a08015531f00b32bc8a7478f5636822cc8e=
0237ea9efa3f07d4cd4","src/target/apple.rs":"da9411b2c4db419e0fa39f765ee53b8=
665b3837fb39827679a53238734a4a1c1","src/target/generated.rs":"f93008829c57e=
9da3f5d6ac84643c04d8438a319fe9517533604dfe47e9cb8d7","src/target/llvm.rs":"=
525680a605fb57e038c3103d3efc9201c1af7b99162adf5dbc399da1d5007efe","src/targ=
et/parser.rs":"5ea311fc57b6a6d1aecd7e5433ee5f79b403b58e40be18650fdd81cf5146=
14cb","src/tempfile.rs":"77963fe55b63d3a30cccae46f763b8d61ed722247fe208e848=
5858770f6a67f7","src/tool.rs":"52a7bc134154fde7fecb1ef691f0179eb617e2f17a10=
d71dfa71afbcb061555b","src/utilities.rs":"ebb59ac01fb9588bcea0d0ee786e5d5a5=
696b4284a1245657625db03e830b72e"},"package":"509591b7bcd67f4ef775afad766270=
3b4935daaa6ec0e5605cfb1090b32a2b6d"}
 \ No newline at end of file
-+{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"010873ba1ab0ea4b7e3b5eac72aed5f50e535d42cb94d=
a943d2aa3d74904aa0f","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
++{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"067dd1727a66bb81a833e7ff9ed732d0a26c4df=
b6f78600884cf20cc766b379e",".tombi.toml":"93f57361f60b03b6c14ede301446e5e26=
58abaa98cac39a4a96be0966b6b851a","CHANGELOG.md":"7e2c9bec874d564ceeedfa8858=
7ab86f45d8a3d3df4a6f6ef19ad3db3997d74e","Cargo.lock":"f309ad15b2b17d7ff090e=
11005112ad2ed04495da92d8d11f758adb69c87d273","Cargo.toml":"c424f930665aa062=
f43c448c2837c98f9aad434a95cce4400605b0f2af7c820e","Cargo.toml.orig":"d1fc79=
a63899b64a816fe5595b403c27ade4612ea58c0e88556c05d307b431f0","LICENSE-APACHE=
":"a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICEN=
SE-MIT":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397",=
"README.md":"cc952a506dc726eed3e128d47d62defbac4470bbb0e465f6a043ae8bf0c96d=
19","clippy.toml":"cf46251b0953d1a3c7a4f8f8941a08d8a416d5fc348dfe3f3c520eb9=
3fcc18ea","src/command_helpers.rs":"f878c574ad193473ef07d9b41afe4f7c27b735c=
c33492615a53c7a454aee3cc9","src/detect_compiler_family.c":"97ca4b021495611e=
828becea6187add37414186a16dfedd26c2947cbce6e8b2f","src/flags.rs":"1a80855f5=
1db6808cdcb5c0e6bd1c0973e86463014082ef7ed1d0fbe7b89cf93","src/lib.rs":"6139=
1623eed3591d6d06977867b7a772348daa1385c1fefd8e82ab8e9adbc71b","src/parallel=
/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b919=
0d85b45983","src/parallel/command_runner.rs":"1d17d9a037de93b31cc7ee6a914a1=
e1f6c1ac156cf8619f0014dcbaca6a0b215","src/parallel/job_token.rs":"1aa1ecc63=
9e09845eea0f1e11a76c39ad2604eaac3268059652f56add8890089","src/parallel/mod.=
rs":"bf156170790d40a76015a8c78cc2a391cbe1b60bb96c1fac1d047d26e342386a","src=
/parallel/stderr.rs":"b68d728087667fd568921d61cd40d0dc6b56c59bde6e671cb50cb=
0c43dcdf56d","src/target.rs":"a9d2d347a3a08015531f00b32bc8a7478f5636822cc8e=
0237ea9efa3f07d4cd4","src/target/apple.rs":"da9411b2c4db419e0fa39f765ee53b8=
665b3837fb39827679a53238734a4a1c1","src/target/generated.rs":"f93008829c57e=
9da3f5d6ac84643c04d8438a319fe9517533604dfe47e9cb8d7","src/target/llvm.rs":"=
525680a605fb57e038c3103d3efc9201c1af7b99162adf5dbc399da1d5007efe","src/targ=
et/parser.rs":"5ea311fc57b6a6d1aecd7e5433ee5f79b403b58e40be18650fdd81cf5146=
14cb","src/tempfile.rs":"77963fe55b63d3a30cccae46f763b8d61ed722247fe208e848=
5858770f6a67f7","src/tool.rs":"52a7bc134154fde7fecb1ef691f0179eb617e2f17a10=
d71dfa71afbcb061555b","src/utilities.rs":"ebb59ac01fb9588bcea0d0ee786e5d5a5=
696b4284a1245657625db03e830b72e"},"package":"509591b7bcd67f4ef775afad766270=
3b4935daaa6ec0e5605cfb1090b32a2b6d"}
 \ No newline at end of file
-diff --git a/vendor/cc-1.2.0/src/command_helpers.rs b/vendor/cc-1.2.0/src/=
command_helpers.rs
-index adedab2..c911306 100644
---- a/vendor/cc-1.2.0/src/command_helpers.rs
-+++ b/vendor/cc-1.2.0/src/command_helpers.rs
-@@ -315,13 +315,25 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
+diff --git a/vendor/cc-1.4.3/src/command_helpers.rs b/vendor/cc-1.4.3/src/=
command_helpers.rs
+index 57c49f4..da92b69 100644
+--- a/vendor/cc-1.4.3/src/command_helpers.rs
++++ b/vendor/cc-1.4.3/src/command_helpers.rs
+@@ -308,9 +308,21 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>],=
 dst: &Path) -> Result<Vec<
 =20
          // Make the dirname relative (if possible) to avoid full system p=
aths influencing the sha
          // and making the output system-dependent
-+        // compiler-builtins generates sources into OUT_DIR and reads the=
 compiler-rt
-+        // intrinsics from RUST_COMPILER_RT_ROOT, so try those before the=
 manifest dir
-         //
-         // NOTE: Here we allow using std::env::var (instead of Build::get=
env) because
-         // CARGO_* variables always trigger a rebuild when changed
-         #[allow(clippy::disallowed_methods)]
--        let dirname =3D if let Some(root) =3D std::env::var_os("CARGO_MAN=
IFEST_DIR") {
+-        let dirname =3D if let Some(root) =3D cargo_env_var_os("CARGO_MAN=
IFEST_DIR") {
 -            let root =3D root.to_string_lossy();
 -            Cow::Borrowed(dirname.strip_prefix(&*root).unwrap_or(&dirname=
))
++        // compiler-builtins generates sources into OUT_DIR and reads the=
 compiler-rt
++        // intrinsics from RUST_COMPILER_RT_ROOT, so try those before the=
 manifest dir
 +        let strip_root =3D |var: &str| {
-+            std::env::var_os(var).and_then(|root| {
++            cargo_env_var_os(var).and_then(|root| {
 +                dirname
 +                    .strip_prefix(&*root.to_string_lossy())
 +                    .map(str::to_owned)
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.99.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.100.0.bb
similarity index 77%
rename from meta/recipes-devtools/rust/libstd-rs_1.99.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.100.0.bb
index 939e5824b3..f08838ea28 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.99.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb
@@ -42,11 +42,11 @@ do_compile:prepend () {
 do_install () {
     mkdir -p ${D}${rustlibdir}
=20
-    # With the incremental build support added in 1.24, the libstd deps di=
rectory also includes dependency
-    # files that get installed. Those are really only needed to incrementa=
lly rebuild the libstd library
-    # itself and don't need to be installed.
-    rm -f ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir=
}
+    # Since cargo 1.100 the build-dir new layout is always enabled: each c=
rate's
+    # artifacts are in build/<crate>/<hash>/out/ instead of deps/. The dep=
endency
+    # files are only needed to incrementally rebuild libstd, don't install=
 them.
+    rm -f ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/build/*/*/out/*.d
+    cp ${B}/target/${RUST_TARGET_SYS}/${BUILD_DIR}/build/*/*/out/* ${D}${r=
ustlibdir}
 }
=20
 BBCLASSEXTEND =3D "nativesdk"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.99.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.100.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.99.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.100.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index f5865d4bba..1082c0d72a 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,58 +4,58 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.98.0"
-
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "00590657f2356d7163ca5ef2952=
83523974c340fa21bb94b420ce794f29b358c"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "a36f7ac98af20ef0ba6368aa=
ce0345efabbebaef7962eba99f47190fd256162d"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "5784379d73ac881d15a9e67eed2=
882cd58c747c276221c23cdf9aff37e015ff6"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "bc9b5636170e4b067794bfb896=
2c6f22b2aee5cb7358f4d9523072bb2976062a"
-
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "5244bd76687b64cd7305ef038d8f34=
9774eee494174899474535c23dcbeaa009"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "11c7a5cfa324e4324611793692a=
863490902bdff8b9ccd197404711cb8dc24d4"
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "b768fe07ae4bd233e5c3f864f93562=
0abb8b72139f7369c869e964a0c30ae419"
-SRC_URI[clippy-snapshot-i686.sha256sum] =3D "df4f34169dffa12cfc75fd246c750=
92734f2ff3837299531b0dad432d58f959a"
-
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "5af789de2072c185302377c=
0bf6af5f6ce518670eaec62363142d60a90209986"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "397eb65ab17005c709a8=
6e7bf7cb03d8aa9dae4303783a19c06ba8963247d537"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "e00ba627af9f098f0d9527c=
5b15f1a6886486c93f0139eee6f36cb104543a182"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "7bda4fb4a971d23598bd48=
8047fe8a4083f72c9af221a6018a84a8e304663c61"
-
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "a4848482dbb50b808495a32d35e=
d5c7a7a9de86d5c9d7de1ca34a5590ce6056f"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "ae6a38ebf8ab0b8bd20da34a=
edc3de6f78d8314f10a6e373bd76a0dc90f22133"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "4e5760b7898b00c5b772fe7b1e4=
8d75a0b4035b4a7d4de3ba6fc5b1544966196"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "a5c37e43b380adfeb14149ec0d=
9c4a76c985ec8d532ac669be9055094d05f166"
-
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "c9833ed9d2abde4c6b8f40674=
08e9ff4a758e4252e87257d3acf780c31d3531d"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "e33d1517443f93dcbf151c=
46e3969bdbe4c9df4c847455915eecd6caee08cee2"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "fff7e0ca647951a4a42c2272c=
857fa749e28746853190e8211849da35d1fb45d"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "02cc96e76c2ca4e22608fbf9=
080455211f0f6b51dc0ec7da0f54430181de7262"
-
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "a940bca1bce862b2233a5cc=
07bdfb3f24b285744fc6ecb6dbb174853a41bff6a"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "ec370e4ad9712cde2f66=
64f18a022bd8de34c71b8517040b4d14144fcf1ef3e7"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "98b90455b3c57086b7ee645=
6da1075c929a495ac76850411db1e3cf76cf0cf48"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "2318acbbf599bd57084e4c=
cc75252723fefd7a9f7d4acd03ee1513b41c212b46"
-
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "2f76a343190d8ffbe6c44666f=
dab32b6a6696a3e1176f6d84222b6e6221a382c"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "68ce716d38bcc15c6fe368=
6bc7133f5adbadd28f5f5a8a73ef1172b4f60149fc"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "9fcbf7ebb55a3eefdc2145a29=
b1cc797380edee0cee1163742c5ee06c4622347"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "12b08f51925b9eafae1b3ddc=
cbab49024a05827fa965e65dbccdd63422f84b1e"
-
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "c6e39df3937b6e2c2c66eb6740673=
8036ed80f79072d136e122e61747b139b85"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "c9bcf3eb8348e04502a49345a0=
847576e6c6fbd6600d566ef7cc74f6c2d06048"
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "0bc2062d88993fc590007ea2374f5=
e784fb5b7f1eec6c024b1fb3459ccd50212"
-SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "25aad07f775b7eaac2139f1f2338=
55f8fd81e40ea8450e2220ce9906bab5f123"
-
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "0e37cb339f447fc44d6d781073ba=
cacebfdc5612f2600e4c7e84c266f5f3aced"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "f5022e6c95a5ad23cca2513dc=
8281200f585fa188de6370aa37b128a43f876a3"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "2f512d170d3dd23e16ababcda32e=
e2e6d5172d861a7af1f504e0b1e270cafab9"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "646c6bd2450ea4c32a3c78ad7a3=
727294eea1f1519718a3f1487424021695ffa"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "7d150f9ec40eaaeb4ae453dedf5=
416855b9245420fd89203a5da420f692ead38"
-
-SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] =3D "81fec8bb25e1377e8f143=
c33441d12ac115781da496475ecca5601cc791be56b"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "9e0a10697c2e68707573fbcc=
01aa927d32b9652deb771ca87d69a9b7225580ed"
+SNAPSHOT_VERSION =3D "1.99.0"
+
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "89c0f1a3a44df63c95e5d5f2ba0=
93d0a12c5f5f57f8635f8a7a0ce50cf86600e"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "1cf7e2ef58ed1cfa6f1adea1=
8e155cbf254c1951f39e5f5e3376879f55fd64a4"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "113229fcc16cc1ba004923a4cc2=
75fbf3281dafaaf8b97269f9c00189d497fd4"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "42e49dc02d29949395c0c07258=
5961f6c9b5408110236087828d4e2f94ca96ef"
+
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "17d94ac00b3a5ae896022aabd9e73f=
b56f01881c9bd3d5095e08d9c9e608f4ac"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "b13902a225a6109588de0916783=
1da111c70a30bedb2d9b9754d9fb13dc6e558"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "a6cdcfd06454695375a3aa89c37b04=
31b5146d55b1111fc323ac92a15d1d087a"
+SRC_URI[clippy-snapshot-i686.sha256sum] =3D "e3295d8f8fc7658e8135a3fdad3a9=
f7d7dc34d38540f4efc720502dcf952fc86"
+
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "70e0b964f64c462ebb0b9ef=
1c4e08c3a87a724fbae16b1ca866127e68d4f5e7d"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "31418c9492c57eff5893=
f7d80d6cf776d968dfcfe1750be8c2bf2c05b19689d9"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "dd5901c5668513c0640fff6=
26aa7fce42d33ceb18afecc91e1163063ea859cd1"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "ef24b5ed352469eb5efd9e=
ed4e68928ff684682865a70c5e74c372b5d356f034"
+
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "ad672e3d515cfbb33e8e05d4fb1=
5a5dfa745988b9699f5b62d1cb9ba13dde81c"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "f2ce1424fc9272a64f358f8d=
28c72f277f7fa626c256f115daae0ecfa12a8999"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "a511dd7f315fe6097a12de73c1b=
4041ae6b5c2880e88ed2afba2b36d79074bf7"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "bfc3191f0086878a7e72b3362f=
8a36ccd9bb9a88ad14c122334443b16eb39f28"
+
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "fd891495f63d0aa1168875f8a=
0160ec1587d2ef6bb83979f03e9aa7c21ca8362"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "8b9ac17c3410a1ca895c22=
80c839fd1d1df7adcb6435137eb3030bb255ee69cf"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "18134aecb63ee24aa980c9843=
cf24bdaeb9c2dd8aeca832ae5b88ca5d8856981"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "388e0748e40ec77ab799806e=
1f48b615ab8e65220d3c9a6838dfa172bea8b4a0"
+
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "308c82f4c4ba93e7614a276=
60347ed6b419f3570c5bc1046f73d840b7728dbc9"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "8c1a6857ba1be316ff45=
3efc4d2aefd43756ecdb6d549a3d64be7351c4a55bdd"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "bbdf0aa56ce2dd7347e9a06=
861f9bd2d8015e2dadcf80edcb843892efc68174a"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "4ce616ff452ec0491876d0=
0fe1c89fab786b6ce7fd0289c0e0f47da1bfac7039"
+
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "80db2efdcf26ba75b1c38c6da=
896ff332d1bb6d0fbde6b1d2336a7ea475c6e40"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "646847eb1d0b58c5511839=
0a2b1a6af871e4bc581651b5047dcbdfd0a24629f9"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "999311c0ee828b3988f16abcd=
586d1189ebab6d37081197d89a9883c4b7d2134"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "c4ae4e5e03e3ce8c2f2b93a4=
b59e2f3c8f47a1647de29458f8e26e76079b0d61"
+
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "b598d8f89ac024fa9839de2393787=
eb85bed071528236f0a282e8100d852cb4a"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "ec386455256a3ef1d16bccb02a=
040cbb6978af565f716fdc26684054b19dd0d0"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "c6f4d75baf64f08a449d89d1f5cac=
b4e14a3be40a8623a00ea1530a6e3fa9d9e"
+SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "ad97b001f4c73442307434176fc9=
7cdcf7a80820d728f48bebfb31237ca8b55c"
+
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "77171ba2a0345fdf2abc4fedda55=
d6de078dae7a68527c28be8c77dcc9604bd5"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "3e58dff2d0b72196b5ea4e905=
36e174d400de88564a52694686b81e091169933"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "d7674918d28093097614cd9728b6=
ca60db9ea3038f640f0bd1e9a4188c7568ce"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "982442e32ad8dd3f0bb3a30db74=
038da5f71fd9bf1a865cc71da8ea5d4ec71ec"
+
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "0d2e0687934fd8f79e75a092e9a=
4c1240ca8346b61aa22dae0921a3d66274b18"
+
+SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] =3D "e63bf434820d6a2f95396=
428d1659dac8ef915bc1432d730091ae399518d5fbe"
+
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "ef4399ed88f527bb71b93758=
3a7e5bf36177d83fb55b8c58973ae146579c5ed6"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index b384a0c76e..8b5b59bfa8 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -5,11 +5,10 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://cc-hash-object-names-relative-to-source-roots.patch;pat=
chdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch=
;patchdir=3D${RUSTSRC} \
-            file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.p=
atch;patchdir=3D${RUSTSRC} \
-            file://0004-cargo-omit-host-triple-from-unit-metadata-hash.pat=
ch;patchdir=3D${RUSTSRC} \
-            file://0005-rustc-span-make-hygiene-encoding-order-determinist=
ic.patch;patchdir=3D${RUSTSRC} \
+            file://0003-cargo-omit-host-triple-from-unit-metadata-hash.pat=
ch;patchdir=3D${RUSTSRC} \
+            file://0004-Re-bless-tests-adjust-for-new-Cargo-lints.patch;pa=
tchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "6451598a99e77f07571960f6b21d577399d3a30f33e80=
cbd2e3a4aae6535d265"
+SRC_URI[rust.sha256sum] =3D "90dab90b8084eb57c35ae2b1d0b70c8e5138ace6023b2=
2c60a5a400f586f63b2"
=20
 # Point UNPACKDIR into the work-shared location so rust-source.bb and all
 # consumers (via S/RUSTSRC) reference a single shared source tree.
diff --git a/meta/recipes-devtools/rust/rust-source_1.99.1.bb b/meta/recipe=
s-devtools/rust/rust-source_1.100.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-source_1.99.1.bb
rename to meta/recipes-devtools/rust/rust-source_1.100.0.bb
diff --git a/meta/recipes-devtools/rust/rust_1.99.1.bb b/meta/recipes-devto=
ols/rust/rust_1.100.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.99.1.bb
rename to meta/recipes-devtools/rust/rust_1.100.0.bb
--=20
2.49.0

