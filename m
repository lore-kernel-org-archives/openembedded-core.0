Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSD4-0001ZS-QS
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:32:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753244"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:27:52 -0700
Message-Id: <21bf93c41982bddfe520483be9b66fd94a8ad2bb.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 05/50] libpng: upgrade to v1.2.46
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
X-List-Received-Date: Wed, 20 Jul 2011 08:32:52 -0000
X-List-Received-Date: Wed, 20 Jul 2011 08:32:52 -0000

From: Scott Garman <scott.a.garman@intel.com>

This addresses the following security advisories:

* CVE-2011-2690
* CVE-2011-2692

This fixes bug [YOCTO #1255]

The LICENSE and png.h checksum changes were due to trivial changes
in the files.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb}  |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb} (55%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.44.bb b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
similarity index 55%
rename from meta/recipes-multimedia/libpng/libpng_1.2.44.bb
rename to meta/recipes-multimedia/libpng/libpng_1.2.46.bb
index d81a5c1..57d9037 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.44.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
@@ -1,16 +1,17 @@
+SUMMARY = "PNG Library"
 DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a294a2bb08b7f25558119edbfd6b2e92 \
-                    file://png.h;startline=172;endline=261;md5=3253923f0093658f470e52a06ddcf4e7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=21b4b6e3523afa9f03f00b43b991dad0 \
+                    file://png.h;startline=172;endline=261;md5=996460063a9bf2de35b2d61d2776dabc"
 DEPENDS = "zlib"
 PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/libpng-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e3ac7879d62ad166a6f0c7441390d12b"
-SRC_URI[sha256sum] = "b9ab20f1c2c3bf6c4448fd9bd8a4a8905b918114d5fada56c97bb758a17b7215"
+SRC_URI[md5sum] = "e8b43dc78ef95b3949af7f961d76874b"
+SRC_URI[sha256sum] = "a5e796e1802b2e221498bda09ff9850bc7ec9068b6788948cc2c42af213914d8"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.3.4



