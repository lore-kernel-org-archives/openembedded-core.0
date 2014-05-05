Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AFD1D65F44
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:17:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2014 08:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,988,1389772800"; d="scan'208";a="506136161"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2014 08:17:22 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 18:20:47 +0300
Message-Id: <4142c388d31f6f5120a7eb4ea28c8c7449ca9b76.1399303211.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399303211.git.cristian.iorga@intel.com>
References: <cover.1399303211.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1399303211.git.cristian.iorga@intel.com>
References: <cover.1399303211.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] taglib: upgrade to 1.9.1
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
X-List-Received-Date: Mon, 05 May 2014 15:17:30 -0000

- Updated website;
- Updated tarball location;
- Switched to BP variable;
- Improved source dir definition;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../taglib/{taglib_1.8.bb => taglib_1.9.1.bb}              | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.8.bb => taglib_1.9.1.bb} (64%)

diff --git a/meta/recipes-support/taglib/taglib_1.8.bb b/meta/recipes-support/taglib/taglib_1.9.1.bb
similarity index 64%
rename from meta/recipes-support/taglib/taglib_1.8.bb
rename to meta/recipes-support/taglib/taglib_1.9.1.bb
index 7327bc8..0ecb444 100644
--- a/meta/recipes-support/taglib/taglib_1.8.bb
+++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library for reading and editing the meta-data of popular audio formats"
 SECTION = "libs/multimedia"
-HOMEPAGE = "http://developer.kde.org/~wheeler/taglib.html"
+HOMEPAGE = "http://taglib.github.io/"
 LICENSE = "LGPLv2.1 | MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
@@ -8,15 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib"
 
-PR = "r1"
-# http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
-SRC_URI = "https://github.com/downloads/taglib/taglib/taglib-1.8.tar.gz \
-           "
+SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
+SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"
 
-SRC_URI[md5sum] = "dcb8bd1b756f2843e18b1fdf3aaeee15"
-SRC_URI[sha256sum] = "66d33481703c90236a0a9d1c38fd81b584ca7109ded049225f5463dcaffc209a"
-
-S = "${WORKDIR}/taglib-${PV}"
+S = "${WORKDIR}/${BP}"
 
 inherit cmake pkgconfig binconfig
 
-- 
1.9.1


