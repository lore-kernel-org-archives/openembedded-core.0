Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A904660111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:46:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 16 Nov 2016 13:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; 
   d="scan'208";a="5242152"
Received: from fsantes-mobl2.amr.corp.intel.com (HELO
	jalamego-MOBL2.zpn.intel.com) ([10.219.5.141])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2016 13:46:03 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:45:57 -0600
Message-Id: <1479332757-14496-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] maintainers: Change maintainers for python(3) modules
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
X-List-Received-Date: Wed, 16 Nov 2016 21:46:03 -0000

Some packages with recipes for both python2 and python3
must be upgraded simultaneously to avoid version conflicts
due to common dependencies.
This change distributes responsibilities to provide
a single maintainer for related recipes.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta-poky/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-poky/conf/distro/include/maintainers.inc b/meta-poky/conf/distro/include/maintainers.inc
index 54410aa..cdf5c72 100644
--- a/meta-poky/conf/distro/include/maintainers.inc
+++ b/meta-poky/conf/distro/include/maintainers.inc
@@ -624,7 +624,7 @@ RECIPE_MAINTAINER_pn-python-imaging = "Jose Lamego <jose.a.lamego@linux.intel.co
 RECIPE_MAINTAINER_pn-python-mako = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-native = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-nose = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-numpy = "Jose Lamego <jose.a.lamego@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python-numpy = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-pexpect = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-ptyprocess = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-pycairo = "Jose Lamego <jose.a.lamego@linux.intel.com>"
@@ -633,7 +633,7 @@ RECIPE_MAINTAINER_pn-python-pygtk = "Jose Lamego <jose.a.lamego@linux.intel.com>
 RECIPE_MAINTAINER_pn-python-pyrex = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-scons = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-scons-native = "Jose Lamego <jose.a.lamego@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python-setuptools = "Jose Lamego <jose.a.lamego@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python-setuptools = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-six = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-smartpm = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python-smmap = "Jose Lamego <jose.a.lamego@linux.intel.com>"
@@ -642,9 +642,9 @@ RECIPE_MAINTAINER_pn-python3-async = "Edwin Plauchu <edwin.plauchu.camacho@linux
 RECIPE_MAINTAINER_pn-python3-dbus = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-distribute = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-git = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-git = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-mako = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-mako = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-native = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>"
-- 
1.9.1


