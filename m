Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Re7y7-0004Mo-IS
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:27:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2011 08:20:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90911073"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 23 Dec 2011 08:20:30 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 00:35:17 +0800
Message-Id: <7252a7660c6a9703c7fca5153f87d9dbaaa347e5.1324657801.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
In-Reply-To: <cover.1324657801.git.shane.wang@intel.com>
References: <cover.1324657801.git.shane.wang@intel.com>
Subject: [PATCH 07/14] glib-2.0: upgrade to 2.30.2
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
X-List-Received-Date: Fri, 23 Dec 2011 16:27:39 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb}     |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb} (88%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index bf415a1..62f7dc6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -13,10 +13,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
-           file://glib-2.0_fix_for_x32.patch \
           "
-SRC_URI[md5sum] = "921ef2e86e911feb5e21f656f1ac305b"
-SRC_URI[sha256sum] = "4e560319450f31d85b6cdb2b530c3324a510ca04817e360943d0774327d21804"
+SRC_URI[md5sum] = "b40f3889e8d24e1b367763673ca6deb5"
+SRC_URI[sha256sum] = "94b1f1a1456c67060ca868d299bef3f7268a2c1c5c360aabb7149d4d9b2fdcd3"
 
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-- 
1.7.6



