Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C7F4E7703A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 02 Sep 2015 04:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="781091567"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2015 04:00:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E6B456A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:09 +0300
Message-Id: <5af60ab3f7666bb085bb8cd883b68989db5814b4.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/17] wic: get rid of wildcard imports
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:24 -0000

Used explicit imports in partitions.py and wicboot.py

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 3 ++-
 scripts/lib/wic/kickstart/custom_commands/wicboot.py   | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 6defc99..bac2067 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -30,7 +30,8 @@ import uuid
 from optparse import OptionValueError
 
 from pykickstart.commands.partition import FC4_PartData, FC4_Partition
-from wic.utils.oe.misc import *
+from wic.utils.oe.misc import msger, parse_sourceparams
+from wic.utils.oe.misc import exec_cmd, exec_native_cmd
 from wic.plugin import pluginmgr
 
 partition_methods = {
diff --git a/scripts/lib/wic/kickstart/custom_commands/wicboot.py b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
index eefd574..0230df2 100644
--- a/scripts/lib/wic/kickstart/custom_commands/wicboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
@@ -23,10 +23,6 @@
 # AUTHORS
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
-
-from pykickstart.base import *
-from pykickstart.errors import *
-from pykickstart.options import *
 from pykickstart.commands.bootloader import F8_Bootloader
 
 class Wic_Bootloader(F8_Bootloader):
-- 
2.1.4


