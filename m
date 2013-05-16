Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Ucwsk-0007Pg-17
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 14:02:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2013 04:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,683,1363158000"; d="scan'208";a="335045107"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2013 04:43:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 14:44:39 +0300
Message-Id: <1368704679-3957-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-pygobject-native: fix build dependency on python-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 12:02:20 -0000

Override needed for native package because of
dependencies brought in by inheriting
distutils-base.bbclass.

Fixes [YOCTO #4502].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/python/python-pygobject_2.27.91.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index 4381107..3dc2d99 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 DEPENDS = "python python-pygobject-native glib-2.0"
-DEPENDS_class-native = "glib-2.0-native"
+DEPENDS_class-native = "python-native glib-2.0-native"
 RDEPENDS_class-native = ""
 PR = "r6"
 
-- 
1.7.10.4



