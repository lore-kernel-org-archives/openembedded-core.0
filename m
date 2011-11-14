Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFy-0002D5-AI
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055134"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:03 -0800
Message-Id: <23365692ef8f8b53e832ffa34b6a25ff4634cda9.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/21] util-linux: add missing u-a calls for setsid chrt
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:56 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* someone added them to usrbinprogs_a, but without u-a calls added
* similar problem is with chfn chsh newgrp, but those are not built in
  current version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3b80736..855a545 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -191,6 +191,8 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 100
 	update-alternatives --install ${bindir}/renice renice renice.${PN} 100
 	update-alternatives --install ${bindir}/wall wall wall.${PN} 100
+	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
+	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
 	update-alternatives --install ${bindir}/flock flock flock.${PN} 100
 	
 	# There seems to be problem, atleast on nslu2, with these, untill they are
@@ -221,6 +223,8 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove mesg mesg.${PN}
 	update-alternatives --remove renice renice.${PN}
 	update-alternatives --remove wall wall.${PN}
+	update-alternatives --remove setsid setsid.${PN}
+	update-alternatives --remove chrt chrt.${PN}
 	update-alternatives --remove flock flock.${PN}
 }
 
-- 
1.7.6.4



