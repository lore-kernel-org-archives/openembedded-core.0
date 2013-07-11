Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 71D436226A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:50:14 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jul 2013 05:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="266924129"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jul 2013 05:50:13 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 15:51:50 +0300
Message-Id: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xdg-utils: upgrade to 1.1.0-rc1
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
X-List-Received-Date: Thu, 11 Jul 2013 12:50:14 -0000

This version of xdg-utils is needed by BA in order
to associate correctly types of files with PCManFM
file manager.
The release cycle of xdg-utils is very slow, so this
is the best shot of a stable version available for
YP 1.5 release.
As a reference, the previous stable version was released in 2007.
Also, desktop Linux distros use this release candidate as a stable
version, for example, Ubuntu 12.04.

Part of the implementation of [YOCTO #2370].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../xdg-utils/{xdg-utils_1.0.2.bb => xdg-utils_1.1.0-rc1.bb}  |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb => xdg-utils_1.1.0-rc1.bb} (80%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
similarity index 80%
rename from meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index f54d591..d5c7aa3 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -13,14 +13,13 @@ xdg-open \
 xdg-screensaver \ 
 "
 
-PR="r0"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 
-SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tgz"
+SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
+SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
 
 inherit autotools
 
-SRC_URI[md5sum] = "348a5b91dc66426505022c74a64b2940"
-SRC_URI[sha256sum] = "21aeb7d16b2529b8d3975118f59eec09953e09f9a68d718159e98c90474b01ac"
-- 
1.7.10.4


