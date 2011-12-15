Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RbKs5-0005Ea-BK
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 00:37:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87086690"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.105])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 15:30:42 -0800
Message-Id: <fcb48b7e581dc934a8e43428216249fd5893d15d.1323991540.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
Subject: [PATCH 09/10] matchbox-desktop: clarify LICENSE is GPL-2.0+
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
X-List-Received-Date: Thu, 15 Dec 2011 23:37:54 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |    2 +-
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
index 0a02bb9..d633040 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Matchbox Window Manager Desktop"
-LICENSE = "GPL"
+LICENSE = "GPL-2.0+"
 DEPENDS = "libmatchbox startup-notification"
 SECTION = "x11/wm"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
index 2943e4d..f1dde66 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Matchbox Window Manager Desktop"
-LICENSE = "GPL"
+LICENSE = "GPL-2.0+"
 DEPENDS = "gtk+ startup-notification"
 SECTION = "x11/wm"
 PR = "r2"
-- 
1.7.7.4



