Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPZfj-0003vw-Fi
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:37:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="315364317"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.195])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 07:19:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 15:19:18 +0100
Message-Id: <301724a6331eed125e08a88c0f795135e8cf134c.1365517068.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] classes/license: remove outdated comment
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
X-List-Received-Date: Tue, 09 Apr 2013 14:37:22 -0000

Package listing was implemented in the deb backend some time ago.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 170bdd9..76749c4 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -26,7 +26,6 @@ license_create_manifest() {
 	if [ -f ${LICENSE_MANIFEST} ]; then
 		rm ${LICENSE_MANIFEST}
 	fi
-	# list of installed packages is broken for deb
 	touch ${LICENSE_MANIFEST}
 	for pkg in ${INSTALLED_PKGS}; do
 		# not the best way to do this but licenses are not arch dependant iirc
-- 
1.7.10.4



