Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVWzr-0002m1-7r
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:21:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 15:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81082406"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:14:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:14:54 -0800
Message-Id: <905a66b257f64ed1734213112594afc35b0c7fc1.1322608290.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322608290.git.josh@linux.intel.com>
References: <cover.1322608290.git.josh@linux.intel.com>
In-Reply-To: <cover.1322608290.git.josh@linux.intel.com>
References: <cover.1322608290.git.josh@linux.intel.com>
Subject: [PATCH 3/4] clutter-1.8: package examples
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
X-List-Received-Date: Tue, 29 Nov 2011 23:21:55 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
index efafbc2..f746bde 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
@@ -1,6 +1,7 @@
 require recipes-graphics/clutter/clutter.inc
+require recipes-graphics/clutter/clutter-package.inc
 
-PR = "r2"
+PR = "r3"
 
 # Internal json-glib was removed in Clutter 1.5.2
 STDDEPENDS += "json-glib cogl atk"
-- 
1.7.7.3



