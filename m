Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE0A4739A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:55:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 11:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="666024015"
Received: from pduzinki-mobl.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.10.191])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 11:55:30 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 20:55:25 +0200
Message-Id: <1426532125-1219-3-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426532125-1219-1-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1426532125-1219-1-git-send-email-tanu.kaskinen@linux.intel.com>
Subject: [PATCH 2/2] pulseaudio: add system.pa to CONFFILES
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
X-List-Received-Date: Mon, 16 Mar 2015 18:55:32 -0000

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 501dcfb..c307c27 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -113,6 +113,7 @@ CONFFILES_libpulse = "${sysconfdir}/pulse/client.conf"
 CONFFILES_pulseaudio-server = "\ 
   ${sysconfdir}/pulse/default.pa \
   ${sysconfdir}/pulse/daemon.conf \
+  ${sysconfdir}/pulse/system.pa \
   "
 
 pkg_postinst_${PN}-server() {
-- 
1.9.3


