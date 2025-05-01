Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73116C3ABB7
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1801.1746113610926977850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TXwijRN8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UyDgxh/+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7b3faa-4ea3450b-c8f0-44f1-85ea-ff4c3b945db6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iIMwQzaMYCz5fhIgEEgCPZjLcgOOxwga6o5QgxI5Sro=;
	b=TXwijRN8ypqU+lcdnZrrMriOm4R+aYaZJwQcNUzlaERey44jrk3P6iEdxZaS40sh
	8OZY6+5ew790kmmJZgRCyqVZyWUCfrAhrQ1IumQLchOcheuS6xPHVBTXIWu/oHOqqN2
	HhLUYRyWTbZRCyhzlsLn9N3ivtX30T3cURcRZOjE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iIMwQzaMYCz5fhIgEEgCPZjLcgOOxwga6o5QgxI5Sro=;
	b=UyDgxh/++84z+V2gTlPotyqnP9es2ALaGyFZP1+JbZxSc3LWKItvKzXXhRqPNe/t
	ZFwDyxt71p/GrXKhMiAffftcpdV8XqgqFSY44qnGvrLX1NRHWeNRg4dPeUsmybrkVMi
	eIFvlu3MUfGwKvsSrb3Lxb5g3+7SsFKcqrTswI0E=
Content-Type: multipart/mixed; boundary="===============7286123539665891835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu-native,qemu: upgrading to
 10.0.0,10.0.0,10.0.0 SUCCEEDED
Message-ID: <010101968c7b3faa-4ea3450b-c8f0-44f1-85ea-ff4c3b945db6-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215783

--===============7286123539665891835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu-native,qemu* to *10.0.0,10.0.0,10.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-system-native-qemu-native-qemu-upgrade-9.2.3-10.patch
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
From 5f92a7c99a2e97a1228e4cde6d322d9db6dd010b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 06:15:57 +0000
Subject: [PATCH] qemu-system-native,qemu-native,qemu: upgrade 9.2.3 ->
 10.0.0,9.2.3 -> 10.0.0,9.2.3 -> 10.0.0

---
 .../qemu/{qemu-native_9.2.3.bb => qemu-native_10.0.0.bb}    | 0
 ...-system-native_9.2.3.bb => qemu-system-native_10.0.0.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                         | 2 +-
 ...mu-Add-addition-environment-space-to-boot-loader-q.patch | 6 +++---
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch      | 6 +++---
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch  | 6 +++---
 ...mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 6 +++---
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch             | 2 +-
 ...sts-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch    | 6 +++---
 ...mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 6 +++---
 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch   | 6 +++---
 .../recipes-devtools/qemu/{qemu_9.2.3.bb => qemu_10.0.0.bb} | 0
 14 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.2.3.bb => qemu-native_10.0.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.2.3.bb => qemu-system-native_10.0.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_9.2.3.bb => qemu_10.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.2.3.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 048266f5f6..748625a4c2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "baed494270c361bf69816acc84512e3efed71c7a23f76691642b80bc3de7693e"
+SRC_URI[sha256sum] = "22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 7ca79b0e0b..e7e816dbfa 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 29dce25c090792e360a1c1ff081af25d63d7df29 Mon Sep 17 00:00:00 2001
+From 41b238e15df84a4181a2b39cfbcc52a08f9fdbba Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 198da5ba3..736bf0999 100644
+index 8e9cea70b..2268a8b61 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -64,7 +64,7 @@
+@@ -65,7 +65,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 292c542442..566079f8ad 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From e069c66ccf29fb13ef5938b68f5362737b64d638 Mon Sep 17 00:00:00 2001
+From 70697264fc5aa9679c5f1cdcb590252254c44983 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -29,10 +29,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 4186c57b3..43cd805a9 100644
+index d18c1dbf2..45dde1fc5 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -759,7 +759,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+@@ -758,7 +758,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index ecfddfc0e1..de22516e1d 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 24e16b32dd0a4136ac30f8e2d48e266892814de6 Mon Sep 17 00:00:00 2001
+From 09936dc09b577448d354e82919829ef6a809dc94 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 549e39e19..439c7beb0 100644
+index 8bfe4912e..d04984f66 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -116,7 +116,9 @@
+@@ -118,7 +118,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 0e22a4fd86..9e5dceb566 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From ef7497674b2d41cffcb90f36bfe145c4951a03ba Mon Sep 17 00:00:00 2001
+From 8ab2b722da7868c507cfdd67ae6d535c8ba36f53 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
@@ -22,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index e4bf5d5f3..04d920c11 100644
+index d1f36e6f1..26ccf8f4d 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1105,12 +1105,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1108,12 +1108,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 33de959fa4..2bf9baf7ea 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From b0862cf4fecc11a181bc8c6602c7d09812148249 Mon Sep 17 00:00:00 2001
+From 30d463f09142faa745a8756df95a2ff6434c2335 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 335d50be46..9cf1a52259 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 7bce3a9379b09dfa7d24a377a9f7f1c6a2f8bdde Mon Sep 17 00:00:00 2001
+From 8536e8cce199eec6e8c403c4a7ca95a7fb55e1cf Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 3f81154dbf..0f8cf06eae 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 2c2fde4042578ee29714a6421c33e00c4301d744 Mon Sep 17 00:00:00 2001
+From aa00914a01cc969f6061097cc8e597b528465ad6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 4a777dee52..073b868f47 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From b3435faf13837f487231a01c2dca45a260ae323c Mon Sep 17 00:00:00 2001
+From 9067e464685cb503d58a07520769a49c5f9f2e47 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index 18336376b..2b014b97c 100755
+index 02f1dd231..2c5ecd346 100755
 --- a/configure
 +++ b/configure
-@@ -1002,12 +1002,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -983,12 +983,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index f949206717..d2d35083ec 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 81b55a014b2e5f0863a5a3fd584168c9d4ce9eb8 Mon Sep 17 00:00:00 2001
+From e0ae1256317af5157c44b7a56e045c3dbee8c923 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 2b014b97c..45dc8b146 100755
+index 2c5ecd346..5315ede35 100755
 --- a/configure
 +++ b/configure
-@@ -988,14 +988,14 @@ python="$(command -v "$python")"
+@@ -969,14 +969,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index ca667692b0..4451c5d52f 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 6e5a6d44950c48957f3906294b8efd6a76b91576 Mon Sep 17 00:00:00 2001
+From 0d201513f96e79a7640933205072c5704b2727e0 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index c53ca1f76..3c67129ef 100644
+index 0f4997a91..4559d0fac 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1870,8 +1870,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1885,8 +1885,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_9.2.3.bb b/meta/recipes-devtools/qemu/qemu_10.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.2.3.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.0.bb
-- 
2.47.1


--===============7286123539665891835==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-system-native-qemu-native-qemu-upgrade-9.2.3-10.patch"

RnJvbSA1ZjkyYTdjOTlhMmU5N2ExMjI4ZTRjZGU2ZDMyMmQ5ZGI2ZGQwMTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNjoxNTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtc3lzdGVtLW5hdGl2ZSxxZW11LW5hdGl2ZSxxZW11OiB1cGdyYWRlIDkuMi4zIC0+CiAxMC4w
LjAsOS4yLjMgLT4gMTAuMC4wLDkuMi4zIC0+IDEwLjAuMAoKLS0tCiAuLi4vcWVtdS97cWVtdS1u
YXRpdmVfOS4yLjMuYmIgPT4gcWVtdS1uYXRpdmVfMTAuMC4wLmJifSAgICB8IDAKIC4uLi1zeXN0
ZW0tbmF0aXZlXzkuMi4zLmJiID0+IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjAuYmJ9IHwgMAog
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAuLi5tdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1s
b2FkZXItcS5wYXRjaCB8IDYgKysrLS0tCiAuLi4vcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1m
YWxsdGhyb3VnaC10by1QSUMucGF0Y2ggICAgICB8IDYgKysrLS0tCiAuLi4vcWVtdS8wMDA0LXFl
bXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoICB8IDYgKysrLS0tCiAu
Li5tdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRj
aCB8IDYgKysrLS0tCiAuLi4vcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5w
YXRjaCAgICAgICAgICAgICB8IDIgKy0KIC4uLnN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUt
cGF0aC10by1yZWZlci10by1maWxlLnBhdGNoIHwgMiArLQogLi4uZmluZS1NQVBfU1lOQy1hbmQt
TUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggfCAyICstCiAuLi4vMDAxMC1j
b25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaCAgICB8IDYgKysr
LS0tCiAuLi5tdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9y
LS5wYXRjaCB8IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1z
dHJlcnJvcm5hbWVfbnAucGF0Y2ggICB8IDYgKysrLS0tCiAuLi4vcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3txZW11XzkuMi4zLmJiID0+IHFlbXVfMTAuMC4wLmJifSB8IDAKIDE0IGZpbGVzIGNoYW5n
ZWQsIDI1IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3txZW11LW5hdGl2ZV85LjIuMy5iYiA9PiBxZW11LW5hdGl2ZV8xMC4w
LjAuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LXN5
c3RlbS1uYXRpdmVfOS4yLjMuYmIgPT4gcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuMC5iYn0gKDEw
MCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXVfOS4yLjMuYmIgPT4g
cWVtdV8xMC4wLjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUtbmF0aXZlXzkuMi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS1uYXRpdmVfMTAuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV85LjIuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMC4wLmJiCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfOS4yLjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfOS4yLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjAuYmIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS5pbmMKaW5kZXggMDQ4MjY2ZjVmNi4uNzQ4NjI1YTRjMiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKQEAgLTM4LDcgKzM4LDcgQEAgU1JDX1VSSSA9ICJodHRw
czovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vd3d3LnFlbXUub3JnIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImJhZWQ0OTQyNzBjMzYxYmY2OTgxNmFjYzg0NTEyZTNlZmVkNzFjN2EyM2Y3NjY5MTY0MmI4MGJj
M2RlNzY5M2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjJjMDc1NjAxZmRjZjhjN2IyNjcxYTgz
OWViZGNlZjFkNGYyOTczZWI2NzM1MjU0ZmQyZTFiZDBmMzBiMzg5NiIKIAogQ1ZFX1NUQVRVU1tD
VkUtMjAwNy0wOTk4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoZSBWTkMgc2VydmVyIGNh
biBleHBvc2UgaG9zdCBmaWxlcyB1ZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcy4gV2UgZG9uJ3QgZW5h
YmxlIGl0IGJ5IGRlZmF1bHQuIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9v
dC1sb2FkZXItcS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1x
ZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNo
CmluZGV4IDdjYTc5YjBlMGIuLmU3ZTgxNmRiZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFj
ZS10by1ib290LWxvYWRlci1xLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxv
YWRlci1xLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyOWRjZTI1YzA5MDc5MmUzNjBhMWMx
ZmYwODFhZjI1ZDYzZDdkZjI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MWIyMzhl
MTVkZjg0YTQxODFhMmIzOWNmYmNjNTJhMDhmOWZkYmJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSmFzb24gV2Vzc2VsIDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNvbT4KIERhdGU6
IEZyaSwgMjggTWFyIDIwMTQgMTc6NDI6NDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTog
QWRkIGFkZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJvb3QgbG9hZGVyCkBAIC0xOCwxMCAr
MTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2ZXIuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvaHcvbWlwcy9tYWx0YS5jIGIvaHcvbWlwcy9tYWx0YS5jCi1pbmRleCAxOThkYTVi
YTMuLjczNmJmMDk5OSAxMDA2NDQKK2luZGV4IDhlOWNlYTcwYi4uMjI2OGE4YjYxIDEwMDY0NAog
LS0tIGEvaHcvbWlwcy9tYWx0YS5jCiArKysgYi9ody9taXBzL21hbHRhLmMKLUBAIC02NCw3ICs2
NCw3IEBACitAQCAtNjUsNyArNjUsNyBAQAogICNkZWZpbmUgRU5WUF9QQUREUiAgICAgICAgICAw
eDIwMDAKICAjZGVmaW5lIEVOVlBfVkFERFIgICAgICAgICAgY3B1X21pcHNfcGh5c190b19rc2Vn
MChOVUxMLCBFTlZQX1BBRERSKQogICNkZWZpbmUgRU5WUF9OQl9FTlRSSUVTICAgICAxNgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAt
ZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoCmluZGV4IDI5MmM1NDI0
NDIuLjU2NjA3OWY4YWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1Q
SUMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUwNjljNjZjY2YyOWZiMTNlZjU5MzhiNjhm
NTM2MjczN2I2NGQ2MzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcwNjk3MjY0ZmM1
YWE5Njc5YzVmMWNkY2I1OTAyNTIyNTRjNDQ5ODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBNYXJrIEFzc2Vsc3RpbmUgPG1hcmsuYXNzZWxzdGluZUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVHVlLCAyNiBGZWIgMjAxMyAxMTo0MzoyOCAtMDUwMAogU3ViamVjdDogW1BBVENIXSBhcGlj
OiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKQEAgLTI5LDEwICsyOSwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvaHcvaW50Yy9hcGljLmMg
Yi9ody9pbnRjL2FwaWMuYwotaW5kZXggNDE4NmM1N2IzLi40M2NkODA1YTkgMTAwNjQ0CitpbmRl
eCBkMThjMWRiZjIuLjQ1ZGRlMWZjNSAxMDA2NDQKIC0tLSBhL2h3L2ludGMvYXBpYy5jCiArKysg
Yi9ody9pbnRjL2FwaWMuYwotQEAgLTc1OSw3ICs3NTksNyBAQCBpbnQgYXBpY19hY2NlcHRfcGlj
X2ludHIoRGV2aWNlU3RhdGUgKmRldikKK0BAIC03NTgsNyArNzU4LDcgQEAgaW50IGFwaWNfYWNj
ZXB0X3BpY19pbnRyKERldmljZVN0YXRlICpkZXYpCiAgICAgIEFQSUNDb21tb25TdGF0ZSAqcyA9
IEFQSUMoZGV2KTsKICAgICAgdWludDMyX3QgbHZ0MDsKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYt
bm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1x
ZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaAppbmRleCBlY2ZkZGZj
MGUxLi5kZTIyNTE2ZTFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1
ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNGUxNmIz
MmRkMGE0MTM2YWMzMGY4ZTJkNDhlMjY2ODkyODE0ZGU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAwOTkzNmRjMDliNTc3NDQ4ZDM1NGU4MjkxOTgyOWVmNmE4MDlkYzk0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3NpeSBPYml0b3Rza3l5IDxvb2JpdG90c0BjaXNj
by5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIwIDIxOjIxOjM1ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90IGV4aXN0cwpAQCAtMTYsMTAg
KzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFNha2liIFNhamFsIDxzYWtpYi5zYWphbEB3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBh
L2xpbnV4LXVzZXIvc3lzY2FsbC5jIGIvbGludXgtdXNlci9zeXNjYWxsLmMKLWluZGV4IDU0OWUz
OWUxOS4uNDM5YzdiZWIwIDEwMDY0NAoraW5kZXggOGJmZTQ5MTJlLi5kMDQ5ODRmNjYgMTAwNjQ0
CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9zeXNjYWxsLmMK
LUBAIC0xMTYsNyArMTE2LDkgQEAKK0BAIC0xMTgsNyArMTE4LDkgQEAKICAjaW5jbHVkZSA8bGlu
dXgvYmxrcGcuaD4KICAjaW5jbHVkZSA8bmV0cGFja2V0L3BhY2tldC5oPgogICNpbmNsdWRlIDxs
aW51eC9uZXRsaW5rLmg+CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3Mt
bXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFk
ZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCmluZGV4
IDBlMjJhNGZkODYuLjllNWRjZWI1NjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8t
YWRkcmVzcy1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNs
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlZjc0OTc2NzRiMmQ0MWNmZmNiOTBmMzZiZmUx
NDVjNDk1MWEwM2JhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YWIyYjcyMmRhNzg2
OGM1MDdjZmRkNjdhZTZkNTM1YzhiYTM2ZjUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBE
YXRlOiBGcmksIDggSmFuIDIwMjEgMTc6Mjc6MDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVt
dTogQWRkIHNvbWUgdXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBhZGRyZXNzIG11c2wgMzIgYml0
CkBAIC0yMiwxMCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcKICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9tbWFwLmMg
Yi9saW51eC11c2VyL21tYXAuYwotaW5kZXggZTRiZjVkNWYzLi4wNGQ5MjBjMTEgMTAwNjQ0Citp
bmRleCBkMWYzNmU2ZjEuLjI2Y2NmOGY0ZCAxMDA2NDQKIC0tLSBhL2xpbnV4LXVzZXIvbW1hcC5j
CiArKysgYi9saW51eC11c2VyL21tYXAuYwotQEAgLTExMDUsMTIgKzExMDUsMTYgQEAgYWJpX2xv
bmcgdGFyZ2V0X21yZW1hcChhYmlfdWxvbmcgb2xkX2FkZHIsIGFiaV91bG9uZyBvbGRfc2l6ZSwK
K0BAIC0xMTA4LDEyICsxMTA4LDE2IEBAIGFiaV9sb25nIHRhcmdldF9tcmVtYXAoYWJpX3Vsb25n
IG9sZF9hZGRyLCBhYmlfdWxvbmcgb2xkX3NpemUsCiAgICAgIGludCBwcm90OwogICAgICB2b2lk
ICpob3N0X2FkZHI7CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCmluZGV4IDMz
ZGU5NTlmYTQuLjJiZjliYWY3ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiMDg2MmNmNGZlY2MxMWExODFiYzhjNjYwMmM3ZDA5ODEy
MTQ4MjQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMGQ0NjNmMDkxNDJmYWE3NDVh
ODc1NmRmOTVhMmZmNjQzNGMyMzM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBN
b24sIDEgTWFyIDIwMjEgMTM6MDA6NDcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogRGV0
ZXJtaW5pc20gZml4ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1m
aWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1l
c29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKaW5kZXgg
MzM1ZDUwYmU0Ni4uOWNmMWE1MjI1OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJl
ZmVyLXRvLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdiY2UzYTkzNzliMDlkZmE3ZDI0YTM3N2E5Zjdm
MWM2YTJmOGJkZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg1MzZlOGNjZTE5OWVl
YzZlOGM0MDNjNGE3Y2E5NWE3ZmI1NWUxY2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAx
NCBKYW4gMjAyMSAwNjozMzowNCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9tZXNvbi5i
dWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIgdG8gZmlsZXMKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1B
UF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFU
RS1vbi1uZWVkZWQtbGkucGF0Y2gKaW5kZXggM2Y4MTE1NGRiZi4uMGY4Y2YwNmVhZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lO
Qy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NI
QVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJj
MmZkZTQwNDI1NzhlZTI5NzE0YTY0MjFjMzNlMDBjNDMwMWQ3NDQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGFhMDA5MTRhMDFjYzk2OWY2MDYxMDk3Y2M4ZTU5N2I1Mjg0NjVhZDYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogTW9uLCAyMSBNYXIgMjAyMiAxMDowOTozOCAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURfVkFMSURBVEUgb24gbmVlZGVkIGxpbnV4
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmln
dXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1m
cm9tLVBBVEgucGF0Y2gKaW5kZXggNGE3NzdkZWU1Mi4uMDczYjg2OGY0NyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVz
b24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjM0MzVmYWYxMzgzN2Y0ODcyMzFhMDFjMmRjYTQ1
YTI2MGFlMzIzYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTA2N2U0NjQ2ODVjYjUw
M2Q1OGEwNzUyMDc2OWE0OWM1ZjlmMmU0NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9QjhsbD89IDxtYXJ0aW5AZ2Vhbml4LmNvbT4K
IERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTQ6MDI6NTUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
Y29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUgZnJvbSBQQVRICkBAIC05LDEwICs5LDEw
IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbd29ya2Fyb3VuZCwgd291bGQgbmVl
ZCBhIHJlYWwgZml4IGZvciB1cHN0cmVhbV0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUK
LWluZGV4IDE4MzM2Mzc2Yi4uMmIwMTRiOTdjIDEwMDc1NQoraW5kZXggMDJmMWRkMjMxLi4yYzVl
Y2QzNDYgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTEwMDIs
MTIgKzEwMDIsNyBAQCBta3ZlbnY9IiRweXRob24gJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3Njcmlw
dHMvbWt2ZW52LnB5IgorQEAgLTk4MywxMiArOTgzLDcgQEAgbWt2ZW52PSIkcHl0aG9uICR7c291
cmNlX3BhdGh9L3B5dGhvbi9zY3JpcHRzL21rdmVudi5weSIKICAkbWt2ZW52IGVuc3VyZWdyb3Vw
IC0tZGlyICIke3NvdXJjZV9wYXRofS9weXRob24vd2hlZWxzIiBcCiAgICAgICAke3NvdXJjZV9w
YXRofS9weXRob25kZXBzLnRvbWwgbWVzb24gfHwgZXhpdCAxCiAgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUt
cHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVu
LXQtdXNlZC1mb3ItLnBhdGNoCmluZGV4IGY5NDkyMDY3MTcuLmQyZDM1MDgzZWMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAt
YW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRo
b24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4MWI1
NWEwMTRiMmU1ZjA4NjNhNWEzZmQ1ODQxNjhjOWQ0Y2U5ZWI4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlMGFlMTI1NjMxN2FmNTE1N2M0NGI3YTU2ZTA0NWMzZGJlZThjOTIzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDEzOjU4OjIzICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IEVuc3VyZSBwaXAgYW5kIHRoZSBweXRob24gdmVu
diBhcmVuJ3QgdXNlZCBmb3IgbWVzb24KQEAgLTI5LDEwICsyOSwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCAyYjAxNGI5N2MuLjQ1ZGM4YjE0NiAx
MDA3NTUKK2luZGV4IDJjNWVjZDM0Ni4uNTMxNWVkZTM1IDEwMDc1NQogLS0tIGEvY29uZmlndXJl
CiArKysgYi9jb25maWd1cmUKLUBAIC05ODgsMTQgKzk4OCwxNCBAQCBweXRob249IiQoY29tbWFu
ZCAtdiAiJHB5dGhvbiIpIgorQEAgLTk2OSwxNCArOTY5LDE0IEBAIHB5dGhvbj0iJChjb21tYW5k
IC12ICIkcHl0aG9uIikiCiAgZWNobyAicHl0aG9uIGRldGVybWluZWQgdG8gYmUgJyRweXRob24n
IgogIGVjaG8gInB5dGhvbiB2ZXJzaW9uOiAkKCRweXRob24gLS12ZXJzaW9uKSIKICAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9u
cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFt
ZV9ucC5wYXRjaAppbmRleCBjYTY2NzY5MmIwLi40NDUxYzVkNTJmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZTVhNmQ0NDk1MGM0ODk1N2YzOTA2Mjk0YjhlZmQ2
YTc2YjkxNTc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZDIwMTUxM2Y5NmU3OWE3
NjQwOTMzMjA1MDcyYzU3MDRiMjcyN2UwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
TmF0YW5hZWwgQ29wYSA8bmNvcGFAYWxwaW5lbGludXgub3JnPgogRGF0ZTogV2VkLCAxOCBTZXAg
MjAyNCAxNjoxOTozNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0YXJnZXQvcmlzY3Yva3ZtOiBk
byBub3QgdXNlIG5vbi1wb3J0YWJsZSBzdHJlcnJvcm5hbWVfbnAoKQpAQCAtMjAsMTAgKzIwLDEw
IEBAIFNpZ25lZC1vZmYtYnk6IE5hdGFuYWVsIENvcGEgPG5jb3BhQGFscGluZWxpbnV4Lm9yZz4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS90YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYyBiL3RhcmdldC9yaXNjdi9rdm0va3Zt
LWNwdS5jCi1pbmRleCBjNTNjYTFmNzYuLjNjNjcxMjllZiAxMDA2NDQKK2luZGV4IDBmNDk5N2E5
MS4uNDU1OWQwZmFjIDEwMDY0NAogLS0tIGEvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMKICsr
KyBiL3RhcmdldC9yaXNjdi9rdm0va3ZtLWNwdS5jCi1AQCAtMTg3MCw4ICsxODcwLDcgQEAgc3Rh
dGljIGJvb2wga3ZtX2NwdV9yZWFsaXplKENQVVN0YXRlICpjcywgRXJyb3IgKiplcnJwKQorQEAg
LTE4ODUsOCArMTg4NSw3IEBAIHN0YXRpYyBib29sIGt2bV9jcHVfcmVhbGl6ZShDUFVTdGF0ZSAq
Y3MsIEVycm9yICoqZXJycCkKICAgICAgaWYgKHJpc2N2X2hhc19leHQoJmNwdS0+ZW52LCBSVlYp
KSB7CiAgICAgICAgICByZXQgPSBwcmN0bChQUl9SSVNDVl9WX1NFVF9DT05UUk9MLCBQUl9SSVND
Vl9WX1ZTVEFURV9DVFJMX09OKTsKICAgICAgICAgIGlmIChyZXQpIHsKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfOS4yLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11XzEwLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV85LjIuMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4wLjAuYmIKLS0gCjIuNDcuMQoK

--===============7286123539665891835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 125 recipes from the core2-64 sysroot...done.
Removing 132 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:f27032bb366856cffe4c87bc127a14b2f8522af1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 981 Local 743 Mirrors 0 Missed 238 Current 399 (75% match, 82% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 14 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 475 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 476 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 481 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 489 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 516 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 518 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 564 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libsdl2-2.32.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsdl2-native-2.32.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 583 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 587 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsdl2-2.32.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 588 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-10.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 594 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsdl2-native-2.32.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 600 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 603 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 605 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 608 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 609 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-2.32.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 610 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 613 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-native-1.42-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 616 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-2.32.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 628 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 631 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 636 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-native-1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 639 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 640 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 641 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 645 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-native-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 663 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-native-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 665 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 676 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-native-1_1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 682 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-native-1_1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 700 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 709 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 717 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 724 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 731 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libslirp-4.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libslirp-4.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 741 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 744 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 760 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 781 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 806 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 808 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 814 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-native-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ofono-2.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-native-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 820 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 822 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe ofono-2.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 827 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 829 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 838 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 839 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 850 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 851 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 858 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 868 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 874 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 876 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 879 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 881 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 885 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 887 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 888 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 1380 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 892 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 895 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 906 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 908 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 909 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 913 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 916 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 927 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 929 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.82-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 934 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 935 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 936 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 938 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.82-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 941 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 942 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 948 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 949 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 950 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 951 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 959 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 962 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 963 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 966 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 972 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 974 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 982 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 990 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 991 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 992 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 997 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 998 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1000 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1006 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1008 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1009 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1010 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1019 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1022 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1027 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.82-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1029 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1030 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.82-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1033 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1034 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1046 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1049 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1064 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1065 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1066 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1069 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1072 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1073 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1074 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1075 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1077 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1078 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1079 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1082 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1083 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1085 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1087 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1088 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1091 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1093 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1094 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1099 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1102 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1103 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1107 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1114 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1116 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1118 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1119 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1126 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1127 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1129 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1137 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1138 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1140 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1141 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1147 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1148 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1149 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1156 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1157 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1166 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1168 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1171 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1172 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1173 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1174 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1177 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1179 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1181 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1182 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1183 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1190 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1192 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1193 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1194 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1196 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1198 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1200 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1201 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1203 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1204 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1206 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1215 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1216 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1218 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1219 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1220 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1221 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1223 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1228 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1234 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1236 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1237 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1239 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1241 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1243 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1244 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1245 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1246 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1247 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1251 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1254 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1255 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1256 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1260 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1262 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1264 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1265 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1266 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1271 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1272 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1273 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1274 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1275 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1277 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux-libuuid/2.40.4/temp/log.do_packagedata_setscene.2788970
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1279 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1280 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1285 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1291 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1295 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1296 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1298 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1299 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1300 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1301 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1306 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1314 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1316 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1317 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1321 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1323 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1324 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1326 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1328 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1330 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1332 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1336 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1337 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1338 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1340 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1343 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1345 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 590 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 685 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 711 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1351 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running task 738 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1353 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1354 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 814 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 839 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1358 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1360 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 901 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_write_config)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 908 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Started
NOTE: Running task 965 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 969 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_fetch)
NOTE: Running task 971 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1036 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1039 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: Running setscene task 1361 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1367 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1043 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 1044 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_write_config)
NOTE: Running task 1051 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1064 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1110 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 1113 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1114 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1117 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1120 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1368 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1371 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1372 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1128 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1129 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: Running task 1132 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: Running task 1155 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1156 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1159 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1163 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1181 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: Running task 1184 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 1191 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: Running task 1194 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: Running task 1203 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: Running task 1206 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: Running task 1223 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: Running task 1231 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1232 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: Running task 1234 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: Running task 1235 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: Running task 1236 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1242 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: Running task 1258 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1274 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: Running task 1339 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: Running task 1342 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: Running task 1386 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 1389 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1437 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1444 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 1458 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: Running task 1466 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1471 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: Running task 1473 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: Running task 1476 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: Running task 1495 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1497 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_fetch)
NOTE: Running task 1499 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1519 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: Running task 1522 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1527 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: Running task 1533 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe bluez5-5.82-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: Running setscene task 1375 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1577 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: Running task 1603 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1605 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1618 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe bluez5-5.82-r0: task do_unpack: Started
NOTE: Running task 1639 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: Running task 1655 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1667 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: Running task 1680 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1683 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: Running task 1684 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: Running task 1686 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: Running task 1704 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running setscene task 1377 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_fetch: Started
NOTE: Running setscene task 1379 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 1726 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_patch)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1734 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1745 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1752 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1753 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: Running task 1754 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: Running task 1756 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_unpack)
NOTE: Running task 1779 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: Running task 1780 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1781 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: Running task 1782 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.124-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1956 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2065 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2188 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: Running task 2195 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_unpack: Succeeded
NOTE: Running task 2244 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2260 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata)
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 2268 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_patch)
NOTE: Running task 2303 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 2306 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: Running task 2316 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata: Started
NOTE: Running task 2333 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: Running task 2334 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_patch: Started
NOTE: Running task 2335 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2336 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.124-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: Running task 2338 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2339 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: Running task 2341 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_patch)
NOTE: Running task 2342 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: Running task 2343 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2344 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.124-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2370 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_patch: Succeeded
NOTE: Running task 2400 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2418 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 2425 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: Running task 2426 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2432 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_generate_toolchain_file)
NOTE: Running task 2433 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2453 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe wayland-protocols-1.42-r0: task do_write_config: Started
NOTE: Running task 2454 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2463 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe wayland-protocols-1.42-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2481 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2482 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_fetch)
NOTE: Running task 2484 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_configure)
NOTE: Running task 2486 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe libdrm-2.4.124-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure: Started
NOTE: Running task 2493 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: Running task 2502 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe ell-0.76-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_configure: Started
NOTE: recipe ell-0.76-r0: task do_fetch: Succeeded
NOTE: Running task 2503 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_fetch)
NOTE: Running task 2505 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2519 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.16-r0: task do_fetch: Started
NOTE: Running task 2520 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.16-r0: task do_fetch: Succeeded
NOTE: Running task 2532 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2533 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_fetch: Succeeded
NOTE: Running task 2540 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2545 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2546 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_unpack)
NOTE: recipe ell-0.76-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2547 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe ofono-2.16-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2549 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2550 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe ell-0.76-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2555 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.76-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 2560 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe ofono-2.16-r0: task do_unpack: Succeeded
NOTE: Running task 2566 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_patch)
NOTE: recipe ell-0.76-r0: task do_patch: Succeeded
NOTE: Running task 2575 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2576 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2578 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe ofono-2.16-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_write_config: Started
NOTE: recipe ofono-2.16-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 2582 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2583 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_fetch)
NOTE: Running task 2584 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe wayland-protocols-1.42-r0: task do_configure: Succeeded
NOTE: Running task 2593 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_fetch)
NOTE: Running task 2594 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_compile)
NOTE: recipe mesa-2_25.0.2-r0: task do_write_config: Succeeded
NOTE: Running task 2606 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_write_config)
NOTE: recipe libsdl2-2.32.4-r0: task do_fetch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Started
NOTE: Running task 2607 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Started
NOTE: recipe libsdl2-2.32.4-r0: task do_fetch: Succeeded
NOTE: Running task 2608 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.42-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2609 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2618 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: Running task 2619 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_fetch)
NOTE: recipe mesa-2_25.0.2-r0: task do_unpack: Started
NOTE: Running task 2620 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2621 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_fetch: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_fetch: Succeeded
NOTE: Running task 2622 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_fetch)
NOTE: Running task 2623 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libslirp-4.9.0-r0: task do_fetch: Started
NOTE: Running task 2624 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_compile: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2625 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 2626 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_install)
NOTE: recipe libslirp-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 2628 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: Running task 2631 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: Running task 2633 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.0.bb:do_recipe_qa)
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_install: Started
NOTE: Running task 2663 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_unpack)
NOTE: recipe libsdl2-2.32.4-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: Running task 2664 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe qemu-10.0.0-r0: task do_recipe_qa: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Started
NOTE: Running task 2667 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 2668 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe qemu-10.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2669 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.0.bb:do_fetch)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2671 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 2690 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe qemu-10.0.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libsdl2-2.32.4-r0: task do_unpack: Succeeded
NOTE: Running task 2692 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_patch)
NOTE: Running task 2693 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe qemu-10.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2697 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2698 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_patch)
NOTE: recipe libsdl2-2.32.4-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2699 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_unpack)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: Running task 2700 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_unpack)
NOTE: recipe libsdl2-2.32.4-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_unpack: Started
NOTE: Running task 2701 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_unpack)
NOTE: recipe wayland-protocols-1.42-r0: task do_install: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_unpack: Succeeded
NOTE: Running task 2702 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_patch)
NOTE: Running task 2703 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.9.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Started
NOTE: Running task 2714 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.0.bb:do_unpack)
NOTE: recipe pixman-1_0.44.2-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_populate_sysroot: Started
NOTE: recipe qemu-10.0.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure: Succeeded
NOTE: Running task 2715 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_configure_ptest_base)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_patch: Succeeded
NOTE: Running task 2716 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: Running task 2753 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2754 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: Running task 2755 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: Running task 2756 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe wayland-1.23.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2757 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2758 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2759 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe libslirp-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2760 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2761 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_populate_sysroot unihash changed to 0c0d44efb35b809c16b614143d6e844c04e023408c7542c47f0a98d82d12199c
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe libslirp-4.9.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_configure: Succeeded
NOTE: recipe libslirp-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2762 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: Running task 2763 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_patch)
NOTE: Running task 2771 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_write_config)
NOTE: Running task 2772 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to e6341805ebdbc60673830bfe63edea4bb9fb3e472a760f0485904b17de5efa07
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_unpack: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_compile: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_package: Started
NOTE: Running setscene task 1313 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1320 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1336 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1356 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 2773 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 2774 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1371 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_compile: Succeeded
NOTE: Running setscene task 1372 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2775 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: Running task 2776 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: Running task 2777 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 2778 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_compile_ptest_base)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2779 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: Running task 2780 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Started
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1374 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1375 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 2781 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: recipe mesa-2_25.0.2-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 1a4b1cf5eff3b1309d0472e3dac46af208a5033f4a2d0781b035f6ab58af218f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_package unihash changed to 175b062cbaad68a3aca7a7bf1aaeef3377b8cbf692126fff6a9a77d50445350e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata became valid
NOTE: Running setscene task 1329 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1332 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1334 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1344 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1345 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1349 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running task 2782 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install)
NOTE: Running task 2783 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 2785 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1350 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_rust_gen_targets: Started
NOTE: Running setscene task 1351 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1352 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1353 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: Running setscene task 1354 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: Running setscene task 1355 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2786 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running task 2787 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_collect_spdx_deps)
NOTE: Running task 2788 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2789 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to 27e68e70d3523e0a0e3e7c51e907baf95c93bb5398325ede9f491ea9cf51ad69
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot unihash changed to 9d8c3528e7695df297ff400a33f6a64498f9ea6708b0b9b2aa6c693e9b6b8c05
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 8aebbdb0b0fd5a6f7e4c11ee0817c3ac0307fbafe0642e418691bb74354caec9
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 1312 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running task 2790 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: Running task 2791 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_install_ptest_base)
NOTE: Running task 2792 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2793 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2794 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2811 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Started
NOTE: Running task 2814 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe libdrm-2.4.124-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: Running task 2815 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: Running setscene task 1359 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 1360 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1361 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running task 2816 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: Running task 2817 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: Running task 2818 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot)
NOTE: recipe pixman-1_0.44.2-r0: task do_write_config: Started
NOTE: Running task 2819 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: Running task 2820 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.44.2-r0: task do_write_config: Succeeded
NOTE: Running task 2821 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.0.bb:do_write_config)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.23.1-r0: task do_package: Started
NOTE: recipe libslirp-4.9.0-r0: task do_write_config: Started
NOTE: recipe libslirp-4.9.0-r0: task do_write_config: Succeeded
NOTE: Running task 2822 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_write_config)
NOTE: recipe libdrm-2.4.124-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1362 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running task 2833 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_configure)
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1363 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1364 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 2834 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_generate_toolchain_file)
NOTE: Running task 2835 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_configure: Started
NOTE: recipe libsdl2-2.32.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1365 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: recipe libsdl2-2.32.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1366 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot unihash changed to 7290f3785d4514600cf9650114bf59c8d578e650bcf94536be996407429fb3e3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot became valid
NOTE: recipe pixman-1_0.44.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 0a923c17f8deb5fb8794ca057300e8248face4cc89701d52907c1d65ea09c94f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 1322 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package_setscene)
NOTE: Running setscene task 1363 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1367 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running task 2836 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: Running task 2837 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2838 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: Running task 2839 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: Running task 2851 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: Running task 2879 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: Running task 2903 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Running task 2916 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 696cf6445e48de476915d6f94b93973f2d9cdc2c69e3d741ac31024de683f8ac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Started
NOTE: Running setscene task 1364 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1367 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1369 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running task 2928 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: Running task 2929 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2930 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2931 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1370 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2948 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: Running task 2976 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_unpack: Started
NOTE: recipe libsdl2-native-2.32.4-r0: task do_fetch: Started
NOTE: recipe libsdl2-native-2.32.4-r0: task do_fetch: Succeeded
NOTE: Running task 2991 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running task 2992 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2993 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot)
NOTE: Running task 2994 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2995 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot unihash changed to b09b14bd69a6ecdff43fb7db4bd81f0d6ebceec5bb7ea67fe4e0e005decf9daa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot became valid
NOTE: recipe libepoxy-native-1.5.10-r0: task do_patch: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: recipe qemu-10.0.0-r0: task do_unpack: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package unihash changed to 57427d9a871a8687c48d83337f06d6398ab077a5e81cb39a6289425d3e97e284
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot unihash changed to 02d2c0a92c853f7e3aa954d2011ab9de1f90cd48b3172d4f58d430f8b80c4f2d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_package unihash changed to f134ccc3b9a2634fbb469e961b1b53958761984d3180ea37e0eb448572dc23cd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_package became valid
NOTE: recipe libdrm-2.4.124-r0: task do_configure: Succeeded
NOTE: Running setscene task 1326 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1339 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1346 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1348 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2996 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2997 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.0.bb:do_patch)
NOTE: Running task 2999 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: Running task 3000 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3015 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_fetch)
NOTE: Running task 3017 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_unpack)
NOTE: recipe libdrm-2.4.124-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qemu-10.0.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1366 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_package_setscene)
NOTE: recipe libsdl2-native-2.32.4-r0: task do_unpack: Started
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_fetch: Started
NOTE: Running task 3043 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3044 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1367 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3068 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3069 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.44.2-r0: task do_configure: Succeeded
NOTE: Running task 3070 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3071 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1368 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsdl2-native-2.32.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_package_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_compile: Started
NOTE: Running setscene task 1369 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1370 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1371 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3072 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_configure)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.0.0-r0: task do_patch: Succeeded
NOTE: Running task 3073 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: Running task 3074 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-10.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: Running setscene task 1372 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3075 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: Running task 3077 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx)
NOTE: recipe libsdl2-native-2.32.4-r0: task do_patch: Started
NOTE: recipe libsdl2-native-2.32.4-r0: task do_patch: Succeeded
NOTE: Running task 3092 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_unpack)
NOTE: Running task 3098 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe qemu-10.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3105 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_write_config: Started
NOTE: Running task 3107 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: Running task 3116 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 3117 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_configure)
NOTE: Running task 3118 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3119 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3121 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe libcap-2.75-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.75-r0: task do_configure: Succeeded
NOTE: Running task 3125 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_compile)
NOTE: Running task 3126 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_patch)
NOTE: recipe libcap-2.75-r0: task do_compile: Started
NOTE: Running task 3207 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.4.bb:do_generate_toolchain_file)
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 3208 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot unihash changed to 605553f490b7673ec80f2442a66bcbf589745a991fb1144e66b37881287510da
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libsdl2-native-2.32.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdrm-2.4.124-r0: task do_compile: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-native-2.32.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 3209 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_install)
NOTE: Running task 3210 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: Running task 3211 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_collect_spdx_deps)
NOTE: Running task 3215 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe libdrm-2.4.124-r0: task do_install: Started
NOTE: recipe libdrm-2.4.124-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3243 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-native-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3281 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3282 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to 8f30ef2c05a712bf12069e58b137d607da49af99e29b268d74440a88183668a6
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3283 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3284 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3285 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_package unihash changed to eb406ef97732c80921f390423c007dd8b449a7815ca32fa20a34a7b88f2fbb64
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata became valid
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_install: Succeeded
NOTE: Running setscene task 1373 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running task 3304 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot)
NOTE: Running task 3305 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1374 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1375 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1377 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.124-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3307 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1378 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot unihash changed to 7afda24b1622868a4415b616d880b304c76c36cccc77ebda8759031dce7d6b5c
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to a9dccdb49c5c8a15c8caa575f6cfdd832ad9fea678a3da0d75632c3405a76b13
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: recipe libcap-2.75-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to 859ee45316e425cdfa1597a8d6ff358ff69b5b68b99f791851a8186d1da6a70a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: Running setscene task 1366 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1380 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running task 3323 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3370 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_configure_ptest_base)
NOTE: Running task 3385 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.75-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 3395 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3421 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_compile)
NOTE: Running task 3424 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile: Started
NOTE: Running task 3426 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx)
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3427 of 3769 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3428 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3429 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3430 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3431 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3432 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_configure: Started
NOTE: Running task 3433 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3434 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3435 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3436 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3437 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libcap-2.75-r0: task do_install: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_package: Succeeded
NOTE: Running task 3438 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: Running task 3440 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3441 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_package unihash changed to 00917f0c7c09ab8d5b7afb1210e2b4ffaf7e1dc250b0f46b03af9eee1bae0330
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 1380 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3442 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure)
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3443 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3445 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3446 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: Running task 3447 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3448 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to 13a95e746c8e0b8a217a3ff39fb67547389b9dd40158f8ba981bc7b0d7baff24
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: recipe libxkbcommon-1.8.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 1375 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running task 3449 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_compile)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3450 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3451 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 3452 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_compile: Started
NOTE: Running task 3453 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3454 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3455 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3456 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: Running task 3457 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3459 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package)
NOTE: Running task 3460 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx)
NOTE: Running task 3461 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3462 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 3463 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.75-r0: task do_package: Started
NOTE: Running task 3464 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3465 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3466 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: Running task 3467 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe pixman-1_0.44.2-r0: task do_compile: Succeeded
NOTE: Running task 3468 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: Running task 3469 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.44.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3470 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3471 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3472 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3473 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3474 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe pixman-1_0.44.2-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3475 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot)
NOTE: Running task 3476 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_package)
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: Running task 3477 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx: Started
NOTE: Running task 3478 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_collect_spdx_deps)
NOTE: Running task 3479 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_package: Started
NOTE: Running task 3480 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot unihash changed to 276077aeb2a71b0d548e51956cc10efc57645e792d6ba66373fb295ae30a2f4b
NOTE: Setscene tasks completed
NOTE: recipe pixman-1_0.44.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_package unihash changed to aaef5998d3413d5a1ba22bd09cde4f4c4b4a828e27846ea78c8ac8854152d939
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata became valid
NOTE: Running setscene task 1380 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3481 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_install)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package unihash changed to bede81533a312dd59d8113e0b64688f10edcec9a32cd3c399f8826d8adbc24fd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata became valid
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_install: Started
NOTE: Running setscene task 1375 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running task 3483 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3485 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx)
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 3486 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot)
NOTE: Running task 3487 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_package)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_package: Started
NOTE: Running task 3488 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3489 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3490 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_install)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot unihash changed to a44a78d482e5f77f6b1547823e00ace0de206fabc104b09b199da27b1934e78c
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install: Started
NOTE: recipe shadow-4.17.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3491 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install: Succeeded
NOTE: Running task 3492 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3493 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_package unihash changed to 5bc52e26866887a07ecc4cc7204ba51eb8c7914d29ea00db6b3e7149651ac9ef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 1380 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3495 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_populate_sysroot unihash changed to 575b656600472c37cfbcc552e85e2087dd70a0f96d8227f084d5be9038559d08
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3496 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3497 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3498 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3499 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe shadow-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 3500 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_install)
NOTE: recipe shadow-4.17.3-r0: task do_install: Started
NOTE: recipe shadow-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 3502 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3508 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure_ptest_base)
NOTE: recipe shadow-4.17.3-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3509 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3510 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package unihash changed to 7375fec165406d7a9abe9323a0b0acf124e288140e12fa5d5d95be4d11f197f5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata became valid
NOTE: Running setscene task 1380 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_configure: Succeeded
NOTE: Running task 3511 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_configure_ptest_base)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3512 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3514 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 3523 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: Running task 3524 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3525 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3526 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3527 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 3528 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install_ptest_base)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3530 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3531 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to 6ffa8ee9fe8171e83debc8cd40cc0be7cde39207283d5bb54d29bfcdf3b499e7
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3532 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to 99b2b056c0de409730a520c637138b03b68c50758d7023f2e1b3f94222cb6c19
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: recipe util-linux-2.40.4-r0: task do_compile: Succeeded
NOTE: Running setscene task 1380 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running task 3533 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3535 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package unihash changed to 6543c3ed3b2fec4a52768ca15a793f4dc5cb14d98f8ed2fafb5094e3235e5768
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata became valid
NOTE: Running setscene task 1376 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3536 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 3538 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3539 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_install: Succeeded
NOTE: Running task 3540 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3541 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot)
NOTE: Running task 3542 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_package)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.40.4-r0: task do_package: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3543 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3544 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3545 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3546 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3547 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3548 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3549 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3550 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 3551 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3552 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3553 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 3555 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3556 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package)
NOTE: recipe elfutils-0.192-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Started
NOTE: recipe elfutils-0.192-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3557 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure)
NOTE: Running task 3558 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe elfutils-0.192-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3559 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_compile: Succeeded
NOTE: Running task 3560 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile_ptest_base)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package unihash changed to 25b120f1627b77f3ad13fbdddfdb773f6280c0e9fc6979d9490a5105c8919e44
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata became valid
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 1377 of 1380 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3561 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3563 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3564 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.192-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.192-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_package: Succeeded
NOTE: Running task 3565 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.6-r0: task do_install: Succeeded
NOTE: Running task 3566 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3567 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package)
NOTE: recipe coreutils-9.6-r0: task do_package: Started
NOTE: recipe elfutils-0.192-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3568 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.192-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.192-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3569 of 3769 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_compile)
NOTE: recipe elfutils-0.192-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata: Failed
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_compile: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3569 tasks of which 3132 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501061421.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501061421.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.4/temp/log.do_packagedata.2950660
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.4/temp/log.do_packagedata.2950660
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata) failed with exit code '1'

--===============7286123539665891835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/qemu: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-9.2.3.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.0.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002
 -apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-common: PKGSIZE changed from 341685733 to 341966482 (+0%)
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-common: FILELIST: added "/usr/share/qemu/pnv-pnor.bin /usr/share/qemu/npcm8xx_bootrom.bin"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1852031448 to 1886429120 (+2%)
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: FILELIST: removed "/usr/lib/qemu/ptest/tests/qtest/.debug/m48t59-test", added "/usr/lib/qemu/ptest/tests/tcg/plugins/.debug/libreset.so /usr/lib/qemu/ptest/tests/qtest/.debug/riscv-csr-test /usr/lib/qemu/ptest/tests/qtest/.debug/vmcoreinfo-test /usr/lib/qemu/ptest/tests/qtest/.debug/intel-iommu-test /usr/lib/qemu/ptest/tests/qtest/.debug/ast2700-smc-test"
packages/core2-64-poky-linux/qemu/qemu-dev: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-dev: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-doc: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-doc: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGSIZE changed from 885169 to 889873 (+1%)
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-locale: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-locale: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 183861448 to 187589247 (+2%)
packages/core2-64-poky-linux/qemu/qemu-ptest: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/intel_iommu.py /usr/lib/qemu/ptest/tests/avocado/boot_xen.py /usr/lib/qemu/ptest/tests/avocado/migration.py /usr/lib/qemu/ptest/tests/qtest/m48t59-test /usr/lib/qemu/ptest/tests/avocado/hotplug_cpu.py /usr/lib/qemu/ptest/tests/avocado/hotplug_blk.py /usr/lib/qemu/ptest/tests/avocado/kvm_xen_guest.py /usr/lib/qemu/ptest/tests/avocado/vnc.py", added "/usr/lib/qemu/ptest/tests/tcg/plugins/libreset.so /usr/lib/qemu/ptest/tests/qtest/vmcoreinfo-test /usr/lib/qemu/ptest/tests/qtest/riscv-csr-test /usr/lib/qemu/ptest/tests/qtest/intel-iommu-test /usr/lib/qemu/ptest/tests/qtest/ast2700-smc-test"
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 32733394 to 33494960 (+2%)
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/9.2.3/contrib/ivshmem-server -> /usr/src/debug/qemu/10.0.0/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/9.2.3/libcommon.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/watchdog -> /usr/src/debug/qemu/10.0.0/include/hw/watchdog, directory renamed /usr/src/debug/qemu/9.2.3/hw/virtio -> /usr/src/debug/qemu/10.0.0/hw/virtio, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/dma -> /usr/src/debug/qemu/10.0.0/include/hw/dma, directory renamed /usr/src/debug/qemu/9.2.3/linux-headers/asm -> /usr/src/debug/qemu/10.0.0/linux-headers/asm, directory renamed /usr/src/debug/qemu/9.2.3/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/10.0.0/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-riscv32-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-riscv32-softmmu.a.p, dire
 ctory renamed /usr/src/debug/qemu/9.2.3/hw/pci-host -> /usr/src/debug/qemu/10.0.0/hw/pci-host, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-riscv64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/subprojects/libvduse -> /usr/src/debug/qemu/10.0.0/subprojects/libvduse, directory renamed /usr/src/debug/qemu/9.2.3/target/loongarch -> /usr/src/debug/qemu/10.0.0/target/loongarch, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/timer -> /usr/src/debug/qemu/10.0.0/include/hw/timer, directory renamed /usr/src/debug/qemu/9.2.3/include/scsi -> /usr/src/debug/qemu/10.0.0/include/scsi, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/sh4 -> /usr/src/deb
 ug/qemu/10.0.0/include/hw/sh4, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/ide -> /usr/src/debug/qemu/10.0.0/include/hw/ide, directory renamed /usr/src/debug/qemu/9.2.3/hw/block/dataplane -> /usr/src/debug/qemu/10.0.0/hw/block/dataplane, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/mem -> /usr/src/debug/qemu/10.0.0/include/hw/mem, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/migration -> /usr/src/debug/qemu/10.0.0/migration, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/input -> /usr/src/debug/qemu/10.0.0/include/hw/input, directory renamed /usr/src/debug/qemu/9.2.3/hw/block -> /usr/src/debug/qemu/10.0.0/hw/block, directory renamed /usr/src/debug/qemu/9.2.3/linux-headers/linux -> /usr/src/debug/qemu/10.0.0/linux-headers/linux, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/fsi -> /usr/src/debug/qemu/10.0
 .0/include/hw/fsi, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/xen/interface -> /usr/src/debug/qemu/10.0.0/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/9.2.3/ebpf -> /usr/src/debug/qemu/10.0.0/ebpf, directory renamed /usr/src/debug/qemu/9.2.3/include/libdecnumber -> /usr/src/debug/qemu/10.0.0/include/libdecnumber, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-riscv32-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/fpu -> /usr/src/debug/qemu/10.0.0/include/fpu, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/cxl -> /usr/src/debug/qemu/10.0.0/include/hw/cxl, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-ppc64le-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/display -> /usr/src/debug/qemu/10.0.0/include/hw/display, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/pci-b
 ridge -> /usr/src/debug/qemu/10.0.0/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/xen -> /usr/src/debug/qemu/10.0.0/include/hw/xen, directory renamed /usr/src/debug/qemu/9.2.3/hw/usb -> /usr/src/debug/qemu/10.0.0/hw/usb, directory renamed /usr/src/debug/qemu/9.2.3/include/disas -> /usr/src/debug/qemu/10.0.0/include/disas, directory renamed /usr/src/debug/qemu/9.2.3/target/sh4 -> /usr/src/debug/qemu/10.0.0/target/sh4, directory renamed /usr/src/debug/qemu/9.2.3/include/tcg -> /usr/src/debug/qemu/10.0.0/include/tcg, directory renamed /usr/src/debug/qemu/9.2.3/target/mips -> /usr/src/debug/qemu/10.0.0/target/mips, directory renamed /usr/src/debug/qemu/9.2.3/include/ui -> /usr/src/debug/qemu/10.0.0/include/ui, directory renamed /usr/src/debug/qemu/9.2.3/block -> /usr/src/debug/qemu/10.0.0/block, directory renamed /usr/src/debug/qemu/9.2.3/net -> /usr/src/debug/qemu/10.0.0/net, directory renamed /usr/src/debug/qemu/9.2.3/include/semihosting -> /usr/src/deb
 ug/qemu/10.0.0/include/semihosting, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/cpu -> /usr/src/debug/qemu/10.0.0/include/hw/cpu, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/adc -> /usr/src/debug/qemu/10.0.0/include/hw/adc, directory renamed /usr/src/debug/qemu/9.2.3/hw/net -> /usr/src/debug/qemu/10.0.0/hw/net, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/pci -> /usr/src/debug/qemu/10.0.0/include/hw/pci, directory renamed /usr/src/debug/qemu/9.2.3/target/i386 -> /usr/src/debug/qemu/10.0.0/target/i386, directory renamed /usr/src/debug/qemu/9.2.3/hw/ppc -> /usr/src/debug/qemu/10.0.0/hw/ppc, directory renamed /usr/src/debug/qemu/9.2.3 -> /usr/src/debug/qemu/10.0.0, directory renamed /usr/src/debug/qemu/9.2.3/linux-user -> /usr/src/debug/qemu/10.0.0/linux-user, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/ppc -> /usr/src/debug/qemu/10.0.0/include/hw/ppc, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-i386-linux-user.a.p -> /usr/src/debug/qe
 mu/10.0.0/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/subprojects/libvhost-user -> /usr/src/debug/qemu/10.0.0/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/9.2.3/ui -> /usr/src/debug/qemu/10.0.0/ui, directory renamed /usr/src/debug/qemu/9.2.3/hw/i386 -> /usr/src/debug/qemu/10.0.0/hw/i386, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/sensor -> /usr/src/debug/qemu/10.0.0/include/hw/sensor, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/misc/macio -> /usr/src/debug/qemu/10.0.0/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/9.2.3/include/libdecnumber/dpd -> /usr/src/debug/qemu/10.0.0/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/9.2.3/hw/loongarch -> /usr/src/debug/qemu/10.0.0/hw/loongarch, directory renamed /usr/src/debug/qemu/9.2.3/include/qemu -> /usr/src/deb
 ug/qemu/10.0.0/include/qemu, directory renamed /usr/src/debug/qemu/9.2.3/include/qom -> /usr/src/debug/qemu/10.0.0/include/qom, directory renamed /usr/src/debug/qemu/9.2.3/target/i386/kvm -> /usr/src/debug/qemu/10.0.0/target/i386/kvm, directory renamed /usr/src/debug/qemu/9.2.3/target/riscv -> /usr/src/debug/qemu/10.0.0/target/riscv, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/hw/vfio -> /usr/src/debug/qemu/10.0.0/hw/vfio, directory renamed /usr/src/debug/qemu/9.2.3/include/authz -> /usr/src/debug/qemu/10.0.0/include/authz, directory renamed /usr/src/debug/qemu/9.2.3/hw/acpi -> /usr/src/debug/qemu/10.0.0/hw/acpi, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include -> /usr/src/debug/qemu/10.0.0/include, directory renamed /usr/src/de
 bug/qemu/9.2.3/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/hw/intc -> /usr/src/debug/qemu/10.0.0/hw/intc, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/firmware -> /usr/src/debug/qemu/10.0.0/include/hw/firmware, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/nvram -> /usr/src/debug/qemu/10.0.0/include/hw/nvram, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/host/include/i386/host/crypto -> /usr/src/debug/qemu/10.0.0/host/include/i386/host/crypto, directory renamed /usr/src/debug/qemu/9.2.3/hw/mips -> /usr/src
 /debug/qemu/10.0.0/hw/mips, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/xen/interface/arch-x86 -> /usr/src/debug/qemu/10.0.0/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/9.2.3/disas -> /usr/src/debug/qemu/10.0.0/disas, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/i2c -> /usr/src/debug/qemu/10.0.0/include/hw/i2c, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libcommon.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/audio -> /usr/src/debug/qemu/10.0.0/include/hw/audio, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-x86_64-linux-user.a.p, 
 directory renamed /usr/src/debug/qemu/9.2.3/include/hw/hyperv -> /usr/src/debug/qemu/10.0.0/include/hw/hyperv, directory renamed /usr/src/debug/qemu/9.2.3/monitor -> /usr/src/debug/qemu/10.0.0/monitor, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/rtc -> /usr/src/debug/qemu/10.0.0/include/hw/rtc, directory renamed /usr/src/debug/qemu/9.2.3/target/arm -> /usr/src/debug/qemu/10.0.0/target/arm, directory renamed /usr/src/debug/qemu/9.2.3/include/crypto -> /usr/src/debug/qemu/10.0.0/include/crypto, directory renamed /usr/src/debug/qemu/9.2.3/host/include/i386/host -> /usr/src/debug/qemu/10.0.0/host/include/i386/host, directory renamed /usr/src/debug/qemu/9.2.3/include/net -> /usr/src/debug/qemu/10.0.0/include/net, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/usb -> /usr/src/debug/qemu/10.0.0/include/hw/usb, directory renamed /usr/src
 /debug/qemu/9.2.3/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/target/ppc -> /usr/src/debug/qemu/10.0.0/target/ppc, directory renamed /usr/src/debug/qemu/9.2.3/include/hw -> /usr/src/debug/qemu/10.0.0/include/hw, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/hw/arm -> /usr/src/debug/qemu/10.0.0/hw/arm, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/9.2.3/accel/tcg -> /usr/src/debug/qemu/10.0.0/accel/tcg, directory renamed /usr/src/debug/qemu/9.2.3/audio -> /usr/src/debug/qemu/10.0.0/audio, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/10.0.0/include/hw/xen/interface/hvm, directory renamed /usr/sr
 c/debug/qemu/9.2.3/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/10.0.0/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/i386 -> /usr/src/debug/qemu/10.0.0/include/hw/i386, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/loongarch -> /usr/src/debug/qemu/10.0.0/include/hw/loongarch, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/ssi -> /usr/src/debug/qemu/10.0.0/include/hw/ssi, directory renamed /usr/src/debug/qemu/9.2.3/hw/i386/kvm -> /usr/src/debug/qemu/10.0.0/hw/i386/kvm, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/xen/interface/io -> /usr/src/debug/qemu/10.0.0/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/block -> /usr/src/debug/qemu/10.0.0/include/hw/block, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/ipack -> /usr/src/debug/qemu/10.0.0/inclu
 de/hw/ipack, directory renamed /usr/src/debug/qemu/9.2.3/qga -> /usr/src/debug/qemu/10.0.0/qga, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/remote -> /usr/src/debug/qemu/10.0.0/include/hw/remote, directory renamed /usr/src/debug/qemu/9.2.3/util -> /usr/src/debug/qemu/10.0.0/util, directory renamed /usr/src/debug/qemu/9.2.3/hw/net/fsl_etsec -> /usr/src/debug/qemu/10.0.0/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/9.2.3/include/io -> /usr/src/debug/qemu/10.0.0/include/io, directory renamed /usr/src/debug/qemu/9.2.3/crypto -> /usr/src/debug/qemu/10.0.0/crypto, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/riscv -> /usr/src/debug/qemu/10.0.0/include/hw/riscv, directory renamed /usr/src/debug/qemu/9.2.3/backends/tpm -> /usr/src/debug/qemu/10.0.0/backends/tpm, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/isa -> /usr/src/debug/qemu/10.0.0/include/hw/isa, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/southbridge -> /usr/src/debug/qemu/10.0.
 0/include/hw/southbridge, directory renamed /usr/src/debug/qemu/9.2.3/include/gdbstub -> /usr/src/debug/qemu/10.0.0/include/gdbstub, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/gpio -> /usr/src/debug/qemu/10.0.0/include/hw/gpio, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/vfio -> /usr/src/debug/qemu/10.0.0/include/hw/vfio, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/scsi -> /usr/src/debug/qemu/10.0.0/include/hw/scsi, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/ipmi -> /usr/src/debug/qemu/10.0.0/include/hw/ipmi, directory renamed /usr/src/debug/qemu/9.2.3/include/chardev -> /usr/src/debug/qemu/10.0.0/include/chardev, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/char -> /usr/src/debug/qemu/10.0.0/include/hw/char, directory renamed /usr/src/debug/qemu/9.2.3/include/hw/mips -> /usr/src/debug/qemu/10.0.0/include/hw/mips, directory renamed /usr/src/debug/qemu/9.2.3/include/monitor -> /usr/src/debug/qemu/10.0.0/include/monitor, director
 y renamed /usr/src/debug/qemu/9.2.3/ui/shader -> /usr/src/debug/qemu/10.0.0/ui/shader, removed "/usr/src/debug/qemu/9.2.3/trace/trace-hw_sensor.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_tpm.h /usr/src/debug/qemu/9.2.3/include/hw/intc/loongson_ipi.h /usr/src/debug/qemu/9.2.3/trace/trace-root.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/9.2.3/include/block/throttle-groups.h /usr/src/debug/qemu/9.2.3/include/hw/intc/intc.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_sensor.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_tpm.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-root.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/pnv_phb3.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-misc-target.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-types-run-state.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-run-state.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-machine-tar
 get.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-bus.h /usr/src/debug/qemu/9.2.3/include/exec/abi_ptr.h /usr/src/debug/qemu/9.2.3/include/block/aio-wait.h /usr/src/debug/qemu/9.2.3/include/block/aio_task.h /usr/src/debug/qemu/9.2.3/include/hw/core/sysemu-cpu-ops.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-scsi.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_net_can.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-i2c.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/9.2.3/trace/trace-hw_net_can.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-control.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_nvram.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_nvram.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-control.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-balloon.h /usr/src/debug/qemu/9.2.3/include/hw/ar
 m/soc_dma.h /usr/src/debug/qemu/9.2.3/include/sysemu/kvm_int.h /usr/src/debug/qemu/9.2.3/include/exec/cpu_ldst.h /usr/src/debug/qemu/9.2.3/include/sysemu/kvm_xen.h /usr/src/debug/qemu/9.2.3/include/sysemu/seccomp.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-qom.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_pci.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/9.2.3/tests/migration/i386/a-b-bootblock.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-qom.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_pci.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-migration.h /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-introspect.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-migration.c /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-introspect.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_sh4.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_i2c.c /usr/src/debug/qem
 u/9.2.3/include/hw/intc/loongarch_extioi.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_i2c.h /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/9.2.3/include/user/guest-base.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-acpi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-char.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-dump.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-misc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-qdev.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_mem.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-vfio.h /usr/src/debug/qemu/9.2.3/include/migration/global_state.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_mips.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-acpi.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-dump.c /usr/src/debug/qemu/9.2.3/include/hw/core/resetcontainer.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-misc.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-qdev.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-vfio.c /usr/src/debug/qemu/9.2.
 3/include/hw/pci-host/designware.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-char.c /usr/src/debug/qemu/9.2.3/tests/migration/aarch64/a-b-kernel.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_mem.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_mips.h /usr/src/debug/qemu/9.2.3/trace/trace-qom.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-yank.c /usr/src/debug/qemu/9.2.3/include/sysemu/cryptodev-vhost-user.h /usr/src/debug/qemu/9.2.3/include/hw/sd/bcm2835_sdhost.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-yank.h /usr/src/debug/qemu/9.2.3/trace/trace-qom.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/qemu_fw_cfg.h /usr/src/debug/qemu/9.2.3/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-qom.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-qom.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/9.2.3/include/sysemu/tpm_backend.h /usr/src/debug/qemu/9.2.3/trace/trace-accel_kvm.c /usr/src/debug/qemu/9.2.3/trace/trace-accel_tcg.c /usr/src/
 debug/qemu/9.2.3/qapi/qapi-commands-misc-target.h /usr/src/debug/qemu/9.2.3/include/hw/sd/sdhci.h /usr/src/debug/qemu/9.2.3/trace/trace-accel_kvm.h /usr/src/debug/qemu/9.2.3/trace/trace-accel_tcg.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-zynqmp-crf.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_pci_host.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_pci_host.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-ui.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_rtc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-ui.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/9.2.3/include/hw/intc/i8259.h /usr/src/debug/qemu/9.2.3/include/hw/misc/a9scu.h /usr/src/debug/qemu/9.2.3/include/hw/misc/unimp.h /usr/src/debug/qemu/9.2.3/include/hw/net/allwinner_emac.h /usr/src/debug/qemu/9.2.3/include/sysemu/cpu-throttle.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/9.
 2.3/trace/trace-hw_rtc.c /usr/src/debug/qemu/9.2.3/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/9.2.3/include/qapi/opts-visitor.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/9.2.3/include/sysemu/runstate.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/9.2.3/include/exec/cpu-common.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/9.2.3/trace/control-internal.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-migration.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-migration.h /usr/src/debug/qemu/9.
 2.3/trace/trace-hw_input.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_virtio.h /usr/src/debug/qemu/9.2.3/include/qapi/visitor.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-machine.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_input.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_virtio.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-machine.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_dma.h /usr/src/debug/qemu/9.2.3/include/hw/intc/arm_gicv3.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_snd.h /usr/src/debug/qemu/9.2.3/include/migration/blocker.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_dma.c /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-run-state.c /usr/src/debug/qemu/9.2.3/trace/trace-io.c /usr/src/debug/qemu/9.2.3/trace/trace-ui.c /usr/src/debug/qemu/9.2.3/trace/trace-io.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-run-state.h /usr/src/debug/qemu/9.2.3/include/standard-headers
 /linux/virtio_console.h /usr/src/debug/qemu/9.2.3/trace/trace-ui.h /usr/src/debug/qemu/9.2.3/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/acpi_dev_interface.h /usr/src/debug/qemu/9.2.3/include/block/qdict.h /usr/src/debug/qemu/9.2.3/include/block/block_int-io.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-dump.h /usr/src/debug/qemu/9.2.3/include/sysemu/block-ram-registrar.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/ich9.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-dump.c /usr/src/debug/qemu/9.2.3/tcg/i386/tcg-target.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/arm/bcm2836.h /usr/src/debug/qemu/9.2.3/include/hw/arm/bcm2838.h /usr/src/debug/qemu/9.2.3/include/hw/arm/linux-boot-if.h /usr/s
 rc/debug/qemu/9.2.3/include/sysemu/arch_init.h /usr/src/debug/qemu/9.2.3/include/sysemu/balloon.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/9.2.3/qapi/qapi-introspect.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/net/ne2000-isa.h /usr/src/debug/qemu/9.2.3/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-introspect.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/9.2.3/include/migration/client-options.h /usr/src/de
 bug/qemu/9.2.3/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_adc.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_adc.h /usr/src/debug/qemu/9.2.3/include/block/block-hmp-cmds.h /usr/src/debug/qemu/9.2.3/include/block/qapi.h /usr/src/debug/qemu/9.2.3/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/9.2.3/include/block/block-copy.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/vmgenid.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-gpu-pci.h /usr/src/debug/qemu/9.2.3/include/exec/cpu-all.h /usr/src/debug/qemu/9.2.3/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/9.2.3/include/sysemu/watchdog.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-introspect.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-introspect.c /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-blk.h /usr/src/debug/qemu/9.2.3/trace/trace-linux_user.h /usr/src/debug/qemu
 /9.2.3/trace/trace-hw_gpio.c /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_gpio.h /usr/src/debug/qemu/9.2.3/trace/trace-linux_user.c /usr/src/debug/qemu/9.2.3/include/qapi/qmp-event.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qbool.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qdict.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-base.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-backend.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qjson.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qlist.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qnull.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/udmabuf.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-block-export.c /usr/src/debug/qemu/9.2.3/include/qapi/error.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-block-core.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-pci.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/9.2.3/trace/
 trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-pci.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-block-core.c /usr/src/debug/qemu/9.2.3/include/hw/pci-host/pam.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-block-export.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/9.2.3/include/sysemu/cpu-timers-internal.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_mem.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_types.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-net.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_iommu.h /usr/src/debug/qemu/9.2.3/include/migration/register.h /usr/src/debug/qemu/9.2.3/qapi
 /qapi-types-net.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/9.2.3/include/block/blockjob.h /usr/src/debug/qemu/9.2.3/include/block/block-io.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-qdev.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/9.2.3/include/hw/intc/riscv_aclint.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-fs.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-dump.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-replay.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-rocker.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-virtio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-common.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-compat.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-crypto.h /usr/src/debug/qemu/9.2.3/include/standar
 d-headers/linux/virtio_crypto.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-common.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-compat.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-crypto.c /usr/src/debug/qemu/9.2.3/include/exec/page-vary.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-replay.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-rocker.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-virtio.c /usr/src/debug/qemu/9.2.3/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/9.2.3/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/9.2.3/include/sysemu/dirtylimit.h /usr/src/debug/qemu/9.2.3/include/user/thunk.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-init-commands.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-visit-sub-sub-module.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-types-sub-sub-module.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-init-commands.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-types-sub-sub-module.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-visit-sub-sub-module.h /usr/src/debug/qemu/9.2
 .3/include/hw/acpi/aml-build.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-ui.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_arm.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/vhost_types.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-char.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/9.2.3/include/hw/intc/riscv_aplic.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_arm.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-ui.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-char.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-yank.c /usr/src/debug/qemu/9.2.3/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_watchdog.h /usr/src/debug/qemu/9.2.3/include/exec/ram_addr.h /usr/src/debug/qemu/9.2.3/include/exec/ramblock.h /usr/src/debug/qemu/9.2.3
 /include/hw/virtio/vhost-vdpa.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-yank.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_watchdog.c /usr/src/debug/qemu/9.2.3/trace/trace-block.c /usr/src/debug/qemu/9.2.3/trace/trace-block.h /usr/src/debug/qemu/9.2.3/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/9.2.3/include/hw/net/imx_fec.h /usr/src/debug/qemu/9.2.3/include/sysemu/iommufd.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-misc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-misc.c /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/9.2.3/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/9.2.3/include/hw/intc/arm_gic_common.h /usr/src/debug/qemu/9.2.3/include/hw/sd/sdcard_legacy.h /usr/src/debug/qemu/9.2.3/include/exec/plugin-gen.h /usr/src/debug/qemu/9.2.3/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-replay.trace-events /usr/src/de
 bug/qemu/9.2.3/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/9.2.3/include/sysemu/spdm-socket.h /usr/src/debug/qemu/9.2.3/include/sysemu/hw_accel.h /usr/src/debug/qemu/9.2.3/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/9.2.3/include/hw/intc/ioapic.h /usr/src/debug/qemu/9.2.3/include/hw/misc/auxbus.h /usr/src/debug/qemu/9.2.3/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/tz-msc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qlit.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/i440fx.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qnum.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-machine.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-machine.c /usr/src/debug/qemu/9.2.3/include/hw/acpi/pcihp.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/piix4.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/utils.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/ipmi.h /usr/src/deb
 ug/qemu/9.2.3/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-pci.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_nvme.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/arm/armsse.h /usr/src/debug/qemu/9.2.3/include/hw/arm/armv7m.h /usr/src/debug/qemu/9.2.3/include/hw/arm/aspeed.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/9.2.3/include/hw/net/npcm_gmac.h /usr/src/debug/qemu/9.2.3/include/migration/snapshot.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_nvme.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/9.2.3/includ
 e/hw/acpi/tpm.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_vfio.c /usr/src/debug/qemu/9.2.3/include/migration/colo.h /usr/src/debug/qemu/9.2.3/include/migration/misc.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_vfio.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/9.2.3/include/hw/intc/loongarch_pch_pic.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-events.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-events.h /usr/src/debug/qemu/9.2.3/include/exec/memory.h /usr/src/debug/qemu/9.2.3/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/memory_hotplug.h /usr/src/debug/qemu/9.2.3/tests/migration/ppc64/a-b-kernel.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-misc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-zynqmp-apu-ctrl.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-machine.h /usr/src/debug/qemu/9.2.3/include/hw/misc/npcm7xx_clk.h /usr/src/debug/qemu/9.2.3/include/hw/net/xlnx-zynqmp-can
 .h /usr/src/debug/qemu/9.2.3/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-machine.c /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/arm11scu.h /usr/src/debug/qemu/9.2.3/trace/trace-gdbstub.h /usr/src/debug/qemu/9.2.3/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/9.2.3/include/hw/intc/bcm2836_control.h /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/9.2.3/include/sysemu/stats.h /usr/src/debug/qemu/9.2.3/trace/trace-gdbstub.c /usr/src/debug/qemu/9.2.3/include/exec/target_page.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/cxl.h /usr/src/debug/qemu/9.2.3/include/block/blockjob_int.h /usr/src/debug/qemu/9.2.3/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/9.2.3/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/9.2.3/include/sysemu/accel-ops.h /usr/src/debug/qemu/9.2.3/trace/trace-util.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_audio.h /usr/src/debug/qemu/9
 .2.3/include/hw/sd/allwinner-sdhost.h /usr/src/debug/qemu/9.2.3/trace/trace-util.c /usr/src/debug/qemu/9.2.3/include/sysemu/host_iommu_device.h /usr/src/debug/qemu/9.2.3/include/exec/address-spaces.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/9.2.3/trace/trace-hw_audio.c /usr/src/debug/qemu/9.2.3/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/9.2.3/include/hw/net/cadence_gem.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/9.2.3/trace/trace-chardev.c /usr/src/debug/qemu/9.2.3/trace/trace-target_arm.c /usr/src/debug/qemu/9.2.3/trace/trace-target_ppc.c /usr/src/debug/qemu/9.2.3/include/hw/acpi/bios-linker-loader.h /usr/src/debug/qemu/9.2.3/include/block/thread-pool.h /usr/src/debug/qemu/9.2.3/include/sysemu/dump-arch.h /usr/src/debug/qemu/9.2.3/include/exec/tb-flush.h /usr/src/debug/qemu/9.2.3/trace/trace-chardev.h /usr/src/debug/qemu/9.2.3/trace/trace-target_arm.h /usr/src/debug/qemu/9.2.3/trace/trace-ta
 rget_ppc.h /usr/src/debug/qemu/9.2.3/trace/trace-system.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-system.c /usr/src/debug/qemu/9.2.3/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/9.2.3/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/9.2.3/include/exec/gdbstub.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/ich9_tco.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/9.2.3/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_sd.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_xen.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_sd.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_xen.c /usr/src/debug/qemu/9.2.3/include/hw/core/tcg-cpu-ops.h /usr/src/debug/qemu/9
 .2.3/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/9.2.3/include/block/replication.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-dump.h /usr/src/debug/qemu/9.2.3/include/sysemu/hostmem.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/9.2.3/trace/trace-hw_timer.h /usr/src/debug/qemu/9.2.3/include/hw/net/smc91c111.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_timer.c /usr/src/debug/qemu/9.2.3/host/include/x86_64/host/atomic128-ldst.h /usr/src/debug/qemu/9.2.3/include/sysemu/dump.h /usr/src/debug/qemu/9.2.3/trace/control.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-vfio.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-machine.h /usr/src/debug/qemu/9.2.3/include/exec/breakpoint.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-vsock.h /usr/src/debug/qemu/9.2.3/include/hw/net/xlnx-versal-canfd.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-vfio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-machine.c /usr/src/debug/qemu/9.2.3/include/hw/misc/imx6ul_ccm.h /usr/
 src/debug/qemu/9.2.3/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-dump.c /usr/src/debug/qemu/9.2.3/include/sysemu/replay.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-dump.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-net.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_block.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_block.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-net.h /usr/src/debug/qemu/9.2.3/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_ppc.c /usr/src/debug/qemu/9.2.3/include/block/snapshot.h /usr/src/debug/qemu/9.2.3/include/migration/vmstate.h /usr/src/debug/qemu/9.2.3/include/exec/hwaddr.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_ppc.h /usr/src/debug/qemu/9.2.3/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_pmem.h /usr/src/debug/qemu/9.2.3/trace/trace-backends_tpm.c /usr/src/debug/qemu/9.2.3/include/hw/net/npcm7xx_emc.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linu
 x/virtio_net.h /usr/src/debug/qemu/9.2.3/include/hw/arm/xlnx-zynqmp.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-types-audio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-authz.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-block.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-error.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-stats.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-trace.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-audio.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-authz.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-block.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-error.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-stats.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-trace.c /usr/src/debug/qemu/9.2.3/include/exec/ioport.h /usr/src/debug/qemu/9.2.3/include/sysemu/cryptodev-vho
 st.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-net.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-net.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-control.c /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-init-commands.c /usr/src/debug/qemu/9.2.3/include/hw/core/sysbus-fdt.h /usr/src/debug/qemu/9.2.3/include/sysemu/tcg.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-scmi.h /usr/src/debug/qemu/9.2.3/include/sysemu/memory_mapping.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-control.h /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-init-commands.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-commands.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-commands.h /usr/src/debug/qemu/9.2.3/include/hw/core/cpu.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_pci.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-types.h /usr/src/debug/qemu/9.2.3/include/sysemu/os-posix.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-machine-t
 arget.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/9.2.3/include/hw/acpi/acpi-defs.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-types.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-visit.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-emit-events.h /usr/src/debug/qemu/9.2.3/include/hw/misc/empty_slot.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_i386.h /usr/src/debug/qemu/9.2.3/trace/trace-audio.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_i386.c /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-emit-events.c /usr/src/debug/qemu/9.2.3/trace/trace-audio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/9.2.3/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/9.2.3/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-misc-target.c /usr/src/debug/qem
 u/9.2.3/include/sysemu/blockdev.h /usr/src/debug/qemu/9.2.3/trace/event-internal.h /usr/src/debug/qemu/9.2.3/include/hw/intc/arm_gicv3_common.h /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-commands.c /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_ring.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/pnv_phb4.h /usr/src/debug/qemu/9.2.3/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/pci.h /usr/src/debug/qemu/9.2.3/trace/trace-nbd.h /usr/src/debug/qemu/9.2.3/trace/trace-scsi.c /usr/src/debug/qemu/9.2.3/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/9.2.3/trace/trace-nbd.c /usr/src/debug/qemu/9.2.3/include/block/block_int-common.h /usr/src/debug/qemu/9.2.3/include/exec/vaddr.h /usr/src/debug/qemu/9.2.3/trace/trace-scsi.h /usr/src/debug/qemu/9.2.3/include/hw/intc/armv7m_nvic.h /usr/src/debug/qemu/9.2.3/include/sysemu/kvm.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/9.2.3/include/sysemu/cpu-timers.h /usr/src/
 debug/qemu/9.2.3/include/block/dirty-bitmap.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-ui.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_ssi.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/bonito.h /usr/src/debug/qemu/9.2.3/include/exec/confidential-guest-support.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/9.2.3/trace/trace-hw_ssi.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-ui.h /usr/src/debug/qemu/9.2.3/include/hw/sd/sd.h /usr/src/debug/qemu/9.2.3/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/9.2.3/include/exec/cputlb.h /usr/src/debug/qemu/9.2.3/include/hw/intc/xlnx-zynqmp-ipi.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-machine-target.h /usr/src/debug/qemu/9.2.3/trace/trace-net.c /usr/s
 rc/debug/qemu/9.2.3/trace/trace-net.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_misc_target_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-cxl.c /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qstring.h /usr/src/debug/qemu/9.2.3/include/hw/arm/smmuv3.h /usr/src/debug/qemu/9.2.3/include/sysemu/sysemu.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user.h /usr/src/debug/qemu/9.2.3/include/user/syscall-trace.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-cxl.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-char.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-rng.h /usr/src/debug/qemu/9.2.3/include/sysemu/vhost-user-backend.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-char.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/9.2.3/include/hw/misc/imx6_src.h /usr/src/debug/qemu/9.2.3/include/hw/arm/virt.h /usr/src
 /debug/qemu/9.2.3/include/hw/misc/imx7_src.h /usr/src/debug/qemu/9.2.3/trace/trace-migration.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-block.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-mem.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/9.2.3/trace/trace-migration.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-block.c /usr/src/debug/qemu/9.2.3/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/9.2.3/tcg/tcg-ldst.c.inc /usr/src/debug/qemu/9.2.3/tcg/tcg-pool.c.inc /usr/src/debug/qemu/9.2.3/host/include/generic/host/atomic128-cas.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/9.2.3/include/qapi/util.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-replay.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-block-core.c /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_scsi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-machine.t
 race-events /usr/src/debug/qemu/9.2.3/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-replay.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-block-core.h /usr/src/debug/qemu/9.2.3/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block.h /usr/src/debug/qemu/9.2.3/include/qapi/visitor-impl.h /usr/src/debug/qemu/9.2.3/include/block/write-threshold.h /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/9.2.3/include/hw/intc/allwinner-a10-pic.h /usr/src/debug/qemu/9.2.3/tcg/i386/tcg-target-con-str.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block.c /usr/src/debug/qemu/9.2.3/include/hw/core/split-irq.h /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/9.2.3/
 qapi/qapi-commands-introspect.c /usr/src/debug/qemu/9.2.3/include/hw/misc/mips_itu.h /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_remote.h /usr/src/debug/qemu/9.2.3/include/exec/memop.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_riscv.h /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-job.h /usr/src/debug/qemu/9.2.3/include/sysemu/cryptodev.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_riscv.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_remote.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-md-pci.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-job.c /usr/src/debug/qemu/9.2.3/tests/migration/s390x/a-b-bios.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/9.2.3/include/hw/misc/mos6522.h /usr/src/debug/qemu/9.2.3/include/exec/translation
 -block.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/json-parser.h /usr/src/debug/qemu/9.2.3/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/9.2.3/include/sysemu/block-backend-io.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events.c /usr/src/debug/qemu/9.2.3/tests/test-qapi-introspect.c /usr/src/debug/qemu/9.2.3/include/block/export.h /usr/src/debug/qemu/9.2.3/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-blk.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-introspect.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-crypto.h /usr/src/debug/qemu/9.2.3/include/block/block-common.h /usr/src/debug/qemu/9.2.3/include/block/aio.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/9.2.3/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/9.2.3/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/9.2.3/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_fsi.c /usr/src/debug/qemu/9.2.3/include/exec/log.h /usr/
 src/debug/qemu/9.2.3/include/hw/intc/riscv_imsic.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_fs.h /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_fsi.h /usr/src/debug/qemu/9.2.3/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/acpi_aml_interface.h /usr/src/debug/qemu/9.2.3/tcg/i386/tcg-target.c.inc /usr/src/debug/qemu/9.2.3/qapi/qapi-types-char.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/9.2.3/include/sysemu/dirtyrate.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-job.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-net.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-char.c /usr/src/debug/qemu/9.2.3/include/user/safe-syscall.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-pci.h /usr/src/debug/qemu/9.2.3/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/9
 .2.3/include/exec/memattrs.h /usr/src/debug/qemu/9.2.3/include/exec/memopidx.h /usr/src/debug/qemu/9.2.3/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/input.h /usr/src/debug/qemu/9.2.3/include/sysemu/dma.h /usr/src/debug/qemu/9.2.3/include/sysemu/xen.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-job.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-net.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-pci.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-qom.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-migration.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/grackle.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-migration.c /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_balloon.h /usr/src/deb
 ug/qemu/9.2.3/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-snd.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-access.h /usr/src/debug/qemu/9.2.3/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-events.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-scsi-common.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-input.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/gpex.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-iommu.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/generic_event_device.h /usr/src/debug/qemu/9.2.3/include/hw/sd/aspeed_sdhci.h /usr/src/debug/qemu/9.2.3/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-qom.h /usr/src/debug/qemu/9.2.3/include/hw/intc/imx_gpcv2.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-trace.c /us
 r/src/debug/qemu/9.2.3/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/intc/exynos4210_combiner.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_ufs.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-trace.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_gpu.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_ufs.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/9.2.3/include/migration/qemu-file-types.h /usr/src/debug/qemu/9.2.3/include/exec/replay-core.h /usr/src/debug/qemu/9.2.3/include/block/ufs.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-stats.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-stats.c /usr/src/debug/qemu/9.2.3/include/qapi/compat
 -policy.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-job.c /usr/src/debug/qemu/9.2.3/include/block/graph-lock.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-job.h /usr/src/debug/qemu/9.2.3/include/hw/arm/digic.h /usr/src/debug/qemu/9.2.3/include/sysemu/rng.h /usr/src/debug/qemu/9.2.3/include/hw/intc/imx_avic.h /usr/src/debug/qemu/9.2.3/include/hw/intc/mips_gic.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/uninorth.h /usr/src/debug/qemu/9.2.3/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/9.2.3/include/block/block_int-global-state.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-target_riscv.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/9.2.3/include/hw/intc/bcm2835_ic.h /usr/src/debug/qemu/9
 .2.3/trace/trace-target_riscv.h /usr/src/debug/qemu/9.2.3/include/hw/arm/omap.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/9.2.3/include/hw/intc/aspeed_vic.h /usr/src/debug/qemu/9.2.3/include/hw/net/ftgmac100.h /usr/src/debug/qemu/9.2.3/include/hw/core/generic-loader.h /usr/src/debug/qemu/9.2.3/include/sysemu/rng-random.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-visit.h /usr/src/debug/qemu/9.2.3/include/sysemu/tpm.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/9.2.3/include/block/block-global-state.h /usr/src/debug/qemu/9.2.3/include/sysemu/numa.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/9.2.3/include/sysemu/rtc.h /usr/src/debug/qemu/9.2.3/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-blk-common.h /usr/src/debug/qemu/9.2.3/host/include/generic/host/sto
 re-insert-al16.h.inc /usr/src/debug/qemu/9.2.3/include/hw/pci-host/spapr.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/arm/armsse-version.h /usr/src/debug/qemu/9.2.3/include/qapi/string-input-visitor.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-machine-target.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-types-sockets.c /usr/src/debug/qemu/9.2.3/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-job.h /usr/src/debug/qemu/9.2.3/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/9.2.3/trace/trace-authz.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_display.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vdpa-dev.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/9.2.3/include/hw/acpi/acpi.h /u
 sr/src/debug/qemu/9.2.3/qapi/qapi-types-sockets.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-job.c /usr/src/debug/qemu/9.2.3/include/sysemu/device_tree.h /usr/src/debug/qemu/9.2.3/trace/trace-authz.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_display.c /usr/src/debug/qemu/9.2.3/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/9.2.3/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/remote.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-builtin-types.h /usr/src/debug/qemu/9.2.3/include/exec/ramlist.h /usr/src/debug/qemu/9.2.3/include/hw/intc/aspeed_intc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-builtin-types.c /usr/src/debug/qemu/9.2.3/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/9.2.3/include/hw/acpi/ich9_timer.h /usr/src/debug/qemu/9.2.3/include/sysemu/reset.h /usr/src/debug/qemu/9.2.3/include/qapi/clone-visitor.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/9.2.3/qapi/qapi-comman
 ds-virtio.c /usr/src/debug/qemu/9.2.3/include/exec/exec-all.h /usr/src/debug/qemu/9.2.3/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/9.2.3/include/sysemu/event-loop-base.h /usr/src/debug/qemu/9.2.3/include/block/accounting.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-yank.c /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_blk.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-yank.h /usr/src/debug/qemu/9.2.3/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-vsock.h /usr/src/debug/qemu/9.2.3/include/qapi/type-helpers.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/9.2.3/include/migration/failover.h /usr/src/debug/qemu/9.2.3/include/sysemu/tpm_util.h /usr/src/debug/qemu/9.2.3/include/sysemu/block-backend-global-state.h /usr/src/debug/qemu/9.2.3/qa
 pi/qapi-visit-tpm.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-ui.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-net.h /usr/src/debug/qemu/9.2.3/include/sysemu/block-backend-common.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/9.2.3/include/hw/pci-host/ppce500.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-ui.h /usr/src/debug/qemu/9.2.3/include/sysemu/accel-blocker.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/9.2.3/include/exec/mmu-access-type.h /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-audio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-authz.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-block.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-pci.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-stats.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-trace.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-audio.c /usr/src/debug/qemu/9.2.3/qapi/qapi-comma
 nds-rocker.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-authz.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-block.c /usr/src/debug/qemu/9.2.3/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-pci.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-stats.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-trace.c /usr/src/debug/qemu/9.2.3/include/block/block_backup.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_isa.c /usr/src/debug/qemu/9.2.3/include/hw/intc/loongson_ipi_common.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_vsock.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_isa.h /usr/src/debug/qemu/9.2.3/include/hw/misc/led.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/xilinx-pcie.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-tpm.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-common.h /usr/src/debug/qemu/9.2.3/include/hw/intc/realview_gic.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-compat.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/
 9.2.3/qapi/qapi-types-tpm.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/ghes.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-replay.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-common.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-serial.h /usr/src/debug/qemu/9.2.3/include/exec/tswap.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-compat.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-replay.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/9.2.3/qapi/qapi-c
 ommands-introspect.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-migration.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-emit-events.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-dmabuf.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-rng.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-acpi.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-mmio.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-pmem.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-scsi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-migration.c /usr/src/debug/qemu/9.2.3/qapi/qapi-emit-events.h /usr/src/debug/qemu/9.2.3/trace/trace-backends.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-gpio.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/dispatch.h /usr/src/debug/qemu/9.2.3/trace/trace-backends.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block-core.c /usr/src/d
 ebug/qemu/9.2.3/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/9.2.3/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/9.2.3/include/hw/intc/kvm_irqcount.h /usr/src/debug/qemu/9.2.3/qapi/qapi-events-block-export.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_ide.c /usr/src/debug/qemu/9.2.3/qapi/qapi-events-block-export.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_ide.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/9.2.3/trace/trace-target_i386.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_char.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-gpu-bswap.h /usr/src/debug/qemu/9.2.3/include/hw/sd/npcm7xx_sdhci.h /usr/src/debug/qemu/9.2.3/trace/trace-target_i386.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/qobject.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_char.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_hyperv.h /usr/src/debug/qemu/9.2.3/t
 race/trace-hw_misc.h /usr/src/debug/qemu/9.2.3/include/hw/intc/exynos4210_gic.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/9.2.3/include/hw/intc/loongson_liointc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types.c /usr/src/debug/qemu/9.2.3/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_hyperv.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_misc.c /usr/src/debug/qemu/9.2.3/include/hw/acpi/cpu.h /usr/src/debug/qemu/9.2.3/host/include/x86_64/host/load-extract-al16-al8.h.inc /usr/src/debug/qemu/9.2.3/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/9.2.3/include/exec/memory-internal.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/9.2.3/include/hw/sd/cadence_sdhci.h /usr/src/debug/qemu/9.2.3/include/block/nvme.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_misc_macio.c /
 usr/src/debug/qemu/9.2.3/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/9.2.3/include/block/nbd.h /usr/src/debug/qemu/9.2.3/include/user/abitypes.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/9.2.3/include/block/reqlist.h /usr/src/debug/qemu/9.2.3/include/hw/misc/npcm7xx_gcr.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_net.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_sh4.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_net.h /usr/src/debug/qemu/9.2.3/include/hw/intc/loongarch_pch_msi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-transaction.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-transaction.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/net/dp8393x.h /usr/src/debug/qemu/9.2.3/include/hw/net/lan9118.h /usr/src/debug/qemu/9.2.
 3/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/9.2.3/include/exec/target_long.h /usr/src/debug/qemu/9.2.3/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/9.2.3/include/standard-headers/linux/virtio_input.h /usr/src/debug/qemu/9.2.3/include/qapi/string-output-visitor.h /usr/src/debug/qemu/9.2.3/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/9.2.3/include/sysemu/iothread.h /usr/src/debug/qemu/9.2.3/include/exec/tlb-common.h /usr/src/debug/qemu/9.2.3/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/9.2.3/include/hw/intc/arm_gic.h /usr/src/debug/qemu/9.2.3/include/hw/intc/ppc-uic.h /usr/src/debug/qemu/9.2.3/include/hw/misc/pvpanic.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/9.2.3/qapi/qapi-init-commands.c /usr/src/debug/qemu/9.2.3/include/hw/arm/exynos4210.h /usr/src/debug/
 qemu/9.2.3/include/sysemu/qtest.h /usr/src/debug/qemu/9.2.3/qapi/qapi-init-commands.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-gpu-pixman.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-audio.c /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-vsock-common.h /usr/src/debug/qemu/9.2.3/include/hw/net/msf2-emac.h /usr/src/debug/qemu/9.2.3/include/exec/translate-all.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/virtio-gpu.h /usr/src/debug/qemu/9.2.3/include/hw/core/accel-cpu.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-audio.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/intc/arm_gicv3_its_common.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/cpu_hotplug.h /usr/src/debug/qemu/9.2.3/include/hw/intc/sifive_plic.h /usr/src/debug/qemu/9.2.3/include/hw/virtio/vhost-user-scsi.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-acpi.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_comma
 nds_block_trace_events.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/9.2.3/qapi/qapi-types-acpi.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_acpi.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/9.2.3/trace/trace-monitor.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/q35.h /usr/src/debug/qemu/9.2.3/include/hw/arm/boot.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_acpi.h /usr/src/debug/qemu/9.2.3/trace/trace-monitor.c /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-misc.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/9.2.3/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/9.2.3/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/9.2.3/include/hw/intc/heathrow_pic.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-misc.c /usr/src/debug/qemu/9.2.3/include/hw/misc/bcm2835_pro
 perty.h /usr/src/debug/qemu/9.2.3/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/9.2.3/include/hw/arm/smmu-common.h /usr/src/debug/qemu/9.2.3/include/qapi/forward-visitor.h /usr/src/debug/qemu/9.2.3/include/hw/acpi/erst.h /usr/src/debug/qemu/9.2.3/include/exec/translator.h /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-types.c /usr/src/debug/qemu/9.2.3/storage-daemon/qapi/qapi-visit.c /usr/src/debug/qemu/9.2.3/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/9.2.3/include/sysemu/runstate-action.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_core.c /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-control.c /usr/src/debug/qemu/9.2.3/include/hw/misc/sifive_test.h /usr/src/debug/qemu/9.2.3/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/9.2.3/include/hw/net/allwinner-sun8i-emac.h /usr/src/debug/qemu/9.2.3/include/sys
 emu/cpus.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-control.h /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/9.2.3/tests/test-qapi-emit-events.h /usr/src/debug/qemu/9.2.3/include/hw/pci-host/mv64361.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_core.h /usr/src/debug/qemu/9.2.3/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/9.2.3/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/9.2.3/qapi/qapi-visit-misc.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_usb.h /usr/src/debug/qemu/9.2.3/trace/trace-backends_tpm.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_intc.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_scsi.h /usr/src/debug/qemu/9.2.3/include/qapi/qmp/json-writer.h /usr/src/debug/qemu/9.2.3/trace/trace-hw_usb.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_scsi.c /usr/src/debug/qemu/9.2.3/trace/trace-hw_intc.h", added "/usr/src/debug/qemu/10.0.0/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/memory_hotplug.h /usr/src/debug/qemu/10.0.0/qapi/qapi
 -visit-block.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/grackle.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_core.h /usr/src/debug/qemu/10.0.0/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.0.0/include/block/export.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_core.c /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.0.0/include/hw/arm/omap.h /usr/src/debug/qemu/10.0.0/include/hw/net/dp8393x.h /usr/src/debug/qemu/10.0.0/include/qapi
 /type-helpers.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-ui.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-ui.h /usr/src/debug/qemu/10.0.0/include/user/thunk.h /usr/src/debug/qemu/10.0.0/include/qapi/error.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-dmabuf.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_pmem.h /usr/src/debug/qemu/10.0.0/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_input.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/uninorth.h /usr/src/debug/qemu/10.0.0/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-gpu-pixman.h /usr/src/debug/qemu/10.0.0/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.0.0/qapi/qa
 pi-types-replay.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/vdpa-dev.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.0.0/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.0.0/include/migration/failover.h /usr/src/debug/qemu/10.0.0/trace/event-internal.h /usr/src/debug/qemu/10.0.0/include/hw/intc/armv7m_nvic.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_gpu.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_misc_target_trace_events.h /usr/src/debug/qemu/10.0.0/include/block/block_int-common.h /usr/src/debug/qemu/10.0.0/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/10.0.0/include/block/block_int-global-state.h /usr/src/debug/qemu/10.0.0/include/system/rng-random.h /usr/src/debug/qemu/10.0.0/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.0.0/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.
 0.0/include/system/numa.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-visit.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.0.0/trace/trace-scsi.h /usr/src/debug/qemu/10.0.0/include/migration/qemu-file-types.h /usr/src/debug/qemu/10.0.0/trace/trace-scsi.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.0.0/include/hw/intc/riscv_imsic.h /usr/src/debug/qemu/10.0.0/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.0.0/include/migration/global_state.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.0.0/qapi/qapi-
 types-machine-target.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/acpi_aml_interface.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-scsi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.0.0/include/block/snapshot.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.0.0/include/system/tpm_util.h /usr/src/debug/qemu/10.0.0/include/block/block_int-io.h /usr/src/debug/qemu/10.0.0/include/block/qdict.h /usr/src/debug/qemu/10.0.0/trace/trace-qom.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.0.0/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/acpi-defs.h /usr/src/debug/qemu/10.0.0/trace/trace-qom.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-crypto.h /usr/src/deb
 ug/qemu/10.0.0/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.0/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.0.0/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.0.0/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.0.0/include/system/cpus.h /usr/src/debug/qemu/10.0.0/include/hw/arm/virt.h /usr/src/debug/qemu/10.0.0/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.0.0/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.0.0/include/migration/colo.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.0.0/include/system/spdm-socket.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-blk.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virt
 io-bus.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-gpu.h /usr/src/debug/qemu/10.0.0/include/exec/tswap.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-mem.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-net.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-pci.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-rng.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.0.0/include/migration/misc.h /usr/src/debug/qemu/10.0.0/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-authz.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.0.0/trace/trace-authz.
 c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.0.0/include/exec/replay-core.h /usr/src/debug/qemu/10.0.0/include/system/iothread.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.0.0/include/exec/hwaddr.h /usr/src/debug/qemu/10.0.0/include/hw/intc/kvm_irqcount.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/10.0.0/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-input.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.0.0/include/system/dma.h /usr/src/debug/qemu/10.0.0/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.0.0/incl
 ude/system/event-loop-base.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_char.c /usr/src/debug/qemu/10.0.0/include/hw/pci-host/xilinx-pcie.h /usr/src/debug/qemu/10.0.0/include/hw/core/sysbus-fdt.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_char.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/pci-host/ppce500.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.0.0/include/qobject/json-parser.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.0.0/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/10.0.0/include/hw/net/cadence_gem.h /usr/src/debug/qemu/10
 .0.0/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-machine-target.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_net.h /usr/src/debug/qemu/10.0.0/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.0.0/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.0.0/include/hw/intc/arm_gicv3_its_common.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.0.0/include/user/mmap.h /usr/src/debug/qemu/10.0.0/include/exec/ioport.h /usr/src/debug/qemu/10.0.0/include/exec/memory-internal.h /usr/src/debug/qemu/10.0.0/include/hw/sd/sd.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-types-sub-sub-module.c /usr/src/debug/qemu/10.0.0/tests/test-qapi-visit-sub-sub-module.c /usr/src/debug/qemu/10.0.0/inclu
 de/hw/sd/aspeed_sdhci.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-job.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-net.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-types-sub-sub-module.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-visit-sub-sub-module.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-job.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-net.c /usr/src/debug/qemu/10.0.0/tests/test-qapi-types.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-balloon.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-visit.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_mips.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.0.0/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.0.0/tests/test-qapi-types.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-visit.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_mips.c /usr/src/debug/qemu/10.0.
 0/include/hw/acpi/aml-build.h /usr/src/debug/qemu/10.0.0/include/hw/arm/boot.h /usr/src/debug/qemu/10.0.0/include/hw/net/npcm_pcs.h /usr/src/debug/qemu/10.0.0/include/exec/memory.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/intc/i8259.h /usr/src/debug/qemu/10.0.0/include/system/os-posix.h /usr/src/debug/qemu/10.0.0/include/system/dump.h /usr/src/debug/qemu/10.0.0/include/hw/uefi/var-service.h /usr/src/debug/qemu/10.0.0/include/exec/exec-all.h /usr/src/debug/qemu/10.0.0/include/hw/core/split-irq.h /usr/src/debug/qemu/10.0.0/include/hw/intc/imx_avic.h /usr/src/debug/qemu/10.0.0/include/exec/cpu_ldst.h /usr/src/debug/qemu/10.0.0/include/hw/sd/cadence_sdhci.h /usr/src/debug/qemu/10.0.0/include/exec/translation-block.h /usr/src/debug/qemu/10.0.0/include/user/cpu_loop.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/q
 emu/10.0.0/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.0.0/include/system/kvm.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/intc/loongarch_extioi_common.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_crypto.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.0.0/trace/trace-root.h /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-root.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.0.0/include/qobject/qstring.h /usr/src/debug/qemu/10.0.0/include/
 qapi/string-input-visitor.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.0.0/include/exec/tlb-common.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/pci.h /usr/src/debug/qemu/10.0.0/include/exec/abi_ptr.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-acpi.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-mmio.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-pmem.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/generic_event_device.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-scsi.h /usr/src/debug/qemu/10.0.0/include/qapi/visitor.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-transaction.trace-events /usr
 /src/debug/qemu/10.0.0/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.0.0/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/fsl_imx8m_phy.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.0.0/include/user/guest-host.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-char.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/vmgenid.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/input.h /usr/src/debug/qemu/10.0.0/qapi/qapi-ty
 pes-yank.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-char.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.0.0/include/exec/vaddr.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.0.0/include/exec/memop.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.0.0/include/system/iommufd.h /usr/src/debug/qemu/10.0.0/include/hw/intc/xlnx-zynqmp-ipi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.0.0/i
 nclude/user/syscall-trace.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.0.0/include/qapi/compat-policy.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.0.0/include/block/replication.h /usr/src/debug/qemu/10.0.0/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.0.0/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.0.0/include/hw/net/lan9118.h /usr/src/debug/qemu/10.0.0/include/hw/net/allwinner_emac.h /usr/src/debug/qemu/10.0.0/include/hw/net/ftgmac100.h /usr/src/
 debug/qemu/10.0.0/include/block/block_backup.h /usr/src/debug/qemu/10.0.0/include/exec/gdbstub.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_mem.h /usr/src/debug/qemu/10.0.0/include/hw/intc/intc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_mem.c /usr/src/debug/qemu/10.0.0/include/block/write-threshold.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.0.0/include/block/block-io.h /usr/src/debug/qemu/10.0.0/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.0.0/include/hw/misc/unimp.h /usr/src/debug/qemu/10.0.0/include/system/arch_init.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.0.0/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-
 commands-replay.trace-events /usr/src/debug/qemu/10.0.0/include/system/kvm_int.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_audio.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_block.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_input.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_audio.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_block.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_input.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-iommu.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_timer.h /usr/src/debug/qemu/10.0.0/include/block/graph-lock.h /usr/src/debug/qemu/10.0.0/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-control.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.0.0/include/block/nvme.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwin
 ner-r40-ccu.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_blk.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-i2c.h /usr/src/debug/qemu/10.0.0/include/hw/sd/npcm7xx_sdhci.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-control.h /usr/src/debug/qemu/10.0.0/include/block/aio-wait.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/ich9_tco.h /usr/src/debug/qemu/10.0.0/include/hw/intc/arm_gicv3.h /usr/src/debug/qemu/10.0.0/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.0.0
 /include/system/seccomp.h /usr/src/debug/qemu/10.0.0/include/block/block-hmp-cmds.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_arm.c /usr/src/debug/qemu/10.0.0/include/system/host_iommu_device.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.0.0/include/hw/acpi/cpu.h /usr/src/debug/qemu/10.0.0/include/system/block-backend-common.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/i440fx.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_arm.h /usr/src/debug/qemu/10.0.0/include/hw/net/smc91c111.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.0.0/inclu
 de/hw/net/imx_fec.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/10.0.0/include/exec/target_page.h /usr/src/debug/qemu/10.0.0/include/user/signal.h /usr/src/debug/qemu/10.0.0/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.0.0/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.0.0/include/hw/intc/aspeed_intc.h /usr/src/debug/qemu/10.0.0/include/hw/intc/loongson_ipi.h /usr/src/debug/qemu/10.0.0/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.0.0/include/hw/intc/bcm2835_ic.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-machine-target.c /usr/src/debug/qemu/10.0.0/trace/trace-block.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.0.0/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.0.0/trace/trace-block.c /usr/src/debug/qemu/10.0.0/qapi/qapi-features.h /usr/src/debug/qemu/10.0.0/qapi/
 qapi-commands-yank.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-net.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-misc-target.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.0.0/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.0.0/trace/trace-target_arm.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-snd.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-net.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.0.0/trace/trace-target_arm.h /usr/src/debug/qemu/10.0.0/include/hw/intc/riscv_aplic.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-block.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-error.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.0.0/include/hw/misc/arm11scu.h /usr/src/debug/qemu
 /10.0.0/include/hw/intc/bcm2836_control.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.0.0/include/system/accel-ops.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-types-block.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-error.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.0.0/include/hw/pci-host/bonito.h /usr/src/debug/qemu/10.0.0/trace/trace-target_ppc.h /usr/src/debug/qemu/10.0.0/trace/trace-target_ppc.c /usr/src/debug/qemu/10.0.0/include/hw/intc/loongarch_pch_pic.h /usr/src/debug/qemu/10.0.0/host/include/generic/host/store-insert-al16.h.inc /usr/src/debug/qemu/10.0.0/include/hw/intc/loongson_ipi_common.h /u
 sr/src/debug/qemu/10.0.0/include/exec/target_long.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.0.0/trace/trace-util.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.0.0/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/pnv_phb3.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/pnv_phb4.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.0.0/host/include/generic/host/atomic128-cas.h.inc /usr/src/debug/qemu/10.0.0/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.0.0/trace/trace-util.h /usr/src/debug/qemu/10.0.0/include/hw/intc/allwinner-a10-pic.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio.h /usr/src/debug/qemu/
 10.0.0/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.0.0/include/user/abitypes.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.0.0/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.0.0/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.0.0/include/qobject/qlit.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-vsock-common.h /usr/src/debug/qemu/10.0.0/include/qobject/qnum.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.0.0/qapi
 /qapi-visit-block-core.c /usr/src/debug/qemu/10.0.0/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_snd.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-block.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-block.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.0.0/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.0.0/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.0.0/include/exec/page-vary.h /usr/src/debug/qemu/10.0.0/include/system/rtc.h /usr/src/debug/qemu/10.0.0/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.0.0/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/net/npcm7xx_emc.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/vhost_typ
 es.h /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/intc/mips_gic.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.0.0/include/block/blockjob_int.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.0.0/include/migration/register.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.0.0/include/hw/arm/digic.h /usr/src/debug/qemu/10.0.0/include/system/qtest.h /usr/src/debug/qemu/10.0.0/include/system/reset.h /usr/src/debug/qemu/10.0.0/include/system/stats.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_xen.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_xen.c /usr/src/debug/qemu/10.0.0/include/hw/uefi/hardware-info.h /usr/src/deb
 ug/qemu/10.0.0/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.0.0/include/system/balloon.h /usr/src/debug/qemu/10.0.0/include/system/hw_accel.h /usr/src/debug/qemu/10.0.0/include/system/kvm_xen.h /usr/src/debug/qemu/10.0.0/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.0/include/hw/intc/exynos4210_gic.h /usr/src/debug/qemu/10.0.0/include/system/blockdev.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-scmi.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-fs.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-emit-events.h /usr/src/debug/qemu/10.0.0/include/exec/address-spaces.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_dma.h /usr/src/debug/qemu/10.0.0/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-base.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_dma.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.0.0/include/hw/net/ne2000-isa.h /usr/src/debug/qemu/10.0.0/trace/control-internal.h /usr/src/d
 ebug/qemu/10.0.0/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-char.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-gpio.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-char.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.0.0/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.0.0/include/hw/net/allwinner-sun8i-emac.h /usr/src/debug/qemu/10.0.0/qapi/qapi-comma
 nds-misc-target.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-gpu-bswap.h /usr/src/debug/qemu/10.0.0/include/exec/memattrs.h /usr/src/debug/qemu/10.0.0/include/exec/memopidx.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-events.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/10.0.0/tests/test-qapi-events.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_intc.c /usr/src/debug/qemu/10.0.0/include/hw/pci-host/remote.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-types.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_intc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.0.0/trace/trace-target_riscv.h /usr/src/debug/qemu/10.0.0/trace/trace-net.h /usr/src/debug/qemu/10.0.0/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.0.0/include/system/accel-blocker.h /usr/src/debug/qemu/10.0.0/trace/trace-net.c /usr/src/debug/qemu/10.0.0/trace/trace-target_riscv
 .c /usr/src/debug/qemu/10.0.0/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.0.0/include/hw/intc/arm_gic.h /usr/src/debug/qemu/10.0.0/include/hw/intc/ppc-uic.h /usr/src/debug/qemu/10.0.0/include/block/dirty-bitmap.h /usr/src/debug/qemu/10.0.0/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.0.0/include/hw/acpi/cxl.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.0.0/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_usb.c /usr/src/debug/qemu/10.0.0/include/system/block-backend-io.h /usr/src/debug/qemu/10.0.0/include/user/safe-syscall.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_usb.h /usr/src/debug/qemu/10.0.0/include/block/block-copy.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.0.0/include/hw/net/xlnx-zynqmp-can.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.0.0/trace/tr
 ace-hw_sh4.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.0.0/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.0.0/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.0.0/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.0.0/include/hw/sd/sdhci.h /usr/src/debug/qemu/10.0.0/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_balloon.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.0.0/include/user/guest-base.h /usr/src/debug/qemu/10.0.0/include/hw/intc/aspeed_vic.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands
 _misc_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.0.0/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.0.0/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.0.0/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/gpex.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.0.0/include/system/dirtyrate.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.0.0/host/include/x86_64/host/atomic128-ldst.h.inc /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.0.0/include/exec/breakpoint.h /usr/src/debug/qemu/10.0.0/include/qapi/qmp-event.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-machine-target.trace-events /usr/src/debug/qemu/10.0.0/include/hw/misc/empty_slot.h /usr
 /src/debug/qemu/10.0.0/trace/trace-io.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/mv64361.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.0.0/trace/trace-system.c /usr/src/debug/qemu/10.0.0/trace/trace-io.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.0.0/trace/trace-system.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.0.0/include/migration/blocker.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_fs.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-scsi-common.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /us
 r/src/debug/qemu/10.0.0/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.0.0/include/exec/cpu-common.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.0.0/include/hw/acpi/pcihp.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/piix4.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/utils.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.0.0/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.0.0/include/migration/snapshot.h /usr/src/debug/qemu/10.0.0/include/system/cpu-throttle.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_timer.c /usr/src/debug/qemu/10.0.0/include/exec/ram_addr.h /usr/src/debug/qemu/10.0.0/include/exec/ramblock.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/udmabuf.h /usr/src/debug/qemu/10.0.0/include/system/tcg.h /usr/src/debug/qemu/10.0.0/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.0.0/trace/
 trace-hw_net.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.0.0/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_net.c /usr/src/debug/qemu/10.0.0/include/hw/acpi/acpi.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/erst.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/ghes.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/ich9.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/ipmi.h /usr/src/debug/qemu/10.0.0/include/hw/intc/loongarch_pic_common.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_misc.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_misc.h /usr/src/debug/qemu/10.0.0/include/hw/intc/arm_gicv3_common.h /usr/src/debug/qemu/10.0.0/include/system/cpu-timers.h /usr/src/debug/qemu/10.0.0/include/hw/misc/auxbus.h /usr/src/debug/qemu/10.0.0/trace/tr
 ace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.0.0/trace/control.h /usr/src/debug/qemu/10.0.0/include/hw/core/cpu.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-job.c /usr/src/debug/qemu/10.0.0/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.0.0/include/system/xen.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-job.h /usr/src/debug/qemu/10.0.0/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.0.0/include/block/ufs.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.0.0/include/hw/intc/exynos4210_combiner.h /usr/src/debug/qemu/10.0.0/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.0/include/system/tpm.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.0.0/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32f2x
 x_syscfg.h /usr/src/debug/qemu/10.0.0/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.0.0/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/core/generic-loader.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.0.0/include/qapi/util.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.0.0/include/hw/intc/realview_gic.
 h /usr/src/debug/qemu/10.0.0/tcg/i386/tcg-target.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.0.0/include/block/aio.h /usr/src/debug/qemu/10.0.0/include/block/raw-aio.h /usr/src/debug/qemu/10.0.0/include/block/reqlist.h /usr/src/debug/qemu/10.0.0/include/hw/intc/loongarch_extioi.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_isa.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_isa.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_console.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-md-pci.h /usr/src/debug/qemu/10.0.0
 /include/standard-headers/linux/virtio_ring.h /usr/src/debug/qemu/10.0.0/include/system/device_tree.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.0.0/include/system/runstate.h /usr/src/debug/qemu/10.0.0/include/hw/sd/allwinner-sdhost.h /usr/src/debug/qemu/10.0.0/include/system/watchdog.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.0.0/trace/trace-gdbstub.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.0.0/include/qobject/qbool.h /usr/src/debug/qemu/10.0.0/include/qobject/qdict.h /usr/src/debug/qemu/10.0.0/include/qobject/qjson.h /usr/src/debug/qemu/10.0.0/include/qobject/qlist.h /usr/src/debug/qemu/10.0.0/include/qobject/qnull.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/vmclock-abi.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-features.h /usr/src/debug/qemu/10.0
 .0/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.0.0/trace/trace-gdbstub.c /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_mem.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-misc-target.trace-events /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-events.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_ide.h /usr/src/debug/qemu/10.0.0/include/hw/net/lan9118_phy.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/10.0.0/include/hw/sd/bcm2835_sdhost.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_ide.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/10.0.0/trace/trace-chardev.h /usr/src/debug/qemu/10.0.0/trace/trace-linux_user.c /usr/src/debug/qemu/10.0.0/hw/riscv/riscv-iommu-bits.h /usr/src/debug/qemu/10.0.0/trace/trace-chardev.c /usr/src/debug/qemu/10.0.0/t
 race/trace-linux_user.h /usr/src/debug/qemu/10.0.0/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.0.0/tcg/i386/tcg-target.c.inc /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.0.0/trace/trace-target_i386.c /usr/src/debug/qemu/10.0.0/include/block/nbd.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-rng.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/qemu_fw_cfg.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.0.0/tcg/i386/tcg-target-has.h /usr/src/debug/qemu/10.0.0/trace/trace-target_i386.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-char.h /usr/src/debug/qe
 mu/10.0.0/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.0.0/hw/riscv/riscv-iommu.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.0.0/include/system/dump-arch.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-commands.c /usr/src/debug/qemu/10.0.0/include/hw/net/msf2-emac.h /usr/src/debug/qemu/10.0.0/include/hw/net/npcm_gmac.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-commands.h /usr/src/debug/qemu/10.0.0/include/system/tpm_backend.h /usr/src/debug/qemu/10.0.0/include/hw/intc/loongarch_pch_msi.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-blk-common.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.0.0/include/hw/arm/armsse.h /usr/src/debug/qemu/10.0.0/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.0.0/include/hw/arm/aspeed.h /usr/
 src/debug/qemu/10.0.0/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.0.0/include/system/replay.h /usr/src/debug/qemu/10.0.0/include/system/system.h /usr/src/debug/qemu/10.0.0/trace/trace-migration.c /usr/src/debug/qemu/10.0.0/trace/trace-migration.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit.c /usr/src/debug/qemu/10.0.0/include/hw/intc/sifive_plic.h /usr/src/debug/qemu/10.0.0/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.0.0/include/block/qapi.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/bios-linker-loader.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trac
 e-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/uefi/var-service-edk2.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/iothread-vq-mapping.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.0.0/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.0.0/include/hw/core/sysemu-cpu-ops.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-vsock.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.0.0/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-features.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.0.0/include/hw/misc/bcm2835
 _mphi.h /usr/src/debug/qemu/10.0.0/include/migration/vmstate.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.0.0/include/qobject/json-writer.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/pci-host/designware.h /usr/src/debug/qemu/10.0.0/include/exec/translator.h /usr/src/debug/qemu/10.0.0/include/hw/misc/led.h /usr/src/debug/qemu/10.0.0/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.0.0/include/qobject/qobject.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_yank_trace_events.
 h /usr/src/debug/qemu/10.0.0/include/exec/cputlb.h /usr/src/debug/qemu/10.0.0/include/block/block-common.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.0.0/include/hw/core/resetcontainer.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.0.0/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.0.0/include/exec/plugin-gen.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.0.0/include/exec/tb-flush.h /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.0.0/qapi/qapi-events.c /usr/src/debug/qemu/10.0.0/include/exec/ramlist.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.0.0/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.0.0/tests/test-qapi-introspect.h /usr/src/debug/qemu/10.0.0/qapi
 /qapi-visit-machine-common.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-introspect.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.0.0/include/hw/net/xlnx-versal-canfd.h /usr/src/debug/qemu/10.0.0/include/system/hostmem.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-vsock.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_types.h /usr/src/debug/qemu/10.0.0/trace/trace-nbd.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/tpm.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_adc.c /usr/src/debug/qemu/10.0.0/include/exec/page-protection.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.0.0/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.0.0/include/user/page-protection.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mips_cmgcr.h /usr/src/debug
 /qemu/10.0.0/trace/trace-hw_adc.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.0.0/trace/trace-nbd.c /usr/src/debug/qemu/10.0.0/trace/trace-audio.c /usr/src/debug/qemu/10.0.0/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.0.0/trace/trace-audio.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.0.0/include/block/thread-pool.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/intc/ioapic.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_pci.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands
 _block_export_trace_events.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-init-commands.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.0.0/include/block/aio_task.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/spapr.h /usr/src/debug/qemu/10.0.0/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.0.0/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.0.0/tests/test-qapi-init-commands.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.0.0/include/hw/intc/heathrow_pic.h /usr/src/debug/qemu/10.0.0/include/hw/intc/imx_gpcv2.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.0.0/include/system/memory_mapping.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-zynqmp-crf.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.0.0/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.0.0/include/hw/
 arm/bcm2836.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/ich9_timer.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/pam.h /usr/src/debug/qemu/10.0.0/include/block/throttle-groups.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_iommu.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-common.c /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-zynqmp-apu-ctrl.h /usr/src/debug/qemu/10.0.0/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-access.h /usr/src/debug/qemu/10.0.0/qapi/qapi-types-common.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_vsock.h /usr/src/debug/qemu/10.0.0/include/system/runstate-action.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.0.0/include/hw/acpi/acpi_dev_interface.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-scsi.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-vdpa.h /usr/src/debug/qe
 mu/10.0.0/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.0.0/trace/trace-ui.c /usr/src/debug/qemu/10.0.0/include/hw/intc/loongarch_ipi.h /usr/src/debug/qemu/10.0.0/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_pci.c /usr/src/debug/qemu/10.0.0/include/migration/client-options.h /usr/src/debug/qemu/10.0.0/include/block/accounting.h /usr/src/debug/qemu/10.0.0/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_pci.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.0.0/trace/trace-ui.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.0.0/include/system/rng.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.0.0/include/hw/acpi/vmclock.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10
 .0.0/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-backend.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_i386.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.0.0/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.0.0/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_i386.h /usr/src/debug/qemu/10.0.0/include/hw/pci-host/q35.h /usr/src/debug/qemu/10.0.0/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.0/include/system/dirtylimit.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.0.0/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.0.0/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.0.0/include/exec/cpu-all.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.0.0/include/s
 ystem/cryptodev.h /usr/src/debug/qemu/10.0.0/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.0.0/include/standard-headers/linux/virtio_scsi.h /usr/src/debug/qemu/10.0.0/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-gpu-pci.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_remote.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_remote.c /usr/src/debug/qemu/10.0.0/include/block/blockjob.h /usr/src/debug/qemu/10.0.0/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_sd.c /usr/sr
 c/debug/qemu/10.0.0/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.0.0/include/migration/cpr.h /usr/src/debug/qemu/10.0.0/include/hw/arm/xlnx-zynqmp.h /usr/src/debug/qemu/10.0.0/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.0.0/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.0.0/include/hw/virtio/virtio-serial.h /usr/src/debug/qemu/10.0.0/tcg/i386/tcg-target-con-str.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_sd.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.0.0/include/hw/intc/riscv_aclint.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.0.0/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.0.0/host/include/x86_64/host/load-extract-al16-al8.h
 .inc /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_display.h /usr/src/debug/qemu/10.0.0/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.0.0/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.0.0/trace/trace-backends.h /usr/src/debug/qemu/10.0.0/trace/trace-monitor.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_display.c /usr/src/debug/qemu/10.0.0/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.0.0/trace/trace-backends.c /usr/src/debug/qemu/10.0.0/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/10.0.0/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.0/include/hw/virtio/vhost-user-blk.h /usr/src/debug/qemu/10.0.0/trace/trace-monitor.h /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-uefi.c /usr
 /src/debug/qemu/10.0.0/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.0.0/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.0.0/include/block/block-global-state.h /usr/src/debug/qemu/10.0.0/include/hw/acpi/cpu_hotplug.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.0.0/include/hw/intc/loongson_liointc.h /usr/src/debug/qemu/10.0.0/storage-daemon/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.0.0/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.0.0/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.0.0/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.0.0/include/exec/log.h /usr/src/debug/qem
 u/10.0.0/include/hw/intc/arm_gic_common.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.0.0/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.0.0/qapi/qapi-commands-block.h"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31563976 to 31873736 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29196704 to 29379616 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26918152 to 27083752 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14823784 to 15027816 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13713704 to 13833960 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13856392 to 13974696 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15799432 to 15922440 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13709608 to 13829864 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15944608 to 16029344 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 17082216 to 17183176 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 15987912 to 16229704 (+2%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16042664 to 16305480 (+2%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12191648 to 12360384 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26965032 to 27134728 (+1%)
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5145184 to 5280928 (+3%)
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3286080 to 3343488 (+2%)
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2678464 to 2711776 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2537832 to 2569576 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGSIZE changed from 3130368 to 3153728 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-mips: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGSIZE changed from 3154656 to 3186208 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGSIZE changed from 3146464 to 3178016 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGSIZE changed from 3118080 to 3141440 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 2961856 to 2993600 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGSIZE changed from 3036672 to 3064320 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGSIZE changed from 3020288 to 3056128 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGSIZE changed from 3410624 to 3445280 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3463872 to 3523104 (+2%)
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGSIZE changed from 1968768 to 2000512 (+2%)
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGSIZE changed from 874792 to 879080 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGSIZE changed from 2658752 to 2696160 (+1%)
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
packages/core2-64-poky-linux/qemu/qemu: PV changed from "9.2.3" to "10.0.0"
packages/core2-64-poky-linux/qemu/qemu: PKGV changed from 9.2.3 [default] to 10.0.0 [default]
Changes to packages/core2-64-poky-linux/qemu (sysroot):
  /usr/share/qemu/npcm8xx_bootrom.bin was added
  /usr/share/qemu/pnv-pnor.bin was added
Changes to packages/x86_64-linux/qemu-system-native (sysroot):
  /usr/share/qemu/npcm8xx_bootrom.bin was added
  /usr/share/qemu/pnv-pnor.bin was added

--===============7286123539665891835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/qemu/qemu-common: FILELIST: added "/usr/share/qemu/npcm8xx_bootrom.bin /usr/share/qemu/pnv-pnor.bin"
packages/core2-64-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/migration.py /usr/lib/qemu/ptest/tests/avocado/vnc.py /usr/lib/qemu/ptest/tests/avocado/intel_iommu.py /usr/lib/qemu/ptest/tests/qtest/m48t59-test /usr/lib/qemu/ptest/tests/avocado/hotplug_blk.py /usr/lib/qemu/ptest/tests/avocado/hotplug_cpu.py /usr/lib/qemu/ptest/tests/avocado/kvm_xen_guest.py /usr/lib/qemu/ptest/tests/avocado/boot_xen.py", added "/usr/lib/qemu/ptest/tests/qtest/ast2700-smc-test /usr/lib/qemu/ptest/tests/qtest/vmcoreinfo-test /usr/lib/qemu/ptest/tests/tcg/plugins/libreset.so /usr/lib/qemu/ptest/tests/qtest/intel-iommu-test /usr/lib/qemu/ptest/tests/qtest/riscv-csr-test"
Changes to packages/core2-64-poky-linux/qemu (sysroot):
  /usr/share/qemu/npcm8xx_bootrom.bin was added
  /usr/share/qemu/pnv-pnor.bin was added
Changes to packages/x86_64-linux/qemu-system-native (sysroot):
  /usr/share/qemu/npcm8xx_bootrom.bin was added
  /usr/share/qemu/pnv-pnor.bin was added

--===============7286123539665891835==--

