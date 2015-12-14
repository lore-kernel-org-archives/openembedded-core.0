Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 55F466FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064239"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:28 +0200
Message-Id: <f757e904f778b3cae664349f690fb34752e067c7.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/20] nfs-utils: update to 1.3.3
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:17 -0000

ipv6 support now requires libtirpc, so un-disable and add it to dependencies.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.3.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.3.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
index 317ee85..2e0c8b1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
+DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3 libtirpc"
 RDEPENDS_${PN}-client = "rpcbind bash"
 RDEPENDS_${PN} = "${PN}-client bash"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
@@ -34,8 +34,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch \
 "
 
-SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
-SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
+SRC_URI[md5sum] = "cd6b568c2e9301cc3bfac09d87fbbc0b"
+SRC_URI[sha256sum] = "700d689c5622c87953c34102e5befafc4d3c811e676852238f0dd79c9c0c084d"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -59,7 +59,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --disable-nfsv41 \
                 --enable-uuid \
                 --disable-gss \
-                --disable-tirpc \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
                "
-- 
2.6.2


