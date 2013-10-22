Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 37C1B6D2BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Oct 2013 07:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="420829931"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2013 07:24:16 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:24:03 -0500
Message-Id: <eef2db337a38771aa9e6c09ff73077b6829e7fbb.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 08/10] wic: Remove binary dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2013 14:24:38 -0000

Current functionality doesn't make use of kpartx, mount, or unmount,
and we use native mkswap, so remove the binary checks for those.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/partitionedfs.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 59263ba..6607466 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -45,11 +45,7 @@ class PartitionedMount(Mount):
         self.mountOrder = []
         self.unmountOrder = []
         self.parted = find_binary_path("parted")
-        self.kpartx = find_binary_path("kpartx")
-        self.mkswap = find_binary_path("mkswap")
         self.btrfscmd=None
-        self.mountcmd = find_binary_path("mount")
-        self.umountcmd = find_binary_path("umount")
         self.skipformat = skipformat
         self.snapshot_created = self.skipformat
         # Size of a sector used in calculations
-- 
1.8.3.1


