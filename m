Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EDF1071212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:26:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 08:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="473835160"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.242])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2014 08:26:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 08:26:27 -0700
Message-Id: <99efd7c41032201e6926bc30dd6d99b368e76599.1409325858.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
Subject: [PATCH 1/5] less: Upgrade to 466
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
X-List-Received-Date: Fri, 29 Aug 2014 15:26:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/less/{less_458.bb => less_466.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_458.bb => less_466.bb} (88%)

diff --git a/meta/recipes-extended/less/less_458.bb b/meta/recipes-extended/less/less_466.bb
similarity index 88%
rename from meta/recipes-extended/less/less_458.bb
rename to meta/recipes-extended/less/less_466.bb
index 3e4518a..c5b8a3f 100644
--- a/meta/recipes-extended/less/less_458.bb
+++ b/meta/recipes-extended/less/less_466.bb
@@ -26,8 +26,8 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "935b38aa2e73c888c210dedf8fd94f49"
-SRC_URI[sha256sum] = "e536c7819ede54b3d487f0ffc4c14b3620bed83734d92a81e89f62346db0fcac"
+SRC_URI[md5sum] = "7bc444bdb751bcf80ed0c39c17b4fcf4"
+SRC_URI[sha256sum] = "8305f5a06764ff094ed3428f94f29059541e2483eae201991f90823da6557212"
 
 inherit autotools update-alternatives
 
-- 
1.8.3.1


