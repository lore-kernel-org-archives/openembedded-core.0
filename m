Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0360070733
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:01:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 12:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,711,1400050800"; d="scan'208";a="573793294"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 12:01:12 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 14:01:09 -0500
Message-Id: <3d7c44a6df1f49a78f9d169f337e3041aad9e430.1406052643.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1406052643.git.tom.zanussi@linux.intel.com>
References: <cover.1406052643.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/3] wic: Fix bad directory name in bootimg-efi
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
X-List-Received-Date: Tue, 22 Jul 2014 19:01:47 -0000

The original move of the mkefidisk code to the bootimg-efi plugin
resulted in a bad hdddir - fix it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index 2cc179a..0dd9152 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -112,7 +112,7 @@ class BootimgEFIPlugin(SourcePlugin):
         staging_kernel_dir = kernel_dir
         staging_data_dir = bootimg_dir
 
-        hdddir = "%s/hdd" % cr_workdir
+        hdddir = "%s/hdd/boot" % cr_workdir
 
         install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
             (staging_kernel_dir, hdddir)
-- 
1.8.3.1


