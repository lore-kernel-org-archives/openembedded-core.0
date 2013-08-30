Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB4C6BDAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:48:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2013 06:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="388846856"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2013 06:48:58 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 16:47:36 +0300
Message-Id: <742f7781de4a0cb7dfde19bdd788069dd259d1d8.1377434794.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377434794.git.mihai.prica@intel.com>
References: <cover.1377434794.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377434794.git.mihai.prica@intel.com>
References: <cover.1377434794.git.mihai.prica@intel.com>
Subject: [PATCH 2/2] builder: register html links and files with Midori
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
X-List-Received-Date: Fri, 30 Aug 2013 13:48:58 -0000

HTML files and links will open in a tab in Midori.

[YOCTO #3506]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../builder/files/builder_hob_start.sh             |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index bef6878..be3f911 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -12,10 +12,16 @@ export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy
 #start pcmanfm in daemon mode to allow asynchronous launch
 pcmanfm -d&
 
-#register folders to open with PCManFM filemanager
+#register handlers for some file types
 if [ ! -d /home/builder/.local/share/applications ]; then
     mkdir -p /home/builder/.local/share/applications/
+    #register folders to open with PCManFM filemanager
     xdg-mime default pcmanfm.desktop inode/directory
+
+    #register html links and files with Midori
+    xdg-mime default midori.desktop x-scheme-handler/http
+    xdg-mime default midori.desktop x-scheme-handler/https
+    xdg-mime default midori.desktop text/html
 fi
 
 cd /home/builder/poky
-- 
1.7.9.5


