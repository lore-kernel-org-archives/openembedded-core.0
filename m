Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QoA0w-0005Lt-RJ
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 10:07:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2011 01:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; d="scan'208";a="34546282"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 01:03:06 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 16:00:22 +0800
Message-Id: <265db54a73e422fa1b1357ff6737c9909ac339de.1312271833.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312271833.git.edwin.zhai@intel.com>
References: <cover.1312271833.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1312271833.git.edwin.zhai@intel.com>
References: <cover.1312271833.git.edwin.zhai@intel.com>
Subject: [PATCH 1/8] lighttpd: Upgrade to 1.4.29
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
X-List-Received-Date: Tue, 02 Aug 2011 08:07:47 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{lighttpd_1.4.28.bb => lighttpd_1.4.29.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.28.bb => lighttpd_1.4.29.bb} (90%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.28.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
similarity index 90%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.28.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
index d43766c..c1d5f81 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.28.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
@@ -18,14 +18,14 @@ RDEPENDS_${PN} += " \
 
 PR = "r0"
 
-SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.gz;name=src \
+SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html \
         file://lighttpd.conf \
         file://lighttpd \
 "
 
-SRC_URI[src.md5sum] = "202d36efc6324adb95a3600d2826ec6a"
-SRC_URI[src.sha256sum] = "efd7623f43182723b99c51d57a24158e22a207cd90dca35aaf3b2e3bac115712"
+SRC_URI[md5sum] = "e6e67b09986cb504db630b5a86b2dd76"
+SRC_URI[sha256sum] = "afd8af213e65afb48b397d004696c6620a7ae7f3d4f162ec46a04b9b9dbfd599"
 
 EXTRA_OECONF = " \
              --without-bzip2 \
-- 
1.7.1



