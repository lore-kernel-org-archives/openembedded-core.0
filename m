Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVz3G-0005fF-5n
	for openembedded-core@openembedded.org; Thu, 01 Dec 2011 06:19:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 21:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81604968"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 21:12:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 21:12:32 -0800
Message-Id: <9e787323af071377eea1ba1c7ccd7f14df8fc358.1322716218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322716218.git.sgw@linux.intel.com>
References: <cover.1322716218.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322716218.git.sgw@linux.intel.com>
References: <cover.1322716218.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] libffi: Update to 3.0.10
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
X-List-Received-Date: Thu, 01 Dec 2011 05:19:18 -0000

 * Update License Checksum due to Date change
 * Added --disable-builddir because of configure using
   $0 with full path and a ../$0

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libffi/{libffi_3.0.9.bb => libffi_3.0.10.bb}   |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/libffi/{libffi_3.0.9.bb => libffi_3.0.10.bb} (77%)

diff --git a/meta/recipes-gnome/libffi/libffi_3.0.9.bb b/meta/recipes-gnome/libffi/libffi_3.0.10.bb
similarity index 77%
rename from meta/recipes-gnome/libffi/libffi_3.0.9.bb
rename to meta/recipes-gnome/libffi/libffi_3.0.10.bb
index fae1adb..c06b80c 100644
--- a/meta/recipes-gnome/libffi/libffi_3.0.9.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.0.10.bb
@@ -5,15 +5,21 @@ time. FFI stands for Foreign Function Interface.  A foreign function interface i
 interface that allows code written in one language to call code written in another language.  The `libffi' \
 library really only provides the lowest, machine dependent layer of a fully featured foreign function interface.  \
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0caa055e49a3fb6c57780595e995e2ab"
+
+PR = "r0"
+
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
 
-PR = "r2"
+SRC_URI[md5sum] = "79390673f5d07a8fb342bc09b5055b6f"
+SRC_URI[sha256sum] = "f01eb9027e9eb56aeaeef636649877756d475d714ef8b47f627f65bc5f3b492f"
+
+EXTRA_OECONF += "--disable-builddir"
 
-SRC_URI[md5sum] = "1f300a7a7f975d4046f51c3022fa5ff1"
-SRC_URI[sha256sum] = "589d25152318bc780cd8919b14670793f4971d9838dab46ed38c32b3ee92c452"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa09cb778aaba64dc9eac37ab7e4e5d8"
 inherit autotools
 
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.4



