Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA3D6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064132"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:07 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:18 +0200
Message-Id: <9bcaaca63ff834e7236be5a56a31da5d197c39ed.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/20] dmidecode: update to 3.0
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:07 -0000

LICENSE is still GPLv2, with a different physical address for the FSF.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../dmidecode/{dmidecode_2.12.bb => dmidecode_3.0.bb}            | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_2.12.bb => dmidecode_3.0.bb} (59%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
similarity index 59%
rename from meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
index 4c16556..8e532ad 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "DMI (Desktop Management Interface) table related utilities"
 HOMEPAGE = "http://www.nongnu.org/dmidecode/"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.bz2"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
 
@@ -16,5 +16,6 @@ do_unpack_extra() {
 }
 addtask unpack_extra after do_unpack before do_patch
 
-SRC_URI[md5sum] = "a406f3cbb27736491698697beeddb781"
-SRC_URI[sha256sum] = "913ff3055d563a62a420789b8ee33b038de9afa18ea61254760ddf8ab87a5088"
+SRC_URI[md5sum] = "281ee572d45c78eca73a14834c495ffd"
+SRC_URI[sha256sum] = "7ec35bb193729c1d593a1460b59d82d24b89102ab23fd0416e6cf4325d077e45"
+
-- 
2.6.2


