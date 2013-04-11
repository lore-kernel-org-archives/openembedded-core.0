Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UQHRA-0003Xd-D1
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:21:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2013 06:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,455,1363158000"; d="scan'208";a="293462648"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2013 06:03:44 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 16:03:43 +0300
Message-Id: <1365685423-27713-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: martin.jansa@gmail.com
Subject: [PATCH] opkg.inc: don't hardcode /var/lib/opkg
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
X-List-Received-Date: Thu, 11 Apr 2013 13:21:18 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/opkg/opkg.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index ff26b04..14b50ce 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -62,7 +62,7 @@ REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG}
 
 pkg_postinst_${PN} () {
 #!/bin/sh
-if [ "x$D" != "x" ] && [ -f $D/var/lib/opkg/status ]; then
+if [ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
 	install -d $D${sysconfdir}/rcS.d
 
 	# this happens at S98 where our good 'ole packages script used to run
-- 
1.7.9.5



