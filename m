Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XF-0007yn-0V
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168882"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:05 -0800
Message-Id: <9fd8cef147747da7496ac1e5999564e9e6b67db4.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] netbase: fix QA Warnings
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
X-List-Received-Date: Thu, 01 Mar 2012 07:34:45 -0000

WARNING: For recipe netbase, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/sbin
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/netbase/netbase_4.47.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_4.47.bb
index 3aa4915..a1462f8 100644
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ b/meta/recipes-core/netbase/netbase_4.47.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r0"
+PR = "r1"
 
 inherit update-rc.d
 
@@ -22,7 +22,6 @@ SRC_URI[sha256sum] = "a7e6525c9a09b00eff3395d09739b3c70a18bff8d13f7daa21fdf81989
 
 do_install () {
 	install -d ${D}${sysconfdir}/init.d \
-		   ${D}${sbindir} \
 		   ${D}${mandir}/man8 \
 		   ${D}${sysconfdir}/network/if-pre-up.d \
 		   ${D}${sysconfdir}/network/if-up.d \
-- 
1.7.7.6



