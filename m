Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B23496AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:40:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 06:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385466308"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 06:40:35 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 16:42:19 +0300
Message-Id: <59c13c72ca52e5e6a8302b499cff9c2950f32d19.1377264698.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377264698.git.cristian.iorga@intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
Subject: [PATCH v3 4/4] recipes-graphics/builder: fix wrong user name
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
X-List-Received-Date: Fri, 23 Aug 2013 13:40:49 -0000

Fix wrong inclusion of local username.
The right "builder" user is now used in
builder_hob_start shell script.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/files/builder_hob_start.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index b3a0540..bef6878 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -13,7 +13,7 @@ export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy
 pcmanfm -d&
 
 #register folders to open with PCManFM filemanager
-if [ ! -d /home/ubik/tmp/.local/share/applications ]; then
+if [ ! -d /home/builder/.local/share/applications ]; then
     mkdir -p /home/builder/.local/share/applications/
     xdg-mime default pcmanfm.desktop inode/directory
 fi
-- 
1.8.1.2


