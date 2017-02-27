Return-Path: <peter.marko@siemens.com>
X-Greylist: delayed 1256 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Feb 2017 14:27:13 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 240AB72F1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:27:13 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v1RE6DlZ016656
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:06:13 +0100
Received: from bt-builds.hqs.sbt.siemens.com (sk1d502c.siemens-pse.sk
	[163.242.51.226])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v1RE6DWw017462;
	Mon, 27 Feb 2017 15:06:13 +0100
Received: from bt-builds.hqs.sbt.siemens.com (localhost [127.0.0.1])
	by bt-builds.hqs.sbt.siemens.com (Postfix) with ESMTP id D6B0A1AC4FD;
	Mon, 27 Feb 2017 15:06:12 +0100 (CET)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 15:05:55 +0100
Message-Id: <1488204355-15461-1-git-send-email-peter.marko@siemens.com>
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
X-List-Received-Date: Mon, 27 Feb 2017 14:27:14 -0000

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../zlib/{zlib-1.2.8 => zlib-1.2.11}/Makefile-runtests.patch          | 0
 .../recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/ldflags-tests.patch | 0
 .../zlib/{zlib-1.2.8 => zlib-1.2.11}/remove.ldconfig.call.patch       | 0
 meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/run-ptest          | 0
 meta/recipes-core/zlib/{zlib_1.2.8.bb => zlib_1.2.11.bb}              | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/Makefile-runtests.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/ldflags-tests.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib-1.2.8 => zlib-1.2.11}/run-ptest (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.8.bb => zlib_1.2.11.bb} (91%)

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
similarity index 91%
rename from meta/recipes-core/zlib/zlib_1.2.8.bb
rename to meta/recipes-core/zlib/zlib_1.2.11.bb
index 913c703..939be68 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
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


