Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0AD77051
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:46:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="655095418"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 05:38:32 +0000
Message-Id: <8ce5b81002e5e1d3f547bd117811a436af0e24f9.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/5] scripts/yocto-bsp: Exit successfully when asking for help
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
X-List-Received-Date: Wed, 30 Sep 2015 13:46:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

When user asks for help, the command should not exit with non-zero
status (failure), so removing the non-zero value on the system exit call.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/yocto-bsp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-bsp b/scripts/yocto-bsp
index d269861..2d9453f 100755
--- a/scripts/yocto-bsp
+++ b/scripts/yocto-bsp
@@ -140,7 +140,7 @@ def main():
         if args[0] == "help":
             if len(args) == 1:
                 parser.print_help()
-                sys.exit(1)
+                sys.exit()
 
     invoke_subcommand(args, parser, yocto_bsp_help_usage, subcommands)
 
-- 
1.8.4.5


