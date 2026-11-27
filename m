Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16785.1795789345707317903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 06:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tAp1G7W0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5791710b03=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE2Eqb1144157
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yFJs/wxAIYN8C1nuNPQytICPcqqi6NO1OUcaWJmSPes=; b=
	tAp1G7W0n5imdaJmF0v+7xHkG7fBWxo6hIpAzjT8sYcvwfWOgL7haKT5CL/VOMa/
	MVVOAKoH5y5VXISVlBhzj5nhhNhrgqwuVs82O4LC7lGJ8lsXOfiE6yarNb4yLQNU
	cb94uOetulprQJV8a79s/nGzjVhZoN30fxtR1+c/EggjyKbZURzdsmBSC71YQc7E
	XsIydoduEyZuDbOVRD75c5K43F1j4Im+dMcjiWfCyIsK22+4Y2z9UHPfr/54xvee
	iFppdOsjdBcHol6D5o4GZ+BAawaSrHMV/ZuvntKhtkjrAqbW+8LAPvzCqSXhB0Ja
	aYK2Xj21Rc8G9oBj/c/1BA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020118.outbound.protection.outlook.com [52.101.193.118])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j51497t45-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:22:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGxDDDSX+BEEFwV00NP7UYbwxALXYcNjPDjTMKFgEOsKpK0vJEdxgljk0j3Xi2SX0wnRu7/rltEJSauMX19y9DxKVZ2o6SXLRsS58Mw1D2tz0LrDONyGHw7RzM2Y1N6BHyhk3KoV+PBFZAZlWVMpdzc52rWDysIvXrbSYiwcrKIJyZ0JFlMHw0Ji+M7/AbirKxtY6xe0nDYQOfhgOAZ3z41VthkJ7gOx9luQTTmZkIDeOWZsF9DUN0nusnUlWM+2vHEXOjnnZq+FhwsBjFqZTFyPwOIEZ4SgxG13N8cxWvEglF2swMZ7KPbOi9pf+6gX+dxP/uTwDniCB2erccpgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFJs/wxAIYN8C1nuNPQytICPcqqi6NO1OUcaWJmSPes=;
 b=oEmYMsHPguxRx7pr4sZr0M5HVIYPm+cYxq+XcrwBuNUJLlQ9NIwEVnQ9VeoLvtpu3GCsfCu5cRmX6WpvXev4P45Pu1CXd6tMyfVUhKISOizF8lVrauujk6u7fzCo+QZoIOciLCCn1N3PQyb7PLdgIaBKiZmAtWAIZimMKPn0Bpj/mgOEeDbAMtETBfcdc49rJdKJTxbQHG/74N4J5O0dYV6+oK6TcIw1q3HwuWPjryHwSV7fEmtr4kxSh0wU03SXkkTx/VeLG1t+nDZ3+0ulj9tyrDJ7pLRXc5iQRVx9UBfwHOIr8iLW2wTNJOJdHKB687LAV4sDYY8ST7zKDSmApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by MW4PR11MB6569.namprd11.prod.outlook.com
 (2603:10b6:303:1e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 14:22:22 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:22:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: SunilKumar.Dora@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/2] gcc: Fix for CVE-2026-115455
Date: Fri, 27 Nov 2026 06:21:51 -0800
Message-ID: <20261127142151.2824782-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127142151.2824782-1-Harish.Sadineni@windriver.com>
References: <20261127142151.2824782-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9bb57d-e218-4448-171f-08df4c91da1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|11063799006|6133799003|261009221227099003|261009223027099003|18002099003|22082099003|13003099007|260925022911599003|260925021311599003|260925021911599003|10067099003|56012099006|261102123227099003|261102124527099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: L1OEGgbBD5Wm5ChrIuvAQIGCT692bzqAaNPxrzc1gw7YpgwWAoAiNWa/vZ6UikGmjPS6GbbDrFiaWzh8195cx5Xlxrp5Fx9ogXmfuM/yxHVeAYsgA1ZZtFWTDRCwRBE5k/EYF8sn9BSdOsxzzw1x3R1nfa59V4hPvxCkLn18MvhH52O0bqzWx2iWzRTVz9VTCxOUuBoPdwTkEFpAYbXZTDu0Q++5PVPYBA9JVWZ+bPhPlZoMpQURFs4uuvxfEerUrXbFteVxuefzd37Hyp/zrrg9tpPT7HMn5UMNccvHV/+3JAsRs0iwGP8Msl6YQCmy1D3eixrRwlOtoH9L6DLrZZpnFelx+lW8naTJqxIC8KoNmEZQop5dYGmVO4ig0htBM4lMHohNOT6wY4oJfzUP686wO9rXkQBGBGyeMlzlOpIZnWAUFxq8v8oSU6BPLzp/2QVZBVVpAxVo5jjoOGuNaiudYUXQ5eEoB5c0jKsX3T8Cy4tpbHbYzOzI4kIeKwplJ2tLWFn7uc5iI3/pUL0MIxbTW/Zv+mCSv+ieYNI2Ls871qwZV8P2exSjiYzXwAn6lv+h0mLQ/RczvGdqQSNrHxCgYKHdBG3ydXGcRkRg6B6ys+5z7n9WKF/dovIgaVni8gKkPqx6OnGl0nepZf6sDeFg9W+B8PFAK9OcRRi1l6TQEIml8F8sKNXKOODKYCPh7nEBvw/lK1Sl1gt3eFh7rXygOTczw5FaFlGpqwz7t0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(11063799006)(6133799003)(261009221227099003)(261009223027099003)(18002099003)(22082099003)(13003099007)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(261102123227099003)(261102124527099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t8RnsCVbetsJV6f+aeIoShb6idHx5J18JqNNMpSHvlsAnXtQdOrfVyBe1H0X?=
 =?us-ascii?Q?Jo6jOG7p0eet2qWBk5YtwwVZbKdo0B5y7LRF4LdxsB5LK0o8mBa3jABAPX7H?=
 =?us-ascii?Q?wlXiOCrRnBd2RQbza9i/YydARWlXPBNqzHy78q0Vva44JuXlCYHP+pw8/s0R?=
 =?us-ascii?Q?PsyPe4UnsvpDaNUrtMN/UoAk+XAkp1X/HwxNHOOjcvIibnlp5y2SaEH0EhmK?=
 =?us-ascii?Q?4fO7TH73c59EFGnLIHyZZOABb7hJHsk0+J6seF4WU2TPHfwYLNt0N2xSaIzS?=
 =?us-ascii?Q?1qY1WNljB99P/ZbhBwtUatKO3vmaRvqqDmMvI/7XwglSVUo03jjFPptTrQzu?=
 =?us-ascii?Q?ZO7LMJ6InZFTj09nDxYNsKPZC9ym0FyK7qz4wkGO4tTFBJvkfchLmBBJtLAR?=
 =?us-ascii?Q?tVEd/hrnMgzhwo3aoKgKPmev7VnBngHDUfd0/ocNxVUWEffCAHeUwUSEbEKR?=
 =?us-ascii?Q?5aOQws3QFIt5p+CJoIj7Ivvn28bC1zN/AMCDqYNB/ZmmXkvw2AgSfFcCM64C?=
 =?us-ascii?Q?vlJBNEchDWt3vuqpYhz9fIR65cgDA/f7mC0jgMRWmuCm31h9NVPdEzi7Tlik?=
 =?us-ascii?Q?h6Kc1K0psNI0uVzTegW12H6x7bCc4meGkfmVE8dhAbx+Npvms6NVcnBrb74J?=
 =?us-ascii?Q?Nvp+o68S3DSfq6Bcx33pUE4uTT9CM2hcbbwUgnaf7v01+9dOCtjYMUlKWRRl?=
 =?us-ascii?Q?L3GNpD6AgagDpbzkpxlrnhjOUGfWD+DGX+qdKSTNaeX20qr+hwTJs+4jHkPD?=
 =?us-ascii?Q?HxgrjrEayKGnFE7+xyejwbgi2i/XMb+PaVzZbsXrHDdZwpmFfCcQAEnkcHiG?=
 =?us-ascii?Q?xT16pIETk6hMr2wO2c9aM1vOJrgRZKgon8wtMtAJs4vOFN4vXgvwaz5UWKJ6?=
 =?us-ascii?Q?bS3F6z3yckWpM/8257JkQCOlDPZF7xf8yG4iAhqWabFnZ/Yvjmvc7YEMmodl?=
 =?us-ascii?Q?DMYFPVArRV6ajvSPlJN8aNWf3qUR3AqoiH/c5w83rKPJZtNoqH+oqzm1Bc4y?=
 =?us-ascii?Q?r+3b3vdkX/9ypsTg5r9jZzhSMTIzix9zM5ozx6UgvVIELIELY5wa17aPpYg6?=
 =?us-ascii?Q?G5uj2i/1w8k242jSS5m4oz+RUz2twvpOg/X0cmEgDYOIXuMJapzcnT377zO8?=
 =?us-ascii?Q?dvm9mcN3WxHr5hTvZamPfidk/a/3LyFK35AESW2o+Y9kqGiC62WLvDBXOUYN?=
 =?us-ascii?Q?HTyEJvNtL5qDNgx5oa56Oym4G5W4tHh/FLicSEoevxI4fghqRcjcuFjHwoHl?=
 =?us-ascii?Q?71heUv2x9l0RW3dE7wIgr7/h0qWYrs22YYQH4+UGnWDpb2e3PXUbfwu1f8/c?=
 =?us-ascii?Q?zWkl+CYkdsLCRiyuaDfSnyOt173/Oqthf0evSOiqc5IJa/uOFt1jgrEwpmvy?=
 =?us-ascii?Q?9l6R2XMmwoUi4Omc80Uc/k0d+QQM5V4kYPlqQeakH0somaSfv1fEIpjuf3rD?=
 =?us-ascii?Q?HeQm+8iu/0+q9UwCatZHhl/ccx008ly+ALf7Z5CcPT5guAOuFsUhw/MxXxd1?=
 =?us-ascii?Q?OAqDGo2t4RGyl6Pgg7GgXpOLO+JQLdP18FgxvD2FM6wSqT5Zsgac/eqHzqae?=
 =?us-ascii?Q?h4z8rWiqfDr/GPRcR3v5nAD6GdrMYApGxisiFF8R/AGIZyUv/XUCp8SeI1YB?=
 =?us-ascii?Q?M6xkNj1r4vpk6FQ10qwGQTLe8SPnsDAod014MEhV+hqMZRqQtwA4QF1CYi1Z?=
 =?us-ascii?Q?e8JsP6/eWYtcVYyK4AgpLPW/7rBABZ71ZN2fDsOMztfFfCiwT0fR10zMD5hY?=
 =?us-ascii?Q?UKdYG34JdR80Njhih9wFTy2ET3Wb/IU=3D?=
X-Exchange-RoutingPolicyChecked: PXpebkqC2FDyux68SEQaeUt8H2yzrNUlsRzEsFQG08tXLMCfcV2xIbgNa3MJR3GeSOLlGc9HEQ0WLYHOiXLXIENNZChp6p+6ldxl0gwiOQKfRo0mzh84tnDJtLZwxy9am319OqgMxCIx2rJWlvyV4ULsxZuw7wXWZlNOuzhOZnQHucv2d5UXnYeiEcrMPD7SX55SUWkKnHuUPPy1tP7X7ZlYyv4hMVNJrI7fGb2JynYI8Vf7E3DEWuo3XCfpwSYEmJB3+qmtvZRvBTx5fzRpMqO27KZCT8tBpkGgrDYnk3rT8jREbyHEaxJGYk9T/ruZHweLTvyS1u3N6mWyImwCBg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9bb57d-e218-4448-171f-08df4c91da1c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:22:22.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRI5Y6WQZCE/kJlJLxci/LHa5labi+9xKTEZKfTQj32xrKifXh5/gv5MIV0sCg9sbRJMMRqBL0AU798guDSWgaFFUhI9ay9f7HkxLzia5Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-Authority-Analysis: v=2.4 cv=ScJi5fRu c=1 sm=1 tr=0 ts=6b099220 cx=c_pps
 a=+94yW41P0wWqy8Q+CvkqwQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=5uHtDAzNaJ_H4I_E8DUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX3ZvGP/pOdHWp
 ugo5czBRhLDcxFbWNF3eOCj5JI0ZBdpI+qziO+bKAA9YHBN2PesZewJfmGUbZfK2JnprhpwDpa1
 2x7I8CB8nZhpPi3Do5oN3bt9sjq3e8I/cGC9NgIWHq9qKn+bt5q2uDsSnKpKuM6FQ0AhRTBxykQ
 Eg2CfdnUW3f//AeTKLe3NmRqZhq/IpfbtFfCTA4JtA5dFgXaX09omtVVkPd5eiEX3rV+9MThDDa
 misa8zT8je4w7+PX3OPPi69LXNR+rMpQhBV/7+0aMHOnspqN6BVWl9/0IdfNfJJnEMPQyP4J5Zv
 OxDnTg5EtEkU9HtVXT09iNqmoqjGUuO2eXwq/T5qQBlzQEp03Jb5fglE9tAAJWg8cke4wL2PSTy
 54d8RUcjotNqHAn12pkBF/It+kYSSoBkXPR/PK3eDkG/kAWrDxSKXB5OD8QpjHFB6HzB5wY8NBP
 +783CmrhmaGKf1yhWvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX47C3BSY7GjJr
 T4X8w2C+8Nze2bZjd0V9JnGndKOx6N5PMHmy7kuCxQXXYav12vTwX9Jlc4QLbjCHc0I9tfL1iza
 RPlCJvS7svoMeyWZeGXAD0O27ioO7nXiDnzStnRAYRXAcMFkyw5b
X-Proofpoint-GUID: bKgeAh4WcxUiN-ObvhLmyz2dfEmwQLj4
X-Proofpoint-ORIG-GUID: bKgeAh4WcxUiN-ObvhLmyz2dfEmwQLj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251394
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix stack corruption in std::bitset stream extraction [PR124370]

The __builtin_alloca argument didn't account for the size or alignment
of wide characters.
Replace __builtin_alloca with an array _CharT[small ? N : 1] which is
used for small, or a heap allocation otherwise.

Refrences:
https://nvd.nist.gov/vuln/detail/cve-2026-115455
https://gcc.gnu.org/cgit/gcc/patch/?id=5d419c69ce2e6b86d7da75f18736904885674219

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0030-CVE-2026-115455.patch        | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 4361fbe208..f0779b14a9 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -78,6 +78,7 @@ SRC_URI = "${BASEURI} \
 	   file://0027-CVE-2026-125709.patch \
 	   file://0028-CVE-2026-115456.patch \
 	   file://0029-CVE-2026-114691.patch \
+	   file://0030-CVE-2026-115455.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch
new file mode 100644
index 0000000000..a695905b6b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch
@@ -0,0 +1,145 @@
+From 5d419c69ce2e6b86d7da75f18736904885674219 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Thu, 1 Oct 2026 22:50:13 +0100
+Subject: libstdc++: Fix stack corruption in std::bitset stream extraction
+ [PR124370]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The __builtin_alloca argument didn't account for the size or alignment
+of wide characters.
+Replace __builtin_alloca with an array _CharT[small ? N : 1] which is
+used for small, or a heap allocation otherwise.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/124370
+	* include/std/bitset (operator>>): Use array inside _Buffer
+	instead of __builtin_alloca.
+	* testsuite/20_util/bitset/io/input.cc: Suppress pedwarn about
+	C++14 binary literal.
+	* testsuite/20_util/bitset/io/wchar_t.cc: New test.
+
+CVE: CVE-2026-115455
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=5d419c69ce2e6b86d7da75f18736904885674219]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ libstdc++-v3/include/std/bitset                    | 31 ++++++++---------
+ libstdc++-v3/testsuite/20_util/bitset/io/input.cc  |  2 ++
+ .../testsuite/20_util/bitset/io/wchar_t.cc         | 39 ++++++++++++++++++++++
+ 3 files changed, 57 insertions(+), 15 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc
+
+diff --git a/libstdc++-v3/include/std/bitset b/libstdc++-v3/include/std/bitset
+index d581606e7dde..469c8da9ece4 100644
+--- a/libstdc++-v3/include/std/bitset
++++ b/libstdc++-v3/include/std/bitset
+@@ -1705,30 +1705,31 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+       typedef std::basic_istream<_CharT, _Traits>  __istream_type;
+       typedef typename __istream_type::ios_base    __ios_base;
+ 
+-#pragma GCC diagnostic push
+-#pragma GCC diagnostic ignored "-Wc++17-extensions" // if constexpr
++      static const bool __use_local = _Nb * sizeof(_CharT) <= 256;
++
+       struct _Buffer
+       {
+-	static _GLIBCXX_CONSTEXPR bool _S_use_alloca() { return _Nb <= 256; }
+-
+-	explicit _Buffer(_CharT* __p) : _M_ptr(__p) { }
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wc++17-extensions" // if constexpr
++	_Buffer() : _M_ptr(_M_local)
++	{
++	  if _GLIBCXX_CONSTEXPR (!__use_local)
++	    _M_ptr = new _CharT[_Nb];
++	}
+ 
+ 	~_Buffer()
+ 	{
+-	  if _GLIBCXX_CONSTEXPR (!_S_use_alloca())
++	  if _GLIBCXX_CONSTEXPR (!__use_local)
+ 	    delete[] _M_ptr;
+ 	}
+-
+-	_CharT* const _M_ptr;
+-      };
+-      _CharT* __ptr;
+-      if _GLIBCXX_CONSTEXPR (_Buffer::_S_use_alloca())
+-	__ptr = (_CharT*)__builtin_alloca(_Nb);
+-      else
+-	__ptr = new _CharT[_Nb];
+-      const _Buffer __buf(__ptr);
+ #pragma GCC diagnostic pop
+ 
++	_CharT* _M_ptr;
++	_CharT _M_local[__use_local && _Nb != 0 ? _Nb : 1];
++      } __buf;
++
++      _CharT* __ptr = __buf._M_ptr;
++
+       // _GLIBCXX_RESOLVE_LIB_DEFECTS
+       // 303. Bitset input operator underspecified
+       const char_type __zero = __is.widen('0');
+diff --git a/libstdc++-v3/testsuite/20_util/bitset/io/input.cc b/libstdc++-v3/testsuite/20_util/bitset/io/input.cc
+index b0e301a42b10..a01e48cf2847 100644
+--- a/libstdc++-v3/testsuite/20_util/bitset/io/input.cc
++++ b/libstdc++-v3/testsuite/20_util/bitset/io/input.cc
+@@ -42,6 +42,8 @@ void test01()
+   VERIFY( ss.rdstate() == ios_base::goodbit ); // LWG 3199
+ }
+ 
++#pragma GCC diagnostic ignored "-Wc++14-extensions" // 0b literals
++
+ void
+ test02()
+ {
+diff --git a/libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc b/libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc
+new file mode 100644
+index 000000000000..6c7c496daa17
+--- /dev/null
++++ b/libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc
+@@ -0,0 +1,39 @@
++// { dg-do run }
++
++// C++98 23.3.5.3 bitset operators
++
++#include <bitset>
++#include <sstream>
++#include <testsuite_hooks.h>
++
++#pragma GCC diagnostic ignored "-Wc++14-extensions" // 0b literals
++
++// Bug 124370 - Out-of-bounds write for wistream >> bitset
++void
++test_pr124370()
++{
++  std::wistringstream input(L"10011011001101");
++  std::bitset<10> b;
++  input >> b;
++  VERIFY( b == std::bitset<10>(0b1001101100) );
++}
++
++// Round-trip through a wide stream.
++template<int N>
++void
++test_round_trip()
++{
++  std::bitset<N> a(0b100110110011010101101010), b;
++  std::wstringstream ss;
++  ss << a;
++  ss >> b;
++  VERIFY( b == a );
++}
++
++int main()
++{
++  test_pr124370();
++  test_round_trip<0>();
++  test_round_trip<24>();
++  test_round_trip<1024>();
++}
+-- 
+cgit 
-- 
2.55.0

