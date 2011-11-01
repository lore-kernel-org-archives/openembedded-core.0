Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLME6-0004AL-D0
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:50:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Nov 2011 14:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="69447604"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by azsmga001.ch.intel.com with ESMTP; 01 Nov 2011 14:44:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 14:44:20 -0700
Message-Id: <348a2f5a5980f1b04bc96099731224301673463e.1320183757.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320183757.git.sgw@linux.intel.com>
References: <cover.1320183757.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320183757.git.sgw@linux.intel.com>
References: <cover.1320183757.git.sgw@linux.intel.com>
Subject: [Pull v2 4/4] dbus: fix up ADDUSER_PARAMS
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
X-List-Received-Date: Tue, 01 Nov 2011 21:50:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5028310..caa781c 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -22,7 +22,8 @@ INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r netdev"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
-                       --no-create-home --user-group messagebus"
+                       --no-create-home --shell /bin/false \
+                       --user-group messagebus"
 
 CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
 
-- 
1.7.6.4



