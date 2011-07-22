Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABo-0008Sl-2w
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084153"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:26:04 -0700
Message-Id: <b431e6fd6f0cb7de8c7a15c6bb4a762c7864fd81.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/16] fix Upstream-Status line for few patches
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |    2 +-
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |    2 +-
 .../elfutils/elfutils/fix_for_gcc-4.7.patch        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
index 0a5fb34..2d5315f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
@@ -1,5 +1,5 @@
 Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Avoid these kinds of errors while doing cross build:
 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
index 3ecafc3..0c9230f 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
@@ -2,7 +2,7 @@ Submitted By: Jim Gifford (jim at linuxfromscratch dot org)
 Date: 2004-02-09
 Initial Package Version: 2.6
 Origin: Jim Gifford
-Upstream Status: Accepted
+Upstream-Status: Accepted
 Description: Fixes Compile Issues with the 2.6 Kernel
  
 --- dosfstools-2.10/dosfsck/common.h.orig	2004-02-09 18:37:59.056737458 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch b/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
index bd22eef..bd634b4 100644
--- a/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
+++ b/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: pending
+Upstream-Status: pending
 gcc 4.7 does not like pointer conversion, so have a void * tmp var to work 
 around following compilation issue.
 
-- 
1.7.3.4



