Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CCD370031
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:35:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2016 05:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="106121321"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 18 May 2016 05:35:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 419FB6A4007;
	Wed, 18 May 2016 06:22:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 15:34:18 +0300
Message-Id: <1463574859-5073-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463574859-5073-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1463159633.9746.121.camel@linuxfoundation.org>
	<1463574859-5073-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/4] wic: add help for --bmap commandline option
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
X-List-Received-Date: Wed, 18 May 2016 12:35:06 -0000

Included description of -m/--bmap option to the help page
produced by 'wic help create'.

[YOCTO #9413]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 7dcc717..6395596 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -152,7 +152,7 @@ SYNOPSIS
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
         [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
-        [-c, --compress-with]
+        [-c, --compress-with] [-m, --bmap]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
@@ -221,6 +221,9 @@ DESCRIPTION
 
     The -c option is used to specify compressor utility to compress
     an image. gzip, bzip2 and xz compressors are supported.
+
+    The -m option is used to produce .bmap file for the image. This file
+    can be used to flash image using bmaptool utility.
 """
 
 wic_list_usage = """
-- 
2.1.4


