Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D35D8731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:52:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2016 04:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="964240717"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2016 04:52:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id AC44B6A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:40:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:32:04 +0300
Message-Id: <f5f59fe39cb03943d4522f2e6b6c558ae733f4c5.1461317156.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 6/6] wic: add help for --system-id option
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
X-List-Received-Date: Fri, 22 Apr 2016 11:52:54 -0000

Added explanation of --system-id option to the output of
wic help kickstart.

[YOCTO #9096]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 405d25a..394e3fd 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -738,6 +738,10 @@ DESCRIPTION
                  in bootloader configuration before running wic. In this case .wks file can
                  be generated or modified to set preconfigured parition UUID using this option.
 
+         --system-id: This option is specific to wic. It specifies partition system id. It's useful
+                      for the harware that requires non-default partition system ids. The parameter
+                      in one byte long hex number either with 0x prefix or without it.
+
     * bootloader
 
       This command allows the user to specify various bootloader
-- 
2.1.4


