Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkd4-0001uf-S1
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 22:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; d="scan'208";a="642119061"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 22:06:44 -0700
Message-Id: <d7f3e91c15328440ffbf501c502098133fd34d3a.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 15:29:01 -0400
Date: Thu, 12 May 2011 22:06:44 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 6/8] kern-tools: error if features are not found
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
X-List-Received-Date: Fri, 13 May 2011 05:09:35 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Fixes bug: [YOCTO #955]

Updating the SRCREV to pickup the kern-tools change:

[
    updateme: error if features are not found

    Rather than silently dropping addon features, we emit a warning
    and then exit with a failure code. The caller can then abort a
    build and not simply miss features.

    Passing --no-strict to the script disables this new functionality
    if for some reason a feature description is missing on purpose.
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index c808e17..829d105 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "ab49d8e48b7e66d1b4f924385d65d062d25e44f7"
+SRCREV = "ecbdf3cdf6705a63dcb3c50bb24c311046f0b35c"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.1.1



