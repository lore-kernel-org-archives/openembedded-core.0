Return-Path: <peter.marko@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 886FC72FB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 17:19:09 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v1RHJ5Cm009193
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 18:19:05 +0100
Received: from dev.sbt.siemens.com ([139.22.56.193])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v1RHJ5Qk022162;
	Mon, 27 Feb 2017 18:19:05 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id EB52B3E5D;
	Mon, 27 Feb 2017 18:19:04 +0100 (CET)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 18:18:45 +0100
Message-Id: <1488215925-26396-1-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH] zlib: Upgrade 1.2.8 -> 1.2.11
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
X-List-Received-Date: Mon, 27 Feb 2017 17:19:12 -0000

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 1.2.11                                                              | 0
 .../zlib/{zlib-1.2.8 => zlib-1.2.11}/Makefile-runtests.patch        | 0
 .../zlib/{zlib-1.2.8 => zlib-1.2.11}/ldflags-tests.patch            | 0
 .../zlib/{zlib-1.2.8 => zlib-1.2.11}/remove.ldconfig.call.patch     | 0
 meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/run-ptest        | 0
 meta/recipes-core/zlib/{zlib_1.2.8.bb => zlib_1.2.11.bb}            | 6 +++---
 6 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 1.2.11
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/Makefile-runtests.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/ldflags-tests.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/run-ptest (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.8.bb => zlib_1.2.11.bb} (86%)

diff --git a/1.2.11 b/1.2.11
new file mode 100644
index 0000000..e69de29
diff --git a/meta/recipes-core/zlib/zlib-1.2.8/Makefile-runtests.patch b/meta/recipes-core/zlib/zlib-1.2.11/Makefile-runtests.patch
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.8/Makefile-runtests.patch
rename to meta/recipes-core/zlib/zlib-1.2.11/Makefile-runtests.patch
diff --git a/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch b/meta/recipes-core/zlib/zlib-1.2.11/ldflags-tests.patch
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
rename to meta/recipes-core/zlib/zlib-1.2.11/ldflags-tests.patch
diff --git a/meta/recipes-core/zlib/zlib-1.2.8/remove.ldconfig.call.patch b/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.8/remove.ldconfig.call.patch
rename to meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
diff --git a/meta/recipes-core/zlib/zlib-1.2.8/run-ptest b/meta/recipes-core/zlib/zlib-1.2.11/run-ptest
similarity index 100%
rename from meta/recipes-core/zlib/zlib-1.2.8/run-ptest
rename to meta/recipes-core/zlib/zlib-1.2.11/run-ptest
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
similarity index 86%
rename from meta/recipes-core/zlib/zlib_1.2.8.bb
rename to meta/recipes-core/zlib/zlib_1.2.11.bb
index 913c703..2018e7b 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -4,7 +4,7 @@ library which is used by many different programs."
 HOMEPAGE = "http://zlib.net/"
 SECTION = "libs"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b73844a0c494fd"
+LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
@@ -13,8 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "28f1205d8dd2001f26fec1e8c2cebe37"
-SRC_URI[sha256sum] = "831df043236df8e9a7667b9e3bb37e1fcb1220a0f163b6de2626774b9590d057"
+SRC_URI[md5sum] = "85adef240c5f370b308da8c938951a68"
+SRC_URI[sha256sum] = "4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066"
 
 RDEPENDS_${PN}-ptest += "make"
 
-- 
2.1.4


