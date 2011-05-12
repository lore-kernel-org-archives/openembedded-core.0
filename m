Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgr-0000Tg-AL
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737705"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:01:35 -0700
Message-Id: <0d73eea4d1c316b3f4eacf13ba72d1a60b812f83.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:19:09 +0800
Date: Thu, 12 May 2011 19:01:32 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 36/54] contacts: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:23 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../contacts/contacts-owl-window-menu.patch        |    2 ++
 meta/recipes-sato/pimlico/contacts/make-382.patch  |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch b/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
index 4b9238b..5323876 100644
--- a/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
+++ b/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: contacts-0.9/src/contacts-gtk.c
 ===================================================================
 --- contacts-0.9.orig/src/contacts-gtk.c	2008-06-06 12:56:08.000000000 +0100
diff --git a/meta/recipes-sato/pimlico/contacts/make-382.patch b/meta/recipes-sato/pimlico/contacts/make-382.patch
index f85d6b2..a7cfee3 100644
--- a/meta/recipes-sato/pimlico/contacts/make-382.patch
+++ b/meta/recipes-sato/pimlico/contacts/make-382.patch
@@ -2,6 +2,8 @@ Fix for stricter parser in make 3.82. This fix has been pushed to upstream git.
 
 JL - 15/12/10
 
+Upstream-Status: Accepted
+
 Index: git/Makefile.am
 ===================================================================
 --- git.orig/Makefile.am
-- 
1.7.1



