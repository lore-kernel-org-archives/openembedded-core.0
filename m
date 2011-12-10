Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZQSj-00033O-Ni
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 18:11:49 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2011 09:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="85774001"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.144])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2011 09:03:51 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Dec 2011 09:03:48 -0800
Message-Id: <ec285d5f7ed5fde668744bb167d70e5409ee4f1d.1323536396.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1323536396.git.elizabeth.flanagan@intel.com>
References: <cover.1323536396.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] [YOCTO #1819] license: PR bump failure
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
X-List-Received-Date: Sat, 10 Dec 2011 17:11:50 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This addtask for do_populate_lic should be reverted back
to before do_package as before do_compile causes failures
when recipes are updated.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4689aaf..dd5d1bc 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -6,7 +6,7 @@
 LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"
 
-addtask populate_lic after do_patch before do_compile
+addtask populate_lic after do_patch before do_package
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
-- 
1.7.1



