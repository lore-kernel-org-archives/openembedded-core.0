Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 20EA27FFAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:07:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 22:07:21 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220205131"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 22:07:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:07:14 +0800
Message-Id: <20200122060714.13436-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] libva-utils: fix upstream status check
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
X-List-Received-Date: Wed, 22 Jan 2020 06:07:20 -0000
Content-Transfer-Encoding: 8bit

Match only the versions with numbers and skip the ones like 2.6.0.pre1.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/libva/libva-utils_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
index 0037fdfd85..e06472d692 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch"
 SRCREV = "8ea1eba433dcbceb0e5dcb54b8e3f984987f7a17"
 S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.\d+)"
 
 DEPENDS = "libva"
 
-- 
2.21.1


