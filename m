Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 701B060851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 16:39:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Dec 2017 08:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; d="scan'208";a="16020439"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2017 08:39:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Dec 2017 18:40:31 +0200
Message-Id: <20171214164031.31051-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] selftest-ed: add a RECIPE_NO_UPDATE_REASON
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
X-List-Received-Date: Thu, 14 Dec 2017 16:39:47 -0000

This will avoid AUH looking at it, among other things.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
index 62931c404b0..8a2b565ce51 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
@@ -12,6 +12,7 @@ SECTION = "base"
 bindir = "${base_bindir}"
 
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+RECIPE_NO_UPDATE_REASON = "This recipe is used in selftest and shouldn't be updated otherwise"
 
 SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
 SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
-- 
2.15.0


