Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAA56D2E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 22 Oct 2013 07:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="415195727"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2013 07:24:14 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:24:02 -0500
Message-Id: <8ea5aee83fd0a582e85f2450d27b7d22a6616680.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 07/10] wic: Remove rpmmisc call from livecd
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:13 -0000

We don't currently use LiveCDImageCreator, but it makes calls when
initialized via the plugin interface to rpmmisc module functions,
which we don't want the dependency on.

To make it (and LiveUSBImageCreator) happy, we give it the dummy
"i386" value for now.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/livecd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/mic/imager/livecd.py b/scripts/lib/mic/imager/livecd.py
index 0711552..e36f4a7 100644
--- a/scripts/lib/mic/imager/livecd.py
+++ b/scripts/lib/mic/imager/livecd.py
@@ -741,7 +741,7 @@ hiddenmenu
         self._configure_syslinux_bootloader(isodir)
         self._configure_efi_bootloader(isodir)
 
-arch = rpmmisc.getBaseArch()
+arch = "i386"
 if arch in ("i386", "x86_64"):
     LiveCDImageCreator = x86LiveImageCreator
 elif arch.startswith("arm"):
-- 
1.8.3.1


