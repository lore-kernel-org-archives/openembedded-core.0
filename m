Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB5571957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:30:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Oct 2016 01:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="1068367614"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2016 01:30:08 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 11:30:02 +0300
Message-Id: <87adb221390d116bcd9d13cd8efc0d0b22a40b89.1476087291.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
References: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1476087291.git.jussi.kukkonen@intel.com>
References: <cover.1476087291.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] flex: Update upstream check uri
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
X-List-Received-Date: Mon, 10 Oct 2016 08:30:32 -0000

Flex has moved to github, update UPSTREAM_CHECK_URI.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index db2cf1c..3a45752 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -21,6 +21,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
 SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
 
+# Flex has moved to github from 2.6.1 onwards
+UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
 UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext texinfo ptest
-- 
2.1.4


