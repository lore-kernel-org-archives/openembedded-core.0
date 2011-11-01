Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RLH4v-0002it-EQ
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 17:20:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2011 09:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,438,1315206000"; d="scan'208";a="80097638"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.93])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2011 09:14:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 16:14:28 +0000
Message-Id: <b72f077a61b5d706e6563f3ee19be6f3cf9a451e.1320163967.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320163967.git.paul.eggleton@linux.intel.com>
References: <cover.1320163967.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320163967.git.paul.eggleton@linux.intel.com>
References: <cover.1320163967.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] udev: Fix the packaging of libgudev
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
X-List-Received-Date: Tue, 01 Nov 2011 16:20:46 -0000

From: Holger Hans Peter Freyther <zecke@selfish.org>

Make the libgudev so go to the libgudev package, this is already
fixed in meta-oe.

Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
---
 meta/recipes-core/udev/udev-new.inc |    4 ++--
 meta/recipes-core/udev/udev_164.bb  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 4c4451f..0247a83 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -51,8 +51,8 @@ FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
 FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
                      ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
-FILES_libgudev = "${libdir}/libgudev*.so.*"
-FILES_libgudev-dbg = "${libdir}/.debug/libgudev*.so.*"
+FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
+FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index f20da27..689b5fd 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.5.4



