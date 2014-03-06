Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D66F6DB40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 00:08:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 16:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,596,1389772800"; d="scan'208";a="486799283"
Received: from unknown (HELO swold-linux.myhome.westell.com) ([10.255.12.231])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2014 16:06:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 16:06:22 -0800
Message-Id: <1394064382-29376-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] gconf: remove depreated configure flag
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
X-List-Received-Date: Thu, 06 Mar 2014 00:08:32 -0000

[YOCTO #5905]
[YOCTO #5906]
[YOCTO #5907]
[YOCTO #5908]
[YOCTO #5909]
[YOCTO #5910]
[YOCTO #5911]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/gconf.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index e9076b2..0794ba7 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -10,7 +10,6 @@ export GCONF_BACKEND_DIR = "${STAGING_LIBDIR_NATIVE}/GConf/2"
 # Disable install-time schema registration as we're a packaging system so this
 # happens in the postinst script, not at install time.  Set both the configure
 # script option and the traditional envionment variable just to make sure.
-EXTRA_OECONF += "--disable-schemas-install"
 export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"
 
 gconf_postinst() {
-- 
1.8.3.1


