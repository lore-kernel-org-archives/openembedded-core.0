Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QesVK-0000bn-N2
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 19:36:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2011 10:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,494,1304319600"; d="scan'208";a="23980099"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 10:32:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 18:32:48 +0100
Message-Id: <fb8c0dba84b1b0d8c1ac548e0379f25f6c1439f3.1310059749.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] kernel.bbclass: prevent QA warning about kernel-module-lirc-dev
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
X-List-Received-Date: Thu, 07 Jul 2011 17:36:47 -0000

kernel-module-lirc-dev is not a development package (it's a package for
a kernel module called lirc_dev) so add an INSANE_SKIP that will prevent
it from being flagged up.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 943252a..318f5c2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -503,3 +503,7 @@ PACKAGES =+ "perf-dbg perf"
 FILES_perf = "${bindir}/* \
               ${libexecdir}"
 FILES_perf-dbg = "${FILES_${PN}-dbg}"
+
+# We don't want a warning for kernel-module-lirc-dev
+INSANE_SKIP_kernel-module-ir-lirc-codec += "dev-deps"
+
-- 
1.7.4.1



