Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RgXrM-0006zj-CC
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 09:30:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Dec 2011 00:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101588787"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2011 00:22:19 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:11:19 +0800
Message-Id: <7815e1ffd6375b606feb11c6949f942db30464c7.1325232608.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
References: <cover.1325232608.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
References: <cover.1325232608.git.edwin.zhai@intel.com>
Subject: [PATCH 1/3] lighttpd: Upgrade to 1.4.30
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
X-List-Received-Date: Fri, 30 Dec 2011 08:30:40 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{lighttpd_1.4.29.bb => lighttpd_1.4.30.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.29.bb => lighttpd_1.4.30.bb} (92%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
similarity index 92%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
index 9fdb5f6..2c247f0 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
@@ -24,8 +24,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd \
 "
 
-SRC_URI[md5sum] = "e6e67b09986cb504db630b5a86b2dd76"
-SRC_URI[sha256sum] = "afd8af213e65afb48b397d004696c6620a7ae7f3d4f162ec46a04b9b9dbfd599"
+SRC_URI[md5sum] = "63f9df52dcae0ab5689a95c99c54e48a"
+SRC_URI[sha256sum] = "0d795597e4666dbf6ffe44b4a42f388ddb44736ddfab0b1ac091e5bb35212c2d"
 
 EXTRA_OECONF = " \
              --without-bzip2 \
-- 
1.7.1



