Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11T-00027z-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520396"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:51 -0700
Message-Id: <b59d5d0db40212ed27c4d888bfb75299819e3227.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 33/39] grub: Clean up FILES_* after PACKAGES reoder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/grub/grub_0.97.bb |    5 +----
 meta/recipes-bsp/grub/grub_1.99.bb |    4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 1cde30d..da72c7a 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
                     file://grub/main.c;beginline=3;endline=9;md5=22a5f28d2130fff9f2a17ed54be90ed6"
 
 RDEPENDS_${PN} = "diffutils"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
             file://no-reorder-functions.patch \
@@ -34,6 +34,3 @@ do_install_append_vmware() {
 	mkdir -p ${D}/boot/
 	ln -sf ../usr/lib/grub/{$TARGET_ARCH}{$TARGET_VENDOR}/ ${D}/boot/grub
 }
-
-FILES_${PN}-doc = "${datadir}"
-FILES_${PN} = "/boot /usr"
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 882f21d..0d49f23 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
@@ -44,6 +44,4 @@ do_install_append () {
     install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
 }
 
-FILES_${PN}-doc = "${datadir}"
-FILES_${PN} = "/usr /etc"
 INSANE_SKIP_${PN} = "arch"
-- 
1.7.7.6



