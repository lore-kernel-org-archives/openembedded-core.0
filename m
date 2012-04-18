Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKRle-00043H-04
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 12:05:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2012 02:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132312359"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.88])
	by azsmga001.ch.intel.com with ESMTP; 18 Apr 2012 02:56:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 10:56:09 +0100
Message-Id: <8f64a6820985975bbc156d130c3b4f183ac9946b.1334742865.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334742865.git.paul.eggleton@linux.intel.com>
References: <cover.1334742865.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334742865.git.paul.eggleton@linux.intel.com>
References: <cover.1334742865.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/sanity: trim trailing newline when reading /etc/redhat-release
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
X-List-Received-Date: Wed, 18 Apr 2012 10:05:42 -0000

Any trailing whitespace needs to be stripped before comparing it to the
SANITY_TESTED_DISTROS list.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4d4abd3..3ec449c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -120,7 +120,7 @@ def check_supported_distro(e):
     if os.path.exists("/etc/redhat-release"):
         f = open("/etc/redhat-release", "r")
         try:
-            distro = f.readline()
+            distro = f.readline().strip()
         finally:
             f.close()
     elif os.path.exists("/etc/SuSE-release"):
-- 
1.7.5.4



