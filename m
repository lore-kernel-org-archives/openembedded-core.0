Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24B6EA3F35
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:50:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16513.1770717028687625095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZNRobkNy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65019b8557=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7p7D71920462
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:50:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EmY4CrsKk31CGU7fGPGz
	da+wdL92dNJBiFdoluDUOWw=; b=ZNRobkNyIPgdvoTu3y01ED7q0kp205jD+XKt
	i8lkyr1CpXF0zs8KGpeINSEBKdR9uwVefOj2VKc0TRqeKMDfM0aLNUHt3ZHU1zNk
	Rr7FZDpJ1FFJzhQm570APTGADxuRWfH0S7aXO9Qy26ZpQwo8/7QEgLHcUU98wOxo
	USqqxYfCkE/dVjxewNx7paLh0P/WCZT57QYIeMMPub7Z/7tH+KU8oyUzowYBCoet
	M0vzNbw/TPgIIITy/uUMqjVaESaulZ/RlkuPLwZaVlshpkA3cdlwVvEXzk6aqaU8
	PjW12r1zIKr0XiQhrTfVsRdmDwCnXqFLdpxdNemJr4cVcNBEgA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2rhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:50:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 01:50:27 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 01:50:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] vte: 0.82.2 -> 0.83.90
Date: Tue, 10 Feb 2026 17:50:23 +0800
Message-ID: <20260210095025.633860-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1DSMXPhzZKexbGJbvhS4wrUwtg5Z2Bor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfXz5HPXWihKD1i
 3+V/TzMlbSozsGojdPuQiPga0BC1XD5maNd5UPCUgKWIMVLJDm7yPTYWPyKsV+qvKUnYUE2nXx8
 NRKVxg2VDwCL9ciw7UbTgyWznCtbTkzw5v3lAQSsBMjIDkBm1IwtytW8r/01teaK1LYgFAklHvr
 uw/gWOnUrK1oCXPkCkH7KxdvHlMGOzFRKw9PhnQqmH2U06aqFHijJc9+yvvSkL0rbnVmxxQZh2r
 Yj9fTUm63q+3L2d0oJNOLNwSTdam7URPIk2XVqc6qB5aDriqHxoAtqLwGH8kmHpudk7AHDDeQ/P
 QTUOK+YpInA8pubIdc9joVxHel13/8xJAy3EVxlrQfQMcvCsiBSLBQYd2n5ZfAk7FjwMiKt5GlD
 fD6seeEzvluG42x1lyvki5cH0rog9azOwXRt35xQxLmz+ByJpF3qZypl15N5J1yLXAXI0U3qhhJ
 6m6hFxspVbGUx6AjI7Q==
X-Proofpoint-GUID: 1DSMXPhzZKexbGJbvhS4wrUwtg5Z2Bor
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698aff64 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=SsMK-6ewAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=9pfXzjdW_bivB7LniHoA:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230872

- Drop patch 0001-support-reproducibility-for-debug-sources.patch
which has been merged by upstream

- Fix build failed on arm64

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rt-reproducibility-for-debug-sources.patch | 48 -------------------
 .../vte/0002-fix-build-failed-on-arm64.patch  | 33 +++++++++++++
 .../vte/{vte_0.82.2.bb => vte_0.83.90.bb}     |  4 +-
 3 files changed, 35 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
 create mode 100644 meta/recipes-support/vte/vte/0002-fix-build-failed-on-arm64.patch
 rename meta/recipes-support/vte/{vte_0.82.2.bb => vte_0.83.90.bb} (93%)

diff --git a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
deleted file mode 100644
index 20e8f71c0e..0000000000
--- a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0959004adbe46f88d558d2ce61b496c662c196f5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 3 Nov 2025 06:13:11 +0000
-Subject: [PATCH] support reproducibility for debug sources
-
-While option --debug-sources is used, the generated source file contains
-build path comments which caused the build is not reproducible [1]
-...subprojects/simdutf/simdutf.h...
- 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
- 2 /* begin file include/simdutf.h */
- 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
- 4 #ifndef SIMDUTF_H
-...subprojects/simdutf/simdutf.h...
-
-After apply this commit, use relative path to instead
-...subprojects/simdutf/simdutf.h...
- 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
- 2 /* begin file include/simdutf.h */
- 3 // include/simdutf.h:1
- 4 #ifndef SIMDUTF_H
-...subprojects/simdutf/simdutf.h...
-
-[1] https://reproducible-builds.org/
-
-Upstream-Status: Submitted [https://github.com/simdutf/simdutf/pull/848]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- singleheader/amalgamate.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
-index 190b2f6..75e0d78 100755
---- a/singleheader/amalgamate.py
-+++ b/singleheader/amalgamate.py
-@@ -385,7 +385,8 @@ def filter_features(file):
-                 current_features = None
-             elif enabled:
-                 if context.args.debug_sources and not prev_line.endswith('\\'):
--                    yield f"// {file}:{lineno}"
-+                    RELFILE = os.path.relpath(file, PROJECTPATH)
-+                    yield f"// {RELFILE}:{lineno}"
- 
-                 if line or (not line and prev_line):
-                     yield line
--- 
-2.48.1
-
diff --git a/meta/recipes-support/vte/vte/0002-fix-build-failed-on-arm64.patch b/meta/recipes-support/vte/vte/0002-fix-build-failed-on-arm64.patch
new file mode 100644
index 0000000000..80b3e4854a
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0002-fix-build-failed-on-arm64.patch
@@ -0,0 +1,33 @@
+From 0b606d7f1d9d60ab04ad0a07443bf792b5b932bc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 10 Feb 2026 13:09:10 +0800
+Subject: [PATCH 2/2] fix build failed on arm64
+
+subprojects/simdutf/simdutf.cpp:1819:2: error: expected ';' after class definition
+ 1819 | } // namespace arm64
+      |  ^
+      |  ;
+
+Upstream-Status: Backport [https://github.com/simdutf/simdutf/commit/2542805947b0592c3bf65b7ca778b0406fe0b6ee]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/simdutf/arm64/implementation.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/simdutf/arm64/implementation.h b/src/simdutf/arm64/implementation.h
+index ae91895b..61c29634 100644
+--- a/src/simdutf/arm64/implementation.h
++++ b/src/simdutf/arm64/implementation.h
+@@ -284,8 +284,8 @@ public:
+                    char character) const noexcept;
+   const char16_t *find(const char16_t *start, const char16_t *end,
+                        char16_t character) const noexcept;
+-};
+ #endif // SIMDUTF_FEATURE_BASE64
++};
+ 
+ } // namespace arm64
+ } // namespace simdutf
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.83.90.bb
similarity index 93%
rename from meta/recipes-support/vte/vte_0.82.2.bb
rename to meta/recipes-support/vte/vte_0.83.90.bb
index d5dced4ce6..a28d8e040c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.83.90.bb
@@ -18,10 +18,10 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
+            file://0002-fix-build-failed-on-arm64.patch;patchdir=subprojects/simdutf \
 "
 
-SRC_URI[archive.sha256sum] = "e1295aafc4682b3b550f1235dc2679baa0f71570d8ed543c001c1283d530be91"
+SRC_URI[archive.sha256sum] = "a43441a78f8893268ae927e7bae3b17ffe669913ed954e172fbd12d3e083e286"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


