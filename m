Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEp-00068K-DL
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2011 18:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="436235873"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2011 18:32:29 -0700
Message-Id: <eea34bac4cc08ef2dfdc41353d860993bfaa23f8.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 11:39:04 -0700
Date: Sat, 14 May 2011 18:32:29 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 12/15] conf/bitbake.conf: Add MACHINEOVERRIDES variable
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
X-List-Received-Date: Sun, 15 May 2011 01:35:22 -0000

From: Khem Raj <raj.khem@gmail.com>

By defualt it points to $MACHINE but sometimes its desired
to have more than one overrides stemming out of a machine
then they can be added to MACHINEOVERRIDES.

e.g. MACHINEOVERRIDES = "${MACHINE}:nslu2"

Note that if you redefine MACHINEOVERRIDES then default
override for machine has to be added to it explicitly
otherwise it will get lost.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 418a15d..a3bf7c9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -606,8 +606,9 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINE}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
+OVERRIDES = "local:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
 DISTROOVERRIDES ?= "${DISTRO}"
+MACHINEOVERRIDES ?= "${MACHINE}"
 
 CPU_FEATURES ?= ""
 CPU_FEATURES_arm ?= "vfp"
-- 
1.7.1.1



