Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6BD782CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 14:56:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 06:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,440,1511856000"; d="scan'208";a="14851430"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 31 Jan 2018 06:56:58 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3F0715801AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 06:56:58 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 16:58:57 +0200
Message-Id: <1517410738-11104-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1517410738-11104-1-git-send-email-maxin.john@intel.com>
References: <1517410738-11104-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] assimp: upgrade to version 4.1.0
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
X-List-Received-Date: Wed, 31 Jan 2018 14:56:57 -0000

4.0.1 -> 4.1.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/vulkan/{assimp_4.0.1.bb => assimp_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{assimp_4.0.1.bb => assimp_4.1.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/assimp_4.0.1.bb b/meta/recipes-graphics/vulkan/assimp_4.1.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/assimp_4.0.1.bb
rename to meta/recipes-graphics/vulkan/assimp_4.1.0.bb
index 75ce0d6..194cbe3 100644
--- a/meta/recipes-graphics/vulkan/assimp_4.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_4.1.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 SRC_URI = "git://github.com/assimp/assimp.git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "eb8639d7c8a056d1c1b1cd42598c84ba3974c41b"
+SRCREV = "80799bdbf90ce626475635815ee18537718a05b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.4.0


