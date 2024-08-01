Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C1DC54745
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.75736.1722536822878673328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S9eWNg4L;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=auqAuj1K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101910f320269-a2048d6b-d650-457c-9a86-66281a10431a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZWk8QoExh+6MHG5h/NhdUrYMn8ZqJ2gF/2sb08gP8P8=;
	b=S9eWNg4L4dWYkEo2CKBAbmoEJwiysHBQbcBIE5jLFoW8GMi7yqQpzeLlrwv+OImR
	RXLJhQvizTj6jCTb1aCAdtnIAZPyK7+5IZMteV4g9o6cYCmG7n2lWQQJ13RMMPGgSae
	T0Kon9thse+eAfKo39/a+fHoTjoS5V8xtcUd9/sA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZWk8QoExh+6MHG5h/NhdUrYMn8ZqJ2gF/2sb08gP8P8=;
	b=auqAuj1KLRw+L7OAWit9HkH0VtTdkOFQ2j5gHUgwsJACNbqHgctgP9qtE6EL6CqN
	2erKItjYM6vAZ7NDYiFDMrhup621JmL7kIaRFu9VRRSqHRNRVr/otR57obhapkicX72
	dhjNs9OfoVtPuloeIHmskfv08Gz55/rPsnYwr28w=
Content-Type: multipart/mixed; boundary="===============7814403598213097762=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu,qemu-native,qemu-system-native: upgrading to
 9.0.2,9.0.2,9.0.2 SUCCEEDED
Message-ID: <010101910f320269-a2048d6b-d650-457c-9a86-66281a10431a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202771

--===============7814403598213097762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu,qemu-native,qemu-system-native* to *9.0.2,9.0.2,9.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-qemu-native-qemu-system-native-upgrade-9.0.1-9..patch
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
From 56bf662f5ea2e713eb4e7931a5bb4f2ee782f224 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 06:49:39 +0000
Subject: [PATCH] qemu,qemu-native,qemu-system-native: upgrade 9.0.1 ->
 9.0.2,9.0.1 -> 9.0.2,9.0.1 -> 9.0.2

---
 ...u-native_9.0.1.bb => qemu-native_9.0.2.bb} |  1 +
 ...e_9.0.1.bb => qemu-system-native_9.0.2.bb} |  1 +
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
 .../qemu/{qemu_9.0.1.bb => qemu_9.0.2.bb}     |  0
 15 files changed, 60 insertions(+), 94 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.0.1.bb => qemu-native_9.0.2.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.0.1.bb => qemu-system-native_9.0.2.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu_9.0.1.bb => qemu_9.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.0.1.bb b/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_9.0.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.0.2.bb
index a77953529b..26fa84c180 100644
--- a/meta/recipes-devtools/qemu/qemu-native_9.0.1.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb
@@ -7,3 +7,4 @@ require qemu-native.inc
 EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
 
 PACKAGECONFIG ??= "pie"
+
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb
index 5d2fbcbc02..e7bbe5d291 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_9.0.1.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb
@@ -29,3 +29,4 @@ do_install:append() {
     install -d ${D}${libdir}/qemu-python/qmp/
     install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
 }
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4a15c97d93..f37b32985b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "d0f4db0fbd151c0cf16f84aeb2a500f6e95009732546f44dafab8d2049bbb805"
+SRC_URI[sha256sum] = "a8c3f596aece96da3b00cafb74baafa0d14515eafb8ed1ee3f7f5c2d0ebf02b6"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 2333cc8432..a1db3de229 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00 2001
+From 07e236d558ba31fbc5abfdcaa83b8fa5f73fe135 Mon Sep 17 00:00:00 2001
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
index 5f8fe4faa3..5fbbf11d21 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00 2001
+From 7877acf0ba9de83e82991394bdd92df0d241034a Mon Sep 17 00:00:00 2001
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
index 30e269f8f4..1990739e79 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From e4f6c6b9f43b28271bc9dc6cbcafad53f80387e0 Mon Sep 17 00:00:00 2001
+From 97fb142009c4a7b76154f84470ea9eadaff49f13 Mon Sep 17 00:00:00 2001
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
index d9cab428c4..10da3c8a33 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00 2001
+From 205244bb3022fa7f149085ed8c78b9c3623a3900 Mon Sep 17 00:00:00 2001
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
+index 2edbd1ef1..8b557f03a 100644
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
index 3c7f5776ff..b8fe4a1078 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,8 +1,7 @@
-From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00 2001
+From 153e2a6e694e1c1d965b7c2bd2c9a5a80ec20419 Mon Sep 17 00:00:00 2001
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
index f07054f19a..c01ce77661 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00 2001
+From 0a58fd302ecef63ec887de68391dd8dcc30ba3f0 Mon Sep 17 00:00:00 2001
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
index 74de158b2e..2dbafc1448 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00 2001
+From e57ca501e679f22030fedc04a636ce00843c0d4c Mon Sep 17 00:00:00 2001
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
index 2e28590e11..c7bdd48601 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00 2001
+From 7df2b38ad6f6cb01c3137dae3d08ed37de913e1d Mon Sep 17 00:00:00 2001
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
index 7577249d39..68c26e52d6 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,8 +1,7 @@
-From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00 2001
+From 0cf12c3cd003f2acc8c1cb765e62d5b68c48f5b2 Mon Sep 17 00:00:00 2001
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
+index 8b557f03a..cb5097c88 100644
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
+@@ -7279,7 +7204,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +249,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -7292,7 +7217,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+@@ -7293,7 +7218,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -259,7 +258,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -8667,7 +8592,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8668,7 +8593,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -268,7 +267,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8720,7 +8645,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8721,7 +8646,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -277,7 +276,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              break;
          }
  
-@@ -8754,7 +8679,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8755,7 +8680,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -286,7 +285,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8796,7 +8721,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8797,7 +8722,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -295,7 +294,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              break;
          }
  
-@@ -11527,7 +11452,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11528,7 +11453,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -304,7 +303,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          unlock_user(p, arg2, ret);
          return ret;
      case TARGET_NR_pwrite64:
-@@ -11544,7 +11469,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11545,7 +11470,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -313,7 +312,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -12404,14 +12329,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12405,14 +12330,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
      case TARGET_NR_fcntl64:
      {
          int cmd;
@@ -333,7 +332,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          }
  #endif
  
-@@ -12421,7 +12346,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12422,7 +12347,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          }
  
          switch(arg2) {
@@ -342,7 +341,7 @@ index 18f09f1f07..1b7c50a2a7 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
-@@ -12432,8 +12357,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12433,8 +12358,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
index 98ce85a8cf..9999cb7096 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,7 +1,7 @@
-From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00 2001
+From a75d0412567947ca7c794b5c59f81341c7e5045e Mon Sep 17 00:00:00 2001
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
index c7bb9b1b47..e52b604765 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,8 +1,7 @@
-From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00 2001
+From 756a5c1efc91f113e7f6edcb0810440cbad41345 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/qemu/qemu_9.0.1.bb b/meta/recipes-devtools/qemu/qemu_9.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.0.1.bb
rename to meta/recipes-devtools/qemu/qemu_9.0.2.bb
-- 
2.44.0


--===============7814403598213097762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-64 sysroot...done.
Removing 114 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ee24706121ff0677198ae8a10fc3a2c86e338ab5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ee24706121ff0677198ae8a10fc3a2c86e338ab5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 842 Local 625 Mirrors 0 Missed 217 Current 393 (74% match, 82% complete)
Removing 5 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 415 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 428 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libslirp-4.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 473 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsdl2-2.30.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 475 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 476 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe virglrenderer-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 479 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 481 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-4.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 490 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 495 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libslirp-4.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsdl2-2.30.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 508 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe virglrenderer-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 524 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 529 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 566 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 581 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 593 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 594 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 602 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 610 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 632 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 681 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.67-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 684 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 685 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ell-0.67-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 706 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.67-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 714 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 728 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 731 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 733 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 734 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 736 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 751 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 753 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 754 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 767 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 768 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 779 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 783 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 790 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 811 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 820 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 823 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 831 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 835 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 836 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 844 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 847 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 848 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 849 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 850 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 854 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 864 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 867 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 869 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 873 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 876 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 879 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 885 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 887 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 888 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 890 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 891 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 898 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 901 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 902 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 903 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 905 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 906 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 907 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.40.1/temp/log.do_packagedata_setscene.115021
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 908 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_package_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 911 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 913 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 915 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 919 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 920 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 922 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 924 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 925 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 929 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 930 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 935 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 941 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 943 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 950 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 953 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_package_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 960 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 963 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 965 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 978 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 983 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 987 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 989 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 992 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 993 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 995 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1000 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1126 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1170 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1171 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1173 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1179 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1180 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1191 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 564 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: Running setscene task 1193 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1196 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 707 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 795 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: Running task 806 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Started
NOTE: Running task 897 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running task 947 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: Running task 948 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_unpack)
NOTE: Running task 950 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_fetch)
NOTE: Running task 956 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: Running task 985 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 986 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_write_config)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_fetch: Started
NOTE: Running task 1010 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe util-linux-2.40.1-r0: task do_fetch: Succeeded
NOTE: Running task 1049 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_unpack)
NOTE: Running task 1054 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1055 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1060 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1064 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1066 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1200 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1073 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_write_config: Succeeded
NOTE: Running task 1079 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1082 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1083 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1087 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe util-linux-2.40.1-r0: task do_unpack: Started
NOTE: Running task 1096 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1097 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1101 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: Running task 1102 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1203 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1105 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1106 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: Running task 1117 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1122 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: Running task 1123 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1124 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running setscene task 1204 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Started
NOTE: Running setscene task 1206 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1125 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1126 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: Running setscene task 1208 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1209 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1210 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1129 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 1130 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1131 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1132 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1134 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1144 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1146 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1179 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_patch)
NOTE: Running task 1180 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running setscene task 1211 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1214 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1216 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1211 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: Running task 1231 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1236 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1264 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_fetch)
NOTE: Running task 1265 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_write_config)
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1266 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1267 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: Running task 1273 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_unpack)
NOTE: Running task 1275 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1280 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe bluez5-5.77-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Started
NOTE: Running task 1287 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe bluez5-5.77-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1222 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1288 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1225 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe wayland-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1298 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: Running task 1299 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe util-linux-2.40.1-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: Running task 1300 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_patch)
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1301 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1302 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_patch)
NOTE: Running task 1303 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1304 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 1340 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1341 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_patch)
NOTE: Running task 1352 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1356 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1363 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: Running task 1364 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.77-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: Running task 1365 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: Running task 1368 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: Running task 1385 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe wayland-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: Running task 1407 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1409 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1411 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: recipe util-linux-2.40.1-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1413 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_fetch: Succeeded
NOTE: Running task 1416 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: Running task 1417 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_unpack)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.77-r0: task do_patch: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: Running task 1419 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe libdrm-2.4.122-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.122-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_patch)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1425 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1472 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_fetch)
NOTE: Running task 1477 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_unpack)
NOTE: Running task 1490 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 1491 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1492 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1493 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Started
NOTE: Running task 1494 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: Running task 1497 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: recipe wayland-protocols-1.36-r0: task do_patch: Succeeded
NOTE: Running task 1542 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1543 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.122-r0: task do_unpack: Started
NOTE: Running task 1545 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe bluez5-5.77-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_write_config)
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1552 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: Running task 1556 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe ell-0.67-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.67-r0: task do_fetch: Succeeded
NOTE: Running task 1557 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1558 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Started
NOTE: Running task 1564 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1565 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libdrm-2.4.122-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Started
NOTE: Running task 1574 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1575 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_fetch)
NOTE: Running task 1576 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: Running task 1578 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_write_config: Succeeded
NOTE: Running task 1579 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1580 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.9-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_patch: Started
NOTE: recipe ofono-2.9-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1606 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_write_config)
NOTE: Running task 1615 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1616 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1630 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_unpack)
NOTE: Running task 1631 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_unpack)
NOTE: Running task 1633 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.122-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_unpack: Succeeded
NOTE: Running task 1665 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.36-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 1735 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1736 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack)
NOTE: Running task 1764 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_write_config)
NOTE: recipe libdrm-2.4.122-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe ell-0.67-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: Running task 1765 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_write_config: Succeeded
NOTE: Running task 1778 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: Running task 1780 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_fetch)
NOTE: Running task 1785 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.9-r0: task do_unpack: Started
NOTE: Running task 1787 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_patch: Succeeded
NOTE: Running task 1788 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_patch)
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe ell-0.67-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_generate_toolchain_file)
NOTE: Running task 1791 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1792 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libsdl2-2.30.5-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1793 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libsdl2-2.30.5-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1228 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1230 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1804 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: Running task 1812 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_write_config)
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Started
NOTE: recipe ell-0.67-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe ofono-2.9-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_patch)
NOTE: recipe ell-0.67-r0: task do_patch: Succeeded
NOTE: Running task 1820 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1822 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1823 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1824 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1826 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1829 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.9-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1830 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_unpack)
NOTE: recipe virglrenderer-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1831 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1832 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe ofono-2.9-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 1835 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_recipe_qa)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libslirp-4.8.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libsdl2-2.30.5-r0: task do_unpack: Started
NOTE: Running task 1842 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_configure: Succeeded
NOTE: Running setscene task 1231 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1233 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1843 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_compile)
NOTE: recipe qemu-9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: Running task 1854 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Succeeded
NOTE: Running task 1856 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libslirp-4.8.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1858 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.41-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1859 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_patch)
NOTE: Running task 1860 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1873 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1874 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1875 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe qemu-9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: Running task 1877 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_fetch)
NOTE: Running task 1878 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 1894 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_unpack: Succeeded
NOTE: Running task 1905 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: Running task 1906 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_unpack: Started
NOTE: Running task 1922 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: Running task 1923 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1924 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe qemu-9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1925 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_write_config: Succeeded
NOTE: Running task 1926 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1927 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_install)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1928 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe qemu-9.0.2-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.0.1-r0: task do_write_config: Succeeded
NOTE: Running task 1930 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_generate_toolchain_file)
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: Running task 1931 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_write_config)
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1952 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: Running task 1988 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_install: Started
NOTE: Running task 2081 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.30.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe libslirp-4.8.0-r0: task do_write_config: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2147 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.30.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: recipe libslirp-4.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 2173 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2220 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2272 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2319 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2322 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2346 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_patch)
NOTE: Running task 2356 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2390 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: Running task 2391 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2392 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2393 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2395 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2396 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_configure)
NOTE: recipe wayland-protocols-1.36-r0: task do_install: Succeeded
NOTE: Running task 2405 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_populate_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: recipe libslirp-4.8.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: Running task 2436 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2437 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_package)
NOTE: recipe wayland-protocols-1.36-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2438 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_configure: Started
NOTE: recipe wayland-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2440 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: Running task 2442 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 2449 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2450 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2451 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2456 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_package: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Started
NOTE: recipe wayland-1.23.0-r0: task do_configure: Started
NOTE: recipe dtc-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2457 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2526 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_populate_sysroot unihash changed to b5f211767de6074aeeabcc3bf4126552aabe5ce67e6278e6d9ef2ab95f0c3dba
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2527 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_configure)
NOTE: recipe dtc-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2528 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2529 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2562 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: Running task 2581 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 2624 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe dtc-1.7.0-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2679 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2696 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_package: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_package unihash changed to cff21caf0c0dace9cdbee5c6bd4cafd80f1b252ee10770031936f8bed8b31fa5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata became valid
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: Running task 2697 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: Running task 2837 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2886 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: Running task 2894 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2896 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2898 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2899 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2920 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 2921 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe xkeyboard-config-2.41-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_compile)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 2925 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Succeeded
NOTE: Running task 2926 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe dtc-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2927 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.41-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Started
NOTE: recipe dtc-1.7.0-r0: task do_compile: Started
NOTE: recipe wayland-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe xkeyboard-config-2.41-r0: task do_compile: Succeeded
NOTE: Running task 2930 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_install)
NOTE: recipe wayland-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2931 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Succeeded
NOTE: Running task 2932 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2933 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe wayland-1.23.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: Running task 2935 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2937 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot unihash changed to f8a548797c36ef6ce17441186c5eb3859a90a72f37e6eb6f9fb47447c382e1cc
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2938 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 2939 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe dtc-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2940 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to 7c8ddd8aa33198a02865fa79d62257395fc96feeb336c5c5446e796f2e199056
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_compile: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe dtc-1.7.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot unihash changed to 5718e70a1010c79503940969a2b629426e7b20498ebbdcfd6a2c5e79c92718bf
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package unihash changed to 4a9f9217a5e45fdc5090e47c8056ec059b6e21c0ad828e9385dee191ff3172a1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata became valid
NOTE: Running setscene task 1144 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1162 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1166 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_install: Succeeded
NOTE: Running setscene task 1193 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1224 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1225 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 2941 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_compile_ptest_base)
NOTE: Running task 2942 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2943 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to bf07120a4816f3b074ec574e1b9bacb982eea993554d2bf4d63ffab47c884ca2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package became valid
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package unihash changed to 4ce5f3a9e613a9689d9aa07a3197106bc51d530c7daa5d7cd17eebc8109ce10b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata became valid
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 1156 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1158 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1165 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to 2bf780901c70a9154909b0f73480c1b60be530c8cdbd96d52f1ca4fbbce05a98
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot unihash changed to 30c8136c1a10aed8df4c790a71532b3beea43b7750c1261754b96b02eedfecdb
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1161 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package_setscene)
NOTE: Running setscene task 1163 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1168 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package_setscene)
NOTE: Running setscene task 1169 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1200 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1201 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running task 2944 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_install)
NOTE: Running task 2945 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2946 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: Running task 2947 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 2949 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package)
NOTE: Running task 2950 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.23.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package: Started
NOTE: recipe dtc-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe dtc-1.7.0-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2952 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2953 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: Running setscene task 1205 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1206 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe dtc-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_populate_sysroot unihash changed to 1694217a28e85ffd598ed91f5bbda6d15e1c7a23ce58db83dd9b1dd78123e234
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1206 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1207 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1208 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: Running setscene task 1209 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1210 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2954 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libdrm-2.4.122-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1212 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1213 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_package_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_package_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1214 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1215 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2956 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Running task 2958 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_patch)
NOTE: recipe wayland-1.23.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to f53ab8629a8797f827ee0524b0388f5833a99dbf77177de8408c920418e0a0ae
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1216 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1217 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1220 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_package unihash changed to 38e43d298f03e63f7a1d8d9502d0c566687d2467c82dbac6ce3054bc1076ff73
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_packagedata became valid
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1220 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: Running setscene task 1222 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package_setscene)
NOTE: Running task 2970 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot unihash changed to 65676ffedebae234371b541e3805e5c418c2024cc6b141cd8ec237ee1a2f4aa7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot became valid
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1217 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2972 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_create_spdx)
NOTE: recipe qemu-9.0.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2973 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2974 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_populate_lic)
NOTE: recipe dtc-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemu-9.0.2-r0: task do_populate_lic: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1223 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running task 2975 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemu-9.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_populate_lic unihash changed to f06ebbb8b00fa62a9e7a89c94828435ec4273176c27ffd3a15931da679d1d4e9
NOTE: recipe libdrm-2.4.122-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1225 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_package_setscene)
NOTE: recipe qemu-9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_compile)
NOTE: recipe xkeyboard-config-2.41-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package unihash changed to 7715aa5fd4769a397977db3aca4114403a8200d0556dceb1d642e568ab609479
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata became valid
NOTE: Running setscene task 1225 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1226 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1227 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_package unihash changed to bc57f6ac3c80c224f93a1a17653d671df29bf5b6df7b5f6de6020d9223da37f7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1222 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2978 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1227 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1228 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2980 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1229 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1231 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2981 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1233 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running task 3057 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.122-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3067 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: Running task 3068 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot)
NOTE: Running task 3081 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3096 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot unihash changed to 8ebd6642967952ea69bdc7befbee8e9e7496b92d2988e8f83e1b4c4485317967
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3097 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3098 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3099 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 3100 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3101 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3102 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3103 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3105 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3106 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3107 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3108 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3109 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 3110 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 3111 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package unihash changed to b82ea8f2bddf05eee0313ab3a8b196c1c6392b99be07d67552b255b3a5a6cad1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata became valid
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot unihash changed to d8aa639f72c2d8a35674d78abfd3602d518dee0b7dc1aaac6b2ed6d8fe359f11
NOTE: Running setscene task 1231 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 3112 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_compile)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3114 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_configure: Succeeded
NOTE: Running task 3115 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_configure_ptest_base)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package unihash changed to f8b47b38770a848b1147d72171c565f775e638879811905b3c6eb5543fbbdde7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running task 3116 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_compile)
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3118 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3120 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_collect_spdx_deps)
NOTE: Running task 3121 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3122 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3123 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 3124 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_install)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3125 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3126 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: Running task 3127 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3128 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 3129 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3130 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3131 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3132 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3133 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: Running task 3134 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot unihash changed to 8bbe2546726d27921d26b5b94670ba1a7ef6e1fbaf409cf4e1163d5bd4204854
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3135 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3136 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3137 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 3138 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3139 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3140 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3141 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3142 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3143 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_collect_spdx_deps)
NOTE: Running task 3144 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3145 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3146 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3147 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: Running task 3148 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_package unihash changed to 170d2cfaa7f9ab2900d85a9c778c4005f0692180b99e42545f4c177dfcf28540
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata became valid
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3149 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3151 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3152 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_compile)
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_compile: Succeeded
NOTE: Running task 3153 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3154 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_install: Succeeded
NOTE: Running task 3155 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3156 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_populate_sysroot)
NOTE: Running task 3157 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_package)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 3158 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_package unihash changed to 0254df0cd0191049356f1a3d42602d0f66b6be96909c57ee9da6a4cd50d0f72d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata became valid
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_populate_sysroot unihash changed to 0680dd0b645327a826be77e4495237088b719b164f43013ef789804fd10a57f0
NOTE: Running setscene task 1231 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running task 3159 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: Running task 3160 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3162 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3163 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_configure: Started
NOTE: Running task 3164 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_configure: Succeeded
NOTE: Running task 3165 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 3166 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3167 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot)
NOTE: Running task 3168 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot unihash changed to 5602cd37342b916408b4e9706af66b2b3ca61adf243f3e33157859303160657b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1214 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1218 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running task 3169 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3170 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3171 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe util-linux-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3174 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_configure)
NOTE: recipe util-linux-2.40.1-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: Running task 3175 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: recipe shadow-4.15.1-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 3176 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: Running task 3178 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3179 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_compile: Succeeded
NOTE: Running task 3180 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_install)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_install: Succeeded
NOTE: Running task 3181 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot)
NOTE: Running task 3182 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_package)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot unihash changed to c53ac2a032bc40cbacba1eb3a9addcec0db98840196087d3d7cffe10482e11a1
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to 77b91054eebb535adf57c5e4ff02d4dc9b3011ba94c91c82b6171c560049be2d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 1224 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3184 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx)
NOTE: Running task 3185 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_package unihash changed to fcd1d59019e32bb345111107e9091fae5d165e677a5bb5b83de70b4c882d8edb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata became valid
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3187 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3188 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_collect_spdx_deps)
NOTE: Running task 3189 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_collect_spdx_deps)
NOTE: Running task 3190 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package unihash changed to bbc7694b2da9bc37ff732b21f6a3f180a3d32c5bd9132cf17a3d5ce23e8e4bb3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata became valid
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3192 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx)
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3193 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_compile)
NOTE: recipe shadow-4.15.1-r0: task do_compile: Started
NOTE: recipe shadow-4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_install)
NOTE: recipe shadow-4.15.1-r0: task do_install: Started
NOTE: recipe shadow-4.15.1-r0: task do_install: Succeeded
NOTE: Running task 3196 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package)
NOTE: recipe shadow-4.15.1-r0: task do_package: Started
NOTE: recipe shadow-4.15.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package unihash changed to f84c951a6998fea1f5f935eeeaf348a9e2af5c1b7c0547def50544a052747040
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata became valid
NOTE: Running setscene task 1235 of 1235 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3203 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.40.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3209 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.1-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3212 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_compile)
NOTE: recipe util-linux-2.40.1-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 3213 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.1-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3214 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_install)
NOTE: recipe util-linux-2.40.1-r0: task do_install: Started
NOTE: recipe util-linux-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 3215 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3216 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot)
NOTE: Running task 3217 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_package)
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3218 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3219 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3220 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3221 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3222 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3223 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3224 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running task 3225 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3226 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_configure: Succeeded
NOTE: Running task 3227 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3228 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3229 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3230 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 3231 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package: Succeeded
NOTE: Running task 3232 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata)
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3233 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3234 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: Running task 3235 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3236 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to f40c30d626b1426ca936303468866adff47bcd9ccc00d46c907436f92a6c012c
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3237 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_collect_spdx_deps)
NOTE: Running task 3238 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3239 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package unihash changed to 0b230d4953db6dad8ab439a4ba0be096857ec2e56c279fe91c7dcc8b261ed036
NOTE: Setscene tasks completed
NOTE: Running task 3240 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata)
NOTE: recipe coreutils-9.5-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata unihash changed to 424513c094065095027ec1a8858f8044a84e927f52cb125403e88739033824d6
NOTE: Setscene tasks completed
NOTE: Running task 3241 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk)
NOTE: Running task 3242 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb)
NOTE: Running task 3243 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 3244 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 3245 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot)
NOTE: Running task 3246 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk unihash changed to b25c6c04e65c6e3c74261a68b57ae5fe115432ca6908ecd02da6f7e9dfc44972
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_compile: Succeeded
NOTE: Running task 3247 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3248 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb unihash changed to bcdc71e7f9cada6a2ed583153e503817eb129355c40eabce7ea05dc8cc025580
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3249 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3250 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm unihash changed to 05729d0e7f2af068cd999a585d4b79e46fefe1ab7bf41050ee7bd3c25683cfe0
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_install: Succeeded
NOTE: Running task 3251 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3252 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot)
NOTE: Running task 3253 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3254 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3255 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3256 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3257 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3258 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3259 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe libslirp-4.8.0-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3260 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure: Started
NOTE: recipe libslirp-4.8.0-r0: task do_configure: Succeeded
NOTE: Running task 3261 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_compile)
NOTE: recipe libslirp-4.8.0-r0: task do_compile: Started
NOTE: recipe libslirp-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 3262 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_install)
NOTE: recipe libslirp-4.8.0-r0: task do_install: Started
NOTE: recipe libslirp-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 3263 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 3264 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3265 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 3266 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3267 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3268 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3269 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3270 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata)
NOTE: Running task 3271 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3272 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata unihash changed to 7033df7bd96d24bb23c2e1c9d7b9f52b6a462f6b249b0602c5a8c8dda167861d
NOTE: Setscene tasks completed
NOTE: Running task 3273 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx)
NOTE: Running task 3274 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_package)
NOTE: recipe virglrenderer-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3275 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx: Started
NOTE: recipe libslirp-4.8.0-r0: task do_package: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3276 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to bb6ede44dd5a20d0630baee643032f0db5244bbc333678ff48f7cc469e1a370a
NOTE: Setscene tasks completed
NOTE: Running task 3277 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3278 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libslirp-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 3279 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_packagedata)
NOTE: recipe libslirp-4.8.0-r0: task do_packagedata: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_packagedata unihash changed to 5694bcaa36597529648253c3a246d5bc73a6b303b4d38ad3f79b2dfe914b85b2
NOTE: Setscene tasks completed
NOTE: recipe virglrenderer-1.0.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3280 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_compile)
NOTE: recipe virglrenderer-1.0.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3281 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_collect_spdx_deps)
NOTE: Running task 3282 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: Running task 3283 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe libslirp-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3284 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_create_spdx)
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe libslirp-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3285 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3286 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile)
NOTE: recipe dbus-1.14.10-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3288 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install)
NOTE: recipe dbus-1.14.10-r0: task do_install: Started
NOTE: recipe dbus-1.14.10-r0: task do_install: Succeeded
NOTE: Running task 3289 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3290 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot)
NOTE: Running task 3291 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_package: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3292 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3293 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.67-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 3294 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_install)
NOTE: recipe virglrenderer-1.0.1-r0: task do_install: Started
NOTE: recipe ell-0.67-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3295 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_configure)
NOTE: recipe ell-0.67-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3296 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe virglrenderer-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 3297 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: Running task 3298 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_package)
NOTE: recipe virglrenderer-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_package: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe virglrenderer-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 3299 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_packagedata)
NOTE: recipe dbus-1.14.10-r0: task do_package: Succeeded
NOTE: Running task 3300 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata)
NOTE: recipe virglrenderer-1.0.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_packagedata unihash changed to dba4c9808b482fa3266a631d070099b4fff293946f2d783709f5a2bbb8a8118b
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata unihash changed to 39437ee7c4aecb1cb3f7ee9b7712d858917ccfe6944577c92c0bf37ed43b10cf
NOTE: Setscene tasks completed
NOTE: Running task 3301 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3302 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: Running task 3303 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3304 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_collect_spdx_deps)
NOTE: Running task 3305 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.67-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.67-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 3307 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3308 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3309 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe ell-0.67-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3310 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_compile)
NOTE: recipe ell-0.67-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 3311 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe ell-0.67-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_install)
NOTE: recipe ell-0.67-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to 5220851cb21c2510260f690916d938e96bcc18f3ce8715374bb14345d7f6c5ec
NOTE: Setscene tasks completed
NOTE: Running task 3313 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe ell-0.67-r0: task do_install: Succeeded
NOTE: Running task 3314 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_populate_sysroot)
NOTE: Running task 3315 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_package)
NOTE: recipe ell-0.67-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.67-r0: task do_package: Started
NOTE: recipe ell-0.67-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3316 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3317 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe ell-0.67-r0: task do_package: Succeeded
NOTE: Running task 3318 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_packagedata)
NOTE: recipe ell-0.67-r0: task do_packagedata: Started
NOTE: recipe ell-0.67-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_packagedata unihash changed to 4fc35ef75e4943f3d8be079e6c90ae6ab4da94e63dbc4fd9c11825058836684d
NOTE: Setscene tasks completed
NOTE: Running task 3319 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_create_spdx)
NOTE: recipe ell-0.67-r0: task do_create_spdx: Started
NOTE: recipe ell-0.67-r0: task do_create_spdx: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3320 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 3321 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 3322 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: Running task 3323 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3324 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3325 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_configure)
NOTE: recipe bluez5-5.77-r0: task do_configure: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Running task 3326 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata unihash changed to 123e367b356e986ec559940ff21236eebcc25cd0db122026b5cbbc3441e79424
NOTE: Setscene tasks completed
NOTE: Running task 3327 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3328 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3329 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3330 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3331 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3332 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.77-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.77-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3333 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_compile)
NOTE: recipe bluez5-5.77-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3334 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata unihash changed to c9ce5b6f5b7eabbb7d6cc61f67116df6ff4eb377fd7e7408781f340b38773200
NOTE: Setscene tasks completed
NOTE: Running task 3335 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_compile: Succeeded
NOTE: Running task 3336 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.77-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.77-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3337 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_install)
NOTE: recipe bluez5-5.77-r0: task do_install: Started
NOTE: recipe bluez5-5.77-r0: task do_install: Succeeded
NOTE: Running task 3338 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.77-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.77-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3339 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_populate_sysroot)
NOTE: Running task 3340 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_package)
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.77-r0: task do_package: Started
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3341 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3342 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_configure)
NOTE: recipe ofono-2.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.77-r0: task do_package: Succeeded
NOTE: Running task 3343 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata)
NOTE: recipe bluez5-5.77-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.77-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata unihash changed to bf6b89f1b524be8ba794390979427edaa89d0bb00befc44c69872c212adf7841
NOTE: Setscene tasks completed
NOTE: Running task 3344 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_create_spdx)
NOTE: recipe bluez5-5.77-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 3345 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3346 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_compile)
NOTE: recipe ofono-2.9-r0: task do_compile: Started
NOTE: recipe ofono-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3347 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_install)
NOTE: recipe ofono-2.9-r0: task do_install: Started
NOTE: recipe ofono-2.9-r0: task do_install: Succeeded
NOTE: Running task 3348 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_populate_sysroot)
NOTE: Running task 3349 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_package)
NOTE: recipe ofono-2.9-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.9-r0: task do_package: Started
NOTE: recipe ofono-2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3350 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3351 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Started
NOTE: recipe ofono-2.9-r0: task do_package: Succeeded
NOTE: Running task 3352 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_packagedata)
NOTE: recipe ofono-2.9-r0: task do_packagedata: Started
NOTE: recipe ofono-2.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_packagedata unihash changed to c660ed5397b32af17737ac31631825ce4fb1aeb51e21c70dbd374fe6394d4f90
NOTE: Setscene tasks completed
NOTE: Running task 3353 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_create_spdx)
NOTE: recipe ofono-2.9-r0: task do_create_spdx: Started
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3354 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_compile)
NOTE: recipe ofono-2.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3355 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Succeeded
NOTE: Running task 3356 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_install: Succeeded
NOTE: Running task 3357 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot)
NOTE: Running task 3358 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package)
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3359 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.30.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3360 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_configure)
NOTE: recipe libsdl2-2.30.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Succeeded
NOTE: Running task 3361 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata)
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata unihash changed to 9e489d70e3e6b31a0314a91e87a0d946891dca6102d6be5474d4366de3f18dfb
NOTE: Setscene tasks completed
NOTE: Running task 3362 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_create_spdx)
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Started
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3363 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_collect_spdx_deps)
NOTE: recipe libsdl2-2.30.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsdl2-2.30.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3364 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_compile)
NOTE: recipe libsdl2-2.30.5-r0: task do_compile: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_compile: Succeeded
NOTE: Running task 3365 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_install)
NOTE: recipe libsdl2-2.30.5-r0: task do_install: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_install: Succeeded
NOTE: Running task 3366 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_populate_sysroot)
NOTE: Running task 3367 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_package)
NOTE: recipe libsdl2-2.30.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_package: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3368 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemu-9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qemu-9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3369 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_configure)
NOTE: recipe qemu-9.0.2-r0: task do_configure: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_package: Succeeded
NOTE: Running task 3370 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_packagedata)
NOTE: recipe libsdl2-2.30.5-r0: task do_packagedata: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_packagedata unihash changed to 529de7e27a51525c04e28e2d90d61c780fe278ea6a443b8f4ffe1db117082cae
NOTE: Setscene tasks completed
NOTE: Running task 3371 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb:do_create_spdx)
NOTE: recipe libsdl2-2.30.5-r0: task do_create_spdx: Started
NOTE: recipe libsdl2-2.30.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3372 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe qemu-9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemu-9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3373 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_configure_ptest_base)
NOTE: recipe qemu-9.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe qemu-9.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3374 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_compile)
NOTE: recipe qemu-9.0.2-r0: task do_compile: Started
NOTE: recipe qemu-9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3375 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_compile_ptest_base)
NOTE: recipe qemu-9.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe qemu-9.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3376 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_install)
NOTE: recipe qemu-9.0.2-r0: task do_install: Started
NOTE: recipe qemu-9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3377 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_install_ptest_base)
NOTE: recipe qemu-9.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe qemu-9.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3378 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_package)
NOTE: Running task 3379 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe qemu-9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe qemu-9.0.2-r0: task do_package: Started
NOTE: recipe qemu-9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3380 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_packagedata)
NOTE: recipe qemu-9.0.2-r0: task do_packagedata: Started
NOTE: recipe qemu-9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3381 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_create_spdx)
NOTE: Running task 3382 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_package_write_ipk)
NOTE: Running task 3383 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_package_write_deb)
NOTE: Running task 3384 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_package_write_rpm)
NOTE: Running task 3385 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_package_qa)
NOTE: recipe qemu-9.0.2-r0: task do_create_spdx: Started
NOTE: recipe qemu-9.0.2-r0: task do_package_write_ipk: Started
NOTE: recipe qemu-9.0.2-r0: task do_package_write_deb: Started
NOTE: recipe qemu-9.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe qemu-9.0.2-r0: task do_package_qa: Started
NOTE: recipe qemu-9.0.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3386 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_create_package_spdx)
NOTE: recipe qemu-9.0.2-r0: task do_create_package_spdx: Started
NOTE: recipe qemu-9.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe qemu-9.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3387 of 3387 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3387 tasks of which 2845 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7814403598213097762==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-qemu-native-qemu-system-native-upgrade-9.0.1-9..patch"

RnJvbSA1NmJmNjYyZjVlYTJlNzEzZWI0ZTc5MzFhNWJiNGYyZWU3ODJmMjI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwNjo0OTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUscWVtdS1uYXRpdmUscWVtdS1zeXN0ZW0tbmF0aXZlOiB1cGdyYWRlIDkuMC4xIC0+CiA5LjAu
Miw5LjAuMSAtPiA5LjAuMiw5LjAuMSAtPiA5LjAuMgoKLS0tCiAuLi51LW5hdGl2ZV85LjAuMS5i
YiA9PiBxZW11LW5hdGl2ZV85LjAuMi5iYn0gfCAgMSArCiAuLi5lXzkuMC4xLmJiID0+IHFlbXUt
c3lzdGVtLW5hdGl2ZV85LjAuMi5iYn0gfCAgMSArCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LmluYyAgICAgICAgICAgfCAgMiArLQogLi4ubi1lbnZpcm9ubWVudC1zcGFjZS10by1i
b290LWxvYWRlci1xLnBhdGNoIHwgIDkgKystLQogLi4uLzAwMDItYXBpYy1maXh1cC1mYWxsdGhy
b3VnaC10by1QSUMucGF0Y2ggIHwgIDkgKystLQogLi4uZGQtcGtnLWNvbmZpZy1oYW5kbGluZy1m
b3ItbGliZ2NyeXB0LnBhdGNoIHwgIDkgKystLQogLi4ubXUtRG8tbm90LWluY2x1ZGUtZmlsZS1p
Zi1ub3QtZXhpc3RzLnBhdGNoIHwgIDkgKystLQogLi4uZXItc3BhY2UtbW1hcC10d2Vha3MtdG8t
YWRkcmVzcy1tdXNsLnBhdGNoIHwgMTAgKystLQogLi4uL3FlbXUvMDAwNi1xZW11LURldGVybWlu
aXNtLWZpeGVzLnBhdGNoICAgIHwgIDkgKystLQogLi4uZC11c2UtcmVsYXRpdmUtcGF0aC10by1y
ZWZlci10by1maWxlLnBhdGNoIHwgIDkgKystLQogLi4uYW5kLU1BUF9TSEFSRURfVkFMSURBVEUt
b24tbmVlZGVkLWxpLnBhdGNoIHwgIDkgKystLQogLi4uY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQt
ZnVuY3Rpb25zLWFuLnBhdGNoIHwgNTQgKysrKysrKysrLS0tLS0tLS0tLQogLi4uZ3VyZS1sb29r
dXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIHwgMTEgKystLQogLi4uYW5kLXRoZS1w
eXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoIHwgMTIgKystLS0KIC4uLi9xZW11L3tx
ZW11XzkuMC4xLmJiID0+IHFlbXVfOS4wLjIuYmJ9ICAgICB8ICAwCiAxNSBmaWxlcyBjaGFuZ2Vk
LCA2MCBpbnNlcnRpb25zKCspLCA5NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS97cWVtdS1uYXRpdmVfOS4wLjEuYmIgPT4gcWVtdS1uYXRpdmVfOS4wLjIu
YmJ9ICg5OSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXUtc3lzdGVt
LW5hdGl2ZV85LjAuMS5iYiA9PiBxZW11LXN5c3RlbS1uYXRpdmVfOS4wLjIuYmJ9ICg5OSUpCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXVfOS4wLjEuYmIgPT4gcWVtdV85
LjAuMi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS1uYXRpdmVfOS4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5h
dGl2ZV85LjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV85LjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfOS4wLjIuYmIKaW5kZXggYTc3OTUzNTI5Yi4u
MjZmYTg0YzE4MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1u
YXRpdmVfOS4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRp
dmVfOS4wLjIuYmIKQEAgLTcsMyArNyw0IEBAIHJlcXVpcmUgcWVtdS1uYXRpdmUuaW5jCiBFWFRS
QV9PRUNPTkY6YXBwZW5kID0gIiAtLXRhcmdldC1saXN0PSR7QGdldF9xZW11X3VzZXJtb2RlX3Rh
cmdldF9saXN0KGQpfSAtLWRpc2FibGUtdG9vbHMgLS1kaXNhYmxlLWluc3RhbGwtYmxvYnMgLS1k
aXNhYmxlLWd1ZXN0LWFnZW50IgogCiBQQUNLQUdFQ09ORklHID8/PSAicGllIgorCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfOS4wLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfOS4wLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzkuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfOS4wLjIuYmIKaW5kZXggNWQyZmJjYmMw
Mi4uZTdiYmU1ZDI5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS1zeXN0ZW0tbmF0aXZlXzkuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUtc3lzdGVtLW5hdGl2ZV85LjAuMi5iYgpAQCAtMjksMyArMjksNCBAQCBkb19pbnN0YWxs
OmFwcGVuZCgpIHsKICAgICBpbnN0YWxsIC1kICR7RH0ke2xpYmRpcn0vcWVtdS1weXRob24vcW1w
LwogICAgIGluc3RhbGwgLUQgJHtTfS9weXRob24vcWVtdS9xbXAvKiAke0R9JHtsaWJkaXJ9L3Fl
bXUtcHl0aG9uL3FtcC8KIH0KKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwppbmRleCA0
YTE1Yzk3ZDkzLi5mMzdiMzI5ODViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwpA
QCAtMzcsNyArMzcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtC
UE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
InFlbXUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJkMGY0ZGIwZmJkMTUxYzBjZjE2Zjg0YWViMmE1MDBmNmU5NTAwOTczMjU0NmY0NGRhZmFiOGQy
MDQ5YmJiODA1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE4YzNmNTk2YWVjZTk2ZGEzYjAwY2Fm
Yjc0YmFhZmEwZDE0NTE1ZWFmYjhlZDFlZTNmN2Y1YzJkMGViZjAyYjYiCiAKIENWRV9TVEFUVVNb
Q1ZFLTIwMDctMDk5OF0gPSAibm90LWFwcGxpY2FibGUtY29uZmlnOiBUaGUgVk5DIHNlcnZlciBj
YW4gZXhwb3NlIGhvc3QgZmlsZXMgdWRlciBzb21lIGNpcmN1bXN0YW5jZXMuIFdlIGRvbid0IGVu
YWJsZSBpdCBieSBkZWZhdWx0LiIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJv
b3QtbG9hZGVyLXEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEt
cWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRj
aAppbmRleCAyMzMzY2M4NDMyLi5hMWRiM2RlMjI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3Bh
Y2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1s
b2FkZXItcS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZTliYWYwN2E2NjdhMWMwNGI1N2Ux
NDc3NmNjNGZhMzg3NDQ4YzkwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDdlMjM2
ZDU1OGJhMzFmYmM1YWJmZGNhYTgzYjhmYTVmNzNmZTEzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEphc29uIFdlc3NlbCA8amFzb24ud2Vzc2VsQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBGcmksIDI4IE1hciAyMDE0IDE3OjQyOjQzICswODAwCi1TdWJqZWN0OiBbUEFUQ0ggMDEvMTFd
IHFlbXU6IEFkZCBhZGRpdGlvbiBlbnZpcm9ubWVudCBzcGFjZSB0byBib290IGxvYWRlcgorU3Vi
amVjdDogW1BBVENIXSBxZW11OiBBZGQgYWRkaXRpb24gZW52aXJvbm1lbnQgc3BhY2UgdG8gYm9v
dCBsb2FkZXIKICBxZW11LXN5c3RlbS1taXBzCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSAtIE9FIHVzZXMgZGVlcCBwYXRocwpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9ody9taXBzL21hbHRh
LmMgYi9ody9taXBzL21hbHRhLmMKLWluZGV4IGFmNzQwMDhjODIuLmE1ODhiOWFkNGUgMTAwNjQ0
CitpbmRleCBhZjc0MDA4YzguLmE1ODhiOWFkNCAxMDA2NDQKIC0tLSBhL2h3L21pcHMvbWFsdGEu
YwogKysrIGIvaHcvbWlwcy9tYWx0YS5jCiBAQCAtNjMsNyArNjMsNyBAQApAQCAtMzAsNiArMzAs
MyBAQCBpbmRleCBhZjc0MDA4YzgyLi5hNTg4YjlhZDRlIDEwMDY0NAogIAogIC8qIEhhcmR3YXJl
IGFkZHJlc3NlcyAqLwogICNkZWZpbmUgRkxBU0hfQUREUkVTUyAgICAgICAweDFlMDAwMDAwVUxM
Ci0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMu
cGF0Y2gKaW5kZXggNWY4ZmU0ZmFhMy4uNWZiYmYxMWQyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElD
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZp
eHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMjNiZjUz
NGU0NjNiZjRjMWJhMmUxMzU2ZWFmMTdiZTBiMjNiMTkyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNzg3N2FjZjBiYTlkZTgzZTgyOTkxMzk0YmRkOTJkZjBkMjQxMDM0YSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmsgQXNzZWxzdGluZSA8bWFyay5hc3NlbHN0aW5l
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI2IEZlYiAyMDEzIDExOjQzOjI4IC0wNTAwCi1T
dWJqZWN0OiBbUEFUQ0ggMDIvMTFdIGFwaWM6IGZpeHVwIGZhbGx0aHJvdWdoIHRvIFBJQworU3Vi
amVjdDogW1BBVENIXSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKIAogQ29tbWl0IDBl
MjFlMTJiYjMxMWM0YzEwOTVkMDI2OWRjMmVmODExOTZjY2I2MGEgW0Rvbid0IHJvdXRlIFBJQwog
aW50ZXJydXB0cyB0aHJvdWdoIHRoZSBsb2NhbCBBUElDIGlmIHRoZSBsb2NhbCBBUElDIGNvbmZp
ZyBzYXlzIHNvLl0KQEAgLTI5LDcgKzI5LDcgQEAgU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUu
aGVAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2h3L2ludGMvYXBpYy5jIGIvaHcvaW50Yy9hcGljLmMK
LWluZGV4IDQxODZjNTdiMzQuLjQzY2Q4MDVhOTYgMTAwNjQ0CitpbmRleCA0MTg2YzU3YjMuLjQz
Y2Q4MDVhOSAxMDA2NDQKIC0tLSBhL2h3L2ludGMvYXBpYy5jCiArKysgYi9ody9pbnRjL2FwaWMu
YwogQEAgLTc1OSw3ICs3NTksNyBAQCBpbnQgYXBpY19hY2NlcHRfcGljX2ludHIoRGV2aWNlU3Rh
dGUgKmRldikKQEAgLTQxLDYgKzQxLDMgQEAgaW5kZXggNDE4NmM1N2IzNC4uNDNjZDgwNWE5NiAx
MDA2NDQKICAgICAgICAgIHJldHVybiAtMTsKICAKICAgICAgbHZ0MCA9IHMtPmx2dFtBUElDX0xW
VF9MSU5UMF07Ci0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDMtY29uZmlndXJlLUFkZC1wa2ctY29uZmlnLWhhbmRsaW5nLWZvci1s
aWJnY3J5cHQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDMtY29u
ZmlndXJlLUFkZC1wa2ctY29uZmlnLWhhbmRsaW5nLWZvci1saWJnY3J5cHQucGF0Y2gKaW5kZXgg
MzBlMjY5ZjhmNC4uMTk5MDczOWU3OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDAzLWNvbmZpZ3VyZS1BZGQtcGtnLWNvbmZpZy1oYW5kbGluZy1mb3ItbGli
Z2NyeXB0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMy1j
b25maWd1cmUtQWRkLXBrZy1jb25maWctaGFuZGxpbmctZm9yLWxpYmdjcnlwdC5wYXRjaApAQCAt
MSw3ICsxLDcgQEAKLUZyb20gZTRmNmM2YjlmNDNiMjgyNzFiYzlkYzZjYmNhZmFkNTNmODAzODdl
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTdmYjE0MjAwOWM0YTdiNzYxNTRmODQ0
NzBlYTllYWRhZmY0OWYxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhlIFpoZSA8
emhlLmhlQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IEF1ZyAyMDE5IDE5OjU2OjI4ICsw
ODAwCi1TdWJqZWN0OiBbUEFUQ0ggMDMvMTFdIGNvbmZpZ3VyZTogQWRkIHBrZy1jb25maWcgaGFu
ZGxpbmcgZm9yIGxpYmdjcnlwdAorU3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IEFkZCBwa2ct
Y29uZmlnIGhhbmRsaW5nIGZvciBsaWJnY3J5cHQKIAogbGliZ2NyeXB0IG1heSBhbHNvIGJlIGNv
bnRyb2xsZWQgYnkgcGtnLWNvbmZpZywgdGhpcyBwYXRjaCBhZGRzIHBrZy1jb25maWcKIGhhbmRs
aW5nIGZvciBsaWJnY3J5cHQuCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEhlIFpo
ZSA8emhlLmhlQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxk
Ci1pbmRleCA5MWEwYWE2NGM2Li5lODM3M2Q1NWI4IDEwMDY0NAoraW5kZXggOTFhMGFhNjRjLi5l
ODM3M2Q1NWIgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC0xNjU1LDcgKzE2NTUsNyBAQCBlbmRpZgpAQCAtMjYsNiArMjYsMyBAQCBpbmRleCA5MWEwYWE2
NGM2Li5lODM3M2Q1NWI4IDEwMDY0NAogICAgICAgICAgICAgICAgICAgICAgICAgIHJlcXVpcmVk
OiBnZXRfb3B0aW9uKCdnY3J5cHQnKSkKICAgICAgIyBEZWJpYW4gaGFzIHJlbW92ZWQgLWxncGct
ZXJyb3IgZnJvbSBsaWJnY3J5cHQtY29uZmlnCiAgICAgICMgYXMgaXQgInNwcmVhZHMgdW5uZWNl
c3NhcnkgZGVwZW5kZW5jaWVzIiB3aGljaCBpbgotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUt
ZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCmluZGV4
IGQ5Y2FiNDI4YzQuLjEwZGEzYzhhMzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1u
b3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9t
IDUyMjNkNDZhOGQ1MzAyMzk2ZjlmYzdjYzVkODMwNzY5ZTg3MjQyZmUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDIwNTI0NGJiMzAyMmZhN2YxNDkwODVlZDhjNzhiOWMzNjIzYTM5MDAg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPbGVrc2l5IE9iaXRvdHNreXkgPG9vYml0
b3RzQGNpc2NvLmNvbT4KIERhdGU6IFdlZCwgMjUgTWFyIDIwMjAgMjE6MjE6MzUgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSCAwNC8xMV0gcWVtdTogRG8gbm90IGluY2x1ZGUgZmlsZSBpZiBub3QgZXhp
c3RzCitTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90IGV4
aXN0cwogCiBTY3JpcHQgY29uZmlndXJlIGNoZWNrcyBmb3IgaWZfYWxnLmggYW5kIGNoZWNrIGZh
aWxlZCBidXQKIGlmX2FsZy5oIHN0aWxsIGluY2x1ZGVkLgpAQCAtMTYsNyArMTYsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2FqYWxAd2luZHJpdmVyLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5
c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi1pbmRleCAzZGYyYjk0ZDlhLi4xOGYwOWYx
ZjA3IDEwMDY0NAoraW5kZXggMmVkYmQxZWYxLi44YjU1N2YwM2EgMTAwNjQ0CiAtLS0gYS9saW51
eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9zeXNjYWxsLmMKIEBAIC0xMTYsNyAr
MTE2LDkgQEAKQEAgLTI5LDYgKzI5LDMgQEAgaW5kZXggM2RmMmI5NGQ5YS4uMThmMDlmMWYwNyAx
MDA2NDQKICAjaW5jbHVkZSA8bGludXgvcnRjLmg+CiAgI2luY2x1ZGUgPHNvdW5kL2Fzb3VuZC5o
PgogICNpZmRlZiBIQVZFX0JUUkZTX0gKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2Ut
bW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1h
ZGRyZXNzLW11c2wucGF0Y2gKaW5kZXggM2M3ZjU3NzZmZi4uYjhmZTRhMTA3OCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNl
ci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFw
LXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDFjMjk1
MDY5ODU3Yjk4NTBmMTVmMmNkNmIzM2IxMzNlYTY0MWE0NTQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDE1M2UyYTZlNjk0ZTFjMWQ5NjViN2MyYmQyYzlhNWE4MGVjMjA0MTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgOCBKYW4gMjAyMSAxNzoyNzowNiArMDAw
MAotU3ViamVjdDogW1BBVENIIDA1LzExXSBxZW11OiBBZGQgc29tZSB1c2VyIHNwYWNlIG1tYXAg
dHdlYWtzIHRvIGFkZHJlc3MgbXVzbAotIDMyIGJpdAorU3ViamVjdDogW1BBVENIXSBxZW11OiBB
ZGQgc29tZSB1c2VyIHNwYWNlIG1tYXAgdHdlYWtzIHRvIGFkZHJlc3MgbXVzbCAzMiBiaXQKIAog
V2hlbiB1c2luZyBxZW11LWkzODYgdG8gYnVpbGQgcWVtdXg4NiB3ZWJraXRndGsgb24gbXVzbCwg
aXQgc2l0cyBpbiBhbgogaW5maW5pdGUgbG9vcCBvZiBtcmVtYXAgY2FsbHMgb2YgZXZlciBkZWNy
ZWFzaW5nL2luY3JlYXNpbmcgYWRkcmVzc2VzLgpAQCAtMjMsNyArMjIsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZwog
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9saW51eC11c2VyL21tYXAuYyBiL2xpbnV4LXVzZXIvbW1hcC5jCi1pbmRleCBiZTNi
OWE2OGViLi40ODEyODZmMDFkIDEwMDY0NAoraW5kZXggYmUzYjlhNjhlLi40ODEyODZmMDEgMTAw
NjQ0CiAtLS0gYS9saW51eC11c2VyL21tYXAuYwogKysrIGIvbGludXgtdXNlci9tbWFwLmMKIEBA
IC0xMDYwLDEyICsxMDYwLDE2IEBAIGFiaV9sb25nIHRhcmdldF9tcmVtYXAoYWJpX3Vsb25nIG9s
ZF9hZGRyLCBhYmlfdWxvbmcgb2xkX3NpemUsCkBAIC00Niw2ICs0NSwzIEBAIGluZGV4IGJlM2I5
YTY4ZWIuLjQ4MTI4NmYwMWQgMTAwNjQ0CiAgICAgICAgICByZXR1cm4gLTE7CiAgICAgIH0KICAK
LS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKaW5kZXggZjA3
MDU0ZjE5YS4uYzAxY2U3NzY2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gK
QEAgLTEsNyArMSw3IEBACi1Gcm9tIDlkMzJkZjgwZTMzYTc1NDE2NTg4NTg0OTdmNDViZWQxZTU5
ZTM2MjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBhNThmZDMwMmVjZWY2M2VjODg3
ZGU2ODM5MWRkOGRjYzMwYmEzZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IE1v
biwgMSBNYXIgMjAyMSAxMzowMDo0NyArMDAwMAotU3ViamVjdDogW1BBVENIIDA2LzExXSBxZW11
OiBEZXRlcm1pbmlzbSBmaXhlcworU3ViamVjdDogW1BBVENIXSBxZW11OiBEZXRlcm1pbmlzbSBm
aXhlcwogCiBXaGVuIHNvdXJjZXMgYXJlIGluY2x1ZGVkIHdpdGhpbiBkZWJ1ZyBpbmZvcm1hdGlv
biwgYSBjb3VwbGUgb2YgYXJlYXMgb2YgdGhlCiBxZW11IGJ1aWxkIGFyZSBub3QgcmVwcm9kdWNp
YmxlIGR1ZSB0byBlaXRoZXIgZnVsbCBidWlsZHBhdGhzIG9yIHRpbWVzdGFtcHMuCkBAIC0xNiw3
ICsxNiw3IEBAIFJQIDIwMjEvMy8xCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zY3JpcHRzL2RlY29kZXRyZWUucHkgYi9zY3Jp
cHRzL2RlY29kZXRyZWUucHkKLWluZGV4IGU4YjcyZGEzYTkuLjVjZDg2YjE0MjggMTAwNjQ0Citp
bmRleCBlOGI3MmRhM2EuLjVjZDg2YjE0MiAxMDA2NDQKIC0tLSBhL3NjcmlwdHMvZGVjb2RldHJl
ZS5weQogKysrIGIvc2NyaXB0cy9kZWNvZGV0cmVlLnB5CiBAQCAtMTU1OCw3ICsxNTU4LDcgQEAg
ZGVmIG1haW4oKToKQEAgLTI4LDYgKzI4LDMgQEAgaW5kZXggZThiNzJkYTNhOS4uNWNkODZiMTQy
OCAxMDA2NDQKICAgICAgICAgIGYgPSBvcGVuKGZpbGVuYW1lLCAncnQnLCBlbmNvZGluZz0ndXRm
LTgnKQogICAgICAgICAgcGFyc2VfZmlsZShmLCB0b3BwYXQpCiAgICAgICAgICBmLmNsb3NlKCkK
LS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1m
aWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1l
c29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKaW5kZXgg
NzRkZTE1OGIyZS4uMmRiYWZjMTQ0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJl
ZmVyLXRvLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUu
cGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDc3ZWJmNjdkMGM5NmY1MWRhOTFjODQ5OTIwMGVi
ZDEzZjRkY2RkNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU1N2NhNTAxZTY3OWYy
MjAzMGZlZGMwNGE2MzZjZTAwODQzYzBkNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAx
NCBKYW4gMjAyMSAwNjozMzowNCArMDAwMAotU3ViamVjdDogW1BBVENIIDA3LzExXSB0ZXN0cy9t
ZXNvbi5idWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIgdG8gZmlsZXMKK1N1YmplY3Q6
IFtQQVRDSF0gdGVzdHMvbWVzb24uYnVpbGQ6IHVzZSByZWxhdGl2ZSBwYXRoIHRvIHJlZmVyIHRv
IGZpbGVzCiAKIEZpeCBlcnJvciBsaWtlOgogRmF0YWwgZXJyb3I6IGNhbid0IGNyZWF0ZSB0ZXN0
cy9wdGltZXItdGVzdC5wLy4uLl9xZW11LTUuMi4wX2h3X2NvcmVfcHRpbWVyLmMubzogRmlsZSBu
YW1lIHRvbyBsb25nCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBM
aSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3VuaXQvbWVzb24u
YnVpbGQgYi90ZXN0cy91bml0L21lc29uLmJ1aWxkCi1pbmRleCAyMjhhMjFkMDNjLi4yNzJmYjRj
NmNhIDEwMDY0NAoraW5kZXggMjI4YTIxZDAzLi4yNzJmYjRjNmMgMTAwNjQ0CiAtLS0gYS90ZXN0
cy91bml0L21lc29uLmJ1aWxkCiArKysgYi90ZXN0cy91bml0L21lc29uLmJ1aWxkCiBAQCAtNDcs
NyArNDcsNyBAQCB0ZXN0cyA9IHsKQEAgLTM4LDYgKzM4LDMgQEAgaW5kZXggMjI4YTIxZDAzYy4u
MjcyZmI0YzZjYSAxMDA2NDQKICAgICAgJ3Rlc3Qtdm1zdGF0ZSc6IFttaWdyYXRpb24sIGlvXSwK
ICAgICAgJ3Rlc3QteWFuayc6IFsnc29ja2V0LWhlbHBlcnMuYycsIHFvbSwgaW8sIGNoYXJkZXZd
CiAgICB9Ci0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9u
LW5lZWRlZC1saS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1E
ZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNo
CmluZGV4IDJlMjg1OTBlMTEuLmM3YmRkNDg2MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFM
SURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVl
ZGVkLWxpLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSAyMWIxNTlhMTFiYmNiMWVlYjI2ZjEy
NDU2ZTRjM2ZkNjJhMDZjYmVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ZGYyYjM4
YWQ2ZjZjYjAxYzMxMzdkYWUzZDA4ZWQzN2RlOTEzZTFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjEgTWFy
IDIwMjIgMTA6MDk6MzggLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCAwOC8xMV0gRGVmaW5lIE1BUF9T
WU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5lZWRlZCBsaW51eAorU3ViamVjdDogW1BB
VENIXSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURfVkFMSURBVEUgb24gbmVlZGVkIGxp
bnV4CiAgc3lzdGVtcwogCiBsaW51eCBvbmx5IHdpcmVzIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVE
X1ZBTElEQVRFIGZvciBhcmNoaXRlY3R1cmVzCkBAIC0xOCw3ICsxOCw3IEBAIENjOiBNaWNoYWVs
IFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS91dGlsL21tYXAtYWxsb2MuYyBi
L3V0aWwvbW1hcC1hbGxvYy5jCi1pbmRleCBlZDE0ZjljNjRkLi4wMzhmNWI0YjU1IDEwMDY0NAor
aW5kZXggZWQxNGY5YzY0Li4wMzhmNWI0YjUgMTAwNjQ0CiAtLS0gYS91dGlsL21tYXAtYWxsb2Mu
YwogKysrIGIvdXRpbC9tbWFwLWFsbG9jLmMKIEBAIC0xMCwxNCArMTAsMTggQEAKQEAgLTQzLDYg
KzQzLDMgQEAgaW5kZXggZWQxNGY5YzY0ZC4uMDM4ZjViNGI1NSAxMDA2NDQKICAjaW5jbHVkZSAi
cWVtdS9tbWFwLWFsbG9jLmgiCiAgI2luY2x1ZGUgInFlbXUvaG9zdC11dGlscy5oIgogICNpbmNs
dWRlICJxZW11L2N1dGlscy5oIgotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA5LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZz
NjQtcmVsYXRlZC1mdW5jdGlvbnMtYW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDktbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxhdGVkLWZ1bmN0
aW9ucy1hbi5wYXRjaAppbmRleCA3NTc3MjQ5ZDM5Li42OGMyNmU1MmQ2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDktbGludXgtdXNlci1SZXBsYWNlLXVz
ZS1vZi1sZnM2NC1yZWxhdGVkLWZ1bmN0aW9ucy1hbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDktbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1y
ZWxhdGVkLWZ1bmN0aW9ucy1hbi5wYXRjaApAQCAtMSw4ICsxLDcgQEAKLUZyb20gMjNkZTMwMDc5
ZGJmNDdhODAyNmZhZGRkNTUwYTllMTgxZDYwOWM4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMGNmMTJjM2NkMDAzZjJhY2M4YzFjYjc2NWU2MmQ1YjY4YzQ4ZjViMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRl
OiBTYXQsIDE3IERlYyAyMDIyIDA4OjM3OjQ2IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0ggMDkvMTFd
IGxpbnV4LXVzZXI6IFJlcGxhY2UgdXNlIG9mIGxmczY0IHJlbGF0ZWQgZnVuY3Rpb25zIGFuZAot
IG1hY3JvcworU3ViamVjdDogW1BBVENIXSBsaW51eC11c2VyOiBSZXBsYWNlIHVzZSBvZiBsZnM2
NCByZWxhdGVkIGZ1bmN0aW9ucyBhbmQgbWFjcm9zCiAKIEJ1aWxkcyBkZWZpbmVzIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgd2hpY2ggbWFrZXMgdGhlIG9yaWdpbmFsIGZ1bmN0aW9ucwogYW5mIG1h
Y3JvcyBiZWhhdmUgc2FtZSBhcyB0aGVpciA2NCBzdWZmaXhlZCBjb3VudGVycGFydHMuIFRoaXMg
YWxzbwpAQCAtMTcsNyArMTYsNyBAQCBDYzogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVy
LmV1PgogIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxMTQgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2Fs
bC5jCi1pbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAoraW5kZXggOGI1NTdmMDNh
Li5jYjUwOTdjODggMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGlu
dXgtdXNlci9zeXNjYWxsLmMKIEBAIC03NjEsOCArNzYxLDggQEAgc2FmZV9zeXNjYWxsNihzc2l6
ZV90LCBjb3B5X2ZpbGVfcmFuZ2UsIGludCwgaW5mZCwgbG9mZl90ICosIHBpbm9mZiwKQEAgLTMx
LDcgKzMwLDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgKiBUaGlz
IHdpbGwgdGhlbiB3b3JrIGFuZCB1c2UgYSA2NC1iaXQgb2Zmc2V0IGZvciBib3RoIDMyLWJpdCBh
bmQgNjQtYml0IGhvc3RzLgogICAqLwogICNpZmRlZiBfX05SX2ZjbnRsNjQKLUBAIC02NzM5LDEz
ICs2NzM5LDEzIEBAIHN0YXRpYyBpbnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQp
CitAQCAtNjczNCwxMyArNjczNCwxMyBAQCBzdGF0aWMgaW50IHRhcmdldF90b19ob3N0X2ZjbnRs
X2NtZChpbnQgY21kKQogICAgICAgICAgcmV0ID0gY21kOwogICAgICAgICAgYnJlYWs7CiAgICAg
IGNhc2UgVEFSR0VUX0ZfR0VUTEs6CkBAIC00OCw3ICs0Nyw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcu
LjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICBicmVhazsKICAgICAgY2FzZSBUQVJHRVRfRl9H
RVRPV046CiAgICAgICAgICByZXQgPSBGX0dFVE9XTjsKLUBAIC02NzU5LDE3ICs2NzU5LDYgQEAg
c3RhdGljIGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKK0BAIC02NzU0LDE3
ICs2NzU0LDYgQEAgc3RhdGljIGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkK
ICAgICAgY2FzZSBUQVJHRVRfRl9TRVRTSUc6CiAgICAgICAgICByZXQgPSBGX1NFVFNJRzsKICAg
ICAgICAgIGJyZWFrOwpAQCAtNjYsNyArNjUsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBh
MmE3IDEwMDY0NAogICAgICBjYXNlIFRBUkdFVF9GX1NFVExFQVNFOgogICAgICAgICAgcmV0ID0g
Rl9TRVRMRUFTRTsKICAgICAgICAgIGJyZWFrOwotQEAgLTY4MjEsOCArNjgxMCw4IEBAIHN0YXRp
YyBpbnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQpCitAQCAtNjgxNiw4ICs2ODA1
LDggQEAgc3RhdGljIGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKICAgICAg
ICogdGhlbSB0byA1LCA2IGFuZCA3IGJlZm9yZSBtYWtpbmcgdGhlIHN5c2NhbGwoKS4gU2luY2Ug
d2UgbWFrZSB0aGUKICAgICAgICogc3lzY2FsbCBkaXJlY3RseSwgYWRqdXN0IHRvIHdoYXQgaXMg
c3VwcG9ydGVkIGJ5IHRoZSBrZXJuZWwuCiAgICAgICAqLwpAQCAtNzcsNyArNzYsNyBAQCBpbmRl
eCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICB9CiAgI2VuZGlmCiAgCi1AQCAt
Njg1NSw1NSArNjg0NCwxMSBAQCBzdGF0aWMgaW50IGhvc3RfdG9fdGFyZ2V0X2Zsb2NrKGludCB0
eXBlKQorQEAgLTY4NTAsNTUgKzY4MzksMTEgQEAgc3RhdGljIGludCBob3N0X3RvX3RhcmdldF9m
bG9jayhpbnQgdHlwZSkKICAgICAgcmV0dXJuIHR5cGU7CiAgfQogIApAQCAtMTM2LDcgKzEzNSw3
IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgIGFiaV9zaG9ydCBs
X3R5cGU7CiAgICAgIGFiaV9zaG9ydCBsX3doZW5jZTsKICAgICAgYWJpX2xsb25nIGxfc3RhcnQ7
Ci1AQCAtNjkxMSwxMCArNjg1NiwxMCBAQCBzdHJ1Y3QgdGFyZ2V0X29hYmlfZmxvY2s2NCB7CitA
QCAtNjkwNiwxMCArNjg1MSwxMCBAQCBzdHJ1Y3QgdGFyZ2V0X29hYmlfZmxvY2s2NCB7CiAgICAg
IGFiaV9pbnQgICBsX3BpZDsKICB9IFFFTVVfUEFDS0VEOwogIApAQCAtMTQ5LDcgKzE0OCw3IEBA
IGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgIGludCBsX3R5cGU7CiAg
CiAgICAgIGlmICghbG9ja191c2VyX3N0cnVjdChWRVJJRllfUkVBRCwgdGFyZ2V0X2ZsLCB0YXJn
ZXRfZmxvY2tfYWRkciwgMSkpIHsKLUBAIC02OTM1LDEwICs2ODgwLDEwIEBAIHN0YXRpYyBpbmxp
bmUgYWJpX2xvbmcgY29weV9mcm9tX3VzZXJfb2FiaV9mbG9jazY0KHN0cnVjdCBmbG9jazY0ICpm
bCwKK0BAIC02OTMwLDEwICs2ODc1LDEwIEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV9m
cm9tX3VzZXJfb2FiaV9mbG9jazY0KHN0cnVjdCBmbG9jazY0ICpmbCwKICAgICAgcmV0dXJuIDA7
CiAgfQogIApAQCAtMTYzLDcgKzE2Miw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcg
MTAwNjQ0CiAgICAgIHNob3J0IGxfdHlwZTsKICAKICAgICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0
KFZFUklGWV9XUklURSwgdGFyZ2V0X2ZsLCB0YXJnZXRfZmxvY2tfYWRkciwgMCkpIHsKLUBAIC02
OTU2LDEwICs2OTAxLDEwIEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV90b191c2VyX29h
YmlfZmxvY2s2NChhYmlfdWxvbmcgdGFyZ2V0X2Zsb2NrX2FkZHIsCitAQCAtNjk1MSwxMCArNjg5
NiwxMCBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfdG9fdXNlcl9vYWJpX2Zsb2NrNjQo
YWJpX3Vsb25nIHRhcmdldF9mbG9ja19hZGRyLAogIH0KICAjZW5kaWYKICAKQEAgLTE3Niw3ICsx
NzUsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBpbnQgbF90
eXBlOwogIAogICAgICBpZiAoIWxvY2tfdXNlcl9zdHJ1Y3QoVkVSSUZZX1JFQUQsIHRhcmdldF9m
bCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDEpKSB7Ci1AQCAtNjk4MCwxMCArNjkyNSwxMCBAQCBzdGF0
aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfZnJvbV91c2VyX2Zsb2NrNjQoc3RydWN0IGZsb2NrNjQg
KmZsLAorQEAgLTY5NzUsMTAgKzY5MjAsMTAgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBjb3B5
X2Zyb21fdXNlcl9mbG9jazY0KHN0cnVjdCBmbG9jazY0ICpmbCwKICAgICAgcmV0dXJuIDA7CiAg
fQogIApAQCAtMTkwLDcgKzE4OSw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAw
NjQ0CiAgICAgIHNob3J0IGxfdHlwZTsKICAKICAgICAgaWYgKCFsb2NrX3VzZXJfc3RydWN0KFZF
UklGWV9XUklURSwgdGFyZ2V0X2ZsLCB0YXJnZXRfZmxvY2tfYWRkciwgMCkpIHsKLUBAIC03MDAy
LDcgKzY5NDcsNyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfdG9fdXNlcl9mbG9jazY0
KGFiaV91bG9uZyB0YXJnZXRfZmxvY2tfYWRkciwKK0BAIC02OTk3LDcgKzY5NDIsNyBAQCBzdGF0
aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfdG9fdXNlcl9mbG9jazY0KGFiaV91bG9uZyB0YXJnZXRf
ZmxvY2tfYWRkciwKICAKICBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZkLCBpbnQgY21k
LCBhYmlfdWxvbmcgYXJnKQogIHsKQEAgLTE5OSw3ICsxOTgsNyBAQCBpbmRleCAxOGYwOWYxZjA3
Li4xYjdjNTBhMmE3IDEwMDY0NAogICNpZmRlZiBGX0dFVE9XTl9FWAogICAgICBzdHJ1Y3QgZl9v
d25lcl9leCBmb3g7CiAgICAgIHN0cnVjdCB0YXJnZXRfZl9vd25lcl9leCAqdGFyZ2V0X2ZveDsK
LUBAIC03MDE1LDYgKzY5NjAsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZkLCBp
bnQgY21kLCBhYmlfdWxvbmcgYXJnKQorQEAgLTcwMTAsNiArNjk1NSw3IEBAIHN0YXRpYyBhYmlf
bG9uZyBkb19mY250bChpbnQgZmQsIGludCBjbWQsIGFiaV91bG9uZyBhcmcpCiAgCiAgICAgIHN3
aXRjaChjbWQpIHsKICAgICAgY2FzZSBUQVJHRVRfRl9HRVRMSzoKQEAgLTIwNyw3ICsyMDYsNyBA
QCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgcmV0ID0gY29w
eV9mcm9tX3VzZXJfZmxvY2soJmZsNjQsIGFyZyk7CiAgICAgICAgICBpZiAocmV0KSB7CiAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKLUBAIC03MDI0LDMyICs2OTcwLDExIEBAIHN0YXRpYyBhYmlf
bG9uZyBkb19mY250bChpbnQgZmQsIGludCBjbWQsIGFiaV91bG9uZyBhcmcpCitAQCAtNzAxOSwz
MiArNjk2NSwxMSBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZkLCBpbnQgY21kLCBh
YmlfdWxvbmcgYXJnKQogICAgICAgICAgICAgIHJldCA9IGNvcHlfdG9fdXNlcl9mbG9jayhhcmcs
ICZmbDY0KTsKICAgICAgICAgIH0KICAgICAgICAgIGJyZWFrOwpAQCAtMjQxLDcgKzI0MCw3IEBA
IGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICBpZiAocmV0KSB7
CiAgICAgICAgICAgICAgcmV0dXJuIHJldDsKICAgICAgICAgIH0KLUBAIC03Mjc4LDcgKzcyMDMs
NyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIHRhcmdldF90cnVuY2F0ZTY0KENQVUFyY2hTdGF0
ZSAqY3B1X2VudiwgY29uc3QgY2hhciAqYXJnMQorQEAgLTcyNzksNyArNzIwNCw3IEBAIHN0YXRp
YyBpbmxpbmUgYWJpX2xvbmcgdGFyZ2V0X3RydW5jYXRlNjQoQ1BVQXJjaFN0YXRlICpjcHVfZW52
LCBjb25zdCBjaGFyICphcmcxCiAgICAgICAgICBhcmcyID0gYXJnMzsKICAgICAgICAgIGFyZzMg
PSBhcmc0OwogICAgICB9CkBAIC0yNTAsNyArMjQ5LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3
YzUwYTJhNyAxMDA2NDQKICB9CiAgI2VuZGlmCiAgCi1AQCAtNzI5Miw3ICs3MjE3LDcgQEAgc3Rh
dGljIGlubGluZSBhYmlfbG9uZyB0YXJnZXRfZnRydW5jYXRlNjQoQ1BVQXJjaFN0YXRlICpjcHVf
ZW52LCBhYmlfbG9uZyBhcmcxLAorQEAgLTcyOTMsNyArNzIxOCw3IEBAIHN0YXRpYyBpbmxpbmUg
YWJpX2xvbmcgdGFyZ2V0X2Z0cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgYWJpX2xv
bmcgYXJnMSwKICAgICAgICAgIGFyZzIgPSBhcmczOwogICAgICAgICAgYXJnMyA9IGFyZzQ7CiAg
ICAgIH0KQEAgLTI1OSw3ICsyNTgsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEw
MDY0NAogIH0KICAjZW5kaWYKICAKLUBAIC04NjY3LDcgKzg1OTIsNyBAQCBzdGF0aWMgaW50IGRv
X2dldGRlbnRzKGFiaV9sb25nIGRpcmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkK
K0BAIC04NjY4LDcgKzg1OTMsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRp
cmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKICAgICAgdm9pZCAqdGRpcnA7CiAg
ICAgIGludCBobGVuLCBob2ZmLCB0b2ZmOwogICAgICBpbnQgaHJlY2xlbiwgdHJlY2xlbjsKQEAg
LTI2OCw3ICsyNjcsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogIAog
ICAgICBoZGlycCA9IGdfdHJ5X21hbGxvYyhjb3VudCk7CiAgICAgIGlmICghaGRpcnApIHsKLUBA
IC04NzIwLDcgKzg2NDUsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRpcmZk
LCBhYmlfbG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKK0BAIC04NzIxLDcgKzg2NDYsNyBAQCBz
dGF0aWMgaW50IGRvX2dldGRlbnRzKGFiaV9sb25nIGRpcmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlf
bG9uZyBjb3VudCkKICAgICAgICAgICAgICAgKiBSZXR1cm4gd2hhdCB3ZSBoYXZlLCByZXNldHRp
bmcgdGhlIGZpbGUgcG9pbnRlciB0byB0aGUKICAgICAgICAgICAgICAgKiBsb2NhdGlvbiBvZiB0
aGUgZmlyc3QgcmVjb3JkIG5vdCByZXR1cm5lZC4KICAgICAgICAgICAgICAgKi8KQEAgLTI3Nyw3
ICsyNzYsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAg
ICAgIGJyZWFrOwogICAgICAgICAgfQogIAotQEAgLTg3NTQsNyArODY3OSw3IEBAIHN0YXRpYyBp
bnQgZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcg
Y291bnQpCitAQCAtODc1NSw3ICs4NjgwLDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50czY0KGFi
aV9sb25nIGRpcmZkLCBhYmlfbG9uZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKICAgICAgdm9pZCAq
dGRpcnA7CiAgICAgIGludCBobGVuLCBob2ZmLCB0b2ZmOwogICAgICBpbnQgaHJlY2xlbiwgdHJl
Y2xlbjsKQEAgLTI4Niw3ICsyODUsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEw
MDY0NAogIAogICAgICBoZGlycCA9IGdfdHJ5X21hbGxvYyhjb3VudCk7CiAgICAgIGlmICghaGRp
cnApIHsKLUBAIC04Nzk2LDcgKzg3MjEsNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzNjQoYWJp
X2xvbmcgZGlyZmQsIGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNvdW50KQorQEAgLTg3OTcsNyAr
ODcyMiw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJmZCwgYWJpX2xv
bmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCiAgICAgICAgICAgICAgICogUmV0dXJuIHdoYXQgd2Ug
aGF2ZSwgcmVzZXR0aW5nIHRoZSBmaWxlIHBvaW50ZXIgdG8gdGhlCiAgICAgICAgICAgICAgICog
bG9jYXRpb24gb2YgdGhlIGZpcnN0IHJlY29yZCBub3QgcmV0dXJuZWQuCiAgICAgICAgICAgICAg
ICovCkBAIC0yOTUsNyArMjk0LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2
NDQKICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgIH0KICAKLUBAIC0xMTUyNyw3ICsxMTQ1
Miw3IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYs
IGludCBudW0sIGFiaV9sb25nIGFyZzEsCitAQCAtMTE1MjgsNyArMTE0NTMsNyBAQCBzdGF0aWMg
YWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlf
bG9uZyBhcmcxLAogICAgICAgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FRkFVTFQ7CiAgICAg
ICAgICAgICAgfQogICAgICAgICAgfQpAQCAtMzA0LDcgKzMwMyw3IEBAIGluZGV4IDE4ZjA5ZjFm
MDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcyLCByZXQp
OwogICAgICAgICAgcmV0dXJuIHJldDsKICAgICAgY2FzZSBUQVJHRVRfTlJfcHdyaXRlNjQ6Ci1A
QCAtMTE1NDQsNyArMTE0NjksNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJj
aFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAorQEAgLTExNTQ1LDcgKzEx
NDcwLDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2Vu
diwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgICAgICAgICAgcmV0dXJuIC1UQVJH
RVRfRUZBVUxUOwogICAgICAgICAgICAgIH0KICAgICAgICAgIH0KQEAgLTMxMyw3ICszMTIsNyBA
QCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgdW5sb2NrX3Vz
ZXIocCwgYXJnMiwgMCk7CiAgICAgICAgICByZXR1cm4gcmV0OwogICNlbmRpZgotQEAgLTEyNDA0
LDE0ICsxMjMyOSwxNCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRl
ICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAorQEAgLTEyNDA1LDE0ICsxMjMzMCwx
NCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBp
bnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICBjYXNlIFRBUkdFVF9OUl9mY250bDY0OgogICAg
ICB7CiAgICAgICAgICBpbnQgY21kOwpAQCAtMzMzLDcgKzMzMiw3IEBAIGluZGV4IDE4ZjA5ZjFm
MDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICB9CiAgI2VuZGlmCiAgCi1AQCAtMTI0MjEs
NyArMTIzNDYsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpj
cHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAorQEAgLTEyNDIyLDcgKzEyMzQ3LDcgQEAg
c3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51
bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgIH0KICAKICAgICAgICAgIHN3aXRjaChhcmcyKSB7
CkBAIC0zNDIsNyArMzQxLDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQK
ICAgICAgICAgICAgICByZXQgPSBjb3B5ZnJvbSgmZmwsIGFyZzMpOwogICAgICAgICAgICAgIGlm
IChyZXQpIHsKICAgICAgICAgICAgICAgICAgYnJlYWs7Ci1AQCAtMTI0MzIsOCArMTIzNTcsOCBA
QCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQg
bnVtLCBhYmlfbG9uZyBhcmcxLAorQEAgLTEyNDMzLDggKzEyMzU4LDggQEAgc3RhdGljIGFiaV9s
b25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcg
YXJnMSwKICAgICAgICAgICAgICB9CiAgCSAgICBicmVhazsKICAKQEAgLTM1Myw2ICszNTIsMyBA
QCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgICAgIHJldCA9
IGNvcHlmcm9tKCZmbCwgYXJnMyk7CiAgICAgICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAg
ICAgICAgICBicmVhazsKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZy
b20tUEFUSC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25m
aWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaAppbmRleCA5OGNlODVh
OGNmLi45OTk5Y2I3MDk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29r
dXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBl
MTJhOTMxNzRmOWI2NTI2MDRkZGE4ZDg0NjRiOTU1OWI2MmIyOWQ1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBhNzVkMDQxMjU2Nzk0N2NhN2M3OTRiNWM1OWY4MTM0MWM3ZTUwNDVlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP01hcnRpbj0yMEh1bmRlYj1D
Mz1COGxsPz0gPG1hcnRpbkBnZWFuaXguY29tPgogRGF0ZTogV2VkLCAyMiBNYXkgMjAyNCAxNDow
Mjo1NSArMDIwMAotU3ViamVjdDogW1BBVENIIDEwLzExXSBjb25maWd1cmU6IGxvb2t1cCBtZXNv
biBleHV0YWJsZSBmcm9tIFBBVEgKK1N1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBsb29rdXAg
bWVzb24gZXh1dGFibGUgZnJvbSBQQVRICiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbd29ya2Fyb3VuZCwgd291bGQgbmVlZCBhIHJlYWwgZml4IGZvciB1cHN0cmVhbV0KIC0tLQpA
QCAtOSwxMCArOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3dvcmthcm91
bmQsIHdvdWxkIG5lZWQgYSByZWFsIGZpeCBmb3IgdXBzdHJlYW1dCiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJl
IGIvY29uZmlndXJlCi1pbmRleCAzY2Q3MzZiMTM5Li40ODJhMWY4ZWYzIDEwMDc1NQoraW5kZXgg
MGFlYTliMTEzLi5jMjhiZDQ3YjQgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZp
Z3VyZQotQEAgLTk1NiwxMiArOTU2LDcgQEAgZmkKK0BAIC05NjUsMTIgKzk2NSw3IEBAIGZpCiAg
JG1rdmVudiBlbnN1cmVncm91cCAtLWRpciAiJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3doZWVscyIg
XAogICAgICAgJHtzb3VyY2VfcGF0aH0vcHl0aG9uZGVwcy50b21sIG1lc29uIHx8IGV4aXQgMQog
IApAQCAtMjYsNiArMjYsMyBAQCBpbmRleCAzY2Q3MzZiMTM5Li40ODJhMWY4ZWYzIDEwMDc1NQog
IAogICMgQ29uZGl0aW9uYWxseSBlbnN1cmUgU3BoaW54IGlzIGluc3RhbGxlZC4KICAKLS0tIAot
Mi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAx
MS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBp
cC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKaW5kZXggYzdiYjli
MWI0Ny4uZTUyYjYwNDc2NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2Vk
LWZvci0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFl
bXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gK
QEAgLTEsOCArMSw3IEBACi1Gcm9tIGE5M2MyYTZiMmM5ZGI5YzRiZDMwMjk4ZGE0M2MzN2M1ZTVj
NjIzNmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc1NmE1YzFlZmM5MWYxMTNlN2Y2
ZWRjYjA4MTA0NDBjYmFkNDEzNDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdl
ZCwgMjIgTWF5IDIwMjQgMTM6NTg6MjMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAxMS8xMV0gcWVt
dTogRW5zdXJlIHBpcCBhbmQgdGhlIHB5dGhvbiB2ZW52IGFyZW4ndCB1c2VkIGZvcgotIG1lc29u
CitTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IEVuc3VyZSBwaXAgYW5kIHRoZSBweXRob24gdmVudiBh
cmVuJ3QgdXNlZCBmb3IgbWVzb24KIAogUWVtdSB3YW50cyB0byB1c2UgYSBzdXBwb3J0ZWQgcHl0
aG9uIHZlcnNpb24gYW5kIGEgc3BlY2lmaWMgbWVzb24gdmVyc2lvbgogdG8gImhlbHAiIHVzZXJz
IGFuZCB1c2VzIHBpcCBhbmQgY3JlYXRlcyBhIHZlbnYgdG8gZG8gdGhpcy4gVGhpcyBpcyBhIG5p
Z2h0bWFyZQpAQCAtMzAsMTAgKzI5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUg
Yi9jb25maWd1cmUKLWluZGV4IDQ4MmExZjhlZjMuLjBkYTRiZjNlNGQgMTAwNzU1CitpbmRleCBj
MjhiZDQ3YjQuLjMzYjg5YjIzNiAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmln
dXJlCi1AQCAtOTM4LDE0ICs5MzgsMTQgQEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24i
KSIKK0BAIC05NDcsMTQgKzk0NywxNCBAQCBweXRob249IiQoY29tbWFuZCAtdiAiJHB5dGhvbiIp
IgogIGVjaG8gInB5dGhvbiBkZXRlcm1pbmVkIHRvIGJlICckcHl0aG9uJyIKICBlY2hvICJweXRo
b24gdmVyc2lvbjogJCgkcHl0aG9uIC0tdmVyc2lvbikiCiAgCkBAIC01MCw2ICs0OSwzIEBAIGlu
ZGV4IDQ4MmExZjhlZjMuLjBkYTRiZjNlNGQgMTAwNzU1CiAgCiAgIyBGaW5pc2ggcHJlcGFyaW5n
IHRoZSB2aXJ0dWFsIGVudmlyb25tZW50IHVzaW5nIHZlbmRvcmVkIC53aGwgZmlsZXMKICAKLS0t
IAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVf
OS4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzkuMC4yLmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11XzkuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11Xzku
MC4yLmJiCi0tIAoyLjQ0LjAKCg==

--===============7814403598213097762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-9.0.1.tar.xz file://powerpc_rom.bin file://run-ptest file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-9.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://0001-
 qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-common: PKGSIZE changed from 240853828 to 240857924 (+0%)
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1665340360 to 1665395448 (+0%)
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-dev: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-dev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-doc: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-doc: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-locale: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-locale: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 177981748 to 177989940 (+0%)
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 81943672 to 81945472 (+0%)
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 26995432 to 26999528 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 24474192 to 24478288 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14619120 to 14623216 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13611920 to 13607824 (-0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15785160 to 15789256 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2393712 to 2389616 (-0%)
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGSIZE changed from 3043400 to 3039304 (-0%)
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGSIZE changed from 3007792 to 3003696 (-0%)
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/qemu/qemu: PKGV changed from 9.0.1 [default] to 9.0.2 [default]

--===============7814403598213097762==--

