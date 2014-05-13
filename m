Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2649E605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531050108"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:01:02 +0100
Message-Id: <a502f603dd819115614663739a701c34b3c205fe.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] nfs-utils: upgrade to 1.3.0
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
X-List-Received-Date: Tue, 13 May 2014 11:02:43 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../nfs-utils/{nfs-utils_1.2.9.bb => nfs-utils_1.3.0.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.9.bb => nfs-utils_1.3.0.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 4f287f4..73cfa6b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "The nfs-utils package provides a daemon for the kernel \
 NFS server and related tools."
 HOMEPAGE = "http://nfs.sourceforge.net/"
 SECTION = "console/network"
-PR = "r1"
 
 LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
@@ -20,7 +19,7 @@ USERADD_PACKAGES = "${PN}-client"
 USERADD_PARAM_${PN}-client = "--system  --home-dir /var/lib/nfs \
 			      --shell /bin/false --user-group rpcuser"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
            file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
@@ -31,8 +30,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.b
            file://nfs-mountd.service \
            file://nfs-statd.service "
 
-SRC_URI[md5sum] = "18869d16db3f49c053f8c68eba3fe2e0"
-SRC_URI[sha256sum] = "90b76d5692a520b74273e607a4fd69df4cc35f65e242e22e2bc61b58759722f3"
+SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
+SRC_URI[sha256sum] = "ab8384d0e487ed6a18c5380d5df28015f7dd98680bf08f3247c97d9f7d99e56f"
 
 PARALLEL_MAKE = ""
 
-- 
1.9.0


