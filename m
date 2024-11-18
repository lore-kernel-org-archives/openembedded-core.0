Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A649D591D4
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4782.1731964602116720663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XM4nj9oH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FB4ysi0o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193412280d5-a646e531-4ef8-49ae-8e82-3995101873e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1ZqgaHvU1BGZzJNKPu3nTiGgvC5GUWAv5wQ6Ff6XoO0=;
	b=XM4nj9oHBu0CMuJ8ol2eJ6NujMVTvMHEm3KyoJzqvt1cBhMHH4fXtGQQMr7WqzBb
	bEDpqko2rgCE2lrMS9yNCH6BRNxevhTFZJPO5XliAGkfkMIcjgBoCORXsA2tyozHRPM
	l+ATnkZvLuGq4wB356IDgDoPd33xrl0HPWi38wgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1ZqgaHvU1BGZzJNKPu3nTiGgvC5GUWAv5wQ6Ff6XoO0=;
	b=FB4ysi0oEru1atolzy+5fGHgcoG4tpj1wqfuaM7uTdg8XSXCJcYnJsyDWWsRvfNN
	kvxBUDVQbgNO7yosePqrPDqg9F1Jpwk/OamIfYFkw6Ip0y066H2tLq2Qu903FgZN/Rq
	luNajTKMwMvUe2tXmj6hqgqqUjold/OrXiXyoKzg=
Content-Type: multipart/mixed; boundary="===============4797324426528448769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu,qemu-system-native,qemu-native: upgrading to
 9.1.1,9.1.1,9.1.1 SUCCEEDED
Message-ID: <01010193412280d5-a646e531-4ef8-49ae-8e82-3995101873e4-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207239

--===============4797324426528448769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu,qemu-system-native,qemu-native* to *9.1.1,9.1.1,9.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-qemu-system-native-qemu-native-upgrade-9.1.0-9..patch
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
From 8163a7b9afb163f2a31cc17a9d40fdd5a3458dff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Nov 2024 17:13:28 +0000
Subject: [PATCH] qemu,qemu-system-native,qemu-native: upgrade 9.1.0 ->
 9.1.1,9.1.0 -> 9.1.1,9.1.0 -> 9.1.1

---
 ...u-native_9.1.0.bb => qemu-native_9.1.1.bb} |  1 +
 ...e_9.1.0.bb => qemu-system-native_9.1.1.bb} |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 ...n-environment-space-to-boot-loader-q.patch | 11 ++--
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 12 ++--
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  9 +--
 ...mu-Do-not-include-file-if-not-exists.patch | 11 ++--
 ...er-space-mmap-tweaks-to-address-musl.patch | 12 ++--
 .../qemu/0006-qemu-Determinism-fixes.patch    |  9 +--
 ...d-use-relative-path-to-refer-to-file.patch | 16 +++---
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  9 +--
 ...ce-use-of-lfs64-related-functions-an.patch | 56 +++++++++----------
 ...gure-lookup-meson-exutable-from-PATH.patch | 11 ++--
 ...and-the-python-venv-aren-t-used-for-.patch | 12 ++--
 .../qemu/qemu/fix-strerrorname_np.patch       | 14 ++++-
 .../qemu/{qemu_9.1.0.bb => qemu_9.1.1.bb}     |  0
 16 files changed, 82 insertions(+), 104 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.1.0.bb => qemu-native_9.1.1.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.1.0.bb => qemu-system-native_9.1.1.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu_9.1.0.bb => qemu_9.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_9.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
index a77953529b..26fa84c180 100644
--- a/meta/recipes-devtools/qemu/qemu-native_9.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_9.1.1.bb
@@ -7,3 +7,4 @@ require qemu-native.inc
 EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
 
 PACKAGECONFIG ??= "pie"
+
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
index 5d2fbcbc02..e7bbe5d291 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_9.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_9.1.1.bb
@@ -29,3 +29,4 @@ do_install:append() {
     install -d ${D}${libdir}/qemu-python/qmp/
     install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
 }
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 02cd7c8dc8..d6d1c84865 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "816b7022a8ba7c2ac30e2e0cf973e826f6bcc8505339603212c5ede8e94d7834"
+SRC_URI[sha256sum] = "7dc0f9da5491ff449500f3310063a36b619f236ee45706fd0846eb37d4bba889"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 2333cc8432..5e21855c50 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00 2001
+From 930b75aeade33690cec4bf748a954401da2be782 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
-Subject: [PATCH 01/11] qemu: Add addition environment space to boot loader
+Subject: [PATCH] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index af74008c82..a588b9ad4e 100644
+index 664a2ae0a..5124b158a 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -63,7 +63,7 @@
+@@ -64,7 +64,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
@@ -30,6 +30,3 @@ index af74008c82..a588b9ad4e 100644
  
  /* Hardware addresses */
  #define FLASH_ADDRESS       0x1e000000ULL
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
index edb3e304c9..1233a07ff9 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -1,7 +1,7 @@
-From ddb27569449c941014fa44b1b542de0831d993a0 Mon Sep 17 00:00:00 2001
+From 7030c0cd98de9e6c42e69be314204727ae335912 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Oct 2024 22:40:32 -0700
-Subject: [PATCH v2] sched_attr: Do not define for glibc >= 2.41
+Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
 
 glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
 and struct sched_attr. Therefore, it needs to be checked for here as well before
@@ -18,16 +18,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Laurent Vivier <laurent@vivier.eu>
 Cc: Paolo Bonzini <pbonzini@redhat.com>
 ---
-v2: Use SCHED_ATTR_SIZE_VER0 instead of glibc version check
-
  linux-user/syscall.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 1354e75694..caecbb765d 100644
+index 27aa59594..b2c45b4c4 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -359,7 +359,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
+@@ -361,7 +361,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
  #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
  _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
            unsigned long *, user_mask_ptr);
@@ -37,7 +35,7 @@ index 1354e75694..caecbb765d 100644
  struct sched_attr {
      uint32_t size;
      uint32_t sched_policy;
-@@ -372,6 +373,7 @@ struct sched_attr {
+@@ -374,6 +375,7 @@ struct sched_attr {
      uint32_t sched_util_min;
      uint32_t sched_util_max;
  };
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 5f8fe4faa3..bcb0d0c0da 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00 2001
+From 1ba58dbd2dce4e6ccaf3be3ad5c9ecc22565313f Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index d9cab428c4..2b4f2b17ca 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00 2001
+From 081c1e4ee93b22ec00136db45c36650427213c09 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
-Subject: [PATCH 04/11] qemu: Do not include file if not exists
+Subject: [PATCH] qemu: Do not include file if not exists
 
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 3df2b94d9a..18f09f1f07 100644
+index 9d5415674..22df46859 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -116,7 +116,9 @@
+@@ -117,7 +117,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
@@ -29,6 +29,3 @@ index 3df2b94d9a..18f09f1f07 100644
  #include <linux/rtc.h>
  #include <sound/asound.h>
  #ifdef HAVE_BTRFS_H
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 3c7f5776ff..26ddf5e597 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,8 +1,7 @@
-From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00 2001
+From 76efeccfd73a76834ac1c75d3c94de1899085714 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
-Subject: [PATCH 05/11] qemu: Add some user space mmap tweaks to address musl
- 32 bit
+Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
 
 When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
 infinite loop of mremap calls of ever decreasing/increasing addresses.
@@ -23,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index be3b9a68eb..481286f01d 100644
+index e4bf5d5f3..04d920c11 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1060,12 +1060,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1105,12 +1105,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
@@ -46,6 +45,3 @@ index be3b9a68eb..481286f01d 100644
          return -1;
      }
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index f07054f19a..059257bce0 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00 2001
+From 09e8fac984cea71867c0b7a05b0dd8f7025bd25a Mon Sep 17 00:00:00 2001
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
index 5471b77e18..cd919048f4 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00 2001
+From 1a574aa22c9b3700af7e5c0901abef59c72bb874 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
-Subject: [PATCH 07/11] tests/meson.build: use relative path to refer to files
+Subject: [PATCH] tests/meson.build: use relative path to refer to files
 
 Fix error like:
 Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
@@ -13,13 +13,13 @@ Upstream-Status: Submitted [send to qemu-devel]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- tests/unit/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ tests/unit/meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: qemu-9.1.0/tests/unit/meson.build
-===================================================================
---- qemu-9.1.0.orig/tests/unit/meson.build
-+++ qemu-9.1.0/tests/unit/meson.build
+diff --git a/tests/unit/meson.build b/tests/unit/meson.build
+index 490ab8182..d19ee5606 100644
+--- a/tests/unit/meson.build
++++ b/tests/unit/meson.build
 @@ -128,17 +128,17 @@ endif
  
  if have_system
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 2e28590e11..7bbd96df84 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00 2001
+From 06b5b26a0a1f7687576d90066e492cf2665fff1d Mon Sep 17 00:00:00 2001
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
index 7577249d39..f9eddb8178 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,8 +1,7 @@
-From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00 2001
+From a6b57d63bcdc3f3cae9827d2e1e3492d2293695f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH 09/11] linux-user: Replace use of lfs64 related functions and
- macros
+Subject: [PATCH] linux-user: Replace use of lfs64 related functions and macros
 
 Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
 anf macros behave same as their 64 suffixed counterparts. This also
@@ -17,10 +16,10 @@ Cc: Laurent Vivier <laurent@vivier.eu>
  1 file changed, 39 insertions(+), 114 deletions(-)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 18f09f1f07..1b7c50a2a7 100644
+index 22df46859..27aa59594 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
+@@ -762,8 +762,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
   */
  #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
  /* Similarly for fcntl. Note that callers must always:
@@ -31,7 +30,7 @@ index 18f09f1f07..1b7c50a2a7 100644
   * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
   */
  #ifdef __NR_fcntl64
-@@ -6739,13 +6739,13 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6724,13 +6724,13 @@ static int target_to_host_fcntl_cmd(int cmd)
          ret = cmd;
          break;
      case TARGET_F_GETLK:
@@ -48,7 +47,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          break;
      case TARGET_F_GETOWN:
          ret = F_GETOWN;
-@@ -6759,17 +6759,6 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6744,17 +6744,6 @@ static int target_to_host_fcntl_cmd(int cmd)
      case TARGET_F_SETSIG:
          ret = F_SETSIG;
          break;
@@ -66,7 +65,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      case TARGET_F_SETLEASE:
          ret = F_SETLEASE;
          break;
-@@ -6821,8 +6810,8 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6806,8 +6795,8 @@ static int target_to_host_fcntl_cmd(int cmd)
       * them to 5, 6 and 7 before making the syscall(). Since we make the
       * syscall directly, adjust to what is supported by the kernel.
       */
@@ -77,7 +76,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      }
  #endif
  
-@@ -6855,55 +6844,11 @@ static int host_to_target_flock(int type)
+@@ -6840,55 +6829,11 @@ static int host_to_target_flock(int type)
      return type;
  }
  
@@ -136,7 +135,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      abi_short l_type;
      abi_short l_whence;
      abi_llong l_start;
-@@ -6911,10 +6856,10 @@ struct target_oabi_flock64 {
+@@ -6896,10 +6841,10 @@ struct target_oabi_flock64 {
      abi_int   l_pid;
  } QEMU_PACKED;
  
@@ -149,7 +148,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6935,10 +6880,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
+@@ -6920,10 +6865,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -163,7 +162,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -6956,10 +6901,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+@@ -6941,10 +6886,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
  }
  #endif
  
@@ -176,7 +175,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6980,10 +6925,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
+@@ -6965,10 +6910,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -190,7 +189,7 @@ index 18f09f1f07..1b7c50a2a7 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7002,7 +6947,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+@@ -6987,7 +6932,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
  
  static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  {
@@ -199,7 +198,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  #ifdef F_GETOWN_EX
      struct f_owner_ex fox;
      struct target_f_owner_ex *target_fox;
-@@ -7015,6 +6960,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7000,6 +6945,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  
      switch(cmd) {
      case TARGET_F_GETLK:
@@ -207,7 +206,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          ret = copy_from_user_flock(&fl64, arg);
          if (ret) {
              return ret;
-@@ -7024,32 +6970,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7009,32 +6955,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
              ret = copy_to_user_flock(arg, &fl64);
          }
          break;
@@ -241,7 +240,7 @@ index 18f09f1f07..1b7c50a2a7 100644
          if (ret) {
              return ret;
          }
-@@ -7278,7 +7203,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
+@@ -7269,7 +7194,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +249,7 @@ index 18f09f1f07..1b7c50a2a7 100644
  }
  #endif
  
-@@ -7292,7 +7217,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+@@ -7283,7 +7208,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
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
index 98ce85a8cf..f20851bff0 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,7 +1,7 @@
-From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00 2001
+From 2e9642b9001df523628ab2cacbbbf2b208c49437 Mon Sep 17 00:00:00 2001
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
+index d08b71f14..af0bd2c66 100755
 --- a/configure
 +++ b/configure
-@@ -956,12 +956,7 @@ fi
+@@ -958,12 +958,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
@@ -26,6 +26,3 @@ index 3cd736b139..482a1f8ef3 100755
  
  # Conditionally ensure Sphinx is installed.
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index c7bb9b1b47..4adb2e5fa5 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,8 +1,7 @@
-From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00 2001
+From 68a13afd6606c2aaf1f0debd325d7314aaa61411 Mon Sep 17 00:00:00 2001
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
+index af0bd2c66..88dab6a95 100755
 --- a/configure
 +++ b/configure
-@@ -938,14 +938,14 @@ python="$(command -v "$python")"
+@@ -944,14 +944,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
@@ -50,6 +49,3 @@ index 482a1f8ef3..0da4bf3e4d 100755
  
  # Finish preparing the virtual environment using vendored .whl files
  
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 5098e8a4e5..b57c481183 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,7 @@
-target/riscv/kvm: do not use non-portable strerrorname_np()
+From 9de5de85fa917af58e7bc9cdd88f8f7ef8da2ca9 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Sep 2024 16:19:37 -0700
+Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
 
 strerrorname_np is non-portable and breaks building with musl libc.
 
@@ -7,15 +10,20 @@ Use strerror(errno) instead, like we do other places.
 Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stable/2023-12/msg00069.html]
 
 Cc: qemu-stable@nongnu.org
-Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error 
+Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error
 msg)
 Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
 Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ target/riscv/kvm/kvm-cpu.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
+diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
+index f6e3156b8..fad9eb21c 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1731,8 +1731,7 @@ static bool kvm_cpu_realize(CPUState *cs
+@@ -1859,8 +1859,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_9.1.0.bb b/meta/recipes-devtools/qemu/qemu_9.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_9.1.1.bb
-- 
2.44.1


--===============4797324426528448769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-qemu-system-native-qemu-native-upgrade-9.1.0-9..patch"

RnJvbSA4MTYzYTdiOWFmYjE2M2YyYTMxY2MxN2E5ZDQwZmRkNWEzNDU4ZGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTm92IDIwMjQgMTc6MTM6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11LHFlbXUtc3lzdGVtLW5hdGl2ZSxxZW11LW5hdGl2ZTogdXBncmFkZSA5LjEuMCAtPgogOS4x
LjEsOS4xLjAgLT4gOS4xLjEsOS4xLjAgLT4gOS4xLjEKCi0tLQogLi4udS1uYXRpdmVfOS4xLjAu
YmIgPT4gcWVtdS1uYXRpdmVfOS4xLjEuYmJ9IHwgIDEgKwogLi4uZV85LjEuMC5iYiA9PiBxZW11
LXN5c3RlbS1uYXRpdmVfOS4xLjEuYmJ9IHwgIDEgKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMgICAgICAgICAgIHwgIDIgKy0KIC4uLm4tZW52aXJvbm1lbnQtc3BhY2UtdG8t
Ym9vdC1sb2FkZXItcS5wYXRjaCB8IDExICsrLS0KIC4uLmVkX2F0dHItRG8tbm90LWRlZmluZS1m
b3ItZ2xpYmMtMi40MS5wYXRjaCB8IDEyICsrLS0KIC4uLi8wMDAyLWFwaWMtZml4dXAtZmFsbHRo
cm91Z2gtdG8tUElDLnBhdGNoICB8ICA5ICstLQogLi4ubXUtRG8tbm90LWluY2x1ZGUtZmlsZS1p
Zi1ub3QtZXhpc3RzLnBhdGNoIHwgMTEgKystLQogLi4uZXItc3BhY2UtbW1hcC10d2Vha3MtdG8t
YWRkcmVzcy1tdXNsLnBhdGNoIHwgMTIgKystLQogLi4uL3FlbXUvMDAwNi1xZW11LURldGVybWlu
aXNtLWZpeGVzLnBhdGNoICAgIHwgIDkgKy0tCiAuLi5kLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJl
ZmVyLXRvLWZpbGUucGF0Y2ggfCAxNiArKystLS0KIC4uLmFuZC1NQVBfU0hBUkVEX1ZBTElEQVRF
LW9uLW5lZWRlZC1saS5wYXRjaCB8ICA5ICstLQogLi4uY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQt
ZnVuY3Rpb25zLWFuLnBhdGNoIHwgNTYgKysrKysrKysrLS0tLS0tLS0tLQogLi4uZ3VyZS1sb29r
dXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIHwgMTEgKystLQogLi4uYW5kLXRoZS1w
eXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoIHwgMTIgKystLQogLi4uL3FlbXUvcWVt
dS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoICAgICAgIHwgMTQgKysrKy0KIC4uLi9xZW11L3tx
ZW11XzkuMS4wLmJiID0+IHFlbXVfOS4xLjEuYmJ9ICAgICB8ICAwCiAxNiBmaWxlcyBjaGFuZ2Vk
LCA4MiBpbnNlcnRpb25zKCspLCAxMDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUve3FlbXUtbmF0aXZlXzkuMS4wLmJiID0+IHFlbXUtbmF0aXZlXzkuMS4x
LmJifSAoOTklKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LXN5c3Rl
bS1uYXRpdmVfOS4xLjAuYmIgPT4gcWVtdS1zeXN0ZW0tbmF0aXZlXzkuMS4xLmJifSAoOTklKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11XzkuMS4wLmJiID0+IHFlbXVf
OS4xLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUtbmF0aXZlXzkuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1u
YXRpdmVfOS4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfOS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzkuMS4xLmJiCmluZGV4IGE3Nzk1MzUyOWIu
LjI2ZmE4NGMxODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUt
bmF0aXZlXzkuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0
aXZlXzkuMS4xLmJiCkBAIC03LDMgKzcsNCBAQCByZXF1aXJlIHFlbXUtbmF0aXZlLmluYwogRVhU
UkFfT0VDT05GOmFwcGVuZCA9ICIgLS10YXJnZXQtbGlzdD0ke0BnZXRfcWVtdV91c2VybW9kZV90
YXJnZXRfbGlzdChkKX0gLS1kaXNhYmxlLXRvb2xzIC0tZGlzYWJsZS1pbnN0YWxsLWJsb2JzIC0t
ZGlzYWJsZS1ndWVzdC1hZ2VudCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gInBpZSIKKwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzkuMS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzkuMS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV85LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzkuMS4xLmJiCmluZGV4IDVkMmZiY2Jj
MDIuLmU3YmJlNWQyOTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUtc3lzdGVtLW5hdGl2ZV85LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LXN5c3RlbS1uYXRpdmVfOS4xLjEuYmIKQEAgLTI5LDMgKzI5LDQgQEAgZG9faW5zdGFs
bDphcHBlbmQoKSB7CiAgICAgaW5zdGFsbCAtZCAke0R9JHtsaWJkaXJ9L3FlbXUtcHl0aG9uL3Ft
cC8KICAgICBpbnN0YWxsIC1EICR7U30vcHl0aG9uL3FlbXUvcW1wLyogJHtEfSR7bGliZGlyfS9x
ZW11LXB5dGhvbi9xbXAvCiB9CisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKaW5kZXgg
MDJjZDdjOGRjOC4uZDZkMWM4NDg2NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMK
QEAgLTM4LDcgKzM4LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7
QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJxZW11LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiODE2YjcwMjJhOGJhN2MyYWMzMGUyZTBjZjk3M2U4MjZmNmJjYzg1MDUzMzk2MDMyMTJjNWVk
ZThlOTRkNzgzNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZGMwZjlkYTU0OTFmZjQ0OTUwMGYz
MzEwMDYzYTM2YjYxOWYyMzZlZTQ1NzA2ZmQwODQ2ZWIzN2Q0YmJhODg5IgogCiBDVkVfU1RBVFVT
W0NWRS0yMDA3LTA5OThdID0gIm5vdC1hcHBsaWNhYmxlLWNvbmZpZzogVGhlIFZOQyBzZXJ2ZXIg
Y2FuIGV4cG9zZSBob3N0IGZpbGVzIHVkZXIgc29tZSBjaXJjdW1zdGFuY2VzLiBXZSBkb24ndCBl
bmFibGUgaXQgYnkgZGVmYXVsdC4iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1i
b290LWxvYWRlci1xLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAx
LXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0
Y2gKaW5kZXggMjMzM2NjODQzMi4uNWUyMTg1NWM1MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNw
YWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3Qt
bG9hZGVyLXEucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGU5YmFmMDdhNjY3YTFjMDRiNTdl
MTQ3NzZjYzRmYTM4NzQ0OGM5MDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkzMGI3
NWFlYWRlMzM2OTBjZWM0YmY3NDhhOTU0NDAxZGEyYmU3ODIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBKYXNvbiBXZXNzZWwgPGphc29uLndlc3NlbEB3aW5kcml2ZXIuY29tPgogRGF0
ZTogRnJpLCAyOCBNYXIgMjAxNCAxNzo0Mjo0MyArMDgwMAotU3ViamVjdDogW1BBVENIIDAxLzEx
XSBxZW11OiBBZGQgYWRkaXRpb24gZW52aXJvbm1lbnQgc3BhY2UgdG8gYm9vdCBsb2FkZXIKK1N1
YmplY3Q6IFtQQVRDSF0gcWVtdTogQWRkIGFkZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJv
b3QgbG9hZGVyCiAgcWVtdS1zeXN0ZW0tbWlwcwogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgLSBPRSB1c2VzIGRlZXAgcGF0aHMKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9ody9taXBzL21h
bHRhLmMgYi9ody9taXBzL21hbHRhLmMKLWluZGV4IGFmNzQwMDhjODIuLmE1ODhiOWFkNGUgMTAw
NjQ0CitpbmRleCA2NjRhMmFlMGEuLjUxMjRiMTU4YSAxMDA2NDQKIC0tLSBhL2h3L21pcHMvbWFs
dGEuYwogKysrIGIvaHcvbWlwcy9tYWx0YS5jCi1AQCAtNjMsNyArNjMsNyBAQAorQEAgLTY0LDcg
KzY0LDcgQEAKICAjZGVmaW5lIEVOVlBfUEFERFIgICAgICAgICAgMHgyMDAwCiAgI2RlZmluZSBF
TlZQX1ZBRERSICAgICAgICAgIGNwdV9taXBzX3BoeXNfdG9fa3NlZzAoTlVMTCwgRU5WUF9QQURE
UikKICAjZGVmaW5lIEVOVlBfTkJfRU5UUklFUyAgICAgMTYKQEAgLTMwLDYgKzMwLDMgQEAgaW5k
ZXggYWY3NDAwOGM4Mi4uYTU4OGI5YWQ0ZSAxMDA2NDQKICAKICAvKiBIYXJkd2FyZSBhZGRyZXNz
ZXMgKi8KICAjZGVmaW5lIEZMQVNIX0FERFJFU1MgICAgICAgMHgxZTAwMDAwMFVMTAotLS0gCi0y
LjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAx
LXNjaGVkX2F0dHItRG8tbm90LWRlZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1zY2hlZF9hdHRyLURvLW5vdC1kZWZpbmUtZm9y
LWdsaWJjLTIuNDEucGF0Y2gKaW5kZXggZWRiM2UzMDRjOS4uMTIzM2EwN2ZmOSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNjaGVkX2F0dHItRG8tbm90
LWRlZmluZS1mb3ItZ2xpYmMtMi40MS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMDEtc2NoZWRfYXR0ci1Eby1ub3QtZGVmaW5lLWZvci1nbGliYy0yLjQxLnBh
dGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBkZGIyNzU2OTQ0OWM5NDEwMTRmYTQ0YjFiNTQyZGUw
ODMxZDk5M2EwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MDMwYzBjZDk4ZGU5ZTZj
NDJlNjliZTMxNDIwNDcyN2FlMzM1OTEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTAgT2N0IDIwMjQgMjI6
NDA6MzIgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCB2Ml0gc2NoZWRfYXR0cjogRG8gbm90IGRlZmlu
ZSBmb3IgZ2xpYmMgPj0gMi40MQorU3ViamVjdDogW1BBVENIXSBzY2hlZF9hdHRyOiBEbyBub3Qg
ZGVmaW5lIGZvciBnbGliYyA+PSAyLjQxCiAKIGdsaWJjIDIuNDErIGhhcyBhZGRlZCBbMV0gZGVm
aW5pdGlvbnMgZm9yIHNjaGVkX3NldGF0dHIgYW5kIHNjaGVkX2dldGF0dHIgZnVuY3Rpb25zCiBh
bmQgc3RydWN0IHNjaGVkX2F0dHIuIFRoZXJlZm9yZSwgaXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBm
b3IgaGVyZSBhcyB3ZWxsIGJlZm9yZQpAQCAtMTgsMTYgKzE4LDE0IEBAIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBDYzogTGF1cmVudCBWaXZpZXIgPGxhdXJl
bnRAdml2aWVyLmV1PgogQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CiAt
LS0KLXYyOiBVc2UgU0NIRURfQVRUUl9TSVpFX1ZFUjAgaW5zdGVhZCBvZiBnbGliYyB2ZXJzaW9u
IGNoZWNrCi0KICBsaW51eC11c2VyL3N5c2NhbGwuYyB8IDQgKysrLQogIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpbnV4LXVz
ZXIvc3lzY2FsbC5jIGIvbGludXgtdXNlci9zeXNjYWxsLmMKLWluZGV4IDEzNTRlNzU2OTQuLmNh
ZWNiYjc2NWQgMTAwNjQ0CitpbmRleCAyN2FhNTk1OTQuLmIyYzQ1YjRjNCAxMDA2NDQKIC0tLSBh
L2xpbnV4LXVzZXIvc3lzY2FsbC5jCiArKysgYi9saW51eC11c2VyL3N5c2NhbGwuYwotQEAgLTM1
OSw3ICszNTksOCBAQCBfc3lzY2FsbDMoaW50LCBzeXNfc2NoZWRfZ2V0YWZmaW5pdHksIHBpZF90
LCBwaWQsIHVuc2lnbmVkIGludCwgbGVuLAorQEAgLTM2MSw3ICszNjEsOCBAQCBfc3lzY2FsbDMo
aW50LCBzeXNfc2NoZWRfZ2V0YWZmaW5pdHksIHBpZF90LCBwaWQsIHVuc2lnbmVkIGludCwgbGVu
LAogICNkZWZpbmUgX19OUl9zeXNfc2NoZWRfc2V0YWZmaW5pdHkgX19OUl9zY2hlZF9zZXRhZmZp
bml0eQogIF9zeXNjYWxsMyhpbnQsIHN5c19zY2hlZF9zZXRhZmZpbml0eSwgcGlkX3QsIHBpZCwg
dW5zaWduZWQgaW50LCBsZW4sCiAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKiwgdXNlcl9tYXNr
X3B0cik7CkBAIC0zNyw3ICszNSw3IEBAIGluZGV4IDEzNTRlNzU2OTQuLmNhZWNiYjc2NWQgMTAw
NjQ0CiAgc3RydWN0IHNjaGVkX2F0dHIgewogICAgICB1aW50MzJfdCBzaXplOwogICAgICB1aW50
MzJfdCBzY2hlZF9wb2xpY3k7Ci1AQCAtMzcyLDYgKzM3Myw3IEBAIHN0cnVjdCBzY2hlZF9hdHRy
IHsKK0BAIC0zNzQsNiArMzc1LDcgQEAgc3RydWN0IHNjaGVkX2F0dHIgewogICAgICB1aW50MzJf
dCBzY2hlZF91dGlsX21pbjsKICAgICAgdWludDMyX3Qgc2NoZWRfdXRpbF9tYXg7CiAgfTsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVw
LWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaAppbmRleCA1ZjhmZTRm
YWEzLi5iY2IwZDBjMGRhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8t
UElDLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSAyM2JmNTM0ZTQ2M2JmNGMxYmEyZTEzNTZl
YWYxN2JlMGIyM2IxOTJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYmE1OGRiZDJk
Y2U0ZTZjY2FmM2JlM2FkNWM5ZWNjMjI1NjUzMTNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWFyayBBc3NlbHN0aW5lIDxtYXJrLmFzc2Vsc3RpbmVAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFR1ZSwgMjYgRmViIDIwMTMgMTE6NDM6MjggLTA1MDAKLVN1YmplY3Q6IFtQQVRDSCAwMi8x
MV0gYXBpYzogZml4dXAgZmFsbHRocm91Z2ggdG8gUElDCitTdWJqZWN0OiBbUEFUQ0hdIGFwaWM6
IGZpeHVwIGZhbGx0aHJvdWdoIHRvIFBJQwogCiBDb21taXQgMGUyMWUxMmJiMzExYzRjMTA5NWQw
MjY5ZGMyZWY4MTE5NmNjYjYwYSBbRG9uJ3Qgcm91dGUgUElDCiBpbnRlcnJ1cHRzIHRocm91Z2gg
dGhlIGxvY2FsIEFQSUMgaWYgdGhlIGxvY2FsIEFQSUMgY29uZmlnIHNheXMgc28uXQpAQCAtMjks
NyArMjksNyBAQCBTaWduZWQtb2ZmLWJ5OiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvaHcvaW50Yy9hcGljLmMgYi9ody9pbnRjL2FwaWMuYwotaW5kZXggNDE4NmM1N2IzNC4u
NDNjZDgwNWE5NiAxMDA2NDQKK2luZGV4IDQxODZjNTdiMy4uNDNjZDgwNWE5IDEwMDY0NAogLS0t
IGEvaHcvaW50Yy9hcGljLmMKICsrKyBiL2h3L2ludGMvYXBpYy5jCiBAQCAtNzU5LDcgKzc1OSw3
IEBAIGludCBhcGljX2FjY2VwdF9waWNfaW50cihEZXZpY2VTdGF0ZSAqZGV2KQpAQCAtNDEsNiAr
NDEsMyBAQCBpbmRleCA0MTg2YzU3YjM0Li40M2NkODA1YTk2IDEwMDY0NAogICAgICAgICAgcmV0
dXJuIC0xOwogIAogICAgICBsdnQwID0gcy0+bHZ0W0FQSUNfTFZUX0xJTlQwXTsKLS0tIAotMi40
NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1x
ZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90
LWV4aXN0cy5wYXRjaAppbmRleCBkOWNhYjQyOGM0Li4yYjRmMmIxN2NhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1m
aWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBA
IC0xLDcgKzEsNyBAQAotRnJvbSA1MjIzZDQ2YThkNTMwMjM5NmY5ZmM3Y2M1ZDgzMDc2OWU4NzI0
MmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwODFjMWU0ZWU5M2IyMmVjMDAxMzZk
YjQ1YzM2NjUwNDI3MjEzYzA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3Np
eSBPYml0b3Rza3l5IDxvb2JpdG90c0BjaXNjby5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIw
IDIxOjIxOjM1ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMDQvMTFdIHFlbXU6IERvIG5vdCBpbmNs
dWRlIGZpbGUgaWYgbm90IGV4aXN0cworU3ViamVjdDogW1BBVENIXSBxZW11OiBEbyBub3QgaW5j
bHVkZSBmaWxlIGlmIG5vdCBleGlzdHMKIAogU2NyaXB0IGNvbmZpZ3VyZSBjaGVja3MgZm9yIGlm
X2FsZy5oIGFuZCBjaGVjayBmYWlsZWQgYnV0CiBpZl9hbGcuaCBzdGlsbCBpbmNsdWRlZC4KQEAg
LTE2LDEwICsxNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2FqYWxA
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi1pbmRl
eCAzZGYyYjk0ZDlhLi4xOGYwOWYxZjA3IDEwMDY0NAoraW5kZXggOWQ1NDE1Njc0Li4yMmRmNDY4
NTkgMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9z
eXNjYWxsLmMKLUBAIC0xMTYsNyArMTE2LDkgQEAKK0BAIC0xMTcsNyArMTE3LDkgQEAKICAjaW5j
bHVkZSA8bGludXgvYmxrcGcuaD4KICAjaW5jbHVkZSA8bmV0cGFja2V0L3BhY2tldC5oPgogICNp
bmNsdWRlIDxsaW51eC9uZXRsaW5rLmg+CkBAIC0yOSw2ICsyOSwzIEBAIGluZGV4IDNkZjJiOTRk
OWEuLjE4ZjA5ZjFmMDcgMTAwNjQ0CiAgI2luY2x1ZGUgPGxpbnV4L3J0Yy5oPgogICNpbmNsdWRl
IDxzb3VuZC9hc291bmQuaD4KICAjaWZkZWYgSEFWRV9CVFJGU19ICi0tLSAKLTIuNDQuMAotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQt
c29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2Ut
bW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCmluZGV4IDNjN2Y1Nzc2ZmYuLjI2ZGRm
NWU1OTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1x
ZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21l
LXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCkBAIC0xLDggKzEs
NyBAQAotRnJvbSAxYzI5NTA2OTg1N2I5ODUwZjE1ZjJjZDZiMzNiMTMzZWE2NDFhNDU0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NmVmZWNjZmQ3M2E3NjgzNGFjMWM3NWQzYzk0ZGUx
ODk5MDg1NzE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDggSmFuIDIw
MjEgMTc6Mjc6MDYgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAwNS8xMV0gcWVtdTogQWRkIHNvbWUg
dXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBhZGRyZXNzIG11c2wKLSAzMiBiaXQKK1N1YmplY3Q6
IFtQQVRDSF0gcWVtdTogQWRkIHNvbWUgdXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBhZGRyZXNz
IG11c2wgMzIgYml0CiAKIFdoZW4gdXNpbmcgcWVtdS1pMzg2IHRvIGJ1aWxkIHFlbXV4ODYgd2Vi
a2l0Z3RrIG9uIG11c2wsIGl0IHNpdHMgaW4gYW4KIGluZmluaXRlIGxvb3Agb2YgbXJlbWFwIGNh
bGxzIG9mIGV2ZXIgZGVjcmVhc2luZy9pbmNyZWFzaW5nIGFkZHJlc3Nlcy4KQEAgLTIzLDEwICsy
MiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZwogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saW51eC11c2VyL21tYXAuYyBiL2xpbnV4LXVzZXIv
bW1hcC5jCi1pbmRleCBiZTNiOWE2OGViLi40ODEyODZmMDFkIDEwMDY0NAoraW5kZXggZTRiZjVk
NWYzLi4wNGQ5MjBjMTEgMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL21tYXAuYwogKysrIGIvbGlu
dXgtdXNlci9tbWFwLmMKLUBAIC0xMDYwLDEyICsxMDYwLDE2IEBAIGFiaV9sb25nIHRhcmdldF9t
cmVtYXAoYWJpX3Vsb25nIG9sZF9hZGRyLCBhYmlfdWxvbmcgb2xkX3NpemUsCitAQCAtMTEwNSwx
MiArMTEwNSwxNiBAQCBhYmlfbG9uZyB0YXJnZXRfbXJlbWFwKGFiaV91bG9uZyBvbGRfYWRkciwg
YWJpX3Vsb25nIG9sZF9zaXplLAogICAgICBpbnQgcHJvdDsKICAgICAgdm9pZCAqaG9zdF9hZGRy
OwogIApAQCAtNDYsNiArNDUsMyBAQCBpbmRleCBiZTNiOWE2OGViLi40ODEyODZmMDFkIDEwMDY0
NAogICAgICAgICAgcmV0dXJuIC0xOwogICAgICB9CiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlz
bS1maXhlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11
LURldGVybWluaXNtLWZpeGVzLnBhdGNoCmluZGV4IGYwNzA1NGYxOWEuLjA1OTI1N2JjZTAgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVy
bWluaXNtLWZpeGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA5
ZDMyZGY4MGUzM2E3NTQxNjU4ODU4NDk3ZjQ1YmVkMWU1OWUzNjIxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAwOWU4ZmFjOTg0Y2VhNzE4NjdjMGI3YTA1YjBkZDhmNzAyNWJkMjVhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBNb24sIDEgTWFyIDIwMjEgMTM6MDA6NDcg
KzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAwNi8xMV0gcWVtdTogRGV0ZXJtaW5pc20gZml4ZXMKK1N1
YmplY3Q6IFtQQVRDSF0gcWVtdTogRGV0ZXJtaW5pc20gZml4ZXMKIAogV2hlbiBzb3VyY2VzIGFy
ZSBpbmNsdWRlZCB3aXRoaW4gZGVidWcgaW5mb3JtYXRpb24sIGEgY291cGxlIG9mIGFyZWFzIG9m
IHRoZQogcWVtdSBidWlsZCBhcmUgbm90IHJlcHJvZHVjaWJsZSBkdWUgdG8gZWl0aGVyIGZ1bGwg
YnVpbGRwYXRocyBvciB0aW1lc3RhbXBzLgpAQCAtMTYsNyArMTYsNyBAQCBSUCAyMDIxLzMvMQog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvc2NyaXB0cy9kZWNvZGV0cmVlLnB5IGIvc2NyaXB0cy9kZWNvZGV0cmVlLnB5Ci1pbmRl
eCBlOGI3MmRhM2E5Li41Y2Q4NmIxNDI4IDEwMDY0NAoraW5kZXggZThiNzJkYTNhLi41Y2Q4NmIx
NDIgMTAwNjQ0CiAtLS0gYS9zY3JpcHRzL2RlY29kZXRyZWUucHkKICsrKyBiL3NjcmlwdHMvZGVj
b2RldHJlZS5weQogQEAgLTE1NTgsNyArMTU1OCw3IEBAIGRlZiBtYWluKCk6CkBAIC0yOCw2ICsy
OCwzIEBAIGluZGV4IGU4YjcyZGEzYTkuLjVjZDg2YjE0MjggMTAwNjQ0CiAgICAgICAgICBmID0g
b3BlbihmaWxlbmFtZSwgJ3J0JywgZW5jb2Rpbmc9J3V0Zi04JykKICAgICAgICAgIHBhcnNlX2Zp
bGUoZiwgdG9wcGF0KQogICAgICAgICAgZi5jbG9zZSgpCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMtbWVzb24uYnVp
bGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUt
cGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCmluZGV4IDU0NzFiNzdlMTguLmNkOTE5MDQ4ZjQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1t
ZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11
c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAot
RnJvbSA3N2ViZjY3ZDBjOTZmNTFkYTkxYzg0OTkyMDBlYmQxM2Y0ZGNkZDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAxYTU3NGFhMjJjOWIzNzAwYWY3ZTVjMDkwMWFiZWY1OWM3MmJi
ODc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3Fp
bmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTQgSmFuIDIwMjEgMDY6MzM6MDQgKzAw
MDAKLVN1YmplY3Q6IFtQQVRDSCAwNy8xMV0gdGVzdHMvbWVzb24uYnVpbGQ6IHVzZSByZWxhdGl2
ZSBwYXRoIHRvIHJlZmVyIHRvIGZpbGVzCitTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL21lc29uLmJ1
aWxkOiB1c2UgcmVsYXRpdmUgcGF0aCB0byByZWZlciB0byBmaWxlcwogCiBGaXggZXJyb3IgbGlr
ZToKIEZhdGFsIGVycm9yOiBjYW4ndCBjcmVhdGUgdGVzdHMvcHRpbWVyLXRlc3QucC8uLi5fcWVt
dS01LjIuMF9od19jb3JlX3B0aW1lci5jLm86IEZpbGUgbmFtZSB0b28gbG9uZwpAQCAtMTMsMTMg
KzEzLDEzIEBAIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtzZW5kIHRvIHFlbXUtZGV2ZWxd
CiAKIFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5j
b20+CiAtLS0KLSB0ZXN0cy91bml0L21lc29uLmJ1aWxkIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKyB0ZXN0cy91bml0L21lc29uLmJ1
aWxkIHwgNiArKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQogCi1JbmRleDogcWVtdS05LjEuMC90ZXN0cy91bml0L21lc29uLmJ1aWxkCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gcWVtdS05LjEuMC5vcmlnL3Rlc3RzL3VuaXQvbWVzb24uYnVpbGQKLSsrKyBx
ZW11LTkuMS4wL3Rlc3RzL3VuaXQvbWVzb24uYnVpbGQKK2RpZmYgLS1naXQgYS90ZXN0cy91bml0
L21lc29uLmJ1aWxkIGIvdGVzdHMvdW5pdC9tZXNvbi5idWlsZAoraW5kZXggNDkwYWI4MTgyLi5k
MTllZTU2MDYgMTAwNjQ0CistLS0gYS90ZXN0cy91bml0L21lc29uLmJ1aWxkCisrKysgYi90ZXN0
cy91bml0L21lc29uLmJ1aWxkCiBAQCAtMTI4LDE3ICsxMjgsMTcgQEAgZW5kaWYKICAKICBpZiBo
YXZlX3N5c3RlbQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGku
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9T
WU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaAppbmRleCAyZTI4
NTkwZTExLi43YmJkOTZkZjg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5l
ZWRlZC1saS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgt
RGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRj
aApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMjFiMTU5YTExYmJjYjFlZWIyNmYxMjQ1NmU0YzNmZDYy
YTA2Y2JlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDZiNWIyNmEwYTFmNzY4NzU3
NmQ5MDA2NmU0OTJjZjI2NjVmZmYxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDIxIE1hciAyMDIyIDEwOjA5
OjM4IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMDgvMTFdIERlZmluZSBNQVBfU1lOQyBhbmQgTUFQ
X1NIQVJFRF9WQUxJREFURSBvbiBuZWVkZWQgbGludXgKK1N1YmplY3Q6IFtQQVRDSF0gRGVmaW5l
IE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5lZWRlZCBsaW51eAogIHN5c3Rl
bXMKIAogbGludXggb25seSB3aXJlcyBNQVBfU1lOQyBhbmQgTUFQX1NIQVJFRF9WQUxJREFURSBm
b3IgYXJjaGl0ZWN0dXJlcwpAQCAtMTgsNyArMTgsNyBAQCBDYzogTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdXRpbC9tbWFwLWFsbG9jLmMgYi91dGlsL21tYXAt
YWxsb2MuYwotaW5kZXggZWQxNGY5YzY0ZC4uMDM4ZjViNGI1NSAxMDA2NDQKK2luZGV4IGVkMTRm
OWM2NC4uMDM4ZjViNGI1IDEwMDY0NAogLS0tIGEvdXRpbC9tbWFwLWFsbG9jLmMKICsrKyBiL3V0
aWwvbW1hcC1hbGxvYy5jCiBAQCAtMTAsMTQgKzEwLDE4IEBACkBAIC00Myw2ICs0MywzIEBAIGlu
ZGV4IGVkMTRmOWM2NGQuLjAzOGY1YjRiNTUgMTAwNjQ0CiAgI2luY2x1ZGUgInFlbXUvbW1hcC1h
bGxvYy5oIgogICNpbmNsdWRlICJxZW11L2hvc3QtdXRpbHMuaCIKICAjaW5jbHVkZSAicWVtdS9j
dXRpbHMuaCIKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwOS1saW51eC11c2VyLVJlcGxhY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQt
ZnVuY3Rpb25zLWFuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA5
LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRlZC1mdW5jdGlvbnMtYW4ucGF0
Y2gKaW5kZXggNzU3NzI0OWQzOS4uZjllZGRiODE3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDA5LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQt
cmVsYXRlZC1mdW5jdGlvbnMtYW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA5LWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRlZC1mdW5j
dGlvbnMtYW4ucGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDIzZGUzMDA3OWRiZjQ3YTgwMjZm
YWRkZDU1MGE5ZTE4MWQ2MDljOGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE2YjU3
ZDYzYmNkYzNmM2NhZTk4MjdkMmUxZTM0OTJkMjI5MzY5NWYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxNyBE
ZWMgMjAyMiAwODozNzo0NiAtMDgwMAotU3ViamVjdDogW1BBVENIIDA5LzExXSBsaW51eC11c2Vy
OiBSZXBsYWNlIHVzZSBvZiBsZnM2NCByZWxhdGVkIGZ1bmN0aW9ucyBhbmQKLSBtYWNyb3MKK1N1
YmplY3Q6IFtQQVRDSF0gbGludXgtdXNlcjogUmVwbGFjZSB1c2Ugb2YgbGZzNjQgcmVsYXRlZCBm
dW5jdGlvbnMgYW5kIG1hY3JvcwogCiBCdWlsZHMgZGVmaW5lcyAtRF9GSUxFX09GRlNFVF9CSVRT
PTY0IHdoaWNoIG1ha2VzIHRoZSBvcmlnaW5hbCBmdW5jdGlvbnMKIGFuZiBtYWNyb3MgYmVoYXZl
IHNhbWUgYXMgdGhlaXIgNjQgc3VmZml4ZWQgY291bnRlcnBhcnRzLiBUaGlzIGFsc28KQEAgLTE3
LDEwICsxNiwxMCBAQCBDYzogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgogIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxMTQgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi1pbmRl
eCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAoraW5kZXggMjJkZjQ2ODU5Li4yN2FhNTk1
OTQgMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9z
eXNjYWxsLmMKLUBAIC03NjEsOCArNzYxLDggQEAgc2FmZV9zeXNjYWxsNihzc2l6ZV90LCBjb3B5
X2ZpbGVfcmFuZ2UsIGludCwgaW5mZCwgbG9mZl90ICosIHBpbm9mZiwKK0BAIC03NjIsOCArNzYy
LDggQEAgc2FmZV9zeXNjYWxsNihzc2l6ZV90LCBjb3B5X2ZpbGVfcmFuZ2UsIGludCwgaW5mZCwg
bG9mZl90ICosIHBpbm9mZiwKICAgKi8KICAjZGVmaW5lIHNhZmVfaW9jdGwoLi4uKSBzYWZlX3N5
c2NhbGwoX19OUl9pb2N0bCwgX19WQV9BUkdTX18pCiAgLyogU2ltaWxhcmx5IGZvciBmY250bC4g
Tm90ZSB0aGF0IGNhbGxlcnMgbXVzdCBhbHdheXM6CkBAIC0zMSw3ICszMCw3IEBAIGluZGV4IDE4
ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICogVGhpcyB3aWxsIHRoZW4gd29yayBhbmQg
dXNlIGEgNjQtYml0IG9mZnNldCBmb3IgYm90aCAzMi1iaXQgYW5kIDY0LWJpdCBob3N0cy4KICAg
Ki8KICAjaWZkZWYgX19OUl9mY250bDY0Ci1AQCAtNjczOSwxMyArNjczOSwxMyBAQCBzdGF0aWMg
aW50IHRhcmdldF90b19ob3N0X2ZjbnRsX2NtZChpbnQgY21kKQorQEAgLTY3MjQsMTMgKzY3MjQs
MTMgQEAgc3RhdGljIGludCB0YXJnZXRfdG9faG9zdF9mY250bF9jbWQoaW50IGNtZCkKICAgICAg
ICAgIHJldCA9IGNtZDsKICAgICAgICAgIGJyZWFrOwogICAgICBjYXNlIFRBUkdFVF9GX0dFVExL
OgpAQCAtNDgsNyArNDcsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAog
ICAgICAgICAgYnJlYWs7CiAgICAgIGNhc2UgVEFSR0VUX0ZfR0VUT1dOOgogICAgICAgICAgcmV0
ID0gRl9HRVRPV047Ci1AQCAtNjc1OSwxNyArNjc1OSw2IEBAIHN0YXRpYyBpbnQgdGFyZ2V0X3Rv
X2hvc3RfZmNudGxfY21kKGludCBjbWQpCitAQCAtNjc0NCwxNyArNjc0NCw2IEBAIHN0YXRpYyBp
bnQgdGFyZ2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQpCiAgICAgIGNhc2UgVEFSR0VUX0Zf
U0VUU0lHOgogICAgICAgICAgcmV0ID0gRl9TRVRTSUc7CiAgICAgICAgICBicmVhazsKQEAgLTY2
LDcgKzY1LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgY2Fz
ZSBUQVJHRVRfRl9TRVRMRUFTRToKICAgICAgICAgIHJldCA9IEZfU0VUTEVBU0U7CiAgICAgICAg
ICBicmVhazsKLUBAIC02ODIxLDggKzY4MTAsOCBAQCBzdGF0aWMgaW50IHRhcmdldF90b19ob3N0
X2ZjbnRsX2NtZChpbnQgY21kKQorQEAgLTY4MDYsOCArNjc5NSw4IEBAIHN0YXRpYyBpbnQgdGFy
Z2V0X3RvX2hvc3RfZmNudGxfY21kKGludCBjbWQpCiAgICAgICAqIHRoZW0gdG8gNSwgNiBhbmQg
NyBiZWZvcmUgbWFraW5nIHRoZSBzeXNjYWxsKCkuIFNpbmNlIHdlIG1ha2UgdGhlCiAgICAgICAq
IHN5c2NhbGwgZGlyZWN0bHksIGFkanVzdCB0byB3aGF0IGlzIHN1cHBvcnRlZCBieSB0aGUga2Vy
bmVsLgogICAgICAgKi8KQEAgLTc3LDcgKzc2LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUw
YTJhNyAxMDA2NDQKICAgICAgfQogICNlbmRpZgogIAotQEAgLTY4NTUsNTUgKzY4NDQsMTEgQEAg
c3RhdGljIGludCBob3N0X3RvX3RhcmdldF9mbG9jayhpbnQgdHlwZSkKK0BAIC02ODQwLDU1ICs2
ODI5LDExIEBAIHN0YXRpYyBpbnQgaG9zdF90b190YXJnZXRfZmxvY2soaW50IHR5cGUpCiAgICAg
IHJldHVybiB0eXBlOwogIH0KICAKQEAgLTEzNiw3ICsxMzUsNyBAQCBpbmRleCAxOGYwOWYxZjA3
Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBhYmlfc2hvcnQgbF90eXBlOwogICAgICBhYmlfc2hv
cnQgbF93aGVuY2U7CiAgICAgIGFiaV9sbG9uZyBsX3N0YXJ0OwotQEAgLTY5MTEsMTAgKzY4NTYs
MTAgQEAgc3RydWN0IHRhcmdldF9vYWJpX2Zsb2NrNjQgeworQEAgLTY4OTYsMTAgKzY4NDEsMTAg
QEAgc3RydWN0IHRhcmdldF9vYWJpX2Zsb2NrNjQgewogICAgICBhYmlfaW50ICAgbF9waWQ7CiAg
fSBRRU1VX1BBQ0tFRDsKICAKQEAgLTE0OSw3ICsxNDgsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICBpbnQgbF90eXBlOwogIAogICAgICBpZiAoIWxvY2tfdXNl
cl9zdHJ1Y3QoVkVSSUZZX1JFQUQsIHRhcmdldF9mbCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDEpKSB7
Ci1AQCAtNjkzNSwxMCArNjg4MCwxMCBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfZnJv
bV91c2VyX29hYmlfZmxvY2s2NChzdHJ1Y3QgZmxvY2s2NCAqZmwsCitAQCAtNjkyMCwxMCArNjg2
NSwxMCBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfZnJvbV91c2VyX29hYmlfZmxvY2s2
NChzdHJ1Y3QgZmxvY2s2NCAqZmwsCiAgICAgIHJldHVybiAwOwogIH0KICAKQEAgLTE2Myw3ICsx
NjIsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBzaG9ydCBs
X3R5cGU7CiAgCiAgICAgIGlmICghbG9ja191c2VyX3N0cnVjdChWRVJJRllfV1JJVEUsIHRhcmdl
dF9mbCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDApKSB7Ci1AQCAtNjk1NiwxMCArNjkwMSwxMCBAQCBz
dGF0aWMgaW5saW5lIGFiaV9sb25nIGNvcHlfdG9fdXNlcl9vYWJpX2Zsb2NrNjQoYWJpX3Vsb25n
IHRhcmdldF9mbG9ja19hZGRyLAorQEAgLTY5NDEsMTAgKzY4ODYsMTAgQEAgc3RhdGljIGlubGlu
ZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfb2FiaV9mbG9jazY0KGFiaV91bG9uZyB0YXJnZXRfZmxv
Y2tfYWRkciwKICB9CiAgI2VuZGlmCiAgCkBAIC0xNzYsNyArMTc1LDcgQEAgaW5kZXggMThmMDlm
MWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgaW50IGxfdHlwZTsKICAKICAgICAgaWYgKCFs
b2NrX3VzZXJfc3RydWN0KFZFUklGWV9SRUFELCB0YXJnZXRfZmwsIHRhcmdldF9mbG9ja19hZGRy
LCAxKSkgewotQEAgLTY5ODAsMTAgKzY5MjUsMTAgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBj
b3B5X2Zyb21fdXNlcl9mbG9jazY0KHN0cnVjdCBmbG9jazY0ICpmbCwKK0BAIC02OTY1LDEwICs2
OTEwLDEwIEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcgY29weV9mcm9tX3VzZXJfZmxvY2s2NChz
dHJ1Y3QgZmxvY2s2NCAqZmwsCiAgICAgIHJldHVybiAwOwogIH0KICAKQEAgLTE5MCw3ICsxODks
NyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0NAogICAgICBzaG9ydCBsX3R5
cGU7CiAgCiAgICAgIGlmICghbG9ja191c2VyX3N0cnVjdChWRVJJRllfV1JJVEUsIHRhcmdldF9m
bCwgdGFyZ2V0X2Zsb2NrX2FkZHIsIDApKSB7Ci1AQCAtNzAwMiw3ICs2OTQ3LDcgQEAgc3RhdGlj
IGlubGluZSBhYmlfbG9uZyBjb3B5X3RvX3VzZXJfZmxvY2s2NChhYmlfdWxvbmcgdGFyZ2V0X2Zs
b2NrX2FkZHIsCitAQCAtNjk4Nyw3ICs2OTMyLDcgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyBj
b3B5X3RvX3VzZXJfZmxvY2s2NChhYmlfdWxvbmcgdGFyZ2V0X2Zsb2NrX2FkZHIsCiAgCiAgc3Rh
dGljIGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJpX3Vsb25nIGFyZykKICB7
CkBAIC0xOTksNyArMTk4LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQK
ICAjaWZkZWYgRl9HRVRPV05fRVgKICAgICAgc3RydWN0IGZfb3duZXJfZXggZm94OwogICAgICBz
dHJ1Y3QgdGFyZ2V0X2Zfb3duZXJfZXggKnRhcmdldF9mb3g7Ci1AQCAtNzAxNSw2ICs2OTYwLDcg
QEAgc3RhdGljIGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJpX3Vsb25nIGFy
ZykKK0BAIC03MDAwLDYgKzY5NDUsNyBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZk
LCBpbnQgY21kLCBhYmlfdWxvbmcgYXJnKQogIAogICAgICBzd2l0Y2goY21kKSB7CiAgICAgIGNh
c2UgVEFSR0VUX0ZfR0VUTEs6CkBAIC0yMDcsNyArMjA2LDcgQEAgaW5kZXggMThmMDlmMWYwNy4u
MWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgIHJldCA9IGNvcHlfZnJvbV91c2VyX2Zsb2NrKCZm
bDY0LCBhcmcpOwogICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgIHJldHVybiByZXQ7
Ci1AQCAtNzAyNCwzMiArNjk3MCwxMSBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fZmNudGwoaW50IGZk
LCBpbnQgY21kLCBhYmlfdWxvbmcgYXJnKQorQEAgLTcwMDksMzIgKzY5NTUsMTEgQEAgc3RhdGlj
IGFiaV9sb25nIGRvX2ZjbnRsKGludCBmZCwgaW50IGNtZCwgYWJpX3Vsb25nIGFyZykKICAgICAg
ICAgICAgICByZXQgPSBjb3B5X3RvX3VzZXJfZmxvY2soYXJnLCAmZmw2NCk7CiAgICAgICAgICB9
CiAgICAgICAgICBicmVhazsKQEAgLTI0MSw3ICsyNDAsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4x
YjdjNTBhMmE3IDEwMDY0NAogICAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgIHJldHVy
biByZXQ7CiAgICAgICAgICB9Ci1AQCAtNzI3OCw3ICs3MjAzLDcgQEAgc3RhdGljIGlubGluZSBh
YmlfbG9uZyB0YXJnZXRfdHJ1bmNhdGU2NChDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGNvbnN0IGNo
YXIgKmFyZzEKK0BAIC03MjY5LDcgKzcxOTQsNyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIHRh
cmdldF90cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgY29uc3QgY2hhciAqYXJnMQog
ICAgICAgICAgYXJnMiA9IGFyZzM7CiAgICAgICAgICBhcmczID0gYXJnNDsKICAgICAgfQpAQCAt
MjUwLDcgKzI0OSw3IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgfQog
ICNlbmRpZgogIAotQEAgLTcyOTIsNyArNzIxNyw3IEBAIHN0YXRpYyBpbmxpbmUgYWJpX2xvbmcg
dGFyZ2V0X2Z0cnVuY2F0ZTY0KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgYWJpX2xvbmcgYXJnMSwK
K0BAIC03MjgzLDcgKzcyMDgsNyBAQCBzdGF0aWMgaW5saW5lIGFiaV9sb25nIHRhcmdldF9mdHJ1
bmNhdGU2NChDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICBh
cmcyID0gYXJnMzsKICAgICAgICAgIGFyZzMgPSBhcmc0OwogICAgICB9CkBAIC0yNTksNyArMjU4
LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICB9CiAgI2VuZGlmCiAg
Ci1AQCAtODY2Nyw3ICs4NTkyLDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBk
aXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCitAQCAtODY2OCw3ICs4NTkzLDcg
QEAgc3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwg
YWJpX2xvbmcgY291bnQpCiAgICAgIHZvaWQgKnRkaXJwOwogICAgICBpbnQgaGxlbiwgaG9mZiwg
dG9mZjsKICAgICAgaW50IGhyZWNsZW4sIHRyZWNsZW47CkBAIC0yNjgsNyArMjY3LDcgQEAgaW5k
ZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAKICAgICAgaGRpcnAgPSBnX3RyeV9t
YWxsb2MoY291bnQpOwogICAgICBpZiAoIWhkaXJwKSB7Ci1AQCAtODcyMCw3ICs4NjQ1LDcgQEAg
c3RhdGljIGludCBkb19nZXRkZW50cyhhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJp
X2xvbmcgY291bnQpCitAQCAtODcyMSw3ICs4NjQ2LDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50
cyhhYmlfbG9uZyBkaXJmZCwgYWJpX2xvbmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCiAgICAgICAg
ICAgICAgICogUmV0dXJuIHdoYXQgd2UgaGF2ZSwgcmVzZXR0aW5nIHRoZSBmaWxlIHBvaW50ZXIg
dG8gdGhlCiAgICAgICAgICAgICAgICogbG9jYXRpb24gb2YgdGhlIGZpcnN0IHJlY29yZCBub3Qg
cmV0dXJuZWQuCiAgICAgICAgICAgICAgICovCkBAIC0yNzcsNyArMjc2LDcgQEAgaW5kZXggMThm
MDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgICAgICBicmVhazsKICAgICAgICAg
IH0KICAKLUBAIC04NzU0LDcgKzg2NzksNyBAQCBzdGF0aWMgaW50IGRvX2dldGRlbnRzNjQoYWJp
X2xvbmcgZGlyZmQsIGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNvdW50KQorQEAgLTg3NTUsNyAr
ODY4MCw3IEBAIHN0YXRpYyBpbnQgZG9fZ2V0ZGVudHM2NChhYmlfbG9uZyBkaXJmZCwgYWJpX2xv
bmcgYXJnMiwgYWJpX2xvbmcgY291bnQpCiAgICAgIHZvaWQgKnRkaXJwOwogICAgICBpbnQgaGxl
biwgaG9mZiwgdG9mZjsKICAgICAgaW50IGhyZWNsZW4sIHRyZWNsZW47CkBAIC0yODYsNyArMjg1
LDcgQEAgaW5kZXggMThmMDlmMWYwNy4uMWI3YzUwYTJhNyAxMDA2NDQKICAKICAgICAgaGRpcnAg
PSBnX3RyeV9tYWxsb2MoY291bnQpOwogICAgICBpZiAoIWhkaXJwKSB7Ci1AQCAtODc5Niw3ICs4
NzIxLDcgQEAgc3RhdGljIGludCBkb19nZXRkZW50czY0KGFiaV9sb25nIGRpcmZkLCBhYmlfbG9u
ZyBhcmcyLCBhYmlfbG9uZyBjb3VudCkKK0BAIC04Nzk3LDcgKzg3MjIsNyBAQCBzdGF0aWMgaW50
IGRvX2dldGRlbnRzNjQoYWJpX2xvbmcgZGlyZmQsIGFiaV9sb25nIGFyZzIsIGFiaV9sb25nIGNv
dW50KQogICAgICAgICAgICAgICAqIFJldHVybiB3aGF0IHdlIGhhdmUsIHJlc2V0dGluZyB0aGUg
ZmlsZSBwb2ludGVyIHRvIHRoZQogICAgICAgICAgICAgICAqIGxvY2F0aW9uIG9mIHRoZSBmaXJz
dCByZWNvcmQgbm90IHJldHVybmVkLgogICAgICAgICAgICAgICAqLwpAQCAtMjk1LDcgKzI5NCw3
IEBAIGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICAgICAgYnJl
YWs7CiAgICAgICAgICB9CiAgCi1AQCAtMTE1MjcsNyArMTE0NTIsNyBAQCBzdGF0aWMgYWJpX2xv
bmcgZG9fc3lzY2FsbDEoQ1BVQXJjaFN0YXRlICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBh
cmcxLAorQEAgLTExNTI4LDcgKzExNDUzLDcgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwx
KENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1UQVJHRVRfRUZBVUxUOwogICAgICAgICAgICAgIH0KICAgICAgICAg
IH0KQEAgLTMwNCw3ICszMDMsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0
NAogICAgICAgICAgdW5sb2NrX3VzZXIocCwgYXJnMiwgcmV0KTsKICAgICAgICAgIHJldHVybiBy
ZXQ7CiAgICAgIGNhc2UgVEFSR0VUX05SX3B3cml0ZTY0OgotQEAgLTExNTQ0LDcgKzExNDY5LDcg
QEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50
IG51bSwgYWJpX2xvbmcgYXJnMSwKK0BAIC0xMTU0NSw3ICsxMTQ3MCw3IEBAIHN0YXRpYyBhYmlf
bG9uZyBkb19zeXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25n
IGFyZzEsCiAgICAgICAgICAgICAgICAgIHJldHVybiAtVEFSR0VUX0VGQVVMVDsKICAgICAgICAg
ICAgICB9CiAgICAgICAgICB9CkBAIC0zMTMsNyArMzEyLDcgQEAgaW5kZXggMThmMDlmMWYwNy4u
MWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgIHVubG9ja191c2VyKHAsIGFyZzIsIDApOwogICAg
ICAgICAgcmV0dXJuIHJldDsKICAjZW5kaWYKLUBAIC0xMjQwNCwxNCArMTIzMjksMTQgQEAgc3Rh
dGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwg
YWJpX2xvbmcgYXJnMSwKK0BAIC0xMjQwNSwxNCArMTIzMzAsMTQgQEAgc3RhdGljIGFiaV9sb25n
IGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJn
MSwKICAgICAgY2FzZSBUQVJHRVRfTlJfZmNudGw2NDoKICAgICAgewogICAgICAgICAgaW50IGNt
ZDsKQEAgLTMzMyw3ICszMzIsNyBAQCBpbmRleCAxOGYwOWYxZjA3Li4xYjdjNTBhMmE3IDEwMDY0
NAogICAgICAgICAgfQogICNlbmRpZgogIAotQEAgLTEyNDIxLDcgKzEyMzQ2LDcgQEAgc3RhdGlj
IGFiaV9sb25nIGRvX3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJp
X2xvbmcgYXJnMSwKK0BAIC0xMjQyMiw3ICsxMjM0Nyw3IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19z
eXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAg
ICAgICAgICB9CiAgCiAgICAgICAgICBzd2l0Y2goYXJnMikgewpAQCAtMzQyLDcgKzM0MSw3IEBA
IGluZGV4IDE4ZjA5ZjFmMDcuLjFiN2M1MGEyYTcgMTAwNjQ0CiAgICAgICAgICAgICAgcmV0ID0g
Y29weWZyb20oJmZsLCBhcmczKTsKICAgICAgICAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAg
ICAgICAgIGJyZWFrOwotQEAgLTEyNDMyLDggKzEyMzU3LDggQEAgc3RhdGljIGFiaV9sb25nIGRv
X3N5c2NhbGwxKENQVUFyY2hTdGF0ZSAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwK
K0BAIC0xMjQzMyw4ICsxMjM1OCw4IEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxsMShDUFVB
cmNoU3RhdGUgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICAgICAg
fQogIAkgICAgYnJlYWs7CiAgCkBAIC0zNTMsNiArMzUyLDMgQEAgaW5kZXggMThmMDlmMWYwNy4u
MWI3YzUwYTJhNyAxMDA2NDQKICAgICAgICAgICAgICByZXQgPSBjb3B5ZnJvbSgmZmwsIGFyZzMp
OwogICAgICAgICAgICAgIGlmIChyZXQpIHsKICAgICAgICAgICAgICAgICAgYnJlYWs7Ci0tLSAK
LTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1l
eHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKaW5kZXggOThjZTg1YThjZi4uZjIwODUxYmZmMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1s
b29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZy
b20tUEFUSC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZTEyYTkzMTc0ZjliNjUyNjA0ZGRh
OGQ4NDY0Yjk1NTliNjJiMjlkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmU5NjQy
YjkwMDFkZjUyMzYyOGFiMmNhY2JiYmYyYjIwOGM0OTQzNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9QjhsbD89IDxtYXJ0aW5AZ2Vh
bml4LmNvbT4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTQ6MDI6NTUgKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSCAxMC8xMV0gY29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUgZnJvbSBQQVRI
CitTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogbG9va3VwIG1lc29uIGV4dXRhYmxlIGZyb20g
UEFUSAogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3dvcmthcm91bmQsIHdvdWxk
IG5lZWQgYSByZWFsIGZpeCBmb3IgdXBzdHJlYW1dCiAtLS0KQEAgLTksMTAgKzksMTAgQEAgVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt3b3JrYXJvdW5kLCB3b3VsZCBuZWVkIGEgcmVh
bCBmaXggZm9yIHVwc3RyZWFtXQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXgg
M2NkNzM2YjEzOS4uNDgyYTFmOGVmMyAxMDA3NTUKK2luZGV4IGQwOGI3MWYxNC4uYWYwYmQyYzY2
IDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiArKysgYi9jb25maWd1cmUKLUBAIC05NTYsMTIgKzk1
Niw3IEBAIGZpCitAQCAtOTU4LDEyICs5NTgsNyBAQCBta3ZlbnY9IiRweXRob24gJHtzb3VyY2Vf
cGF0aH0vcHl0aG9uL3NjcmlwdHMvbWt2ZW52LnB5IgogICRta3ZlbnYgZW5zdXJlZ3JvdXAgLS1k
aXIgIiR7c291cmNlX3BhdGh9L3B5dGhvbi93aGVlbHMiIFwKICAgICAgICR7c291cmNlX3BhdGh9
L3B5dGhvbmRlcHMudG9tbCBtZXNvbiB8fCBleGl0IDEKICAKQEAgLTI2LDYgKzI2LDMgQEAgaW5k
ZXggM2NkNzM2YjEzOS4uNDgyYTFmOGVmMyAxMDA3NTUKICAKICAjIENvbmRpdGlvbmFsbHkgZW5z
dXJlIFNwaGlueCBpcyBpbnN0YWxsZWQuCiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10
aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1h
cmVuLXQtdXNlZC1mb3ItLnBhdGNoCmluZGV4IGM3YmI5YjFiNDcuLjRhZGIyZTVmYTUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1w
aXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1w
eXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCkBAIC0xLDggKzEsNyBAQAotRnJvbSBh
OTNjMmE2YjJjOWRiOWM0YmQzMDI5OGRhNDNjMzdjNWU1YzYyMzZlIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA2OGExM2FmZDY2MDZjMmFhZjFmMGRlYmQzMjVkNzMxNGFhYTYxNDExIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDEzOjU4OjIz
ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMTEvMTFdIHFlbXU6IEVuc3VyZSBwaXAgYW5kIHRoZSBw
eXRob24gdmVudiBhcmVuJ3QgdXNlZCBmb3IKLSBtZXNvbgorU3ViamVjdDogW1BBVENIXSBxZW11
OiBFbnN1cmUgcGlwIGFuZCB0aGUgcHl0aG9uIHZlbnYgYXJlbid0IHVzZWQgZm9yIG1lc29uCiAK
IFFlbXUgd2FudHMgdG8gdXNlIGEgc3VwcG9ydGVkIHB5dGhvbiB2ZXJzaW9uIGFuZCBhIHNwZWNp
ZmljIG1lc29uIHZlcnNpb24KIHRvICJoZWxwIiB1c2VycyBhbmQgdXNlcyBwaXAgYW5kIGNyZWF0
ZXMgYSB2ZW52IHRvIGRvIHRoaXMuIFRoaXMgaXMgYSBuaWdodG1hcmUKQEAgLTMwLDEwICsyOSwx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCA0ODJh
MWY4ZWYzLi4wZGE0YmYzZTRkIDEwMDc1NQoraW5kZXggYWYwYmQyYzY2Li44OGRhYjZhOTUgMTAw
NzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTkzOCwxNCArOTM4LDE0
IEBAIHB5dGhvbj0iJChjb21tYW5kIC12ICIkcHl0aG9uIikiCitAQCAtOTQ0LDE0ICs5NDQsMTQg
QEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24iKSIKICBlY2hvICJweXRob24gZGV0ZXJt
aW5lZCB0byBiZSAnJHB5dGhvbiciCiAgZWNobyAicHl0aG9uIHZlcnNpb246ICQoJHB5dGhvbiAt
LXZlcnNpb24pIgogIApAQCAtNTAsNiArNDksMyBAQCBpbmRleCA0ODJhMWY4ZWYzLi4wZGE0YmYz
ZTRkIDEwMDc1NQogIAogICMgRmluaXNoIHByZXBhcmluZyB0aGUgdmlydHVhbCBlbnZpcm9ubWVu
dCB1c2luZyB2ZW5kb3JlZCAud2hsIGZpbGVzCiAgCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAu
cGF0Y2gKaW5kZXggNTA5OGU4YTRlNS4uYjU3YzQ4MTE4MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaApA
QCAtMSw0ICsxLDcgQEAKLXRhcmdldC9yaXNjdi9rdm06IGRvIG5vdCB1c2Ugbm9uLXBvcnRhYmxl
IHN0cmVycm9ybmFtZV9ucCgpCitGcm9tIDlkZTVkZTg1ZmE5MTdhZjU4ZTdiYzljZGQ4OGY4Zjdl
ZjhkYTJjYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBOYXRhbmFlbCBDb3BhIDxu
Y29wYUBhbHBpbmVsaW51eC5vcmc+CitEYXRlOiBXZWQsIDE4IFNlcCAyMDI0IDE2OjE5OjM3IC0w
NzAwCitTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9yaXNjdi9rdm06IGRvIG5vdCB1c2Ugbm9uLXBv
cnRhYmxlIHN0cmVycm9ybmFtZV9ucCgpCiAKIHN0cmVycm9ybmFtZV9ucCBpcyBub24tcG9ydGFi
bGUgYW5kIGJyZWFrcyBidWlsZGluZyB3aXRoIG11c2wgbGliYy4KIApAQCAtNywxNSArMTAsMjAg
QEAgVXNlIHN0cmVycm9yKGVycm5vKSBpbnN0ZWFkLCBsaWtlIHdlIGRvIG90aGVyIHBsYWNlcy4K
IFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL21haWwuZ251Lm9yZy9hcmNoaXZl
L2h0bWwvcWVtdS1zdGFibGUvMjAyMy0xMi9tc2cwMDA2OS5odG1sXQogCiBDYzogcWVtdS1zdGFi
bGVAbm9uZ251Lm9yZwotRml4ZXM6IGNvbW1pdCAwODJlOWU0YTU4YmEgKHRhcmdldC9yaXNjdi9r
dm06IGltcHJvdmUgJ2luaXRfbXVsdGlleHRfY2ZnJyBlcnJvciAKK0ZpeGVzOiBjb21taXQgMDgy
ZTllNGE1OGJhICh0YXJnZXQvcmlzY3Yva3ZtOiBpbXByb3ZlICdpbml0X211bHRpZXh0X2NmZycg
ZXJyb3IKIG1zZykKIFJlc29sdmVzOiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3Fl
bXUvLS9pc3N1ZXMvMjA0MQogQnVnbGluazogaHR0cHM6Ly9naXRsYWIuYWxwaW5lbGludXgub3Jn
L2FscGluZS9hcG9ydHMvLS9pc3N1ZXMvMTU1NDEKIFNpZ25lZC1vZmYtYnk6IE5hdGFuYWVsIENv
cGEgPG5jb3BhQGFscGluZWxpbnV4Lm9yZz4KKy0tLQorIHRhcmdldC9yaXNjdi9rdm0va3ZtLWNw
dS5jIHwgMyArLS0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCiAKK2RpZmYgLS1naXQgYS90YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYyBiL3RhcmdldC9y
aXNjdi9rdm0va3ZtLWNwdS5jCitpbmRleCBmNmUzMTU2YjguLmZhZDllYjIxYyAxMDA2NDQKIC0t
LSBhL3RhcmdldC9yaXNjdi9rdm0va3ZtLWNwdS5jCiArKysgYi90YXJnZXQvcmlzY3Yva3ZtL2t2
bS1jcHUuYwotQEAgLTE3MzEsOCArMTczMSw3IEBAIHN0YXRpYyBib29sIGt2bV9jcHVfcmVhbGl6
ZShDUFVTdGF0ZSAqY3MKK0BAIC0xODU5LDggKzE4NTksNyBAQCBzdGF0aWMgYm9vbCBrdm1fY3B1
X3JlYWxpemUoQ1BVU3RhdGUgKmNzLCBFcnJvciAqKmVycnApCiAgICAgIGlmIChyaXNjdl9oYXNf
ZXh0KCZjcHUtPmVudiwgUlZWKSkgewogICAgICAgICAgcmV0ID0gcHJjdGwoUFJfUklTQ1ZfVl9T
RVRfQ09OVFJPTCwgUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PTik7CiAgICAgICAgICBpZiAocmV0
KSB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzkuMS4wLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjEuMS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjEu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjEuMS5iYgot
LSAKMi40NC4xCgo=

--===============4797324426528448769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.2 to libgio-2.0.so.0.8200.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.2 to libgirepository-2.0.so.0.8200.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.2 to libglib-2.0.so.0.8200.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.2 to libgmodule-2.0.so.0.8200.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.2 to libgobject-2.0.so.0.8200.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.2 to libgthread-2.0.so.0.8200.1
  /usr/lib/libgio-2.0.so.0.8200.2 moved to /usr/lib/libgio-2.0.so.0.8200.1
  /usr/lib/libgirepository-2.0.so.0.8200.2 moved to /usr/lib/libgirepository-2.0.so.0.8200.1
  /usr/lib/libglib-2.0.so.0.8200.2 moved to /usr/lib/libglib-2.0.so.0.8200.1
  /usr/lib/libgmodule-2.0.so.0.8200.2 moved to /usr/lib/libgmodule-2.0.so.0.8200.1
  /usr/lib/libgobject-2.0.so.0.8200.2 moved to /usr/lib/libgobject-2.0.so.0.8200.1
  /usr/lib/libgthread-2.0.so.0.8200.2 moved to /usr/lib/libgthread-2.0.so.0.8200.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py

--===============4797324426528448769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.2 to libgio-2.0.so.0.8200.1
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.2 to libgirepository-2.0.so.0.8200.1
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.2 to libglib-2.0.so.0.8200.1
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.2 to libgmodule-2.0.so.0.8200.1
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.2 to libgobject-2.0.so.0.8200.1
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.2 to libgthread-2.0.so.0.8200.1
  /usr/lib/libgio-2.0.so.0.8200.2 moved to /usr/lib/libgio-2.0.so.0.8200.1
  /usr/lib/libgirepository-2.0.so.0.8200.2 moved to /usr/lib/libgirepository-2.0.so.0.8200.1
  /usr/lib/libglib-2.0.so.0.8200.2 moved to /usr/lib/libglib-2.0.so.0.8200.1
  /usr/lib/libgmodule-2.0.so.0.8200.2 moved to /usr/lib/libgmodule-2.0.so.0.8200.1
  /usr/lib/libgobject-2.0.so.0.8200.2 moved to /usr/lib/libgobject-2.0.so.0.8200.1
  /usr/lib/libgthread-2.0.so.0.8200.2 moved to /usr/lib/libgthread-2.0.so.0.8200.1
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.1-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.1-gdb.py
packages/core2-64-poky-linux/qemu: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-9.1.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-9.1.1.tar.xz file://powerpc_rom.bin file
 ://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-common: PKGSIZE changed from 307938444 to 307938176 (-0%)
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1683511832 to 1683236128 (-0%)
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-dev: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-dev: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-doc: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-doc: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-locale: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-locale: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 179779866 to 179788058 (+0%)
packages/core2-64-poky-linux/qemu/qemu-ptest: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 83727431 to 83728119 (+0%)
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31748168 to 31748232 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29405472 to 29405536 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26772360 to 26772424 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14706664 to 14706728 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13608168 to 13608232 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13742664 to 13742728 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15685608 to 15685672 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13599976 to 13600040 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15827328 to 15823296 (-0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16965224 to 16965288 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 15782024 to 15782088 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 15833000 to 15833064 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12086400 to 12086464 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26819240 to 26819304 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGSIZE changed from 862472 to 866568 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PV changed from "9.1.0" to "9.1.1"
packages/core2-64-poky-linux/qemu/qemu: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/core2-64-poky-linux/qemu/qemu: PV changed from "9.1.0" to "9.1.1"

--===============4797324426528448769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-64 sysroot...done.
Removing 110 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cb4b31907c88ffdb26dc29a164f9ed985c023dd7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 866 Local 673 Mirrors 0 Missed 193 Current 369 (77% match, 84% complete)
Removing 4 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 388 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 391 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 396 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 428 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libslirp-4.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-9.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libslirp-4.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_recipe_qa_setscene)
NOTE: recipe libsdl2-2.30.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-9.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 443 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe virglrenderer-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 450 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 452 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libslirp-4.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libslirp-4.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsdl2-2.30.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 462 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 476 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe virglrenderer-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 477 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 478 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 483 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 507 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 508 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 521 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 529 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 549 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 561 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 565 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 567 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 569 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 571 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 577 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-33-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 587 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 588 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 606 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: Running setscene task 607 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 624 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 630 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 640 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 642 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 652 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 653 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 658 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 660 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 665 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 678 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 690 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 694 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ofono-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 704 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 713 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 715 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 727 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 728 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 734 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 735 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 742 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 746 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 766 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 793 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 802 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 806 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 809 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 810 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 826 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 828 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 831 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 838 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 840 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 845 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 847 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 849 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 850 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 852 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 853 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 856 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 858 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1030 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1033 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1035 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1039 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 320 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_fetch)
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 374 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 392 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_fetch)
NOTE: Running task 394 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_fetch)
NOTE: Running setscene task 1040 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running task 400 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 404 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_write_config)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1042 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running task 405 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_write_config)
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1045 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1046 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_fetch: Started
NOTE: Running setscene task 1048 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1052 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1054 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1055 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_write_config: Started
NOTE: Running setscene task 1058 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1059 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1060 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1062 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1063 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1070 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1072 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1077 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1081 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1086 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1088 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1089 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1091 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1092 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1095 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1096 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1100 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1105 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1109 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1113 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1117 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1121 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1123 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1126 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1128 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1130 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1131 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1142 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1153 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1156 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1159 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1163 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1169 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 802 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1171 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1172 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1174 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 941 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_unpack)
NOTE: Running task 942 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_unpack)
NOTE: Running task 946 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 981 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1023 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1025 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1029 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1033 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: Running task 1045 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_unpack: Started
NOTE: Running task 1053 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running task 1065 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1100 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1108 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1114 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1140 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: Running task 1158 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 1171 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1172 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1180 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: Running task 1184 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1185 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: Running task 1186 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1201 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1203 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: Running task 1209 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1225 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: Running task 1227 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1229 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1232 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe bluez5-5.79-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: Running task 1234 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_unpack: Succeeded
NOTE: Running task 1235 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1236 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running setscene task 1179 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1180 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1237 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_patch)
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: Running task 1243 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1244 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_patch: Started
NOTE: Running task 1249 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_unpack)
NOTE: Running task 1250 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1251 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1252 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1255 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1256 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.79-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1262 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: Running task 1267 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1270 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1306 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_fetch)
NOTE: Running task 1310 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1184 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1323 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: Running task 1330 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: Running task 1332 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1188 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1359 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_patch)
NOTE: Running task 1361 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1368 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1369 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: Running task 1370 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: Running task 1371 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 1372 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1193 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running task 1375 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_unpack)
NOTE: Running task 1376 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: recipe bluez5-5.79-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 1195 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1377 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1379 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1386 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1197 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1198 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1440 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1445 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: Running task 1459 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1460 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1461 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1462 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: Running task 1513 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_fetch)
NOTE: Running task 1514 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1515 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1521 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: Running task 1523 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.123-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1528 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_write_config)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1529 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1530 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe ell-0.69-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1533 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe ell-0.69-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1546 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.11.bb:do_fetch)
NOTE: Running task 1547 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: Running task 1548 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Succeeded
NOTE: Running task 1549 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1550 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_configure)
NOTE: recipe libdrm-2.4.123-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: Running task 1551 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe ofono-2.11-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1203 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1554 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe bluez5-5.79-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Started
NOTE: Running task 1580 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_write_config)
NOTE: Running task 1589 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: Running task 1590 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1606 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1607 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: Running task 1609 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.123-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.123-r0: task do_patch: Succeeded
NOTE: recipe ell-0.69-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_write_config: Started
NOTE: Running task 1710 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.11.bb:do_unpack)
NOTE: Running task 1711 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 1714 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.11-r0: task do_unpack: Started
NOTE: Running task 1744 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: Running task 1745 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1756 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe ell-0.69-r0: task do_unpack: Succeeded
NOTE: Running task 1757 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.69.bb:do_patch)
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_patch: Succeeded
NOTE: Running task 1762 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_fetch)
NOTE: Running task 1768 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1211 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libsdl2-2.30.8-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1212 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_fetch: Succeeded
NOTE: Running task 1769 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_patch: Succeeded
NOTE: recipe ell-0.69-r0: task do_patch: Started
NOTE: recipe ofono-2.11-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: Running task 1771 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_generate_toolchain_file)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: Running task 1772 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.11.bb:do_patch)
NOTE: recipe xkeyboard-config-2.43-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1773 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe ell-0.69-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1214 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1215 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1778 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1780 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: Running task 1788 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_write_config)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: Running task 1794 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.11-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1795 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1796 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_fetch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1799 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1800 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_compile)
NOTE: recipe ofono-2.11-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1801 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb:do_unpack)
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1807 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_unpack)
NOTE: recipe wayland-protocols-1.38-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Succeeded
NOTE: Running task 1810 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1812 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.1.1.bb:do_recipe_qa)
NOTE: Running setscene task 1226 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe virglrenderer-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1227 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1821 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: Running task 1830 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1831 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-9.1.1-r0: task do_recipe_qa: Started
NOTE: recipe libslirp-4.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1835 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_unpack)
NOTE: Running task 1836 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: Running task 1849 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: Running task 1855 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: Running task 1870 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_write_config)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1871 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe qemu-9.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_unpack: Started
NOTE: Running task 1872 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.1.1.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_unpack: Started
NOTE: Running task 1883 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.43-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1884 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_patch)
NOTE: Running task 1885 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.43-r0: task do_write_config: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: Running task 1901 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.43-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1903 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 1904 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe wayland-protocols-1.38-r0: task do_compile: Succeeded
NOTE: recipe qemu-9.1.1-r0: task do_fetch: Started
NOTE: Running task 1905 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_install)
NOTE: recipe xkeyboard-config-2.43-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_write_config: Succeeded
NOTE: Running task 1907 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_write_config)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1908 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 1909 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe qemu-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1910 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.1.1.bb:do_unpack)
NOTE: recipe libsdl2-2.30.8-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: Running task 1911 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb:do_patch)
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_install: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_write_config: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.8.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_write_config: Succeeded
NOTE: recipe qemu-9.1.1-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_patch: Started
NOTE: recipe libslirp-4.8.0-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 2141 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe libslirp-4.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libsdl2-2.30.8-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2215 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_patch)
NOTE: Running task 2217 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.8.bb:do_generate_toolchain_file)
NOTE: Running task 2219 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_patch)
NOTE: recipe libslirp-4.8.0-r0: task do_patch: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe virglrenderer-1.0.1-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe libsdl2-2.30.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2302 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe libslirp-4.8.0-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe virglrenderer-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1232 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1234 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_install: Succeeded
NOTE: Running task 2318 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_populate_sysroot)
NOTE: Running task 2319 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_package)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_populate_sysroot: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_populate_sysroot unihash changed to b4d8fbaee18f98cf753e25535bcbc5244327e610e03c1a47fb33180c14d03116
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2494 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2530 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2603 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2620 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2690 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2693 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2735 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2800 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2801 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_collect_spdx_deps)
NOTE: Running task 2805 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2806 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2807 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2876 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2886 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2888 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_configure)
NOTE: Running task 2902 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: Running task 2923 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2924 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2954 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: Running task 2960 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2961 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: Running task 2962 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_configure)
NOTE: Running task 2963 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2964 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: Running task 2965 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.43-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2967 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_configure: Started
NOTE: Running task 2968 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.23.1-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_package: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2980 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_package unihash changed to b25929977b111c991e89c6dac04a7ce9f1af5e5f0848378a9edd8414e0eda9c2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata became valid
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 1235 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2981 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2982 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Started
NOTE: Running task 2983 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Started
NOTE: Running task 2984 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa)
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2986 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: Running task 2987 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_create_spdx)
NOTE: recipe wayland-protocols-1.38-r0: task do_create_spdx: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 2988 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe dtc-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2989 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_compile)
NOTE: recipe dtc-1.7.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 2990 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2992 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Succeeded
NOTE: Running task 2993 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_compile)
NOTE: recipe xkeyboard-config-2.43-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: Running task 2996 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 2997 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk unihash changed to 60161406596ecbe8d7f77ac4b4703851882cbbdfc8eeb63c1f04cfb09abced59
NOTE: recipe dtc-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_install)
NOTE: recipe dtc-1.7.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2999 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Succeeded
NOTE: Running task 3000 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3001 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Started
NOTE: Running task 3003 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: Running task 3004 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3005 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.43-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot unihash changed to e270afb72a9a2dcb9b42c69fd5194efcb56e3981b9b3a985ee3ec32d9b42e84d
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3007 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe xkeyboard-config-2.43-r0: task do_install: Started
NOTE: Running task 3008 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile)
NOTE: recipe wayland-1.23.1-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Running task 3009 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot unihash changed to 03bd5d38ec57def26ab9c1f93a766eba780fccd1a6509c8b4d5bf246226e5872
NOTE: Running task 3010 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to f37d88149cd77b2bc8ce248c6d95ead6f38b6254d758038896b20439d5642bf6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot became valid
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: Running setscene task 1146 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_install: Succeeded
NOTE: Running setscene task 1150 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to d88fcf390b34fa0df60ca5a15488fd4269127d2f909e89a0970e67f28d416fbc
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1164 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package unihash changed to 4b2774e6f7d6185568c54385901f8d1e8c56ff871e238877746e3ae5c950834c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata became valid
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1194 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1226 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3011 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.23.1-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3012 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile_ptest_base)
NOTE: Running task 3013 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_populate_sysroot)
NOTE: recipe qemu-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 3014 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.1.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 1228 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Started
NOTE: recipe dtc-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe qemu-9.1.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_install: Succeeded
NOTE: Running task 3015 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1229 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 3016 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot)
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa unihash changed to f6323b7851382cd4ea950c3b248d957f85711bdfb9dbdb83848cce39437fe6fc
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3018 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3019 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.23.1-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1231 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_populate_sysroot unihash changed to 4c81abe0c27d2b40c523c40a9a2d972ed0e424827c7c513a4b864c4676a2122e
NOTE: Running task 3020 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_package: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb unihash changed to 143b4a1799ba6970d430ea6ef341b604f063b163814b7ec249f5f5e2c0db2150
NOTE: Running task 3021 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3022 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Running task 3023 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.123-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 1ad5f4f66b14b232fcd1e429dbb901ed7e08c8d8bad685c3bbdad30307d12a95
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package unihash changed to e1296878d61f0c095e6f4b44722c498878fb94d49aeee44a9058c820fa1e9ee5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 1b391680c21ec521c374c47d6b8bffd65d1343ea7da9d758ff2da0f233e78709
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot unihash changed to b767e36bf809eb542e05a0905fc048942264cbce7bbbeb7fb68dda2f23493af6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata became valid
NOTE: recipe dtc-1.7.0-r0: task do_package: Started
NOTE: Running setscene task 1138 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1159 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1161 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1163 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1204 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1206 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package_setscene)
NOTE: recipe qemu-9.1.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1207 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1208 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package_setscene)
NOTE: Running task 3025 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_9.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_package_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1209 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-9.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_install: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: Running task 3026 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install_ptest_base)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package_setscene: Started
NOTE: Running setscene task 1211 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: recipe qemu-9.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3028 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: Running task 3029 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1212 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3031 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot)
NOTE: Running task 3032 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3033 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1213 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_package: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 1214 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1215 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1217 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_package unihash changed to 4caf413b21afce9fe4cea9b2e17c7f9606ce8fe2bee9572833652b58563d75d9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_packagedata became valid
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot unihash changed to fd1223546631b79ae06156e3b2dfe023167479c36dbb01cd6020d0f69296ee81
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1210 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_configure: Succeeded
NOTE: Running task 3034 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_compile)
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3036 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.123-r0: task do_compile: Started
NOTE: recipe dtc-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1219 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1220 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: Running setscene task 1222 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1223 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1224 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1225 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package unihash changed to 466b9c3fa0e8cd2c4fa397a07b327d26a23e31c04f44b5c762caf0f2f704deca
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_package became valid
NOTE: Running setscene task 1219 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1224 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_package_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_install)
NOTE: recipe libdrm-2.4.123-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1225 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1226 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1227 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_package: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package unihash changed to 757b3fb2154aba5d6d05e411bff1553324724b6676f5577447c8f280ff98938c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata became valid
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1227 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3039 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3041 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_create_spdx)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm unihash changed to 325c6b656934d103ce684797e2f685060ab4322e2febbf36644445472cb18f49
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.123-r0: task do_install: Succeeded
NOTE: Running task 3042 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot)
NOTE: Running task 3043 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_package)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.123-r0: task do_package: Started
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot unihash changed to cf548d1471779277d1adaa49b5b2e5fdec75758ea6412f5e353bb0006956f4b5
NOTE: recipe xkeyboard-config-2.43-r0: task do_create_spdx: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3044 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1229 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1231 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1233 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Running setscene task 1234 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_package unihash changed to bf5dbdd324ef32b949b8fc5e69165ab140afe7303ff457656c0c55dc7d414890
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata became valid
NOTE: Running setscene task 1234 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: Running task 3050 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Running task 3111 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3122 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3124 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1235 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 3133 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 3134 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3144 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3171 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3173 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3174 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 3175 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot unihash changed to 0590c8c55ff330ecbef3e786ec4382d631f47ddbb934dd5562d82a3da145a47c
NOTE: Setscene tasks completed
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3176 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3177 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3178 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 3179 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3180 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3181 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package unihash changed to 4a2eb0d98018dc56edf15a7cb0821d6c80a27c7068bc971047ee72e2245139bc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata became valid
NOTE: Running setscene task 1235 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3182 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3184 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 3185 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3186 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_collect_spdx_deps)
NOTE: Running task 3187 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3188 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_configure: Succeeded
NOTE: Running task 3189 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_configure_ptest_base: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3190 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3191 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3192 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3193 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: Running task 3194 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3195 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3196 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3197 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: Running task 3198 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: Running task 3199 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3200 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3201 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 3202 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 3203 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3204 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_install)
NOTE: Running task 3205 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3206 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 3207 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3208 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3209 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3210 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3211 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 3212 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_package)
NOTE: Running task 3213 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_collect_spdx_deps)
NOTE: Running task 3214 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3215 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3216 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3217 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3218 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot unihash changed to 9eabd721bb33d038d23a0d8a5328485c54b55ee2f74709194dd7732cf8963ca2
NOTE: Setscene tasks completed
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3219 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_package unihash changed to 42c9862c4d1f55190ac54a0df092917963dee3cf7f06e679aabb66c7784c7a0c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 1235 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3222 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3223 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 9ce848083e94950be4a99511b6bc87dc924c1d17361a52b415f72b59c7c7c5c8
NOTE: Setscene tasks completed
NOTE: Running task 3224 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_compile: Succeeded
NOTE: Running task 3225 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3226 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_install: Succeeded
NOTE: Running task 3227 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3228 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_populate_sysroot unihash changed to 3874b15331eca76ada7ff1e215743196b6a076dc17575f3155c9975aa637cf92
NOTE: Setscene tasks completed
NOTE: Running task 3229 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3230 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3231 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3232 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_configure: Succeeded
NOTE: Running task 3233 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_compile: Succeeded
NOTE: Running task 3234 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_install)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_install: Succeeded
NOTE: Running task 3235 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot)
NOTE: Running task 3236 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_package)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot unihash changed to b851049ddddfe91420c1e2c9659ce32db149eab24225b4be87aae9ed706e7e30
NOTE: Setscene tasks completed
NOTE: Running task 3237 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3238 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_package unihash changed to e353b0776f3cbf4b83bfb230dd82917667d3f1fa875d8ae2658d731e93778fc5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata became valid
NOTE: Running setscene task 1235 of 1235 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3240 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3241 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3242 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3243 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_compile: Succeeded
NOTE: Running task 3244 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3245 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_install: Succeeded
NOTE: Running task 3246 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3247 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot)
NOTE: Running task 3248 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3249 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3250 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3251 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3252 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3253 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure)
NOTE: recipe libslirp-4.8.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3254 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe libslirp-4.8.0-r0: task do_configure: Succeeded
NOTE: Running task 3255 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_compile)
NOTE: recipe libslirp-4.8.0-r0: task do_compile: Started
NOTE: recipe libslirp-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 3256 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_install)
NOTE: recipe libslirp-4.8.0-r0: task do_install: Started
NOTE: recipe libslirp-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 3257 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 3258 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 3259 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 3260 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 3261 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3262 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3263 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3264 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package: Succeeded
NOTE: Running task 3265 of 3387 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata: Failed
NOTE: recipe dbus-1.14.10-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3265 tasks of which 2919 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241115165406.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241115165406.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.82.1/temp/log.do_packagedata.793449
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.82.2-r0 to 1:2.82.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.82.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.82.1/temp/log.do_packagedata.793449
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata) failed with exit code '1'

--===============4797324426528448769==--

