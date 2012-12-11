Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TiQYE-00051h-9e
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 15:11:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2012 05:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,259,1355126400"; d="scan'208";a="232226625"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2012 05:55:35 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 15:55:54 +0200
Message-Id: <1355234154-11495-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] build-appliance: provides git proxified acces
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
X-List-Received-Date: Tue, 11 Dec 2012 14:11:18 -0000

Inside Build Appliance, external repos can be
accesed using the git protocol through a proxy

Fixes [YOCTO #3175]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/files/builder_hob_start.sh |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index 883535b..1c6884e 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -7,6 +7,7 @@
 export PSEUDO_PREFIX=/usr
 export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo
 export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
+export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy-socks-command
 
 cd /home/builder/poky
 . ./oe-init-build-env
-- 
1.7.10.4



