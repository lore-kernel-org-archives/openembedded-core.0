Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1UAFZ9-0006Mp-UH
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:07:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Feb 2013 23:50:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,739,1355126400"; d="scan'208";a="206326632"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Feb 2013 23:50:50 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 09:51:11 +0200
Message-Id: <1361865071-18551-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] e2fsprogs : upgrade to 1.42.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 08:07:41 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../acinclude.m4                                   |    0
 .../fallocate.patch                                |    0
 .../mkdir.patch                                    |    0
 .../remove.ldconfig.call.patch                     |    0
 .../{e2fsprogs_1.42.6.bb => e2fsprogs_1.42.7.bb}   |    4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.6.bb => e2fsprogs_1.42.7.bb} (93%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/fallocate.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/fallocate.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/fallocate.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remove.ldconfig.call.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/remove.ldconfig.call.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
similarity index 93%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
index e6d90a1..9e22563 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
 "
 
-SRC_URI[md5sum] = "9e444c240c1001b3292d108fbad0f49c"
-SRC_URI[sha256sum] = "726b5919edeaee5b077d7a5b602284f1453ea31cf499efa433af26c679b667a5"
+SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
+SRC_URI[sha256sum] = "dc6501b2e75d205e425196d753d92b129c568525d8aad08085c0aa69ee9e7345"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-- 
1.7.9.5



