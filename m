Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1892CA0EE8
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11323.1755263219462838417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=4BneEtAc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ewus5/9l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010198add732fa-374c2fba-12b9-4be3-9bea-5543af3c7aae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a9LoUplnwGAMdwVhZibdCj0VLAqsS6nnKgfwUxG2J9c=;
	b=4BneEtAcKEQA5KWbhER6O7Qe6Rj0yUdPHX6rupXXX/ozJKcMXfy8Q7THbNoUDxXI
	cJQtUkc6UxzlSsgbGIkS0gxjfqbOP590efmJFMmNZyilO0KYHMfV3DXZH5UYD4NxpcI
	VKAkGg5p9nIIsW1mO+DhFm72WGSPx82wfWWrRpcg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a9LoUplnwGAMdwVhZibdCj0VLAqsS6nnKgfwUxG2J9c=;
	b=Ewus5/9l0pSzPmBXM8rF29k4dB9Qoe7PrPvsBgDMAL37ukb4RUvLziiTvQ2K+K6m
	onofmKZbmJMU06d8Iv2DILOXWLVmmIFZtmW8N0OTtKYEgdfGV7sb330tYOgdnWM4A0F
	vaed6QEnXfdV7pxI6K/B247pDMp8ZgAZpybDY44M=
Content-Type: multipart/mixed; boundary="===============4637152967099074555=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu,qemu-native,qemu-system-native: upgrading to
 10.0.3,10.0.3,10.0.3 SUCCEEDED
Message-ID: <01010198add732fa-374c2fba-12b9-4be3-9bea-5543af3c7aae-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:06:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221890

--===============4637152967099074555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu,qemu-native,qemu-system-native* to *10.0.3,10.0.3,10.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-qemu-native-qemu-system-native-upgrade-10.0.2-1.patch
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
From 3cb474cec07374c8f8c04151da3771682a1592e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 06:32:10 +0000
Subject: [PATCH] qemu,qemu-native,qemu-system-native: upgrade 10.0.2 ->
 10.0.3,10.0.2 -> 10.0.3,10.0.2 -> 10.0.3

---
 .../qemu/{qemu-native_10.0.2.bb => qemu-native_10.0.3.bb} | 0
 ...stem-native_10.0.2.bb => qemu-system-native_10.0.3.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                       | 2 +-
 ...-Add-addition-environment-space-to-boot-loader-q.patch | 2 +-
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch    | 2 +-
 .../0004-qemu-Do-not-include-file-if-not-exists.patch     | 4 ++--
 ...-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch           | 2 +-
 ...s-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...ne-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch  | 2 +-
 ...-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 2 +-
 .../0012-Remove-deprecated-get_event_loop-calls.patch     | 8 ++++----
 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch | 2 +-
 .../qemu/{qemu_10.0.2.bb => qemu_10.0.3.bb}               | 0
 15 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.2.bb => qemu-native_10.0.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.2.bb => qemu-system-native_10.0.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_10.0.2.bb => qemu_10.0.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2ee76e9a7c..b8537bc07c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,7 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "ef786f2398cb5184600f69aef4d5d691efd44576a3cff4126d38d4c6fec87759"
+SRC_URI[sha256sum] = "5c891267b1534a774465db8b1a0dfcb0c5e6d7ecb6f71345625adf4e0889945b"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index f27208f45f..b62436313f 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 5e4cf1f404436d6a57c6ef2d688f3a50767e71fa Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index ad5c5ba03e..16880a236b 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From 6624b242a3e159968b20820ee8f4eb9551696382 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index c04e42608f..2cf70d12b2 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From 56baece7881e8fe656612f834d44d745451c76e9 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 8bfe4912e..d04984f66 100644
+index 3a25abfac..4e7dcb602 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -118,7 +118,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 388d11d10d..96459d10ba 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From 3d689b26db172326e1d88feb27e95c93de7615f5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 4690d86315..570e5d6325 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From 07a59acf0c5ab565601433bd3fe0108507337487 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 7c24f432f2..4faa049450 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From 77f97a5900b893459ea13a49e4a5d53289a35f0d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..7e19b587cd 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From 3cc5030b43ac44d7cd00ddb576f34c6b03a7fe8a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..17e7a891cb 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From a04cef9bf7de9210379915e8c0bb3bccb85b7acb Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index b06020d106..b77f3b96ea 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From cd303bf12d368b4ad422f4b77950b24a6730d5ee Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
index 64816fe7d9..278ec6475f 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
@@ -1,4 +1,4 @@
-From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
+From 0b3e8463a1d5dbec80bc58addeffa26d1aad3b1c Mon Sep 17 00:00:00 2001
 From: John Snow <jsnow@redhat.com>
 Date: Tue, 13 Aug 2024 09:35:30 -0400
 Subject: [PATCH] Remove deprecated get_event_loop calls
@@ -33,7 +33,7 @@ Signed-off-by: John Snow <jsnow@redhat.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
-index 22a2b56..ea9b803 100644
+index 22a2b5616..ea9b8032c 100644
 --- a/python/qemu/qmp/legacy.py
 +++ b/python/qemu/qmp/legacy.py
 @@ -86,7 +86,14 @@ def __init__(self,
@@ -53,7 +53,7 @@ index 22a2b56..ea9b803 100644
          self._timeout: Optional[float] = None
  
 diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
-index 2d9ebbd..d11b9fc 100644
+index 2d9ebbd20..d11b9fc54 100644
 --- a/python/qemu/qmp/qmp_tui.py
 +++ b/python/qemu/qmp/qmp_tui.py
 @@ -377,7 +377,12 @@ def run(self, debug: bool = False) -> None:
@@ -71,7 +71,7 @@ index 2d9ebbd..d11b9fc 100644
  
          # Gracefully handle SIGTERM and SIGINT signals
 diff --git a/python/tests/protocol.py b/python/tests/protocol.py
-index 56c4d44..8dcef57 100644
+index 56c4d441f..8dcef573b 100644
 --- a/python/tests/protocol.py
 +++ b/python/tests/protocol.py
 @@ -228,7 +228,7 @@ def async_test(async_test_method):
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 1cc973443e..3859d84ad0 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From a0cddd0b1b60e78761755bd1cec7148853d488d0 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.2.bb b/meta/recipes-devtools/qemu/qemu_10.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.3.bb
-- 
2.47.1


--===============4637152967099074555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.4 to libgio-2.0.so.0.8400.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.4 to libgirepository-2.0.so.0.8400.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.4 to libglib-2.0.so.0.8400.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.4 to libgmodule-2.0.so.0.8400.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.4 to libgobject-2.0.so.0.8400.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.4 to libgthread-2.0.so.0.8400.2
  /usr/lib/libgio-2.0.so.0.8400.4 moved to /usr/lib/libgio-2.0.so.0.8400.2
  /usr/lib/libgirepository-2.0.so.0.8400.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.2
  /usr/lib/libglib-2.0.so.0.8400.4 moved to /usr/lib/libglib-2.0.so.0.8400.2
  /usr/lib/libgmodule-2.0.so.0.8400.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.2
  /usr/lib/libgobject-2.0.so.0.8400.4 moved to /usr/lib/libgobject-2.0.so.0.8400.2
  /usr/lib/libgthread-2.0.so.0.8400.4 moved to /usr/lib/libgthread-2.0.so.0.8400.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py

--===============4637152967099074555==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-qemu-native-qemu-system-native-upgrade-10.0.2-1.patch"

RnJvbSAzY2I0NzRjZWMwNzM3NGM4ZjhjMDQxNTFkYTM3NzE2ODJhMTU5MmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDY6MzI6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11LHFlbXUtbmF0aXZlLHFlbXUtc3lzdGVtLW5hdGl2ZTogdXBncmFkZSAxMC4wLjIgLT4KIDEw
LjAuMywxMC4wLjIgLT4gMTAuMC4zLDEwLjAuMiAtPiAxMC4wLjMKCi0tLQogLi4uL3FlbXUve3Fl
bXUtbmF0aXZlXzEwLjAuMi5iYiA9PiBxZW11LW5hdGl2ZV8xMC4wLjMuYmJ9IHwgMAogLi4uc3Rl
bS1uYXRpdmVfMTAuMC4yLmJiID0+IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjMuYmJ9IHwgMAog
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQogLi4uLUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRl
ci1xLnBhdGNoIHwgMiArLQogLi4uL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91
Z2gtdG8tUElDLnBhdGNoICAgIHwgMiArLQogLi4uLzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1m
aWxlLWlmLW5vdC1leGlzdHMucGF0Y2ggICAgIHwgNCArKy0tCiAuLi4tQWRkLXNvbWUtdXNlci1z
cGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2ggfCAyICstCiAuLi4vcWVtdS9x
ZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCAgICAgICAgICAgfCAyICstCiAu
Li5zLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gg
fCAyICstCiAuLi5uZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQt
bGkucGF0Y2ggfCAyICstCiAuLi4vMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxl
LWZyb20tUEFUSC5wYXRjaCAgfCAyICstCiAuLi4tRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12
ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggfCAyICstCiAuLi4vMDAxMi1SZW1vdmUtZGVwcmVj
YXRlZC1nZXRfZXZlbnRfbG9vcC1jYWxscy5wYXRjaCAgICAgfCA4ICsrKystLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2ggfCAyICst
CiAuLi4vcWVtdS97cWVtdV8xMC4wLjIuYmIgPT4gcWVtdV8xMC4wLjMuYmJ9ICAgICAgICAgICAg
ICAgfCAwCiAxNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdS1uYXRpdmVfMTAuMC4y
LmJiID0+IHFlbXUtbmF0aXZlXzEwLjAuMy5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUve3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjIuYmIgPT4gcWVtdS1zeXN0
ZW0tbmF0aXZlXzEwLjAuMy5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUve3FlbXVfMTAuMC4yLmJiID0+IHFlbXVfMTAuMC4zLmJifSAoMTAwJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4wLjIuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4wLjMuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUt
bmF0aXZlXzEwLjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS1uYXRpdmVfMTAuMC4zLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzEw
LjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0t
bmF0aXZlXzEwLjAuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwppbmRleCAyZWU3
NmU5YTdjLi5iODUzN2JjMDdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwpAQCAt
MzksNyArMzksNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59
LSR7UFZ9LnRhci54eiBcCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cucWVtdS5v
cmciCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJxZW11LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwu
dGFyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWY3ODZmMjM5OGNiNTE4NDYwMGY2OWFlZjRk
NWQ2OTFlZmQ0NDU3NmEzY2ZmNDEyNmQzOGQ0YzZmZWM4Nzc1OSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI1Yzg5MTI2N2IxNTM0YTc3NDQ2NWRiOGIxYTBkZmNiMGM1ZTZkN2VjYjZmNzEzNDU2MjVh
ZGY0ZTA4ODk5NDViIgogCiBDVkVfU1RBVFVTW0NWRS0yMDA3LTA5OThdID0gIm5vdC1hcHBsaWNh
YmxlLWNvbmZpZzogVGhlIFZOQyBzZXJ2ZXIgY2FuIGV4cG9zZSBob3N0IGZpbGVzIHVkZXIgc29t
ZSBjaXJjdW1zdGFuY2VzLiBXZSBkb24ndCBlbmFibGUgaXQgYnkgZGVmYXVsdC4iCiAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRp
dGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50
LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKaW5kZXggZjI3MjA4ZjQ1Zi4uYjYyNDM2MzEz
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUt
QWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9u
LWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDI3MjczZmNhYzY4NTc3NTBmMDdhMjYzMmJkYjZiMGVkNjZhZTk4MmEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDVlNGNmMWY0MDQ0MzZkNmE1N2M2ZWYyZDY4OGYzYTUwNzY3
ZTcxZmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKYXNvbiBXZXNzZWwgPGphc29u
Lndlc3NlbEB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAyOCBNYXIgMjAxNCAxNzo0Mjo0MyAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBxZW11OiBBZGQgYWRkaXRpb24gZW52aXJvbm1lbnQgc3Bh
Y2UgdG8gYm9vdCBsb2FkZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJ
Qy5wYXRjaAppbmRleCBhZDVjNWJhMDNlLi4xNjg4MGEyMzZiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1Q
SUMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMt
Zml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOWI5
NTA3M2U1ZDQyZGM0YWE1MzkyZGEzZDQyMmFiNjY4MDAzMTA3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA2NjI0YjI0MmEzZTE1OTk2OGIyMDgyMGVlOGY0ZWI5NTUxNjk2MzgyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyayBBc3NlbHN0aW5lIDxtYXJrLmFzc2Vsc3Rp
bmVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjYgRmViIDIwMTMgMTE6NDM6MjggLTA1MDAK
IFN1YmplY3Q6IFtQQVRDSF0gYXBpYzogZml4dXAgZmFsbHRocm91Z2ggdG8gUElDCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5j
bHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gK
aW5kZXggYzA0ZTQyNjA4Zi4uMmNmNzBkMTJiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhp
c3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11
LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gOTEzMDY0ZjlmZTcyNGZhMWI3MGI5YmY2ZGQzNDQ0YzdkZGRlYjkyOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTZiYWVjZTc4ODFlOGZlNjU2NjEyZjgzNGQ0NGQ3NDU0NTFj
NzZlOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE9sZWtzaXkgT2JpdG90c2t5eSA8
b29iaXRvdHNAY2lzY28uY29tPgogRGF0ZTogV2VkLCAyNSBNYXIgMjAyMCAyMToyMTozNSArMDIw
MAogU3ViamVjdDogW1BBVENIXSBxZW11OiBEbyBub3QgaW5jbHVkZSBmaWxlIGlmIG5vdCBleGlz
dHMKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogU2FraWIgU2FqYWwgPHNha2liLnNh
amFsQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBk
aWZmIC0tZ2l0IGEvbGludXgtdXNlci9zeXNjYWxsLmMgYi9saW51eC11c2VyL3N5c2NhbGwuYwot
aW5kZXggOGJmZTQ5MTJlLi5kMDQ5ODRmNjYgMTAwNjQ0CitpbmRleCAzYTI1YWJmYWMuLjRlN2Rj
YjYwMiAxMDA2NDQKIC0tLSBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jCiArKysgYi9saW51eC11c2Vy
L3N5c2NhbGwuYwogQEAgLTExOCw3ICsxMTgsOSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3
ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3Mt
bXVzbC5wYXRjaAppbmRleCAzODhkMTFkMTBkLi45NjQ1OWQxMGJhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNl
LW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtz
LXRvLWFkZHJlc3MtbXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjJhZGZjNzAzZTk0
ODE5YjBkYWNhOThmZGUxZDBhMzAxNjhjMjkyZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gM2Q2ODliMjZkYjE3MjMyNmUxZDg4ZmViMjdlOTVjOTNkZTc2MTVmNSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCA4IEphbiAyMDIxIDE3OjI3OjA2ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHFlbXU6IEFkZCBzb21lIHVzZXIgc3BhY2UgbW1hcCB0d2Vha3MgdG8gYWRk
cmVzcyBtdXNsIDMyIGJpdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaAppbmRleCA0
NjkwZDg2MzE1Li41NzBlNWQ2MzI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTAzMjcyNmU5ZGE4ZGUwMDg4ZDZjNzBjZmQ5MmUwYTUy
MTU1MzE1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDdhNTlhY2YwYzVhYjU2NTYw
MTQzM2JkM2ZlMDEwODUwNzMzNzQ4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTog
TW9uLCAxIE1hciAyMDIxIDEzOjAwOjQ3ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IERl
dGVybWluaXNtIGZpeGVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDctdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8t
ZmlsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1t
ZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCmluZGV4
IDdjMjRmNDMyZjIuLjRmYWEwNDk0NTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1y
ZWZlci10by1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYmVhYjA2NzQ3MzA2ZWMxNjI5OTIwN2JmNGJk
NzQ4MWE0NzJiNGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3N2Y5N2E1OTAwYjg5
MzQ1OWVhMTNhNDllNGE1ZDUzMjg5YTM1ZjBkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwg
MTQgSmFuIDIwMjEgMDY6MzM6MDQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvbWVzb24u
YnVpbGQ6IHVzZSByZWxhdGl2ZSBwYXRoIHRvIHJlZmVyIHRvIGZpbGVzCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1N
QVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURB
VEUtb24tbmVlZGVkLWxpLnBhdGNoCmluZGV4IDU0NDIxNTQ0YmIuLjdlMTliNTg3Y2QgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZ
TkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9T
SEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5
YzIyNTIzNGE3NTZmMjc0NWNmMDRjM2MzYWY2ZWY2YjZhY2Y0Mjc3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAzY2M1MDMwYjQzYWM0NGQ3Y2QwMGRkYjU3NmYzNGM2YjAzYTdmZThhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IE1vbiwgMjEgTWFyIDIwMjIgMTA6MDk6MzggLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gRGVmaW5lIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5lZWRlZCBsaW51
eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZp
Z3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUt
ZnJvbS1QQVRILnBhdGNoCmluZGV4IDI4YTEwZDk4YmQuLjE3ZTdhODkxY2IgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1l
c29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlhZGYzZmMzZWEyY2JjY2I0MWQ0OTY5NWE1M2M3
NGZlZDY4NTBmYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEwNGNlZjliZjdkZTky
MTAzNzk5MTVlOGMwYmIzYmNjYjg1YjdhY2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiA9P1VURi04P3E/TWFydGluPTIwSHVuZGViPUMzPUI4bGw/PSA8bWFydGluQGdlYW5peC5jb20+
CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDE0OjAyOjU1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGNvbmZpZ3VyZTogbG9va3VwIG1lc29uIGV4dXRhYmxlIGZyb20gUEFUSApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQt
dGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYt
YXJlbi10LXVzZWQtZm9yLS5wYXRjaAppbmRleCBiMDYwMjBkMTA2Li5iNzdmM2I5NmVhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUt
cGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUt
cHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MGQ4NTk4ODQ1N2E0NzVjMjViODQwODVjZjA5MDA0MDE1MGE5YzE2ZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gY2QzMDNiZjEyZDM2OGI0YWQ0MjJmNGI3Nzk1MGIyNGE2NzMwZDVlZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMiBNYXkgMjAyNCAxMzo1ODoy
MyArMDIwMAogU3ViamVjdDogW1BBVENIXSBxZW11OiBFbnN1cmUgcGlwIGFuZCB0aGUgcHl0aG9u
IHZlbnYgYXJlbid0IHVzZWQgZm9yIG1lc29uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMTItUmVtb3ZlLWRlcHJlY2F0ZWQtZ2V0X2V2ZW50X2xvb3AtY2Fs
bHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTItUmVtb3ZlLWRl
cHJlY2F0ZWQtZ2V0X2V2ZW50X2xvb3AtY2FsbHMucGF0Y2gKaW5kZXggNjQ4MTZmZTdkOS4uMjc4
ZWM2NDc1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEy
LVJlbW92ZS1kZXByZWNhdGVkLWdldF9ldmVudF9sb29wLWNhbGxzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMi1SZW1vdmUtZGVwcmVjYXRlZC1nZXRfZXZl
bnRfbG9vcC1jYWxscy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTI0MDQwNjc0N2ZkNDM4
ODY2MThhZTgxOTQxNTNlNmZjOTU3YTgyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MGIzZTg0NjNhMWQ1ZGJlYzgwYmM1OGFkZGVmZmEyNmQxYWFkM2IxYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEpvaG4gU25vdyA8anNub3dAcmVkaGF0LmNvbT4KIERhdGU6IFR1ZSwg
MTMgQXVnIDIwMjQgMDk6MzU6MzAgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIGRlcHJl
Y2F0ZWQgZ2V0X2V2ZW50X2xvb3AgY2FsbHMKQEAgLTMzLDcgKzMzLDcgQEAgU2lnbmVkLW9mZi1i
eTogSm9obiBTbm93IDxqc25vd0ByZWRoYXQuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3B5dGhvbi9xZW11L3Ft
cC9sZWdhY3kucHkgYi9weXRob24vcWVtdS9xbXAvbGVnYWN5LnB5Ci1pbmRleCAyMmEyYjU2Li5l
YTliODAzIDEwMDY0NAoraW5kZXggMjJhMmI1NjE2Li5lYTliODAzMmMgMTAwNjQ0CiAtLS0gYS9w
eXRob24vcWVtdS9xbXAvbGVnYWN5LnB5CiArKysgYi9weXRob24vcWVtdS9xbXAvbGVnYWN5LnB5
CiBAQCAtODYsNyArODYsMTQgQEAgZGVmIF9faW5pdF9fKHNlbGYsCkBAIC01Myw3ICs1Myw3IEBA
IGluZGV4IDIyYTJiNTYuLmVhOWI4MDMgMTAwNjQ0CiAgICAgICAgICBzZWxmLl90aW1lb3V0OiBP
cHRpb25hbFtmbG9hdF0gPSBOb25lCiAgCiBkaWZmIC0tZ2l0IGEvcHl0aG9uL3FlbXUvcW1wL3Ft
cF90dWkucHkgYi9weXRob24vcWVtdS9xbXAvcW1wX3R1aS5weQotaW5kZXggMmQ5ZWJiZC4uZDEx
YjlmYyAxMDA2NDQKK2luZGV4IDJkOWViYmQyMC4uZDExYjlmYzU0IDEwMDY0NAogLS0tIGEvcHl0
aG9uL3FlbXUvcW1wL3FtcF90dWkucHkKICsrKyBiL3B5dGhvbi9xZW11L3FtcC9xbXBfdHVpLnB5
CiBAQCAtMzc3LDcgKzM3NywxMiBAQCBkZWYgcnVuKHNlbGYsIGRlYnVnOiBib29sID0gRmFsc2Up
IC0+IE5vbmU6CkBAIC03MSw3ICs3MSw3IEBAIGluZGV4IDJkOWViYmQuLmQxMWI5ZmMgMTAwNjQ0
CiAgCiAgICAgICAgICAjIEdyYWNlZnVsbHkgaGFuZGxlIFNJR1RFUk0gYW5kIFNJR0lOVCBzaWdu
YWxzCiBkaWZmIC0tZ2l0IGEvcHl0aG9uL3Rlc3RzL3Byb3RvY29sLnB5IGIvcHl0aG9uL3Rlc3Rz
L3Byb3RvY29sLnB5Ci1pbmRleCA1NmM0ZDQ0Li44ZGNlZjU3IDEwMDY0NAoraW5kZXggNTZjNGQ0
NDFmLi44ZGNlZjU3M2IgMTAwNjQ0CiAtLS0gYS9weXRob24vdGVzdHMvcHJvdG9jb2wucHkKICsr
KyBiL3B5dGhvbi90ZXN0cy9wcm90b2NvbC5weQogQEAgLTIyOCw3ICsyMjgsNyBAQCBkZWYgYXN5
bmNfdGVzdChhc3luY190ZXN0X21ldGhvZCk6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKaW5kZXggMWNjOTcz
NDQzZS4uMzg1OWQ4NGFkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gN2UwOTY1NGZhMTc5YWQ1ZmFiMWRjMGE0Nzg4NmM2YTFhMmFjYzA5NyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYTBjZGRkMGIxYjYwZTc4NzYxNzU1YmQxY2VjNzE0ODg1M2Q0ODhk
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5hdGFuYWVsIENvcGEgPG5jb3BhQGFs
cGluZWxpbnV4Lm9yZz4KIERhdGU6IFdlZCwgMTggU2VwIDIwMjQgMTY6MTk6MzcgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L3Jpc2N2L2t2bTogZG8gbm90IHVzZSBub24tcG9ydGFibGUg
c3RyZXJyb3JuYW1lX25wKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXVfMTAuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4wLjMu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXVfMTAuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11XzEwLjAuMy5iYgotLSAKMi40Ny4xCgo=

--===============4637152967099074555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.4 to libgio-2.0.so.0.8400.2
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.4 to libgirepository-2.0.so.0.8400.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.4 to libglib-2.0.so.0.8400.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.4 to libgmodule-2.0.so.0.8400.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.4 to libgobject-2.0.so.0.8400.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.4 to libgthread-2.0.so.0.8400.2
  /usr/lib/libgio-2.0.so.0.8400.4 moved to /usr/lib/libgio-2.0.so.0.8400.2
  /usr/lib/libgirepository-2.0.so.0.8400.4 moved to /usr/lib/libgirepository-2.0.so.0.8400.2
  /usr/lib/libglib-2.0.so.0.8400.4 moved to /usr/lib/libglib-2.0.so.0.8400.2
  /usr/lib/libgmodule-2.0.so.0.8400.4 moved to /usr/lib/libgmodule-2.0.so.0.8400.2
  /usr/lib/libgobject-2.0.so.0.8400.4 moved to /usr/lib/libgobject-2.0.so.0.8400.2
  /usr/lib/libgthread-2.0.so.0.8400.4 moved to /usr/lib/libgthread-2.0.so.0.8400.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py
packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.0.3.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-add
 ition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1867587032 to 1867793184 (+0%)
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-dev: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-dev: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-doc: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-doc: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-guest-agent: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-locale: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-locale: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-ptest: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 33860011 to 33860101 (+0%)
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31633288 to 31637384 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29192416 to 29200608 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26884392 to 26888488 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16975496 to 16979592 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16038408 to 16042504 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16105992 to 16110088 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26931272 to 26935368 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5289120 to 5293216 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3343488 to 3347584 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2711936 to 2716032 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-i386: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2569576 to 2573672 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-mips: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-ppc: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-sh4: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu: PKGV changed from 10.0.2 [default] to 10.0.3 [default]

--===============4637152967099074555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1942 targets, 50 skipped, 0 masked, 0 errors.
Removing 124 recipes from the core2-64 sysroot...done.
Removing 127 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c6296eeb3e297cad60d5ce7a8afd40a1e5ee0690"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c6296eeb3e297cad60d5ce7a8afd40a1e5ee0690"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1051 Local 798 Mirrors 0 Missed 253 Current 339 (75% match, 81% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
Removing 16 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 364 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 374 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 386 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 423 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 434 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 447 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 452 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.0.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 498 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 503 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-native-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 514 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 523 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 528 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 540 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_recipe_qa_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe qemu-10.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 547 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe clang-cross-x86_64-git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 551 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-native-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe clang-cross-x86_64-git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 553 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 557 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: recipe expat-native-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 565 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 567 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libclc-native-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 588 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe libsdl2-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 619 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-native-20.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 638 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 640 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-native-20.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsdl2-2.32.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 680 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 718 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 732 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 737 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-native-1_1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 739 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 744 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-native-1_1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 745 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-native-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 791 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 794 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 807 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 813 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 816 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-native-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-native-2_25.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 826 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 827 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 829 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 834 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 836 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 842 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 845 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 847 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 851 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1390 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 855 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 860 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 864 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 866 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 868 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 873 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 880 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 881 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 883 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 888 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 889 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 891 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 893 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 895 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 902 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 907 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 912 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 920 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 925 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe clang-20.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 926 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-cross-x86_64-git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 935 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe clang-20.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 939 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 941 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 946 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-cross-x86_64-git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 955 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 960 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 962 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 980 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 981 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 988 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 990 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 996 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1000 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1002 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1009 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1010 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1012 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1018 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1019 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1026 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1028 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1030 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1033 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1034 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1037 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1050 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1052 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1058 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1061 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1062 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1063 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1066 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1068 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1074 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1077 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1088 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1090 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1092 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1093 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1094 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1099 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1106 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1110 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1114 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1122 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1127 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1131 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1133 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1136 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1139 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1142 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1148 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1150 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1152 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1159 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1161 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1168 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1169 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1174 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1177 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1181 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1182 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1184 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1185 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1191 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1193 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1195 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1197 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1198 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1201 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1208 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1212 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1215 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1217 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1218 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1222 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1224 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1225 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1226 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1230 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1231 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1233 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1235 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1236 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1238 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1239 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1241 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1242 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1243 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1245 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1246 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1247 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1248 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1250 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1254 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1256 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1257 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1258 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1261 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1265 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1266 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1268 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1269 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1270 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1271 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1272 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1278 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1280 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1282 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1284 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1287 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1289 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1292 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1311 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1313 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1315 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1317 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1319 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1322 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1324 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1326 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1328 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1330 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1332 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1334 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1336 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1338 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1339 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 538 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 631 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1344 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1345 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 681 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 732 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running task 779 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 838 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_write_config)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 867 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: Running task 932 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 934 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: Running task 940 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 966 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Started
NOTE: Running task 974 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1351 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 984 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Started
NOTE: Running task 1001 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 1008 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: Running task 1016 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: Running task 1067 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1068 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1072 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1073 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1074 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: Running task 1075 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1077 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1078 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1080 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1353 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1354 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1355 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 1106 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1107 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1110 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1356 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1358 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1114 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: Running task 1115 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1118 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: Running task 1119 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1121 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running task 1123 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1132 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: Running task 1133 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: Running task 1134 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1362 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1363 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1139 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 1140 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: Running task 1164 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1166 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: Running task 1169 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 1192 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1193 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: Running task 1233 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1279 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1286 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1301 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: Running setscene task 1366 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1367 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: Running setscene task 1368 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running task 1304 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: Running task 1305 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1306 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1307 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: Running task 1308 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1309 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1310 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1316 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1325 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1374 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: Running task 1405 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1414 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1417 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: Running task 1430 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1435 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: Running task 1447 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: Running task 1451 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1491 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_fetch)
NOTE: Running task 1495 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 1503 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: Running task 1557 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: Running task 1558 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: Running task 1559 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: Running task 1560 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe bluez5-5.83-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe bluez5-5.83-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: Running task 1562 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: Running task 1564 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: Running task 1565 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: Running task 1570 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 1604 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: Running task 1606 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: Running task 1634 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: Running task 1637 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1638 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 1640 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: Running task 1648 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1649 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: Running task 1652 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1653 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: Running task 1667 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_fetch: Started
NOTE: Running task 1687 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running task 1694 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_patch)
NOTE: Running task 1700 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: Running task 1706 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1707 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_fetch)
NOTE: Running task 1713 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1714 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.83-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1723 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1724 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1725 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: Running task 1726 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Started
NOTE: Running task 1727 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1728 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: Running task 1777 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_unpack: Started
NOTE: Running task 1827 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1830 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe bluez5-5.83-r0: task do_patch: Succeeded
NOTE: Running task 1835 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_unpack)
NOTE: Running noexec task 1843 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_fetch)
NOTE: Running task 1844 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_generate_toolchain_file)
NOTE: Running task 1847 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1848 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1849 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: Running task 1850 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1911 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe clang-20.1.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_fetch: Started
NOTE: recipe clang-20.1.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: Running task 1926 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: Running task 1929 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1930 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Succeeded
NOTE: Running task 1931 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: Running task 1932 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1944 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: Running task 1953 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_write_config)
NOTE: Running task 1965 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Succeeded
NOTE: Running task 1979 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_fetch)
NOTE: Running task 1980 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: Running task 1983 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_fetch)
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Started
NOTE: recipe ell-0.79-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.79-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Running task 1996 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_fetch)
NOTE: Running task 1997 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: Running task 2002 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Succeeded
NOTE: Running task 2014 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2015 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_write_config: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe ofono-2.17-r0: task do_fetch: Started
NOTE: Running task 2018 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.17-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running setscene task 1385 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: Running task 2043 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_patch)
NOTE: Running task 2044 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2048 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_unpack)
NOTE: Running task 2049 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_unpack)
NOTE: Running task 2050 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe ell-0.79-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2052 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_generate_toolchain_file)
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2057 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_patch: Started
NOTE: recipe ofono-2.17-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2075 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 2084 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe ell-0.79-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 2085 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-native-2_25.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2086 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 2089 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: Running task 2091 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe ell-0.79-r0: task do_patch: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_write_config: Started
NOTE: recipe ofono-2.17-r0: task do_unpack: Succeeded
NOTE: Running task 2093 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_patch)
NOTE: recipe ell-0.79-r0: task do_patch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2097 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 2098 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2100 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.17-r0: task do_patch: Started
NOTE: Running task 2185 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.32.8-r0: task do_fetch: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_fetch: Succeeded
NOTE: Running task 2243 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.17-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Started
NOTE: Running task 2310 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2401 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2446 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: Running task 2467 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Succeeded
NOTE: Running task 2528 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: Running task 2529 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2558 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: Running task 2569 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_patch)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 2578 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: Running task 2581 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Succeeded
NOTE: Running task 2582 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2623 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_write_config)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2624 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: Running task 2625 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Succeeded
NOTE: Running task 2626 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: Running task 2627 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2628 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: Running task 2636 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2637 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: Running task 2638 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: Running task 2639 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2640 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 2641 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_unpack: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2642 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe mesa-2_25.2.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: Running task 2643 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2644 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_fetch)
NOTE: Running task 2645 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_configure)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_fetch: Started
NOTE: Running task 2647 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe pixman-1_0.46.2-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2648 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: Running task 2649 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: recipe mesa-native-2_25.2.0-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2650 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot)
NOTE: Running task 2652 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_unpack)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2653 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_unpack: Started
NOTE: Running task 2658 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: Running task 2670 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_fetch)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_configure: Started
NOTE: recipe qemu-10.0.3-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2671 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: Running task 2694 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot unihash changed to 8c93dafe3f2a8dcf911693c65fcf2f58c29d2f3fa2db913de59bfbaa4259cffd
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe libsdl2-2.32.8-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2695 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2696 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2715 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2716 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: Running task 2720 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: Running task 2721 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libsdl2-2.32.8-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2722 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe libsdl2-2.32.8-r0: task do_patch: Succeeded
NOTE: Running task 2723 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: Running task 2724 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_unpack)
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_unpack: Succeeded
NOTE: Running task 2725 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2726 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 2727 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 2728 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 2729 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Started
NOTE: Running task 2730 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_compile)
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: Running task 2740 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_unpack)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe pixman-1_0.46.2-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2742 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: Running task 2776 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_unpack: Started
NOTE: Running task 2777 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_patch)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2778 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: Running task 2779 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 2780 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_patch)
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2782 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2783 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2784 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_collect_spdx_deps)
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Started
NOTE: Running task 2785 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 2786 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2787 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: Running task 2801 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: Running task 2802 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_write_config)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: Running task 2803 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 2804 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 2805 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: Running task 2806 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Succeeded
NOTE: Running task 2807 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2809 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2811 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_generate_toolchain_file)
NOTE: Running task 2812 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: Running task 2813 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: Running task 2814 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 2815 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2816 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_write_config)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: Running task 2817 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2818 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_write_config: Succeeded
NOTE: Running task 2819 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_write_config)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Succeeded
NOTE: Running task 2820 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 2821 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2873 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to 7428fcbbc524920a756e653c9c63eb1f5384bb3a184fa0b1e94b6417a80ed67f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: Running setscene task 1321 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1341 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1343 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot unihash changed to 374776291af555d86cf9ec8c3852b81ce87dfd375b2d0eefce9ba070bebda2c1
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to f1de4a65034064e087b26385d8f52817ed08039c694c8e79fe4b756050c8d095
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: Running setscene task 1311 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1331 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1366 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1369 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 2874 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: Running task 2875 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: Running task 2876 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2878 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_configure)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 2879 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe pixman-1_0.46.2-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2881 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Running task 2882 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 33ce2408e791ecfe340e5ff320ca1a9acdf1bea4f256d66e828f40d6dd9d765d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to 10858e7a38fb73925008e9edb2b33f8fc86be156746809cc744d8ec50ba7e46e
NOTE: Running setscene task 1284 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 1287 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1336 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1348 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1354 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1359 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1360 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1361 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: Running setscene task 1362 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 1363 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1364 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1365 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: Running task 2883 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2884 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running task 2885 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Running task 2886 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to f3e4e63cfb1bc6012836c4955fbfd9b959b37a88f4c0e167db2e62ed24528373
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 1347 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1357 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1365 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running task 2887 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 2888 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: Running task 2889 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: Running task 2890 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 2891 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 8fad95baa3aeea95f9f31c11f2a821fc9303341138cc7611a5593b64e135fef3
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: Running setscene task 1345 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running setscene task 1349 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1350 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: Running task 2893 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_compile)
NOTE: Running task 2894 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: Running task 2913 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot unihash changed to 69613010fa6d6ed502240fe9983ccb818c8c9817148d49e3557d1eb1ae3a531f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot became valid
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1359 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1370 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1372 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2926 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2927 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: Running task 2928 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_install)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1375 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1376 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: Running task 2938 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package)
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe libucontext-1.3.2-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: Running task 2956 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_fetch: Started
NOTE: Running task 2957 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2958 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe pixman-1_0.46.2-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1378 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1379 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 2973 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2978 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2979 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2980 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_install: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: Running task 3007 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 3036 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_fetch: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_fetch: Succeeded
NOTE: Running task 3047 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Running task 3062 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 3f0145153aa0efa33eaa05bf6803819acba7427b17bfcbf547aeacbfb45887d2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running task 3063 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Succeeded
NOTE: Running task 3064 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_unpack)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_patch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package unihash changed to bbc1bbdece3bfe826b95cb806532acdbcd8973a85c27abd81bd47c5cb8909a4b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata became valid
NOTE: recipe libepoxy-native-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot unihash changed to 8d2913f75053d0d7df47d7d8a6e27c3c4f7a980f705597152fa3d578fc1ee6c0
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_unpack: Started
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata_setscene)
NOTE: Running task 3066 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: Running task 3074 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package)
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 3078 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: Running task 3079 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: Running task 3080 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3081 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3099 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3101 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: Running setscene task 1381 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package unihash changed to f71f33ac2f541e09a46d613718b22e9b39eb0eb47cce49f54b1b151a3a367743
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_package became valid
NOTE: Running setscene task 1356 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_unpack: Succeeded
NOTE: recipe mesa-native-2_25.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running task 3102 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_patch)
NOTE: Running task 3103 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot unihash changed to 72e1a57e792c645cd463158391fc5c96a2b2ae3de450fd7a26200a662d5607d0
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to a06d36767efa86083d359acb8494fe89a5bea3fc5fa51024b36b72b24cc3d9d9
NOTE: recipe libsdl2-native-2.32.8-r0: task do_patch: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1364 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_package_setscene)
NOTE: Running setscene task 1371 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: Running task 3104 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3105 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_patch)
NOTE: Running task 3121 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: Running task 3126 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 3133 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx)
NOTE: Running task 3140 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe qemu-10.0.3-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_write_config: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3192 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: Running task 3195 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_generate_toolchain_file)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libsdl2-native-2.32.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3199 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Succeeded
NOTE: Running task 3225 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to b851e818fd2f967192665b03a627ac25177c8f0e85bdb208357e7f90cdc94c70
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot became valid
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_package: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package unihash changed to 13f0fa7b4013729e5bd2c34ef445f581fff11afc461af3d0603d5e11326acfa9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to a7036ab263af2773bedaa22bb2add119dfb5f7533f7b63b2fdec57b84b2c127b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 1295 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1299 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1361 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1375 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running task 3227 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3228 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: Running task 3229 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: Running task 3230 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-10.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3234 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3271 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_collect_spdx_deps)
NOTE: Running task 3272 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 3273 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemu-10.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_deploy_source_date_epoch unihash changed to 6897e2b9d625afa4574a1ce0334067a1783e29eb7c863915911157d0109ed218
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Started
NOTE: Running setscene task 1376 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 3280 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_collect_spdx_deps)
NOTE: Running task 3281 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3282 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3296 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3297 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Started
NOTE: Running task 3298 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Succeeded
NOTE: Running task 3299 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_install)
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_install: Started
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3300 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3301 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1384 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1385 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1386 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1387 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1388 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1389 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3302 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.125-r0: task do_install: Succeeded
NOTE: Running task 3303 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot)
NOTE: Running task 3304 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package)
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 3305 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.125-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running task 3381 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3391 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot unihash changed to 10d895b1d47f64e8317e5eb6d6cc2ddc0db74d91ff71a758e3b70c14a38355fb
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Running task 3418 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3419 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3420 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to de3a39f897300c8b94ec015c17acf40d61771cca4e4e457123ed22e7b235ea00
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: recipe libxkbcommon-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running task 3421 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3422 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running task 3423 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_configure: Started
NOTE: Running task 3424 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3426 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3427 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: Running task 3428 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3429 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3430 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3431 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 3432 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe libdrm-2.4.125-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package unihash changed to 51878fa9f1051f472ad6dd9330155b7d481999af511266570dcc1c86a9d0de39
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running task 3433 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_configure_ptest_base)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3434 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_compile)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3436 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3437 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: Running task 3438 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3439 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 3441 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3442 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3443 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_compile)
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3444 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3445 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 3446 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3447 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3448 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_configure)
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3449 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3450 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3451 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3452 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe coreutils-9.7-r0: task do_configure: Started
NOTE: Running task 3453 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3454 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_install)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3455 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3456 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3457 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_install: Started
NOTE: Running task 3458 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3459 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3460 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3461 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: Running task 3462 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3463 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_collect_spdx_deps)
NOTE: Running task 3464 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.46.2-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3465 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3466 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_package)
NOTE: Running task 3467 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3468 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3469 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: Running task 3470 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot unihash changed to 2d8ef3b2da1ce3472918923a99a6b822810f020ef0bb9607e32960e3dcd9e8fd
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to e69697929a372c3556c6a59df7f496b9f1f5687b60b08d5ad2b451c8ce1de15c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata became valid
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1320 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1356 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 1376 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1384 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_package: Succeeded
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_package unihash changed to 7a2bda7485556584b0bf6786024f5ab86b90e3870ab041bb49dbfa54753ec011
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata became valid
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1385 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3472 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3473 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_install)
NOTE: Running task 3477 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.45-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1386 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1387 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package_setscene)
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 3478 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 3479 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3480 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_collect_spdx_deps)
NOTE: Running task 3481 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: Running task 3482 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3483 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot unihash changed to 979f53a305f60a24a55961cc3a44250036044e3f402808fdc5a3013d8bec4f9d
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Succeeded
NOTE: Running task 3484 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1388 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1389 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_package unihash changed to 04057afb33b8006afe8a8b0739358cf089e974230ebba5ccc95d48ec9c6eb81e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata became valid
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile: Succeeded
NOTE: Running task 3486 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_create_spdx)
NOTE: Running task 3487 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_compile_ptest_base)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3488 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package became valid
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install: Succeeded
NOTE: Running task 3489 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3490 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3496 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot unihash changed to 8853e7942817905e4a9848f4ed4e5d90bbc6e3f291c7ba7800d6ff849fd05193
NOTE: Setscene tasks completed
NOTE: Running task 3508 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3509 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3512 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3513 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package became valid
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3533 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3540 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_create_spdx)
NOTE: recipe binutils-2.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3541 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 3542 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3543 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3544 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3545 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3546 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Succeeded
NOTE: Running task 3547 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.45-r0: task do_configure: Succeeded
NOTE: Running task 3548 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_compile)
NOTE: recipe binutils-2.45-r0: task do_compile: Started
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package became valid
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running task 3549 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3550 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3551 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to cecc35c16f8740dcb67b19e0713d6a0a290d6364ede4aea50567a10b71a60e6c
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3558 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3559 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3562 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3563 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3564 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to 8ee84655e501171022d4ba49e9ba99cc5fd781db07269382d499c4a55d3a0ca3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3566 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3567 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_collect_spdx_deps)
NOTE: Running task 3568 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3569 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3570 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3571 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3572 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: Running task 3580 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk)
NOTE: Running task 3581 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb)
NOTE: Running task 3582 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: Running task 3583 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa)
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.3-r0: task do_package_qa: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3584 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 3585 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk unihash changed to b3e94adcffa73fa49bbf53de995539de37b8d251c4ac788fba9f5091d810b741
NOTE: recipe bash-5.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa unihash changed to 6dacfeaa20e5bb8fb87136f222360860ffb39a3dc9a5cececa4408042dbf755d
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb unihash changed to 1adbaa500dff19d69e5825678522bc0019cc209d91266797f8a4064aa54095a0
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm unihash changed to 0c2c0f70f03fbf48a127afc3cb1c4702655a565b9bc0499386e00789683f521e
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3586 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to e21be3b7b4bdabe8f7e298df2e00ce2bcebeffdde6e327e944685936c4d066a3
NOTE: Setscene tasks completed
NOTE: Running task 3587 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.45-r0: task do_compile: Succeeded
NOTE: Running task 3588 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_install)
NOTE: recipe binutils-2.45-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Succeeded
NOTE: Running task 3589 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3590 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Succeeded
NOTE: Running task 3591 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3592 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot)
NOTE: Running task 3593 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3594 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3595 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3596 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3597 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3598 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe libslirp-4.9.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3599 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.1-r0: task do_configure: Succeeded
NOTE: Running task 3600 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_compile)
NOTE: recipe binutils-2.45-r0: task do_install: Succeeded
NOTE: Running task 3601 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_compile: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3604 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3605 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_create_spdx)
NOTE: recipe clang-20.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.45-r0: task do_create_spdx: Started
NOTE: recipe libslirp-4.9.1-r0: task do_compile: Succeeded
NOTE: Running task 3606 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_install)
NOTE: recipe libslirp-4.9.1-r0: task do_install: Started
NOTE: recipe binutils-2.45-r0: task do_create_spdx: Succeeded
NOTE: Running task 3607 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps)
NOTE: recipe clang-20.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3608 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_configure)
NOTE: recipe clang-20.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe clang-20.1.8-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.1-r0: task do_install: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3609 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 3610 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3611 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 3612 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3613 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 3614 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 3615 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3616 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3617 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3618 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.79-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.79-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3619 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Succeeded
NOTE: Running task 3620 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata)
NOTE: recipe ell-0.79-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3621 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3622 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_install: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_install: Succeeded
NOTE: Running task 3623 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: recipe mesa-native-2_25.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3624 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: Running task 3625 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3626 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-native-2_25.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3627 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 3628 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3629 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 3630 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_configure)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_configure: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_configure: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3631 of 3792 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_compile: Started
NOTE: recipe ell-0.79-r0: task do_configure: Succeeded
NOTE: Running task 3632 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_compile)
NOTE: recipe ell-0.79-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata: Failed
NOTE: recipe clang-20.1.8-r0: task do_configure: Succeeded
NOTE: recipe ell-0.79-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_compile: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3632 tasks of which 3151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815063020.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815063020.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.84.2/temp/log.do_packagedata.1136475
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.84.4-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.84.2/temp/log.do_packagedata.1136475
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata) failed with exit code '1'

--===============4637152967099074555==--

