Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C45576618
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 15:53:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Aug 2015 08:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,678,1432623600"; d="scan'208";a="768873526"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 08:53:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 18:54:11 +0300
Message-Id: <1439567651-9281-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] canned-wks: added a qemux86* directdisk recipe for wic
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
X-List-Received-Date: Fri, 14 Aug 2015 15:53:59 -0000

qemu-directdisk.wks creates a raw disk image
that a qemux86* machine can boot from.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/lib/image/canned-wks/qemux86-directdisk.wks | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 scripts/lib/image/canned-wks/qemux86-directdisk.wks

diff --git a/scripts/lib/image/canned-wks/qemux86-directdisk.wks b/scripts/lib/image/canned-wks/qemux86-directdisk.wks
new file mode 100644
index 0000000..8fc38b5
--- /dev/null
+++ b/scripts/lib/image/canned-wks/qemux86-directdisk.wks
@@ -0,0 +1,10 @@
+# short-description: Create a qemu machine 'pcbios' direct disk image
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly use to boot a qemu machine.
+
+
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+
+bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 root=/dev/vda2 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
+
-- 
2.1.4


