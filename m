Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LB7-0000gL-8L
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:37:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139655982"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:29:08 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:51:59 +0800
Message-Id: <6e292a182bf59d4824751f4e51e41d52e8474955.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 02/60] glib-2.0: upgrade to 2.30.3
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
X-List-Received-Date: Fri, 16 Mar 2012 00:37:57 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{glib-2.0_2.30.2.bb => glib-2.0_2.30.3.bb}     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.2.bb => glib-2.0_2.30.3.bb} (88%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
index 0e96fc1..3b9da89 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r7"
+PR = "r0"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -9,15 +9,15 @@ DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nat
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
            file://glib-2.0_fix_for_x32.patch \
            file://nodbus.patch \
           "
-SRC_URI[md5sum] = "b40f3889e8d24e1b367763673ca6deb5"
-SRC_URI[sha256sum] = "94b1f1a1456c67060ca868d299bef3f7268a2c1c5c360aabb7149d4d9b2fdcd3"
+SRC_URI[md5sum] = "0f9fa329c6c1012d0fd861ad3d8a4520"
+SRC_URI[sha256sum] = "e6cbb27c71c445993346e785e8609cc75cea2941e32312e544872feba572dd27"
 
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-- 
1.7.6



