Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeEGU-0007iy-FM
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 01:15:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 16:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,188,1355126400"; d="scan'208";a="224515810"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 16:00:47 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 16:00:41 -0800
Message-Id: <1354233643-3385-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
References: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] sysvinit: Update ALTERNATIVES List for utmpdump
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
X-List-Received-Date: Fri, 30 Nov 2012 00:15:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 1647a0f..de073b8 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r8"
+PR = "r9"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
@@ -27,7 +27,7 @@ B = "${S}/src"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last mesg wall"
+ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last mesg utmpdump wall"
 
 ALTERNATIVE_PRIORITY = "200"
 
-- 
1.8.0



