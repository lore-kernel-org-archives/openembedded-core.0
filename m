Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RclWx-0001JL-W4
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:18:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88245202"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 14:10:47 -0800
Message-Id: <eca8d85dbd98e640eb7bd3595acd13131b882e1c.1324332440.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
Subject: [PATCH 09/10] matchbox-desktop: clarify LICENSE is GPLv2.0+
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
X-List-Received-Date: Mon, 19 Dec 2011 22:18:00 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |    2 +-
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
index 0a02bb9..43e10ca 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Matchbox Window Manager Desktop"
-LICENSE = "GPL"
+LICENSE = "GPLv2.0+"
 DEPENDS = "libmatchbox startup-notification"
 SECTION = "x11/wm"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
index 2943e4d..3e95bc1 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Matchbox Window Manager Desktop"
-LICENSE = "GPL"
+LICENSE = "GPLv2.0+"
 DEPENDS = "gtk+ startup-notification"
 SECTION = "x11/wm"
 PR = "r2"
-- 
1.7.7.4



