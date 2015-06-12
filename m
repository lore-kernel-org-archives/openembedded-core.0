Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 052DD7599C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 13:11:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Jun 2015 06:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,602,1427785200"; d="scan'208";a="507220801"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2015 06:11:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jun 2015 16:11:42 +0300
Message-Id: <484fe68e4eec1a7d98d909869afbf3f775e9974e.1434114213.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
References: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434114213.git.jussi.kukkonen@intel.com>
References: <cover.1434114213.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 3/6] matchbox-session-sato: set GTK_CSD env var
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
X-List-Received-Date: Fri, 12 Jun 2015 13:11:52 -0000

Sato practically requires server side decorations as matchbox panel
draws on top of the title bar. Setting "GTK_CSD=0" informs GTK+3
that we really want server side decorations even for apps designed
for CSD.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-sato/matchbox-session-sato/session | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
index a3138b6..42ce483 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
@@ -14,6 +14,10 @@ else
     KEYBOARD_APPLET="keyboard"
 fi
 
+# Tell GTK+3 we really want server side decorations, even with
+# GtkHeaderBar using applications: Without that mb-panel will render
+# on top of the client side decorations.
+export GTK_CSD=0
 
 matchbox-desktop &
 
-- 
2.1.4


