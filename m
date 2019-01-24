Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60B3879D6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:40:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6dkiY000809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:39:56 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:39:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 14:57:31 +0800
Message-ID: <a2c60faf55e1a12fac215dd455acafdc3152f93c.1548312985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548312985.git.liezhi.yang@windriver.com>
References: <cover.1548312985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] ccache: 3.5 -> 3.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2019 06:40:05 -0000
Content-Type: text/plain

* Rebased 0002-dev.mk.in-fix-file-name-too-long.patch and sent it to upstream,
  and got merged.
* The LIC_FILES_CHKSUM is changed because of year updated.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_3.5.bb                    | 11 -----------
 meta/recipes-devtools/ccache/ccache_3.6.bb                    | 11 +++++++++++
 .../ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch  |  8 ++++----
 3 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.5.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.6.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.5.bb b/meta/recipes-devtools/ccache/ccache_3.5.bb
deleted file mode 100644
index 89062c4..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.5.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=39f34d6ff4df51ed718fd7d243fc4e51"
-
-SRC_URI[md5sum] = "6e62bf2fd2c8fdc749efdca74868da41"
-SRC_URI[sha256sum] = "8094f9bc186be4c9db9b480eeac280926bd44039502d1e596f45371b05a85918"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.6.bb b/meta/recipes-devtools/ccache/ccache_3.6.bb
new file mode 100644
index 0000000..a12306e
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.6.bb
@@ -0,0 +1,11 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=70762511f9c509cc2a4e4ba2ef687ae3"
+
+SRC_URI[md5sum] = "bd6fd69db28426baf22ec0acdd5c4b2a"
+SRC_URI[sha256sum] = "a3f2b91a2353b65a863c5901251efe48060ecdebec46b5eaec8ea8e092b9e871"
+
+SRC_URI += " \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+"
diff --git a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
index 68c2371..16a6e9d 100644
--- a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
+++ b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
@@ -1,13 +1,13 @@
 From 7dab2995ed8eeccd7b0acd79668bc28f3a2427d5 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 16 Sep 2015 19:45:40 -0700
-Subject: [PATCH] dev.mk.in: fix file name too long
+Subject: [PATCH] dev.mk.in: fix file name too long error
 
-The all_cppflags change paths to filename which cause file name too long
+The all_cppflags changes path to filename which causes file name too long
 error when the path is longer than NAME_MAX (usually 255). Strip srcdir
 to fix the problem.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/ccache/ccache/commit/4d86e884d07ba1853a0c70507cc4d04107f57c29]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
@@ -22,7 +22,7 @@ index 91b0a57..583ade0 100644
 @@ -1,7 +1,7 @@
  # GNU make syntax reigns in this file.
  
- all_cflags += -Werror
+ all_cflags += -Werror @more_warnings@
 -all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$<)).d
 +all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$(subst $(srcdir)/,,$<))).d
  
-- 
2.7.4


