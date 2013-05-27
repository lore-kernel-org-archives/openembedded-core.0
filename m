Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B251D6A4B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 12:20:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2013 05:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,750,1363158000"; d="scan'208";a="320184263"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2013 05:20:09 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 15:19:53 +0300
Message-Id: <5d69e4526e0a774789000a04b44ed707991c25ee.1369657070.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
References: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
In-Reply-To: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
References: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
Subject: [PATCH 1/3] git: upgraded to 1.8.3
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
X-List-Received-Date: Mon, 27 May 2013 12:20:09 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/git/{git_1.8.2.2.bb => git_1.8.3.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.2.2.bb => git_1.8.3.bb} (67%)

diff --git a/meta/recipes-devtools/git/git_1.8.2.2.bb b/meta/recipes-devtools/git/git_1.8.3.bb
similarity index 67%
rename from meta/recipes-devtools/git/git_1.8.2.2.bb
rename to meta/recipes-devtools/git/git_1.8.3.bb
index 7fc2b29..0295919 100644
--- a/meta/recipes-devtools/git/git_1.8.2.2.bb
+++ b/meta/recipes-devtools/git/git_1.8.3.bb
@@ -1,8 +1,8 @@
 require git.inc
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "f7407df37facf579dcaa979266cc3c59"
-SRC_URI[sha256sum] = "020de38eda302bb6e1be460f7499211948193b306beab4e1a520ffc6f7294794"
+SRC_URI[md5sum] = "d91b6099fb6763cf92c696977a247060"
+SRC_URI[sha256sum] = "f1d3c6d683f8f15035a8d0f3eb30ed160ff6607111dfc6026d8836307aebc53a"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.10.4


