Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A93D6E2D9
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 08:33:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9021.1732091575569062553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 00:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10540dc7d2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK7O3Ld029019
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 00:32:55 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq3t8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 00:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DON3rNY3Uz+aIeaD2eHuSHhGXaeqR1MSnpWNcx3wAtDY3UrpH3TPr4qcfqsfLjKJGvjAjtca2qoB5uPvsTjDwlzvGwM0JpGkPBMuFTy8Ek7bKHzzWJGHENWxJXaJ0LvdMRKW5T00yqpzPQm/GBdgJ3WjNiAVV6hNhovULb8fwAM5V8pQ4cEnhwtganGYUdlw5KlhXGujHjlYrT9tB26anTLe5ZnVHIfSp3oZsFgmZApbA28ttcbqrY3/mMzy5bL1Q5k1kj/A5quG+1fSajgVkgKvM2HuLwKtW68Chv2EuSiztT8E6X46nGx9EpY3JKn0pdSCrAVM/nj8VT6t8KLkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8GwYk3Iy5YwqPXlO8ScX3omUinObhrStqNYdf35qi8=;
 b=MOxLIARBl++fceE5oBNUc5ZcKrHSYqQsdbYFg9AOhvjNa1ot7ddtkqHKarHw89ePhQNDbt99Tox+krzBxo4muSPky5meeld3nc8yt/n+ItrtXPCS4xutc/5UzSGT1pY0wBKA3LsEzqIrftWq2mckrUq+YnBjPVDBl06G0z294wdGOu8oD1i4mmG8igiR7t8IVrWNbMNELRPKs0jkTG2NDA8+rBDuoufaqIo9KP6qDLxAf6JMkKIqRGxGwDmaTu9WPxhrIc6jPPOfgzef9eCN98QWwCbZ8eSsmdKgeqTJNX6JRV6K7RrvIRQJFXwEwqFlJRM8G4HRwL6c2wVBvMhRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 08:32:51 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%5]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 08:32:50 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust: Upgrade 1.80.0->1.80.1
Date: Wed, 20 Nov 2024 00:32:33 -0800
Message-ID: <20241120083233.1277317-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d8b969-2625-4714-a498-08dd093deb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Cr6CnsgYtadxELPPauf4pUjBObvMNxkahjO0FMB/JCI+R7t5T+CelsW9DZA0?=
 =?us-ascii?Q?sps9UXfK3K293JkOSzIXooO/4BKmj3VW6XQIU4ySB1cDFwc68Hs3vhI9l6Xo?=
 =?us-ascii?Q?E8pWlywY57Vuxa+kJviixBXfA3ZvGCNRIs4jPhvbc3WyAAVjqo8X36SY7vsf?=
 =?us-ascii?Q?c6AnbDk+PE+pLb3GqZPo5jREUNYkP6ZMP5+eJa2OITQ4lr83EhG1uRWDkbOH?=
 =?us-ascii?Q?M3fPsvq+IPQjf9VLWIcYMof4a+RCsv4bqKcgx14Uk2Tl+M/87eDKvkxcJKD1?=
 =?us-ascii?Q?YVorWUeZsCA/SLUK7drxzBjH4xq0wY8T/DL1giS3E4S7Y9xSVSLzmdeJKlk3?=
 =?us-ascii?Q?WWurV9G5qfJE5AHnn1zvjjrMOS6KFZj+tkBdKVdPyW317SNH/j1KE+WVYIUR?=
 =?us-ascii?Q?NG7RyPvtzyiQr4lDwQD68/Xjmxt5waUGfDcymWL5bQuMbsbVU5dRx2H5l8X4?=
 =?us-ascii?Q?HS8tm5HwKpxYPrOKnawsK+YguStA+RRi/cUYcAnpZA4YrNgBorRNoYqwGpe6?=
 =?us-ascii?Q?wiXYADCA93f5/arcJqB+vtYf+iZoDjYZfDo88zJSJJX0a7QH4+avX9juWeAW?=
 =?us-ascii?Q?071CKaX+PItJH0sGZ9IZ1m7sOJpY3QHU4iy3DcB8CLMc8Y8kFNwINnqDNHVd?=
 =?us-ascii?Q?x6x+BoPP3HZBnil7AamGM/TKAmuGLWchHBCAKf7q/OIArEkJj4+PDXiWWfHL?=
 =?us-ascii?Q?wS+shBp9qZgxDY+5vm3U+xFnRZYUCbDFaPfZ3lp5MDdNPBZRTzFhFTPCZ9q6?=
 =?us-ascii?Q?xc8jsgs/2puXjrGYDlfjPTNQEJi4/naGRrLC5BMXwC0DvFocBxK479fUHoth?=
 =?us-ascii?Q?t64A8d9s6Z2Ru78GMhtndQjGvI5VqunibLXQjw99p6FS/b8q3JV8y5wpLqgl?=
 =?us-ascii?Q?4DUxaRMkT1Lzfj04F7cpyzdd/UVM98S88Z9wpWhx8TX2UR2L4CgM1iyosewN?=
 =?us-ascii?Q?bjwtwYl5sX45TdobxrUzY3Nmawz/E3cTmlNa+KGZHjz9dVTfWHvB9KC8wufY?=
 =?us-ascii?Q?JfpFoRRvEWCmmOTyH1d0yzZCr3Qv4sEv0sS1OIijbVAvy7gYk4l5MtTvpG3/?=
 =?us-ascii?Q?zJZ9NJOK5Y7OBZ0/QXI3D/xKbM6IbD0G2Fkt9fmSEPCWaRr3zHMnrEJcQtuU?=
 =?us-ascii?Q?05bQweuHtcpAp4riM2yFPGkbuavl26YIDd1dxvtsePwoblNfCraaenFapEma?=
 =?us-ascii?Q?xxKd9XA3SndboiTXTRFSKBleULnE+om5bRw4SFzgkuXsQxbPR1321ho3wW2c?=
 =?us-ascii?Q?upyny7sOBacBpXEvrGsrEmRqoKX4sK0dIQ5pHnHMJDJGv9buKcOzuI/78VX8?=
 =?us-ascii?Q?Uo+vl66Ap5381aX9eM3XQ/p3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UU19QifIUt5hQtUGFiBV3SUGp3Ey1ci8E1OjjojOEWKswupR5vdEoqQe58Cr?=
 =?us-ascii?Q?4Pws+dCi+1KFJzdB97qaiv0alDzEL1i7fr6pBwcMGVEp9FOY4oDMTbtUXr/g?=
 =?us-ascii?Q?gNhIAh/a/lRq9kcWgXHrtWVvEn5EvKX14S5g8mdH946xY5Z1tY0XZGWxURfO?=
 =?us-ascii?Q?Dy1R4hTtIfBaBWVxrbu828ZRFfcHaGL7S7uqE367OSsCNle/L+3y8hA4wrbA?=
 =?us-ascii?Q?ciCVg5jct0QzkRkWVIF5Q2L+3iv31fX6pHukxP3BPrc67u+6KyIFZgbT9QxV?=
 =?us-ascii?Q?LHyRbsJnv3cO/gEU850QQPZE2Beo60zJzGhbjq5YW5LK5oUy1lC4uFSXOL/m?=
 =?us-ascii?Q?8Xea/EFGeJPAshLMF5FijFTpSEamRuNC1XTDnG+7XXEeoyM+X9pgqYlVGtSl?=
 =?us-ascii?Q?LVAHRDDQrmODD5fttGlfeIclDES6fEZfbYLlmGkR9+BJDpJVuqire93jYnmh?=
 =?us-ascii?Q?CwWziyMTi56gebH/tNGFnJvr9EfMpdzxsnpKu22LrMEOK3Vvavgn05QI15Qc?=
 =?us-ascii?Q?tMQRh8ZeBm5Ct+SfsWfzbIHy1D9HkaDbrTkhkQqQKuAsVk6adqE95oq6MOuF?=
 =?us-ascii?Q?miuP8wr2n1MSgVtuU9rz7OXeWtiMHVlT2Rtn+eBYEAKWo58vCzAGE34qcp9H?=
 =?us-ascii?Q?bVaBxnvEqA+oul1ppbbLmeGkihtCyTTNCCWY+wJZtMF5FQLdZNls0cNRMkpX?=
 =?us-ascii?Q?EVs0A72dkSzuRCf3TM9HrLlCmZRkfiK0+JQaHQOGY12/lWgRw7GibjIEgQ5d?=
 =?us-ascii?Q?3QCmRxDMos9CjogiPOj1XQvvg8IGX5LeOeDbR70mxy3rV8MB+8i22D/YQQSu?=
 =?us-ascii?Q?D7u5XKbFqKpq8Mp4Sv/cnLExDZAigc+xG2nH5FVE0b7DPvz6ODHWrloi1L5Y?=
 =?us-ascii?Q?6OcPjUk3vmSrukmJHEPY2sAAGKl5OjU6Ip+g06ahgduRHV9FP4+YMDdx3gsf?=
 =?us-ascii?Q?OulGUPuyWD0YkvEIIt0B8lGP4GxcBTsysuWwCzlKCL8A8BewNy1Mcxcu+VDr?=
 =?us-ascii?Q?OgnUEmplurpbrbO/xMFd95TxARuAukrWWJmAi+Ropew2UQIRXwTvQ7K35YY4?=
 =?us-ascii?Q?mbbCDKLFr3JHgLVg3QHDkVNWhlk2OHev5bx4YdNl8II8QPE1a+sRNx9r5bhs?=
 =?us-ascii?Q?7quIAlwrERvb67DYhvc2bfTkv9HOBUz9i9VGqWnShOD9cgRta/y2sN0nnzeZ?=
 =?us-ascii?Q?krlwIYsHmqTpkJofhYNnsIdVFLJtbCFYuUX8J01m+ZtiwiUH1t74LYXwgzpa?=
 =?us-ascii?Q?XBd95FLf7ZP08L8GycJv1QQIQXMTNXLWIvJnce+1Dlw/fkiBOpZoQ+yM83cl?=
 =?us-ascii?Q?q1+T7KXSluJ6145eigcMhi61z7uhdoiipQcYINw9K5t+eBJyoQR6UCwF4WnO?=
 =?us-ascii?Q?5f78CNvLih6qLFNwYuHsVPWNE5Ht/UQYcH1H+XLDLwTkkY24Zv36R/1VHOgB?=
 =?us-ascii?Q?kH/vv6T+iHGplocxARjHDbNnnwafCrDx+2+OzqUucKRS3mvTQFB+E8hhMljk?=
 =?us-ascii?Q?viigeroo/DMTF1l2n2mjUJwAPyUsYFvMCN2HuEdyXyTJ4iUwsHUszuEn1oZx?=
 =?us-ascii?Q?QmDSGObEngiRycwiBce+1Y65VcZ1gmRbSDxTkKn8OCWKyHfmnORt2ZOCKF9F?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d8b969-2625-4714-a498-08dd093deb31
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 08:32:50.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fm5AawVS+Wjbm67jqJW9djWVrZAxOlMFhnNol6beMc3IP9gIXuMG8XO/L2LjtYWohNHaAMX/3Ax9VCFt0J5uSttldfHyJV8VBH9LYVPDHJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-Proofpoint-GUID: RgavrGa5E8GRB2p_1Vn5RO3ETS--qqty
X-Proofpoint-ORIG-GUID: RgavrGa5E8GRB2p_1Vn5RO3ETS--qqty
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673d9eb6 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=ei4SEBeUAAAA:8
 a=t7CeM3EgAAAA:8 a=QD9Qtey2zKJs_bIMlh0A:9 a=t0EB5k7lhMAKNYPM:21 a=Qixl1SizjlQA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_05,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=954 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 08:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207416

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

https://blog.rust-lang.org/2024/08/08/Rust-1.80.1.html

Testing Summary for rust_1.80.1

Target       pass       skipped
x86_64       18254         434
x86          18084         604
ARM64        18111         577
ARM          18067         621
ppc          18035         653

Signed-off-by: Sunil Dora <SunilKumar.Dora@windriver.com>
---
 meta/recipes-devtools/rust/{cargo_1.80.0.bb => cargo_1.80.1.bb} | 0
 .../rust/{libstd-rs_1.80.0.bb => libstd-rs_1.80.1.bb}           | 0
 ...t-cross-canadian_1.80.0.bb => rust-cross-canadian_1.80.1.bb} | 0
 .../rust/{rust-llvm_1.80.0.bb => rust-llvm_1.80.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.80.0.bb => rust_1.80.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.80.0.bb => cargo_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.80.0.bb => libstd-rs_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.80.0.bb => rust-cross-canadian_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.80.0.bb => rust-llvm_1.80.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.80.0.bb => rust_1.80.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.80.0.bb b/meta/recipes-devtools/rust/cargo_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.80.0.bb
rename to meta/recipes-devtools/rust/cargo_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.80.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.80.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.80.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.80.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.80.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.80.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 0cd329fb49..c39c954c49 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "0b9ca1e2e45b8a5f0b58db140af0dc92f8311faeb0ad883c5b71a72c02dc6e80"
+SRC_URI[rust.sha256sum] = "6ab79b70dc57737a1de378f212fcf8852d67fe6cf272d122a15b3ea13be77947"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.80.0.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.80.0.bb
rename to meta/recipes-devtools/rust/rust_1.80.1.bb
-- 
2.43.0


