Return-Path: <chee.yang.lee@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 588657CE21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 05:27:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Oct 2019 22:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="209560949"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 22:27:06 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 13:27:05 +0800
Message-Id: <1571722026-74661-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] wic/help: change 'wic write' help description
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
X-List-Received-Date: Tue, 22 Oct 2019 05:27:07 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

update the help desciption for 'wic write' command to
match behaviour.

see commit:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/scripts/wic?id=74b44e59be89c738f702948f9e16e367c0ba43ba

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/help.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 3a40fc0..af7d057 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -478,7 +478,7 @@ NAME
 SYNOPSIS
     wic write <image> <target>
     wic write <image> <target> --expand auto
-    wic write <image> <target> --expand 1:100M-2:300M
+    wic write <image> <target> --expand 1:100M,2:300M
     wic write <image> <target> --native-sysroot <path>
 
 DESCRIPTION
@@ -489,7 +489,7 @@ DESCRIPTION
     The --expand option is used to resize image partitions.
     --expand auto expands partitions to occupy all free space available on the target device.
     It's also possible to specify expansion rules in a format
-    <partition>:<size>[-<partition>:<size>...] for one or more partitions.
+    <partition>:<size>[,<partition>:<size>...] for one or more partitions.
     Specifying size 0 will keep partition unmodified.
     Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
     recommended to use size 0 for boot partition to keep image bootable.
-- 
2.7.4


