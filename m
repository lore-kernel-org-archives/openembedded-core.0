Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A81CB6ACE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 19:21:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 12:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,426,1406617200"; d="scan'208";a="583594549"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2014 12:21:11 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 22:21:06 +0300
Message-Id: <1409340066-19390-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libtirpc: upgrade to 0.2.5
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
X-List-Received-Date: Fri, 29 Aug 2014 19:21:13 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libtirpc/{libtirpc_0.2.4.bb => libtirpc_0.2.5.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.4.bb => libtirpc_0.2.5.bb} (82%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
similarity index 82%
rename from meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
rename to meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
index 88e2d82..3edf002 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb
@@ -10,15 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 DEPENDS += "xz-native"
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2;name=libtirpc \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-0.2.1-fortify.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
 
-SRC_URI[libtirpc.md5sum] = "847995e8d002cbf1387bda05947be086"
-SRC_URI[libtirpc.sha256sum] = "45c3e21dfc23a5ba501f9dfc6671678316fdfdb8355a1ec404ae2aa2f81943a1"
+SRC_URI[libtirpc.md5sum] = "8cd41a5ef5a9b50d0fb6abb98af15368"
+SRC_URI[libtirpc.sha256sum] = "62f9de7c2c8686c568757730e1fef66502a0e00d6cacf33546d0267984e002db"
 SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
 SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
 
-- 
1.9.1


