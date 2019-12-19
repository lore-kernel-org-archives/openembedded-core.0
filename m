Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC9C7FE11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:41:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:20 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="206089310"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:41:05 +0800
Message-Id: <4325449c737fd5be4e4af6f91328db9a6fc5b745.1576733575.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576733575.git.anuj.mittal@intel.com>
References: <cover.1576733575.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] libsolv: upgrade 0.7.8 -> 0.7.10
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
X-List-Received-Date: Thu, 19 Dec 2019 05:41:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsolv/{libsolv_0.7.8.bb => libsolv_0.7.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.8.bb => libsolv_0.7.10.bb} (93%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.8.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
similarity index 93%
rename from meta/recipes-extended/libsolv/libsolv_0.7.8.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index 8fe9ae0469..502f4e0e85 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.8.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "5205c5683ce2c8b8288534059ba40a318a2a161d"
+SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.21.0


