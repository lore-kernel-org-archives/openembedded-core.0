Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 561896B991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 07:13:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2013 00:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,983,1371106800"; d="scan'208";a="365760188"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 26 Sep 2013 00:13:38 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 10:15:36 +0300
Message-Id: <8f927094eab79b6a8e6ec5505e40331b5d5384f6.1380179531.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380179531.git.cristian.iorga@intel.com>
References: <cover.1380179531.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1380179531.git.cristian.iorga@intel.com>
References: <cover.1380179531.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] builder: register text files with leafpad
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
X-List-Received-Date: Thu, 26 Sep 2013 07:13:37 -0000

Log files will open in leafpad under Build Appliance.

Part of [YOCTO #4727] fix.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/files/builder_hob_start.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index be3f911..42c93dd 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -22,6 +22,9 @@ if [ ! -d /home/builder/.local/share/applications ]; then
     xdg-mime default midori.desktop x-scheme-handler/http
     xdg-mime default midori.desktop x-scheme-handler/https
     xdg-mime default midori.desktop text/html
+
+    #register text files with leafpad text editor
+    xdg-mime default leafpad.desktop text/plain
 fi
 
 cd /home/builder/poky
-- 
1.8.1.2


