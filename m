Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A916C6ABED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 07:04:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2013 00:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,992,1363158000"; d="scan'208";a="365154961"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.44])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 00:04:27 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 10:05:04 +0300
Message-Id: <1372921504-26839-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] e2fsprogs: upgrade to 1.42.8
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
X-List-Received-Date: Thu, 04 Jul 2013 07:04:34 -0000

upgrade from 1.42.7 -> 1.42.8

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../acinclude.m4                                   |    0
 .../fallocate.patch                                |    0
 .../mkdir.patch                                    |    0
 .../remove.ldconfig.call.patch                     |    0
 .../{e2fsprogs_1.42.7.bb => e2fsprogs_1.42.8.bb}   |    5 ++---
 5 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 => e2fsprogs-1.42.8}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 => e2fsprogs-1.42.8}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 => e2fsprogs-1.42.8}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 => e2fsprogs-1.42.8}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.7.bb => e2fsprogs_1.42.8.bb} (93%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/fallocate.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fallocate.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/remove.ldconfig.call.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/remove.ldconfig.call.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
similarity index 93%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index 3a4f5a8..d231268 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -1,13 +1,12 @@
 require e2fsprogs.inc
 
-PR = "r0"
 
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
 "
 
-SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
-SRC_URI[sha256sum] = "dc6501b2e75d205e425196d753d92b129c568525d8aad08085c0aa69ee9e7345"
+SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
+SRC_URI[sha256sum] = "b984aaf1fe888d6a4cf8c2e8d397207879599b5368f1d33232c1ec9d68d00c97"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-- 
1.7.9.5


