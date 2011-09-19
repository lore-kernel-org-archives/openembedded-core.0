Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R5mcP-00010E-Vn
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 00:47:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 15:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="50063495"
Received: from scimitar.jf.intel.com ([10.7.199.86])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2011 15:41:46 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 15:41:45 -0700
Message-Id: <705156e2812afb288632f01416fcbbf9add26bee.1316471892.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1316471892.git.josh@linux.intel.com>
References: <cover.1316471892.git.josh@linux.intel.com>
In-Reply-To: <cover.1316471892.git.josh@linux.intel.com>
References: <cover.1316471892.git.josh@linux.intel.com>
Subject: [PATCH 3/3] hob: enable package only builds even if an image has been built
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
X-List-Received-Date: Mon, 19 Sep 2011 22:47:18 -0000

Once an image build has been performed the selected_image variable would
prevent the package only build choice being triggered - by setting the
variable to None on reset we are able to perform package only builds after
an image build.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 lib/bb/ui/hob.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/lib/bb/ui/hob.py b/lib/bb/ui/hob.py
index 0f738ce..e696314 100644
--- a/lib/bb/ui/hob.py
+++ b/lib/bb/ui/hob.py
@@ -322,6 +322,7 @@ class MainWindow (gtk.Window):
         if response == gtk.RESPONSE_OK:
             self.reset_build()
             self.search.set_text("")
+            self.selected_image = None
         return
 
     def reset_build(self):
-- 
1.7.6.2



