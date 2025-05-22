Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D32C54EDA
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 08:15:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19255.1747901745435888480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 01:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7237718411=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4L1cN024055
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:15:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfwt9vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:15:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFKdhJ/mS4xhjCqn5W5wwnTKAS7cy/p9rhqwsVp8BEUjIYMQ13nGvdFLImekHDFA95BERzJ/V2w9autXOZz+QscZZfn2F2noev2yl8J09LBR5NdovYV8MgABANaZsubymnTbbJKvPqHK/h9bcH8atf2LPs+bfehgSQgSWhhkfXRTDv+NSytYRVzsFCvjP7YH5xxKOIg/3nqqfQEn6AlZp5WEbe63AAEx8RaUSfR6/Uz9IyRTYex/tJuFo/Mq/+vBaw7En1twTCfDOAJ9bYBpNjCTpAwN6Q5Ozh41Bc4NSok8GO2rOze9OndHBspA/8/E4pHH7FMDiDhWu95UydIVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF829mo1ZcAcgliDEMYSl9p8dgHb//7YR2MLrQxARCI=;
 b=egpSgChuFJ00O9+EvRgLhwcBwxDdjBPytxFsX57A/JmYLkluEAoHe/DnB00HdrJXrqhpjRZ3lWZQtGq7yFN3CIME9kgFv9oA+ZWDtC2Yx+wiJ1ZU/sxjduIzj+9H7LdVNZL/pGsgBqm7o75nJOyjhZlbQV9vGrQp2mwCn1YhH9ya2XGX+/KADUGJ5nNfgxeN80SlqUMOSwRp5tgyuqNBDBYoJdiR9TNp0koBlDL+XRXWLB08u/MXBc/nNDsH4uwbPXRNuq3MnNkFClUZO1E3FzHIScyVxrWnh0fYgKSIfZFze5jvUpNka6qbl4KUKkAmukoGpZ8/7RXpTE7XqMvzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPF2720D4410.namprd11.prod.outlook.com (2603:10b6:f:fc02::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 08:15:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:15:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] psplash: update to latest rev
Date: Thu, 22 May 2025 16:15:13 +0800
Message-ID: <20250522081514.552836-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522081514.552836-1-yi.zhao@windriver.com>
References: <20250522081514.552836-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPF2720D4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 416f2679-d2a8-460f-d922-08dd9908d7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ekbdiV/umwvI/oQVeZ/UHm1DyZYl/kkVGeMeEdEEwusEeLqUp2LkD+FDTNhr?=
 =?us-ascii?Q?MqFDAzAyZDUbH8TRcCqrfJTcPCTdtpDdqkWA07C69iqCuVqMPVPhSJvz8qje?=
 =?us-ascii?Q?YdZRZX9ezm2LSueAaxpBVuz+iZroXhEbQETqOqRyXqmJO46MrcjBd0f8eTvJ?=
 =?us-ascii?Q?noLfUqAYoQHF+xRVnFErr2c9U5PWrzA7aXYkLO0nMGyrRgSxq6UUoBUVdg30?=
 =?us-ascii?Q?k4wqgKzhs4Ck+uA+flgi70FV6g13v7TW6RtnSF3pjjWy0FHF28ZF+6tQnbFK?=
 =?us-ascii?Q?54Qc0S6443gP47R4YEY+SkLFiBeKad/vasyogIswjW8TF51y9Ogbe8uW1n6K?=
 =?us-ascii?Q?iALuwBKGdIHHsdB3/+5XGfho9ax+Z4K3GRAf05kBC1y0JnURTkZ7Y9QwdE70?=
 =?us-ascii?Q?EVprxB2gAJh2X6A8C0I/aQiZiht4W7x0FykIlRtbD1vZipIIIH6Dzr2zavUJ?=
 =?us-ascii?Q?4AB5inc+P9WFI+2nEhMHLZLwIyeYwsfU2BG+0ecglj67+sd7JB6J9DLcS2Wm?=
 =?us-ascii?Q?3dc1gs6jwTP6sYJKCKhLTsuzNrPNPPehWLCQ3r4U3Ju5QIBJdhTjCQ+NRvJ9?=
 =?us-ascii?Q?Ex4WDTruxfr1WZzrTJ8AVBBu6PyOodVkT8ev8e/WTtKxuO7mG0WK3UVGxkr1?=
 =?us-ascii?Q?b/6wmawVNhQtqtOjMLnqQoFDxNELVGK90r5mKkI6c3ONmwvKFxsCBSyIj8zU?=
 =?us-ascii?Q?4K5zSeINOXICUBFNQTaIqJhrRkTGs2LCAgY69ynaHI4yaGoFm9/juoOtv57G?=
 =?us-ascii?Q?q2rrzmVK1ZOOQgCQorEHl941n0bbmAikpSt7g9ZjuHodmxWLn3/+xzzy4QSL?=
 =?us-ascii?Q?YBsZPBm5NqQgiAqdj9sf5MwQmb1TqQYa1EsQLpVR3MXlU8Odpc7JvsreD/+x?=
 =?us-ascii?Q?pWUOl5qEPFPmkuHuVTKStkmZKHlATdDciAffMGUWFot/CskoJ5gAL6ptLQBi?=
 =?us-ascii?Q?7Pq7nZ8DuuMcOXfhvDtpKfLr8kj4+T8m5IXWcQV5Y8lDlaHXmzK/cN4ZrXre?=
 =?us-ascii?Q?w3V2KrwHdJJAcLjvVVaq9E4rHSfUNZs93k62J+Lv/3MwtQwz7mVyKs74Ro8D?=
 =?us-ascii?Q?uS7uaIa7iyCHRabZmbHI2H5+ol8nrjOi1dVKdYPkHHfXNuA3DhsVXdoDJmU8?=
 =?us-ascii?Q?oJwNujd1eh67EycGI8/nFNJDGMAJuS6cBubsGM/v83InP/oM+DM19UOfgn1b?=
 =?us-ascii?Q?XG3H+WFPDTHwLF8HW7n2R7myChWMAWlPRcdrvmB1oB/5yaUPnfrOocGm73ni?=
 =?us-ascii?Q?YNGj1/6/JQmfN9YT3P15vFV3ndKW0CDGJaOaIYNLN2wEBgMn9sV9+gmKyxIl?=
 =?us-ascii?Q?Utcb6fqzw35WqNrzseK6tkblanSEXaNEZnH9PtIT2w7WwF11Jio9tuEUuWPD?=
 =?us-ascii?Q?ox5K3SSHuXik4CVszW1ZDiZJ6S7/igp6wRXf3nG1b9KLMZmaOdvZWCZ38wa3?=
 =?us-ascii?Q?v3eLAMGN4Ug0kKx+OUnnE1uhOpkKMbJ/4cieJXHFJADXqBUGOwuLrA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D2LX+253Rr8dOs0lebVWB8uTDTgLbExutHHfIOqhVdnfFPH5SJtPCBtAdjHf?=
 =?us-ascii?Q?OYRqgQcGcBnLFuYiT7+S6KO+MCHOnsJPlNJCYk8NATUKnsRQkTLim5l9vuMA?=
 =?us-ascii?Q?LZUPL72YL4PboYdHC3hjPA9b9u6PXd33nfF+6Rsm0U0uz+dOopwus1unxkZi?=
 =?us-ascii?Q?62wvOCsoxa9OuOEOLTGLKiStQfnahlSBHO1nrILeXB4/G+UJ5mCL0yl73wFq?=
 =?us-ascii?Q?TJ3i30Rniji9By7zBS1DJtQuxLQBlajCGlsOJkzm7/w82gRDX+GlH3U/aRo/?=
 =?us-ascii?Q?Oa73t/2egE9WPEnA6BAEri18aIZ/BVABykbM3i0adLmzBlWMp8UG+k1iHRx1?=
 =?us-ascii?Q?+RgHrbtfLFHgsoz5f+A6TBKHc7e8SYuP0BD9M/8mnBMdjq1fLihukTTJjLvt?=
 =?us-ascii?Q?gVUHVcKFJmIRh250lMlM6ZPg/QeUarQBtncmkuKx8yqXCs8B+Wwdl2C4lZ6z?=
 =?us-ascii?Q?oAAd+sOclZhss0EcDXP/WfIxkbq4xQXTr/Nbo7KTQloI7NruZ+LDcB4ki9YZ?=
 =?us-ascii?Q?n67ErlKDocmkWUHU7ZbJ/GwI2egj4b1FfCchn4V66DXfOEOyn+mf/y/Cu7W4?=
 =?us-ascii?Q?W+LuxEwsB6KWxc9CAxRm16IswrBZiNAWMkcXvtkEaN28SOMoIGYOnWEu3mIn?=
 =?us-ascii?Q?NonSh2frLB+k6fz1t4vzOwASCA8SlWiELzS04BMLkD9dVCY4g3Z100f4bSkU?=
 =?us-ascii?Q?KNid11QShG0WyYfjQWaaK4RLEOBJu9GvZh89KE3if9LkrzkPQaaaLP3zr3da?=
 =?us-ascii?Q?yGaX30cR83iDac1ESKDb9GHZVFoH965U9L48xtkBEBZBDdiXsHuoYTRRCYD5?=
 =?us-ascii?Q?ffxsHvUNdqwbMTHujIiUC2/ctLyMrQ44TpoxCgEAJkxC+c53Xd24o6YQfaXb?=
 =?us-ascii?Q?v3DczJMrBfdF8/oBJiZMnPBB08fpE/VqDHWvdc1WXhb1OnrELdZDH/w4OYJ1?=
 =?us-ascii?Q?BxtxHKQHILvAS2wKJVs6hupfZnGTff4SCSR9i1JDvFgW8SaGi0GMyN7Q02Kk?=
 =?us-ascii?Q?7P7Grs9GcneznumrMydX+gn/GgkHwG3TwSRxJfUQ2Mfd+sozMVybC5u66GUs?=
 =?us-ascii?Q?TuQGiI3qvTgat1/5degMnZmRXgyDI8XcNatuqv2a2HSsFsNEWWOfRbSeim5x?=
 =?us-ascii?Q?m7O0irV3aOqt1Wlny1xbPdteXCwbSYnSbZr4j/qba+CE/9YSVNqmjT/EgNFR?=
 =?us-ascii?Q?cH+SEm9tz0BOpxf7YgPPSTCk+Oc5e/wsNXcXoG4/WK5nR2NhxMlrEzP1goS+?=
 =?us-ascii?Q?+QN1hTlSDrAxAA/kghZ/u8Sev0oSWjajd4GEWYd18NJc12DqmbIUr+GdPRLA?=
 =?us-ascii?Q?rJWNMiCl0jOsNH7mhhXFUKg7XT5JgUZaM5lGr0eMDzz3Og++ke9gKScU/5q2?=
 =?us-ascii?Q?Wffmi7V1Naf6DQ/9rNxbEkyde90ftMdzTQfwWYAw4M8iey4ULpTCKBItbp4o?=
 =?us-ascii?Q?et7g7ityjAiKaTZplj3J2I9CGdxFu2DpWn/W2IzI8DXYayAa6FvtnKUmegDc?=
 =?us-ascii?Q?g9s5FHtwWNhD/D8HeA8A5kGqPQixF219c1VQKkurjLwtrP+zF6g6oR0cBbyF?=
 =?us-ascii?Q?LYPqLREVVYaX6kIzWYlR7Q/yQK96bIAK73dM88Xb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f2679-d2a8-460f-d922-08dd9908d7f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:15:42.4438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1c8lb+yWs4QxIOAc+ZhUVUKoxKkshl+gt1tohWu0IqQdHrkDInNn+VubPAAAur/IPBw/S1COz+prKLKKX+YyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2720D4410
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4MiBTYWx0ZWRfX+hm+JEy4ksIM Ja4NPf1gq6Rg1WlRjKhD9dQIMm5zVInIBxoLrjWDE51kIZuoPxx87jUxVHCzo/GljVX6IpZ18Ng 68WoEJpWABcKCBIjVMSU/JotUSgrRQHlZWwV1h6aBSygp9Y9LNlghfKda3szcD7G/TB/lJASOUm
 HShRL9UcTEaFgIm6DJbZALupCq32l/E/sfBxw2fOKAHCGpVGnBtyM9kpzu1zDG23mPSkTFW8Eo7 6p061nqPGnf3QSAtGlyolHiDfbhg6DCm5yHaWZp7RX2dlMWERzcU4Y5t8jZgSNAGrJB6EOz01SH OJlWIOFNHReUkgHuUtecoO7DOMN9HB42KiDnVxCcXoqkLjL59t6adMlx/PSZPbedPPzG2KBTfGS
 81+dGwJP5r9u7cctWPkZzU7ny9BL0cOfq2MIE9X2YtD3PB/b3XqLfsPFcpvJyba58J2xRRak
X-Proofpoint-ORIG-GUID: O1xuyaDvMkrO7JtqUl8WMf8wxUoHbjwX
X-Proofpoint-GUID: O1xuyaDvMkrO7JtqUl8WMf8wxUoHbjwX
X-Authority-Analysis: v=2.4 cv=b6Cy4sGx c=1 sm=1 tr=0 ts=682edd30 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=213UAtiW6eJXBEVsVFwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=812 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505160000 definitions=main-2505220082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217069

* 53ae74a3 configure.ac: fix autoconf code for img_fullscreen
* ec1ed353 configure.ac: standardize default-enabled options

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/psplash/files/psplash-init | 0
 meta/recipes-core/psplash/psplash_git.bb     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 meta/recipes-core/psplash/files/psplash-init

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
old mode 100755
new mode 100644
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 712fff7bd0..f3647d389d 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "1f64c654129fdb6a1b75d8c16e3bcdd986468083"
+SRCREV = "53ae74a36bf17675228552abb927d2f981940a6a"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
-- 
2.48.1


