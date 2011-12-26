Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfC36-0005Xy-UN
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 16:01:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Dec 2011 06:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91612022"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2011 06:54:00 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Dec 2011 22:56:31 +0800
Message-Id: <2efaea1b842ee99cb8ee5f2de3addadc25f3d4cd.1324911023.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
References: <e996720b98f6979a4ee65d26b942ec3fd2ab9371.1324911023.git.shane.wang@intel.com>
In-Reply-To: <cover.1324911023.git.shane.wang@intel.com>
References: <cover.1324911023.git.shane.wang@intel.com>
Subject: [PATCH 11/13] ofono: upgrade to 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Dec 2011 15:01:13 -0000

This patch is to upgrade ofono to 1.0.
The license is changed from "Copyright (C) 2008-2010 Intel Corporation. All rights reserved." into "Copyright (C) 2008-2011 Intel Corporation. All rights reserved."

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
 .../ofono/{ofono_0.50.bb => ofono_1.0.bb}          |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_0.50.bb => ofono_1.0.bb} (63%)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 0cc58ae..bf6f6a5 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -3,7 +3,7 @@ SUMMARY  = "open source telephony"
 DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
 LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/ofono.h;beginline=1;endline=20;md5=85d349dd8ec342c8f40d90e520f22779"
+                    file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
 
 inherit autotools pkgconfig update-rc.d
 
diff --git a/meta/recipes-connectivity/ofono/ofono_0.50.bb b/meta/recipes-connectivity/ofono/ofono_1.0.bb
similarity index 63%
rename from meta/recipes-connectivity/ofono/ofono_0.50.bb
rename to meta/recipes-connectivity/ofono/ofono_1.0.bb
index b4ef413..276efdb 100644
--- a/meta/recipes-connectivity/ofono/ofono_0.50.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.0.bb
@@ -1,6 +1,6 @@
 require ofono.inc
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
 	          file://ofono"
@@ -10,5 +10,5 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
 "
 
-SRC_URI[md5sum] = "b2656fd0bbf33f926fc86c1e8915d697"
-SRC_URI[sha256sum] = "f8f8dd917847a007e4d441b949efc4d28dc3644526d5293016844c2536c65ff9"
+SRC_URI[md5sum] = "09a36c923c8c0f491899aa7eebe92193"
+SRC_URI[sha256sum] = "7733e1628fac6ef4d8aa3e536a5c284c3ba8e76277fc7e28b7e146c3c5ddebfa"
-- 
1.7.6



