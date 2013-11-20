Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC0F6BC26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:40:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Nov 2013 15:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="438852255"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 20 Nov 2013 15:40:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2013 15:40:23 -0800
Message-Id: <1384990823-986-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] security_flags: grub-efi-natve does not build with flags enabled
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
X-List-Received-Date: Wed, 20 Nov 2013 23:40:23 -0000

[YOCTO #5505]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e313be6..2eaa42f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -18,6 +18,8 @@ SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-grub = ""
+SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
+SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
 SECURITY_CFLAGS_pn-gst-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.8.3.1


