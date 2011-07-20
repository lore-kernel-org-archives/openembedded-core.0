Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QjSOF-0003zL-0X
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:44:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29757339"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:40:17 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 16:48:17 +0800
Message-Id: <7f38271cfc3e635e36fcd75ad79558266fd18326.1311151283.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1311151283.git.lei.mei@intel.com>
References: <cover.1311151283.git.lei.mei@intel.com>
In-Reply-To: <cover.1311151283.git.lei.mei@intel.com>
References: <cover.1311151283.git.lei.mei@intel.com>
Subject: [PATCH 1/2] lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
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
X-List-Received-Date: Wed, 20 Jul 2011 08:44:23 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/recipes-extended/lsb/lsbsetup_1.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
index 4295805..03f8012 100644
--- a/meta/recipes-extended/lsb/lsbsetup_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
@@ -14,7 +14,7 @@ do_install() {
     install -d ${D}/usr/bin
     install -d ${D}/${sysconfdir}
     install -m 0755 ${S}/LSB_Setup.sh ${D}/usr/bin
-    install -d  ${D}/usr/lib/lsb
+    install -d  ${D}/${libdir}/lsb
     ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
     ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
     ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
-- 
1.6.3.3



