Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 23AE96B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 17:08:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2016 10:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,336,1455004800"; d="scan'208";a="910065325"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.154])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2016 10:08:39 -0700
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:05:25 -0600
Message-Id: <1457975125-3454-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scripts/lib/bsp/help.py: Add missing options to yocto-bsp help and usage
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
X-List-Received-Date: Mon, 14 Mar 2016 17:08:57 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Add the options --codedump and --skip-git-check to the yocto-bsp help and
yocto-bsp usage, since they are currently missing.

[YOCTO #8322]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/lib/bsp/help.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/bsp/help.py b/scripts/lib/bsp/help.py
index bbb7b31..2b4ed06 100644
--- a/scripts/lib/bsp/help.py
+++ b/scripts/lib/bsp/help.py
@@ -103,6 +103,7 @@ yocto_bsp_create_usage = """
 
  usage: yocto-bsp create <bsp-name> <karch> [-o <DIRNAME> | --outdir <DIRNAME>]
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
+            [-c | --codedump] [-s | --skip-git-check]
 
  This command creates a Yocto BSP based on the specified parameters.
  The new BSP will be a new Yocto BSP layer contained by default within
@@ -131,6 +132,7 @@ NAME
 SYNOPSIS
     yocto-bsp create <bsp-name> <karch> [-o <DIRNAME> | --outdir <DIRNAME>]
         [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
+        [-c | --codedump] [-s | --skip-git-check]
 
 DESCRIPTION
     This command creates a Yocto BSP based on the specified
-- 
1.9.1


