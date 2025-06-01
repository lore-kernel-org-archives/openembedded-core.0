Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559F4C5B55A
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27766.1748786123737888376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hmfy9t+F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IC9yWPPE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc69416-898f4f6d-acd4-4a69-91ff-2535aff28ffa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/geD6+D60agE8Hnfb4FMlYu/oKIWgaa2ykn/Pjcxoi8=;
	b=Hmfy9t+F6uWJJAcNPO4uMB4om8A7b57mjCMQXiEzjpo3dTTtPwfyrt75urxREVn/
	NbtW7y+EAZPYQq41kv9iSJlN6BnKdVkKvgtkLWAJa9N28LPyxzFOZ4lnh5ClpDjmKl8
	L8DKkxsTgdoIishasRes18Pr77Ha5lErprv6xVhQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/geD6+D60agE8Hnfb4FMlYu/oKIWgaa2ykn/Pjcxoi8=;
	b=IC9yWPPEupm0zPGOHD7PXIioxUcMGprwacrIdg4xB69BW+RZwynzC1HJyQHKUo7S
	9X8V+9sGfHr6CZMxe4NLgBVB3pGznKel90kYffdQJrrXqquu6ClGxIFCTsuCvG0FvOn
	xSdFLmllF07Trfn8eYUrcy1lGZkBcRP+HOjWgBMk=
Content-Type: multipart/mixed; boundary="===============7166230060516297235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu,qemu-native: upgrading to
 10.0.2,10.0.2,10.0.2 SUCCEEDED
Message-ID: <010101972bc69416-898f4f6d-acd4-4a69-91ff-2535aff28ffa-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217565

--===============7166230060516297235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu,qemu-native* to *10.0.2,10.0.2,10.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-system-native-qemu-qemu-native-upgrade-10.0.0-1.patch
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
From 4e7d5b654ca06cce5d6bd5174319c335492f3580 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 06:51:20 +0000
Subject: [PATCH] qemu-system-native,qemu,qemu-native: upgrade 10.0.0 ->
 10.0.2,10.0.0 -> 10.0.2,10.0.0 -> 10.0.2

---
 .../qemu/{qemu-native_10.0.0.bb => qemu-native_10.0.2.bb}   | 0
 ...system-native_10.0.0.bb => qemu-system-native_10.0.2.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                         | 2 +-
 ...mu-Add-addition-environment-space-to-boot-loader-q.patch | 2 +-
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch      | 2 +-
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch  | 2 +-
 ...mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch             | 2 +-
 ...sts-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch    | 2 +-
 ...mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 2 +-
 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch   | 6 +++---
 .../qemu/{qemu_10.0.0.bb => qemu_10.0.2.bb}                 | 0
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.0.bb => qemu-native_10.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.0.bb => qemu-system-native_10.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_10.0.0.bb => qemu_10.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0842a7b20a..0aba6d8276 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896"
+SRC_URI[sha256sum] = "ef786f2398cb5184600f69aef4d5d691efd44576a3cff4126d38d4c6fec87759"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index e7e816dbfa..f27208f45f 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 41b238e15df84a4181a2b39cfbcc52a08f9fdbba Mon Sep 17 00:00:00 2001
+From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 566079f8ad..ad5c5ba03e 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 70697264fc5aa9679c5f1cdcb590252254c44983 Mon Sep 17 00:00:00 2001
+From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index de22516e1d..c04e42608f 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 09936dc09b577448d354e82919829ef6a809dc94 Mon Sep 17 00:00:00 2001
+From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 9e5dceb566..388d11d10d 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 8ab2b722da7868c507cfdd67ae6d535c8ba36f53 Mon Sep 17 00:00:00 2001
+From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 2bf9baf7ea..4690d86315 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 30d463f09142faa745a8756df95a2ff6434c2335 Mon Sep 17 00:00:00 2001
+From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 9cf1a52259..7c24f432f2 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 8536e8cce199eec6e8c403c4a7ca95a7fb55e1cf Mon Sep 17 00:00:00 2001
+From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 0f8cf06eae..54421544bb 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From aa00914a01cc969f6061097cc8e597b528465ad6 Mon Sep 17 00:00:00 2001
+From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 073b868f47..28a10d98bd 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9067e464685cb503d58a07520769a49c5f9f2e47 Mon Sep 17 00:00:00 2001
+From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index d2d35083ec..b06020d106 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From e0ae1256317af5157c44b7a56e045c3dbee8c923 Mon Sep 17 00:00:00 2001
+From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 4451c5d52f..1cc973443e 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 0d201513f96e79a7640933205072c5704b2727e0 Mon Sep 17 00:00:00 2001
+From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index 0f4997a91..4559d0fac 100644
+index 8001ca153..79fb43f92 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1885,8 +1885,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1968,8 +1968,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.0.bb b/meta/recipes-devtools/qemu/qemu_10.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.2.bb
-- 
2.47.1


--===============7166230060516297235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/qemu: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://000
 2-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1866117912 to 1865959112 (-0%)
packages/core2-64-poky-linux/qemu/qemu-dev: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-dev: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-doc: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-doc: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-locale: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-locale: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 33575738 to 33582523 (+0%)
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26867848 to 26868008 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16026120 to 16017928 (-0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16097800 to 16093704 (-0%)
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26918824 to 26918984 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2707680 to 2707840 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGSIZE changed from 3461664 to 3453472 (-0%)
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3535392 to 3527200 (-0%)
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 10.0.0 [default] to 10.0.2 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGSIZE changed from 2692064 to 2696320 (+0%)
packages/core2-64-poky-linux/qemu/qemu: PV changed from "10.0.0" to "10.0.2"
packages/core2-64-poky-linux/qemu/qemu: PKGV changed from 10.0.0 [default] to 10.0.2 [default]

--===============7166230060516297235==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-system-native-qemu-qemu-native-upgrade-10.0.0-1.patch"

RnJvbSA0ZTdkNWI2NTRjYTA2Y2NlNWQ2YmQ1MTc0MzE5YzMzNTQ5MmYzNTgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNjo1MToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtc3lzdGVtLW5hdGl2ZSxxZW11LHFlbXUtbmF0aXZlOiB1cGdyYWRlIDEwLjAuMCAtPgogMTAu
MC4yLDEwLjAuMCAtPiAxMC4wLjIsMTAuMC4wIC0+IDEwLjAuMgoKLS0tCiAuLi4vcWVtdS97cWVt
dS1uYXRpdmVfMTAuMC4wLmJiID0+IHFlbXUtbmF0aXZlXzEwLjAuMi5iYn0gICB8IDAKIC4uLnN5
c3RlbS1uYXRpdmVfMTAuMC4wLmJiID0+IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjIuYmJ9IHwg
MAogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiAuLi5tdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9v
dC1sb2FkZXItcS5wYXRjaCB8IDIgKy0KIC4uLi9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZh
bGx0aHJvdWdoLXRvLVBJQy5wYXRjaCAgICAgIHwgMiArLQogLi4uL3FlbXUvMDAwNC1xZW11LURv
LW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCAgfCAyICstCiAuLi5tdS1BZGQt
c29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaCB8IDIgKy0K
IC4uLi9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoICAgICAgICAg
ICAgIHwgMiArLQogLi4uc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVy
LXRvLWZpbGUucGF0Y2ggfCAyICstCiAuLi5maW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZB
TElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaCB8IDIgKy0KIC4uLi8wMDEwLWNvbmZpZ3VyZS1sb29r
dXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoICAgIHwgMiArLQogLi4ubXUtRW5zdXJl
LXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggfCAyICstCiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gg
ICB8IDYgKysrLS0tCiAuLi4vcWVtdS97cWVtdV8xMC4wLjAuYmIgPT4gcWVtdV8xMC4wLjIuYmJ9
ICAgICAgICAgICAgICAgICB8IDAKIDE0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDEzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11
LW5hdGl2ZV8xMC4wLjAuYmIgPT4gcWVtdS1uYXRpdmVfMTAuMC4yLmJifSAoMTAwJSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuMC5i
YiA9PiBxZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4yLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdV8xMC4wLjAuYmIgPT4gcWVtdV8xMC4wLjIuYmJ9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZl
XzEwLjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjAu
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4wLjIuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4yLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5
c3RlbS1uYXRpdmVfMTAuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4yLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUu
aW5jCmluZGV4IDA4NDJhN2IyMGEuLjBhYmE2ZDgyNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUuaW5jCkBAIC0zOCw3ICszOCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5x
ZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRw
czovL3d3dy5xZW11Lm9yZyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+
XGQrKFwuXGQrKSspXC50YXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMmMwNzU2MDFmZGNm
OGM3YjI2NzFhODM5ZWJkY2VmMWQ0ZjI5NzNlYjY3MzUyNTRmZDJlMWJkMGYzMGIzODk2IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImVmNzg2ZjIzOThjYjUxODQ2MDBmNjlhZWY0ZDVkNjkxZWZkNDQ1
NzZhM2NmZjQxMjZkMzhkNGM2ZmVjODc3NTkiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMDk5OF0g
PSAibm90LWFwcGxpY2FibGUtY29uZmlnOiBUaGUgVk5DIHNlcnZlciBjYW4gZXhwb3NlIGhvc3Qg
ZmlsZXMgdWRlciBzb21lIGNpcmN1bXN0YW5jZXMuIFdlIGRvbid0IGVuYWJsZSBpdCBieSBkZWZh
dWx0LiIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAx
LXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRp
b24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaAppbmRleCBlN2U4MTZk
YmZhLi5mMjcyMDhmNDVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2Fk
ZXItcS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVt
dS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNDFiMjM4ZTE1ZGY4NGE0MTgxYTJiMzljZmJjYzUyYTA4Zjlm
ZGJiYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjcyNzNmY2FjNjg1Nzc1MGYwN2Ey
NjMyYmRiNmIwZWQ2NmFlOTgyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEphc29u
IFdlc3NlbCA8amFzb24ud2Vzc2VsQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDI4IE1hciAy
MDE0IDE3OjQyOjQzICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IEFkZCBhZGRpdGlvbiBl
bnZpcm9ubWVudCBzcGFjZSB0byBib290IGxvYWRlcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFs
bHRocm91Z2gtdG8tUElDLnBhdGNoCmluZGV4IDU2NjA3OWY4YWQuLmFkNWM1YmEwM2UgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZh
bGx0aHJvdWdoLXRvLVBJQy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDcwNjk3MjY0ZmM1YWE5Njc5YzVmMWNkY2I1OTAyNTIyNTRjNDQ5ODMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE5Yjk1MDczZTVkNDJkYzRhYTUzOTJkYTNkNDIyYWI2
NjgwMDMxMDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrIEFzc2Vsc3RpbmUg
PG1hcmsuYXNzZWxzdGluZUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBGZWIgMjAxMyAx
MTo0MzoyOCAtMDUwMAogU3ViamVjdDogW1BBVENIXSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0
byBQSUMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1x
ZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90
LWV4aXN0cy5wYXRjaAppbmRleCBkZTIyNTE2ZTFkLi5jMDRlNDI2MDhmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1m
aWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAwOTkzNmRjMDliNTc3NDQ4ZDM1NGU4MjkxOTgyOWVmNmE4MDlk
Yzk0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MTMwNjRmOWZlNzI0ZmExYjcwYjli
ZjZkZDM0NDRjN2RkZGViOTI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3Np
eSBPYml0b3Rza3l5IDxvb2JpdG90c0BjaXNjby5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIw
IDIxOjIxOjM1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZp
bGUgaWYgbm90IGV4aXN0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNz
LW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1B
ZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaAppbmRl
eCA5ZTVkY2ViNTY2Li4zODhkMTFkMTBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRv
LWFkZHJlc3MtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVz
bC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGFiMmI3MjJkYTc4NjhjNTA3Y2ZkZDY3YWU2
ZDUzNWM4YmEzNmY1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjJhZGZjNzAzZTk0
ODE5YjBkYWNhOThmZGUxZDBhMzAxNjhjMjkyZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgog
RGF0ZTogRnJpLCA4IEphbiAyMDIxIDE3OjI3OjA2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFl
bXU6IEFkZCBzb21lIHVzZXIgc3BhY2UgbW1hcCB0d2Vha3MgdG8gYWRkcmVzcyBtdXNsIDMyIGJp
dApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUt
RGV0ZXJtaW5pc20tZml4ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaAppbmRleCAyYmY5YmFmN2VhLi40Njkw
ZDg2MzE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYt
cWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMzBkNDYzZjA5MTQyZmFhNzQ1YTg3NTZkZjk1YTJmZjY0MzRjMjMzNSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTAzMjcyNmU5ZGE4ZGUwMDg4ZDZjNzBjZmQ5MmUwYTUy
MTU1MzE1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogTW9uLCAxIE1hciAyMDIx
IDEzOjAwOjQ3ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IERldGVybWluaXNtIGZpeGVz
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMt
bWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2Ut
cmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCmluZGV4IDljZjFhNTIyNTkuLjdj
MjRmNDMyZjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAw
Ny10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNv
bi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA4NTM2ZThjY2UxOTllZWM2ZThjNDAzYzRhN2NhOTVhN2ZiNTVlMWNmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlYmVhYjA2NzQ3MzA2ZWMxNjI5OTIwN2JmNGJk
NzQ4MWE0NzJiNGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExp
IDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTQgSmFuIDIwMjEgMDY6
MzM6MDQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvbWVzb24uYnVpbGQ6IHVzZSByZWxh
dGl2ZSBwYXRoIHRvIHJlZmVyIHRvIGZpbGVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElE
QVRFLW9uLW5lZWRlZC1saS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxp
LnBhdGNoCmluZGV4IDBmOGNmMDZlYWUuLjU0NDIxNTQ0YmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFS
RURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUt
b24tbmVlZGVkLWxpLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhYTAwOTE0YTAxY2M5Njlm
NjA2MTA5N2NjOGU1OTdiNTI4NDY1YWQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5
YzIyNTIzNGE3NTZmMjc0NWNmMDRjM2MzYWY2ZWY2YjZhY2Y0Mjc3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwg
MjEgTWFyIDIwMjIgMTA6MDk6MzggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIE1BUF9T
WU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5lZWRlZCBsaW51eApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVz
b24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNo
CmluZGV4IDA3M2I4NjhmNDcuLjI4YTEwZDk4YmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZy
b20tUEFUSC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAt
Y29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDkwNjdlNDY0Njg1Y2I1MDNkNThhMDc1MjA3NjlhNDljNWY5ZjJlNDcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlhZGYzZmMzZWEyY2JjY2I0MWQ0OTY5NWE1M2M3
NGZlZDY4NTBmYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/TWFy
dGluPTIwSHVuZGViPUMzPUI4bGw/PSA8bWFydGluQGdlYW5peC5jb20+CiBEYXRlOiBXZWQsIDIy
IE1heSAyMDI0IDE0OjAyOjU1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogbG9v
a3VwIG1lc29uIGV4dXRhYmxlIGZyb20gUEFUSApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52
LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9y
LS5wYXRjaAppbmRleCBkMmQzNTA4M2VjLi5iMDYwMjBkMTA2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0
aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJl
bi10LXVzZWQtZm9yLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTBhZTEyNTYzMTdhZjUx
NTdjNDRiN2E1NmUwNDVjM2RiZWU4YzkyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MGQ4NTk4ODQ1N2E0NzVjMjViODQwODVjZjA5MDA0MDE1MGE5YzE2ZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMiBNYXkgMjAyNCAxMzo1ODoyMyArMDIwMAogU3ViamVj
dDogW1BBVENIXSBxZW11OiBFbnN1cmUgcGlwIGFuZCB0aGUgcHl0aG9uIHZlbnYgYXJlbid0IHVz
ZWQgZm9yIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKaW5kZXggNDQ1MWM1ZDUyZi4uMWNjOTczNDQz
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3RyZXJy
b3JuYW1lX25wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4
LXN0cmVycm9ybmFtZV9ucC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGQyMDE1MTNmOTZl
NzlhNzY0MDkzMzIwNTA3MmM1NzA0YjI3MjdlMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gN2UwOTY1NGZhMTc5YWQ1ZmFiMWRjMGE0Nzg4NmM2YTFhMmFjYzA5NyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IE5hdGFuYWVsIENvcGEgPG5jb3BhQGFscGluZWxpbnV4Lm9yZz4K
IERhdGU6IFdlZCwgMTggU2VwIDIwMjQgMTY6MTk6MzcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0g
dGFyZ2V0L3Jpc2N2L2t2bTogZG8gbm90IHVzZSBub24tcG9ydGFibGUgc3RyZXJyb3JuYW1lX25w
KCkKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBOYXRhbmFlbCBDb3BhIDxuY29w
YUBhbHBpbmVsaW51eC5vcmc+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMgYi90
YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYwotaW5kZXggMGY0OTk3YTkxLi40NTU5ZDBmYWMgMTAw
NjQ0CitpbmRleCA4MDAxY2ExNTMuLjc5ZmI0M2Y5MiAxMDA2NDQKIC0tLSBhL3RhcmdldC9yaXNj
di9rdm0va3ZtLWNwdS5jCiArKysgYi90YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYwotQEAgLTE4
ODUsOCArMTg4NSw3IEBAIHN0YXRpYyBib29sIGt2bV9jcHVfcmVhbGl6ZShDUFVTdGF0ZSAqY3Ms
IEVycm9yICoqZXJycCkKK0BAIC0xOTY4LDggKzE5NjgsNyBAQCBzdGF0aWMgYm9vbCBrdm1fY3B1
X3JlYWxpemUoQ1BVU3RhdGUgKmNzLCBFcnJvciAqKmVycnApCiAgICAgIGlmIChyaXNjdl9oYXNf
ZXh0KCZjcHUtPmVudiwgUlZWKSkgewogICAgICAgICAgcmV0ID0gcHJjdGwoUFJfUklTQ1ZfVl9T
RVRfQ09OVFJPTCwgUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PTik7CiAgICAgICAgICBpZiAocmV0
KSB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjAuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTAuMC4yLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEw
LjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4wLjIu
YmIKLS0gCjIuNDcuMQoK

--===============7166230060516297235==--

