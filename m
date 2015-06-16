Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7963473BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 12:12:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jun 2015 05:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="711899385"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2015 05:12:26 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 941B66A4087;
	Tue, 16 Jun 2015 05:11:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 13:18:35 +0300
Message-Id: <1434449915-23365-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH v2] wic: Document creation of empty partition
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
X-List-Received-Date: Tue, 16 Jun 2015 12:12:32 -0000

Added short explanation of how to create empty pattition
to the 'wic help kickstart' output.

[YOCTO #7131]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 14f0ff1..adfe976 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -707,6 +707,10 @@ DESCRIPTION
                    up being are dependent on the given plugin
                    implementation.
 
+                   If --source option is not used, the wic command
+                   will create empty partition. --size parameter has
+                   to be used to specify size of empty partition.
+
          --ondisk or --ondrive: Forces the partition to be created on
                                 a particular disk.
 
-- 
2.1.4


