Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholQ-0008H2-4D
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039317"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:38:06 -0800
Message-Id: <9610f42b05f76569fe20820fc045595eecb9b4f4.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 10/15] gcc: mark upstream status for all patches
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Some patches were missing Upstream-Status informantion,
this commit adds that in those patches.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |    1 +
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |    1 +
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |    1 +
 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch    |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
index 04dabaf..4419a20 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
@@ -1,3 +1,4 @@
+Upstream-Status:Backport
 2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
 
  	gcc/
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch b/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
index e310080..c0e3594 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
@@ -1,3 +1,4 @@
+Upstream-Status:Backport
 Hi,
 
 As suggested by richi.
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch b/meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
index afd3eef..60b7012 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
@@ -1,3 +1,4 @@
+Upstream-Status:Backport
 2011-09-19  chengbin  <bin.cheng@arm.com>
 
 	Backport r174035 from mainline
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch b/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
index 5271ffa..2c6bcda 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
@@ -1,3 +1,4 @@
+Upstream-Status:Backport
 2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
 
 	gcc/
-- 
1.7.6.4



