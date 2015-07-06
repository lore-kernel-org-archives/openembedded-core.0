Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5169A75D96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 12:28:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2015 05:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,414,1432623600"; d="scan'208";a="741416768"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2015 05:28:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 15:28:58 +0300
Message-Id: <b166141f65cad6c7bdd1d17bdf414c057a89099f.1436184775.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a446be1baf28f8ba1d89f00c5b78e47a81a2ac11.1436184775.git.jussi.kukkonen@intel.com>
References: <a446be1baf28f8ba1d89f00c5b78e47a81a2ac11.1436184775.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1436184775.git.jussi.kukkonen@intel.com>
References: <cover.1436184775.git.jussi.kukkonen@intel.com>
Subject: [PATCH v4 5/7] matchbox-session-sato: set GTK_CSD env var
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
X-List-Received-Date: Mon, 06 Jul 2015 12:28:19 -0000

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


