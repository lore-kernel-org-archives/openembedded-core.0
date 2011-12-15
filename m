Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RbKs2-0005Ea-SU
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 00:37:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87086684"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.105])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 15:30:45 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 15:30:36 -0800
Message-Id: <d39eedefe9ccd634c62a2b8d0065d808ea114b30.1323991540.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
Subject: [PATCH 03/10] apt: clarify LICENSE as GPL-2.0
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
X-List-Received-Date: Thu, 15 Dec 2011 23:37:51 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-devtools/apt/apt.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 9d3268d..32e7d2d 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Advanced front-end for dpkg."
-LICENSE = "GPL"
+LICENSE = "GPL-2.0"
 SECTION = "base"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
-- 
1.7.7.4



