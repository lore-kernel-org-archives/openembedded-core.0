Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2A07575906
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 13:24:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jun 2015 06:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="744929069"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2015 06:24:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 16:24:47 +0300
Message-Id: <c8fee04fc201beed928d5925ea7762b3eb2da783.1434028277.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <bb62c4c42bf4e34d21678cb7a84f453b93c4fb5a.1434028277.git.jussi.kukkonen@intel.com>
References: <bb62c4c42bf4e34d21678cb7a84f453b93c4fb5a.1434028277.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434028277.git.jussi.kukkonen@intel.com>
References: <cover.1434028277.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] matchbox-session-sato: set GTK_CSD env var
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
X-List-Received-Date: Thu, 11 Jun 2015 13:24:25 -0000

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


