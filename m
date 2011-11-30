Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RVtGN-0003KH-G5
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:08:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 15:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81793792"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 30 Nov 2011 15:01:47 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 07:21:37 +0800
Message-Id: <ea7be2249c7b19944968f44463d2d37a51fc548f.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/5] glib-2.0: upgrade to version 2.30.1
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
X-List-Received-Date: Wed, 30 Nov 2011 23:08:27 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../{glib-2.0_2.30.0.bb => glib-2.0_2.30.1.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.0.bb => glib-2.0_2.30.1.bb} (91%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
similarity index 91%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
index 50e174e..408ab83 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r4"
+PR = "r0"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
           "
-SRC_URI[md5sum] = "fee101d9d7daa8ddfbae00325f307f3b"
-SRC_URI[sha256sum] = "ca9c731017ab370859e847f8b70079bc6dcf389dc0ccb0d0419925aff81b9687"
+SRC_URI[md5sum] = "921ef2e86e911feb5e21f656f1ac305b"
+SRC_URI[sha256sum] = "4e560319450f31d85b6cdb2b530c3324a510ca04817e360943d0774327d21804"
 
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-- 
1.7.1



