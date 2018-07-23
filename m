Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBBC975463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 07:37:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6N7bjFC027257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 00:37:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 23 Jul 2018 00:37:44 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2018 15:37:42 +0800
Message-ID: <1532331462-445753-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] grub2.inc: set GRUBPLATFORM_arm to efi
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
X-List-Received-Date: Mon, 23 Jul 2018 07:37:44 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* grub-efi support on arm is enabled as below
  commit:
  commit 65f9fb788371a9a08e3b0e6febecb9cc2aaeefe7
  Author: Kristian Amlie <kristian.amlie@northern.tech>
  Date:   Tue Jul 10 16:07:12 2018 +0200

     grub-efi: Provide target architecture for 32-bit ARM.

* But it fails on arm as below:
  | grub-mkimage: error: cannot open `./grub-core//serial.mod': No such file or directory.

  Set GRUBPLATFORM_arm = "efi" to fix the above error

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a8f335e..7709426 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,7 +32,7 @@ COMPATIBLE_HOST_armv7ve = 'null'
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
 
-GRUBPLATFORM_arm = "uboot"
+GRUBPLATFORM_arm = "efi"
 GRUBPLATFORM_aarch64 = "efi"
 GRUBPLATFORM ??= "pc"
 
-- 
2.7.4


