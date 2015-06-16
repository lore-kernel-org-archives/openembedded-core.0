Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47E0373C63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:22:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2015 07:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="744450001"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 07:22:30 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:22:56 +0300
Message-Id: <7caff07dc78b34099f3dcb5f5a76bd824ac6f36e.1434464336.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
References: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
Subject: [PATCH v3 4/6] matchbox-session-sato: set GTK_CSD env var
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
X-List-Received-Date: Tue, 16 Jun 2015 14:22:46 -0000

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


