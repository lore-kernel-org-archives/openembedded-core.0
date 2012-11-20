Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact3-0005Xs-S6
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596721"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:11 -0800
Message-Id: <008caf0a592ef2450669e911b48b4d507e8c3c6e.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 03/13] libksba: Update to 1.3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2012 01:44:30 -0000

Licensing files changes from 1 COPYING to be split.
The Code is marked LGPLv3 or GPLv2 or both in parallel

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libksba/libksba_1.2.0.bb |   14 --------------
 meta/recipes-support/libksba/libksba_1.3.0.bb |   18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.3.0.bb

diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
deleted file mode 100644
index dd8d88f..0000000
--- a/meta/recipes-support/libksba/libksba_1.2.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Libksba provides an easy API to create and parse X.509 and CMS related objects."
-HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-PR = "r1"
-
-DEPENDS = "libgpg-error"
-
-inherit autotools binconfig
-
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "e797f370b69b4dc776499d6a071ae137"
-SRC_URI[sha256sum] = "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f83e48d3e2a3c934b"
diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.0.bb
new file mode 100644
index 0000000..506d7c0
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba_1.3.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Libksba provides an easy API to create and parse X.509 and CMS related objects."
+HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
+LICENSE = "GPLv2+ | LGPLv3+ | GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
+                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                   "
+PR = "r0"
+
+DEPENDS = "libgpg-error"
+
+inherit autotools binconfig
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "cd86fad9c9d360b2cf80449f8a4a4075"
+SRC_URI[sha256sum] = "5a61eed50550d4d0dcb47457ce7b6a90f8e719d42a3b25f7e79333e8cd721971"
-- 
1.7.7.6



