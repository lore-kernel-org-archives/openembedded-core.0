Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4587.1795145383396461942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cXOwEOXC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5784f9bc1d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3TgUH2645298
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 19:29:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+1ifxZDnWu+MWsxSiidWe7RstX8m9Fm2thvRZIhS4kc=; b=
	cXOwEOXCt32gRaUwiU03fR8E3Gjkh3bMtXepjhILXn+zqjPp9p/27BazOzRbVg41
	1GlFI+kzsRCPDkl6sOkfzw3IweBxKSmPLItLSWAXqNpFLCs7XhHENPOs3oXAiV9m
	T6YWFbEU7LIdHhnOnCU7mJmRmaYTAlIRNp2JTRUblFOlgTtm93JrDG+b3xFFKMWm
	7Xt5aIdSwthTbSTBM2ohgcC3wUJUp1dIqRn75MuVOTZnQ1Pis3fEGzBhvOb8Yrje
	JszBYoIRyByegpFI+mt925a8SH3fHLVm52agLrMVUZ0pd4FLYLkq7d05qqeVe7rG
	5vuSKprFZ55+KmDQh7webw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020102.outbound.protection.outlook.com [40.93.198.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvdr1d7-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 19:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlBDot8PsU9PwvOeL4KikdKqhsBh8CuR8D3cxeUBui7NOsj996s1XsVq2uxvubc0IVz4wFFqM5qb8YftF4Xe46pyBLKLiFZ9p0iThFkRKWnqWWUFnZMESK38a/1A6p962g7GGRRxeRKrZDqYhQG+/RLPAU00SbgwkgeGYzzJwAzRroSUeBv1MqHfoOI+djLfJiT2IIM0hccd3RNwQDrC41pDxeKtv6dMnyGsAsckVFPFonJIURS1jIIBSgH7tv7F0MOrC/wuW8dQYgh4gD2oWLPaB/at0JHEl9RDwyzem1lcEqa+fxFAct5+XDGswcCvOn5tz0rRSpbtiMomsYfV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1ifxZDnWu+MWsxSiidWe7RstX8m9Fm2thvRZIhS4kc=;
 b=IHyz9a/Rz4o3lzgeQ6NgjdF2/jMfrDV0JnnOGBb8oYIqfV1QS1hA29GjZB/+4UBbkcT1lCUzPmOODorFE4LttyHcgM4ilWKh3RMTDqp+wM0i8hEFLU6Ngq5qDD3hMgO/18ugBkZpW3x3xy0/HD0h7vfVeLXqr8qjqpN5NdolfhpQqNdL5BlRAtliJ3cAKxTConWHEswVJ0EhWGcIRUaP49xzzI80pS7ZRHCa5eMREHJt8hczu31d8fvNB+lEoBoEFCklvq53OFm0wp0PcpwflnGMCb6m7mrQNEcXS6jLvXltVVSjwIgLLcj+YEWVCHDXnta1TDa/1+Rzs36d+mUNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Fri, 20 Nov 2026 03:29:07 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 03:29:07 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, alex.kanavin@gmail.com,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH 2/2] rust: enable dynamic LLVM linking by default
Date: Thu, 19 Nov 2026 19:28:46 -0800
Message-ID: <20261120032846.2692732-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261120032846.2692732-1-sunilkumar.dora@windriver.com>
References: <20261120032846.2692732-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0c1455-f1df-41bc-17c8-08df46b66f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|6133799003|18002099003|22082099003|38350700014|11063799006|261022115727099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261102130727099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info: v/cx6ZsYReRdBya5gnEI95HmeJq30+30779UN5K0E0/lGYVjtHtbaifQ/KmtGXqS4aLhfVSipOKHSzSUEuu4qCCrh8aq+wqIYUE2bDju0XjNaoaLojsZX7pKYIQ29FYHYynoxtJip6iBU+xg3jFb3lxFS6It3UTiSqS1xReMk+TEPCqDdKofW0TOSsWvIRVM5QU2+IGoa3CQ1EUM8jiuA2vQuz6C6+CIrHzOVZ4X6nziGalnBcVAzqu74btGSMJKCLy06ytlA00Xd7Tmt3+n9x2BxwTSWdQdiGnQ84CcD0RWqa9wLPenLiIjQXnAcQfk4L62zQ2iA9ilkr+CLaYEkrfbGTqUSlfgi7NdnahOd9tLhQUAD9f4sA7FpyuVNP8ijo4qbow/4Tnc1v9w2iPqJsgdsN3ZXh2AbZIh61HMsT7OJ0Cnr8t1GjC2z+sPwtJ300WpQu7gCvvZxdihdyJEnc4TQZ2DGXZ3s1nge7HKGzLrzv5Gd9mFsgghnviGrrw4Lqc0E5Yp/wJCaRpgM4FuP8RPklIuOaTcv7bNv9YQLA+H+W1AfueSdEKICrHvaqAmPKwO4dEAkovMegcyKiZ3IZhjrWOLram7gBEqT712NFylGvFKOv/F33/Hw4Db12i1TtfGRWMYmFQoi7DtQqgO4O5Ih74vyX+s8S3a99W87kc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(6133799003)(18002099003)(22082099003)(38350700014)(11063799006)(261022115727099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261102130727099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJEVJvnZk3gfkJUNpz9sBVFu2LHO7BqiNwkbsb09SGlb9SuZU26b8xVZG97o?=
 =?us-ascii?Q?kAra2Ilc7RqdlXfL+BR6FY5g97rfjmqpYZ9oHT+JrdxJ2lSsABkxZLB0YQ91?=
 =?us-ascii?Q?1qUuWPStlhZff71fPEItogvdoG1co23keNdqifPgExN4IueHZbw4G3YKcrbD?=
 =?us-ascii?Q?bOXhB8k/rC3Bje/Wby7H6WGysOqErotHxSQSAbQyecOZhc0+jmOYOT67T3J6?=
 =?us-ascii?Q?CMwYFmSjlNLMSuHDsOL3Z2YjiAO4NAmb81cdreIUjoBEKCbnvDiAr1BtSvzJ?=
 =?us-ascii?Q?DU+VsRA2y9cwLclQhkcSrdkBaGhp7boJkirOT1l5dIKOSDjUM444qkyAPlO3?=
 =?us-ascii?Q?4T4ldvDbmvrjoZWTERmBoElEdlGdztiWiI4NJo7fShAEV/0jE0HwtguNgWeL?=
 =?us-ascii?Q?n+56Y66DRZCsjJJ+Ym4HwuUFg5u3zKTKWcLTJJfuowNaMh6s1wSMkO8MczBG?=
 =?us-ascii?Q?rMiyYVbGvtaN//t2SK9QnBNgJmiA0NLqHmY3P+9tGg7xrqXaxZVKRVC8e32b?=
 =?us-ascii?Q?MtNpNvGY2fjBWK2CPPqj13+TzUXMRyZg8IZwLNuSUe9y+kKHNfmJsoWbQaAn?=
 =?us-ascii?Q?B+Aal1rCc3SUH0DXVhU9nwRP2kMYZC1A5qW9sCoMSRD5ZIIph1CS7mNmM29r?=
 =?us-ascii?Q?gcGuLZZvfyy/f1wab+56LGrzMX4EeT/tLFQTREWClKuz1ySSOU98ZE/lom8I?=
 =?us-ascii?Q?ncPKlXOTd3qheMtFOaV8qSY5rfBuu8s2a+dEMgFIx/avOFCcVyGP3MJ/jSWk?=
 =?us-ascii?Q?vvkomst7g+EbN0tqEa55xNl46CKq24oEPu801xsmuT5XO32rCb7jggCIMiXx?=
 =?us-ascii?Q?JQR4G36Go4y2n78F9XWX+lPa6FGBEdj/t3ybr1qQSiOqg3Mm5z/TMtAqoGA+?=
 =?us-ascii?Q?jOFsGhjL2qsY7EUPjIrG+6A5IuXuQpMcpHUL/mKg2J7CRyG/zycATRJH7ZaT?=
 =?us-ascii?Q?vbFfhgb74517IHekgyxuIFCb5Qv5lyk8B1lq7bX5ivbzMR/rJFmKfqeXi1KT?=
 =?us-ascii?Q?zU/Q7OVx3rPha7gBo55bZAlMsv8lbTIHhZ2RmlE6uFjtlVtfCL7yZTgng8zt?=
 =?us-ascii?Q?7satNbxLZJlD+XwjHoB2ZdIF9tYrmk1k8BG0RZPkqzbPSMueCfmO8Qb1Mdge?=
 =?us-ascii?Q?c+GFLD25Hp5WH2YVg9N3W9m8bpLfPo4PG/V0PMbM2+EB6Niv/7TP5ujo3XVh?=
 =?us-ascii?Q?qoofFUEMTxlT6UCvIKOyNdDB67rcc0Iz7vQArLyYx3nlGkxLNu4DKXd42Nw6?=
 =?us-ascii?Q?Ks9TRmYWgD6ItjslVOghzsTueLkcB5e7mhvu7YoK8sQoVX9qoNwW3H+HTs6Y?=
 =?us-ascii?Q?/v7obHiqLTshERm0QlFIPXONOp52eEqomb1QXrVX4Wx2zzTUWfr8YGq1SxrN?=
 =?us-ascii?Q?5clU45POeLWYwwyD8dTeY89D9j4QDs0RuL01jqsUQ6nLlCIMsTFbus2HNXpq?=
 =?us-ascii?Q?oIvZI/il5F8Cf+eg5iTx1SCO5VCKzbA5n50XDkBMCQBWr/Obtl1WocIyc+CA?=
 =?us-ascii?Q?yPc6RqkqeLCmOZiMTAfxWFQDTYrFFptciZ9sHQEuxpxDctWbmEpSX+XElEmr?=
 =?us-ascii?Q?y7HT723uM4QWB+obFZ7YbhuFdIV+zyXiRbeYDakUTy9kuKmQoyIP4+Do5ipn?=
 =?us-ascii?Q?iEMc5iuG7h2TbaKTuXaJVp1bHYSsdin6VqvRuDhocRz9ehNRWT4Ez72wWks6?=
 =?us-ascii?Q?VJegskB+/fbvS6oqfUnGydoqNTdrkS9O69N5/ZywDBtAZUmXa30od6PxjJYg?=
 =?us-ascii?Q?VYg6SeNAGwI+QeC9ljK0/P++EZd6Bqs=3D?=
X-Exchange-RoutingPolicyChecked: hR6xA+7REtFYkmqHOTDwcPGTXPyUmFPHFTtquYN8+shjqUgDGG7wP1XJq/uipcLyxHNcA6IYgZmx2iFrAJwi6gO4mZ/YwIm34c2rrHdrECTjsk9K8eQJkPD5CnLTAko34Md+OpzSlezc3UhvVCQWJ55Co2YQIHSiOiVn/JXc0+wPOnpGX0zf2AX/stCo+TlnoAOcyN9w2nG76gEfBDz/eLFLSryf/6g/NXxlT2qUyaZGk+LI0PrVCqW99M9S/qL8fQ5m812qzIRcIfH2S+kGU5/9gwdE47hyok3qwhF4pWyW0reKvCpdF4SWXDVNolfdOLsERIwY/O4F/tLZAtQ9yg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0c1455-f1df-41bc-17c8-08df46b66f3e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:29:07.5659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t46E+g7SeVKA0p3RUh4kwd3uyQ9lcPj2NLm97Nd4qtrOxNRwxY9AA4OIVSipOfbvfHaV85vwfTtoDERc1l1qdxv6edWsT/GidM2AXKoYBgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XL2l2ghE c=1 sm=1 tr=0 ts=6affbea6 cx=c_pps
 a=cPJgcE//urRiG05FhKkhAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=HZoeQendr94Jk7Y0Y54A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXxenvMZmb0G/i
 HuNAjKIG9lsyUw3i57RXgKQHSpFkVV0V6Gh53HSbJYXbmhK0M/GqDrNKf8Rn/KWdjQ7IuLYQtNa
 1OOIgkYTlW3VRxE6GBf8DCLU5fUlQfI0Yh+U+fwnV7h1HdQS7/hIkLpEEb4g1jKg79uuSkMuHWw
 gNFUhg/s1G/x8RU7jNjyQ7Ky+OrY5z2taSdGwKS9GOUI/vzRvtbh/nre6HVM8fI9LJCncxKlMbr
 vujjK5sU8I2C/8vtqza5mmP9RtrQQmMsPw6/qrY+I6UG7r2YxHfbLom/vCIEykDn1TopW3r12FY
 4g/WiBGrFKxLQXyu7EvUZrUYmOxFnKlauJTOp0MjS4ftcFjbJx317H0VnrMbm6ssVJEMA09UUHm
 AZ18FdK/B5uiChF6LtuipP77BqBPz1seRLJXtu4GejUuzK9ECWBSbI83aTLZd4znxE3zqzINBvz
 8NvoZPOPnX1RG4vaxsQ==
X-Proofpoint-ORIG-GUID: UeSVCIM3GxTGXXUejcJZenc26JJyOUT5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX3riWTvLUVNoJ
 Tz+mz+PZa7Me+rrTUBq0YrCUT6tfu187il+BQzWed0bw0qnEFMsqUEIhNDFdCD0PVZ5a994J/qU
 3wJFYFFmy+m6/KVsIDjiSBwnchq8/Qa7tkNXTggU82Vut2Q7JzGp
X-Proofpoint-GUID: _0jFI_wyyntdpJnRSOICeGrJwk74TP_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 03:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250726
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

Backport of master "rust: enable dynamic LLVM linking by default" [1].
On master rust links against the llvm recipe, here against rust-llvm
which provides libLLVM-17.so now.

rustc segfaults (e.g. in llvm::X86ReadAdvanceTable) when
rust-llvm-native comes from sstate built on a host with binutils >= 2.45
and rust-native is linked on a host with an older ld.
This is binutils PR ld/32991 [2]: newer gas emits R_X86_64_GOTPCRELX for
"push foo@GOTPCREL(%rip)" and an ld without the fix rewrites the push
into a call, so the statically linked LLVM code in librustc_driver jumps
into data at runtime. scarthgap links the static rust-llvm libs the same
way master did before the fix.

With dynamic linking the host ld only sees the exported symbols of
libLLVM and does not relink any LLVM code.

Add llvm-shared PACKAGECONFIG, default on for native, nativesdk and
target like master. Native only is not enough, target rust bootstraps
its own rustc with the target settings and crashes the same way. Remove
llvm-shared to get the static build back.

Selftest image installs rust-llvm-libllvm now, the test binaries need
it (master installs llvm there).

[1] https://git.openembedded.org/openembedded-core/commit/?id=d0671c3dad87a063b3a41dd07cde89b5684e692c
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=32991

[YOCTO #16058]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py      | 2 +-
 meta/recipes-devtools/rust/rust_1.75.0.bb | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 26f132edc4..b2ad7c099f 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -51,7 +51,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "rust-llvm-libllvm"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index b9348bf050..b2fac12428 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -20,6 +20,9 @@ DEPENDS += "rust-llvm (=${PV})"
 
 RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
 
+PACKAGECONFIG ??= "llvm-shared"
+PACKAGECONFIG[llvm-shared] = ",,,"
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
 # We don't need to depend on gcc-native because yocto assumes it exists
@@ -128,6 +131,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    config.set("llvm", "link-shared", e(bb.utils.contains('PACKAGECONFIG', 'llvm-shared', True, False, d)))
     config.set("llvm", "static-libstdcpp", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))
-- 
2.49.0

