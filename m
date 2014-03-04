Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 300796EAFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:51:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2014 14:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="492416794"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.227])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2014 14:51:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 14:50:58 -0800
Message-Id: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393973357.git.sgw@linux.intel.com>
References: <cover.1393973357.git.sgw@linux.intel.com>
Subject: [PATCH 1/6] util-linux: Update to 2.24.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Mar 2014 22:51:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc                  | 12 ++++++------
 .../{util-linux_2.23.2.bb => util-linux_2.24.1.bb}           |  7 +++----
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.23.2.bb => util-linux_2.24.1.bb} (79%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4c80bf2..51c982a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,22 +7,22 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=679af3e410ee112a5ec94de6501bf5c3 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
-                    file://libuuid/COPYING;md5=aa3ac5b4a5bcb707f714f78794011b80 \
-                    file://libmount/COPYING;md5=152f98bc301a5ea649769ede7203ac82 \
-                    file://libblkid/COPYING;md5=152f98bc301a5ea649769ede7203ac82"
+                    file://libuuid/COPYING;md5=b442ffb762cf8d3e9df1b99e0bb4af70 \
+                    file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
+                    file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
 inherit autotools gettext pkgconfig systemd
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            file://MCONFIG \
            file://defines.h \
            file://make_include \
@@ -39,7 +39,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-partx ${PN}-bash-completion"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
-                       --disable-makeinstall-chown --enable-elvtune \
+                       --disable-makeinstall-chown \
                        --enable-kill --enable-last --enable-mesg --enable-partx \
                        --enable-raw --enable-reset --disable-login \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
diff --git a/meta/recipes-core/util-linux/util-linux_2.23.2.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
similarity index 79%
rename from meta/recipes-core/util-linux/util-linux_2.23.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.24.1.bb
index f65932c..dd65566 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.23"
+MAJOR_VERSION = "2.24"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -10,12 +10,11 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
-            file://fix-configure.patch \
             ${OLDHOST} \
 "
 
-SRC_URI[md5sum] = "39a02ad0b3b37824c394f40930b7aa38"
-SRC_URI[sha256sum] = "6c5be3f7beec91b4893de14bbd722886fa2521be5bfa0fc079b749d0018633b1"
+SRC_URI[md5sum] = "88d46ae23ca599ac5af9cf96b531590f"
+SRC_URI[sha256sum] = "835eb6232cfab0118ef2e4fd649de0ba9f5bd1b8cbf9a7d4d84594541dec8410"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
-- 
1.8.3.1


