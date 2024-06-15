Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DDCC3DA52
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18383.1718475799799717667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M2T9Sz65;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rIS511Pa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23ba2a-5cbaa1f8-eee9-486d-a28f-803187a1627e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kL3CybEK5jueH1W3gIJxidXZt1T3OnmpZZSl0Yar5aw=;
	b=M2T9Sz65NUs+Dyg0PfGvqE3BYwK7XFDAPTbbNFeg04TFDl7JDeCcNFu5QWo7GTrZ
	JhxkkwDjYpsub6/OcXxR/WcdLr7xnAis1Nb1zYkBQJR16DPBtIvgPrXMSxg/MTHKGD8
	XMXHRdY/Q4HkmhBbsbW5U7aRocPUrPogqQjGhFTc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kL3CybEK5jueH1W3gIJxidXZt1T3OnmpZZSl0Yar5aw=;
	b=rIS511PavwnbfjsaHRvLZrHDiqK3I1yxvx8DFId9sfHL0llBAxl4WqKVmmNFNYuh
	cGqMNY9ZzMP3cx/cVsX07izdiCfvEUi5RLq+LOBkN2A4TtCPzXgNwmDAtYn6nxIAvbz
	kYhiX4EWmNY/EHd+KdWsgQe5eE3DmvopFOYZ+nLI=
Content-Type: multipart/mixed; boundary="===============0031852133080243050=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 9.0.1 FAILED
Message-ID: <010101901d23ba2a-5cbaa1f8-eee9-486d-a28f-803187a1627e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200709

--===============0031852133080243050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *9.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-qemu-upgrade-9.0.0-9.0.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f3f47968f67c161ad2c9ca1b6c0299d8312f88da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 10:13:53 +0000
Subject: [PATCH] qemu: upgrade 9.0.0 -> 9.0.1

---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 ...n-environment-space-to-boot-loader-q.patch |  9 ++--
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  9 ++--
 ...dd-pkg-config-handling-for-libgcrypt.patch |  9 ++--
 ...mu-Do-not-include-file-if-not-exists.patch |  9 ++--
 ...er-space-mmap-tweaks-to-address-musl.patch | 10 ++--
 .../qemu/0006-qemu-Determinism-fixes.patch    |  9 ++--
 ...d-use-relative-path-to-refer-to-file.patch |  9 ++--
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  9 ++--
 ...ce-use-of-lfs64-related-functions-an.patch | 54 +++++++++----------
 ...gure-lookup-meson-exutable-from-PATH.patch | 11 ++--
 ...and-the-python-venv-aren-t-used-for-.patch | 12 ++---
 .../qemu/{qemu_9.0.0.bb => qemu_9.0.1.bb}     |  0
 13 files changed, 58 insertions(+), 94 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_9.0.0.bb => qemu_9.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fb38fb44de..6a5ab56436 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69"
+SRC_URI[sha256sum] = "d0f4db0fbd151c0cf16f84aeb2a500f6e95009732546f44dafab8d2049bbb805"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 2333cc8432..5318cacff5 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00 2001
+From f88d114872c286ffe98be3ac303ae6affc570444 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
-Subject: [PATCH 01/11] qemu: Add addition environment space to boot loader
+Subject: [PATCH] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
@@ -18,7 +18,7 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index af74008c82..a588b9ad4e 100644
+index af74008c8..a588b9ad4 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
 @@ -63,7 +63,7 @@
@@ -30,6 +30,3 @@ index af74008c82..a588b9ad4e 100644
  
  /* Hardware addresses */
  #define FLASH_ADDRESS       0x1e000000ULL
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 5f8fe4faa3..21811fd5e5 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00 2001
+From 2664e04ec625a7be97ba1f84a6e79dea121a860e Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH 02/11] apic: fixup fallthrough to PIC
+Subject: [PATCH] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -29,7 +29,7 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 4186c57b34..43cd805a96 100644
+index 4186c57b3..43cd805a9 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
 @@ -759,7 +759,7 @@ int apic_accept_pic_intr(DeviceState *dev)
@@ -41,6 +41,3 @@ index 4186c57b34..43cd805a96 100644
          return -1;
  
      lvt0 = s->lvt[APIC_LVT_LINT0];
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
index 30e269f8f4..29c655ae5c 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From e4f6c6b9f43b28271bc9dc6cbcafad53f80387e0 Mon Sep 17 00:00:00 2001
+From 5c99cc634339a0ecc7b1c03b269f73b02bfb77be Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 28 Aug 2019 19:56:28 +0800
-Subject: [PATCH 03/11] configure: Add pkg-config handling for libgcrypt
+Subject: [PATCH] configure: Add pkg-config handling for libgcrypt
 
 libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
 handling for libgcrypt.
@@ -14,7 +14,7 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 91a0aa64c6..e8373d55b8 100644
+index 91a0aa64c..e8373d55b 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1655,7 +1655,7 @@ endif
@@ -26,6 +26,3 @@ index 91a0aa64c6..e8373d55b8 100644
                          required: get_option('gcrypt'))
      # Debian has removed -lgpg-error from libgcrypt-config
      # as it "spreads unnecessary dependencies" which in
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index d9cab428c4..1cc2a4bad5 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00 2001
+From 8aca988dba777092a95763ac6936c7b91c2d5b79 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
-Subject: [PATCH 04/11] qemu: Do not include file if not exists
+Subject: [PATCH] qemu: Do not include file if not exists
 
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 3df2b94d9a..18f09f1f07 100644
+index 59fb3e911..cb651459a 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -116,7 +116,9 @@
@@ -29,6 +29,3 @@ index 3df2b94d9a..18f09f1f07 100644
  #include <linux/rtc.h>
  #include <sound/asound.h>
  #ifdef HAVE_BTRFS_H
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 3c7f5776ff..b123e17adb 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,8 +1,7 @@
-From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00 2001
+From e16a9e040197ecf16c95bbc657ac5be0ba8146ae Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
-Subject: [PATCH 05/11] qemu: Add some user space mmap tweaks to address musl
- 32 bit
+Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
 
 When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
 infinite loop of mremap calls of ever decreasing/increasing addresses.
@@ -23,7 +22,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index be3b9a68eb..481286f01d 100644
+index be3b9a68e..481286f01 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
 @@ -1060,12 +1060,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
@@ -46,6 +45,3 @@ index be3b9a68eb..481286f01d 100644
          return -1;
      }
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index f07054f19a..d41ae7fb5e 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00 2001
+From 956f5edf07f8780383643ef64d491ed3cf27249c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
-Subject: [PATCH 06/11] qemu: Determinism fixes
+Subject: [PATCH] qemu: Determinism fixes
 
 When sources are included within debug information, a couple of areas of the
 qemu build are not reproducible due to either full buildpaths or timestamps.
@@ -16,7 +16,7 @@ RP 2021/3/1
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/decodetree.py b/scripts/decodetree.py
-index e8b72da3a9..5cd86b1428 100644
+index e8b72da3a..5cd86b142 100644
 --- a/scripts/decodetree.py
 +++ b/scripts/decodetree.py
 @@ -1558,7 +1558,7 @@ def main():
@@ -28,6 +28,3 @@ index e8b72da3a9..5cd86b1428 100644
          f = open(filename, 'rt', encoding='utf-8')
          parse_file(f, toppat)
          f.close()
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 74de158b2e..148e581ac8 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00 2001
+From c75bd2b66ce38242f7df9e992cceb71ef32e7393 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
-Subject: [PATCH 07/11] tests/meson.build: use relative path to refer to files
+Subject: [PATCH] tests/meson.build: use relative path to refer to files
 
 Fix error like:
 Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
@@ -17,7 +17,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index 228a21d03c..272fb4c6ca 100644
+index 228a21d03..272fb4c6c 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
 @@ -47,7 +47,7 @@ tests = {
@@ -38,6 +38,3 @@ index 228a21d03c..272fb4c6ca 100644
      'test-vmstate': [migration, io],
      'test-yank': ['socket-helpers.c', qom, io, chardev]
    }
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 2e28590e11..b48f24fe98 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00 2001
+From 5cd8e589c183fe8019a99189c60ea4f147cff34c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
-Subject: [PATCH 08/11] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
+Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
  systems
 
 linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
@@ -18,7 +18,7 @@ Cc: Michael S. Tsirkin <mst@redhat.com>
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
-index ed14f9c64d..038f5b4b55 100644
+index ed14f9c64..038f5b4b5 100644
 --- a/util/mmap-alloc.c
 +++ b/util/mmap-alloc.c
 @@ -10,14 +10,18 @@
@@ -43,6 +43,3 @@ index ed14f9c64d..038f5b4b55 100644
  #include "qemu/mmap-alloc.h"
  #include "qemu/host-utils.h"
  #include "qemu/cutils.h"
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
index 7577249d39..1456fdd36b 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,8 +1,7 @@
-From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00 2001
+From 7c8ec207159bac162fd72f2fb45e8221d6db3a4d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH 09/11] linux-user: Replace use of lfs64 related functions and
- macros
+Subject: [PATCH] linux-user: Replace use of lfs64 related functions and macros
 
 Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
 anf macros behave same as their 64 suffixed counterparts. This also
@@ -17,7 +16,7 @@ Cc: Laurent Vivier <laurent@vivier.eu>
  1 file changed, 39 insertions(+), 114 deletions(-)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 18f09f1f07..1b7c50a2a7 100644
+index cb651459a..cb44cc21d 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
@@ -31,7 +30,7 @@ index 18f09f1f07..1b7c50a2a7 100644
   * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
   */
  #ifdef __NR_fcntl64
-@@ -6739,13 +6739,13 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6734,13 +6734,13 @@ static int target_to_host_fcntl_cmd(int cmd)
          ret = cmd;
          break;
      case TARGET_F_GETLK:
@@ -48,7 +47,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          break;
      case TARGET_F_GETOWN:
          ret = F_GETOWN;
-@@ -6759,17 +6759,6 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6754,17 +6754,6 @@ static int target_to_host_fcntl_cmd(int cmd)
      case TARGET_F_SETSIG:
          ret = F_SETSIG;
          break;
@@ -66,7 +65,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      case TARGET_F_SETLEASE:
          ret = F_SETLEASE;
          break;
-@@ -6821,8 +6810,8 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6816,8 +6805,8 @@ static int target_to_host_fcntl_cmd(int cmd)
       * them to 5, 6 and 7 before making the syscall(). Since we make the
       * syscall directly, adjust to what is supported by the kernel.
       */
@@ -77,7 +76,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      }
  #endif
  
-@@ -6855,55 +6844,11 @@ static int host_to_target_flock(int type)
+@@ -6850,55 +6839,11 @@ static int host_to_target_flock(int type)
      return type;
  }
  
@@ -136,7 +135,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      abi_short l_type;
      abi_short l_whence;
      abi_llong l_start;
-@@ -6911,10 +6856,10 @@ struct target_oabi_flock64 {
+@@ -6906,10 +6851,10 @@ struct target_oabi_flock64 {
      abi_int   l_pid;
  } QEMU_PACKED;
  
@@ -149,7 +148,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6935,10 +6880,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
+@@ -6930,10 +6875,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -163,7 +162,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -6956,10 +6901,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+@@ -6951,10 +6896,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
  }
  #endif
  
@@ -176,7 +175,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6980,10 +6925,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
+@@ -6975,10 +6920,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -190,7 +189,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7002,7 +6947,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+@@ -6997,7 +6942,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
  
  static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  {
@@ -199,7 +198,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  #ifdef F_GETOWN_EX
      struct f_owner_ex fox;
      struct target_f_owner_ex *target_fox;
-@@ -7015,6 +6960,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7010,6 +6955,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  
      switch(cmd) {
      case TARGET_F_GETLK:
@@ -207,7 +206,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          ret = copy_from_user_flock(&fl64, arg);
          if (ret) {
              return ret;
-@@ -7024,32 +6970,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7019,32 +6965,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
              ret = copy_to_user_flock(arg, &fl64);
          }
          break;
@@ -241,7 +240,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          if (ret) {
              return ret;
          }
-@@ -7278,7 +7203,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
+@@ -7273,7 +7198,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +249,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -7292,7 +7217,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+@@ -7287,7 +7212,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -259,7 +258,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -8667,7 +8592,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8662,7 +8587,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -268,7 +267,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8720,7 +8645,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8715,7 +8640,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -277,7 +276,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              break;
          }
  
-@@ -8754,7 +8679,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8749,7 +8674,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -286,7 +285,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8796,7 +8721,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8791,7 +8716,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -295,7 +294,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              break;
          }
  
-@@ -11527,7 +11452,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11522,7 +11447,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -304,7 +303,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          unlock_user(p, arg2, ret);
          return ret;
      case TARGET_NR_pwrite64:
-@@ -11544,7 +11469,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11539,7 +11464,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -313,7 +312,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -12404,14 +12329,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12399,14 +12324,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
      case TARGET_NR_fcntl64:
      {
          int cmd;
@@ -333,7 +332,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          }
  #endif
  
-@@ -12421,7 +12346,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12416,7 +12341,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          }
  
          switch(arg2) {
@@ -342,7 +341,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
-@@ -12432,8 +12357,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12427,8 +12352,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              }
  	    break;
  
@@ -353,6 +352,3 @@ index 18f09f1f07..1b7c50a2a7 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 98ce85a8cf..632cac6ed4 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,7 +1,7 @@
-From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00 2001
+From 9705950327dfd2f709e29bafb6aed9adfa0ebce2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
-Subject: [PATCH 10/11] configure: lookup meson exutable from PATH
+Subject: [PATCH] configure: lookup meson exutable from PATH
 
 Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
 ---
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index 3cd736b139..482a1f8ef3 100755
+index 0aea9b113..c28bd47b4 100755
 --- a/configure
 +++ b/configure
-@@ -956,12 +956,7 @@ fi
+@@ -965,12 +965,7 @@ fi
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
@@ -26,6 +26,3 @@ index 3cd736b139..482a1f8ef3 100755
  
  # Conditionally ensure Sphinx is installed.
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index c7bb9b1b47..2d082cf38f 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,8 +1,7 @@
-From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00 2001
+From a02e4fa79740d9ecb82d1162608fb63be80906bf Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
-Subject: [PATCH 11/11] qemu: Ensure pip and the python venv aren't used for
- meson
+Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
 
 Qemu wants to use a supported python version and a specific meson version
 to "help" users and uses pip and creates a venv to do this. This is a nightmare
@@ -30,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 482a1f8ef3..0da4bf3e4d 100755
+index c28bd47b4..33b89b236 100755
 --- a/configure
 +++ b/configure
-@@ -938,14 +938,14 @@ python="$(command -v "$python")"
+@@ -947,14 +947,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
@@ -50,6 +49,3 @@ index 482a1f8ef3..0da4bf3e4d 100755
  
  # Finish preparing the virtual environment using vendored .whl files
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu_9.0.0.bb b/meta/recipes-devtools/qemu/qemu_9.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_9.0.1.bb
-- 
2.44.0


--===============0031852133080243050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (917 cached, 3 parsed). 1881 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-a84581d312e2875f54482cee7cd2ea5dc6f55202"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a84581d312e2875f54482cee7cd2ea5dc6f55202"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 538 Local 346 Mirrors 0 Missed 192 Current 589 (64% match, 82% complete)
Removing 44 stale sstate objects for arch qemux86_64...done.
Removing 83 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 685 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 775 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 779 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 780 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 782 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 841 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 845 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 846 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.66.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 850 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 854 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 858 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 859 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 863 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 866 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 869 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 870 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 872 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.66-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ell-0.66-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 874 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 877 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 881 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 889 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 903 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 906 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 910 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 924 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 925 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 928 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 932 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 933 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 934 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1028 of 1127 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1060 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1065 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1066 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-native-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1114 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1120 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 829 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_recipe_qa)
NOTE: Running task 853 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe qemu-native-9.0.0-r0: task do_recipe_qa: Started
NOTE: Running task 1043 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running task 1183 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_unpack)
NOTE: Running task 1188 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 1190 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 1193 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: Running task 1199 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: Running task 1248 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: Running task 1261 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1272 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_write_config)
NOTE: Running task 1284 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Started
NOTE: Running task 1300 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1302 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1304 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe qemu-native-9.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_recipe_qa unihash changed to 2c85fd8ad8c9585f4b215ee3b270d81e198b37863350046be58b309b21ee62a3
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1356 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch)
NOTE: Running task 1357 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_patch)
NOTE: Running task 1358 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1359 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: Running task 1360 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_unpack)
NOTE: Running task 1361 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_unpack)
NOTE: Running task 1371 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1373 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1375 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1413 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_fetch)
NOTE: Running task 1424 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: Running task 1428 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: Running task 1441 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_fetch)
NOTE: Running task 1443 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1445 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1447 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Started
WARNING: qemu-native-9.0.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-9.0.0-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz_bad-checksum_32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1450 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1471 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: Running task 1474 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Started
NOTE: Running task 1549 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1550 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1551 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1555 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_patch)
NOTE: Running task 1556 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe wayland-1.23.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1557 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_unpack)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1594 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: Running task 1595 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1596 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 1597 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1634 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_warn_musl)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1636 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_write_config)
NOTE: recipe wayland-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1653 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: Running task 1663 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: Running task 1665 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1672 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: Running task 1692 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_fetch)
NOTE: Running task 1694 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: Running task 1709 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
NOTE: Running task 1737 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1739 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 1825 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_fetch)
NOTE: Running task 1827 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1838 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_fetch)
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Succeeded
NOTE: Running task 1839 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: Running task 1840 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1868 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1869 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: Running task 1870 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: Running task 1871 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1874 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_fetch: Started
NOTE: Running task 1876 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: Running task 1878 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe libdrm-2.4.120-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1879 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.120-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Started
NOTE: Running task 1885 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1949 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_unpack)
NOTE: Running task 1950 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe bluez5-5.72-r0: task do_unpack: Started
NOTE: Running task 1957 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1958 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1959 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1960 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: Running task 1961 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1962 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: Running task 1963 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_fetch: Succeeded
NOTE: Running task 1964 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.120-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1965 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_unpack: Started
NOTE: Running task 1967 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1988 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.66.bb:do_fetch)
NOTE: Running task 2049 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_fetch)
NOTE: Running task 2050 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 2051 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2052 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: Running task 2053 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2055 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.72-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 2056 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: Running task 2057 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_patch)
NOTE: recipe ell-0.66-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.120-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2071 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_fetch)
NOTE: Running task 2072 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.120-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe ell-0.66-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2073 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 2074 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_write_config)
NOTE: recipe bluez5-5.72-r0: task do_patch: Started
NOTE: Running task 2093 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.66.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2094 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.7-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: Running task 2260 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 2268 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: Running task 2269 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe ofono-2.7-r0: task do_fetch: Succeeded
NOTE: Running task 2276 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_recipe_qa)
NOTE: Running task 2277 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_unpack)
NOTE: recipe libdrm-2.4.120-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.66-r0: task do_unpack: Started
NOTE: Running task 2278 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Succeeded
NOTE: Running task 2279 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_write_config: Succeeded
NOTE: Running task 2364 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: Running task 2365 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe qemu-9.0.1-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.7-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.72-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Started
NOTE: Running task 2391 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.66-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Succeeded
NOTE: Running task 2412 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_patch)
NOTE: Running task 2413 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.66.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2628 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe ell-0.66-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2629 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe ofono-2.7-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.66-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2630 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_patch)
NOTE: Running task 2632 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe qemu-9.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 2634 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_fetch)
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.7-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe ofono-2.7-r0: task do_patch: Succeeded
NOTE: recipe qemu-9.0.1-r0: task do_fetch: Started
NOTE: recipe qemu-9.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2637 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_unpack: Succeeded
NOTE: Running task 2639 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Succeeded
NOTE: Running task 2640 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Succeeded
NOTE: Running task 2641 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe qemu-9.0.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Started
NOTE: recipe systemd-1_255.6-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_patch: Succeeded
NOTE: Running task 2642 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_generate_toolchain_file)
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2644 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
WARNING: qemu-native-9.0.0-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-9.0.0.tar.xz - will attempt other sources if available
WARNING: qemu-native-9.0.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-9.0.0-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz_bad-checksum_32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69
NOTE: recipe qemu-9.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2648 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_patch)
NOTE: recipe qemu-9.0.1-r0: task do_patch: Started
NOTE: recipe qemu-9.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2649 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2650 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_populate_lic)
NOTE: recipe qemu-9.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemu-9.0.1-r0: task do_populate_lic: Started
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Failed
NOTE: recipe qemu-9.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe qemu-9.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Tasks Summary: Attempted 2650 tasks of which 2518 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615101326.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615101326.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-9.0.0-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-9.0.0.tar.xz
ERROR: qemu-native-9.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz\' has sha256 checksum \'32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69\' when \'d0f4db0fbd151c0cf16f84aeb2a500f6e95009732546f44dafab8d2049bbb805\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-9.0.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/qemu-native/9.0.0/temp/log.do_fetch.3035015
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch) failed with exit code '1'

--===============0031852133080243050==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-9.0.0-9.0.1.patch"

RnJvbSBmM2Y0Nzk2OGY2N2MxNjFhZDJjOWNhMWI2YzAyOTlkODMxMmY4OGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTA6MTM6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11OiB1cGdyYWRlIDkuMC4wIC0+IDkuMC4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUuaW5jICAgICAgICAgICB8ICAyICstCiAuLi5uLWVudmlyb25tZW50LXNwYWNlLXRv
LWJvb3QtbG9hZGVyLXEucGF0Y2ggfCAgOSArKy0tCiAuLi4vMDAwMi1hcGljLWZpeHVwLWZhbGx0
aHJvdWdoLXRvLVBJQy5wYXRjaCAgfCAgOSArKy0tCiAuLi5kZC1wa2ctY29uZmlnLWhhbmRsaW5n
LWZvci1saWJnY3J5cHQucGF0Y2ggfCAgOSArKy0tCiAuLi5tdS1Eby1ub3QtaW5jbHVkZS1maWxl
LWlmLW5vdC1leGlzdHMucGF0Y2ggfCAgOSArKy0tCiAuLi5lci1zcGFjZS1tbWFwLXR3ZWFrcy10
by1hZGRyZXNzLW11c2wucGF0Y2ggfCAxMCArKy0tCiAuLi4vcWVtdS8wMDA2LXFlbXUtRGV0ZXJt
aW5pc20tZml4ZXMucGF0Y2ggICAgfCAgOSArKy0tCiAuLi5kLXVzZS1yZWxhdGl2ZS1wYXRoLXRv
LXJlZmVyLXRvLWZpbGUucGF0Y2ggfCAgOSArKy0tCiAuLi5hbmQtTUFQX1NIQVJFRF9WQUxJREFU
RS1vbi1uZWVkZWQtbGkucGF0Y2ggfCAgOSArKy0tCiAuLi5jZS11c2Utb2YtbGZzNjQtcmVsYXRl
ZC1mdW5jdGlvbnMtYW4ucGF0Y2ggfCA1NCArKysrKysrKystLS0tLS0tLS0tCiAuLi5ndXJlLWxv
b2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggfCAxMSArKy0tCiAuLi5hbmQtdGhl
LXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggfCAxMiArKy0tLQogLi4uL3FlbXUv
e3FlbXVfOS4wLjAuYmIgPT4gcWVtdV85LjAuMS5iYn0gICAgIHwgIDAKIDEzIGZpbGVzIGNoYW5n
ZWQsIDU4IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3txZW11XzkuMC4wLmJiID0+IHFlbXVfOS4wLjEuYmJ9ICgxMDAlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKaW5kZXggZmIzOGZiNDRkZS4uNmE1YWI1NjQz
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKQEAgLTM3LDcgKzM3LDcgQEAgU1JD
X1VSSSA9ICJodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAog
ICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJxZW11LSg/UDxwdmVyPlxkKyhc
LlxkKykrKVwudGFyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzI3MDhhYzY2YzMwZDhjODky
NjMzZWE5NjhjNzcxYzFjNzZkNTk3ZDcwZGRlYWQyMWEwZDIyY2NmMzg2ZGE2OSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJkMGY0ZGIwZmJkMTUxYzBjZjE2Zjg0YWViMmE1MDBmNmU5NTAwOTczMjU0
NmY0NGRhZmFiOGQyMDQ5YmJiODA1IgogCiBDVkVfU1RBVFVTW0NWRS0yMDA3LTA5OThdID0gIm5v
dC1hcHBsaWNhYmxlLWNvbmZpZzogVGhlIFZOQyBzZXJ2ZXIgY2FuIGV4cG9zZSBob3N0IGZpbGVz
IHVkZXIgc29tZSBjaXJjdW1zdGFuY2VzLiBXZSBkb24ndCBlbmFibGUgaXQgYnkgZGVmYXVsdC4i
CiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11
LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVu
dmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKaW5kZXggMjMzM2NjODQzMi4u
NTMxOGNhY2ZmNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRk
LWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKQEAgLTEs
NyArMSw3IEBACi1Gcm9tIGU5YmFmMDdhNjY3YTFjMDRiNTdlMTQ3NzZjYzRmYTM4NzQ0OGM5MDgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY4OGQxMTQ4NzJjMjg2ZmZlOThiZTNhYzMw
M2FlNmFmZmM1NzA0NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKYXNvbiBXZXNz
ZWwgPGphc29uLndlc3NlbEB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAyOCBNYXIgMjAxNCAx
Nzo0Mjo0MyArMDgwMAotU3ViamVjdDogW1BBVENIIDAxLzExXSBxZW11OiBBZGQgYWRkaXRpb24g
ZW52aXJvbm1lbnQgc3BhY2UgdG8gYm9vdCBsb2FkZXIKK1N1YmplY3Q6IFtQQVRDSF0gcWVtdTog
QWRkIGFkZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJvb3QgbG9hZGVyCiAgcWVtdS1zeXN0
ZW0tbWlwcwogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgLSBPRSB1c2VzIGRlZXAg
cGF0aHMKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogUm95IExpIDxyb25ncWluZy5s
aUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvaHcvbWlwcy9tYWx0YS5jIGIvaHcvbWlwcy9tYWx0YS5j
Ci1pbmRleCBhZjc0MDA4YzgyLi5hNTg4YjlhZDRlIDEwMDY0NAoraW5kZXggYWY3NDAwOGM4Li5h
NTg4YjlhZDQgMTAwNjQ0CiAtLS0gYS9ody9taXBzL21hbHRhLmMKICsrKyBiL2h3L21pcHMvbWFs
dGEuYwogQEAgLTYzLDcgKzYzLDcgQEAKQEAgLTMwLDYgKzMwLDMgQEAgaW5kZXggYWY3NDAwOGM4
Mi4uYTU4OGI5YWQ0ZSAxMDA2NDQKICAKICAvKiBIYXJkd2FyZSBhZGRyZXNzZXMgKi8KICAjZGVm
aW5lIEZMQVNIX0FERFJFU1MgICAgICAgMHgxZTAwMDAwMFVMTAotLS0gCi0yLjQ0LjAKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAt
ZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoCmluZGV4IDVmOGZlNGZh
YTMuLjIxODExZmQ1ZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1Q
SUMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDIzYmY1MzRlNDYzYmY0YzFiYTJlMTM1NmVh
ZjE3YmUwYjIzYjE5MmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI2NjRlMDRlYzYy
NWE3YmU5N2JhMWY4NGE2ZTc5ZGVhMTIxYTg2MGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBNYXJrIEFzc2Vsc3RpbmUgPG1hcmsuYXNzZWxzdGluZUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVHVlLCAyNiBGZWIgMjAxMyAxMTo0MzoyOCAtMDUwMAotU3ViamVjdDogW1BBVENIIDAyLzEx
XSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKK1N1YmplY3Q6IFtQQVRDSF0gYXBpYzog
Zml4dXAgZmFsbHRocm91Z2ggdG8gUElDCiAKIENvbW1pdCAwZTIxZTEyYmIzMTFjNGMxMDk1ZDAy
NjlkYzJlZjgxMTk2Y2NiNjBhIFtEb24ndCByb3V0ZSBQSUMKIGludGVycnVwdHMgdGhyb3VnaCB0
aGUgbG9jYWwgQVBJQyBpZiB0aGUgbG9jYWwgQVBJQyBjb25maWcgc2F5cyBzby5dCkBAIC0yOSw3
ICsyOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEhlIFpoZSA8emhlLmhlQHdpbmRyaXZlci5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9ody9pbnRjL2FwaWMuYyBiL2h3L2ludGMvYXBpYy5jCi1pbmRleCA0MTg2YzU3YjM0Li40
M2NkODA1YTk2IDEwMDY0NAoraW5kZXggNDE4NmM1N2IzLi40M2NkODA1YTkgMTAwNjQ0CiAtLS0g
YS9ody9pbnRjL2FwaWMuYwogKysrIGIvaHcvaW50Yy9hcGljLmMKIEBAIC03NTksNyArNzU5LDcg
QEAgaW50IGFwaWNfYWNjZXB0X3BpY19pbnRyKERldmljZVN0YXRlICpkZXYpCkBAIC00MSw2ICs0
MSwzIEBAIGluZGV4IDQxODZjNTdiMzQuLjQzY2Q4MDVhOTYgMTAwNjQ0CiAgICAgICAgICByZXR1
cm4gLTE7CiAgCiAgICAgIGx2dDAgPSBzLT5sdnRbQVBJQ19MVlRfTElOVDBdOwotLS0gCi0yLjQ0
LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAzLWNv
bmZpZ3VyZS1BZGQtcGtnLWNvbmZpZy1oYW5kbGluZy1mb3ItbGliZ2NyeXB0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAzLWNvbmZpZ3VyZS1BZGQtcGtnLWNvbmZp
Zy1oYW5kbGluZy1mb3ItbGliZ2NyeXB0LnBhdGNoCmluZGV4IDMwZTI2OWY4ZjQuLjI5YzY1NWFl
NWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMy1jb25m
aWd1cmUtQWRkLXBrZy1jb25maWctaGFuZGxpbmctZm9yLWxpYmdjcnlwdC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDMtY29uZmlndXJlLUFkZC1wa2ctY29u
ZmlnLWhhbmRsaW5nLWZvci1saWJnY3J5cHQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGU0
ZjZjNmI5ZjQzYjI4MjcxYmM5ZGM2Y2JjYWZhZDUzZjgwMzg3ZTAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDVjOTljYzYzNDMzOWEwZWNjN2IxYzAzYjI2OWY3M2IwMmJmYjc3YmUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogV2VkLCAyOCBBdWcgMjAxOSAxOTo1NjoyOCArMDgwMAotU3ViamVjdDogW1BBVENI
IDAzLzExXSBjb25maWd1cmU6IEFkZCBwa2ctY29uZmlnIGhhbmRsaW5nIGZvciBsaWJnY3J5cHQK
K1N1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBBZGQgcGtnLWNvbmZpZyBoYW5kbGluZyBmb3Ig
bGliZ2NyeXB0CiAKIGxpYmdjcnlwdCBtYXkgYWxzbyBiZSBjb250cm9sbGVkIGJ5IHBrZy1jb25m
aWcsIHRoaXMgcGF0Y2ggYWRkcyBwa2ctY29uZmlnCiBoYW5kbGluZyBmb3IgbGliZ2NyeXB0LgpA
QCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggOTFhMGFhNjRjNi4u
ZTgzNzNkNTViOCAxMDA2NDQKK2luZGV4IDkxYTBhYTY0Yy4uZTgzNzNkNTViIDEwMDY0NAogLS0t
IGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTY1NSw3ICsxNjU1LDcgQEAg
ZW5kaWYKQEAgLTI2LDYgKzI2LDMgQEAgaW5kZXggOTFhMGFhNjRjNi4uZTgzNzNkNTViOCAxMDA2
NDQKICAgICAgICAgICAgICAgICAgICAgICAgICByZXF1aXJlZDogZ2V0X29wdGlvbignZ2NyeXB0
JykpCiAgICAgICMgRGViaWFuIGhhcyByZW1vdmVkIC1sZ3BnLWVycm9yIGZyb20gbGliZ2NyeXB0
LWNvbmZpZwogICAgICAjIGFzIGl0ICJzcHJlYWRzIHVubmVjZXNzYXJ5IGRlcGVuZGVuY2llcyIg
d2hpY2ggaW4KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1p
bmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaAppbmRleCBkOWNhYjQyOGM0Li4xY2MyYTRi
YWQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVt
dS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1u
b3QtZXhpc3RzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA1MjIzZDQ2YThkNTMwMjM5NmY5
ZmM3Y2M1ZDgzMDc2OWU4NzI0MmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YWNh
OTg4ZGJhNzc3MDkyYTk1NzYzYWM2OTM2YzdiOTFjMmQ1Yjc5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogT2xla3NpeSBPYml0b3Rza3l5IDxvb2JpdG90c0BjaXNjby5jb20+CiBEYXRl
OiBXZWQsIDI1IE1hciAyMDIwIDIxOjIxOjM1ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMDQvMTFd
IHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90IGV4aXN0cworU3ViamVjdDogW1BBVENI
XSBxZW11OiBEbyBub3QgaW5jbHVkZSBmaWxlIGlmIG5vdCBleGlzdHMKIAogU2NyaXB0IGNvbmZp
Z3VyZSBjaGVja3MgZm9yIGlmX2FsZy5oIGFuZCBjaGVjayBmYWlsZWQgYnV0CiBpZl9hbGcuaCBz
dGlsbCBpbmNsdWRlZC4KQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogU2FraWIgU2Fq
YWwgPHNha2liLnNhamFsQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9zeXNjYWxsLmMgYi9saW51eC11c2Vy
L3N5c2NhbGwuYwotaW5kZXggM2RmMmI5NGQ5YS4uMThmMDlmMWYwNyAxMDA2NDQKK2luZGV4IDU5
ZmIzZTkxMS4uY2I2NTE0NTlhIDEwMDY0NAogLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKICsr
KyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiBAQCAtMTE2LDcgKzExNiw5IEBACkBAIC0yOSw2ICsy
OSwzIEBAIGluZGV4IDNkZjJiOTRkOWEuLjE4ZjA5ZjFmMDcgMTAwNjQ0CiAgI2luY2x1ZGUgPGxp
bnV4L3J0Yy5oPgogICNpbmNsdWRlIDxzb3VuZC9hc291bmQuaD4KICAjaWZkZWYgSEFWRV9CVFJG
U19ICi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJl
c3MtbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11
LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCmlu
ZGV4IDNjN2Y1Nzc2ZmYuLmIxMjNlMTdhZGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3Mt
dG8tYWRkcmVzcy1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1t
dXNsLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJvbSAxYzI5NTA2OTg1N2I5ODUwZjE1ZjJjZDZi
MzNiMTMzZWE2NDFhNDU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMTZhOWUwNDAx
OTdlY2YxNmM5NWJiYzY1N2FjNWJlMGJhODE0NmFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CiBEYXRlOiBGcmksIDggSmFuIDIwMjEgMTc6Mjc6MDYgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAw
NS8xMV0gcWVtdTogQWRkIHNvbWUgdXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBhZGRyZXNzIG11
c2wKLSAzMiBiaXQKK1N1YmplY3Q6IFtQQVRDSF0gcWVtdTogQWRkIHNvbWUgdXNlciBzcGFjZSBt
bWFwIHR3ZWFrcyB0byBhZGRyZXNzIG11c2wgMzIgYml0CiAKIFdoZW4gdXNpbmcgcWVtdS1pMzg2
IHRvIGJ1aWxkIHFlbXV4ODYgd2Via2l0Z3RrIG9uIG11c2wsIGl0IHNpdHMgaW4gYW4KIGluZmlu
aXRlIGxvb3Agb2YgbXJlbWFwIGNhbGxzIG9mIGV2ZXIgZGVjcmVhc2luZy9pbmNyZWFzaW5nIGFk
ZHJlc3Nlcy4KQEAgLTIzLDcgKzIyLDcgQEAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcKICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9t
bWFwLmMgYi9saW51eC11c2VyL21tYXAuYwotaW5kZXggYmUzYjlhNjhlYi4uNDgxMjg2ZjAxZCAx
MDA2NDQKK2luZGV4IGJlM2I5YTY4ZS4uNDgxMjg2ZjAxIDEwMDY0NAogLS0tIGEvbGludXgtdXNl
ci9tbWFwLmMKICsrKyBiL2xpbnV4LXVzZXIvbW1hcC5jCiBAQCAtMTA2MCwxMiArMTA2MCwxNiBA
QCBhYmlfbG9uZyB0YXJnZXRfbXJlbWFwKGFiaV91bG9uZyBvbGRfYWRkciwgYWJpX3Vsb25nIG9s
ZF9zaXplLApAQCAtNDYsNiArNDUsMyBAQCBpbmRleCBiZTNiOWE2OGViLi40ODEyODZmMDFkIDEw
MDY0NAogICAgICAgICAgcmV0dXJuIC0xOwogICAgICB9CiAgCi0tLSAKLTIuNDQuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1p
bmlzbS1maXhlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1x
ZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCmluZGV4IGYwNzA1NGYxOWEuLmQ0MWFlN2ZiNWUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURl
dGVybWluaXNtLWZpeGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJv
bSA5ZDMyZGY4MGUzM2E3NTQxNjU4ODU4NDk3ZjQ1YmVkMWU1OWUzNjIxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA5NTZmNWVkZjA3Zjg3ODAzODM2NDNlZjY0ZDQ5MWVkM2NmMjcyNDlj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBNb24sIDEgTWFyIDIwMjEgMTM6MDA6
NDcgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAwNi8xMV0gcWVtdTogRGV0ZXJtaW5pc20gZml4ZXMK
K1N1YmplY3Q6IFtQQVRDSF0gcWVtdTogRGV0ZXJtaW5pc20gZml4ZXMKIAogV2hlbiBzb3VyY2Vz
IGFyZSBpbmNsdWRlZCB3aXRoaW4gZGVidWcgaW5mb3JtYXRpb24sIGEgY291cGxlIG9mIGFyZWFz
IG9mIHRoZQogcWVtdSBidWlsZCBhcmUgbm90IHJlcHJvZHVjaWJsZSBkdWUgdG8gZWl0aGVyIGZ1
bGwgYnVpbGRwYXRocyBvciB0aW1lc3RhbXBzLgpAQCAtMTYsNyArMTYsNyBAQCBSUCAyMDIxLzMv
MQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9kZWNvZGV0cmVlLnB5IGIvc2NyaXB0cy9kZWNvZGV0cmVlLnB5Ci1p
bmRleCBlOGI3MmRhM2E5Li41Y2Q4NmIxNDI4IDEwMDY0NAoraW5kZXggZThiNzJkYTNhLi41Y2Q4
NmIxNDIgMTAwNjQ0CiAtLS0gYS9zY3JpcHRzL2RlY29kZXRyZWUucHkKICsrKyBiL3NjcmlwdHMv
ZGVjb2RldHJlZS5weQogQEAgLTE1NTgsNyArMTU1OCw3IEBAIGRlZiBtYWluKCk6CkBAIC0yOCw2
ICsyOCwzIEBAIGluZGV4IGU4YjcyZGEzYTkuLjVjZDg2YjE0MjggMTAwNjQ0CiAgICAgICAgICBm
ID0gb3BlbihmaWxlbmFtZSwgJ3J0JywgZW5jb2Rpbmc9J3V0Zi04JykKICAgICAgICAgIHBhcnNl
X2ZpbGUoZiwgdG9wcGF0KQogICAgICAgICAgZi5jbG9zZSgpCi0tLSAKLTIuNDQuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMtbWVzb24u
YnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRp
dmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCmluZGV4IDc0ZGUxNThiMmUuLjE0OGU1ODFh
YzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0
cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWls
ZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCkBAIC0xLDcgKzEsNyBA
QAotRnJvbSA3N2ViZjY3ZDBjOTZmNTFkYTkxYzg0OTkyMDBlYmQxM2Y0ZGNkZDY4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNzViZDJiNjZjZTM4MjQyZjdkZjllOTkyY2NlYjcxZWYz
MmU3MzkzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFu
Z3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTQgSmFuIDIwMjEgMDY6MzM6MDQg
KzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAwNy8xMV0gdGVzdHMvbWVzb24uYnVpbGQ6IHVzZSByZWxh
dGl2ZSBwYXRoIHRvIHJlZmVyIHRvIGZpbGVzCitTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL21lc29u
LmJ1aWxkOiB1c2UgcmVsYXRpdmUgcGF0aCB0byByZWZlciB0byBmaWxlcwogCiBGaXggZXJyb3Ig
bGlrZToKIEZhdGFsIGVycm9yOiBjYW4ndCBjcmVhdGUgdGVzdHMvcHRpbWVyLXRlc3QucC8uLi5f
cWVtdS01LjIuMF9od19jb3JlX3B0aW1lci5jLm86IEZpbGUgbmFtZSB0b28gbG9uZwpAQCAtMTcs
NyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5k
cml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy91bml0L21lc29uLmJ1aWxkIGIvdGVzdHMvdW5pdC9t
ZXNvbi5idWlsZAotaW5kZXggMjI4YTIxZDAzYy4uMjcyZmI0YzZjYSAxMDA2NDQKK2luZGV4IDIy
OGEyMWQwMy4uMjcyZmI0YzZjIDEwMDY0NAogLS0tIGEvdGVzdHMvdW5pdC9tZXNvbi5idWlsZAog
KysrIGIvdGVzdHMvdW5pdC9tZXNvbi5idWlsZAogQEAgLTQ3LDcgKzQ3LDcgQEAgdGVzdHMgPSB7
CkBAIC0zOCw2ICszOCwzIEBAIGluZGV4IDIyOGEyMWQwM2MuLjI3MmZiNGM2Y2EgMTAwNjQ0CiAg
ICAgICd0ZXN0LXZtc3RhdGUnOiBbbWlncmF0aW9uLCBpb10sCiAgICAgICd0ZXN0LXlhbmsnOiBb
J3NvY2tldC1oZWxwZXJzLmMnLCBxb20sIGlvLCBjaGFyZGV2XQogICAgfQotLS0gCi0yLjQ0LjAK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmlu
ZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1N
QVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaAppbmRleCAyZTI4NTkwZTExLi5i
NDhmMjRmZTk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1B
UF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gMjFiMTU5YTExYmJjYjFlZWIyNmYxMjQ1NmU0YzNmZDYyYTA2Y2JlYyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWNkOGU1ODljMTgzZmU4MDE5YTk5MTg5YzYw
ZWE0ZjE0N2NmZjM0YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIxIE1hciAyMDIyIDEwOjA5OjM4IC0wNzAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMDgvMTFdIERlZmluZSBNQVBfU1lOQyBhbmQgTUFQX1NIQVJFRF9W
QUxJREFURSBvbiBuZWVkZWQgbGludXgKK1N1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIE1BUF9TWU5D
IGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5lZWRlZCBsaW51eAogIHN5c3RlbXMKIAogbGlu
dXggb25seSB3aXJlcyBNQVBfU1lOQyBhbmQgTUFQX1NIQVJFRF9WQUxJREFURSBmb3IgYXJjaGl0
ZWN0dXJlcwpAQCAtMTgsNyArMTgsNyBAQCBDYzogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvdXRpbC9tbWFwLWFsbG9jLmMgYi91dGlsL21tYXAtYWxsb2MuYwot
aW5kZXggZWQxNGY5YzY0ZC4uMDM4ZjViNGI1NSAxMDA2NDQKK2luZGV4IGVkMTRmOWM2NC4uMDM4
ZjViNGI1IDEwMDY0NAogLS0tIGEvdXRpbC9tbWFwLWFsbG9jLmMKICsrKyBiL3V0aWwvbW1hcC1h
bGxvYy5jCiBAQCAtMTAsMTQgKzEwLDE4IEBACkBAIC00Myw2ICs0MywzIEBAIGluZGV4IGVkMTRm
OWM2NGQuLjAzOGY1YjRiNTUgMTAwNjQ0CiAgI2luY2x1ZGUgInFlbXUvbW1hcC1hbGxvYy5oIgog
ICNpbmNsdWRlICJxZW11L2hvc3QtdXRpbHMuaCIKICAjaW5jbHVkZSAicWVtdS9jdXRpbHMuaCIK
LS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwOS1saW51eC11c2VyLVJlcGxhY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQtZnVuY3Rpb25z
LWFuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA5LWxpbnV4LXVz
ZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRlZC1mdW5jdGlvbnMtYW4ucGF0Y2gKaW5kZXgg
NzU3NzI0OWQzOS4uMTQ1NmZkZDM2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA5LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRlZC1m
dW5jdGlvbnMtYW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDA5LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRlZC1mdW5jdGlvbnMtYW4u
cGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDIzZGUzMDA3OWRiZjQ3YTgwMjZmYWRkZDU1MGE5
ZTE4MWQ2MDljOGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdjOGVjMjA3MTU5YmFj
MTYyZmQ3MmYyZmI0NWU4MjIxZDZkYjNhNGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxNyBEZWMgMjAyMiAw
ODozNzo0NiAtMDgwMAotU3ViamVjdDogW1BBVENIIDA5LzExXSBsaW51eC11c2VyOiBSZXBsYWNl
IHVzZSBvZiBsZnM2NCByZWxhdGVkIGZ1bmN0aW9ucyBhbmQKLSBtYWNyb3MKK1N1YmplY3Q6IFtQ
QVRDSF0gbGludXgtdXNlcjogUmVwbGFjZSB1c2Ugb2YgbGZzNjQgcmVsYXRlZCBmdW5jdGlvbnMg
YW5kIG1hY3JvcwogCiBCdWlsZHMgZGVmaW5lcyAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IHdoaWNo
IG1ha2VzIHRoZSBvcmlnaW5hbCBmdW5jdGlvbnMKIGFuZiBtYWNyb3MgYmVoYXZlIHNhbWUgYXMg
dGhlaXIgNjQgc3VmZml4ZWQgY291bnRlcnBhcnRzLiBUaGlzIGFsc28KQEAgLTE3LDcgKzE2LDcg
QEAgQ2M6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KICAxIGZpbGUgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTE0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGlu
dXgtdXNlci9zeXNjYWxsLmMgYi9saW51eC11c2VyL3N5c2NhbGwuYwotaW5kZXggMThmMDlmMWYw
Ny4uMWI3YzUwYTJhNyAxMDA2NDQKK2luZGV4IGNiNjUxNDU5YS4uY2I0NGNjMjFkIDEwMDY0NAog
LS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKICsrKyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiBA
QCAtNzYxLDggKzc2MSw4IEBAIHNhZmVfc3lzY2FsbDYoc3NpemVfdCwgY29weV9maWxlX3Jhbmdl
LCBpbnQsIGluZmQsIGxvZmZfdCAqLCBwaW5vZmYsCkBAIC0zMSw3ICszMCw3IEBAIGluZGV4IDE4
ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICogVGhpcyB3aWxsIHRoZW4gd29yayBhbmQg
dXNlIGEgNjQtYml0IG9mZnNldCBmb3IgYm90aCAzMi1iaXQgYW5kIDY0LWJpdCBob3N0cy4KICAg
Ki8KICAjaWZkZWYgX19OUl9mY250bDY0Ci1AQCAtNjczOSwxMyArNjczOSwxMyBAQCBzdGF0aWMg
aW50IHRhcmdldF90b19ob3N0X2ZjbnRsX2NtZChpbnQgY21kKQorQEAgLTY3MzQsMTMgKzY3MzQs
MTMgQEAgc3RhdGljIGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKICAgICAg
ICAgIHJldCA9IGNtZDsKICAgICAgICAgIGJyZWFrOwogICAgICBjYXNlIFRBUkdFVF9GX0dFVExL
OgpAQCAtNDgsNyArNDcsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAog
ICAgICAgICAgYnJlYWs7CiAgICAgIGNhc2UgVEFSR0VUX0ZfR0VUT1dOOgogICAgICAgICAgcmV0
ID0gRl9HRVRPV047Ci1AQCAtNjc1OSwxNyArNjc1OSw2IEBAIHN0YXRpYyBpbnQgdGFyZ2V0X3Rv
X2hvc3RfZmNudGxfY21kKGludCBjbWQpCitAQCAtNjc1NCwxNyArNjc1NCw2IEBAIHN0YXRpYyBp
bnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQpCiAgICAgIGNhc2UgVEFSR0VUX0Zf
U0VUU0lHOgogICAgICAgICAgcmV0ID0gRl9TRVRTSUc7CiAgICAgICAgICBicmVhazsKQEAgLTY2
LDcgKzY1LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgY2Fz
ZSBUQVJHRVRfRl9TRVRMRUFTRToKICAgICAgICAgIHJldCA9IEZfU0VUTEVBU0U7CiAgICAgICAg
ICBicmVhazsKLUBAIC02ODIxLDggKzY4MTAsOCBAQCBzdGF0aWMgaW50IHRhcmdldF90b19ob3N0
X2ZjbnRsX2NtZChpbnQgY21kKQorQEAgLTY4MTYsOCArNjgwNSw4IEBAIHN0YXRpYyBpbnQgdGFy
Z2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQpCiAgICAgICAqIHRoZW0gdG8gNSwgNiBhbmQg
NyBiZWZvcmUgbWFraW5nIHRoZSBzeXNjYWxsKCkuIFNpbmNlIHdlIG1ha2UgdGhlCiAgICAgICAq
IHN5c2NhbGwgZGlyZWN0bHksIGFkanVzdCB0byB3aGF0IGlzIHN1cHBvcnRlZCBieSB0aGUga2Vy
bmVsLgogICAgICAgKi8KQEAgLTc3LDcgKzc2LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUw
YTJhNyAxMDA2NDQKICAgICAgfQogICNlbmRpZgogIAotQEAgLTY4NTUsNTUgKzY4NDQsMTEgQEAg
c3RhdGljIGludCBob3N0X3RvX3RhcmdldF9mbG9jayhpbnQgdHlwZSkKK0BAIC02ODUwLDU1ICs2
ODM5LDExIEBAIHN0YXRpYyBpbnQgaG9zdF90b190YXJnZXRfZmxvY2soaW50IHR5cGUpCiAgICAg
IHJldHVybiB0eXBlOwogIH0KICAKQEAgLTEzNiw3ICsxMzUsNyBAQCBpbmRleCAxOGYwOWYxZjA3
Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBhYmlfc2hvcnQgbF90eXBlOwogICAgICBhYmlfc2hv
cnQgbF93aGVuY2U7CiAgICAgIGFiaV9sbG9uZyBsX3N0YXJ0OwotQEAgLTY5MTEsMTAgKzY4NTYs
MTAgQEAgc3RydWN0IHRhcmdldF9vYWJpX2Zsb2NrNjQgeworQEAgLTY5MDYsMTAgKzY4NTEsMTAg
QEAgc3RydWN0IHRhcmdldF9vYWJpX2Zsb2NrNjQgewogICAgICBhYmlfaW50ICAgbF9waWQ7CiAg
fSBRRU1VX1BBQ0tFRDsKICAKQEAgLTE0OSw3ICsxNDgsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICBpbnQgbF90eXBlOwogIAogICAgICBpZiAoIWxvY2tfdXNl
cl9zdHJ1Y3QoVkVSSUZZX1JFQUQsIHRhcmdldF9mbCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDEpKSB7
Ci1AQCAtNjkzNSwxMCArNjg4MCwxMCBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfZnJv
bV91c2VyX29hYmlfZmxvY2s2NChzdHJ1Y3QgZmxvY2s2NCAqZmwsCitAQCAtNjkzMCwxMCArNjg3
NSwxMCBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfZnJvbV91c2VyX29hYmlfZmxvY2s2
NChzdHJ1Y3QgZmxvY2s2NCAqZmwsCiAgICAgIHJldHVybiAwOwogIH0KICAKQEAgLTE2Myw3ICsx
NjIsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBzaG9ydCBs
X3R5cGU7CiAgCiAgICAgIGlmICghbG9ja191c2VyX3N0cnVjdChWRVJJRllfV1JJVEUsIHRhcmdl
dF9mbCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDApKSB7Ci1AQCAtNjk1NiwxMCArNjkwMSwxMCBAQCBz
dGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfdG9fdXNlcl9vYWJpX2Zsb2NrNjQoYWJpX3Vsb25n
IHRhcmdldF9mbG9ja19hZGRyLAorQEAgLTY5NTEsMTAgKzY4OTYsMTAgQEAgc3RhdGljIGlubGlu
ZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfb2FiaV9mbG9jazY0KGFiaV91bG9uZyB0YXJnZXRfZmxv
Y2tfYWRkciwKICB9CiAgI2VuZGlmCiAgCkBAIC0xNzYsNyArMTc1LDcgQEAgaW5kZXggMThmMDlm
MWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgaW50IGxfdHlwZTsKICAKICAgICAgaWYgKCFs
b2NrX3VzZXJfc3RydWN0KFZFUklGWV9SRUFELCB0YXJnZXRfZmwsIHRhcmdldF9mbG9ja19hZGRy
LCAxKSkgewotQEAgLTY5ODAsMTAgKzY5MjUsMTAgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBj
b3B5X2Zyb21fdXNlcl9mbG9jazY0KHN0cnVjdCBmbG9jazY0ICpmbCwKK0BAIC02OTc1LDEwICs2
OTIwLDEwIEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV9mcm9tX3VzZXJfZmxvY2s2NChz
dHJ1Y3QgZmxvY2s2NCAqZmwsCiAgICAgIHJldHVybiAwOwogIH0KICAKQEAgLTE5MCw3ICsxODks
NyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBzaG9ydCBsX3R5
cGU7CiAgCiAgICAgIGlmICghbG9ja191c2VyX3N0cnVjdChWRVJJRllfV1JJVEUsIHRhcmdldF9m
bCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDApKSB7Ci1AQCAtNzAwMiw3ICs2OTQ3LDcgQEAgc3RhdGlj
IGlubGluZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfZmxvY2s2NChhYmlfdWxvbmcgdGFyZ2V0X2Zs
b2NrX2FkZHIsCitAQCAtNjk5Nyw3ICs2OTQyLDcgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBj
b3B5X3RvX3VzZXJfZmxvY2s2NChhYmlfdWxvbmcgdGFyZ2V0X2Zsb2NrX2FkZHIsCiAgCiAgc3Rh
dGljIGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJpX3Vsb25nIGFyZykKICB7
CkBAIC0xOTksNyArMTk4LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQK
ICAjaWZkZWYgRl9HRVRPV05fRVgKICAgICAgc3RydWN0IGZfb3duZXJfZXggZm94OwogICAgICBz
dHJ1Y3QgdGFyZ2V0X2Zfb3duZXJfZXggKnRhcmdldF9mb3g7Ci1AQCAtNzAxNSw2ICs2OTYwLDcg
QEAgc3RhdGljIGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJpX3Vsb25nIGFy
ZykKK0BAIC03MDEwLDYgKzY5NTUsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZk
LCBpbnQgY21kLCBhYmlfdWxvbmcgYXJnKQogIAogICAgICBzd2l0Y2goY21kKSB7CiAgICAgIGNh
c2UgVEFSR0VUX0ZfR0VUTEs6CkBAIC0yMDcsNyArMjA2LDcgQEAgaW5kZXggMThmMDlmMWYwNy4u
MWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgIHJldCA9IGNvcHlfZnJvbV91c2VyX2Zsb2NrKCZm
bDY0LCBhcmcpOwogICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgIHJldHVybiByZXQ7
Ci1AQCAtNzAyNCwzMiArNjk3MCwxMSBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZk
LCBpbnQgY21kLCBhYmlfdWxvbmcgYXJnKQorQEAgLTcwMTksMzIgKzY5NjUsMTEgQEAgc3RhdGlj
IGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJpX3Vsb25nIGFyZykKICAgICAg
ICAgICAgICByZXQgPSBjb3B5X3RvX3VzZXJfZmxvY2soYXJnLCAmZmw2NCk7CiAgICAgICAgICB9
CiAgICAgICAgICBicmVhazsKQEAgLTI0MSw3ICsyNDAsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgIHJldHVy
biByZXQ7CiAgICAgICAgICB9Ci1AQCAtNzI3OCw3ICs3MjAzLDcgQEAgc3RhdGljIGlubGluZSBh
YmlfbG9uZyB0YXJnZXRfdHJ1bmNhdGU2NChDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGNvbnN0IGNo
YXIgKmFyZzEKK0BAIC03MjczLDcgKzcxOTgsNyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIHRh
cmdldF90cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgY29uc3QgY2hhciAqYXJnMQog
ICAgICAgICAgYXJnMiA9IGFyZzM7CiAgICAgICAgICBhcmczID0gYXJnNDsKICAgICAgfQpAQCAt
MjUwLDcgKzI0OSw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgfQog
ICNlbmRpZgogIAotQEAgLTcyOTIsNyArNzIxNyw3IEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcg
dGFyZ2V0X2Z0cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgYWJpX2xvbmcgYXJnMSwK
K0BAIC03Mjg3LDcgKzcyMTIsNyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIHRhcmdldF9mdHJ1
bmNhdGU2NChDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICBh
cmcyID0gYXJnMzsKICAgICAgICAgIGFyZzMgPSBhcmc0OwogICAgICB9CkBAIC0yNTksNyArMjU4
LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICB9CiAgI2VuZGlmCiAg
Ci1AQCAtODY2Nyw3ICs4NTkyLDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBk
aXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCitAQCAtODY2Miw3ICs4NTg3LDcg
QEAgc3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwg
YWJpX2xvbmcgY291bnQpCiAgICAgIHZvaWQgKnRkaXJwOwogICAgICBpbnQgaGxlbiwgaG9mZiwg
dG9mZjsKICAgICAgaW50IGhyZWNsZW4sIHRyZWNsZW47CkBAIC0yNjgsNyArMjY3LDcgQEAgaW5k
ZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAKICAgICAgaGRpcnAgPSBnX3RyeV9t
YWxsb2MoY291bnQpOwogICAgICBpZiAoIWhkaXJwKSB7Ci1AQCAtODcyMCw3ICs4NjQ1LDcgQEAg
c3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJp
X2xvbmcgY291bnQpCitAQCAtODcxNSw3ICs4NjQwLDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50
cyhhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCiAgICAgICAg
ICAgICAgICogUmV0dXJuIHdoYXQgd2UgaGF2ZSwgcmVzZXR0aW5nIHRoZSBmaWxlIHBvaW50ZXIg
dG8gdGhlCiAgICAgICAgICAgICAgICogbG9jYXRpb24gb2YgdGhlIGZpcnN0IHJlY29yZCBub3Qg
cmV0dXJuZWQuCiAgICAgICAgICAgICAgICovCkBAIC0yNzcsNyArMjc2LDcgQEAgaW5kZXggMThm
MDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgICAgICBicmVhazsKICAgICAgICAg
IH0KICAKLUBAIC04NzU0LDcgKzg2NzksNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzNjQoYWJp
X2xvbmcgZGlyZmQsIGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNvdW50KQorQEAgLTg3NDksNyAr
ODY3NCw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJmZCwgYWJpX2xv
bmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCiAgICAgIHZvaWQgKnRkaXJwOwogICAgICBpbnQgaGxl
biwgaG9mZiwgdG9mZjsKICAgICAgaW50IGhyZWNsZW4sIHRyZWNsZW47CkBAIC0yODYsNyArMjg1
LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAKICAgICAgaGRpcnAg
PSBnX3RyeV9tYWxsb2MoY291bnQpOwogICAgICBpZiAoIWhkaXJwKSB7Ci1AQCAtODc5Niw3ICs4
NzIxLDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50czY0KGFiaV9sb25nIGRpcmZkLCBhYmlfbG9u
ZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKK0BAIC04NzkxLDcgKzg3MTYsNyBAQCBzdGF0aWMgaW50
IGRvX2dldGRlbnRzNjQoYWJpX2xvbmcgZGlyZmQsIGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNv
dW50KQogICAgICAgICAgICAgICAqIFJldHVybiB3aGF0IHdlIGhhdmUsIHJlc2V0dGluZyB0aGUg
ZmlsZSBwb2ludGVyIHRvIHRoZQogICAgICAgICAgICAgICAqIGxvY2F0aW9uIG9mIHRoZSBmaXJz
dCByZWNvcmQgbm90IHJldHVybmVkLgogICAgICAgICAgICAgICAqLwpAQCAtMjk1LDcgKzI5NCw3
IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICAgICAgYnJl
YWs7CiAgICAgICAgICB9CiAgCi1AQCAtMTE1MjcsNyArMTE0NTIsNyBAQCBzdGF0aWMgYWJpX2xv
bmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBh
cmcxLAorQEAgLTExNTIyLDcgKzExNDQ3LDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwx
KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1UQVJHRVRfRUZBVUxUOwogICAgICAgICAgICAgIH0KICAgICAgICAg
IH0KQEAgLTMwNCw3ICszMDMsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0
NAogICAgICAgICAgdW5sb2NrX3VzZXIocCwgYXJnMiwgcmV0KTsKICAgICAgICAgIHJldHVybiBy
ZXQ7CiAgICAgIGNhc2UgVEFSR0VUX05SX3B3cml0ZTY0OgotQEAgLTExNTQ0LDcgKzExNDY5LDcg
QEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50
IG51bSwgYWJpX2xvbmcgYXJnMSwKK0BAIC0xMTUzOSw3ICsxMTQ2NCw3IEBAIHN0YXRpYyBhYmlf
bG9uZyBkb19zeXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25n
IGFyZzEsCiAgICAgICAgICAgICAgICAgIHJldHVybiAtVEFSR0VUX0VGQVVMVDsKICAgICAgICAg
ICAgICB9CiAgICAgICAgICB9CkBAIC0zMTMsNyArMzEyLDcgQEAgaW5kZXggMThmMDlmMWYwNy4u
MWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgIHVubG9ja191c2VyKHAsIGFyZzIsIDApOwogICAg
ICAgICAgcmV0dXJuIHJldDsKICAjZW5kaWYKLUBAIC0xMjQwNCwxNCArMTIzMjksMTQgQEAgc3Rh
dGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwg
YWJpX2xvbmcgYXJnMSwKK0BAIC0xMjM5OSwxNCArMTIzMjQsMTQgQEAgc3RhdGljIGFiaV9sb25n
IGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJn
MSwKICAgICAgY2FzZSBUQVJHRVRfTlJfZmNudGw2NDoKICAgICAgewogICAgICAgICAgaW50IGNt
ZDsKQEAgLTMzMyw3ICszMzIsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0
NAogICAgICAgICAgfQogICNlbmRpZgogIAotQEAgLTEyNDIxLDcgKzEyMzQ2LDcgQEAgc3RhdGlj
IGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJp
X2xvbmcgYXJnMSwKK0BAIC0xMjQxNiw3ICsxMjM0MSw3IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19z
eXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAg
ICAgICAgICB9CiAgCiAgICAgICAgICBzd2l0Y2goYXJnMikgewpAQCAtMzQyLDcgKzM0MSw3IEBA
IGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICAgICAgcmV0ID0g
Y29weWZyb20oJmZsLCBhcmczKTsKICAgICAgICAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAg
ICAgICAgIGJyZWFrOwotQEAgLTEyNDMyLDggKzEyMzU3LDggQEAgc3RhdGljIGFiaV9sb25nIGRv
X3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwK
K0BAIC0xMjQyNyw4ICsxMjM1Miw4IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxsMShDUFVB
cmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICAgICAg
fQogIAkgICAgYnJlYWs7CiAgCkBAIC0zNTMsNiArMzUyLDMgQEAgaW5kZXggMThmMDlmMWYwNy4u
MWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgICAgICByZXQgPSBjb3B5ZnJvbSgmZmwsIGFyZzMp
OwogICAgICAgICAgICAgIGlmIChyZXQpIHsKICAgICAgICAgICAgICAgICAgYnJlYWs7Ci0tLSAK
LTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1l
eHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKaW5kZXggOThjZTg1YThjZi4uNjMyY2FjNmVkNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1s
b29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZy
b20tUEFUSC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZTEyYTkzMTc0ZjliNjUyNjA0ZGRh
OGQ4NDY0Yjk1NTliNjJiMjlkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTcwNTk1
MDMyN2RmZDJmNzA5ZTI5YmFmYjZhZWQ5YWRmYTBlYmNlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9QjhsbD89IDxtYXJ0aW5AZ2Vh
bml4LmNvbT4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTQ6MDI6NTUgKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSCAxMC8xMV0gY29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUgZnJvbSBQQVRI
CitTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogbG9va3VwIG1lc29uIGV4dXRhYmxlIGZyb20g
UEFUSAogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3dvcmthcm91bmQsIHdvdWxk
IG5lZWQgYSByZWFsIGZpeCBmb3IgdXBzdHJlYW1dCiAtLS0KQEAgLTksMTAgKzksMTAgQEAgVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt3b3JrYXJvdW5kLCB3b3VsZCBuZWVkIGEgcmVh
bCBmaXggZm9yIHVwc3RyZWFtXQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXgg
M2NkNzM2YjEzOS4uNDgyYTFmOGVmMyAxMDA3NTUKK2luZGV4IDBhZWE5YjExMy4uYzI4YmQ0N2I0
IDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiArKysgYi9jb25maWd1cmUKLUBAIC05NTYsMTIgKzk1
Niw3IEBAIGZpCitAQCAtOTY1LDEyICs5NjUsNyBAQCBmaQogICRta3ZlbnYgZW5zdXJlZ3JvdXAg
LS1kaXIgIiR7c291cmNlX3BhdGh9L3B5dGhvbi93aGVlbHMiIFwKICAgICAgICR7c291cmNlX3Bh
dGh9L3B5dGhvbmRlcHMudG9tbCBtZXNvbiB8fCBleGl0IDEKICAKQEAgLTI2LDYgKzI2LDMgQEAg
aW5kZXggM2NkNzM2YjEzOS4uNDgyYTFmOGVmMyAxMDA3NTUKICAKICAjIENvbmRpdGlvbmFsbHkg
ZW5zdXJlIFNwaGlueCBpcyBpbnN0YWxsZWQuCiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFu
ZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVu
di1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCmluZGV4IGM3YmI5YjFiNDcuLjJkMDgyY2YzOGYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3Vy
ZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRo
ZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJv
bSBhOTNjMmE2YjJjOWRiOWM0YmQzMDI5OGRhNDNjMzdjNWU1YzYyMzZlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBhMDJlNGZhNzk3NDBkOWVjYjgyZDExNjI2MDhmYjYzYmU4MDkwNmJm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDEzOjU4
OjIzICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMTEvMTFdIHFlbXU6IEVuc3VyZSBwaXAgYW5kIHRo
ZSBweXRob24gdmVudiBhcmVuJ3QgdXNlZCBmb3IKLSBtZXNvbgorU3ViamVjdDogW1BBVENIXSBx
ZW11OiBFbnN1cmUgcGlwIGFuZCB0aGUgcHl0aG9uIHZlbnYgYXJlbid0IHVzZWQgZm9yIG1lc29u
CiAKIFFlbXUgd2FudHMgdG8gdXNlIGEgc3VwcG9ydGVkIHB5dGhvbiB2ZXJzaW9uIGFuZCBhIHNw
ZWNpZmljIG1lc29uIHZlcnNpb24KIHRvICJoZWxwIiB1c2VycyBhbmQgdXNlcyBwaXAgYW5kIGNy
ZWF0ZXMgYSB2ZW52IHRvIGRvIHRoaXMuIFRoaXMgaXMgYSBuaWdodG1hcmUKQEAgLTMwLDEwICsy
OSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCA0
ODJhMWY4ZWYzLi4wZGE0YmYzZTRkIDEwMDc1NQoraW5kZXggYzI4YmQ0N2I0Li4zM2I4OWIyMzYg
MTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTkzOCwxNCArOTM4
LDE0IEBAIHB5dGhvbj0iJChjb21tYW5kIC12ICIkcHl0aG9uIikiCitAQCAtOTQ3LDE0ICs5NDcs
MTQgQEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24iKSIKICBlY2hvICJweXRob24gZGV0
ZXJtaW5lZCB0byBiZSAnJHB5dGhvbiciCiAgZWNobyAicHl0aG9uIHZlcnNpb246ICQoJHB5dGhv
biAtLXZlcnNpb24pIgogIApAQCAtNTAsNiArNDksMyBAQCBpbmRleCA0ODJhMWY4ZWYzLi4wZGE0
YmYzZTRkIDEwMDc1NQogIAogICMgRmluaXNoIHByZXBhcmluZyB0aGUgdmlydHVhbCBlbnZpcm9u
bWVudCB1c2luZyB2ZW5kb3JlZCAud2hsIGZpbGVzCiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzkuMC4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjAuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjAuMS5iYgotLSAKMi40NC4wCgo=

--===============0031852133080243050==--

