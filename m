Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEn-0003VG-Fo
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375156"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:10 -0700
Message-Id: <575d70e6e9331832470d772013ef98328b5885d5.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 08/14] glib-2.0: Add nativesdk depends for libffi
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:13 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb |    3 ++-
 meta/recipes-gnome/libffi/libffi_3.0.9.bb     |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
index 8fc6c81..566355d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
@@ -1,10 +1,11 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
+DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
diff --git a/meta/recipes-gnome/libffi/libffi_3.0.9.bb b/meta/recipes-gnome/libffi/libffi_3.0.9.bb
index 0ea2284..fae1adb 100644
--- a/meta/recipes-gnome/libffi/libffi_3.0.9.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.0.9.bb
@@ -7,7 +7,7 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "1f300a7a7f975d4046f51c3022fa5ff1"
 SRC_URI[sha256sum] = "589d25152318bc780cd8919b14670793f4971d9838dab46ed38c32b3ee92c452"
@@ -16,4 +16,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa09cb778aaba64dc9eac37ab7e4e5d8"
 inherit autotools
 
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.2



