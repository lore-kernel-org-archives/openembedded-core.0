Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKRlf-00043H-1H
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 12:05:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2012 02:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132312361"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.88])
	by azsmga001.ch.intel.com with ESMTP; 18 Apr 2012 02:56:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 10:56:10 +0100
Message-Id: <1b97cb1f9c2a8b46cb97b68364bcdcbbd89c6056.1334742865.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334742865.git.paul.eggleton@linux.intel.com>
References: <cover.1334742865.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334742865.git.paul.eggleton@linux.intel.com>
References: <cover.1334742865.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/sanity: import regular expression module in SuSE distro check
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
X-List-Received-Date: Wed, 18 Apr 2012 10:05:43 -0000

We call re.sub here, so we need to "import re" or an error occurs
(tested on OpenSuSE 12.1).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3ec449c..9cd04c4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -124,6 +124,7 @@ def check_supported_distro(e):
         finally:
             f.close()
     elif os.path.exists("/etc/SuSE-release"):
+        import re
         f = open("/etc/SuSE-release", "r")
         try:
             distro = f.readline()
-- 
1.7.5.4



