Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A714071998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:06:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2016 01:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="1051673006"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2016 01:06:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 652EB6A4006;
	Mon, 10 Oct 2016 01:05:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 10:40:51 +0300
Message-Id: <1476085251-17591-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CABcZANne8cNsEgOcvLGrCLfJANbWHpaQhLMLZZ5iMX7FNVFXdQ@mail.gmail.com>
References: <CABcZANne8cNsEgOcvLGrCLfJANbWHpaQhLMLZZ5iMX7FNVFXdQ@mail.gmail.com>
Subject: [wic][PATCH] systemd-bootdisk.wks: update kernel command line
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
X-List-Received-Date: Mon, 10 Oct 2016 08:06:52 -0000

Used ttyS0 console.
Removed usage of ttyPCH0 (FRI2 leftover)
Decreased bootloader timeout to 5 seconds
Removed 'vmalloc=256MB snd-hda-intel.enable_msi=0' as it's not
needed for any of reference BSPs.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
index d80189b..a49d130 100644
--- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
+++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader  --timeout=10  --append="rootwait rootfstype=ext4 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
+bootloader --timeout=5 --append="rootwait rootfstype=ext4 console=ttyS0,115200 console=tty0"
-- 
2.1.4


