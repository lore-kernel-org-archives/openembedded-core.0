Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RW2YA-0005pr-1V
	for openembedded-core@openembedded.org; Thu, 01 Dec 2011 10:03:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 00:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,277,1320652800"; d="scan'208";a="80999420"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 00:55:41 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 16:54:42 +0800
Message-Id: <ec329e79d07e83cb240dda3988017741c597b566.1322729357.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322729357.git.lei.mei@intel.com>
References: <cover.1322729357.git.lei.mei@intel.com>
In-Reply-To: <cover.1322729357.git.lei.mei@intel.com>
References: <cover.1322729357.git.lei.mei@intel.com>
Subject: [PATCH 1/1] Fix some recipes upstream version check issue
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
X-List-Received-Date: Thu, 01 Dec 2011 09:03:26 -0000

Some recipes didn't declare what protocal they use to check the upstream version, this will due to some errors.
Fix this by add the protocal at the end of the SRC_URI.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../iproute2/iproute2_3.1.0.bb                     |    2 +-
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb          |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
index 0b47046..52e40e1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
@@ -2,7 +2,7 @@ require iproute2.inc
 
 #v3.1.0 tag
 SRCREV = "9cbe6bc337a35b91882f92599eefeb161f3e776e"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git;protocol=git \
            file://configure-cross.patch"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index 554ce81..7a1dc8e 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -6,7 +6,7 @@ SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
 PV = "0.12.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.gnome.org/clutter-box2d.git"
+SRC_URI = "git://git.gnome.org/clutter-box2d.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index 78d51b3..7e64032 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -12,7 +12,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
 # git -> 0.83 needs a PE bump
 PE = "1"
 
-SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
+SRC_URI = "git://github.com/clrkwllms/rt-tests.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4



