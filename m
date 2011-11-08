Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMF-0002iO-7l
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587141"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:47 -0800
Message-Id: <fb19df5b21e551c5dfdfa340438952560c5fa528.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/17] libarchive: update to 2.8.5
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:21 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Remove patch "0003-Patch-from-upstream-rev-2516.patch" because it has been merged
to source codes.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 ...rchive_2.8.4.yocto.1.bb => libarchive_2.8.5.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb => libarchive_2.8.5.bb} (76%)

diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
similarity index 76%
rename from meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
rename to meta/recipes-extended/libarchive/libarchive_2.8.5.bb
index 94d261b..1bc49e2 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
@@ -9,19 +9,19 @@ DEPENDS = "libxml2"
 
 # We need to repack the tarball due undistributable content on the upstream one.
 # More details at http://code.google.com/p/libarchive/issues/detail?id=162
-SRC_URI = "http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz \
+SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
            file://0001-Patch-from-upstream-revision-1990.patch \
            file://0002-Patch-from-upstream-revision-1991.patch \
-           file://0003-Patch-from-upstream-rev-2516.patch \
            file://0004-Patch-from-upstream-rev-2514.patch \
            file://0005-Patch-from-upstream-rev-2520.patch \
            file://0006-Patch-from-upstream-rev-2521.patch \
            file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
            "
 
-SRC_URI[md5sum] = "71242da5191f1218f13dd520d95a870e"
-SRC_URI[sha256sum] = "8cd55db11b1d6001ff8007e4d22b6f4a4bb215e70750e19ab44b84b99ab76053"
+SRC_URI[md5sum] = "9caf51dcf6213e9c9f5a1c27448b9c90"
+SRC_URI[sha256sum] = "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1f998093d5c32a72d"
 
 inherit autotools lib_package
 
 BBCLASSEXTEND = "nativesdk"
+
-- 
1.7.6.4



