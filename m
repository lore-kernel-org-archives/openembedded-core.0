Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CAF726FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:51:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 09:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5628220"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 09:51:01 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:39:02 +0000
Message-Id: <eb97b9054dee65e865e694c36c81c5cdd3511f7d.1448961756.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 4/6] wic/help.py: Document the new option "configfile"
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
X-List-Received-Date: Tue, 01 Dec 2015 17:51:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This just adds the "configfile" option for the bootloader
to wic help.

[YOCTO #8728]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/lib/wic/help.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 9a778b6..89fb7be 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -740,6 +740,12 @@ DESCRIPTION
                   bootloader command-line - for example, the syslinux
                   APPEND or grub kernel command line.
 
+        --configfile: Specifies a user defined configuration file for
+                      the bootloader. This file must be located in the
+                      canned-wks folder or could be the full path to the
+                      file. Using this option will override any other
+                      bootloader option.
+
       Note that bootloader functionality and boot partitions are
       implemented by the various --source plugins that implement
       bootloader functionality; the bootloader command essentially
-- 
1.8.4.5


