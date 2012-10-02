Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TJBhI-0005GI-UK
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 01:16:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Oct 2012 16:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,525,1344236400"; d="scan'208";a="218648201"
Received: from envy.jf.intel.com ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 02 Oct 2012 16:03:16 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q92N1ik9023357; Tue, 2 Oct 2012 16:01:44 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q92N1iAX023356;
	Tue, 2 Oct 2012 16:01:44 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 16:01:42 -0700
Message-Id: <31141073add21ef176638e48bff752832901bb78.1349218820.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1349218820.git.elizabeth.flanagan@intel.com>
References: <cover.1349218820.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] bzip2 and busybox: Incorrect LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 23:16:17 -0000

The license for bzip2 is not quite BSD. I have an email out to the
maintainer to see if we can utilize a common BSD license (or something
else) however, for now, we should revert bzip2 back to a special
license.

As busybox also utilizes a lightly modified bzip2, this also
effects busybox.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-core/busybox/busybox.inc      |    3 +--
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 33e01a4..972e7d0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -5,8 +5,7 @@ BUGTRACKER = "https://bugs.busybox.net/"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
-# bzip2 is not a bzip2 license (no such thing)
-LICENSE = "GPLv2 & BSD-4-Clause"
+LICENSE = "GPLv2 & bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 
 SECTION = "base"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 5f92deb..d03b57d 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "http://www.bzip.org/"
 SECTION = "console/utils"
-LICENSE = "BSD-4-Clause"
+LICENSE = "bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
 PR = "r5"
 
-- 
1.7.5.4



