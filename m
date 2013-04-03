Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UNQEh-0005Y9-71
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:08:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 08:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288834128"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 08:51:17 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 18:51:16 +0300
Message-Id: <1365004276-20197-3-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365004276-20197-1-git-send-email-radu.moisan@intel.com>
References: <1365004276-20197-1-git-send-email-radu.moisan@intel.com>
Subject: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Wed, 03 Apr 2013 16:08:41 -0000

Use base_libdir in place of hardcoded /lib

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/udev/udev.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index e358d2d..6fd0240 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -76,6 +76,7 @@ FILES_udev-utils = "${bindir}/udevadm"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
+	sed -i 's@/lib/udev@${base_libdir}/udev@g' ${WORKDIR}/init
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
 
-- 
1.7.9.5



