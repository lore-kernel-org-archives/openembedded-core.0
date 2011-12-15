Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RbKs3-0005Es-Mb
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 00:37:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87086686"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.105])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 15:30:38 -0800
Message-Id: <4109f2838503acc390adc95ac571187d6f9abb10.1323991540.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
Subject: [PATCH 05/10] clutter: clarify LICENSE as LGPL-2.1
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
X-List-Received-Date: Thu, 15 Dec 2011 23:37:52 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
index 24cb30d..9e9c955 100644
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ b/meta/recipes-graphics/clutter/clutter.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Clutter graphics library"
 HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPL"
+LICENSE = "LGPL-2.1"
 
 # Internal json-glib was removed in Clutter 1.5.2, cogl was removed in 1.8, atk required since 1.8
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes libxi json-glib cogl atk"
-- 
1.7.7.4



