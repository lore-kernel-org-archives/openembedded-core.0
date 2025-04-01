Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921DEC369C7
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.18034.1743511384586739636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E+SE8UMc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MEWiYcvp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f1607beb-dd388529-3c61-41f2-869e-2ef3d6269337-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OJxTdhut0YZA9M/JkaTI1EXHyx7RxU7RNKCqNAUgasg=;
	b=E+SE8UMcjP70AeLYExXac0K4+ccRIEKl/u8CfwyttUJUVho6va3kngA1dTcEzOE4
	yuarjFTDWeNurBgrSVNHNYzLyk880u3HTTYTkDJGLT3183iuQn4q7y7t99ot68DE+ky
	lqiJ4lNszIUYVep3XJEZdnMOAzg+Rfe1C7QK1d3U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511387;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OJxTdhut0YZA9M/JkaTI1EXHyx7RxU7RNKCqNAUgasg=;
	b=MEWiYcvpQ2XTzY5qqjiCHBWMKAU5nEPM/djFf/q+M73YUGp+1HnYzk6vVCQjREk7
	kclW5xTgm90WXVWaopYymig8uoh7aTabJVeANJ31yscaPMf6Ef3c0UAILJQLqMcNKGR
	6zPH3bj8mY4FelOEkIjYUeqt5JadkNSrnMCbmvIk=
Content-Type: multipart/mixed; boundary="===============1459467393789278176=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu-native,qemu: upgrading to
 9.2.3,9.2.3,9.2.3 SUCCEEDED
Message-ID: <01010195f1607beb-dd388529-3c61-41f2-869e-2ef3d6269337-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214028

--===============1459467393789278176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu-native,qemu* to *9.2.3,9.2.3,9.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-system-native-qemu-native-qemu-upgrade-9.2.0-9..patch
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
From 29b3b214222fc282a46977f5980618424978ebc9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 06:03:29 +0000
Subject: [PATCH] qemu-system-native,qemu-native,qemu: upgrade 9.2.0 ->
 9.2.3,9.2.0 -> 9.2.3,9.2.0 -> 9.2.3

---
 ...u-native_9.2.0.bb => qemu-native_9.2.3.bb} |  0
 ...e_9.2.0.bb => qemu-system-native_9.2.3.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 ...n-environment-space-to-boot-loader-q.patch |  4 +-
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 45 -------------------
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  2 +-
 ...mu-Do-not-include-file-if-not-exists.patch |  6 +--
 ...er-space-mmap-tweaks-to-address-musl.patch |  2 +-
 .../qemu/0006-qemu-Determinism-fixes.patch    |  2 +-
 ...d-use-relative-path-to-refer-to-file.patch |  6 +--
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  6 +--
 ...and-the-python-venv-aren-t-used-for-.patch |  6 +--
 .../qemu/qemu/fix-strerrorname_np.patch       |  6 +--
 .../qemu/{qemu_9.2.0.bb => qemu_9.2.3.bb}     |  0
 15 files changed, 22 insertions(+), 68 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.2.0.bb => qemu-native_9.2.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.2.0.bb => qemu-system-native_9.2.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
 rename meta/recipes-devtools/qemu/{qemu_9.2.0.bb => qemu_9.2.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 53f48375e4..b38cac7481 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,7 +31,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
-           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -39,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "f859f0bc65e1f533d040bbe8c92bcfecee5af2c921a6687c652fb44d089bd894"
+SRC_URI[sha256sum] = "baed494270c361bf69816acc84512e3efed71c7a23f76691642b80bc3de7693e"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 5e21855c50..7ca79b0e0b 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 930b75aeade33690cec4bf748a954401da2be782 Mon Sep 17 00:00:00 2001
+From 29dce25c090792e360a1c1ff081af25d63d7df29 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,7 +18,7 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 664a2ae0a..5124b158a 100644
+index 198da5ba3..736bf0999 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
 @@ -64,7 +64,7 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 1233a07ff9..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7030c0cd98de9e6c42e69be314204727ae335912 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 Oct 2024 22:40:32 -0700
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/qemu-devel/patch/20241011193140.1047648-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Laurent Vivier <laurent@vivier.eu>
-Cc: Paolo Bonzini <pbonzini@redhat.com>
----
- linux-user/syscall.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 27aa59594..b2c45b4c4 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -361,7 +361,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
- #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
- _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
-           unsigned long *, user_mask_ptr);
--/* sched_attr is not defined in glibc */
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
-     uint32_t size;
-     uint32_t sched_policy;
-@@ -374,6 +375,7 @@ struct sched_attr {
-     uint32_t sched_util_min;
-     uint32_t sched_util_max;
- };
-+#endif
- #define __NR_sys_sched_getattr __NR_sched_getattr
- _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
-           unsigned int, size, unsigned int, flags);
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index bcb0d0c0da..292c542442 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 1ba58dbd2dce4e6ccaf3be3ad5c9ecc22565313f Mon Sep 17 00:00:00 2001
+From e069c66ccf29fb13ef5938b68f5362737b64d638 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index 2b4f2b17ca..ecfddfc0e1 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 081c1e4ee93b22ec00136db45c36650427213c09 Mon Sep 17 00:00:00 2001
+From 24e16b32dd0a4136ac30f8e2d48e266892814de6 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 9d5415674..22df46859 100644
+index 549e39e19..439c7beb0 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -117,7 +117,9 @@
+@@ -116,7 +116,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 26ddf5e597..0e22a4fd86 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 76efeccfd73a76834ac1c75d3c94de1899085714 Mon Sep 17 00:00:00 2001
+From ef7497674b2d41cffcb90f36bfe145c4951a03ba Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 059257bce0..33de959fa4 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 09e8fac984cea71867c0b7a05b0dd8f7025bd25a Mon Sep 17 00:00:00 2001
+From b0862cf4fecc11a181bc8c6602c7d09812148249 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index cd919048f4..335d50be46 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 1a574aa22c9b3700af7e5c0901abef59c72bb874 Mon Sep 17 00:00:00 2001
+From 7bce3a9379b09dfa7d24a377a9f7f1c6a2f8bdde Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index 490ab8182..d19ee5606 100644
+index d5248ae51..2c581f055 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -128,17 +128,17 @@ endif
+@@ -127,17 +127,17 @@ endif
  
  if have_system
    tests += {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 7bbd96df84..3f81154dbf 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 06b5b26a0a1f7687576d90066e492cf2665fff1d Mon Sep 17 00:00:00 2001
+From 2c2fde4042578ee29714a6421c33e00c4301d744 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index f20851bff0..4a777dee52 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 2e9642b9001df523628ab2cacbbbf2b208c49437 Mon Sep 17 00:00:00 2001
+From b3435faf13837f487231a01c2dca45a260ae323c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index d08b71f14..af0bd2c66 100755
+index 18336376b..2b014b97c 100755
 --- a/configure
 +++ b/configure
-@@ -958,12 +958,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -1002,12 +1002,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index 4adb2e5fa5..f949206717 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 68a13afd6606c2aaf1f0debd325d7314aaa61411 Mon Sep 17 00:00:00 2001
+From 81b55a014b2e5f0863a5a3fd584168c9d4ce9eb8 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index af0bd2c66..88dab6a95 100755
+index 2b014b97c..45dc8b146 100755
 --- a/configure
 +++ b/configure
-@@ -944,14 +944,14 @@ python="$(command -v "$python")"
+@@ -988,14 +988,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index b57c481183..ca667692b0 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 9de5de85fa917af58e7bc9cdd88f8f7ef8da2ca9 Mon Sep 17 00:00:00 2001
+From 6e5a6d44950c48957f3906294b8efd6a76b91576 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index f6e3156b8..fad9eb21c 100644
+index c53ca1f76..3c67129ef 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1859,8 +1859,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1870,8 +1870,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_9.2.0.bb b/meta/recipes-devtools/qemu/qemu_9.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_9.2.3.bb
-- 
2.47.1


--===============1459467393789278176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/qemu/qemu-common: FILELIST: added "/usr/share/qemu/firmware/60-edk2-riscv64.json"
Changes to packages/core2-64-poky-linux/qemu (sysroot):
  /usr/share/qemu/firmware/60-edk2-riscv64.json was added
Changes to packages/x86_64-linux/qemu-system-native (sysroot):
  /usr/share/qemu/firmware/60-edk2-riscv64.json was added

--===============1459467393789278176==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-system-native-qemu-native-qemu-upgrade-9.2.0-9..patch"

RnJvbSAyOWIzYjIxNDIyMmZjMjgyYTQ2OTc3ZjU5ODA2MTg0MjQ5NzhlYmM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjowMzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtc3lzdGVtLW5hdGl2ZSxxZW11LW5hdGl2ZSxxZW11OiB1cGdyYWRlIDkuMi4wIC0+CiA5LjIu
Myw5LjIuMCAtPiA5LjIuMyw5LjIuMCAtPiA5LjIuMwoKLS0tCiAuLi51LW5hdGl2ZV85LjIuMC5i
YiA9PiBxZW11LW5hdGl2ZV85LjIuMy5iYn0gfCAgMAogLi4uZV85LjIuMC5iYiA9PiBxZW11LXN5
c3RlbS1uYXRpdmVfOS4yLjMuYmJ9IHwgIDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUuaW5jICAgICAgICAgICB8ICAzICstCiAuLi5uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3Qt
bG9hZGVyLXEucGF0Y2ggfCAgNCArLQogLi4uZWRfYXR0ci1Eby1ub3QtZGVmaW5lLWZvci1nbGli
Yy0yLjQxLnBhdGNoIHwgNDUgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uLzAwMDItYXBpYy1maXh1
cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2ggIHwgIDIgKy0KIC4uLm11LURvLW5vdC1pbmNsdWRl
LWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCB8ICA2ICstLQogLi4uZXItc3BhY2UtbW1hcC10d2Vh
a3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoIHwgIDIgKy0KIC4uLi9xZW11LzAwMDYtcWVtdS1EZXRl
cm1pbmlzbS1maXhlcy5wYXRjaCAgICB8ICAyICstCiAuLi5kLXVzZS1yZWxhdGl2ZS1wYXRoLXRv
LXJlZmVyLXRvLWZpbGUucGF0Y2ggfCAgNiArLS0KIC4uLmFuZC1NQVBfU0hBUkVEX1ZBTElEQVRF
LW9uLW5lZWRlZC1saS5wYXRjaCB8ICAyICstCiAuLi5ndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJs
ZS1mcm9tLVBBVEgucGF0Y2ggfCAgNiArLS0KIC4uLmFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10
LXVzZWQtZm9yLS5wYXRjaCB8ICA2ICstLQogLi4uL3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1l
X25wLnBhdGNoICAgICAgIHwgIDYgKy0tCiAuLi4vcWVtdS97cWVtdV85LjIuMC5iYiA9PiBxZW11
XzkuMi4zLmJifSAgICAgfCAgMAogMTUgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
NjggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXUt
bmF0aXZlXzkuMi4wLmJiID0+IHFlbXUtbmF0aXZlXzkuMi4zLmJifSAoMTAwJSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdS1zeXN0ZW0tbmF0aXZlXzkuMi4wLmJiID0+
IHFlbXUtc3lzdGVtLW5hdGl2ZV85LjIuMy5iYn0gKDEwMCUpCiBkZWxldGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNjaGVkX2F0dHItRG8tbm90LWRl
ZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3txZW11XzkuMi4wLmJiID0+IHFlbXVfOS4yLjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzkuMi4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfOS4yLjMuYmIKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZl
XzkuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2
ZV85LjIuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1z
eXN0ZW0tbmF0aXZlXzkuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1z
eXN0ZW0tbmF0aXZlXzkuMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfOS4yLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV85LjIu
My5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwppbmRleCA1M2Y0ODM3NWU0Li5iMzhj
YWM3NDgxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwpAQCAtMzEsNyArMzEsNiBA
QCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54
eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJF
RF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAxMC1j
b25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4t
dC11c2VkLWZvci0ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1zY2hlZF9hdHRyLURv
LW5vdC1kZWZpbmUtZm9yLWdsaWJjLTIuNDEucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcWVt
dS1ndWVzdC1hZ2VudC5pbml0IFwKICAgICAgICAgICAgZmlsZTovL3FlbXUtZ3Vlc3QtYWdlbnQu
dWRldiBcCiAgICAgICAgICAgICIKQEAgLTM5LDcgKzM4LDcgQEAgU1JDX1VSSSA9ICJodHRwczov
L2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogVVBTVFJFQU1fQ0hFQ0tf
VVJJID0gImh0dHBzOi8vd3d3LnFlbXUub3JnIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVt
dS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY4
NTlmMGJjNjVlMWY1MzNkMDQwYmJlOGM5MmJjZmVjZWU1YWYyYzkyMWE2Njg3YzY1MmZiNDRkMDg5
YmQ4OTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmFlZDQ5NDI3MGMzNjFiZjY5ODE2YWNjODQ1
MTJlM2VmZWQ3MWM3YTIzZjc2NjkxNjQyYjgwYmMzZGU3NjkzZSIKIAogQ1ZFX1NUQVRVU1tDVkUt
MjAwNy0wOTk4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoZSBWTkMgc2VydmVyIGNhbiBl
eHBvc2UgaG9zdCBmaWxlcyB1ZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcy4gV2UgZG9uJ3QgZW5hYmxl
IGl0IGJ5IGRlZmF1bHQuIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1s
b2FkZXItcS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11
LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNoCmlu
ZGV4IDVlMjE4NTVjNTAuLjdjYTc5YjBlMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10
by1ib290LWxvYWRlci1xLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRl
ci1xLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5MzBiNzVhZWFkZTMzNjkwY2VjNGJmNzQ4
YTk1NDQwMWRhMmJlNzgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyOWRjZTI1YzA5
MDc5MmUzNjBhMWMxZmYwODFhZjI1ZDYzZDdkZjI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSmFzb24gV2Vzc2VsIDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZy
aSwgMjggTWFyIDIwMTQgMTc6NDI6NDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogQWRk
IGFkZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJvb3QgbG9hZGVyCkBAIC0xOCw3ICsxOCw3
IEBAIFNpZ25lZC1vZmYtYnk6IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2h3L21pcHMvbWFsdGEuYyBiL2h3L21pcHMvbWFsdGEuYwotaW5kZXggNjY0YTJhZTBhLi41
MTI0YjE1OGEgMTAwNjQ0CitpbmRleCAxOThkYTViYTMuLjczNmJmMDk5OSAxMDA2NDQKIC0tLSBh
L2h3L21pcHMvbWFsdGEuYwogKysrIGIvaHcvbWlwcy9tYWx0YS5jCiBAQCAtNjQsNyArNjQsNyBA
QApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNjaGVk
X2F0dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwMS1zY2hlZF9hdHRyLURvLW5vdC1kZWZpbmUtZm9yLWdsaWJj
LTIuNDEucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDEyMzNhMDdmZjkuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNjaGVk
X2F0dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDQ1ICswLDAgQEAKLUZyb20gNzAzMGMwY2Q5OGRlOWU2YzQyZTY5YmUzMTQyMDQ3MjdhZTMz
NTkxMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+Ci1EYXRlOiBUaHUsIDEwIE9jdCAyMDI0IDIyOjQwOjMyIC0wNzAwCi1TdWJqZWN0
OiBbUEFUQ0hdIHNjaGVkX2F0dHI6IERvIG5vdCBkZWZpbmUgZm9yIGdsaWJjID49IDIuNDEKLQot
Z2xpYmMgMi40MSsgaGFzIGFkZGVkIFsxXSBkZWZpbml0aW9ucyBmb3Igc2NoZWRfc2V0YXR0ciBh
bmQgc2NoZWRfZ2V0YXR0ciBmdW5jdGlvbnMKLWFuZCBzdHJ1Y3Qgc2NoZWRfYXR0ci4gVGhlcmVm
b3JlLCBpdCBuZWVkcyB0byBiZSBjaGVja2VkIGZvciBoZXJlIGFzIHdlbGwgYmVmb3JlCi1kZWZp
bmluZyBzY2hlZF9hdHRyCi0KLURlZmluZSBzY2hlZF9hdHRyIGNvbmRpdGlvbmFsbHkgb24gU0NI
RURfQVRUUl9TSVpFX1ZFUjAKLQotRml4ZXMgYnVpbGRzIHdpdGggZ2xpYmMvdHJ1bmsKLQotWzFd
IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdGRpZmY7aD0y
MTU3MWNhMGQ3MDMwMjkwOWNmNzI3MDdiMmE3NzM2Y2YxMjE5MGEwO2hwPTI5OGJjNDg4ZmRjMDQ3
ZGEzNzQ4MmY0MDAzMDIzY2I5YWRlZjc4ZjgKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W2h0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNoLzIw
MjQxMDExMTkzMTQwLjEwNDc2NDgtMS1yYWoua2hlbUBnbWFpbC5jb20vXQotU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLUNjOiBMYXVyZW50IFZpdmllciA8bGF1
cmVudEB2aXZpZXIuZXU+Ci1DYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4K
LS0tLQotIGxpbnV4LXVzZXIvc3lzY2FsbC5jIHwgNCArKystCi0gMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvbGludXgtdXNlci9z
eXNjYWxsLmMgYi9saW51eC11c2VyL3N5c2NhbGwuYwotaW5kZXggMjdhYTU5NTk0Li5iMmM0NWI0
YzQgMTAwNjQ0Ci0tLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwotKysrIGIvbGludXgtdXNlci9z
eXNjYWxsLmMKLUBAIC0zNjEsNyArMzYxLDggQEAgX3N5c2NhbGwzKGludCwgc3lzX3NjaGVkX2dl
dGFmZmluaXR5LCBwaWRfdCwgcGlkLCB1bnNpZ25lZCBpbnQsIGxlbiwKLSAjZGVmaW5lIF9fTlJf
c3lzX3NjaGVkX3NldGFmZmluaXR5IF9fTlJfc2NoZWRfc2V0YWZmaW5pdHkKLSBfc3lzY2FsbDMo
aW50LCBzeXNfc2NoZWRfc2V0YWZmaW5pdHksIHBpZF90LCBwaWQsIHVuc2lnbmVkIGludCwgbGVu
LAotICAgICAgICAgICB1bnNpZ25lZCBsb25nICosIHVzZXJfbWFza19wdHIpOwotLS8qIHNjaGVk
X2F0dHIgaXMgbm90IGRlZmluZWQgaW4gZ2xpYmMgKi8KLSsvKiBzY2hlZF9hdHRyIGlzIG5vdCBk
ZWZpbmVkIGluIGdsaWJjIDwgMi40MSAqLwotKyNpZm5kZWYgU0NIRURfQVRUUl9TSVpFX1ZFUjAK
LSBzdHJ1Y3Qgc2NoZWRfYXR0ciB7Ci0gICAgIHVpbnQzMl90IHNpemU7Ci0gICAgIHVpbnQzMl90
IHNjaGVkX3BvbGljeTsKLUBAIC0zNzQsNiArMzc1LDcgQEAgc3RydWN0IHNjaGVkX2F0dHIgewot
ICAgICB1aW50MzJfdCBzY2hlZF91dGlsX21pbjsKLSAgICAgdWludDMyX3Qgc2NoZWRfdXRpbF9t
YXg7Ci0gfTsKLSsjZW5kaWYKLSAjZGVmaW5lIF9fTlJfc3lzX3NjaGVkX2dldGF0dHIgX19OUl9z
Y2hlZF9nZXRhdHRyCi0gX3N5c2NhbGw0KGludCwgc3lzX3NjaGVkX2dldGF0dHIsIHBpZF90LCBw
aWQsIHN0cnVjdCBzY2hlZF9hdHRyICosIGF0dHIsCi0gICAgICAgICAgIHVuc2lnbmVkIGludCwg
c2l6ZSwgdW5zaWduZWQgaW50LCBmbGFncyk7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhy
b3VnaC10by1QSUMucGF0Y2gKaW5kZXggYmNiMGQwYzBkYS4uMjkyYzU0MjQ0MiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRo
cm91Z2gtdG8tUElDLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMWJhNThkYmQyZGNlNGU2Y2NhZjNiZTNhZDVjOWVjYzIyNTY1MzEzZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTA2OWM2NmNjZjI5ZmIxM2VmNTkzOGI2OGY1MzYyNzM3YjY0
ZDYzOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmsgQXNzZWxzdGluZSA8bWFy
ay5hc3NlbHN0aW5lQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI2IEZlYiAyMDEzIDExOjQz
OjI4IC0wNTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFwaWM6IGZpeHVwIGZhbGx0aHJvdWdoIHRvIFBJ
QwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUt
RG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhp
c3RzLnBhdGNoCmluZGV4IDJiNGYyYjE3Y2EuLmVjZmRkZmMwZTEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUt
aWYtbm90LWV4aXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDA4MWMxZTRlZTkzYjIyZWMwMDEzNmRiNDVjMzY2NTA0MjcyMTNjMDkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI0ZTE2YjMyZGQwYTQxMzZhYzMwZjhlMmQ0
OGUyNjY4OTI4MTRkZTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPbGVrc2l5IE9i
aXRvdHNreXkgPG9vYml0b3RzQGNpc2NvLmNvbT4KIERhdGU6IFdlZCwgMjUgTWFyIDIwMjAgMjE6
MjE6MzUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogRG8gbm90IGluY2x1ZGUgZmlsZSBp
ZiBub3QgZXhpc3RzCkBAIC0xNiwxMCArMTYsMTAgQEAgU2lnbmVkLW9mZi1ieTogU2FraWIgU2Fq
YWwgPHNha2liLnNhamFsQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9zeXNjYWxsLmMgYi9saW51eC11c2Vy
L3N5c2NhbGwuYwotaW5kZXggOWQ1NDE1Njc0Li4yMmRmNDY4NTkgMTAwNjQ0CitpbmRleCA1NDll
MzllMTkuLjQzOWM3YmViMCAxMDA2NDQKIC0tLSBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiArKysg
Yi9saW51eC11c2VyL3N5c2NhbGwuYwotQEAgLTExNyw3ICsxMTcsOSBAQAorQEAgLTExNiw3ICsx
MTYsOSBAQAogICNpbmNsdWRlIDxsaW51eC9ibGtwZy5oPgogICNpbmNsdWRlIDxuZXRwYWNrZXQv
cGFja2V0Lmg+CiAgI2luY2x1ZGUgPGxpbnV4L25ldGxpbmsuaD4KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2Ut
bW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1h
ZGRyZXNzLW11c2wucGF0Y2gKaW5kZXggMjZkZGY1ZTU5Ny4uMGUyMmE0ZmQ4NiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNl
ci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFw
LXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc2ZWZl
Y2NmZDczYTc2ODM0YWMxYzc1ZDNjOTRkZTE4OTkwODU3MTQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGVmNzQ5NzY3NGIyZDQxY2ZmY2I5MGYzNmJmZTE0NWM0OTUxYTAzYmEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgOCBKYW4gMjAyMSAxNzoyNzowNiArMDAw
MAogU3ViamVjdDogW1BBVENIXSBxZW11OiBBZGQgc29tZSB1c2VyIHNwYWNlIG1tYXAgdHdlYWtz
IHRvIGFkZHJlc3MgbXVzbCAzMiBiaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gK
aW5kZXggMDU5MjU3YmNlMC4uMzNkZTk1OWZhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4
ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA5ZThmYWM5ODRjZWE3MTg2N2MwYjdhMDVi
MGRkOGY3MDI1YmQyNWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGIwODYyY2Y0ZmVj
YzExYTE4MWJjOGM2NjAyYzdkMDk4MTIxNDgyNDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
IERhdGU6IE1vbiwgMSBNYXIgMjAyMSAxMzowMDo0NyArMDAwMAogU3ViamVjdDogW1BBVENIXSBx
ZW11OiBEZXRlcm1pbmlzbSBmaXhlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJl
ZmVyLXRvLWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDct
dGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRj
aAppbmRleCBjZDkxOTA0OGY0Li4zMzVkNTBiZTQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBh
dGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDctdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXIt
dG8tZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWE1NzRhYTIyYzliMzcwMGFmN2U1
YzA5MDFhYmVmNTljNzJiYjg3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2JjZTNh
OTM3OWIwOWRmYTdkMjRhMzc3YTlmN2YxYzZhMmY4YmRkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBUaHUsIDE0IEphbiAyMDIxIDA2OjMzOjA0ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3Rz
L21lc29uLmJ1aWxkOiB1c2UgcmVsYXRpdmUgcGF0aCB0byByZWZlciB0byBmaWxlcwpAQCAtMTcs
MTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdp
bmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3VuaXQvbWVzb24uYnVpbGQgYi90ZXN0cy91bml0
L21lc29uLmJ1aWxkCi1pbmRleCA0OTBhYjgxODIuLmQxOWVlNTYwNiAxMDA2NDQKK2luZGV4IGQ1
MjQ4YWU1MS4uMmM1ODFmMDU1IDEwMDY0NAogLS0tIGEvdGVzdHMvdW5pdC9tZXNvbi5idWlsZAog
KysrIGIvdGVzdHMvdW5pdC9tZXNvbi5idWlsZAotQEAgLTEyOCwxNyArMTI4LDE3IEBAIGVuZGlm
CitAQCAtMTI3LDE3ICsxMjcsMTcgQEAgZW5kaWYKICAKICBpZiBoYXZlX3N5c3RlbQogICAgdGVz
dHMgKz0gewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4
LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5D
LWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaAppbmRleCA3YmJkOTZk
Zjg0Li4zZjgxMTU0ZGJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRl
ZC1saS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVm
aW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMDZiNWIyNmEwYTFmNzY4NzU3NmQ5MDA2NmU0OTJjZjI2NjVm
ZmYxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmMyZmRlNDA0MjU3OGVlMjk3MTRh
NjQyMWMzM2UwMGM0MzAxZDc0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIxIE1hciAyMDIyIDEwOjA5OjM4
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBNQVBfU1lOQyBhbmQgTUFQX1NIQVJFRF9W
QUxJREFURSBvbiBuZWVkZWQgbGludXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFU
SC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUt
bG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaAppbmRleCBmMjA4NTFiZmYwLi40
YTc3N2RlZTUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVz
b24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZTk2NDJi
OTAwMWRmNTIzNjI4YWIyY2FjYmJiZjJiMjA4YzQ5NDM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiMzQzNWZhZjEzODM3ZjQ4NzIzMWEwMWMyZGNhNDVhMjYwYWUzMjNjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP01hcnRpbj0yMEh1bmRlYj1DMz1COGxs
Pz0gPG1hcnRpbkBnZWFuaXguY29tPgogRGF0ZTogV2VkLCAyMiBNYXkgMjAyNCAxNDowMjo1NSAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IGxvb2t1cCBtZXNvbiBleHV0YWJsZSBm
cm9tIFBBVEgKQEAgLTksMTAgKzksMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
IFt3b3JrYXJvdW5kLCB3b3VsZCBuZWVkIGEgcmVhbCBmaXggZm9yIHVwc3RyZWFtXQogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXggZDA4YjcxZjE0Li5hZjBiZDJjNjYgMTAwNzU1
CitpbmRleCAxODMzNjM3NmIuLjJiMDE0Yjk3YyAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysr
IGIvY29uZmlndXJlCi1AQCAtOTU4LDEyICs5NTgsNyBAQCBta3ZlbnY9IiRweXRob24gJHtzb3Vy
Y2VfcGF0aH0vcHl0aG9uL3NjcmlwdHMvbWt2ZW52LnB5IgorQEAgLTEwMDIsMTIgKzEwMDIsNyBA
QCBta3ZlbnY9IiRweXRob24gJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3NjcmlwdHMvbWt2ZW52LnB5
IgogICRta3ZlbnYgZW5zdXJlZ3JvdXAgLS1kaXIgIiR7c291cmNlX3BhdGh9L3B5dGhvbi93aGVl
bHMiIFwKICAgICAgICR7c291cmNlX3BhdGh9L3B5dGhvbmRlcHMudG9tbCBtZXNvbiB8fCBleGl0
IDEKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1x
ZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1h
bmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKaW5kZXggNGFkYjJlNWZh
NS4uZjk0OTIwNjcxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZv
ci0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUt
RW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDY4YTEzYWZkNjYwNmMyYWFmMWYwZGViZDMyNWQ3MzE0YWFhNjE0
MTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgxYjU1YTAxNGIyZTVmMDg2M2E1YTNm
ZDU4NDE2OGM5ZDRjZTllYjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwg
MjIgTWF5IDIwMjQgMTM6NTg6MjMgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogRW5zdXJl
IHBpcCBhbmQgdGhlIHB5dGhvbiB2ZW52IGFyZW4ndCB1c2VkIGZvciBtZXNvbgpAQCAtMjksMTAg
KzI5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4
IGFmMGJkMmM2Ni4uODhkYWI2YTk1IDEwMDc1NQoraW5kZXggMmIwMTRiOTdjLi40NWRjOGIxNDYg
MTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTk0NCwxNCArOTQ0
LDE0IEBAIHB5dGhvbj0iJChjb21tYW5kIC12ICIkcHl0aG9uIikiCitAQCAtOTg4LDE0ICs5ODgs
MTQgQEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24iKSIKICBlY2hvICJweXRob24gZGV0
ZXJtaW5lZCB0byBiZSAnJHB5dGhvbiciCiAgZWNobyAicHl0aG9uIHZlcnNpb246ICQoJHB5dGhv
biAtLXZlcnNpb24pIgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoCmluZGV4IGI1N2M0ODExODMuLmNhNjY3
NjkyYjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0
cmVycm9ybmFtZV9ucC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlkZTVkZTg1
ZmE5MTdhZjU4ZTdiYzljZGQ4OGY4ZjdlZjhkYTJjYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDZlNWE2ZDQ0OTUwYzQ4OTU3ZjM5MDYyOTRiOGVmZDZhNzZiOTE1NzYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBOYXRhbmFlbCBDb3BhIDxuY29wYUBhbHBpbmVsaW51eC5v
cmc+CiBEYXRlOiBXZWQsIDE4IFNlcCAyMDI0IDE2OjE5OjM3IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHRhcmdldC9yaXNjdi9rdm06IGRvIG5vdCB1c2Ugbm9uLXBvcnRhYmxlIHN0cmVycm9ybmFt
ZV9ucCgpCkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogTmF0YW5hZWwgQ29wYSA8
bmNvcGFAYWxwaW5lbGludXgub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9rdm0va3ZtLWNwdS5j
IGIvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMKLWluZGV4IGY2ZTMxNTZiOC4uZmFkOWViMjFj
IDEwMDY0NAoraW5kZXggYzUzY2ExZjc2Li4zYzY3MTI5ZWYgMTAwNjQ0CiAtLS0gYS90YXJnZXQv
cmlzY3Yva3ZtL2t2bS1jcHUuYwogKysrIGIvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMKLUBA
IC0xODU5LDggKzE4NTksNyBAQCBzdGF0aWMgYm9vbCBrdm1fY3B1X3JlYWxpemUoQ1BVU3RhdGUg
KmNzLCBFcnJvciAqKmVycnApCitAQCAtMTg3MCw4ICsxODcwLDcgQEAgc3RhdGljIGJvb2wga3Zt
X2NwdV9yZWFsaXplKENQVVN0YXRlICpjcywgRXJyb3IgKiplcnJwKQogICAgICBpZiAocmlzY3Zf
aGFzX2V4dCgmY3B1LT5lbnYsIFJWVikpIHsKICAgICAgICAgIHJldCA9IHByY3RsKFBSX1JJU0NW
X1ZfU0VUX0NPTlRST0wsIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfT04pOwogICAgICAgICAgaWYg
KHJldCkgewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjIu
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfOS4yLjMuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVf
OS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfOS4yLjMu
YmIKLS0gCjIuNDcuMQoK

--===============1459467393789278176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1887 targets, 50 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-64 sysroot...done.
Removing 112 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:42cae3e33885c54edb883c7e93466316a1ab901e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 834 Local 619 Mirrors 0 Missed 215 Current 398 (74% match, 82% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 434 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 455 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 457 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 486 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 488 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.2.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 525 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 539 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-9.2.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 601 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 602 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe qemu-9.2.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 612 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsdl2-2.32.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsdl2-2.32.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 648 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 666 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libslirp-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 667 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 669 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libslirp-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-2.32.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 689 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 705 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsdl2-2.32.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-4.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libslirp-4.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 745 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 771 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 789 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-76.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 802 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 811 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 825 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 827 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 830 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 842 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 844 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 849 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 858 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 860 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 862 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 864 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 869 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 872 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 883 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 884 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 887 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 890 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 893 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.74.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 896 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 899 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 905 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.74-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 910 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 911 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 912 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 914 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 915 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.74-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 917 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 920 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 923 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ofono-2.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 924 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 926 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 930 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 932 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ofono-2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 939 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 940 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 942 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 944 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 945 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 946 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 951 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 957 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 962 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 963 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 964 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 965 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.74.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 967 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 971 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 972 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 974 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe ell-0.74-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 975 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 977 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 980 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe ell-0.74-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 983 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 984 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 993 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 996 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 998 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1001 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1002 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1006 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1009 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1010 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1011 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1015 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1016 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1019 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1022 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1023 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1026 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-76.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1028 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1032 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1033 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1035 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1038 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1039 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1041 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-76.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1045 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1046 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1047 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1048 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1053 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1054 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1056 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1060 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-76.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1065 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1066 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1068 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1069 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1070 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1071 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1072 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1073 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1082 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1085 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1088 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1090 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1091 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-76.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1094 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1098 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1101 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-76.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1108 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1109 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1119 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1122 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1123 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1125 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1126 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1128 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1130 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1131 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1133 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1134 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1135 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.40.4/temp/log.do_packagedata_setscene.913300
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1138 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_package_setscene)
NOTE: Running setscene task 1140 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1151 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1152 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1157 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1158 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1164 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1167 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1176 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1178 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1180 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1185 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1190 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1192 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1193 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1197 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 590 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1199 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: Running task 679 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 701 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: Running setscene task 1200 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1201 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running task 710 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1206 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 780 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_unpack)
NOTE: Running task 785 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 848 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_write_config)
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 859 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: Running task 953 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 955 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_fetch)
NOTE: Running task 961 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running task 990 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 991 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1007 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1008 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_unpack)
NOTE: Running task 1021 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1051 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Started
NOTE: Running task 1070 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1071 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1076 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1080 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Started
NOTE: Running task 1092 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1095 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1097 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: Running task 1118 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: Running task 1119 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1128 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1134 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: Running task 1137 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1138 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: Running task 1149 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: Running task 1151 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: Running task 1158 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: Running task 1171 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1199 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1200 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_patch)
NOTE: Running task 1204 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1214 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1216 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: Running task 1224 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1229 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1234 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1249 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: Running task 1251 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: Running task 1254 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: Running task 1256 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1266 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1270 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: Running task 1275 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.1-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe kmod-34.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: Running task 1293 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1295 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_fetch)
NOTE: Running task 1296 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: Running task 1298 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: Running task 1299 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: Running task 1308 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: Running task 1309 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: Running task 1314 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_write_config)
NOTE: Running task 1319 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1321 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe bluez5-5.79-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.1-r0: task do_unpack: Started
NOTE: Running task 1323 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe bluez5-5.79-r0: task do_fetch: Succeeded
NOTE: Running task 1325 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: Running task 1334 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe kmod-34.1-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1336 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe kmod-34.1-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_unpack: Started
NOTE: Running task 1352 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1353 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: Running task 1357 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe kmod-34.1-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: Running task 1362 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: Running setscene task 1228 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_fetch: Started
NOTE: Running task 1389 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: Running task 1390 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.1-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.1-r0: task do_patch: Succeeded
NOTE: Running task 1412 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: Running task 1417 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: Running task 1419 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: Running task 1420 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: Running task 1421 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_fetch: Started
NOTE: Running task 1423 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.124-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: recipe bluez5-5.79-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1425 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: Running task 1426 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_patch)
NOTE: Running task 1428 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: Running task 1429 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 1230 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1231 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: Running task 1490 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1491 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1505 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: Running task 1506 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1507 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: Running task 1508 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: Running task 1509 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: Running task 1544 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1567 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: Running task 1568 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.74.bb:do_fetch)
NOTE: Running task 1570 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1575 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_write_config)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: Running task 1576 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe libdrm-2.4.124-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.74-r0: task do_fetch: Started
NOTE: Running task 1578 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Started
NOTE: Running task 1579 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: recipe wayland-protocols-1.41-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1580 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe ell-0.74-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: Running task 1581 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: Running task 1584 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe wayland-protocols-1.41-r0: task do_write_config: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe bluez5-5.79-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.124-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: Running task 1674 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1742 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1768 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1836 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1849 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1865 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata)
NOTE: Running task 1891 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1909 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_configure)
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1912 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1915 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1924 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: Running task 1925 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_fetch)
NOTE: Running task 1927 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_write_config)
NOTE: Running task 1953 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe ofono-2.15-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.15-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_patch: Succeeded
NOTE: Running task 1965 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_generate_toolchain_file)
NOTE: Running task 1966 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1967 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: Running task 1991 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe libdrm-2.4.124-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1992 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.74.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1994 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.74-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2044 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2051 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Started
NOTE: Running task 2058 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2072 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe ell-0.74-r0: task do_unpack: Succeeded
NOTE: Running task 2110 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 2111 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.74.bb:do_patch)
NOTE: Running task 2112 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_unpack)
NOTE: Running task 2114 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure: Started
NOTE: recipe kmod-34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: Running task 2135 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_configure)
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2142 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe ell-0.74-r0: task do_patch: Started
NOTE: Running task 2156 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.15-r0: task do_unpack: Started
NOTE: Running task 2157 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 2158 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe ell-0.74-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: Running task 2161 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe kmod-34.1-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: Running task 2162 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2163 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: Running task 2172 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.15-r0: task do_unpack: Succeeded
NOTE: Running task 2177 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.15.bb:do_patch)
NOTE: Running task 2178 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe wayland-protocols-1.41-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: Running task 2185 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2187 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libsdl2-2.32.2-r0: task do_fetch: Started
NOTE: Running task 2200 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_write_config)
NOTE: recipe ofono-2.15-r0: task do_patch: Started
NOTE: recipe libsdl2-2.32.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Started
NOTE: Running task 2201 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Started
NOTE: recipe ofono-2.15-r0: task do_patch: Succeeded
NOTE: Running task 2209 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Succeeded
NOTE: Running task 2211 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_fetch)
NOTE: Running task 2213 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2214 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2215 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Started
NOTE: recipe libslirp-4.9.0-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_install)
NOTE: recipe pixman-1_0.44.2-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 2219 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb:do_unpack)
NOTE: recipe wayland-protocols-1.41-r0: task do_install: Started
NOTE: recipe libslirp-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: Running task 2221 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: Running task 2225 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.2.3.bb:do_recipe_qa)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libsdl2-2.32.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: Running task 2254 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_unpack)
NOTE: Running task 2273 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2274 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe qemu-9.2.3-r0: task do_recipe_qa: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2275 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2281 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 2282 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_unpack)
NOTE: Running task 2283 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Started
NOTE: recipe qemu-9.2.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2284 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.2.3.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe qemu-9.2.3-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_unpack)
NOTE: recipe qemu-9.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2286 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_unpack)
NOTE: recipe libsdl2-2.32.2-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb:do_patch)
NOTE: recipe libslirp-4.9.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.32.2-r0: task do_patch: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_patch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_patch)
NOTE: Running task 2290 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2302 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.2.3.bb:do_unpack)
NOTE: recipe pixman-1_0.44.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: Running task 2303 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_populate_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libsdl2-2.32.2-r0: task do_patch: Succeeded
NOTE: Running task 2304 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe qemu-9.2.3-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: Running task 2338 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.41-r0: task do_populate_sysroot: Started
NOTE: Running task 2349 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_patch)
NOTE: Running task 2350 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2351 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_patch)
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_package)
NOTE: Running task 2353 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 2373 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe libslirp-4.9.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe wayland-protocols-1.41-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe libslirp-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2376 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 2378 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_write_config)
NOTE: Running task 2379 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2380 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_write_config)
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_populate_sysroot unihash changed to e57fcf9e82c57dfe44db856bd852d9754041cb78ae379cafb94a2cc89dcebeae
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Started
NOTE: recipe libslirp-4.9.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_write_config: Started
NOTE: recipe libslirp-4.9.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2381 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: Running task 2382 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: Running task 2383 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: Running task 2384 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2385 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 2386 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2387 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb:do_generate_toolchain_file)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-2.32.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Started
NOTE: recipe libsdl2-2.32.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2396 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 2444 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_configure: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2445 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2446 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 2475 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Started
NOTE: recipe kmod-34.1-r0: task do_configure: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: Running task 2481 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_compile)
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2512 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Succeeded
NOTE: Running task 2556 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe kmod-34.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running task 2587 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2589 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: recipe wayland-1.23.1-r0: task do_compile: Started
NOTE: Running task 2590 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: Running task 2591 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2616 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.44.2-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: Running task 2618 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_package: Succeeded
NOTE: Running task 2619 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_package unihash changed to 1038978325cbc549974c428b2bb27fd258748c69f28039f4fba725060c7a3384
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_packagedata became valid
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_packagedata_setscene)
NOTE: Running task 2620 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: Running task 2647 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to fe334be2aaa3163a774e16851d9a351f0b4849a64995e76c3083443aecc691f9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot became valid
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe kmod-34.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 1166 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1183 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Running setscene task 1192 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 2648 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_compile: Succeeded
NOTE: Running task 2649 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile_ptest_base)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.1-r0: task do_compile: Succeeded
NOTE: Running task 2650 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2651 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 2652 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: Running setscene task 1225 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2653 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Started
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2655 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2656 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.1-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: Running task 2657 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1226 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_install: Started
NOTE: Running setscene task 1228 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2658 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to a6e2b0b547e638f9f584e7af734bb31c74b37dbb874db45b6a56d613fa9a557d
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 2209c0b1495df22cdcfbf20cbcb936448169f12180449adeea3832cbd0e70ad1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot unihash changed to 4dcee1906e50a0360fde4f95d5ef4e7ba353969fa6e40f335e4d075a0ad58a6c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: recipe kmod-34.1-r0: task do_install: Succeeded
NOTE: Running setscene task 1165 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1184 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1192 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_install: Succeeded
NOTE: Running setscene task 1198 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running task 2659 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: Running task 2660 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_populate_sysroot)
NOTE: Running task 2661 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install_ptest_base)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 2662 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2663 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe kmod-34.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1204 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 1205 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1206 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: Running setscene task 1207 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Started
NOTE: recipe libdrm-2.4.124-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2664 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot)
NOTE: recipe pixman-1_0.44.2-r0: task do_configure: Succeeded
NOTE: Running task 2665 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package)
NOTE: Running task 2666 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: recipe kmod-34.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1208 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 39d560097f0a1c88bced489cd17da5bc4b5cc4b24168cbae43183af0a3c41a54
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.124-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_populate_sysroot unihash changed to 28c7952fed3da5a8020c7d0f036dca1223225faed353cd3e14373d033a021cae
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1169 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: Running setscene task 1177 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1210 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running task 2667 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_configure)
NOTE: Running task 2668 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_compile)
NOTE: Running task 2669 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2670 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2671 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot unihash changed to ed7824cdc9b734a43c447e287c8cabc38c60c60e6dac00cacaaf3d8ee8491deb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot became valid
NOTE: recipe libdrm-2.4.124-r0: task do_configure: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Started
NOTE: Running setscene task 1188 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running setscene task 1189 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1212 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1214 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2706 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: Running task 2714 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: Running task 2715 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1215 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: Running task 2716 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2718 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_create_spdx)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2719 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 2738 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: Running setscene task 1216 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1217 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.1-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2739 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_package unihash changed to da5661d211cebfa7b5121c936b4ab5e9f0b1fec8d1e5e2f92c736e592c82ffac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_packagedata became valid
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.41-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 1201 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package_setscene)
NOTE: Running setscene task 1202 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: Running setscene task 1219 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_packagedata_setscene)
NOTE: Running task 2740 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot unihash changed to c2478a5a8e2183c52e626a393f0575dd4b8dba13aef9552d8adf57c8011ef66d
NOTE: recipe kmod-34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package unihash changed to 8ea7ce65ce876175553fdcd7dad3a1914eed1db2a1f0e2ae052d6a27d0298584
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata became valid
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: recipe kmod-34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1219 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running task 2745 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 2746 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: Running task 2747 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_create_spdx)
NOTE: Running task 2748 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to 35f99d2dfd3c8f6f3c8dca25432fe2435c506eafafc53e9229a81db84474514e
NOTE: recipe kmod-34.1-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1220 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1221 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 2873 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2892 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: Running setscene task 1222 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe qemu-9.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2896 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.2.3.bb:do_patch)
NOTE: Running task 2897 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot unihash changed to 961800100b637fa46f0825cbf3d9aeeb1e19f9121c0bafb07af3f573f44eaca4
NOTE: recipe qemu-9.2.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.124-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2914 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe wayland-1.23.1-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2944 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_collect_spdx_deps)
NOTE: Running task 2945 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package unihash changed to e15a784c06698415f341edf8a675853d3c3bd00a11fbecc4bed9e2e91a56ae50
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_package became valid
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.124-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1220 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running task 2946 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 2947 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: Running task 2948 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_compile)
NOTE: Running task 2949 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_collect_spdx_deps)
NOTE: Running task 2950 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.124-r0: task do_compile: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_package_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_package_setscene: Started
NOTE: recipe qemu-9.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2978 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to 15eecc8d2d0ebf393369e9143063309abe854c1b02d8fdcddd44b85c29b2e3bb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: recipe qemu-9.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1221 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package unihash changed to e392082f7bedee63040aa99535a2e207e0f8e04668731c7b2cca151138d864e7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata became valid
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1221 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1222 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1223 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1224 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-9.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2981 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot unihash changed to 310002acd45cf978ecd2af7e6b030c60b1e196f7b42005304fc425cd7470b92a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot became valid
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: Running setscene task 1207 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1214 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2982 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2984 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx)
NOTE: Running task 2986 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2987 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2988 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2989 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_configure)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.75-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2990 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure)
NOTE: Running task 2991 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_configure)
NOTE: recipe libcap-2.75-r0: task do_configure: Succeeded
NOTE: Running task 2992 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Started
NOTE: recipe libcap-2.75-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.124-r0: task do_compile: Succeeded
NOTE: Running task 2993 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_install)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to b8361d2769ead7dd5c535372e9f7c79649917e17edf2c307dc7b31265d4de98d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.124-r0: task do_install: Started
NOTE: Running setscene task 1225 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2995 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.124-r0: task do_install: Succeeded
NOTE: Running task 2996 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot)
NOTE: Running task 2997 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_package)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.124-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1226 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1228 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1229 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1230 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: Running setscene task 1231 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot unihash changed to 6811213d20a231d2b6a5afc72c8b86878832dbcf0fe18e7b1bb6a9c8b10a4f02
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running task 3063 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.75-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 3073 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_install)
NOTE: Running task 3075 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3085 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3112 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3113 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3114 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3115 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3116 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3117 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_configure: Started
NOTE: Running task 3118 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 3119 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3120 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_configure_ptest_base)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3121 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3122 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3123 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3124 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3125 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe libcap-2.75-r0: task do_install: Succeeded
NOTE: Running task 3127 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_package: Succeeded
NOTE: Running task 3128 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_package unihash changed to 81b6096b564aa472457a63b98c50f59d48bbd94040f5496b0d1b06356a368522
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata became valid
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_install: Started
NOTE: Running setscene task 1231 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running task 3129 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3131 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_install: Succeeded
NOTE: Running task 3132 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot)
NOTE: Running task 3133 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_package)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3134 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.44.2-r0: task do_package: Started
NOTE: Running task 3135 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3136 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot unihash changed to fb60796a3f034baea8348c41a247e93a74427618b9c731c88174e45a0677bdef
NOTE: recipe libxkbcommon-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3137 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3138 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3139 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 3140 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3141 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3142 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3143 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_package: Succeeded
NOTE: Running task 3144 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_package unihash changed to c97e8e299441bac165317b11fc6017430320ce580b02dc07b0be8e09453fcc7a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata became valid
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: Running task 3145 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3147 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3148 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3149 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3150 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx: Started
NOTE: Running task 3151 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3152 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3153 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3154 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3155 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to 26a7ebfb296d0d2c70a0247aebcb9e02e116c00bb9acac6873eaac49038b2453
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1222 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running task 3156 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3157 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: Running task 3158 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3159 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3160 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_create_spdx)
NOTE: Running task 3161 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3162 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3164 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx)
NOTE: Running task 3165 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.75-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3166 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_install)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3167 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_collect_spdx_deps)
NOTE: Running task 3168 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_collect_spdx_deps)
NOTE: Running task 3169 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot)
NOTE: Running task 3171 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_package)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot unihash changed to bbd5f29b3782e0cb3ee9c3f83c462779eae0754d2aca18311b18f07192f3b10e
NOTE: Setscene tasks completed
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Running task 3172 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libcap-2.75-r0: task do_package: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package unihash changed to df4773f20a9d8d071bb0ad832af52c98d22fec203d2c99af700afd50a6970092
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata became valid
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3174 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_compile_ptest_base)
NOTE: Running task 3175 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3176 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install: Started
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_package unihash changed to fbc5ad30bfe8e10d9ae58241a13b3dac76531ae11b6004e27de8db352727e8e7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata became valid
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3178 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.17.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3179 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3180 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3181 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_populate_sysroot unihash changed to 939ba873ac235327fd95eb8175f0d7d5cf33c31840b8723a60329f39ac7511d3
NOTE: Setscene tasks completed
NOTE: Running task 3182 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3183 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3184 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3185 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe shadow-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_install)
NOTE: recipe shadow-4.17.3-r0: task do_install: Started
NOTE: recipe shadow-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package)
NOTE: recipe shadow-4.17.3-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3194 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Succeeded
NOTE: Running task 3195 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3196 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile)
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package unihash changed to ee137a74c3ef98c6f02927ae895f9bebf529402783c98beb7e99076c3723e3a3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata became valid
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3198 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx)
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running task 3207 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3208 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3209 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to e1a29c1577c7681cd449b09576ce1c7daf4f10aaeea01596b837d275340ba003
NOTE: Setscene tasks completed
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to a22bffe381858b426550fb80f35150fe3447dd6bbeec274030b19ffb94b04320
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Succeeded
NOTE: Running setscene task 1232 of 1232 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running task 3210 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3212 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3213 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install)
NOTE: recipe util-linux-2.40.4-r0: task do_install: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install: Succeeded
NOTE: Running task 3214 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3215 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot)
NOTE: Running task 3216 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3217 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3218 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3219 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3220 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3221 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3222 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3223 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3224 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3225 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3226 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe coreutils-9.6-r0: task do_compile: Succeeded
NOTE: Running task 3227 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3228 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install)
NOTE: recipe coreutils-9.6-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3229 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_install: Succeeded
NOTE: Running task 3230 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3232 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package)
NOTE: recipe coreutils-9.6-r0: task do_package: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata: Failed
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3232 tasks of which 2844 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401060155.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401060155.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.4/temp/log.do_packagedata.1049377
Summary: There were 172 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.40.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fcntl-lock went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41-r0 to 0:2.40.4-r0) [version-going-backwards]
ERROR: util-linux-2.40.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.4/temp/log.do_packagedata.1049377
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata) failed with exit code '1'

--===============1459467393789278176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/qemu: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-9.2.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-9.2.3.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addi
 tion-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu/qemu-common: PKGSIZE changed from 341697424 to 341698021 (+0%)
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-common: FILELIST: added "/usr/share/qemu/firmware/60-edk2-riscv64.json"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1853030448 to 1853228912 (+0%)
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-dev: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-dev: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-doc: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-doc: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-locale: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-locale: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 184061432 to 184058056 (-0%)
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 83681561 to 83706246 (+0%)
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/9.2.0/include/hw/arm -> /usr/src/debug/qemu/9.2.3/include/hw/arm, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/migration -> /usr/src/debug/qemu/9.2.3/include/migration, directory renamed /usr/src/debug/qemu/9.2.0/nbd -> /usr/src/debug/qemu/9.2.3/nbd, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/fsdev -> /usr/src/debug/qemu/9.2.3/fsdev, directory renamed /usr/src/debug/qemu/9.2.0/host/include/generic/host -> /usr/src/debug/qemu/9.2.3/host/include/generic/host, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/mips64 -> /usr/src/debug/qemu/9.2.3/linux-user/mips64, directory renamed /usr/src/debug/qemu/9.2.0/hw/net/can -> /usr/src/deb
 ug/qemu/9.2.3/hw/net/can, directory renamed /usr/src/debug/qemu/9.2.0/audio -> /usr/src/debug/qemu/9.2.3/audio, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/ppc -> /usr/src/debug/qemu/9.2.3/include/hw/ppc, directory renamed /usr/src/debug/qemu/9.2.0/hw/rtc -> /usr/src/debug/qemu/9.2.3/hw/rtc, directory renamed /usr/src/debug/qemu/9.2.0/hw/isa -> /usr/src/debug/qemu/9.2.3/hw/isa, directory renamed /usr/src/debug/qemu/9.2.0/hw/tpm -> /usr/src/debug/qemu/9.2.3/hw/tpm, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/virtio -> /usr/src/debug/qemu/9.2.3/include/hw/virtio, directory renamed /usr/src/debug/qemu/9.2.0/hw/net -> /usr/src/debug/qemu/9.2.3/hw/net, directory renamed /usr/src/debug/qemu/9.2.0/include/io -> /usr/src/debug/qemu/9.2.3/include/io, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/usb -> /usr/src/debug/qemu/9.2.3/include/hw/usb, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-riscv32
 -linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/core -> /usr/src/debug/qemu/9.2.3/include/hw/core, directory renamed /usr/src/debug/qemu/9.2.0/scsi -> /usr/src/debug/qemu/9.2.3/scsi, directory renamed /usr/src/debug/qemu/9.2.0/authz -> /usr/src/debug/qemu/9.2.3/authz, directory renamed /usr/src/debug/qemu/9.2.0/linux-user -> /usr/src/debug/qemu/9.2.3/linux-user, directory renamed /usr/src/debug/qemu/9.2.0/include/qemu -> /usr/src/debug/qemu/9.2.3/include/qemu, directory renamed /usr/src/debug/qemu/9.2.0/hw/arm -> /usr/src/debug/qemu/9.2.3/hw/arm, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/sensor -> /usr/src/debug/qemu/9.2.3/include/hw/sensor, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/misc -> /usr/src/debug/qemu/9.2.3/include/hw/misc, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/rtc -> /usr/src/debug/qemu/9.2.3/include/hw/rtc, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/9.2.
 3/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/9.2.0/hw/display -> /usr/src/debug/qemu/9.2.3/hw/display, directory renamed /usr/src/debug/qemu/9.2.0/hw/ppc -> /usr/src/debug/qemu/9.2.3/hw/ppc, directory renamed /usr/src/debug/qemu/9.2.0/include/hw -> /usr/src/debug/qemu/9.2.3/include/hw, directory renamed /usr/src/debug/qemu/9.2.0/include/fpu -> /usr/src/debug/qemu/9.2.3/include/fpu, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/i2c -> /usr/src/debug/qemu/9.2.3/include/hw/i2c, directory renamed /usr/src/debug/qemu/9.2.0/target/i386 -> /usr/src/debug/qemu/9.2.3/target/i386, directory renamed /usr/src/debug/qemu/9.2.0/qga -> /usr/src/debug/qemu/9.2.3/qga, directory renamed /usr/src/debug/qemu/9.2.0/host/include/x86_64/host -> /usr/src/debug/qemu/9.2.3/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/9.2.0/hw/misc/macio -> /usr/src/debug/qemu/9.2.3/hw/misc/macio, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mips-softmmu.a.p -> /usr/
 src/debug/qemu/9.2.3/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/sysemu -> /usr/src/debug/qemu/9.2.3/include/sysemu, directory renamed /usr/src/debug/qemu/9.2.0/target/sh4 -> /usr/src/debug/qemu/9.2.3/target/sh4, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/xen/interface/arch-x86 -> /usr/src/debug/qemu/9.2.3/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/9.2.3/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/9.2.0/linux-headers/linu
 x -> /usr/src/debug/qemu/9.2.3/linux-headers/linux, directory renamed /usr/src/debug/qemu/9.2.0/include/standard-headers/linux -> /usr/src/debug/qemu/9.2.3/include/standard-headers/linux, directory renamed /usr/src/debug/qemu/9.2.0/target/loongarch/tcg -> /usr/src/debug/qemu/9.2.3/target/loongarch/tcg, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/audio -> /usr/src/debug/qemu/9.2.3/include/hw/audio, directory renamed /usr/src/debug/qemu/9.2.0/host/include/i386/host/crypto -> /usr/src/debug/qemu/9.2.3/host/include/i386/host/crypto, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/qom -> /usr/src/debug/qemu/9.2.3/qom, directory renamed /usr/src/debug/qemu/9.2.0/target/arm/tcg -> /usr/src/debug/qemu/9.2.3/target/arm/tcg, directory renamed /usr/src/debug/qemu/9.2.0/tests/fp -> /usr/src/debug/qemu/9.2.3/tests/fp, directory renamed /usr/src/debug/qemu/9.
 2.0/ebpf -> /usr/src/debug/qemu/9.2.3/ebpf, directory renamed /usr/src/debug/qemu/9.2.0/target/i386/tcg/user -> /usr/src/debug/qemu/9.2.3/target/i386/tcg/user, directory renamed /usr/src/debug/qemu/9.2.0/host/include/i386/host -> /usr/src/debug/qemu/9.2.3/host/include/i386/host, directory renamed /usr/src/debug/qemu/9.2.0/backends/tpm -> /usr/src/debug/qemu/9.2.3/backends/tpm, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/pci -> /usr/src/debug/qemu/9.2.3/include/hw/pci, directory renamed /usr/src/debug/qemu/9.2.0/include/disas -> /usr/src/debug/qemu/9.2.3/include/disas, directory renamed /usr/src/debug/qemu/9.2.0/tools/i386 -> /usr/src/debug/qemu/9.2.3/tools/i386, directory renamed /usr/src/debug/qemu/9.2.0/hw/fsi -> /usr/src/debug/qemu/9.2.3/hw/fsi, directory renamed /usr/src/debug/qemu/9.2.0/include/user -> /usr/src/debug/qemu/9.2.3/include/user, directory renamed /usr/src/debug/qemu/9.2.0/accel/stubs -> /usr/src/debug/qemu/9.2.3/accel/stubs, directory renamed /usr/src/de
 bug/qemu/9.2.0/include/hw/xen/interface/io -> /usr/src/debug/qemu/9.2.3/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/9.2.0/tcg/i386 -> /usr/src/debug/qemu/9.2.3/tcg/i386, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/nvram -> /usr/src/debug/qemu/9.2.3/include/hw/nvram, directory renamed /usr/src/debug/qemu/9.2.0/include -> /usr/src/debug/qemu/9.2.3/include, directory renamed /usr/src/debug/qemu/9.2.0/target/riscv -> /usr/src/debug/qemu/9.2.3/target/riscv, directory renamed /usr/src/debug/qemu/9.2.0/hw/sensor -> /usr/src/debug/qemu/9.2.3/hw/sensor, directory renamed /usr/src/debug/qemu/9.2.0/include/authz -> /usr/src/debug/qemu/9.2.3/include/authz, directory renamed /usr/src/debug/qemu/9.2.0/tests/migration/i386 -> /usr/src/debug/qemu/9.2.3/tests/migration/i386, directory renamed /usr/src/debug/qemu/9.2.0/tests/qtest/libqos -> /usr/src/debug/qemu/9.2.3/tests/qtest/libqos, directory renamed /usr/src/debug/qemu/9.2.0/trace -> /usr/src/debug/qemu/9.2.3/tra
 ce, directory renamed /usr/src/debug/qemu/9.2.0/hw/dma -> /usr/src/debug/qemu/9.2.3/hw/dma, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/include/host/x86_64 -> /usr/src/debug/qemu/9.2.3/linux-user/include/host/x86_64, directory renamed /usr/src/debug/qemu/9.2.0/target/mips/tcg -> /usr/src/debug/qemu/9.2.3/target/mips/tcg, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/net -> /usr/src/debug/qemu/9.2.3/include/hw/net, directory renamed /usr/src/debug/qemu/9.2.0/include/qom -> /usr/src/debug/qemu/9.2.3/include/qom, directory renamed /usr/src/debug/qemu/9.2.0/storage-daemon/qapi -> /usr/src/debug/qemu/9.2.3/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/9.2.0/hw/net/fsl_etsec -> /usr/src/debug/qemu/9.2.3/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/9.2.0/semihosting -> /usr/src/debug/qemu/9.2.3/semihosting, directory renamed /usr/src/debug/qemu/9.2.0/tests/unit -> /usr/src/debug/qemu/9.2.3/tests/unit, directory renamed /usr/src/debug/qemu/9.2.0/i
 o -> /usr/src/debug/qemu/9.2.3/io, directory renamed /usr/src/debug/qemu/9.2.0/tests/tcg/plugins -> /usr/src/debug/qemu/9.2.3/tests/tcg/plugins, directory renamed /usr/src/debug/qemu/9.2.0/block/export -> /usr/src/debug/qemu/9.2.3/block/export, directory renamed /usr/src/debug/qemu/9.2.0/target/loongarch/tcg/insn_trans -> /usr/src/debug/qemu/9.2.3/target/loongarch/tcg/insn_trans, directory renamed /usr/src/debug/qemu/9.2.0/hw/timer -> /usr/src/debug/qemu/9.2.3/hw/timer, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/fsi -> /usr/src/debug/qemu/9.2.3/include/hw/fsi, directory renamed /usr/src/debug/qemu/9.2.0/hw/ufs -> /usr/src/debug/qemu/9.2.3/hw/ufs, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/remote -> /usr/src/debug/qemu/9.2.3/include/hw/remote, directory renamed /usr/src/debug/qemu/9.2.0/include/libdecnumber/dpd -> /usr/src/debug/qemu/9.2.3/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/9.2.0/target/i386/tcg -> /usr/src/debug/qemu/9.2.3/target/
 i386/tcg, directory renamed /usr/src/debug/qemu/9.2.0/replay -> /usr/src/debug/qemu/9.2.3/replay, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/pci-bridge -> /usr/src/debug/qemu/9.2.3/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/xen -> /usr/src/debug/qemu/9.2.3/include/hw/xen, directory renamed /usr/src/debug/qemu/9.2.0/hw/nvme -> /usr/src/debug/qemu/9.2.3/hw/nvme, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/riscv -> /usr/src/debug/qemu/9.2.3/linux-user/riscv, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/display -> /usr/src/
 debug/qemu/9.2.3/include/hw/display, directory renamed /usr/src/debug/qemu/9.2.0/stats -> /usr/src/debug/qemu/9.2.3/stats, directory renamed /usr/src/debug/qemu/9.2.0/target/riscv/insn_trans -> /usr/src/debug/qemu/9.2.3/target/riscv/insn_trans, directory renamed /usr/src/debug/qemu/9.2.0/subprojects/berkeley-softfloat-3/source/include -> /usr/src/debug/qemu/9.2.3/subprojects/berkeley-softfloat-3/source/include, directory renamed /usr/src/debug/qemu/9.2.0/hw/input -> /usr/src/debug/qemu/9.2.3/hw/input, directory renamed /usr/src/debug/qemu/9.2.0/fpu -> /usr/src/debug/qemu/9.2.3/fpu, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/pci-host -> /usr/src/debug/qemu/9.2.3/include/hw/pci-host, directory renamed /usr/src/debug/qemu/9.2.0/contrib/vhost-user-gpu -> /usr/src/debug/qemu/9.2.3/contrib/vhost-user-gpu, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/ide -> /usr/src/debug/qemu/9.2.3/include/hw/ide, directory renamed /usr/src/debug/qemu/9.2.0/include/scsi -> /usr/src/d
 ebug/qemu/9.2.3/include/scsi, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/aarch64 -> /usr/src/debug/qemu/9.2.3/linux-user/aarch64, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/arm/nwfpe -> /usr/src/debug/qemu/9.2.3/linux-user/arm/nwfpe, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/loongarch64 -> /usr/src/debug/qemu/9.2.3/linux-user/loongarch64, directory renamed /usr/src/debug/qemu/9.2.0/include/libdecnumber -> /usr/src/debug/qemu/9.2.3/include/libdecnumber, directory renamed /usr/src/debug/qemu/9.2.0/tcg -> /usr/src/debug/qemu/9.2.3/tcg, directory renamed /usr/src/debug/qemu/9.2.0/hw/i386/kvm -> /usr/src/debug/qemu/9.2.3/hw/i386/kvm, directory renamed /usr/src/debug/qemu/9.2.0 -> /usr/src/debug/qemu/9.2.3, directory renamed /usr/src/debug/qemu/9.2.0/backends -> /usr/src/debug/qemu/9.2.3/backends, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/riscv -> /usr/src/debug/qemu/9.2.3/include/hw/riscv, directory renamed /usr/src/debug/qemu/9.2.0/block
  -> /usr/src/debug/qemu/9.2.3/block, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/mem -> /usr/src/debug/qemu/9.2.3/include/hw/mem, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/arm -> /usr/src/debug/qemu/9.2.3/linux-user/arm, directory renamed /usr/src/debug/qemu/9.2.0/target/arm -> /usr/src/debug/qemu/9.2.3/target/arm, directory renamed /usr/src/debug/qemu/9.2.0/hw/pci -> /usr/src/debug/qemu/9.2.3/hw/pci, directory renamed /usr/src/debug/qemu/9.2.0/include/exec -> /usr/src/debug/qemu/9.2.3/include/exec, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/misc/macio -> /usr/src/debug/qemu/9.2.3/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/9.2.0/tests/migration/aarch64 -> /usr/src/debug/qemu/9.2.3/tests/migration/aarch64, directory renamed /usr/src/debug/qemu/9.2.0/ui/shader -> /usr/src/debug/qemu/9.2.3/ui/shader, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/block -> /usr/src/debug/qemu/9.2.3/include/hw/block, directory renamed /usr/src
 /debug/qemu/9.2.0/hw/net/rocker -> /usr/src/debug/qemu/9.2.3/hw/net/rocker, directory renamed /usr/src/debug/qemu/9.2.0/hw/pci-host -> /usr/src/debug/qemu/9.2.3/hw/pci-host, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/ipack -> /usr/src/debug/qemu/9.2.3/include/hw/ipack, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/ppc -> /usr/src/debug/qemu/9.2.3/linux-user/ppc, directory renamed /usr/src/debug/qemu/9.2.0/target/ppc -> /usr/src/debug/qemu/9.2.3/target/ppc, directory renamed /usr/src/debug/qemu/9.2.0/contrib/ivshmem-server -> /usr/src/debug/qemu/9.2.3/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/sh4 -> /usr/src/debug/qemu/9.2.3/linux-user/sh4, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/sd -> /usr/src/debug/qemu/9.2.3/include/hw/sd, directory renamed /usr/src/debug/qemu/9.2.0/libdecnumber -> /usr/src/debug/qemu/9.2.3/libdecnumber, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-ppc64le-linux-user.a.p -> /usr/src/de
 bug/qemu/9.2.3/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/hw/block -> /usr/src/debug/qemu/9.2.3/hw/block, directory renamed /usr/src/debug/qemu/9.2.0/hw/ipack -> /usr/src/debug/qemu/9.2.3/hw/ipack, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/hyperv -> /usr/src/debug/qemu/9.2.3/include/hw/hyperv, directory renamed /usr/src/debug/qemu/9.2.0/accel/kvm -> /usr/src/debug/qemu/9.2.3/accel/kvm, directory renamed /usr/src/debug/qemu/9.2.0/hw/i386/xen -> /usr/src/debug/qemu/9.2.3/hw/i386/xen, directory renamed /usr/src/debug/qemu/9.2.0/include/tcg -> /usr/src/debug/qemu/9.2.3/include/tcg, directory renamed /usr/src/debug/qemu/9.2.0/target/loongarch -> /usr/src/debug/qemu/9.2.3/target/loongarch, directory renamed /usr/src/debug/qemu/9.2.0/hw/pci-bridge -> /usr/src/debug/qemu/9.2.3/hw/pci-bridge, directory renamed /usr/src/debug/qemu/9.2.0/hw/riscv -> /usr/src/debug/qemu/9.2.3/hw/riscv, directory renamed /usr/src/debug/qemu/9.2.0/subprojects/libvhost
 -user -> /usr/src/debug/qemu/9.2.3/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/9.2.0/block/monitor -> /usr/src/debug/qemu/9.2.3/block/monitor, directory renamed /usr/src/debug/qemu/9.2.0/target/riscv/tcg -> /usr/src/debug/qemu/9.2.3/target/riscv/tcg, directory renamed /usr/src/debug/qemu/9.2.0/tests/bench -> /usr/src/debug/qemu/9.2.3/tests/bench, directory renamed /usr/src/debug/qemu/9.2.0/migration -> /usr/src/debug/qemu/9.2.3/migration, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/accel/tcg -> /usr/src/debug/qemu/9.2.3/accel/tcg, directory renamed /usr/src/debug/qemu/9.2.0/hw/block/dataplane -> /usr/src/debug/qemu/9.2.3/hw/block/dataplane, directory renamed /usr/src/debug/qemu/9.2.0/hw/xen -> /usr/src/debug/qemu/9.2.3/hw/xen, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/generic -> /usr/src/debug/qemu/9.2.3/linux-user/generic,
  directory renamed /usr/src/debug/qemu/9.2.0/include/net -> /usr/src/debug/qemu/9.2.3/include/net, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/southbridge -> /usr/src/debug/qemu/9.2.3/include/hw/southbridge, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-i386-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/hw/usb -> /usr/src/debug/qemu/9.2.3/hw/usb, directory renamed /usr/src/debug/qemu/9.2.0/hw/smbios -> /usr/src/debug/qemu/9.2.3/hw/smbios, directory renamed /usr/src/debug/qemu/9.2.0/libcommon.a.p -> /usr/src/debug/qemu/9.2.3/libcommon.a.p, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/x86_64 -> /usr/src/debug/qemu/9.2.3/linux-user/x86_64, directory renamed /usr/src/debug/qemu/9.2.0/crypto -> /usr/src/debug/qemu/9.2.3/crypto, directory renamed /usr/src/debug/qemu/9
 .2.0/include/qapi/qmp -> /usr/src/debug/qemu/9.2.3/include/qapi/qmp, directory renamed /usr/src/debug/qemu/9.2.0/include/block -> /usr/src/debug/qemu/9.2.3/include/block, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/hw/ssi -> /usr/src/debug/qemu/9.2.3/hw/ssi, directory renamed /usr/src/debug/qemu/9.2.0/dump -> /usr/src/debug/qemu/9.2.3/dump, directory renamed /usr/src/debug/qemu/9.2.0/system -> /usr/src/debug/qemu/9.2.3/system, directory renamed /usr/src/debug/qemu/9.2.0/accel -> /usr/src/debug/qemu/9.2.3/accel, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/adc -> /usr/src/debug/qemu/9.2.3/include/hw/adc, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/sh4 -> /usr/src/debug/qemu/9.2.3/include/hw/sh4, directory renamed /usr/src/debug/qemu/9.2.0/hw/sh4 -> /usr/src/debug/qemu/9.2.3/hw/sh4, directory renamed /usr/src/debug/qemu/9.2.0/disas
  -> /usr/src/debug/qemu/9.2.3/disas, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/timer -> /usr/src/debug/qemu/9.2.3/include/hw/timer, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/cxl -> /usr/src/debug/qemu/9.2.3/include/hw/cxl, directory renamed /usr/src/debug/qemu/9.2.0/hw/cxl -> /usr/src/debug/qemu/9.2.3/hw/cxl, directory renamed /usr/src/debug/qemu/9.2.0/tests/migration/ppc64 -> /usr/src/debug/qemu/9.2.3/tests/migration/ppc64, directory renamed /usr/src/debug/qemu/9.2.0/hw/i386 -> /usr/src/debug/qemu/9.2.3/hw/i386, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/i386 -> /usr/src/debug/qemu/9.2.3/include/hw/i386, directory renamed /usr/src/debug/qemu/9.2.0/hw/i2c -> /usr/src/debug/qemu/9.2.3/hw/i2c, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/crypto -> /usr/src/debug/qemu/9.2.3/include/crypto, directory renamed /usr/src/debug
 /qemu/9.2.0/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/target/mips -> /usr/src/debug/qemu/9.2.3/target/mips, directory renamed /usr/src/debug/qemu/9.2.0/libdecnumber/dpd -> /usr/src/debug/qemu/9.2.3/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/9.2.0/include/semihosting -> /usr/src/debug/qemu/9.2.3/include/semihosting, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/xen/interface -> /usr/src/debug/qemu/9.2.3/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/9.2.0/storage-daemon -> /usr/src/debug/qemu/9.2.3/storage-daemon, directory renamed /usr/src/debug/qemu/9.2.0/accel/qtest -> /usr/src/debug/qemu/9.2.3/accel/qtest, directory renamed /usr/src/debug/qemu/9.2.0/target/i386/tcg/sysemu -> /usr/src/debug/qemu/9.2.3/target/i386/tcg/sysemu, directory renamed /usr/src/debug/qemu/9.2.0/tests/qtest -> /usr/src/debug/qemu/9.2.3/tests/qtest, directory renamed /usr/src/debug/qemu/9.2
 .0/hw/adc -> /usr/src/debug/qemu/9.2.3/hw/adc, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/dma -> /usr/src/debug/qemu/9.2.3/include/hw/dma, directory renamed /usr/src/debug/qemu/9.2.0/ui -> /usr/src/debug/qemu/9.2.3/ui, directory renamed /usr/src/debug/qemu/9.2.0/hw/cpu -> /usr/src/debug/qemu/9.2.3/hw/cpu, directory renamed /usr/src/debug/qemu/9.2.0/include/qapi -> /usr/src/debug/qemu/9.2.3/include/qapi, directory renamed /usr/src/debug/qemu/9.2.0/subprojects/berkeley-softfloat-3/source/8086-SSE -> /usr/src/debug/qemu/9.2.3/subprojects/berkeley-softfloat-3/source/8086-SSE, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/input -> /usr/src/debug/qemu/9.2.3/include/hw/input, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/firmware -> /usr/src/debug/qemu/9.2.3/include/hw/firmware, directory renamed /usr/src/debug/qemu/9.2.0/hw/loongarch -> /usr/src/debug/qemu/9.2.3/hw/loongarch, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/cpu -> /usr/src/debug/qemu/9.
 2.3/include/hw/cpu, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-riscv32-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/hw/watchdog -> /usr/src/debug/qemu/9.2.3/hw/watchdog, directory renamed /usr/src/debug/qemu/9.2.0/util -> /usr/src/debug/qemu/9.2.3/util, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/i386 -> /usr/src/debug/qemu/9.2.3/linux-user/i386, directory renamed /usr/src/debug/qemu/9.2.0/subprojects/berkeley-softfloat-3/source -> /usr/src/debug/qemu/9.2.3/subprojects/berkeley-softfloat-3/source, directory renamed /usr/src/debug/qemu/9.2.0/hw/mem -> /usr/src/debug/qemu/9.2.3/hw/mem, directory renamed /usr/src/debug/qemu/9.2.0/hw/misc -> /usr/src/debug/qemu/9.2.3/hw/misc, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/9.
 2.3/libqemu-riscv64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/hw/audio -> /usr/src/debug/qemu/9.2.3/hw/audio, directory renamed /usr/src/debug/qemu/9.2.0/gdbstub -> /usr/src/debug/qemu/9.2.3/gdbstub, directory renamed /usr/src/debug/qemu/9.2.0/hw/mips -> /usr/src/debug/qemu/9.2.3/hw/mips, directory renamed /usr/src/debug/qemu/9.2.0/hw/char -> /usr/src/debug/qemu/9.2.3/hw/char, directory renamed /usr/src/debug/qemu/9.2.0/monitor -> /usr/src/debug/qemu/9.2.3/monitor, directory renamed /usr/src/debug/qemu/9.2.0/qobject -> /usr/src/debug/qemu/9.2.3/qobject, directory renamed /usr/src/debug/qemu/9.2.0/net -> /usr/src/debug/qemu/9.2.3/net, directory renamed /usr/src/debug/qemu/9.2.0/plugins -> /usr/src/debug/qemu/9.2.3/plugins, directory renamed /usr/src/debug/qemu/9.2.0/chardev -> /usr/src/debug/qemu/9.2.3/chardev, directory renamed /usr/src/debug/qemu/9.2.0/include/chardev -> /usr/src/debug/qemu/9.2.3/include/chardev, directory renamed /usr/src/debug/qemu/9.2.0/qapi -> /u
 sr/src/debug/qemu/9.2.3/qapi, directory renamed /usr/src/debug/qemu/9.2.0/common-user -> /usr/src/debug/qemu/9.2.3/common-user, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/isa -> /usr/src/debug/qemu/9.2.3/include/hw/isa, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/char -> /usr/src/debug/qemu/9.2.3/include/hw/char, directory renamed /usr/src/debug/qemu/9.2.0/hw/remote -> /usr/src/debug/qemu/9.2.3/hw/remote, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/mips -> /usr/src/debug/qemu/9.2.3/include/hw/mips, directory renamed /usr/src/debug/qemu/9.2.0/target/mips/sysemu -> /usr/src/debug/qemu/9.2.3/target/mips/sysemu, directory renamed /usr/src/debug/qemu/9.2.0/tests -> /usr/src/debug/qemu/9.2.3/tests, directory renamed /usr/src/debug/qemu/9.2.0/hw/virtio -> /usr/src/debug/qemu/9.2.3/hw/virtio, directory renamed /usr/src/debug/qemu/
 9.2.0/include/monitor -> /usr/src/debug/qemu/9.2.3/include/monitor, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/gpio -> /usr/src/debug/qemu/9.2.3/include/hw/gpio, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/ipmi -> /usr/src/debug/qemu/9.2.3/include/hw/ipmi, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/scsi -> /usr/src/debug/qemu/9.2.3/include/hw/scsi, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/acpi -> /usr/src/debug/qemu/9.2.3/include/hw/acpi, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.0/hw/intc -> /usr/src/debug/qemu/9.2.3/hw/intc, directory renamed /usr/src/debug/qemu/9.2.0/tests/migration/s390x -> /usr/src/debug/qemu/9.2.3/tests/migration/s390x, directory renamed /usr/src/de
 bug/qemu/9.2.0/hw/core -> /usr/src/debug/qemu/9.2.3/hw/core, directory renamed /usr/src/debug/qemu/9.2.0/hw/acpi -> /usr/src/debug/qemu/9.2.3/hw/acpi, directory renamed /usr/src/debug/qemu/9.2.0/hw/ipmi -> /usr/src/debug/qemu/9.2.3/hw/ipmi, directory renamed /usr/src/debug/qemu/9.2.0/hw/scsi -> /usr/src/debug/qemu/9.2.3/hw/scsi, directory renamed /usr/src/debug/qemu/9.2.0/hw/sd -> /usr/src/debug/qemu/9.2.3/hw/sd, directory renamed /usr/src/debug/qemu/9.2.0/hw/gpio -> /usr/src/debug/qemu/9.2.3/hw/gpio, directory renamed /usr/src/debug/qemu/9.2.0/hw/vfio -> /usr/src/debug/qemu/9.2.3/hw/vfio, directory renamed /usr/src/debug/qemu/9.2.0/include/gdbstub -> /usr/src/debug/qemu/9.2.3/include/gdbstub, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/intc -> /usr/src/debug/qemu/9.2.3/include/hw/intc, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/loongarch -> /usr/src/debug/qemu/9.2.3/include/hw/loongarch, directory renamed /usr/src/debug/qemu/9.2.0/hw/ide -> /usr/src/debug/qem
 u/9.2.3/hw/ide, directory renamed /usr/src/debug/qemu/9.2.0/net/can -> /usr/src/debug/qemu/9.2.3/net/can, directory renamed /usr/src/debug/qemu/9.2.0/target/ppc/translate -> /usr/src/debug/qemu/9.2.3/target/ppc/translate, directory renamed /usr/src/debug/qemu/9.2.0/subprojects/berkeley-testfloat-3/source -> /usr/src/debug/qemu/9.2.3/subprojects/berkeley-testfloat-3/source, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/watchdog -> /usr/src/debug/qemu/9.2.3/include/hw/watchdog, directory renamed /usr/src/debug/qemu/9.2.0/target/i386/kvm -> /usr/src/debug/qemu/9.2.3/target/i386/kvm, directory renamed /usr/src/debug/qemu/9.2.0/hw/hyperv -> /usr/src/debug/qemu/9.2.3/hw/hyperv, directory renamed /usr/src/debug/qemu/9.2.0/hw/nvram -> /usr/src/debug/qemu/9.2.3/hw/nvram, directory renamed /usr/src/debug/qemu/9.2.0/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/9.2.3/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/vfio -> /usr/src/debug
 /qemu/9.2.3/include/hw/vfio, directory renamed /usr/src/debug/qemu/9.2.0/include/hw/ssi -> /usr/src/debug/qemu/9.2.3/include/hw/ssi, directory renamed /usr/src/debug/qemu/9.2.0/subprojects/libvduse -> /usr/src/debug/qemu/9.2.3/subprojects/libvduse, directory renamed /usr/src/debug/qemu/9.2.0/target/mips/tcg/sysemu -> /usr/src/debug/qemu/9.2.3/target/mips/tcg/sysemu, directory renamed /usr/src/debug/qemu/9.2.0/linux-user/mips -> /usr/src/debug/qemu/9.2.3/linux-user/mips, directory renamed /usr/src/debug/qemu/9.2.0/linux-headers/asm-x86 -> /usr/src/debug/qemu/9.2.3/linux-headers/asm-x86, removed "/usr/src/debug/qemu/9.2.0/stubs/fw_cfg.c /usr/src/debug/qemu/9.2.0/stubs/replay-mode.c /usr/src/debug/qemu/9.2.0/stubs/migr-blocker.c /usr/src/debug/qemu/9.2.0/include/ui/qemu-pixman.h /usr/src/debug/qemu/9.2.0/stubs/target-monitor-defs.c /usr/src/debug/qemu/9.2.0/include/ui/kbd-state.h /usr/src/debug/qemu/9.2.0/stubs/change-state-handler.c /usr/src/debug/qemu/9.2.0/include/ui/console.h /usr/
 src/debug/qemu/9.2.0/include/ui/rect.h /usr/src/debug/qemu/9.2.0/stubs/blk-commit-all.c /usr/src/debug/qemu/9.2.0/include/ui/egl-context.h /usr/src/debug/qemu/9.2.0/include/ui/egl-helpers.h /usr/src/debug/qemu/9.2.0/include/ui/qemu-spice-module.h /usr/src/debug/qemu/9.2.0/include/ui/win32-kbd-hook.h /usr/src/debug/qemu/9.2.0/stubs/dump.c /usr/src/debug/qemu/9.2.0/stubs/monitor-core.c /usr/src/debug/qemu/9.2.0/stubs/vm-stop.c /usr/src/debug/qemu/9.2.0/include/ui/shader.h /usr/src/debug/qemu/9.2.0/stubs/is-daemonized.c /usr/src/debug/qemu/9.2.0/stubs/sysbus.c /usr/src/debug/qemu/9.2.0/stubs/vmstate.c /usr/src/debug/qemu/9.2.0/stubs/monitor-internal.c /usr/src/debug/qemu/9.2.0/include/ui/surface.h /usr/src/debug/qemu/9.2.0/include/ui/qemu-spice.h /usr/src/debug/qemu/9.2.0/stubs/fdset.c /usr/src/debug/qemu/9.2.0/stubs/replay-tools.c /usr/src/debug/qemu/9.2.0/stubs/win32-kbd-hook.c /usr/src/debug/qemu/9.2.0/stubs/blockdev-close-all-bdrv-states.c /usr/src/debug/qemu/9.2.0/include/ui/clipb
 oard.h /usr/src/debug/qemu/9.2.0/stubs/trace-control.c /usr/src/debug/qemu/9.2.0/stubs/iothread-lock.c /usr/src/debug/qemu/9.2.0/stubs/cpu-synchronize-state.c /usr/src/debug/qemu/9.2.0/stubs/qemu-timer-notify-cb.c /usr/src/debug/qemu/9.2.0/stubs/error-printf.c /usr/src/debug/qemu/9.2.0/stubs/hotplug-stubs.c /usr/src/debug/qemu/9.2.0/stubs/bdrv-next-monitor-owned.c /usr/src/debug/qemu/9.2.0/stubs/qmp-quit.c /usr/src/debug/qemu/9.2.0/stubs/qtest.c /usr/src/debug/qemu/9.2.0/stubs/xen-hw-stub.c /usr/src/debug/qemu/9.2.0/stubs/runstate-check.c /usr/src/debug/qemu/9.2.0/stubs/gdbstub.c /usr/src/debug/qemu/9.2.0/stubs/replay.c /usr/src/debug/qemu/9.2.0/include/ui/pixel_ops.h /usr/src/debug/qemu/9.2.0/stubs/iothread-lock-block.c /usr/src/debug/qemu/9.2.0/include/ui/sdl2.h /usr/src/debug/qemu/9.2.0/stubs/ram-block.c /usr/src/debug/qemu/9.2.0/stubs/graph-lock.c /usr/src/debug/qemu/9.2.0/stubs/cpus-virtual-clock.c /usr/src/debug/qemu/9.2.0/stubs/cpu-get-clock.c /usr/src/debug/qemu/9.2.0/includ
 e/ui/input.h /usr/src/debug/qemu/9.2.0/include/ui/dmabuf.h /usr/src/debug/qemu/9.2.0/stubs/qmp-command-available.c /usr/src/debug/qemu/9.2.0/stubs/target-get-monitor-def.c /usr/src/debug/qemu/9.2.0/stubs/icount.c", added "/usr/src/debug/qemu/9.2.3/stubs/target-monitor-defs.c /usr/src/debug/qemu/9.2.3/stubs/runstate-check.c /usr/src/debug/qemu/9.2.3/stubs/icount.c /usr/src/debug/qemu/9.2.3/include/ui/qemu-spice.h /usr/src/debug/qemu/9.2.3/stubs/replay-tools.c /usr/src/debug/qemu/9.2.3/stubs/vm-stop.c /usr/src/debug/qemu/9.2.3/stubs/change-state-handler.c /usr/src/debug/qemu/9.2.3/stubs/vmstate.c /usr/src/debug/qemu/9.2.3/include/ui/console.h /usr/src/debug/qemu/9.2.3/include/ui/input.h /usr/src/debug/qemu/9.2.3/stubs/graph-lock.c /usr/src/debug/qemu/9.2.3/stubs/sysbus.c /usr/src/debug/qemu/9.2.3/stubs/monitor-internal.c /usr/src/debug/qemu/9.2.3/stubs/is-daemonized.c /usr/src/debug/qemu/9.2.3/include/ui/clipboard.h /usr/src/debug/qemu/9.2.3/stubs/gdbstub.c /usr/src/debug/qemu/9.2.3/s
 tubs/trace-control.c /usr/src/debug/qemu/9.2.3/stubs/bdrv-next-monitor-owned.c /usr/src/debug/qemu/9.2.3/include/ui/sdl2.h /usr/src/debug/qemu/9.2.3/include/ui/rect.h /usr/src/debug/qemu/9.2.3/stubs/cpus-virtual-clock.c /usr/src/debug/qemu/9.2.3/stubs/dump.c /usr/src/debug/qemu/9.2.3/include/ui/qemu-pixman.h /usr/src/debug/qemu/9.2.3/include/ui/shader.h /usr/src/debug/qemu/9.2.3/stubs/blockdev-close-all-bdrv-states.c /usr/src/debug/qemu/9.2.3/stubs/cpu-get-clock.c /usr/src/debug/qemu/9.2.3/stubs/hotplug-stubs.c /usr/src/debug/qemu/9.2.3/include/ui/pixel_ops.h /usr/src/debug/qemu/9.2.3/stubs/replay.c /usr/src/debug/qemu/9.2.3/stubs/migr-blocker.c /usr/src/debug/qemu/9.2.3/stubs/xen-hw-stub.c /usr/src/debug/qemu/9.2.3/stubs/target-get-monitor-def.c /usr/src/debug/qemu/9.2.3/include/ui/dmabuf.h /usr/src/debug/qemu/9.2.3/include/ui/surface.h /usr/src/debug/qemu/9.2.3/stubs/ram-block.c /usr/src/debug/qemu/9.2.3/include/ui/egl-context.h /usr/src/debug/qemu/9.2.3/stubs/iothread-lock-block.
 c /usr/src/debug/qemu/9.2.3/stubs/qemu-timer-notify-cb.c /usr/src/debug/qemu/9.2.3/stubs/fw_cfg.c /usr/src/debug/qemu/9.2.3/stubs/fdset.c /usr/src/debug/qemu/9.2.3/stubs/replay-mode.c /usr/src/debug/qemu/9.2.3/stubs/qmp-command-available.c /usr/src/debug/qemu/9.2.3/stubs/monitor-core.c /usr/src/debug/qemu/9.2.3/stubs/cpu-synchronize-state.c /usr/src/debug/qemu/9.2.3/stubs/error-printf.c /usr/src/debug/qemu/9.2.3/include/ui/qemu-spice-module.h /usr/src/debug/qemu/9.2.3/stubs/qmp-quit.c /usr/src/debug/qemu/9.2.3/include/ui/kbd-state.h /usr/src/debug/qemu/9.2.3/stubs/qtest.c /usr/src/debug/qemu/9.2.3/stubs/blk-commit-all.c /usr/src/debug/qemu/9.2.3/include/ui/egl-helpers.h /usr/src/debug/qemu/9.2.3/stubs/iothread-lock.c"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31572072 to 31580360 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29200704 to 29208992 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26926248 to 26930440 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14831880 to 14831976 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13725896 to 13725992 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13864488 to 13864584 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15811624 to 15811720 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13721800 to 13721896 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15952704 to 15952800 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 17094408 to 17094504 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16000104 to 16000200 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16046664 to 16054952 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12199744 to 12199840 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26973128 to 26977320 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 2965952 to 2961856 (-0%)
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3463872 to 3467968 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PV changed from "9.2.0" to "9.2.3"
packages/core2-64-poky-linux/qemu/qemu: PKGV changed from 9.2.0 [default] to 9.2.3 [default]
packages/core2-64-poky-linux/qemu/qemu: PV changed from "9.2.0" to "9.2.3"
Changes to packages/core2-64-poky-linux/qemu (sysroot):
  /usr/share/qemu/firmware/60-edk2-riscv64.json was added
Changes to packages/x86_64-linux/qemu-system-native (sysroot):
  /usr/share/qemu/firmware/60-edk2-riscv64.json was added

--===============1459467393789278176==--

