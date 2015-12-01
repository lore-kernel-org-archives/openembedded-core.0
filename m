Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB22606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:31:08 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3p96pN16gbz3hmlG;
	Tue,  1 Dec 2015 16:31:08 +0100 (CET)
X-Auth-Info: DBcetgFZEWkHg8+ZOER+UEpQZiB+OBOK3ppJGlPxEzs=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3p96pM5SJVzvdWt;
	Tue,  1 Dec 2015 16:31:07 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 16:30:59 +0100
Message-Id: <1448983859-6096-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] libbsd: Upgrade to 0.8.0
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
X-List-Received-Date: Tue, 01 Dec 2015 15:31:08 -0000

Upgrade the library version to recently released 0.8.0 .

The COPYING file changed again, but the changes are just new names
added to the Copyright (C) YYYY John Doe <...> section, no changes
to the license itself.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Saul Wold <sgw@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libbsd/libbsd_0.7.0.bb | 21 ---------------------
 meta/recipes-support/libbsd/libbsd_0.8.0.bb | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd_0.7.0.bb
 create mode 100644 meta/recipes-support/libbsd/libbsd_0.8.0.bb

diff --git a/meta/recipes-support/libbsd/libbsd_0.7.0.bb b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
deleted file mode 100644
index 902666d..0000000
--- a/meta/recipes-support/libbsd/libbsd_0.7.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Library of utility functions from BSD systems"
-DESCRIPTION = "This library provides useful functions commonly found on BSD systems, \
-               and lacking on others like GNU systems, thus making it easier to port \
-               projects with strong BSD origins, without needing to embed the same \
-               code over and over again on each project."
-
-HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
-LICENSE = "BSD-4-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f1530ea92aeaa1c5e2547cfd43905d8c"
-SECTION = "libs"
-DEPENDS = ""
-
-SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "fcceb4e66fd448ca4ed42ba22a8babb0"
-SRC_URI[sha256sum] = "0f3b0e17e5c34c038126e0a04351b11e23c6101a7d0ce3beeab29bb6415c10bb"
-
-inherit autotools pkgconfig
diff --git a/meta/recipes-support/libbsd/libbsd_0.8.0.bb b/meta/recipes-support/libbsd/libbsd_0.8.0.bb
new file mode 100644
index 0000000..b9f4464
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd_0.8.0.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Library of utility functions from BSD systems"
+DESCRIPTION = "This library provides useful functions commonly found on BSD systems, \
+               and lacking on others like GNU systems, thus making it easier to port \
+               projects with strong BSD origins, without needing to embed the same \
+               code over and over again on each project."
+
+HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
+LICENSE = "BSD-4-Clause & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b99a70657f41053dc4b49d0ae73f7a78"
+SECTION = "libs"
+DEPENDS = ""
+
+SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "262bdd1aa3bee6066a8c9cb49bb6c584"
+SRC_URI[sha256sum] = "fbb732084bd960e4c78b688aac875be98e290cc6fe462b2ff8ee946a6473e38c"
+
+inherit autotools pkgconfig
-- 
2.1.4


