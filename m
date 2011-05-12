Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThC-0000rF-Q9
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860858"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:49 -0700
Message-Id: <2179e5133efe2572726b41384893dc820645ad56.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:43:52 +0800
Date: Thu, 12 May 2011 19:01:46 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 47/54] claws-mail: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-sato/claws-mail/files/desktop.patch    |    2 ++
 .../recipes-sato/claws-mail/files/fix-build.patch  |    2 ++
 .../claws-mail/files/owl-window-menu.patch         |    2 ++
 .../claws-mail/files/streamline-ui.patch           |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch b/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
index c5ed7a9..d5ca3db 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: claws-mail-2.9.1/claws-mail.desktop
 ===================================================================
 --- claws-mail-2.9.1.orig/claws-mail.desktop	2007-04-24 17:40:20.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch b/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
index 2f30899..41ca1d6 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Remove duplicate file entries as this breaks install with new Automake
 
 JL 19/03/10
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch b/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
index 54c6166..97807b2 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: claws-mail-2.9.1/src/addressbook.c
 ===================================================================
 --- claws-mail-2.9.1.orig/src/addressbook.c	2007-04-25 10:18:13.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch b/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
index 29a52ff..81a2a6b 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: claws-mail-2.9.1/src/mainwindow.c
 ===================================================================
 --- claws-mail-2.9.1.orig/src/mainwindow.c	2007-04-25 07:40:10.000000000 +0100
-- 
1.7.1



