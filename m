Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R5mcO-00010E-FW
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 00:47:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 15:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="50063493"
Received: from scimitar.jf.intel.com ([10.7.199.86])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2011 15:41:46 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 15:41:43 -0700
Message-Id: <bdbd724e806c9ca69cc1508bac7ec0a2dce95543.1316471892.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1316471892.git.josh@linux.intel.com>
References: <cover.1316471892.git.josh@linux.intel.com>
In-Reply-To: <cover.1316471892.git.josh@linux.intel.com>
References: <cover.1316471892.git.josh@linux.intel.com>
Subject: [PATCH 1/3] ui/crumbs/hobprefs: re-enable reloading of data after prefs changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2011 22:47:16 -0000

When disabling the toolchain w/ headers checkbox in an early commit I
accidentally disabled too much code. This re-enables adding the custom
response handler to the Preferences dialog which triggeres a reparse of
the metadata when appropriate preference changes are made.

Fixes [YOCTO #1479]

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 lib/bb/ui/crumbs/hobprefs.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/bb/ui/crumbs/hobprefs.py b/lib/bb/ui/crumbs/hobprefs.py
index 8d148cd..5dfb0e6 100644
--- a/lib/bb/ui/crumbs/hobprefs.py
+++ b/lib/bb/ui/crumbs/hobprefs.py
@@ -331,4 +331,4 @@ class HobPrefs(gtk.Dialog):
         # headerscheck.set_active(self.build_toolchain_headers)
         # headerscheck.connect("toggled", self.toggle_headers_cb)
         # hbox.pack_start(headerscheck, expand=False, fill=False, padding=6)
-        # self.connect("response", self.prefs_response_cb)
+        self.connect("response", self.prefs_response_cb)
-- 
1.7.6.2



