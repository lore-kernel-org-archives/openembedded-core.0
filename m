Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Apr 2015 10:27:17 UTC
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id E4F5C737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:27:17 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 5531AA97; Tue,  7 Apr 2015 12:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (ti0091a430-0778.bb.online.no [88.89.40.20])
	by mail.free-electrons.com (Postfix) with ESMTPSA id E9F3E2C0;
	Tue,  7 Apr 2015 12:22:28 +0200 (CEST)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 12:21:59 +0200
Message-Id: <1428402119-31945-2-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1428402119-31945-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1428402119-31945-1-git-send-email-alexandre.belloni@free-electrons.com>
Subject: [wic][PATCH 2/2] wic: support ontrackdm6aux3 partitions
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
X-List-Received-Date: Tue, 07 Apr 2015 10:27:18 -0000

ontrack dm6 aux3 is a type of partition required to be able to boot a Freescale
mxs based platform.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 162f8e1b9c6a..f394abc764c7 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -296,6 +296,8 @@ class Image:
                 parted_fs_type = "fat32"
             elif p['fstype'] == "msdos":
                 parted_fs_type = "fat16"
+            elif p['fstype'] == "ontrackdm6aux3":
+                parted_fs_type = "ontrackdm6aux3"
             else:
                 # Type for ext2/ext3/ext4/btrfs
                 parted_fs_type = "ext2"
-- 
2.1.0


