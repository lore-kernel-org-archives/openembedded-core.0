Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D08F276980
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:12:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 12:12:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="782158019"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 12:12:30 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 22:13:58 +0300
Message-Id: <6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
References: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439318387.git.jussi.kukkonen@intel.com>
References: <cover.1439318387.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] nfs-utils: Upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Tue, 11 Aug 2015 19:12:31 -0000

Let "--enable-tirpc" be selected in configure by default: it is
a requirement for ipv6 support. This should not grow a typical
image size as libtirpc is a rpcbind dependency already.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
index 6da8509..59252c5 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
+DEPENDS = "libcap libnfsidmap libevent libtirpc util-linux sqlite3"
 RDEPENDS_${PN}-client = "rpcbind bash"
 RDEPENDS_${PN} = "${PN}-client bash"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
@@ -33,8 +33,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-debianize-start-statd.patch \
 "
 
-SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
-SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
+SRC_URI[md5sum] = "4cdffb2c7f7fd2bdceaba55ab1b881da"
+SRC_URI[sha256sum] = "2966bb431c06e9ba35a54f48f89db03a5132bc2d8ed8084ac8ccb34e25a9b739"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -58,7 +58,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --disable-nfsv41 \
                 --enable-uuid \
                 --disable-gss \
-                --disable-tirpc \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
                "
-- 
2.1.4


