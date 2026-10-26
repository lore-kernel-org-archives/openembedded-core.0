Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40072.1793010714082523059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dmecfceD;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMYW+IQFaSWC5oauwdeS/UH4zOJnJ9JvmPK4v/8/16vhzabU1kjGFuQbkKXLiKBU5EPg25A1Q4+2uxjFD1EQj3rQtr7hyvmnCcQ9DzwvWb0jF1TvkwbzAhBYHnhWTNsTGMSt+bEcTG40WxSnsmqRqBTgkfyPGfcbF4V9y0GOOLwCYggcMExJKYSCpWLqFd5VEx04mqyFFEyvL8ecyYc1iQ3Bn5slPXKFgYOz7JazE7A6SD0khFbhlJbq1k9PJEtFaEnzudYpq/VQmnCzwr31s+qe+h6Q6TMin34sefpQIOXE2x8EU9lDAe5nr2Zj11GJ0qhRNld8AAMyhdIJEhW/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA+085s3UL7Wj4HYOTdSGH1ikIeBFM2b2UO7tHlshuU=;
 b=rggsDbP0844KoK7WaJTCsIQyFim2qYV68mn1N0aIr4BDATwJHw+GL+1hE2QhltSUkaEV+8zSdbADJ6DmZX6IxmDyoKQatPjbefdnMGrbKQIDf+Q7ppEgfpfzWCK6UBs3p20GeDyfsdlLOQssV5K3cs46bjvOSLvn8wSIl9tomcF28jS2bKB0jEi2J9js1k/+B+W571u/eihufcbG5t0PSNiD3OVKJkeYb9tmfdsOQq6kTziwuaa8q85NIyeThgxhdef/0apa1nhh5sQCUPuPtOWactozwQ7hFTIFgvu9BzUC4NRqIHbRoPGa8J2Lvw35qENN/BjaOlZCGhXEmyl7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA+085s3UL7Wj4HYOTdSGH1ikIeBFM2b2UO7tHlshuU=;
 b=dmecfceDA4Crte7IuKlXyEG2xmZ8/ybqPWAlkj12j2V0Wn7aIYc45dAmDD/0N1AbMBExubTxUkgiKwN9wnx+zLfvRgi7C2PNkNaZfnwf/v3DzlyIkm15M6nXHCZ0sRie15iJ86jrBofa0RyS9cNDA0cpykX4aQtrBJ9vk08kbxgHAo+PYUhNvCk0UYqHvvdh+f+wwSNk1rbcyY2l9LnlVgB+yrzMTh17gli77wGGaqDoADoM2IArQRyryol4k8pjYU5Uu5FReFX86anVHabjknFo3LzlkBcWgCI0+YXR4EcZxU+NNQHnuS2ftWjZAZBiIa58GtreLrtd0p+qBxXj8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] python3-cython: upgrade 3.2.9 -> 3.3.0
Date: Mon, 26 Oct 2026 11:31:31 +0100
Message-ID: <20261026103138.3137-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 832ad8b9-f35a-4956-1ea5-08df334c56fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: UauuW3lwCHiXNtIEvRedXJh8pUXoyQs2NiiLxzDqIAOo3ualIosMh+jsDv9sb5Pw99gmuB1mEm3ew6VQg9JURUxhmpSw/Bz+w6KvBAfddKTpffLDEMsJhuL540RdElz2bLuGAVY8tAxqgv4FIHxPhirNG2UXDycg9cRcq/VYP2+ThrK7hwEw5PEV0mJcCb8CWOtRIYaOBet79wFS1wA9+r9MBqG/GQYoF0GHuVjXOY/58KtwPSIFrRCzwd9xJGWpITGXGVW9KbE3wxbVAmdpHPumqmWQHGCkRNZJneE3EksMSIxcwDmN7yxLUGiVio8XPA6YFHhpx/DGNUYrg4d//6gYm9VcJFCIyAddN7EJRz4ct1TlCjkFQRtrbaLyBZJgOoASTCnyWlD6e/3uvEbEPLylbnFbqBCRkkKnOSlXRo5or2XxsSDMKU0HQi/q7ionzME84V85rx+jX1Kq5hzwQkyuv2nluYjfPYXo+5GoF1Dzyl+5LYM+Tjh2E0WJLi87y4jNTupSnlMMwjptTK9k3qXgFdUmgbf52XjAXJ6a+5wcfJnBzGCGzJ60HwvzRLWLkDpEY+QdV37qwHTH2Vskm/16rwGre1WvYWAp5ye4TaGjrANPQMG8da39I1IxXb3BsE2ZNSPdSh4QzSWfWJSTtqkOW7yxItWxdsuUWjW2Uq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wOXLA8qCMHnK6i3ykCpRMpQ5IYqqUTKfH6IRqWCVM1stD4qpN6AZ34Un4lJf?=
 =?us-ascii?Q?uLhXECX3hVtTBmou8zcfL7fhgIZ7Nd7J5vRb2An2NS0tIJgJG2imqW0JAvUH?=
 =?us-ascii?Q?fWn1BGA2hp4dJDiKLCFrbeNtgsR6K6jXqE+BZgJ1+h+gHf9kogMzWhV24YGU?=
 =?us-ascii?Q?u4+g/+EbldDXUQHFAYqrVlI+x48NLEzbBTaC7nsdE6qsU8sHkckuyDmT9rvL?=
 =?us-ascii?Q?TLDZqHWQV9I8YbX+vawbrq2vf5j377BQ3WgGxa+r1CV3CiP3c215p58ps4y8?=
 =?us-ascii?Q?lrMljKDG8tdcYq4nPOIvIpm2BRLRHCHSRA7aDigpbVGFUDcNWYFivMWXFRyP?=
 =?us-ascii?Q?+yuJe4TfEYhobYyfpLQ1AAHocBVwgadzsQolW3i193l/vJKEle/DQLmp0CYD?=
 =?us-ascii?Q?HscZLaRNDE7SuraubyKXth4Rq0jd+7BOSzsKQ2QMn4TV+16+GaPFw87kyzb0?=
 =?us-ascii?Q?0v33Hmr4Bgct0djMdDJepoaxfLuKvn32M3xt3QT8WSsdIYTCr27kGhERp667?=
 =?us-ascii?Q?QnrJSaS4iuYpcIEl9MQIHvCgkEV6QkNJHi6p/L26MRvAMaD8YOiaNV6mtNbm?=
 =?us-ascii?Q?BqRUKkmSUDdif7v9LC7WwZeR5PqgdfRtgZYAMyH0qepyooCn2eilK9wnbRWZ?=
 =?us-ascii?Q?miFHFxtrZH/SwGT9HOrGzuXaDUcr/P/BwqUPzlSH0LTn3sYZAtokCDRN3HiK?=
 =?us-ascii?Q?b47UyWuWH6JOw0jZzF5o00oeFPdOOejLWW7Dk7tUC9cbyLEeittKKNndPOfH?=
 =?us-ascii?Q?C4bbIK0lt58w4Ptekp8vE4YWW4rUHLzKKNYwJJmZCq5a/KjXgD12QgJpoYC3?=
 =?us-ascii?Q?cft5SQPJzFWF2zx3nashEZmyZZyFO6GwWMlbwmSwVeV2fHbzaB/Uw/Un84ao?=
 =?us-ascii?Q?Kaqm4xHaCaiQWL9E2fTo+okZeTVRGm1OjOle4Miask7CbJHBIwjKWUMEf7ls?=
 =?us-ascii?Q?5m9R+A34EPvgJSeALCa57oze4fUGli14NzaDoV/AzBaBoNe86YpJ1RRGyBHg?=
 =?us-ascii?Q?6BOt+LWXlBdpNOuA9qepRxtfLv7r9IRZCsqLi+xIo8SKxufOXKbXsrQSR+yb?=
 =?us-ascii?Q?PzioNgk7wHRFuz0Qx9/tPEx0vPJtOf6rBdmsxN9X1bwAhTJSiZBybvbS3bgw?=
 =?us-ascii?Q?DEZBtrubDYtA1oygAT3Y/yySyQTBMAJLSUEG63G4OPBxwJP+2B4swASqv/yP?=
 =?us-ascii?Q?r2H+2Yha/NdCIo8XRnlP7YOZ0TDJ5PUDiMo4PPMePwt21pcDyk3kFgU7cRZ/?=
 =?us-ascii?Q?8NVOaRcu/VI3lhDFL7RAXhW8hErePrMMPKkdyPBvz2SOlan6zu6kI2LcxsQR?=
 =?us-ascii?Q?a/kAcbQVqxOgdCWGUTa3G3/X+NrEC/lQxc1Mmd4wX0gf0OgzbMiMt3Cjgku2?=
 =?us-ascii?Q?rFdVPznK9kj1CbWEqAcB4hNl4UJvN3VBUwKQXloqVgzbjaGeBu0FFop332OS?=
 =?us-ascii?Q?OtEIh+2bhUqHtN4EmmxQD19MvSKHN86vt/o2Rq1PlTD68NN2961iMAVNP4C+?=
 =?us-ascii?Q?NPlgsi3hMAqCFUbXUZN+Kw8i81uIBwCmHOBf7SipIbF5z8rW6vT16CmvOeUj?=
 =?us-ascii?Q?TRcGlLpYgO3BrXRR7sTzkd04A4o2TpCt+85fdoH0q8g8Yzpin/Vmb91xOHGf?=
 =?us-ascii?Q?8iPP+AcAe+JdYyIvZ9MmVLeUZXBcrtGFeYZFyBTSYwkiBf0eE1ilc43YRRIv?=
 =?us-ascii?Q?FcQLXMJcqmzYMYXn7uTeoIM1TUE6eGmdo5DjnOYSGUvPElykL8A5fjqMtzM2?=
 =?us-ascii?Q?r9uJljEWyg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 832ad8b9-f35a-4956-1ea5-08df334c56fe
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:48.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PkUuHtNOT6pfDFOG4WlkKaeYhcsBFSpOLw4YE5TDJCMVl+43H4QVx1LWnhOP1PGlHBjBSTHi8XP0bF5og0vYVPhIgTkD/Zwh1PzkfP6omc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248665
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/cython/cython/releases/tag/3.3.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...place-not-predictable-build-path-prefix-with-hardc.patch | 6 +++---
 .../{python3-cython_3.2.9.bb =3D> python3-cython_3.3.0.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb =3D> python3-=
cython_3.3.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-p=
redictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/pytho=
n/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.=
patch
index 573a53ee561..5ddc40f0e6e 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predicta=
ble-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predicta=
ble-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
+From 8122bf8f6c066cddb10eab5d76f89152026de450 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 34f1b32..b09350b 100644
+index 6e0a3e5..ce35b25 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -888,7 +888,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/re=
cipes-devtools/python/python3-cython_3.3.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.0.bb
index 3457a914901..7992892e60b 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.0.bb
@@ -7,7 +7,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62bc=
9f69c"
=20
-SRC_URI[sha256sum] =3D "d249c9022ab13286b17bd66f30609e800c5f95efeecb061689=
90c7a66cecde6c"
+SRC_URI[sha256sum] =3D "eed0d93fbca7087f143b42c34b05a825849bdf17f101572c21=
05acfa49aa88b8"
=20
 inherit pypi setuptools3 cython
=20
