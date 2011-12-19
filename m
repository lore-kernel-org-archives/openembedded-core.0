Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RclWv-0001JE-Fh
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:17:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88245196"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.156])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 14:10:51 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 14:10:41 -0800
Message-Id: <5eabbc4f3acf5799d96350c265ae63e2c1bb9dd7.1324332440.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
In-Reply-To: <cover.1324332440.git.josh@linux.intel.com>
References: <cover.1324332440.git.josh@linux.intel.com>
Subject: [PATCH 03/10] apt: clarify LICENSE as GPLv2.0
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
X-List-Received-Date: Mon, 19 Dec 2011 22:17:57 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-devtools/apt/apt.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 9d3268d..6265203 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Advanced front-end for dpkg."
-LICENSE = "GPL"
+LICENSE = "GPLv2.0+"
 SECTION = "base"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
-- 
1.7.7.4



