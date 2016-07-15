Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 12E0960722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:03:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 15 Jul 2016 00:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,367,1464678000"; d="scan'208";a="846740583"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2016 00:03:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 27D006A4080;
	Fri, 15 Jul 2016 00:03:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 09:53:47 +0300
Message-Id: <1468565627-9124-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: oe-selftest: build bmap-tools-native
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
X-List-Received-Date: Fri, 15 Jul 2016 07:03:58 -0000

bmap-tools-native is required to generate .bmap file. Without it
wic fails with this error when run with --bmap option:
    Error: A native program bmaptool required to build
           the image was not found

Added bmap-tools-native to the list of requirements to build
in Wic.setUpLocal method.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 895c6d6..e550785 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -49,7 +49,7 @@ class Wic(oeSelfTest):
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
             bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                    'dosfstools-native mtools-native')
+                    'dosfstools-native mtools-native bmap-tools-native')
             bitbake('core-image-minimal')
             Wic.image_is_ready = True
 
-- 
2.1.4


