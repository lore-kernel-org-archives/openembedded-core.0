Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd79-00066S-UA
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 20:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="78820624"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2011 20:22:09 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:41 +0800
Message-Id: <795bd695c6bb5c87032e943dd68a2d9cc9154153.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 02/11] libsndfile1: upgrade to version 1.0.25
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:16 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...libsndfile1_1.0.24.bb => libsndfile1_1.0.25.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.24.bb => libsndfile1_1.0.25.bb} (79%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
similarity index 79%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index 7b8bcae..bbe2f1d 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -4,12 +4,12 @@ AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "sqlite3"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8f823c30c1d8d44830db6ab845d6679e"
-SRC_URI[sha256sum] = "b6050e6fbfbb72c8bfbc895104697a4af1d49077a64e4846e0be7af87c9e56a4"
+SRC_URI[md5sum] = "e2b7bb637e01022c7d20f95f9c3990a2"
+SRC_URI[sha256sum] = "59016dbd326abe7e2366ded5c344c853829bebfd1702ef26a07ef662d6aa4882"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
1.7.1



