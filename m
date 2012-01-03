Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrQ-0004lf-53
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752264"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:05 -0800
Message-Id: <31d097e0b7632ebc5463e01e43ee99ff5ce4ea57.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 079/113] gcc: mark upstream status for all patches
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:38 -0000

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



