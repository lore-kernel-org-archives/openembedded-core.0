Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrQ-0004vA-O0
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212237"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:18 -0800
Message-Id: <ab2b5464de87998a16ef5b9573b16798ef80c580.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 13/21] libtool: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index a8ea0ae..d55b2bd 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
@@ -34,10 +34,11 @@ EXTRA_AUTORECONF = "--exclude=libtoolize"
 
 DEPENDS = "libtool-native"
 
-PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
+PACKAGES =+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
 FILES_${PN} += "${datadir}/aclocal*"
-FILES_libltdl = "${libdir}/libltdl.so.*"
-FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h ${includedir}/libltdl/*.h"
+FILES_libltdl = "${libdir}/libltdl${SOLIBS}
+FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
+FILES_libltdl-staticdev = "${libdir}/libltdl.a"
 FILES_libltdl-dbg = "${libdir}/.debug/"
 
 EXTRA_OECONF = "--with-sysroot"
-- 
1.7.6.5



