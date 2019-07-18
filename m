Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CB31C7EE59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:16:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2019 19:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169720371"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 19:16:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 10:16:04 +0800
Message-Id: <20190718021606.3560-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718021606.3560-1-anuj.mittal@intel.com>
References: <20190718021606.3560-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] bzip2: upgrade 1.0.7 -> 1.0.8
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
X-List-Received-Date: Thu, 18 Jul 2019 02:16:13 -0000
Content-Transfer-Encoding: 8bit

License-Update: Change in version and copyright year/date.

Changelog:
https://sourceware.org/git/?p=bzip2.git;a=blob;f=CHANGES

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bzip2/{bzip2_1.0.7.bb => bzip2_1.0.8.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/bzip2/{bzip2_1.0.7.bb => bzip2_1.0.8.bb} (85%)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.7.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
similarity index 85%
rename from meta/recipes-extended/bzip2/bzip2_1.0.7.bb
rename to meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 02e9d9ef07..73d933a002 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.7.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -5,15 +5,15 @@ LZ77/LZ78-based compressors, and approaches the performance of the PPM family of
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=39406315f540c69bd05b1531daedd2ae"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
            "
-SRC_URI[md5sum] = "1a6a61cc867be4f3d6549037a09bf13e"
-SRC_URI[sha256sum] = "e768a87c5b1a79511499beb41500bcc4caf203726fff46a6f5f9ad27fe08ab2b"
+SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
+SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
 
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.20.1


