Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11645.1795762051114890482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MhuUb6Vf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6l9u7166140
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MtmFBqokLELWFkySCEBOqrzyvovbxYz0hPBHPa5ZEFg=; b=MhuUb6Vf1RCI
	nvUk2CL3A+1z7NXS/lB767ziFJ4m9r5csvo3WFKhVLyqDCIQR8j8/+rQmJK1wSIw
	CJrbIG0oKcwBwGwopRV9t2sP6261V/Bbb8i/t6W7tVqgcdpFMV3rLASN49B2BxMN
	ZgspWusszcXTQd7M2LLpPb93puo3Dz6fiigJGsMWLw0gY10ksKryQqqrX+cXNCs+
	x9SzSL+ZOBvL17QFI++OPK6ND3uUNy2dNwcux/0bUPNcJxxBTULuAC0XQ1s8u+ia
	b8dt+hjsPR5RMoOB8ZdzacyLggADWRB5gIBDdtge22Xfj3/m/BQf3uKn3STmky7N
	2feNQDYOUw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023133.outbound.protection.outlook.com [40.93.201.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j60gh3x7u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWUX8BCzfD6S0Jre4Yj/3l9av7HCa1+v1DG1NNSu7AU7jYiCNWA2keMxz+L0fYxQjYDf3jml7nB+PFJIqeaC9hemDLNM9MkGW1GLScS8SkHK7mjHudXS7C3NNgO14rmbh9s4HgDDE+opSrmSbdZ8HfTJmHAcJq5l7q7af5wNTp15gc+sStu6RSCS7ZhGpOHiEwj9fmkYgb6vARHnAx1pkzsFt9lp4/9zPgpDzNDp91sZLmoIcUVWtXl9e5ojcjAMXZw/MR3u1eKUs0uruPkhRdKN7K4nC5EiWRfcex7hAjDOAaKKSNS4RxqH8UQBusF7vWrtn/uzJl4c/yHYG88iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtmFBqokLELWFkySCEBOqrzyvovbxYz0hPBHPa5ZEFg=;
 b=hHH+K5ENdsm+Im+nUWikgacWFkJzOg25oGDoPxpAehoSLvvnVqy77UO977bAbhfy/CPZXpZDiM2/QAeThWL7Z1xUR+Cd1F09SWJlMb4haVvPzzLqRGhoncMyGUBMWZJ4Rbkb1J0XGAWjYSFXTnELMkZ+oC8Py2VWe0HmaLifTDgGnBZzC22+4NqKqfTTI1HirFp5I3hr5fOyhcIRc+vqDb7hfEPRnQv/+NsZU+0SSPxC1Rc7T0d7P9x5MuEwcwB6RBBEtsXSxQv2vHi30ipAqxMGMPqst7YnUgO4fXk4WMLkxAyLt/Tj0cLjPqTX3m7q3ZgosL/ciiqra6l3LnLlxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:29 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:29 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 4/8] libconvert-asn1-perl: fix CVE-2026-126682
Date: Fri, 27 Nov 2026 12:16:55 +0530
Message-Id: <20261127064659.2169695-5-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
References: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|FT1PR11MB780136:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd30654-7700-4af1-0baf-08df4c524e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 2FxKGRzDzAShOtJPUpgZIAi3KL4Wrapy6bal1uVs69GNQxEGC1Xfg92p9EzIjQlGAusICFKC/PE8uLQk1zpfWPondppUKavfTXp1W+lTj5Nl5/Q9MAaYS5cZ4RYGJn6RL4k2iHNLaUtDZDiTJz62U7qNgq+YsO2jZViRGWQYWWrGxTbfkSJ6eQLIKL1VEv823dtOzUmqfjdRiZX0pSIEuIy6yXQpeYdqCNWIxDi0E/0iAg0y0lRcevjKetB3YFIGF+fO1bPuTyb/sNQfNemQ4ZlGMRBSc2mmuYdYdVejziBYDfJm0tl0zUWWBXIcu8Lu+NJtlZAvIvlYw801hTtD+3ssx6N3lafGnLnt/whmt+ni3NNPd9Kbmu3agCG30SwkD628WEI6gxYxmYWYHDqts5RgsJGJTwnlbjJleKFUxSABD2qC7F6+Z8UR69eqcisTeJ/BAm+H7AlR5Z7lMEp/cQEMpgFS2gnlGnII2ID0yHcHYE9X0I6ouUgIryu6vXy1Qj8eyaMMZ3du9XzAu5+55FEK4hHhZuA1K1hlOUpzETf5FD1DGIDdz8uFSmTHX5AYRtXskvSQ+wYVEzqJJNELo4ceNiFJQFdBGu03dAmyLTdbDQ/BglbCj+ZLI8G+C5gLHoZOa7pgUlr0hCyXIJaZ+0gyjhVjN/jLD0M2sXlENiktroAHIkIRoTUCWk+y5Ez4WZY25bhFtWxUSmO15+qIxQQ+YG/PHUDt/JXP1wORSbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TAaWfnOPQ649PwuKVWS4CbpnyvpxSvAEu1eMiNglQy6mJnoCRMo4OUu20R7K?=
 =?us-ascii?Q?aPPbl/PtVaVy3RnBk38LFMXj9qulNwlgBYXK8LX28DQxNbQFnCIBPZdL20KG?=
 =?us-ascii?Q?6oI1FPKFSOHf8zERskTJaceyv1oI2Qjov0aKVN2Nzja7bx/lHpshFEcuueGi?=
 =?us-ascii?Q?chJY7+ggKCm8BBVGTSkmN0lCb/KnKjScR+JI16hthWyKX6LWbCT1JevmY4CY?=
 =?us-ascii?Q?CJfpLbLYvxwHjJ/tIw1ckhHarDlQ77uVZVt/Ui7HH/qH91IKRn6tyGHdwngb?=
 =?us-ascii?Q?ncMWgi6JUgijUiLmqrtd8YK6WqVR3TeB1fJYUfu3XyVkCLMRUkVCe65dZDr8?=
 =?us-ascii?Q?uuboyqjBk92JyUnO+v++ETAzgOthvfizGvHXRgtstneY16Geq6+8r265cuL0?=
 =?us-ascii?Q?mJK2PpGBW01K7ljJ20qwjjilO4nCbIIN8vhaHquzaxRUjAnMfATVgZjItq3g?=
 =?us-ascii?Q?3eGecSV+Lhyb79Aa2go3GXy0bm0doNrIoc0DG6s2MvtlJSnnCNO4vE8M7QUr?=
 =?us-ascii?Q?ISCaDQo/RdBB+KgDjGZWM6khLrt/UUbRYLe0i2TDacDuQvW5Tt0kNtYjKM8a?=
 =?us-ascii?Q?fqT/Mngm11REqZsKG12OGj9QtLdDelg+CakdQN0oIZedc9zOZ3vaRvX1dnLT?=
 =?us-ascii?Q?aR3Io9zGkUhnxSj6qny4qLmsQ5ozTYY4PFx+xjLyz+jFrztFGBZaXDe1xsC1?=
 =?us-ascii?Q?6EQt/aNRxQcQKhYuPoQvPh8XQ1niG6zXR9KnO5InUPnTyLumnnMETtsnBqCb?=
 =?us-ascii?Q?HFjnWXC90qyXi1bIEzLMBczzM1KcIuGot58Zzeu5jGnlY00BqJiY+2FKCuLs?=
 =?us-ascii?Q?NZVB5J3AQYGlhLUavJfAauHoe3p6bsQ+Ey/csA+B0a0LA7mABD5kXHv32lXV?=
 =?us-ascii?Q?0ri/UTS4dW50/gSCgqfBFS+gkWFygw5Atw3ugeQV4h3smuN86Ws1jGmkKoCa?=
 =?us-ascii?Q?vTUYz8RlJeA532RQgWmO5s75quMkBf5Mbb4wYiXOC5ccBaOeKBVAJpFFB3it?=
 =?us-ascii?Q?C2Lzk4+02iYgz5db84TrjJfBcLxBLdpNfIgSlP9Wh8smQFdgNpH27X27zHi9?=
 =?us-ascii?Q?KVIQi59AEQYbZLMH/HVPv16lsKPSGQXku9VIp1830WriFqwuge1XghU0kveM?=
 =?us-ascii?Q?tmNFH4F6bPfC3zXekB59IOP/cAe8uPJXITsuAChFzcL60IdvI9sN1mRk2oGg?=
 =?us-ascii?Q?1D+g1Bzl77SrcAh79gjAPDLIc3ZUUgNAN3ZYsMpE3uEQV34Fw5rhUGyy5x8m?=
 =?us-ascii?Q?Cs+orm6ub41vcCRCmahyAb05l1n5s9KWmdfwoCh/RZeG8unKD0+Ii8x4f66Y?=
 =?us-ascii?Q?EYGSAF+is75JWZdLAHx9HlM7wjQurR610w3eZLiOT9tUKi/hpgDCmshzscO/?=
 =?us-ascii?Q?8lqs5R0p6+UkksEtj75vkpBEJydqIZOXsZiAGmZBsiKbZ4WbFIuKAD19UbSL?=
 =?us-ascii?Q?Ut9R+gQ2MvMO86LdjDuT+9aqa7GMRLUPIIrcZwXAZDnMICBvGiA4C3++7+fX?=
 =?us-ascii?Q?BKNuuaTVjD1bIwviLphQAnvg12qoiXujiqWYKBlHEUkRYcR1pJxnmExAUTLo?=
 =?us-ascii?Q?l1hFWn/QlXzR2AgfFqD/X5Xuy2cr3Ksc/g09kq35+SMo6KNivDGKd1z+TZoD?=
 =?us-ascii?Q?C18J/zx4lJPn3xP6LpnoVBpebu0iyBam0BWth5nyzJ40aOOIznMjJPwEC+2W?=
 =?us-ascii?Q?uCNMK/ifArfo1MD4Tz92MGGbaairBYL4PV9eTbIPLkh4Ys5M7feyqCOJYiuu?=
 =?us-ascii?Q?BgEyeDvB9ZZbaUTeHqlp33LsSdUrC7o=3D?=
X-Exchange-RoutingPolicyChecked: jaj39xFIURssEjm2jp5KzOv3CpI3z+PEEgiaO/SYE12NOnY/XHlcp/i0uNO1cvcLpDqiNrINQHLNq7ujMfhNMDXkWp8S7ckjQKNdmTl7WH9ENTlamQ2CJaFpLjwINYaaH1lkxxO6zyGTGE0uO44Gmwz/+lAphCLhyIm7/mGPIAcRBN3DVCmi36OJ3dgsmDjmpeg5iM9DPz+dPX3w53hQCLJfvzqV5cnNUf8yXznok3zrmgJ9bzZZt0buEFmr0NZq/P2AQnxzuad/LAOSYfomYFnfVjoQNAPzQSo2zfSBSc2LcdktE1ZoTHC/+LMKP9si3HOTJDLpBur2wVXQCVzm3g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd30654-7700-4af1-0baf-08df4c524e0f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:29.2812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezWd0DhLc0SgGsRIe3RKwbwXo8Tl6UVpb7grs9HrqlwFnBA6fQD7ADpg5Y/8KBvTxXrGP4xRXAMOg45GYWKRGuPYZ7wv9ivc3ZpuZ339H04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Authority-Analysis: v=2.4 cv=R5SWitRX c=1 sm=1 tr=0 ts=6b092782 cx=c_pps
 a=vRE8MZZT2q/xz/g36YwB4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=4kGSsMWPG3EPgkU54KgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FWM2Yw9TwUcEDjYlKuUnQfS7C6EK5ORw
X-Proofpoint-ORIG-GUID: FWM2Yw9TwUcEDjYlKuUnQfS7C6EK5ORw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX72OYOIk+gY/j
 /FLOGznUG3CQijx0H4vHywku1WMGLXRNl7PwhQ2WgCjg1KZ0/o9I3c6jSu2eOXroZ8zDmSVzhDI
 Gikbq+y0ohE9kcgNCG2P674GDeSk6ebH/hC0mlLy8NbyM+BHhjHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfXyUiO3qLF5UWr
 z/ITd1aMFgkX81zmpOcEUInLxAGqcZ2w5TFmwHQSUEwjx+hrtITcQxEjNIuFFhxv15bJTwLTAwa
 8SVquSfPCjNIURWRFXrrjUugnmbNy0EePOICYfKqZOlXMlKlCO3I+9RvVUfC7KuyJcHFN+bo89F
 Sd3xIFcIuziK8TZ4A7cIqiG1h3nX4F/RoSWsQ4cvmA+jyX+2ExJHhRDsFyfqRaUw0OrTgbDGv4L
 VvLyuHA15hjLazrhp1w66G2pWMJclL6LYtZiCsr/e9KSNy8kM27TmRRBpmhg4deRPW+ImGLZzIk
 9L9z0DpnBYhDjj0/jidSmQTWm3ClRCUu380SxcFLZGfyPvcFtTZUGYorqMfGH08oNFf+kemj/aa
 olH9WSclMRBFxR58A9rlD8vEPWzej0WY1jDKIV/IMO8ECdIJTHNfpGs3VGQ0+XXVXfwFLCAtphG
 cO7KntnBlrRou3gbfbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251347
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 contain a flaw in INTEGER
encoding that can lead to CPU exhaustion (DoS). A crafted
exponent-notation value (for example, "1e8000") can trigger
expensive Math::BigInt processing, causing excessive CPU usage
during ASN.1 INTEGER encoding

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-126682]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/f259213110a90f38cfd1c7e7ff6789178ce9105f]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-126682.patch                     | 204 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |   1 +
 2 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126682.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126682.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126682.patch
new file mode 100644
index 0000000000..984fbad351
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126682.patch
@@ -0,0 +1,204 @@
+From 48ab5bee001fd6f4f03a3830c4e47496fbc00696 Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Wed, 11 Nov 2026 14:26:12 +0000
+Subject: [PATCH] Fix CVE-2026-126682: cap INTEGER size on encode to
+ prevent quadratic cost
+
+Add a max_int_len encode option (default 1025 bytes, matching the decode
+limit) to reject oversized INTEGER/ENUMERATED values before they reach the
+bigint conversion loop. Exponent-form strings are sized from their exponent,
+so a short value like "1e100000000" is rejected before the bigint class
+expands it. Non-integer values now fail with "INTEGER value is not an
+integer" instead of a pack error. Document the option in the pod and add
+tests.
+
+  $asn->configure(encode => { max_int_len => 4096 });   # allow up to 32767-bit
+  $asn->configure(encode => { max_int_len => 0    });   # no limit (not recommended)
+
+CVE: CVE-2026-126682
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/f259213110a90f38cfd1c7e7ff6789178ce9105f]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1.pm         |  2 +
+ lib/Convert/ASN1.pod        | 15 +++++++
+ lib/Convert/ASN1/_encode.pm | 27 +++++++++++-
+ t/24enc_integer_validate.t  | 83 +++++++++++++++++++++++++++++++++++++
+ 4 files changed, 126 insertions(+), 1 deletion(-)
+ create mode 100644 t/24enc_integer_validate.t
+
+diff --git a/lib/Convert/ASN1.pm b/lib/Convert/ASN1.pm
+index 65b8f7d..2db922d 100644
+--- a/lib/Convert/ASN1.pm
++++ b/lib/Convert/ASN1.pm
+@@ -372,6 +372,8 @@ sub i2osp {
+     my($num, $biclass) = @_;
+     eval "use $biclass";
+     $num = $biclass->new($num);
++    die "INTEGER value is not an integer\n"
++        if $num->can('is_nan') && $num->is_nan;
+     my $neg = $num < 0
+       and $num = abs($num+1);
+     my $base = $biclass->new(256);
+diff --git a/lib/Convert/ASN1.pod b/lib/Convert/ASN1.pod
+index 80fea5a..8acc9ba 100644
+--- a/lib/Convert/ASN1.pod
++++ b/lib/Convert/ASN1.pod
+@@ -126,6 +126,21 @@ converted into a big integer object. This option controls the big
+ integer class into which the objects will be blessed. The default
+ is to use Math::BigInt
+ 
++=item max_int_len
++
++Maximum number of content bytes permitted for an INTEGER or ENUMERATED value
++greater than 32 bits before encoding is aborted with an error. Prevents
++application code that forwards an untrusted integer (such as a search
++size-limit or paged-results count) from triggering quadratic CPU usage in the
++bigint conversion loop. Defaults to C<1025> (enough for an RSA-8192 modulus,
++which requires a leading sign byte). Set to C<0> to disable the limit; negative
++values are rejected as invalid. The check is applied to the final
++two's-complement byte count, consistent with the decode-side C<max_int_len>
++limit.
++
++  $asn->configure(encode => { max_int_len => 4096 });   # allow up to 32767-bit
++  $asn->configure(encode => { max_int_len => 0    });   # no limit (not recommended)
++
+ =back
+ 
+ Decode options
+diff --git a/lib/Convert/ASN1/_encode.pm b/lib/Convert/ASN1/_encode.pm
+index e9e0bb4..44852ed 100644
+--- a/lib/Convert/ASN1/_encode.pm
++++ b/lib/Convert/ASN1/_encode.pm
+@@ -6,6 +6,7 @@ package Convert::ASN1;
+ $Convert::ASN1::VERSION = '0.34';
+ use strict;
+ use warnings;
++use Scalar::Util 'blessed';
+ 
+ BEGIN {
+   unless (CHECK_UTF8) {
+@@ -86,10 +87,34 @@ sub _enc_integer {
+ # 0      1    2       3     4     5      6
+ # $optn, $op, $stash, $var, $buf, $loop, $path
+   if (abs($_[3]) >= 2**31) {
+-    my $os = i2osp($_[3], ref($_[3]) || $_[0]->{encode_bigint} || 'Math::BigInt');
++    my $biclass = $_[0]->{encode_bigint} || 'Math::BigInt';
++    my $digits;
++    if (blessed($_[3]) && $_[3]->isa($biclass)) {
++        ($digits = "$_[3]") =~ s/^[+-]//;
++        $digits = length $digits;
++    }
++    # size exponent-form strings before the bigint class expands them
++    elsif ("$_[3]" =~ /\A\s*[+-]?0*(\d*)(?:\.(\d*))?(?:[eE]([+-]?\d+))?\s*\z/
++           && (length($1) || (defined($2) && length($2)))) {
++        $digits = length($1) + ($3 || 0);
++    }
++    else {
++        die "INTEGER value is not an integer\n";
++    }
++    my $max = exists $_[0]->{encode_max_int_len}
++                ? $_[0]->{encode_max_int_len}
++                : 1025;
++    die "encode: max_int_len must not be negative\n" if $max < 0;
++    if ($max) {
++        # estimate byte size 0.415 = log(10) / log(256)
++        die "INTEGER too large\n" if int(($digits - 1) * 0.415) > $max + 1;
++    }
++    my $os = i2osp($_[3], blessed($_[3]) || $biclass);
+     my $len = length $os;
+     my $msb = (vec($os, 0, 8) & 0x80) ? 0 : 255;
+     $len++, $os = pack("C",$msb) . $os if $msb xor $_[3] > 0;
++    die "INTEGER too large (length $len exceeds max_int_len $max)\n"
++        if $max && $len > $max;
+     $_[4] .= asn_encode_length($len);
+     $_[4] .= $os;
+   }
+diff --git a/t/24enc_integer_validate.t b/t/24enc_integer_validate.t
+new file mode 100644
+index 0000000..1cab859
+--- /dev/null
++++ b/t/24enc_integer_validate.t
+@@ -0,0 +1,83 @@
++#!/usr/bin/perl
++# Tests for _enc_integer exponent-string validation fix (F5).
++
++use strict;
++use warnings;
++use lib 'lib';
++use Convert::ASN1;
++use Math::BigInt;
++BEGIN { require './t/funcs.pl' }
++
++print "1..23\n";
++
++my ($asn, $ret);
++btest 1, $asn = Convert::ASN1->new;
++btest 2, $asn->prepare('n INTEGER') or warn $asn->error;
++
++# --- 3-4: non-numeric strings are rejected ---
++btest 3, do { local $SIG{__WARN__} = sub {}; !defined($asn->encode(n => "12345678901abc")) };
++btest 4, ($asn->error || '') =~ /not an integer/;
++
++# --- 5: plain large integer string encodes correctly ---
++btest 5, defined($asn->encode(n => "10000000000")) or warn $asn->error;
++
++# --- 6: Math::BigInt object encodes correctly ---
++btest 6, defined($asn->encode(n => Math::BigInt->new("100000000000"))) or warn $asn->error;
++
++# --- 7: negative large integer string encodes correctly ---
++btest 7, defined($asn->encode(n => "-10000000000")) or warn $asn->error;
++
++# --- 8: round-trip of a large integer ---
++$asn->configure(decode => { bigint => 'Math::BigInt' });
++my $big = Math::BigInt->new("1092509802939879587398450394850984098031948509");
++my $enc = $asn->encode(n => $big);
++btest 8, defined $enc or warn $asn->error;
++$ret = $asn->decode($enc);
++btest 9, defined $ret or warn $asn->error;
++btest 10, $ret->{n} == $big;
++
++# --- 11-12: default max_int_len=1025 rejects integers > 1025 BER bytes ---
++# 2^8200 encodes to 1026 bytes (no sign pad needed; i2osp msb is clear)
++my $huge = Math::BigInt->new(2)->bpow(8200);
++btest 11, !defined($asn->encode(n => $huge));
++btest 12, ($asn->error || '') =~ /too large/;
++
++# --- 13: max_int_len => 0 disables the cap ---
++$asn->configure(encode => { max_int_len => 0 });
++btest 13, defined($asn->encode(n => $huge)) or warn $asn->error;
++
++# --- 14: max_int_len => 2048 allows 1026-byte integer ---
++$asn->configure(encode => { max_int_len => 2048 });
++btest 14, defined($asn->encode(n => $huge)) or warn $asn->error;
++
++# --- 15: negative max_int_len is a hard error ---
++$asn->configure(encode => { max_int_len => -1 });
++btest 15, !defined($asn->encode(n => Math::BigInt->new("100000000000"))) &&
++          ($asn->error || '') =~ /max_int_len must not be negative/;
++
++# --- 16-23: exponent-form and '+'-signed values encode as they did before the
++# integer check was added; huge exponents are rejected before bigint expansion ---
++{
++    my $e = Convert::ASN1->new;
++    $e->prepare('n INTEGER') or warn $e->error;
++    $e->configure(decode => { bigint => 'Math::BigInt' });
++
++    my $r = $e->decode($e->encode(n => "1e20") || '');
++    btest 16, $r && $r->{n} == Math::BigInt->new("100000000000000000000") or warn $e->error;
++
++    $r = $e->decode($e->encode(n => "+5000000000") || '');
++    btest 17, $r && $r->{n} == 5000000000 or warn $e->error;
++
++    $r = $e->decode($e->encode(n => "-3e15") || '');
++    btest 18, $r && $r->{n} == Math::BigInt->new("-3000000000000000") or warn $e->error;
++
++    btest 19, defined($e->encode(n => 2**64)) or warn $e->error;
++
++    my $t = time;
++    btest 20, !defined($e->encode(n => "1e100000000"));
++    btest 21, ($e->error || '') =~ /too large/;
++    btest 22, time - $t < 2;
++
++    btest 23, !defined($e->encode(n => "12345678901.5")) &&
++              ($e->error || '') =~ /not an integer/;
++}
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index 9de25f3f73..40bb779c03 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -9,6 +9,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
 	   file://CVE-2026-126540.patch \
 	   file://CVE-2026-126568.patch \
 	   file://CVE-2026-126576.patch \
+	   file://CVE-2026-126682.patch \
 	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
-- 
2.40.0

