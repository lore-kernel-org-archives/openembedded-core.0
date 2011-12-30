Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RgQUM-0005yW-Cq
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 01:38:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Dec 2011 16:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90690848"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 29 Dec 2011 16:31:08 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2011 16:30:55 -0800
Message-Id: <bd256f40c1d0ae7167274e56a0265fbb8d09beae.1325204775.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325204775.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325204775.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325204775.git.nitin.a.kamble@intel.com>
References: <cover.1325204775.git.nitin.a.kamble@intel.com>
Subject: [PATCH 10/14] gcc: mark upstream status for all patches
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
X-List-Received-Date: Fri, 30 Dec 2011 00:38:26 -0000

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



