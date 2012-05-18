Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAe-0000XI-Vz
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583559"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:16 +0300
Message-Id: <c1e5ca99996b0139962a049aeac0b84ed81fc629.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 6/9] kern-tools: update LICENSE field to GPLv2
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
X-List-Received-Date: Fri, 18 May 2012 14:28:45 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The LICENSE field for kern-tools was generic and leads to QA warnings
from the license classs:

  "No generic license file exists for: GPL in any provider"

Updating to a specific GPL version that matches the source fixes the
warning.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index b5e203e..9ef1a20 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Scripts and utilities for managing Yocto branched kernels."
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d843f43d2e22b0d91a6fee"
 
 DEPENDS = "git-native guilt-native"
-- 
1.7.7.6



