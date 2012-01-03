Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrB-0004L1-4Z
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752167"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:16 -0800
Message-Id: <0f325c0933f2bea40cf4aeb594b5a3745b262adc.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 030/113] glib-2.0: upgrade to 2.30.2
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:25 -0000

From: Shane Wang <shane.wang@intel.com>

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb} (91%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
similarity index 91%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index bf415a1..eff43c9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://g_once_init_enter.patch \
            file://glib-2.0_fix_for_x32.patch \
           "
-SRC_URI[md5sum] = "921ef2e86e911feb5e21f656f1ac305b"
-SRC_URI[sha256sum] = "4e560319450f31d85b6cdb2b530c3324a510ca04817e360943d0774327d21804"
+SRC_URI[md5sum] = "b40f3889e8d24e1b367763673ca6deb5"
+SRC_URI[sha256sum] = "94b1f1a1456c67060ca868d299bef3f7268a2c1c5c360aabb7149d4d9b2fdcd3"
 
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-- 
1.7.6.4



