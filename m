Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3E52265D35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596816"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:18 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:54 +0300
Message-Id: <cb6e12ab2da638a591a526ef98560dc858e1df8a.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 12/12] fontconfig: upgrade to 2.11.1
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:20 -0000

Removed the following patch(es):
 * sysroot-arg.patch (changes included in release)

Correct the fccache.c license checksum and the line numbers because the
license snippet has moved and, also, at the previous upgrade the lines
were wrong (shifted a couple of lines).

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../fontconfig/fontconfig/sysroot-arg.patch        |   32 --------------------
 .../{fontconfig_2.11.0.bb => fontconfig_2.11.1.bb} |    8 ++---
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/sysroot-arg.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.0.bb => fontconfig_2.11.1.bb} (83%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/sysroot-arg.patch b/meta/recipes-graphics/fontconfig/fontconfig/sysroot-arg.patch
deleted file mode 100644
index abfdbc7..0000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/sysroot-arg.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=72044]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From f2ade764cc9f009e1fe25b856b24b7695f66a952 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 26 Nov 2013 17:18:25 +0000
-Subject: [PATCH] fc-cache: --sysroot option takes an argument
-
-The getopt_long option definitions say that sysroot doesn't take an argument,
-when it in fact does.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- fc-cache/fc-cache.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fc-cache/fc-cache.c b/fc-cache/fc-cache.c
-index 27c7513..bf3b6b4 100644
---- a/fc-cache/fc-cache.c
-+++ b/fc-cache/fc-cache.c
-@@ -67,7 +67,7 @@
- const struct option longopts[] = {
-     {"force", 0, 0, 'f'},
-     {"really-force", 0, 0, 'r'},
--    {"sysroot", 0, 0, 'y'},
-+    {"sysroot", required_argument, 0, 'y'},
-     {"system-only", 0, 0, 's'},
-     {"version", 0, 0, 'V'},
-     {"verbose", 0, 0, 'v'},
--- 
-1.8.4.4
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
similarity index 83%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
index 48385a3..797b321 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
@@ -14,16 +14,16 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1131;endline=1146;md5=754c7b855210ee746e5f0b840fad9a9f"
+                    file://src/fccache.c;beginline=1143;endline=1158;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
 DEPENDS = "expat freetype zlib"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
-           file://sysroot-arg.patch"
-SRC_URI[md5sum] = "84278204cd7f36adbea7ad8094e039ac"
-SRC_URI[sha256sum] = "274c047487b90dacbaa55f4d70b8cdcd556944e7251ce9cf1de442c00a16343b"
+           "
+SRC_URI[md5sum] = "e75e303b4f7756c2b16203a57ac87eba"
+SRC_URI[sha256sum] = "b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d"
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
1.7.9.5


