Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1792488579382617804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TvFeXLx3;
 spf=pass (domain: est.tech, ip: 52.101.65.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF5xUneT3yT1jYI6paqEH5wI/7CxINHqVcg7ojTaF9G9hb3gOv0AGfRBz+wHrFNXuK4D5n3kueqyukuiLzHjB1eslYFY9o2kfYwsh9js1ly+KKpbkbh7cT047txqx6j/tjvvgqDm1uIsH0N91FQ06C2gw8jypr039Yce2nDCh04t/pdQJKSELIUzB8mHjONpO4c0NkB2Xy75ms+ARQloSAvDGfRvKE09Yc9D2D/kDrXo6j1j1LJY+rHtruIN1T9rEVonugxaxb+BuvUlJ0cmmOq9Inj7+jR2TQvbKUw51Y+KK8jiTBPkqCe+ZYCTMAzv5Vv99aZhgg/uQbN7tdaafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBGpJfEB0al685BqnPFFlYz8+XLKM9NOQEPMxISO09o=;
 b=AtAubrwe6qz62asnXpqALxPndpE2al6eQcEe3qqCdqYz1h/BETG4WnCbp2uM41NWTyyLXBlbUy0NaZiIx+fEoz3dDwHADuRv82de/Wr2Xc7n+yRu/NVH82ef/1HTlnWGVE2IsNWwEZLN4A/x4I+3L6ftKIGyvSldUJBhqUqQxvCKzG43RtlE+PwV3dJKpx8q+y1qmDUVBwA1suYLyAry4YPmPn6h/63rY+BDT/FwDF//qo2zKFJdGrKWyCn1h/VDD1Fm+k8OX7FIkqD6Md2vvNmc9XjPY4wNjyA4qHWnahnhzCdQsq+q6ukW91A1ZrmpeMhfjTVsesVMyAYxYWScdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBGpJfEB0al685BqnPFFlYz8+XLKM9NOQEPMxISO09o=;
 b=TvFeXLx3lREawBB4CP8TNjmWej3Pn7BMSjjrX7Y7Wiq4wOec7RTmbAz69vWpGw0litGRnMp3JEEI4kgPLXnVHzmdl34SoCqv7O6OmaotD9pI9DTHUbaiGwL39SoBiyjiemUEG5HRSuFIsC7YDgwIrHfpukBMc1klHPMGLZ9bH+mTQhI7GHd7DyOv6wrWU04mnZRYQCq3HWc/nP9KuxQA+Ydq1uJ/Dqd7i/CksQ/fNJ3M85ViBeEjo9eWvmTLt3vjH4ZJU9Gluw5dfonGHchzUD5Y2NlsceluH38drlZvk1EqhkHItObVkFFo9+vzNwe+tKc4N1wzW01cAuF1uyoDBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:37 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] ethtool: upgrade 7.1 -> 7.2
Date: Tue, 20 Oct 2026 11:29:26 +0200
Message-ID: <20261020092931.4330-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: 751d1bf2-ca3f-4634-f10c-08df2e8ca8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: A0uy3ZmBEhU7CSg8y26YXSVqsNWIFl1N5MKFd41WJf2JI/J80x0nWI/gRIYZnqmEeLaCmX6AHQp4N9Huqzqf4td+91Or7vt95PY+fqYkMAUkvUKg5mwQy3r/OO+0EKQ5KUeEDb6V5l1XpLcnDE3U65Kdp45NockRRqML5UDTDV27LawLJwyqogTIePL5e2FSPH1RPbMiOxp2gs/pamzs2j0eshok6r/kTX9fKM13h7zFlj3GhZn8YZTtB+6KOpfOQOz7buJ1cbNtpxHPamFjhbZyQ7ivPMn/PIX+SVKPt6d+o/ACMoOxwfYEpitCwmKajJOZ8DFlWUjPC+aQe28h/4SUcDhwhSmfRKkGULqQzG5v9dEsAXx+YrLPRzQth0rVYtyqSYGrgekM4m7hS+Nk5IDYoeIyFsnevos5W1lvOHeYCIwcF8ccruT7A2RWho/gvzE7VqMXzD+t+b2grtL4LxqNn5gCO8zsenDj/SThLuFLIUOABUrcESMWJg3ejdySfzECPkMqYcX8wvGBthukqDx2fxgzwL9blWY+BTQegkls+5zwTs7qILLjikTAT0Xu3Mt2jWe0kdEGGqPzK/Tfn5wwha8G/hU4pe9U98M6GFi0tSo5MHZbDNh7yE90OPG1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWT3tiD9fQkqXZwcBHWhMTNSJ2E4xxTHGW65+KBwiSh+SBRRLeWza0gA0UPm?=
 =?us-ascii?Q?1IReeGihbOJyA9+s0srQH98gz1lDlulhDNRO0DZLVGYLdv1V6vmqQc3BQJ8J?=
 =?us-ascii?Q?ayza6Sxmoi0vfVUnf5fIl+UgucFFcMsz3VMtRki5swyUnLjuULVJUpADu6iN?=
 =?us-ascii?Q?SMMVS8gws2WPOqRx0tsDZ96gAnXnG8kY6RJFBETwOpi5Bpx577TmgAInSztW?=
 =?us-ascii?Q?1nxH1juKfLoUEhc4En4bpI1UaLoTX2vPFpfWIyE+PuRogYH8FxaRk/Fpfjjg?=
 =?us-ascii?Q?+Bb7mvCBbD8I0xMhzk7Q8zQUI62LzzRiGO9xTi3Fs8rcufz1sjZ3YWLlKVpx?=
 =?us-ascii?Q?i170t6gnu57iEOz3FhnNNeBIPn2s2/zQvca3RV7je5lVeiGt+hngxlgXqjig?=
 =?us-ascii?Q?LGupSCu2wuAe+UQu+MvcrRhVtwDgvdnInd2IrvrUgB4t7PKW+WDABGBwMZFx?=
 =?us-ascii?Q?YtNEBoC7VfL7lCIh7BHEsBQrgYnO3yDFoGFdhiOvfXdgWgii49LvkmL7bIO6?=
 =?us-ascii?Q?YGadqPk79fCJYl6mjfy+CMmnKdvdQd1o6jtcoSgJxXuR0aFX9AvaMKBI4iz4?=
 =?us-ascii?Q?d6OcM+5nwb32TiiO9t+DH0OcMLe7F4bKXojNVVIrqM/yVCLN2s4wRDO0t7GB?=
 =?us-ascii?Q?fQsddMGc5KuvHmf0KfZyvnYKK5yCnS6uY45U5fmsTPjsZsilUT8N3uGYbIcQ?=
 =?us-ascii?Q?qZiZ2V7BGV3N9I4c0yGl3Y9NrrPQYXKKs4bmqNH9og++pQcwAWlrEYfDX/4T?=
 =?us-ascii?Q?V1yqRZhtSI7rsJ11CnXgYf7352f+BwsX7aMk+iV3WRMjoK0fYGfgrNV0n629?=
 =?us-ascii?Q?vpsouPDQnUoGS3KbJk1kdAR4X3mqeMHV/yo02v2Juq24E+RnMtWQsi1aBgoe?=
 =?us-ascii?Q?ixlD8sYxX6vlAAWgfE/13w7C06cQaiZ7uB/omqKVRrfXcEixZybxmM67aPbu?=
 =?us-ascii?Q?32hKItjqVy/oAD+2C3lZ/rXeQsZUWS6GLkjKPnKCuOlK/JYh+D97/GwXyHnJ?=
 =?us-ascii?Q?ofFWUWSZ4z5hViU9EyXeY/WoknTv85RkQQvLR2asqMq7/SAraoq+bNHRPnlF?=
 =?us-ascii?Q?JFtrVWspMPImZRtSPxGRh0aCt8nKbTJvfTMleFAqVXa2EenB0VyjnxSW+2BE?=
 =?us-ascii?Q?v80p6lNTMwN0rgdWoMqcLWlFeyjRdoL+cveVLCuoeSTkVww2JV3ykb4Mz5nK?=
 =?us-ascii?Q?fEY3S/bkgNwOD7v6AcbFm+xoeO+YtXveq/Ws7GPPy+4fxNgo9T7Qppbomlnd?=
 =?us-ascii?Q?SX654DEnCzy9vT2e9PuztMel5AhPjXCUSyisJFgxOOI7WgTQ7J+qAbwaZt8i?=
 =?us-ascii?Q?PvauxiiCX+WGMPCfeYJLKGkuZl33JlpLV6l9nfHhT5bVQGo+RrXU9+SoBYRF?=
 =?us-ascii?Q?7QWhiwTEBZPAa7noH/MTec+dXN4rx8JWl9UeaJ7uSpllj3eO64jVb2tvQxAz?=
 =?us-ascii?Q?31LcBC3E0WUQW4Ge8T8K6AeWjHSM+0G9rdutl3GCtUMoy1islKJ9fZdcqo8o?=
 =?us-ascii?Q?Csa5UrgN+noRHJyn76ANOj1f3E6Z2m8jo54heSToOPXcjKE1T+GQm0myoC6/?=
 =?us-ascii?Q?OfZPnqLs0gM3c8Kf8y0aEr43gOBe1LodywQKnUAZ4ZvP67tkz1a+5eb9LC7q?=
 =?us-ascii?Q?pkfnKcniPE0IOoFGLCn+FcpAJHX2f2mh/mYvBy59Zkpxl5Ag/rG5k9t4FGlu?=
 =?us-ascii?Q?OeNS86GfJfr+6FpZ+zSz/CSb2nJ7G688sS5e0dXsC2ftnR6lI//0BdTHW2qd?=
 =?us-ascii?Q?c+mvNQauEQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 751d1bf2-ca3f-4634-f10c-08df2e8ca8ab
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:37.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgc0+6d1tCL+p7qw3zTVwDtr4mNdO7O8LW0fzpup6ErNSTj4ohKa2KdIAbgdbAtrH7+6FXUIWJRfaAqiSwss9l3F1V885212P1IoaKDkiPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248259
Content-Type: text/plain; charset="utf-8"

NEWS: [1]

Version 7.2 - Oct 19, 2026
    * Feature: support for KSZ87xx PHY tunables (--{get,set}-phy-tunable)
    * Fix: cmis: fix printing of Tx bias current (-m)
    * Fix: cmis: fix printing of channel-level flags (-m)
    * Fix: cmis: fix printing of CDB EPL pages (-m)
    * Fix: printing of transmitter technology for CMIS transceivers (-m)
    * Fix: avoid undefined behavior with CMIS transceivers (-m)
    * Fix: add missing CMIS transmitter technologies (-m)
    * Fix: printing of attenuation and wavelength (-m)
    * Fix: printing of link length (-m)
    * Fix: sfpid: print all implemented options (-m)
    * Fix: sfpid: print all compliance codes (-m)
    * Fix: qsfp: print all compliance codes (-m)
    * Fix: module-eeprom: clamp data length to attribute payload size (-m)
    * Fix: validate module EEPROM offset and length (-m)
    * Fix: rss: bound hash function masks in text and JSON output (-x)
    * Fix: fbnic: fix off-by-one shift in reg dump parser (-d)
    * Fix: fbnic: Fix various TX and RX CSR fields decoding (-d)
    * Fix: fbnic: Fix register dump names and bit labels (-d)

[1] https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/commit/?id=
=3Dd54c8bd1d0da950280a34484026f3b3b7bdf9a19

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_7.1.bb =3D> ethtool_7.2.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_7.1.bb =3D> ethtool_7.2.bb} =
(94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.pat=
ch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index aafc9ea715f..e244850f06b 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 7fbdc5cec5c5f2b89fd183543c3d35b5f7cc5530 Mon Sep 17 00:00:00 2001
+From ed7f83a6be18b659899fb3d60a04b91bf5abae77 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 71b998e..79eff82 100644
+index 0289eb7..30261ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.1, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.2, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_7.1.bb b/meta/recipes-ex=
tended/ethtool/ethtool_7.2.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_7.1.bb
rename to meta/recipes-extended/ethtool/ethtool_7.2.bb
index a24b64863da..0ae1ebff377 100644
--- a/meta/recipes-extended/ethtool/ethtool_7.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.2.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/network/ethtool=
/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
=20
-SRC_URI[sha256sum] =3D "21cc520ae5d881f01b0dcd6d26de4d52a64b24840bc2150daf=
778a235442e61d"
+SRC_URI[sha256sum] =3D "b2f2f1e94c3b6e35715d969185a0208d411586d88f49ccbad7=
40063e51720f94"
=20
 UPSTREAM_CHECK_URI =3D "https://www.kernel.org/pub/software/network/ethtoo=
l/"
=20
