Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl3Q-0007yL-TA
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="86068971"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:41 -0800
Message-Id: <c5b78d8cb40823d08fe57ac83607e248b323b026.1321470759.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
References: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
Subject: [PATCH 6/8] python-gst: upgrade from 0.10.21 to 0.10.22
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
X-List-Received-Date: Wed, 16 Nov 2011 19:21:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...python-gst_0.10.21.bb => python-gst_0.10.22.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-gst_0.10.21.bb => python-gst_0.10.22.bb} (82%)

diff --git a/meta/recipes-devtools/python/python-gst_0.10.21.bb b/meta/recipes-devtools/python/python-gst_0.10.22.bb
similarity index 82%
rename from meta/recipes-devtools/python/python-gst_0.10.21.bb
rename to meta/recipes-devtools/python/python-gst_0.10.22.bb
index e1b7cc8..baadd41 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.21.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.22.bb
@@ -3,13 +3,13 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 DEPENDS = "gstreamer gst-plugins-base python-pygobject"
 RDEPENDS_${PN} += "python-pygtk"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
            file://python-path.patch"
 
-SRC_URI[md5sum] = "31340ae3e877797a10d088a226d74b16"
-SRC_URI[sha256sum] = "d5962132c84b88b54d0f63832b8dfcc383a7805827da5abc2d1d215ba86a6f92"
+SRC_URI[md5sum] = "937152fe896241f827689f4b53e79b22"
+SRC_URI[sha256sum] = "8f26f519a5bccd770864317e098e5e307fc5ad1201eb96329634b6508b253178"
 S = "${WORKDIR}/gst-python-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=39ff67e932b7bdfa9b78bad67151690b"
-- 
1.7.6.4



