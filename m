Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D8CC3DA7E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2174.1719853075723288125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dsxlURov;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oLP8po6A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101906f3b4d75-5b58f354-74c4-4476-b8f4-073ba58adb8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e9G8vCZUnTLEqMdXXFvr2dtLlc0I78XGsMrReeCz2Es=;
	b=dsxlURovOI6895hN65sZ3iXT8iwiLeiN04uoJglYvUhZn8zf29HGB0y/NGkKS02P
	/AbluHex74XPka+naeA/wZF2p7hPgGvkMQmU0vxaxg09M8V/hC4KJIq/kF2/UoafRti
	AGYBsriXup3XTHKVo31X+x0UQ8H4zxpeVaf9+TJk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e9G8vCZUnTLEqMdXXFvr2dtLlc0I78XGsMrReeCz2Es=;
	b=oLP8po6AuecedI3Ck4BVF6lNR4SgNsXLFCafJ+HE7ReM03kydXZZPWXmRbZUqscv
	SLlABzMvuhEfcGdWV/IZr0Ur5oYOJ8OXqhnLGVs8puOMnptmGfxWTg/wLf2l4DgK2LG
	nHWyk8ljn/2SlUqwsTPf0Z9RuLpGOcw648G+tWa8=
Content-Type: multipart/mixed; boundary="===============8981836988716894890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 9.0.1 FAILED
Message-ID: <010101906f3b4d75-5b58f354-74c4-4476-b8f4-073ba58adb8e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201336

--===============8981836988716894890==
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
From 80ab0203cf2afbc3a3305038f0c156a5cfe46762 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 09:25:46 +0000
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
index 2333cc8432..f6dbef4838 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00 2001
+From c4e354a8242574c629e670e4f22f99ddd92bec39 Mon Sep 17 00:00:00 2001
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
index 5f8fe4faa3..a6fb6894c7 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00 2001
+From ef7c7654c919687f48472cececd5774f669d7a4b Mon Sep 17 00:00:00 2001
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
index 30e269f8f4..6f4923f035 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From e4f6c6b9f43b28271bc9dc6cbcafad53f80387e0 Mon Sep 17 00:00:00 2001
+From 88b699fd09221de73e48ae6f170a6806b43c9c37 Mon Sep 17 00:00:00 2001
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
index d9cab428c4..e044ac3f80 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00 2001
+From a5eb32e7f89674ba07a81497ffad1ae98f3787a2 Mon Sep 17 00:00:00 2001
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
index 3c7f5776ff..37342085fe 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,8 +1,7 @@
-From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00 2001
+From 0908fda08f3f9093293d1cecf4bf34601072c1ed Mon Sep 17 00:00:00 2001
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
index f07054f19a..47fc27cc5f 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00 2001
+From cc235ad9f8042aa26b6aba1d7b585b218da116b8 Mon Sep 17 00:00:00 2001
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
index 74de158b2e..863778223c 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00 2001
+From b1bb50db64486476753752d1f506931ffbffa0c1 Mon Sep 17 00:00:00 2001
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
index 2e28590e11..0157640de4 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00 2001
+From 12a0243263202489d0931f01be60fe8ccdded824 Mon Sep 17 00:00:00 2001
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
index 7577249d39..a1ff57bba6 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,8 +1,7 @@
-From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00 2001
+From 751d273f453837a00b64fb241e1fa9362a1e1849 Mon Sep 17 00:00:00 2001
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
index 98ce85a8cf..528aedb78c 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,7 +1,7 @@
-From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00 2001
+From 28961dd2fe93903e282b6ff8251076f8d4eca3be Mon Sep 17 00:00:00 2001
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
index c7bb9b1b47..3aeffeacb6 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,8 +1,7 @@
-From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00 2001
+From a8bbc227c9824875ba69b2c69702ee279e33b859 Mon Sep 17 00:00:00 2001
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


--===============8981836988716894890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (915 cached, 3 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-f3cf8229a0996f978783e2d305d0ed79bafa99db"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f3cf8229a0996f978783e2d305d0ed79bafa99db"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 535 Local 344 Mirrors 0 Missed 191 Current 592 (64% match, 83% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 44 stale sstate objects for arch qemux86_64...done.
Removing 86 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 689 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 765 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 779 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 783 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 784 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 786 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 837 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 839 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 844 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 847 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 848 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 852 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 857 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 860 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 865 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 872 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 873 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 877 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 883 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 884 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 891 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 905 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 908 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 912 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 926 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 927 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 930 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 933 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 934 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 935 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_255.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1028 of 1127 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-native-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1067 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1070 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-native-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1078 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1106 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1112 of 1127 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 830 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch)
NOTE: Running task 854 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 981 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_write_config)
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
WARNING: qemu-native-9.0.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-9.0.0-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz_bad-checksum_32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running task 1171 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_unpack)
NOTE: Running task 1189 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 1191 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 1194 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: Running task 1200 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Started
NOTE: Running task 1249 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: Running task 1262 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1273 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_write_config)
NOTE: Running task 1285 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_write_config)
NOTE: Running task 1301 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1302 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1305 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: Running task 1405 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_fetch)
NOTE: Running task 1416 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: Running task 1420 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Started
NOTE: Running task 1421 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1422 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Succeeded
NOTE: Running task 1423 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1424 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_unpack)
NOTE: Running task 1425 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1426 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1427 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1428 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1441 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_fetch)
NOTE: Running task 1443 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1445 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1447 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1450 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_unpack)
NOTE: Running task 1471 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: Running task 1474 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Started
NOTE: Running task 1550 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1551 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1580 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1582 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running task 1583 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1585 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_patch)
NOTE: Running task 1586 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: Running task 1593 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: Running task 1594 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1595 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1600 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 1622 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_patch: Started
NOTE: Running task 1636 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_warn_musl)
NOTE: Running task 1637 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1664 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: Running task 1668 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: Running task 1689 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Started
NOTE: Running task 1690 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe wayland-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1693 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1708 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Started
NOTE: recipe systemd-1_255.6-r0: task do_warn_musl: Succeeded
NOTE: Running task 1737 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1739 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe systemd-1_255.6-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: Running task 1820 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: Running task 1821 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: Running task 1826 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 1828 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1839 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1840 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: Running task 1869 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1870 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_fetch: Succeeded
NOTE: Running task 1871 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1872 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_unpack)
NOTE: Running task 1873 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1874 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: Running task 1876 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.120-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1877 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.120-r0: task do_fetch: Succeeded
NOTE: Running task 1878 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 1884 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1886 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1906 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: Running task 1913 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1929 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_unpack)
NOTE: Running task 1936 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Succeeded
NOTE: Running task 1955 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_unpack)
NOTE: Running task 1962 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 1963 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1964 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 1966 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.120-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 1967 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1996 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Succeeded
NOTE: Running task 2041 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_patch)
NOTE: Running task 2050 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_fetch)
NOTE: Running task 2052 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 2053 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2055 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 2056 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.120-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2057 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_patch)
NOTE: Running task 2058 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Started
NOTE: recipe bluez5-5.72-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: Running task 2071 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2074 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_write_config)
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2075 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: Running task 2093 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_unpack)
NOTE: recipe libdrm-2.4.120-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.120-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2246 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 2264 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_write_config)
NOTE: recipe libdrm-2.4.120-r0: task do_write_config: Started
NOTE: Running task 2274 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 2275 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: Running task 2280 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_recipe_qa)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2371 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 2372 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: recipe libdrm-2.4.120-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Succeeded
NOTE: Running task 2408 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: recipe qemu-9.0.1-r0: task do_recipe_qa: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2557 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_patch)
NOTE: Running task 2565 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: Running task 2631 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_unpack: Succeeded
NOTE: Running task 2632 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_patch)
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2634 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2635 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe qemu-9.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2636 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe qemu-9.0.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_patch: Succeeded
NOTE: Running task 2638 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_generate_toolchain_file)
NOTE: recipe qemu-9.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2640 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2641 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe qemu-9.0.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Started
NOTE: recipe systemd-1_255.6-r0: task do_unpack: Succeeded
NOTE: Running task 2643 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.6.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2645 of 3089 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe systemd-1_255.6-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.6-r0: task do_patch: Succeeded
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
NOTE: recipe qemu-9.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_populate_lic unihash changed to 1a756c371f2c35bda6db9bd52432316b32b281de1514c2ceb7df45081a670f11
NOTE: recipe qemu-9.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.1.bb:do_deploy_source_date_epoch unihash changed to 5143787a5a43aed8087340879ebaf49b6f8bd421d52ea81c17d194d12b5bd396
NOTE: recipe qemu-native-9.0.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 2650 tasks of which 2525 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701092520.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701092520.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-9.0.0-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-9.0.0.tar.xz
ERROR: qemu-native-9.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-9.0.0.tar.xz\' has sha256 checksum \'32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69\' when \'d0f4db0fbd151c0cf16f84aeb2a500f6e95009732546f44dafab8d2049bbb805\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-9.0.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/qemu-native/9.0.0/temp/log.do_fetch.2535477
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb:do_fetch) failed with exit code '1'

--===============8981836988716894890==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-9.0.0-9.0.1.patch"

RnJvbSA4MGFiMDIwM2NmMmFmYmMzYTMzMDUwMzhmMGMxNTZhNWNmZTQ2NzYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwOToyNTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXU6IHVwZ3JhZGUgOS4wLjAgLT4gOS4wLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMgICAgICAgICAgIHwgIDIgKy0KIC4uLm4tZW52aXJvbm1lbnQtc3BhY2UtdG8t
Ym9vdC1sb2FkZXItcS5wYXRjaCB8ICA5ICsrLS0KIC4uLi8wMDAyLWFwaWMtZml4dXAtZmFsbHRo
cm91Z2gtdG8tUElDLnBhdGNoICB8ICA5ICsrLS0KIC4uLmRkLXBrZy1jb25maWctaGFuZGxpbmct
Zm9yLWxpYmdjcnlwdC5wYXRjaCB8ICA5ICsrLS0KIC4uLm11LURvLW5vdC1pbmNsdWRlLWZpbGUt
aWYtbm90LWV4aXN0cy5wYXRjaCB8ICA5ICsrLS0KIC4uLmVyLXNwYWNlLW1tYXAtdHdlYWtzLXRv
LWFkZHJlc3MtbXVzbC5wYXRjaCB8IDEwICsrLS0KIC4uLi9xZW11LzAwMDYtcWVtdS1EZXRlcm1p
bmlzbS1maXhlcy5wYXRjaCAgICB8ICA5ICsrLS0KIC4uLmQtdXNlLXJlbGF0aXZlLXBhdGgtdG8t
cmVmZXItdG8tZmlsZS5wYXRjaCB8ICA5ICsrLS0KIC4uLmFuZC1NQVBfU0hBUkVEX1ZBTElEQVRF
LW9uLW5lZWRlZC1saS5wYXRjaCB8ICA5ICsrLS0KIC4uLmNlLXVzZS1vZi1sZnM2NC1yZWxhdGVk
LWZ1bmN0aW9ucy1hbi5wYXRjaCB8IDU0ICsrKysrKysrKy0tLS0tLS0tLS0KIC4uLmd1cmUtbG9v
a3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaCB8IDExICsrLS0KIC4uLmFuZC10aGUt
cHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCB8IDEyICsrLS0tCiAuLi4vcWVtdS97
cWVtdV85LjAuMC5iYiA9PiBxZW11XzkuMC4xLmJifSAgICAgfCAgMAogMTMgZmlsZXMgY2hhbmdl
ZCwgNTggaW5zZXJ0aW9ucygrKSwgOTQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUve3FlbXVfOS4wLjAuYmIgPT4gcWVtdV85LjAuMS5iYn0gKDEwMCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwppbmRleCBmYjM4ZmI0NGRlLi42YTVhYjU2NDM2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYworKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwpAQCAtMzcsNyArMzcsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54eiBcCiAg
ICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjcwOGFjNjZjMzBkOGM4OTI2
MzNlYTk2OGM3NzFjMWM3NmQ1OTdkNzBkZGVhZDIxYTBkMjJjY2YzODZkYTY5IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImQwZjRkYjBmYmQxNTFjMGNmMTZmODRhZWIyYTUwMGY2ZTk1MDA5NzMyNTQ2
ZjQ0ZGFmYWI4ZDIwNDliYmI4MDUiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMDk5OF0gPSAibm90
LWFwcGxpY2FibGUtY29uZmlnOiBUaGUgVk5DIHNlcnZlciBjYW4gZXhwb3NlIGhvc3QgZmlsZXMg
dWRlciBzb21lIGNpcmN1bXN0YW5jZXMuIFdlIGRvbid0IGVuYWJsZSBpdCBieSBkZWZhdWx0LiIK
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUt
QWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52
aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaAppbmRleCAyMzMzY2M4NDMyLi5m
NmRiZWY0ODM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQt
YWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaApAQCAtMSw3
ICsxLDcgQEAKLUZyb20gZTliYWYwN2E2NjdhMWMwNGI1N2UxNDc3NmNjNGZhMzg3NDQ4YzkwOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzRlMzU0YTgyNDI1NzRjNjI5ZTY3MGU0ZjIy
Zjk5ZGRkOTJiZWMzOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEphc29uIFdlc3Nl
bCA8amFzb24ud2Vzc2VsQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDI4IE1hciAyMDE0IDE3
OjQyOjQzICswODAwCi1TdWJqZWN0OiBbUEFUQ0ggMDEvMTFdIHFlbXU6IEFkZCBhZGRpdGlvbiBl
bnZpcm9ubWVudCBzcGFjZSB0byBib290IGxvYWRlcgorU3ViamVjdDogW1BBVENIXSBxZW11OiBB
ZGQgYWRkaXRpb24gZW52aXJvbm1lbnQgc3BhY2UgdG8gYm9vdCBsb2FkZXIKICBxZW11LXN5c3Rl
bS1taXBzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSAtIE9FIHVzZXMgZGVlcCBw
YXRocwpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb3kgTGkgPHJvbmdxaW5nLmxp
QHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9ody9taXBzL21hbHRhLmMgYi9ody9taXBzL21hbHRhLmMK
LWluZGV4IGFmNzQwMDhjODIuLmE1ODhiOWFkNGUgMTAwNjQ0CitpbmRleCBhZjc0MDA4YzguLmE1
ODhiOWFkNCAxMDA2NDQKIC0tLSBhL2h3L21pcHMvbWFsdGEuYwogKysrIGIvaHcvbWlwcy9tYWx0
YS5jCiBAQCAtNjMsNyArNjMsNyBAQApAQCAtMzAsNiArMzAsMyBAQCBpbmRleCBhZjc0MDA4Yzgy
Li5hNTg4YjlhZDRlIDEwMDY0NAogIAogIC8qIEhhcmR3YXJlIGFkZHJlc3NlcyAqLwogICNkZWZp
bmUgRkxBU0hfQUREUkVTUyAgICAgICAweDFlMDAwMDAwVUxMCi0tLSAKLTIuNDQuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1m
YWxsdGhyb3VnaC10by1QSUMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKaW5kZXggNWY4ZmU0ZmFh
My4uYTZmYjY4OTRjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJ
Qy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMjNiZjUzNGU0NjNiZjRjMWJhMmUxMzU2ZWFm
MTdiZTBiMjNiMTkyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWY3Yzc2NTRjOTE5
Njg3ZjQ4NDcyY2VjZWNkNTc3NGY2NjlkN2E0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IE1hcmsgQXNzZWxzdGluZSA8bWFyay5hc3NlbHN0aW5lQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBUdWUsIDI2IEZlYiAyMDEzIDExOjQzOjI4IC0wNTAwCi1TdWJqZWN0OiBbUEFUQ0ggMDIvMTFd
IGFwaWM6IGZpeHVwIGZhbGx0aHJvdWdoIHRvIFBJQworU3ViamVjdDogW1BBVENIXSBhcGljOiBm
aXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKIAogQ29tbWl0IDBlMjFlMTJiYjMxMWM0YzEwOTVkMDI2
OWRjMmVmODExOTZjY2I2MGEgW0Rvbid0IHJvdXRlIFBJQwogaW50ZXJydXB0cyB0aHJvdWdoIHRo
ZSBsb2NhbCBBUElDIGlmIHRoZSBsb2NhbCBBUElDIGNvbmZpZyBzYXlzIHNvLl0KQEAgLTI5LDcg
KzI5LDcgQEAgU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUuaGVAd2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2h3L2ludGMvYXBpYy5jIGIvaHcvaW50Yy9hcGljLmMKLWluZGV4IDQxODZjNTdiMzQuLjQz
Y2Q4MDVhOTYgMTAwNjQ0CitpbmRleCA0MTg2YzU3YjMuLjQzY2Q4MDVhOSAxMDA2NDQKIC0tLSBh
L2h3L2ludGMvYXBpYy5jCiArKysgYi9ody9pbnRjL2FwaWMuYwogQEAgLTc1OSw3ICs3NTksNyBA
QCBpbnQgYXBpY19hY2NlcHRfcGljX2ludHIoRGV2aWNlU3RhdGUgKmRldikKQEAgLTQxLDYgKzQx
LDMgQEAgaW5kZXggNDE4NmM1N2IzNC4uNDNjZDgwNWE5NiAxMDA2NDQKICAgICAgICAgIHJldHVy
biAtMTsKICAKICAgICAgbHZ0MCA9IHMtPmx2dFtBUElDX0xWVF9MSU5UMF07Ci0tLSAKLTIuNDQu
MAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDMtY29u
ZmlndXJlLUFkZC1wa2ctY29uZmlnLWhhbmRsaW5nLWZvci1saWJnY3J5cHQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDMtY29uZmlndXJlLUFkZC1wa2ctY29uZmln
LWhhbmRsaW5nLWZvci1saWJnY3J5cHQucGF0Y2gKaW5kZXggMzBlMjY5ZjhmNC4uNmY0OTIzZjAz
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAzLWNvbmZp
Z3VyZS1BZGQtcGtnLWNvbmZpZy1oYW5kbGluZy1mb3ItbGliZ2NyeXB0LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMy1jb25maWd1cmUtQWRkLXBrZy1jb25m
aWctaGFuZGxpbmctZm9yLWxpYmdjcnlwdC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZTRm
NmM2YjlmNDNiMjgyNzFiYzlkYzZjYmNhZmFkNTNmODAzODdlMCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODhiNjk5ZmQwOTIyMWRlNzNlNDhhZTZmMTcwYTY4MDZiNDNjOWMzNyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhlIFpoZSA8emhlLmhlQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBXZWQsIDI4IEF1ZyAyMDE5IDE5OjU2OjI4ICswODAwCi1TdWJqZWN0OiBbUEFUQ0gg
MDMvMTFdIGNvbmZpZ3VyZTogQWRkIHBrZy1jb25maWcgaGFuZGxpbmcgZm9yIGxpYmdjcnlwdAor
U3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IEFkZCBwa2ctY29uZmlnIGhhbmRsaW5nIGZvciBs
aWJnY3J5cHQKIAogbGliZ2NyeXB0IG1heSBhbHNvIGJlIGNvbnRyb2xsZWQgYnkgcGtnLWNvbmZp
ZywgdGhpcyBwYXRjaCBhZGRzIHBrZy1jb25maWcKIGhhbmRsaW5nIGZvciBsaWJnY3J5cHQuCkBA
IC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEhlIFpoZSA8emhlLmhlQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCA5MWEwYWE2NGM2Li5l
ODM3M2Q1NWI4IDEwMDY0NAoraW5kZXggOTFhMGFhNjRjLi5lODM3M2Q1NWIgMTAwNjQ0CiAtLS0g
YS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0xNjU1LDcgKzE2NTUsNyBAQCBl
bmRpZgpAQCAtMjYsNiArMjYsMyBAQCBpbmRleCA5MWEwYWE2NGM2Li5lODM3M2Q1NWI4IDEwMDY0
NAogICAgICAgICAgICAgICAgICAgICAgICAgIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCdnY3J5cHQn
KSkKICAgICAgIyBEZWJpYW4gaGFzIHJlbW92ZWQgLWxncGctZXJyb3IgZnJvbSBsaWJnY3J5cHQt
Y29uZmlnCiAgICAgICMgYXMgaXQgInNwcmVhZHMgdW5uZWNlc3NhcnkgZGVwZW5kZW5jaWVzIiB3
aGljaCBpbgotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWlu
Y2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCmluZGV4IGQ5Y2FiNDI4YzQuLmUwNDRhYzNm
ODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11
LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5v
dC1leGlzdHMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDUyMjNkNDZhOGQ1MzAyMzk2Zjlm
YzdjYzVkODMwNzY5ZTg3MjQyZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE1ZWIz
MmU3Zjg5Njc0YmEwN2E4MTQ5N2ZmYWQxYWU5OGYzNzg3YTIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBPbGVrc2l5IE9iaXRvdHNreXkgPG9vYml0b3RzQGNpc2NvLmNvbT4KIERhdGU6
IFdlZCwgMjUgTWFyIDIwMjAgMjE6MjE6MzUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAwNC8xMV0g
cWVtdTogRG8gbm90IGluY2x1ZGUgZmlsZSBpZiBub3QgZXhpc3RzCitTdWJqZWN0OiBbUEFUQ0hd
IHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90IGV4aXN0cwogCiBTY3JpcHQgY29uZmln
dXJlIGNoZWNrcyBmb3IgaWZfYWxnLmggYW5kIGNoZWNrIGZhaWxlZCBidXQKIGlmX2FsZy5oIHN0
aWxsIGluY2x1ZGVkLgpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWph
bCA8c2FraWIuc2FqYWxAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCiAKIGRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIv
c3lzY2FsbC5jCi1pbmRleCAzZGYyYjk0ZDlhLi4xOGYwOWYxZjA3IDEwMDY0NAoraW5kZXggNTlm
YjNlOTExLi5jYjY1MTQ1OWEgMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysr
IGIvbGludXgtdXNlci9zeXNjYWxsLmMKIEBAIC0xMTYsNyArMTE2LDkgQEAKQEAgLTI5LDYgKzI5
LDMgQEAgaW5kZXggM2RmMmI5NGQ5YS4uMThmMDlmMWYwNyAxMDA2NDQKICAjaW5jbHVkZSA8bGlu
dXgvcnRjLmg+CiAgI2luY2x1ZGUgPHNvdW5kL2Fzb3VuZC5oPgogICNpZmRlZiBIQVZFX0JUUkZT
X0gKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVz
cy1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUt
QWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gKaW5k
ZXggM2M3ZjU3NzZmZi4uMzczNDIwODVmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10
by1hZGRyZXNzLW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11
c2wucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDFjMjk1MDY5ODU3Yjk4NTBmMTVmMmNkNmIz
M2IxMzNlYTY0MWE0NTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA5MDhmZGEwOGYz
ZjkwOTMyOTNkMWNlY2Y0YmYzNDYwMTA3MmMxZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
IERhdGU6IEZyaSwgOCBKYW4gMjAyMSAxNzoyNzowNiArMDAwMAotU3ViamVjdDogW1BBVENIIDA1
LzExXSBxZW11OiBBZGQgc29tZSB1c2VyIHNwYWNlIG1tYXAgdHdlYWtzIHRvIGFkZHJlc3MgbXVz
bAotIDMyIGJpdAorU3ViamVjdDogW1BBVENIXSBxZW11OiBBZGQgc29tZSB1c2VyIHNwYWNlIG1t
YXAgdHdlYWtzIHRvIGFkZHJlc3MgbXVzbCAzMiBiaXQKIAogV2hlbiB1c2luZyBxZW11LWkzODYg
dG8gYnVpbGQgcWVtdXg4NiB3ZWJraXRndGsgb24gbXVzbCwgaXQgc2l0cyBpbiBhbgogaW5maW5p
dGUgbG9vcCBvZiBtcmVtYXAgY2FsbHMgb2YgZXZlciBkZWNyZWFzaW5nL2luY3JlYXNpbmcgYWRk
cmVzc2VzLgpAQCAtMjMsNyArMjIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZwogIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saW51eC11c2VyL21t
YXAuYyBiL2xpbnV4LXVzZXIvbW1hcC5jCi1pbmRleCBiZTNiOWE2OGViLi40ODEyODZmMDFkIDEw
MDY0NAoraW5kZXggYmUzYjlhNjhlLi40ODEyODZmMDEgMTAwNjQ0CiAtLS0gYS9saW51eC11c2Vy
L21tYXAuYwogKysrIGIvbGludXgtdXNlci9tbWFwLmMKIEBAIC0xMDYwLDEyICsxMDYwLDE2IEBA
IGFiaV9sb25nIHRhcmdldF9tcmVtYXAoYWJpX3Vsb25nIG9sZF9hZGRyLCBhYmlfdWxvbmcgb2xk
X3NpemUsCkBAIC00Niw2ICs0NSwzIEBAIGluZGV4IGJlM2I5YTY4ZWIuLjQ4MTI4NmYwMWQgMTAw
NjQ0CiAgICAgICAgICByZXR1cm4gLTE7CiAgICAgIH0KICAKLS0tIAotMi40NC4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWlu
aXNtLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFl
bXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKaW5kZXggZjA3MDU0ZjE5YS4uNDdmYzI3Y2M1ZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0
ZXJtaW5pc20tZml4ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9t
IDlkMzJkZjgwZTMzYTc1NDE2NTg4NTg0OTdmNDViZWQxZTU5ZTM2MjEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGNjMjM1YWQ5ZjgwNDJhYTI2YjZhYmExZDdiNTg1YjIxOGRhMTE2Yjgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IE1vbiwgMSBNYXIgMjAyMSAxMzowMDo0
NyArMDAwMAotU3ViamVjdDogW1BBVENIIDA2LzExXSBxZW11OiBEZXRlcm1pbmlzbSBmaXhlcwor
U3ViamVjdDogW1BBVENIXSBxZW11OiBEZXRlcm1pbmlzbSBmaXhlcwogCiBXaGVuIHNvdXJjZXMg
YXJlIGluY2x1ZGVkIHdpdGhpbiBkZWJ1ZyBpbmZvcm1hdGlvbiwgYSBjb3VwbGUgb2YgYXJlYXMg
b2YgdGhlCiBxZW11IGJ1aWxkIGFyZSBub3QgcmVwcm9kdWNpYmxlIGR1ZSB0byBlaXRoZXIgZnVs
bCBidWlsZHBhdGhzIG9yIHRpbWVzdGFtcHMuCkBAIC0xNiw3ICsxNiw3IEBAIFJQIDIwMjEvMy8x
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9zY3JpcHRzL2RlY29kZXRyZWUucHkgYi9zY3JpcHRzL2RlY29kZXRyZWUucHkKLWlu
ZGV4IGU4YjcyZGEzYTkuLjVjZDg2YjE0MjggMTAwNjQ0CitpbmRleCBlOGI3MmRhM2EuLjVjZDg2
YjE0MiAxMDA2NDQKIC0tLSBhL3NjcmlwdHMvZGVjb2RldHJlZS5weQogKysrIGIvc2NyaXB0cy9k
ZWNvZGV0cmVlLnB5CiBAQCAtMTU1OCw3ICsxNTU4LDcgQEAgZGVmIG1haW4oKToKQEAgLTI4LDYg
KzI4LDMgQEAgaW5kZXggZThiNzJkYTNhOS4uNWNkODZiMTQyOCAxMDA2NDQKICAgICAgICAgIGYg
PSBvcGVuKGZpbGVuYW1lLCAncnQnLCBlbmNvZGluZz0ndXRmLTgnKQogICAgICAgICAgcGFyc2Vf
ZmlsZShmLCB0b3BwYXQpCiAgICAgICAgICBmLmNsb3NlKCkKLS0tIAotMi40NC4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5i
dWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2
ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKaW5kZXggNzRkZTE1OGIyZS4uODYzNzc4MjIz
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3Rz
LW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxk
LXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKQEAgLTEsNyArMSw3IEBA
Ci1Gcm9tIDc3ZWJmNjdkMGM5NmY1MWRhOTFjODQ5OTIwMGViZDEzZjRkY2RkNjggTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGIxYmI1MGRiNjQ0ODY0NzY3NTM3NTJkMWY1MDY5MzFmZmJm
ZmEwYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5n
cWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNCBKYW4gMjAyMSAwNjozMzowNCAr
MDAwMAotU3ViamVjdDogW1BBVENIIDA3LzExXSB0ZXN0cy9tZXNvbi5idWlsZDogdXNlIHJlbGF0
aXZlIHBhdGggdG8gcmVmZXIgdG8gZmlsZXMKK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHMvbWVzb24u
YnVpbGQ6IHVzZSByZWxhdGl2ZSBwYXRoIHRvIHJlZmVyIHRvIGZpbGVzCiAKIEZpeCBlcnJvciBs
aWtlOgogRmF0YWwgZXJyb3I6IGNhbid0IGNyZWF0ZSB0ZXN0cy9wdGltZXItdGVzdC5wLy4uLl9x
ZW11LTUuMi4wX2h3X2NvcmVfcHRpbWVyLmMubzogRmlsZSBuYW1lIHRvbyBsb25nCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRy
aXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3VuaXQvbWVzb24uYnVpbGQgYi90ZXN0cy91bml0L21l
c29uLmJ1aWxkCi1pbmRleCAyMjhhMjFkMDNjLi4yNzJmYjRjNmNhIDEwMDY0NAoraW5kZXggMjI4
YTIxZDAzLi4yNzJmYjRjNmMgMTAwNjQ0CiAtLS0gYS90ZXN0cy91bml0L21lc29uLmJ1aWxkCiAr
KysgYi90ZXN0cy91bml0L21lc29uLmJ1aWxkCiBAQCAtNDcsNyArNDcsNyBAQCB0ZXN0cyA9IHsK
QEAgLTM4LDYgKzM4LDMgQEAgaW5kZXggMjI4YTIxZDAzYy4uMjcyZmI0YzZjYSAxMDA2NDQKICAg
ICAgJ3Rlc3Qtdm1zdGF0ZSc6IFttaWdyYXRpb24sIGlvXSwKICAgICAgJ3Rlc3QteWFuayc6IFsn
c29ja2V0LWhlbHBlcnMuYycsIHFvbSwgaW8sIGNoYXJkZXZdCiAgICB9Ci0tLSAKLTIuNDQuMAot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5l
LU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1B
UF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCmluZGV4IDJlMjg1OTBlMTEuLjAx
NTc2NDBkZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAw
OC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQ
X1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCkBAIC0xLDcg
KzEsNyBAQAotRnJvbSAyMWIxNTlhMTFiYmNiMWVlYjI2ZjEyNDU2ZTRjM2ZkNjJhMDZjYmVjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMmEwMjQzMjYzMjAyNDg5ZDA5MzFmMDFiZTYw
ZmU4Y2NkZGVkODI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjEgTWFyIDIwMjIgMTA6MDk6MzggLTA3MDAK
LVN1YmplY3Q6IFtQQVRDSCAwOC8xMV0gRGVmaW5lIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZB
TElEQVRFIG9uIG5lZWRlZCBsaW51eAorU3ViamVjdDogW1BBVENIXSBEZWZpbmUgTUFQX1NZTkMg
YW5kIE1BUF9TSEFSRURfVkFMSURBVEUgb24gbmVlZGVkIGxpbnV4CiAgc3lzdGVtcwogCiBsaW51
eCBvbmx5IHdpcmVzIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIGZvciBhcmNoaXRl
Y3R1cmVzCkBAIC0xOCw3ICsxOCw3IEBAIENjOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRo
YXQuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS91dGlsL21tYXAtYWxsb2MuYyBiL3V0aWwvbW1hcC1hbGxvYy5jCi1p
bmRleCBlZDE0ZjljNjRkLi4wMzhmNWI0YjU1IDEwMDY0NAoraW5kZXggZWQxNGY5YzY0Li4wMzhm
NWI0YjUgMTAwNjQ0CiAtLS0gYS91dGlsL21tYXAtYWxsb2MuYwogKysrIGIvdXRpbC9tbWFwLWFs
bG9jLmMKIEBAIC0xMCwxNCArMTAsMTggQEAKQEAgLTQzLDYgKzQzLDMgQEAgaW5kZXggZWQxNGY5
YzY0ZC4uMDM4ZjViNGI1NSAxMDA2NDQKICAjaW5jbHVkZSAicWVtdS9tbWFwLWFsbG9jLmgiCiAg
I2luY2x1ZGUgInFlbXUvaG9zdC11dGlscy5oIgogICNpbmNsdWRlICJxZW11L2N1dGlscy5oIgot
LS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDA5LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRlZC1mdW5jdGlvbnMt
YW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDktbGludXgtdXNl
ci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxhdGVkLWZ1bmN0aW9ucy1hbi5wYXRjaAppbmRleCA3
NTc3MjQ5ZDM5Li5hMWZmNTdiYmE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMDktbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxhdGVkLWZ1
bmN0aW9ucy1hbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MDktbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxhdGVkLWZ1bmN0aW9ucy1hbi5w
YXRjaApAQCAtMSw4ICsxLDcgQEAKLUZyb20gMjNkZTMwMDc5ZGJmNDdhODAyNmZhZGRkNTUwYTll
MTgxZDYwOWM4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzUxZDI3M2Y0NTM4Mzdh
MDBiNjRmYjI0MWUxZmE5MzYyYTFlMTg0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE3IERlYyAyMDIyIDA4
OjM3OjQ2IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0ggMDkvMTFdIGxpbnV4LXVzZXI6IFJlcGxhY2Ug
dXNlIG9mIGxmczY0IHJlbGF0ZWQgZnVuY3Rpb25zIGFuZAotIG1hY3JvcworU3ViamVjdDogW1BB
VENIXSBsaW51eC11c2VyOiBSZXBsYWNlIHVzZSBvZiBsZnM2NCByZWxhdGVkIGZ1bmN0aW9ucyBh
bmQgbWFjcm9zCiAKIEJ1aWxkcyBkZWZpbmVzIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgd2hpY2gg
bWFrZXMgdGhlIG9yaWdpbmFsIGZ1bmN0aW9ucwogYW5mIG1hY3JvcyBiZWhhdmUgc2FtZSBhcyB0
aGVpciA2NCBzdWZmaXhlZCBjb3VudGVycGFydHMuIFRoaXMgYWxzbwpAQCAtMTcsNyArMTYsNyBA
QCBDYzogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgogIDEgZmlsZSBjaGFuZ2Vk
LCAzOSBpbnNlcnRpb25zKCspLCAxMTQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saW51
eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi1pbmRleCAxOGYwOWYxZjA3
Li4xYjdjNTBhMmE3IDEwMDY0NAoraW5kZXggY2I2NTE0NTlhLi5jYjQ0Y2MyMWQgMTAwNjQ0CiAt
LS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9zeXNjYWxsLmMKIEBA
IC03NjEsOCArNzYxLDggQEAgc2FmZV9zeXNjYWxsNihzc2l6ZV90LCBjb3B5X2ZpbGVfcmFuZ2Us
IGludCwgaW5mZCwgbG9mZl90ICosIHBpbm9mZiwKQEAgLTMxLDcgKzMwLDcgQEAgaW5kZXggMThm
MDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgKiBUaGlzIHdpbGwgdGhlbiB3b3JrIGFuZCB1
c2UgYSA2NC1iaXQgb2Zmc2V0IGZvciBib3RoIDMyLWJpdCBhbmQgNjQtYml0IGhvc3RzLgogICAq
LwogICNpZmRlZiBfX05SX2ZjbnRsNjQKLUBAIC02NzM5LDEzICs2NzM5LDEzIEBAIHN0YXRpYyBp
bnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQpCitAQCAtNjczNCwxMyArNjczNCwx
MyBAQCBzdGF0aWMgaW50IHRhcmdldF90b19ob3N0X2ZjbnRsX2NtZChpbnQgY21kKQogICAgICAg
ICAgcmV0ID0gY21kOwogICAgICAgICAgYnJlYWs7CiAgICAgIGNhc2UgVEFSR0VUX0ZfR0VUTEs6
CkBAIC00OCw3ICs0Nyw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAg
ICAgICAgICBicmVhazsKICAgICAgY2FzZSBUQVJHRVRfRl9HRVRPV046CiAgICAgICAgICByZXQg
PSBGX0dFVE9XTjsKLUBAIC02NzU5LDE3ICs2NzU5LDYgQEAgc3RhdGljIGludCB0YXJnZXRfdG9f
aG9zdF9mY250bF9jbWQoaW50IGNtZCkKK0BAIC02NzU0LDE3ICs2NzU0LDYgQEAgc3RhdGljIGlu
dCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKICAgICAgY2FzZSBUQVJHRVRfRl9T
RVRTSUc6CiAgICAgICAgICByZXQgPSBGX1NFVFNJRzsKICAgICAgICAgIGJyZWFrOwpAQCAtNjYs
NyArNjUsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBjYXNl
IFRBUkdFVF9GX1NFVExFQVNFOgogICAgICAgICAgcmV0ID0gRl9TRVRMRUFTRTsKICAgICAgICAg
IGJyZWFrOwotQEAgLTY4MjEsOCArNjgxMCw4IEBAIHN0YXRpYyBpbnQgdGFyZ2V0X3RvX2hvc3Rf
ZmNudGxfY21kKGludCBjbWQpCitAQCAtNjgxNiw4ICs2ODA1LDggQEAgc3RhdGljIGludCB0YXJn
ZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKICAgICAgICogdGhlbSB0byA1LCA2IGFuZCA3
IGJlZm9yZSBtYWtpbmcgdGhlIHN5c2NhbGwoKS4gU2luY2Ugd2UgbWFrZSB0aGUKICAgICAgICog
c3lzY2FsbCBkaXJlY3RseSwgYWRqdXN0IHRvIHdoYXQgaXMgc3VwcG9ydGVkIGJ5IHRoZSBrZXJu
ZWwuCiAgICAgICAqLwpAQCAtNzcsNyArNzYsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBh
MmE3IDEwMDY0NAogICAgICB9CiAgI2VuZGlmCiAgCi1AQCAtNjg1NSw1NSArNjg0NCwxMSBAQCBz
dGF0aWMgaW50IGhvc3RfdG9fdGFyZ2V0X2Zsb2NrKGludCB0eXBlKQorQEAgLTY4NTAsNTUgKzY4
MzksMTEgQEAgc3RhdGljIGludCBob3N0X3RvX3RhcmdldF9mbG9jayhpbnQgdHlwZSkKICAgICAg
cmV0dXJuIHR5cGU7CiAgfQogIApAQCAtMTM2LDcgKzEzNSw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcu
LjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgIGFiaV9zaG9ydCBsX3R5cGU7CiAgICAgIGFiaV9zaG9y
dCBsX3doZW5jZTsKICAgICAgYWJpX2xsb25nIGxfc3RhcnQ7Ci1AQCAtNjkxMSwxMCArNjg1Niwx
MCBAQCBzdHJ1Y3QgdGFyZ2V0X29hYmlfZmxvY2s2NCB7CitAQCAtNjkwNiwxMCArNjg1MSwxMCBA
QCBzdHJ1Y3QgdGFyZ2V0X29hYmlfZmxvY2s2NCB7CiAgICAgIGFiaV9pbnQgICBsX3BpZDsKICB9
IFFFTVVfUEFDS0VEOwogIApAQCAtMTQ5LDcgKzE0OCw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFi
N2M1MGEyYTcgMTAwNjQ0CiAgICAgIGludCBsX3R5cGU7CiAgCiAgICAgIGlmICghbG9ja191c2Vy
X3N0cnVjdChWRVJJRllfUkVBRCwgdGFyZ2V0X2ZsLCB0YXJnZXRfZmxvY2tfYWRkciwgMSkpIHsK
LUBAIC02OTM1LDEwICs2ODgwLDEwIEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV9mcm9t
X3VzZXJfb2FiaV9mbG9jazY0KHN0cnVjdCBmbG9jazY0ICpmbCwKK0BAIC02OTMwLDEwICs2ODc1
LDEwIEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV9mcm9tX3VzZXJfb2FiaV9mbG9jazY0
KHN0cnVjdCBmbG9jazY0ICpmbCwKICAgICAgcmV0dXJuIDA7CiAgfQogIApAQCAtMTYzLDcgKzE2
Miw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgIHNob3J0IGxf
dHlwZTsKICAKICAgICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0KFZFUklGWV9XUklURSwgdGFyZ2V0
X2ZsLCB0YXJnZXRfZmxvY2tfYWRkciwgMCkpIHsKLUBAIC02OTU2LDEwICs2OTAxLDEwIEBAIHN0
YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV90b191c2VyX29hYmlfZmxvY2s2NChhYmlfdWxvbmcg
dGFyZ2V0X2Zsb2NrX2FkZHIsCitAQCAtNjk1MSwxMCArNjg5NiwxMCBAQCBzdGF0aWMgaW5saW5l
IGFiaV9sb25nIGNvcHlfdG9fdXNlcl9vYWJpX2Zsb2NrNjQoYWJpX3Vsb25nIHRhcmdldF9mbG9j
a19hZGRyLAogIH0KICAjZW5kaWYKICAKQEAgLTE3Niw3ICsxNzUsNyBAQCBpbmRleCAxOGYwOWYx
ZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBpbnQgbF90eXBlOwogIAogICAgICBpZiAoIWxv
Y2tfdXNlcl9zdHJ1Y3QoVkVSSUZZX1JFQUQsIHRhcmdldF9mbCwgdGFyZ2V0X2Zsb2NrX2FkZHIs
IDEpKSB7Ci1AQCAtNjk4MCwxMCArNjkyNSwxMCBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNv
cHlfZnJvbV91c2VyX2Zsb2NrNjQoc3RydWN0IGZsb2NrNjQgKmZsLAorQEAgLTY5NzUsMTAgKzY5
MjAsMTAgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBjb3B5X2Zyb21fdXNlcl9mbG9jazY0KHN0
cnVjdCBmbG9jazY0ICpmbCwKICAgICAgcmV0dXJuIDA7CiAgfQogIApAQCAtMTkwLDcgKzE4OSw3
IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgIHNob3J0IGxfdHlw
ZTsKICAKICAgICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0KFZFUklGWV9XUklURSwgdGFyZ2V0X2Zs
LCB0YXJnZXRfZmxvY2tfYWRkciwgMCkpIHsKLUBAIC03MDAyLDcgKzY5NDcsNyBAQCBzdGF0aWMg
aW5saW5lIGFiaV9sb25nIGNvcHlfdG9fdXNlcl9mbG9jazY0KGFiaV91bG9uZyB0YXJnZXRfZmxv
Y2tfYWRkciwKK0BAIC02OTk3LDcgKzY5NDIsNyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNv
cHlfdG9fdXNlcl9mbG9jazY0KGFiaV91bG9uZyB0YXJnZXRfZmxvY2tfYWRkciwKICAKICBzdGF0
aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZkLCBpbnQgY21kLCBhYmlfdWxvbmcgYXJnKQogIHsK
QEAgLTE5OSw3ICsxOTgsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAog
ICNpZmRlZiBGX0dFVE9XTl9FWAogICAgICBzdHJ1Y3QgZl9vd25lcl9leCBmb3g7CiAgICAgIHN0
cnVjdCB0YXJnZXRfZl9vd25lcl9leCAqdGFyZ2V0X2ZveDsKLUBAIC03MDE1LDYgKzY5NjAsNyBA
QCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZkLCBpbnQgY21kLCBhYmlfdWxvbmcgYXJn
KQorQEAgLTcwMTAsNiArNjk1NSw3IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19mY250bChpbnQgZmQs
IGludCBjbWQsIGFiaV91bG9uZyBhcmcpCiAgCiAgICAgIHN3aXRjaChjbWQpIHsKICAgICAgY2Fz
ZSBUQVJHRVRfRl9HRVRMSzoKQEAgLTIwNyw3ICsyMDYsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgcmV0ID0gY29weV9mcm9tX3VzZXJfZmxvY2soJmZs
NjQsIGFyZyk7CiAgICAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAgICAgcmV0dXJuIHJldDsK
LUBAIC03MDI0LDMyICs2OTcwLDExIEBAIHN0YXRpYyBhYmlfbG9uZyBkb19mY250bChpbnQgZmQs
IGludCBjbWQsIGFiaV91bG9uZyBhcmcpCitAQCAtNzAxOSwzMiArNjk2NSwxMSBAQCBzdGF0aWMg
YWJpX2xvbmcgZG9fZmNudGwoaW50IGZkLCBpbnQgY21kLCBhYmlfdWxvbmcgYXJnKQogICAgICAg
ICAgICAgIHJldCA9IGNvcHlfdG9fdXNlcl9mbG9jayhhcmcsICZmbDY0KTsKICAgICAgICAgIH0K
ICAgICAgICAgIGJyZWFrOwpAQCAtMjQxLDcgKzI0MCw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFi
N2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKICAgICAgICAgIH0KLUBAIC03Mjc4LDcgKzcyMDMsNyBAQCBzdGF0aWMgaW5saW5lIGFi
aV9sb25nIHRhcmdldF90cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgY29uc3QgY2hh
ciAqYXJnMQorQEAgLTcyNzMsNyArNzE5OCw3IEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgdGFy
Z2V0X3RydW5jYXRlNjQoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBjb25zdCBjaGFyICphcmcxCiAg
ICAgICAgICBhcmcyID0gYXJnMzsKICAgICAgICAgIGFyZzMgPSBhcmc0OwogICAgICB9CkBAIC0y
NTAsNyArMjQ5LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICB9CiAg
I2VuZGlmCiAgCi1AQCAtNzI5Miw3ICs3MjE3LDcgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyB0
YXJnZXRfZnRydW5jYXRlNjQoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBhYmlfbG9uZyBhcmcxLAor
QEAgLTcyODcsNyArNzIxMiw3IEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgdGFyZ2V0X2Z0cnVu
Y2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgIGFy
ZzIgPSBhcmczOwogICAgICAgICAgYXJnMyA9IGFyZzQ7CiAgICAgIH0KQEAgLTI1OSw3ICsyNTgs
NyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogIH0KICAjZW5kaWYKICAK
LUBAIC04NjY3LDcgKzg1OTIsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRp
cmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKK0BAIC04NjYyLDcgKzg1ODcsNyBA
QCBzdGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRpcmZkLCBhYmlfbG9uZyBhcmcyLCBh
YmlfbG9uZyBjb3VudCkKICAgICAgdm9pZCAqdGRpcnA7CiAgICAgIGludCBobGVuLCBob2ZmLCB0
b2ZmOwogICAgICBpbnQgaHJlY2xlbiwgdHJlY2xlbjsKQEAgLTI2OCw3ICsyNjcsNyBAQCBpbmRl
eCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogIAogICAgICBoZGlycCA9IGdfdHJ5X21h
bGxvYyhjb3VudCk7CiAgICAgIGlmICghaGRpcnApIHsKLUBAIC04NzIwLDcgKzg2NDUsNyBAQCBz
dGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRpcmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlf
bG9uZyBjb3VudCkKK0BAIC04NzE1LDcgKzg2NDAsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRz
KGFiaV9sb25nIGRpcmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKICAgICAgICAg
ICAgICAgKiBSZXR1cm4gd2hhdCB3ZSBoYXZlLCByZXNldHRpbmcgdGhlIGZpbGUgcG9pbnRlciB0
byB0aGUKICAgICAgICAgICAgICAgKiBsb2NhdGlvbiBvZiB0aGUgZmlyc3QgcmVjb3JkIG5vdCBy
ZXR1cm5lZC4KICAgICAgICAgICAgICAgKi8KQEAgLTI3Nyw3ICsyNzYsNyBAQCBpbmRleCAxOGYw
OWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAg
fQogIAotQEAgLTg3NTQsNyArODY3OSw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHM2NChhYmlf
bG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCitAQCAtODc0OSw3ICs4
Njc0LDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50czY0KGFiaV9sb25nIGRpcmZkLCBhYmlfbG9u
ZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKICAgICAgdm9pZCAqdGRpcnA7CiAgICAgIGludCBobGVu
LCBob2ZmLCB0b2ZmOwogICAgICBpbnQgaHJlY2xlbiwgdHJlY2xlbjsKQEAgLTI4Niw3ICsyODUs
NyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogIAogICAgICBoZGlycCA9
IGdfdHJ5X21hbGxvYyhjb3VudCk7CiAgICAgIGlmICghaGRpcnApIHsKLUBAIC04Nzk2LDcgKzg3
MjEsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzNjQoYWJpX2xvbmcgZGlyZmQsIGFiaV9sb25n
IGFyZzIsIGFiaV9sb25nIGNvdW50KQorQEAgLTg3OTEsNyArODcxNiw3IEBAIHN0YXRpYyBpbnQg
ZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcgY291
bnQpCiAgICAgICAgICAgICAgICogUmV0dXJuIHdoYXQgd2UgaGF2ZSwgcmVzZXR0aW5nIHRoZSBm
aWxlIHBvaW50ZXIgdG8gdGhlCiAgICAgICAgICAgICAgICogbG9jYXRpb24gb2YgdGhlIGZpcnN0
IHJlY29yZCBub3QgcmV0dXJuZWQuCiAgICAgICAgICAgICAgICovCkBAIC0yOTUsNyArMjk0LDcg
QEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgICAgICBicmVh
azsKICAgICAgICAgIH0KICAKLUBAIC0xMTUyNyw3ICsxMTQ1Miw3IEBAIHN0YXRpYyBhYmlfbG9u
ZyBkb19zeXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFy
ZzEsCitAQCAtMTE1MjIsNyArMTE0NDcsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEo
Q1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICAgICAg
ICAgICAgICByZXR1cm4gLVRBUkdFVF9FRkFVTFQ7CiAgICAgICAgICAgICAgfQogICAgICAgICAg
fQpAQCAtMzA0LDcgKzMwMyw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0
CiAgICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcyLCByZXQpOwogICAgICAgICAgcmV0dXJuIHJl
dDsKICAgICAgY2FzZSBUQVJHRVRfTlJfcHdyaXRlNjQ6Ci1AQCAtMTE1NDQsNyArMTE0NjksNyBA
QCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQg
bnVtLCBhYmlfbG9uZyBhcmcxLAorQEAgLTExNTM5LDcgKzExNDY0LDcgQEAgc3RhdGljIGFiaV9s
b25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcg
YXJnMSwKICAgICAgICAgICAgICAgICAgcmV0dXJuIC1UQVJHRVRfRUZBVUxUOwogICAgICAgICAg
ICAgIH0KICAgICAgICAgIH0KQEAgLTMxMyw3ICszMTIsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgdW5sb2NrX3VzZXIocCwgYXJnMiwgMCk7CiAgICAg
ICAgICByZXR1cm4gcmV0OwogICNlbmRpZgotQEAgLTEyNDA0LDE0ICsxMjMyOSwxNCBAQCBzdGF0
aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBh
YmlfbG9uZyBhcmcxLAorQEAgLTEyMzk5LDE0ICsxMjMyNCwxNCBAQCBzdGF0aWMgYWJpX2xvbmcg
ZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcx
LAogICAgICBjYXNlIFRBUkdFVF9OUl9mY250bDY0OgogICAgICB7CiAgICAgICAgICBpbnQgY21k
OwpAQCAtMzMzLDcgKzMzMiw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0
CiAgICAgICAgICB9CiAgI2VuZGlmCiAgCi1AQCAtMTI0MjEsNyArMTIzNDYsNyBAQCBzdGF0aWMg
YWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlf
bG9uZyBhcmcxLAorQEAgLTEyNDE2LDcgKzEyMzQxLDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5
c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAg
ICAgICAgIH0KICAKICAgICAgICAgIHN3aXRjaChhcmcyKSB7CkBAIC0zNDIsNyArMzQxLDcgQEAg
aW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgICAgICByZXQgPSBj
b3B5ZnJvbSgmZmwsIGFyZzMpOwogICAgICAgICAgICAgIGlmIChyZXQpIHsKICAgICAgICAgICAg
ICAgICAgYnJlYWs7Ci1AQCAtMTI0MzIsOCArMTIzNTcsOCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9f
c3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAor
QEAgLTEyNDI3LDggKzEyMzUyLDggQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFy
Y2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgICAgICB9
CiAgCSAgICBicmVhazsKICAKQEAgLTM1Myw2ICszNTIsMyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgICAgIHJldCA9IGNvcHlmcm9tKCZmbCwgYXJnMyk7
CiAgICAgICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgICAgICBicmVhazsKLS0tIAot
Mi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAx
MC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4
dXRhYmxlLWZyb20tUEFUSC5wYXRjaAppbmRleCA5OGNlODVhOGNmLi41MjhhZWRiNzhjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxv
b2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJv
bS1QQVRILnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBlMTJhOTMxNzRmOWI2NTI2MDRkZGE4
ZDg0NjRiOTU1OWI2MmIyOWQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyODk2MWRk
MmZlOTM5MDNlMjgyYjZmZjgyNTEwNzZmOGQ0ZWNhM2JlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogPT9VVEYtOD9xP01hcnRpbj0yMEh1bmRlYj1DMz1COGxsPz0gPG1hcnRpbkBnZWFu
aXguY29tPgogRGF0ZTogV2VkLCAyMiBNYXkgMjAyNCAxNDowMjo1NSArMDIwMAotU3ViamVjdDog
W1BBVENIIDEwLzExXSBjb25maWd1cmU6IGxvb2t1cCBtZXNvbiBleHV0YWJsZSBmcm9tIFBBVEgK
K1N1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUgZnJvbSBQ
QVRICiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbd29ya2Fyb3VuZCwgd291bGQg
bmVlZCBhIHJlYWwgZml4IGZvciB1cHN0cmVhbV0KIC0tLQpAQCAtOSwxMCArOSwxMCBAQCBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3dvcmthcm91bmQsIHdvdWxkIG5lZWQgYSByZWFs
IGZpeCBmb3IgdXBzdHJlYW1dCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCAz
Y2Q3MzZiMTM5Li40ODJhMWY4ZWYzIDEwMDc1NQoraW5kZXggMGFlYTliMTEzLi5jMjhiZDQ3YjQg
MTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTk1NiwxMiArOTU2
LDcgQEAgZmkKK0BAIC05NjUsMTIgKzk2NSw3IEBAIGZpCiAgJG1rdmVudiBlbnN1cmVncm91cCAt
LWRpciAiJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3doZWVscyIgXAogICAgICAgJHtzb3VyY2VfcGF0
aH0vcHl0aG9uZGVwcy50b21sIG1lc29uIHx8IGV4aXQgMQogIApAQCAtMjYsNiArMjYsMyBAQCBp
bmRleCAzY2Q3MzZiMTM5Li40ODJhMWY4ZWYzIDEwMDc1NQogIAogICMgQ29uZGl0aW9uYWxseSBl
bnN1cmUgU3BoaW54IGlzIGluc3RhbGxlZC4KICAKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5k
LXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52
LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKaW5kZXggYzdiYjliMWI0Ny4uM2FlZmZlYWNiNiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJl
LXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhl
LXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9t
IGE5M2MyYTZiMmM5ZGI5YzRiZDMwMjk4ZGE0M2MzN2M1ZTVjNjIzNmUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGE4YmJjMjI3Yzk4MjQ4NzViYTY5YjJjNjk3MDJlZTI3OWUzM2I4NTkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTM6NTg6
MjMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAxMS8xMV0gcWVtdTogRW5zdXJlIHBpcCBhbmQgdGhl
IHB5dGhvbiB2ZW52IGFyZW4ndCB1c2VkIGZvcgotIG1lc29uCitTdWJqZWN0OiBbUEFUQ0hdIHFl
bXU6IEVuc3VyZSBwaXAgYW5kIHRoZSBweXRob24gdmVudiBhcmVuJ3QgdXNlZCBmb3IgbWVzb24K
IAogUWVtdSB3YW50cyB0byB1c2UgYSBzdXBwb3J0ZWQgcHl0aG9uIHZlcnNpb24gYW5kIGEgc3Bl
Y2lmaWMgbWVzb24gdmVyc2lvbgogdG8gImhlbHAiIHVzZXJzIGFuZCB1c2VzIHBpcCBhbmQgY3Jl
YXRlcyBhIHZlbnYgdG8gZG8gdGhpcy4gVGhpcyBpcyBhIG5pZ2h0bWFyZQpAQCAtMzAsMTAgKzI5
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4IDQ4
MmExZjhlZjMuLjBkYTRiZjNlNGQgMTAwNzU1CitpbmRleCBjMjhiZDQ3YjQuLjMzYjg5YjIzNiAx
MDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmlndXJlCi1AQCAtOTM4LDE0ICs5Mzgs
MTQgQEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24iKSIKK0BAIC05NDcsMTQgKzk0Nywx
NCBAQCBweXRob249IiQoY29tbWFuZCAtdiAiJHB5dGhvbiIpIgogIGVjaG8gInB5dGhvbiBkZXRl
cm1pbmVkIHRvIGJlICckcHl0aG9uJyIKICBlY2hvICJweXRob24gdmVyc2lvbjogJCgkcHl0aG9u
IC0tdmVyc2lvbikiCiAgCkBAIC01MCw2ICs0OSwzIEBAIGluZGV4IDQ4MmExZjhlZjMuLjBkYTRi
ZjNlNGQgMTAwNzU1CiAgCiAgIyBGaW5pc2ggcHJlcGFyaW5nIHRoZSB2aXJ0dWFsIGVudmlyb25t
ZW50IHVzaW5nIHZlbmRvcmVkIC53aGwgZmlsZXMKICAKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfOS4wLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11XzkuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzkuMC4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzkuMC4xLmJiCi0tIAoyLjQ0LjAKCg==

--===============8981836988716894890==--

