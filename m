Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A2819757B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:06:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2015 02:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="503157665"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2015 02:06:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 8ECAB6A4083;
	Fri,  5 Jun 2015 02:06:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:12:29 +0300
Message-Id: <1433488349-4178-16-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 9/9] wic: Add help for --part-type and --use-uuid options
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
X-List-Received-Date: Fri, 05 Jun 2015 09:06:36 -0000

Added help for two wks partition options specific to
GUID partition table and globally unique identificators (GUID).

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index e365a07..14f0ff1 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -757,6 +757,15 @@ DESCRIPTION
                             equal to 1.
                             The default value is 1.3.
 
+         --part-type: This option is specific to wic. It specifies partition
+                      type GUID for GPT partitions.
+                      List of partition type GUIDS can be found here:
+                      http://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
+
+         --use-uuid: This option is specific to wic. It makes wic to generate
+                     random globally unique identifier (GUID) for the partition
+                     and use it in bootloader configuration to specify root partition.
+
     * bootloader
 
       This command allows the user to specify various bootloader
-- 
2.1.4


