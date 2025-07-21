Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A522C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 08:21:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35564.1753086084555578898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 01:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9297613b94=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L6W9sM1294783
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:21:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 480avgscqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:21:24 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 21 Jul 2025 01:21:11 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 01:21:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] readline: 8.2.13 -> 8.3
Date: Mon, 21 Jul 2025 16:21:02 +0800
Message-ID: <20250721082103.2262095-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250721082103.2262095-1-hongxu.jia@windriver.com>
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TCiixrovF3lgvVNAuOtfD-cQZ8KOd9dI
X-Authority-Analysis: v=2.4 cv=JPQ7s9Kb c=1 sm=1 tr=0 ts=687df884 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=vTr9H3xdAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=j-oCmr_1fYtGWD_PjOYA:9 a=D9EQx5YpYEoA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TCiixrovF3lgvVNAuOtfD-cQZ8KOd9dI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDExOCBTYWx0ZWRfX82SA2Iq1JV5i
 BEbGAFhJXGpoUFann8lyZSabRsQTsHNA2y4EDOxwbMPn7UY7Y1V3eM9cV55NN8DKeXdDqOGJnC0
 +AxsbZTV07UVpkcuYyw7bTX9BrnkIq4wxRQfEKdk6kFgCwC+cP1AXTMEcoQOzWgqrv4Q6PWX3TH
 gu6sFlhx8Va8TUqUb/3WgPtGWi1/bgeuYELge4GRgIIiz3V/fDUv3UcPMLOjgUembLaBN4aV+H+
 s7w9ZZnxvaj2e4sXkNzLCnLcLprrDga/Kl2HSDXWn087OApWYeMhMrntc0VIb0/NEytfDqvg7Mh
 RsOqAi+Dky3O8ko4fPQHflnKV1ZoTcIr2u8R79VEgFxV3brhEln1uClL6h4K1XCtQhzKwNtrPOt
 kSzoTfPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506270000 definitions=main-2507190118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220666

Remove obsolete patch:
- 0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ages-that-are-not-compatible-with-C2.patch | 29 -------------------
 meta/recipes-core/readline/readline_8.2.13.bb |  7 -----
 meta/recipes-core/readline/readline_8.3.bb    |  6 ++++
 3 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
 delete mode 100644 meta/recipes-core/readline/readline_8.2.13.bb
 create mode 100644 meta/recipes-core/readline/readline_8.3.bb

diff --git a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
deleted file mode 100644
index 3bb4d539601..00000000000
--- a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9459ee899a291c55f08341df63e9a1b9b7af200a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Mar 2025 12:48:46 -0700
-Subject: [PATCH] Add fix for packages that are not compatible with C23
-
-Fixes builds with GCC-15
-Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
-
-Help getting packages like bluez5 building
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-readline/2025-03/msg00001.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- rlstdc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rlstdc.h b/rlstdc.h
-index 2aaa30b..a7a0ef3 100644
---- a/rlstdc.h
-+++ b/rlstdc.h
-@@ -44,7 +44,7 @@
- 
- /* Moved from config.h.in because readline.h:rl_message depends on these
-    defines. */
--#if defined (__STDC__) && defined (HAVE_STDARG_H)
-+#if defined (__STDC__)
- #  define PREFER_STDARG
- #  define USE_VARARGS
- #else
diff --git a/meta/recipes-core/readline/readline_8.2.13.bb b/meta/recipes-core/readline/readline_8.2.13.bb
deleted file mode 100644
index 19b5cb6f583..00000000000
--- a/meta/recipes-core/readline/readline_8.2.13.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require readline.inc
-
-SRC_URI += "file://norpath.patch \
-            file://0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-            "
-
-SRC_URI[archive.sha256sum] = "0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"
diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core/readline/readline_8.3.bb
new file mode 100644
index 00000000000..ff5dec6c0a6
--- /dev/null
+++ b/meta/recipes-core/readline/readline_8.3.bb
@@ -0,0 +1,6 @@
+require readline.inc
+
+SRC_URI += "file://norpath.patch \
+            "
+
+SRC_URI[archive.sha256sum] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
-- 
2.34.1


