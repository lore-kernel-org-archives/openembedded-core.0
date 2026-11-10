Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17642.1794309976340935786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 03:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TxxDmPG8;
 spf=pass (domain: est.tech, ip: 52.101.70.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skk0fhNBOux3AZ5J+lDc+0yJLPZPdBKxHTRS2XsVS16SMmzdGu7/kVq74fX+4cqBmn3YZAXQmj2O7VLubcwYxr3YffZCrkLComcP77Y1G5WLk613z6Us8hJUQU9mMPPi/GIfou2kvWSli8fG3gJqT/7UN8LTA2x1EFc7Ogs3Dg/LuqMvwTnlxSIb6jPsIUBn6wBVbjTpF9kj7PR+tDFzXcReRLJozhbGLzyk5hbSSlmbDg1WsUo5ic2oaQgziHP6fYKQMwsLK703crn8AMWXv6dxoICMgsAm9k/EXmVaqRPHhIiA1PHO0264fQ0DD9G8IsDUkaQI46GYZKOd6gxTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=899UcBe1cM5O9D6uFN30isqJOP9tRQoIEdwa7/j8izE=;
 b=jt8F5CTu10E4yc2B9jmDMPGgOBlfZQ0YJjXSqk9wYXdz7nF2aIZKfmTCPIv2X40222v2+fbi5T0+nNri9Z6jFOznHoAI6cxsz9LnPPn6IZ1lutA5uLu+DtC+/Rhzugk9q5gssvf4znUZu06vjQx1vjv0nl1tKkwS0lt8LrK1blASCbnbIDpO3exyE0msjyTjFKUTzWBVILgen0Bf8ZngnLlNHPPMNLzuzVvohpMt+hOJ51UMh89XekNdNtv0XaDzpasGMG50JPG8+QMYutDkM74UD9dUiZyu36/xdHm/SZyOYPjbKzxqP9KrbEGQMs0egbLFP3DvxqWh/3nHEOUT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=899UcBe1cM5O9D6uFN30isqJOP9tRQoIEdwa7/j8izE=;
 b=TxxDmPG8yYWjQfGOGMCKKFUucenJWnNoDIvGNVC2UjyjkVA029mtw02HOZ1zaUxYP447BNZC/N1oVIIL82+vx3wQJ7gXDkvxlSSTwbWTX3QlnmtY02+fAj4STno+q4jLNHCMFqTtk80RDoThsbTEiBW0eijzqF8sO/Ld2OGcUCJvDVJrm1pRMExStTj6Xn5xVG3ivZqt0sllySc76ENHPQDAjaijJg6+6C7h4z0rsmRfXolx3azH8xDg8hhlpkOnXi0NPGB6dcjI2tMAu/IFtw+Imy5rWV10EHoa9cjfb6vfEL2gUxY+k8HrUOBLFO7c5XNa2TOjgMc56eoZivJ6IQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 11:26:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 11:26:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcf-agent: upgrade 1.11.0 -> 1.11.1
Date: Tue, 10 Nov 2026 12:26:10 +0100
Message-ID: <20261110112610.80766-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: d92267c8-7569-4ff0-5a92-08df3f1d6c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|6133799003|10067099003|3023799007|11063799006|261026121527099003|261026140227099003|261021121427099003|261102123227099003|261022105027099003|56012099006|261009223027099003|261022075727099003|261028144727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: j+UQ52Z2/pCzEJMHJaWau85kT6OG7t516dYo9aLFpcJ5GNA8IwZdmp78gZgiu++lCtIr3/OECEuNLbVZ6OwqJ0c0AEUr94qysqugrCBYquZ8oo3qU+tEzXtuXnjWABGRDRCX258zUcBMtbXAiC26oi5CBDebHnfnJgD+Be4E6OVgzHPFbuS2ndGjgQkC79EMF6e3hjT7AWIf4x0SKRI6f4/VvrZxzby5HSd75q2nJQrXQ5AZMVGjiRoXIokQ5jaQIABVbeRKzWxm7tD3HPxuSb+S09OnQvl3TcUIoMZZPChr/JRe0IWO9NUCRMKPBBnGFVtFQ+/9rW68h92OSNdQzuUSViQg33Eg2ezX5IO3ZUelRcMu1I9TZsSvL98R98jPHmU3GBJVy/x6GGpvZKF33dUMYDA1ghXz6i5ycO7Cw5nZ6bOLm7Tp1RFjgZ7vXgu/d3ywPTDahmMhtHoLn6XkGawUQNC5gfq4TmMlBRE+Rqs8bmRwTFEDq2QPV2SpLwgFhzSMN0MpF22A1QwqdaGTy68AcdouY1MeQ3WfPVl4sJKbH9CEiictQAywvZOJykdkdHqjszBXKwTl9sFFCDoXm6yEItryzc+6OoI5VmpkG2pBZ5lw9SVweX2yZKjesRWM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(10067099003)(3023799007)(11063799006)(261026121527099003)(261026140227099003)(261021121427099003)(261102123227099003)(261022105027099003)(56012099006)(261009223027099003)(261022075727099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Zk7Un+ZQdH+zGjxATEZeUkNrBdCAiiX0RHbt7CklKxZMLcOUb55KjjCCY/d?=
 =?us-ascii?Q?HLFnDzaRbsrA502sUzuZTU4jg9drbeaaAK/V2ylM8XJirAOujZQdUdRruR9L?=
 =?us-ascii?Q?oKv4va5SO6rFdqYuEG42ulInyIn394oSoYyLrfR7B4g87viBM4FyIjNxJRb/?=
 =?us-ascii?Q?kVomctGpxfWN1cOgWhEiehpPVPX0OCuXiqC7yHfq2YE3hE8c6kzrOs2kexxj?=
 =?us-ascii?Q?T3njSa3XWjru+HBiCi3uKfDNb+iPPnqgSVjZKbP0RvKqwAYIKoe0Me36qfQF?=
 =?us-ascii?Q?JyxJFfCbUuHcLsk+KKuNyVxhkqltySnmPZ+Lmt17OcAA2gkJ1bQHSqfbZWrR?=
 =?us-ascii?Q?jAKNX2/9qo76ZJa6Lx3/C5E4dx6TrA6vfZ3YafcGblsxJXpkAP5huKEIopwv?=
 =?us-ascii?Q?aeGm/sHwc5xA87ln4NZrOKPnQGUByyYYDDc7C9/lSE0jyp5aHB4+XEpXjE9G?=
 =?us-ascii?Q?GxSrQ+8wprJVkWlFjshRcIJDLuSX879x7l08crJJLK+xDhhcl3fhmXY53vpQ?=
 =?us-ascii?Q?ZtncjHQwqBGDZw0ZCuccUAG1fI+BUNKujiHhJfZyCxjWlTlwV1IK3e8ucaY/?=
 =?us-ascii?Q?kBRcud0rhSorfWnwU4PC9rsZw9AMJ7FGhNziXuxGbymaj4ENmUucxLMk7kwj?=
 =?us-ascii?Q?8ogVS3mlh7RdP/UuBMVNQwShF+E4byj6joAnpIwgBoTHk/Be33OXJDCy6yYG?=
 =?us-ascii?Q?pcbZeBUv6nC+Gnmfg6q4+bkZHz15OD4BFtu++DpsrZnYZocqfRUQaxRSCHwJ?=
 =?us-ascii?Q?FDYXZtesy9WXRv595tltcafaCj+xJAQZi21RpDKmzbtGDzqJST0iELlmr9Jb?=
 =?us-ascii?Q?FkmztdEm3meMp+dPavGrmAiFypiRgpRxmy8tzKn9d696gxHxyItW3ujycpqX?=
 =?us-ascii?Q?SOAON7erMBqhA7zKDnGWoq2WgLt7q0lwwHIwPS6jV46m+diKpF4eccHvUuLS?=
 =?us-ascii?Q?OHLzwJEIo2pOOQM/ryR+6+Q5L5o1yxa2pJBiVMAX058hjUOI5VfhmecCRX2a?=
 =?us-ascii?Q?slVRUzTcLKWSekuCqM2IQtFIaP2Eutvqvu2n8v5k6yrv++m411VlDoR7nkFW?=
 =?us-ascii?Q?6VWRG1d/IHWUdUF+3rzesHZR+XOxQmRcbGHkxbg8bLmuUVFyU0b5Blpeh5g+?=
 =?us-ascii?Q?/BXsBmhbBVdLBUK+SF6QKUt4b5PpqzEgzLxfNu267+qsJNWd1eyANhxlHoTD?=
 =?us-ascii?Q?yQlwZg4+A4vsW5bSPy82N/tb/57igRMBr/gJll7LFPEoYxEBdFi1h/6z+AC6?=
 =?us-ascii?Q?pd7mDKFZBbNy0Gu1yr1HwT0VRut1BcGaxHrPl8tMz6qtfscegmgbsMzmbwkt?=
 =?us-ascii?Q?duU4HcfpuusGaGbUt4KZbYiSACUJ5JsHkBzAb4E8OGonKJH/gnW32z2K5PWa?=
 =?us-ascii?Q?+ptSXjnhOg8LcT8vlLvGFXeQ89iznCYR/tNhCH+Y0zUKZM6Ycm3pbkdHVGiN?=
 =?us-ascii?Q?qMYOyXwY8s8wfudaJaSrCWA8LWHD9l8j5sA5/RKOEYCRTqxlqikICd2byIWZ?=
 =?us-ascii?Q?ns6s0UMH7ASqldynBjeTM/SCmrT5a2jvUfhFnufxLPADIxl8fTJxG23D1nx9?=
 =?us-ascii?Q?w+0l//qoz1tOJZQSmso48nMuMV2H/uqRM7wettupXZBqB5XA6IQycr4AUBHY?=
 =?us-ascii?Q?TpIOobAs/jBdEQj05qh4a9XLcla0kAY/qai0XZ0Mx3HE4IUngUAFPThCIL4H?=
 =?us-ascii?Q?Q8+QNanyEplMj0uJTyBDDuVQaHxOMAR+f55+uIpaYfRawrqlPgpFl+Y4SwhR?=
 =?us-ascii?Q?v9knAfUqwBEKI32yHj5DGcO+B7v6WrA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d92267c8-7569-4ff0-5a92-08df3f1d6c81
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:26:11.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoDSyPL3hHRst5x0196uOoD/0uR4T8mPUz3rikORMPCt0+7+dSBPL2YV+aAxXu0nswhsdFMu3Qtci9OpSMlXkquGNhKVxaPxoWV+jCAPL0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 11:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249916
Content-Type: text/plain; charset="utf-8"

TCF Agent: fixed possible NULL pointer dereference in Processes.getCapabili=
ties

- Drop ldflag patch and add LDFLAGS to EXTRA_OEMAKE

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../tcf-agent/tcf-agent/ldflags.patch         | 33 -------------------
 ...cf-agent_1.11.0.bb =3D> tcf-agent_1.11.1.bb} |  9 +++--
 2 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.11.0.bb =3D> tcf-agent=
_1.11.1.bb} (94%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta=
/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
deleted file mode 100644
index 9a911051e6b..00000000000
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2132bc5206b5d619c74caa391bc00d6f91d6ebe2 Mon Sep 17 00:00:00 2001
-From: Abdur Rehman <abdur_rehman@mentor.com>
-Date: Wed, 26 Aug 2015 19:18:11 +0500
-Subject: [PATCH] tcf-agent: obey LDFLAGS
-
-We need LDFLAGS to be respected otherwise there are QA warnings as the rig=
ht
-flags don't get used.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
-
-Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
-
-Signed-off-by: Mark hatle <mark.hatle@amd.com>
----
- Makefile.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index 63f062b2..5da23c02 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -111,7 +111,7 @@ NO_LINK_F   ?=3D -c
- # Linker definition and flags
-=20
- LINK        ?=3D $(CC)
--LINK_FLAGS  ?=3D $(CFLAGS)
-+LINK_FLAGS  ?=3D $(LDFLAGS) $(CFLAGS)
- LINK_OUT_F  ?=3D $(OUT_OBJ_F)
-=20
- # Archiver definition and flags
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb b/meta/rec=
ipes-devtools/tcf-agent/tcf-agent_1.11.1.bb
similarity index 94%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb
index 01e4b7df497..94c502371ab 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.1.bb
@@ -6,14 +6,13 @@ BUGTRACKER =3D "https://bugs.eclipse.org/bugs/"
 LICENSE =3D "BSD-3-Clause OR EPL-1.0"
 LIC_FILES_CHKSUM =3D "file://edl-v10.html;md5=3D522a390a83dc186513f0500543=
ad3679"
=20
-SRCREV =3D "3051a4806ac4b041ec7c49ffc6d07f0014b8480c"
+SRCREV =3D "8e23af30895e085e3e6a9d694f2c5b521d844742"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI =3D "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3D${PV} \
-           file://ldflags.patch \
+SRC_URI =3D "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=
=3Dhttps;branch=3D1.11;tag=3D${PV} \
            file://tcf-agent.init \
            file://tcf-agent.service \
-          "
+           "
=20
 DEPENDS =3D "util-linux openssl"
 RDEPENDS:${PN} =3D "bash"
@@ -31,7 +30,7 @@ INITSCRIPT_PARAMS =3D "start 99 3 5 . stop 20 0 1 2 6 ."
 MAKE_ARCH =3D "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64.*,a=
64, | sed s,armeb,arm,`"
 MAKE_OS =3D "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
=20
-EXTRA_OEMAKE =3D "MACHINE=3D${MAKE_ARCH} OPSYS=3D${MAKE_OS} 'CC=3D${CC}' '=
AR=3D${AR}'"
+EXTRA_OEMAKE =3D "MACHINE=3D${MAKE_ARCH} OPSYS=3D${MAKE_OS} 'CC=3D${CC}' '=
AR=3D${AR}' 'LINK_FLAGS=3D${LDFLAGS} ${CFLAGS}'"
=20
 LCL_STOP_SERVICES =3D "-DSERVICE_RunControl=3D0 -DSERVICE_Breakpoints=3D0 =
\
     -DSERVICE_Memory=3D0 -DSERVICE_Registers=3D0 -DSERVICE_MemoryMap=3D0 \
