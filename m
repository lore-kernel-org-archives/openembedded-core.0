Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB05C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 07:14:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46028.1739776476428883429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 23:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4143913a06=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H4g3me008440
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 23:14:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tuaq9a81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 23:14:35 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 16 Feb 2025 23:14:35 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 16 Feb 2025 23:14:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] gpgme: upgrade 1.24.1 -> 1.24.2
Date: Mon, 17 Feb 2025 15:14:31 +0800
Message-ID: <20250217071432.4144843-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217071432.4144843-1-hongxu.jia@windriver.com>
References: <20250217071432.4144843-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QLGSRhLL c=1 sm=1 tr=0 ts=67b2e1db cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=gIqIzurSVVm03vCh77kA:9 a=Ohuo-sdro4PwUcRb:21
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zNU8C76iH79SwtKLfPlKJ4IUsUvhCnLg
X-Proofpoint-ORIG-GUID: zNU8C76iH79SwtKLfPlKJ4IUsUvhCnLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 07:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211517

From: Upgrade Helper <auh@yoctoproject.org>

---
 ...vert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 2 +-
 .../gpgme/0001-autogen.sh-remove-unknown-in-version.patch   | 2 +-
 meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch       | 6 +++---
 .../0001-posix-io.c-Use-off_t-instead-of-off64_t.patch      | 2 +-
 .../gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch  | 2 +-
 ...gme-lang-python-gpg-error-config-should-not-be-use.patch | 4 ++--
 .../gpgme/gpgme/0003-Correctly-install-python-modules.patch | 4 ++--
 ...gme-config-skip-all-lib-or-usr-lib-directories-in-.patch | 2 +-
 .../gpgme/gpgme/0006-fix-build-path-issue.patch             | 4 ++--
 .../gpgme/{gpgme_1.24.1.bb => gpgme_1.24.2.bb}              | 2 +-
 10 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.24.1.bb => gpgme_1.24.2.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index e6e86dfd77..2a906a6c73 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From b12b01239909b6fb41adc64d3c0ed32795554369 Mon Sep 17 00:00:00 2001
+From 95d0bae453b2b5a7d25b92d99565d27407fffa1b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:18:04 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index af97f11430..890909dd5e 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 1d0fa519ef017aef4821af49c59bad119e7f0d66 Mon Sep 17 00:00:00 2001
+From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 59f98103d4..9d0b4b282b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 108461f6c50b57ba73970dc977e7d4e9a02624df Mon Sep 17 00:00:00 2001
+From 447fd26a43f40ccb071cd19198ee43fdfce87e3a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:04:52 -0800
 Subject: [PATCH] pkgconfig
@@ -27,10 +27,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index fe02bdf..6f33020 100644
+index c34f700..4eddc3d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1179,6 +1179,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -1176,6 +1176,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index 9845b02969..932fb9c962 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 13b955f66615caf34d19e86d97bcfe841d60d58c Mon Sep 17 00:00:00 2001
+From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index f174e24ebc..ed2edabd63 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From 2592a1d97c66f8bff4bae095b14cb774de3e80c9 Mon Sep 17 00:00:00 2001
+From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index 373660be94..3a1837e857 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,4 +1,4 @@
-From a956d17d2aa7fea53bab97715a8f98858e9b4a5c Mon Sep 17 00:00:00 2001
+From 145adf290571b7dd47b7fca57b11349af0b94e74 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:30:36 +0800
 Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index d6f537e..695c02e 100755
+index 1ddfbe7..d2fa4f0 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
 @@ -173,9 +173,8 @@ class BuildExtFirstHack(build):
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index 004e587518..7b2831ba4f 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,4 +1,4 @@
-From 548d84c703a747c41a02e1d0ff6ad4c193a34a5c Mon Sep 17 00:00:00 2001
+From d8e884d1fa8c35ce68e94a0668548580cf5ba2d3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 15:28:49 +0800
 Subject: [PATCH] Correctly install python modules
@@ -17,7 +17,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index a6fd639..136e979 100644
+index 1aa330f..d1d5c63 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
 @@ -97,6 +97,7 @@ install-exec-local:
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 120cb64b98..c021e48be9 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 59b2e28b34f332d12935af41dbe3140f5842e8d1 Mon Sep 17 00:00:00 2001
+From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
index 00449e3259..d64168b4fd 100644
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -1,4 +1,4 @@
-From 89a53d8d025fef4626006219f0f686982e215d97 Mon Sep 17 00:00:00 2001
+From f9f82874048c5eec08e815ff871462184b6d7d6a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 11:01:09 +0800
 Subject: [PATCH] fix build path issue
@@ -17,7 +17,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 136e979..1495982 100644
+index d1d5c63..148e1b9 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
 @@ -96,8 +96,9 @@ install-exec-local:
diff --git a/meta/recipes-support/gpgme/gpgme_1.24.1.bb b/meta/recipes-support/gpgme/gpgme_1.24.2.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.24.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.24.2.bb
index 86ba08c464..bc661429e7 100644
--- a/meta/recipes-support/gpgme/gpgme_1.24.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.24.2.bb
@@ -29,7 +29,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "ea05d0258e71061d61716584ec34cef59330a91340571edc46b78374973ba85f"
+SRC_URI[sha256sum] = "e11b1a0e361777e9e55f48a03d89096e2abf08c63d84b7017cfe1dce06639581"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.34.1


