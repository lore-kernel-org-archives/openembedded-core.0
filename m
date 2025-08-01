Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64749CA0EC2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.88625.1754057268170625773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EUrNsZIc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cGrIr0wi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019865f5d8cd-f5a892a3-4268-43ff-83bd-8e499c80b02d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UDHRiXbPKuphaZsEhIdaFSEPTThFN5Weea7/pFpBnHU=;
	b=EUrNsZIcXdwqKJzKoAUIERAgxGmte86wsYgNv1dtIxWNhFQJQwwH7D0zQTS4bJ8u
	CvpCBvHWm2tQbjMt9rSPSV4txwlwVpzLfmlb+gPT+A+BwRxDsRDE9JPbkoYx3003sn0
	zIDdAy/JgUmFoO7HCE2nM1RfTkLfEdkWXJzDtfwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UDHRiXbPKuphaZsEhIdaFSEPTThFN5Weea7/pFpBnHU=;
	b=cGrIr0wi1P+WuJhuLHSpg/uS+h/RFMLBJGPahxyi7UYv5Bz5p8SaeDvMf/H81dWK
	h6y2saWsqvzLphZGDxj5zOCHjus8tCdku7wo7ANU5/gz1gtbYaBNxKNVAYqa3HkSfjm
	swlW1YlrCHOPFdwZwaI/FmrUpD38ydJ7gLlr7SDg=
Content-Type: multipart/mixed; boundary="===============4179012450879018928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-native,qemu,qemu-system-native: upgrading to
 10.0.3,10.0.3,10.0.3 SUCCEEDED
Message-ID: <0101019865f5d8cd-f5a892a3-4268-43ff-83bd-8e499c80b02d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221259

--===============4179012450879018928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-native,qemu,qemu-system-native* to *10.0.3,10.0.3,10.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-native-qemu-qemu-system-native-upgrade-10.0.2-1.patch
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
From 00dacb06d74e28d373137613d8d4d229dc36852b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 07:39:52 +0000
Subject: [PATCH] qemu-native,qemu,qemu-system-native: upgrade 10.0.2 ->
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
index f27208f45f..2b675ff7a9 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 2a72e966d97acf5f7822c069dc003ab21bab4f86 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index ad5c5ba03e..4f3c1a65d1 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From 0c295302b375778c9f48d601ab39095f76ddc280 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index c04e42608f..1e7f5ce7ed 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From 05479ba816d1bb6908b192845ea7a8d3b3e13356 Mon Sep 17 00:00:00 2001
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
index 388d11d10d..42540cd7cc 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From c39cd7630d267c756b1c6e0d5722800ad5f5aa43 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 4690d86315..1bf0e90d64 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From fb5cc7b1b3edc617595355af1f80a51d01dc6268 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 7c24f432f2..c7e9e0a0a9 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From 1712853f6d30ba0d4d51eebaf5c4088430a54540 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..5de63487e6 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From a1ab15e78f8e4e827331368a1f456bd7c4a3462b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..1004fb9e41 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From 5de3f8f4f9abf327a0a26597ec88cebed5dfa1ad Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index b06020d106..680a0d66d9 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From 52318b70d622ccfda33a02484a1b5a6ba529418a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
index 64816fe7d9..66ac13f3c5 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
@@ -1,4 +1,4 @@
-From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
+From 1ae7f7737065df7e0698b6368feb3e5cdead5225 Mon Sep 17 00:00:00 2001
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
index 1cc973443e..712377b37c 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From 4cae9c09e7279e4ffc5b631102a88a8fa1755730 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.2.bb b/meta/recipes-devtools/qemu/qemu_10.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.3.bb
-- 
2.47.1


--===============4179012450879018928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-native-qemu-qemu-system-native-upgrade-10.0.2-1.patch"

RnJvbSAwMGRhY2IwNmQ3NGUyOGQzNzMxMzc2MTNkOGQ0ZDIyOWRjMzY4NTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwNzozOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtbmF0aXZlLHFlbXUscWVtdS1zeXN0ZW0tbmF0aXZlOiB1cGdyYWRlIDEwLjAuMiAtPgogMTAu
MC4zLDEwLjAuMiAtPiAxMC4wLjMsMTAuMC4yIC0+IDEwLjAuMwoKLS0tCiAuLi4vcWVtdS97cWVt
dS1uYXRpdmVfMTAuMC4yLmJiID0+IHFlbXUtbmF0aXZlXzEwLjAuMy5iYn0gfCAwCiAuLi5zdGVt
LW5hdGl2ZV8xMC4wLjIuYmIgPT4gcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuMy5iYn0gfCAwCiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyAgICAgICAgICAgICAgICAgICAgICAg
fCAyICstCiAuLi4tQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVy
LXEucGF0Y2ggfCAyICstCiAuLi4vcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3Vn
aC10by1QSUMucGF0Y2ggICAgfCAyICstCiAuLi4vMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZp
bGUtaWYtbm90LWV4aXN0cy5wYXRjaCAgICAgfCA0ICsrLS0KIC4uLi1BZGQtc29tZS11c2VyLXNw
YWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaCB8IDIgKy0KIC4uLi9xZW11L3Fl
bXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoICAgICAgICAgICB8IDIgKy0KIC4u
LnMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCB8
IDIgKy0KIC4uLm5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1s
aS5wYXRjaCB8IDIgKy0KIC4uLi8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUt
ZnJvbS1QQVRILnBhdGNoICB8IDIgKy0KIC4uLi1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZl
bnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCB8IDIgKy0KIC4uLi8wMDEyLVJlbW92ZS1kZXByZWNh
dGVkLWdldF9ldmVudF9sb29wLWNhbGxzLnBhdGNoICAgICB8IDggKysrKy0tLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaCB8IDIgKy0K
IC4uLi9xZW11L3txZW11XzEwLjAuMi5iYiA9PiBxZW11XzEwLjAuMy5iYn0gICAgICAgICAgICAg
ICB8IDAKIDE1IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LW5hdGl2ZV8xMC4wLjIu
YmIgPT4gcWVtdS1uYXRpdmVfMTAuMC4zLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS97cWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuMi5iYiA9PiBxZW11LXN5c3Rl
bS1uYXRpdmVfMTAuMC4zLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS97cWVtdV8xMC4wLjIuYmIgPT4gcWVtdV8xMC4wLjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjAuMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjAuMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1u
YXRpdmVfMTAuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LW5hdGl2ZV8xMC4wLjMuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfMTAu
MC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1u
YXRpdmVfMTAuMC4zLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCmluZGV4IDJlZTc2
ZTlhN2MuLmI4NTM3YmMwN2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCkBAIC0z
OSw3ICszOSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0t
JHtQVn0udGFyLnh6IFwKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5xZW11Lm9y
ZyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50
YXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZjc4NmYyMzk4Y2I1MTg0NjAwZjY5YWVmNGQ1
ZDY5MWVmZDQ0NTc2YTNjZmY0MTI2ZDM4ZDRjNmZlYzg3NzU5IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjVjODkxMjY3YjE1MzRhNzc0NDY1ZGI4YjFhMGRmY2IwYzVlNmQ3ZWNiNmY3MTM0NTYyNWFk
ZjRlMDg4OTk0NWIiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMDctMDk5OF0gPSAibm90LWFwcGxpY2Fi
bGUtY29uZmlnOiBUaGUgVk5DIHNlcnZlciBjYW4gZXhwb3NlIGhvc3QgZmlsZXMgdWRlciBzb21l
IGNpcmN1bXN0YW5jZXMuIFdlIGRvbid0IGVuYWJsZSBpdCBieSBkZWZhdWx0LiIKIApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0
aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQt
c3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaAppbmRleCBmMjcyMDhmNDVmLi4yYjY3NWZmN2E5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1B
ZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24t
ZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMjcyNzNmY2FjNjg1Nzc1MGYwN2EyNjMyYmRiNmIwZWQ2NmFlOTgyYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmE3MmU5NjZkOTdhY2Y1Zjc4MjJjMDY5ZGMwMDNhYjIxYmFi
NGY4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEphc29uIFdlc3NlbCA8amFzb24u
d2Vzc2VsQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDI4IE1hciAyMDE0IDE3OjQyOjQzICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IEFkZCBhZGRpdGlvbiBlbnZpcm9ubWVudCBzcGFj
ZSB0byBib290IGxvYWRlcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElD
LnBhdGNoCmluZGV4IGFkNWM1YmEwM2UuLjRmM2MxYTY1ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJ
Qy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1m
aXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE5Yjk1
MDczZTVkNDJkYzRhYTUzOTJkYTNkNDIyYWI2NjgwMDMxMDcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDBjMjk1MzAyYjM3NTc3OGM5ZjQ4ZDYwMWFiMzkwOTVmNzZkZGMyODAgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrIEFzc2Vsc3RpbmUgPG1hcmsuYXNzZWxzdGlu
ZUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBGZWIgMjAxMyAxMTo0MzoyOCAtMDUwMAog
U3ViamVjdDogW1BBVENIXSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNs
dWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaApp
bmRleCBjMDRlNDI2MDhmLi4xZTdmNWNlN2VkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlz
dHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUt
RG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA5MTMwNjRmOWZlNzI0ZmExYjcwYjliZjZkZDM0NDRjN2RkZGViOTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAwNTQ3OWJhODE2ZDFiYjY5MDhiMTkyODQ1ZWE3YThkM2IzZTEz
MzU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3NpeSBPYml0b3Rza3l5IDxv
b2JpdG90c0BjaXNjby5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIwIDIxOjIxOjM1ICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90IGV4aXN0
cwpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2Fq
YWxAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRp
ZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi1p
bmRleCA4YmZlNDkxMmUuLmQwNDk4NGY2NiAxMDA2NDQKK2luZGV4IDNhMjVhYmZhYy4uNGU3ZGNi
NjAyIDEwMDY0NAogLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKICsrKyBiL2xpbnV4LXVzZXIv
c3lzY2FsbC5jCiBAQCAtMTE4LDcgKzExOCw5IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdl
YWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1t
dXNsLnBhdGNoCmluZGV4IDM4OGQxMWQxMGQuLjQyNTQwY2Q3Y2MgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2Ut
bW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3Mt
dG8tYWRkcmVzcy1tdXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMmFkZmM3MDNlOTQ4
MTliMGRhY2E5OGZkZTFkMGEzMDE2OGMyOTJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjMzljZDc2MzBkMjY3Yzc1NmIxYzZlMGQ1NzIyODAwYWQ1ZjVhYTQzIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDggSmFuIDIwMjEgMTc6Mjc6MDYgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gcWVtdTogQWRkIHNvbWUgdXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBhZGRy
ZXNzIG11c2wgMzIgYml0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCmluZGV4IDQ2
OTBkODYzMTUuLjFiZjBlOTBkNjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMDMyNzI2ZTlkYThkZTAwODhkNmM3MGNmZDkyZTBhNTIx
NTUzMTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYjVjYzdiMWIzZWRjNjE3NTk1
MzU1YWYxZjgwYTUxZDAxZGM2MjY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBN
b24sIDEgTWFyIDIwMjEgMTM6MDA6NDcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogRGV0
ZXJtaW5pc20gZml4ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1m
aWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1l
c29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKaW5kZXgg
N2MyNGY0MzJmMi4uYzdlOWUwYTBhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJl
ZmVyLXRvLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGViZWFiMDY3NDczMDZlYzE2Mjk5MjA3YmY0YmQ3
NDgxYTQ3MmI0ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE3MTI4NTNmNmQzMGJh
MGQ0ZDUxZWViYWY1YzQwODg0MzBhNTQ1NDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAx
NCBKYW4gMjAyMSAwNjozMzowNCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9tZXNvbi5i
dWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIgdG8gZmlsZXMKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1B
UF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFU
RS1vbi1uZWVkZWQtbGkucGF0Y2gKaW5kZXggNTQ0MjE1NDRiYi4uNWRlNjM0ODdlNiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lO
Qy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NI
QVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlj
MjI1MjM0YTc1NmYyNzQ1Y2YwNGMzYzNhZjZlZjZiNmFjZjQyNzcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGExYWIxNWU3OGY4ZTRlODI3MzMxMzY4YTFmNDU2YmQ3YzRhMzQ2MmIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogTW9uLCAyMSBNYXIgMjAyMiAxMDowOTozOCAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURfVkFMSURBVEUgb24gbmVlZGVkIGxpbnV4
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmln
dXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1m
cm9tLVBBVEgucGF0Y2gKaW5kZXggMjhhMTBkOThiZC4uMTAwNGZiOWU0MSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVz
b24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWFkZjNmYzNlYTJjYmNjYjQxZDQ5Njk1YTUzYzc0
ZmVkNjg1MGZiMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWRlM2Y4ZjRmOWFiZjMy
N2EwYTI2NTk3ZWM4OGNlYmVkNWRmYTFhZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9QjhsbD89IDxtYXJ0aW5AZ2Vhbml4LmNvbT4K
IERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTQ6MDI6NTUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
Y29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUgZnJvbSBQQVRICmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10
aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1h
cmVuLXQtdXNlZC1mb3ItLnBhdGNoCmluZGV4IGIwNjAyMGQxMDYuLjY4MGEwZDY2ZDkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1w
aXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1w
eXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAw
ZDg1OTg4NDU3YTQ3NWMyNWI4NDA4NWNmMDkwMDQwMTUwYTljMTZkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1MjMxOGI3MGQ2MjJjY2ZkYTMzYTAyNDg0YTFiNWE2YmE1Mjk0MThhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDEzOjU4OjIz
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IEVuc3VyZSBwaXAgYW5kIHRoZSBweXRob24g
dmVudiBhcmVuJ3QgdXNlZCBmb3IgbWVzb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAxMi1SZW1vdmUtZGVwcmVjYXRlZC1nZXRfZXZlbnRfbG9vcC1jYWxs
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMi1SZW1vdmUtZGVw
cmVjYXRlZC1nZXRfZXZlbnRfbG9vcC1jYWxscy5wYXRjaAppbmRleCA2NDgxNmZlN2Q5Li42NmFj
MTNmM2M1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTIt
UmVtb3ZlLWRlcHJlY2F0ZWQtZ2V0X2V2ZW50X2xvb3AtY2FsbHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEyLVJlbW92ZS1kZXByZWNhdGVkLWdldF9ldmVu
dF9sb29wLWNhbGxzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MjQwNDA2NzQ3ZmQ0Mzg4
NjYxOGFlODE5NDE1M2U2ZmM5NTdhODJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAx
YWU3Zjc3MzcwNjVkZjdlMDY5OGI2MzY4ZmViM2U1Y2RlYWQ1MjI1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9obiBTbm93IDxqc25vd0ByZWRoYXQuY29tPgogRGF0ZTogVHVlLCAx
MyBBdWcgMjAyNCAwOTozNTozMCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgZGVwcmVj
YXRlZCBnZXRfZXZlbnRfbG9vcCBjYWxscwpAQCAtMzMsNyArMzMsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBKb2huIFNub3cgPGpzbm93QHJlZGhhdC5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvcHl0aG9uL3FlbXUvcW1w
L2xlZ2FjeS5weSBiL3B5dGhvbi9xZW11L3FtcC9sZWdhY3kucHkKLWluZGV4IDIyYTJiNTYuLmVh
OWI4MDMgMTAwNjQ0CitpbmRleCAyMmEyYjU2MTYuLmVhOWI4MDMyYyAxMDA2NDQKIC0tLSBhL3B5
dGhvbi9xZW11L3FtcC9sZWdhY3kucHkKICsrKyBiL3B5dGhvbi9xZW11L3FtcC9sZWdhY3kucHkK
IEBAIC04Niw3ICs4NiwxNCBAQCBkZWYgX19pbml0X18oc2VsZiwKQEAgLTUzLDcgKzUzLDcgQEAg
aW5kZXggMjJhMmI1Ni4uZWE5YjgwMyAxMDA2NDQKICAgICAgICAgIHNlbGYuX3RpbWVvdXQ6IE9w
dGlvbmFsW2Zsb2F0XSA9IE5vbmUKICAKIGRpZmYgLS1naXQgYS9weXRob24vcWVtdS9xbXAvcW1w
X3R1aS5weSBiL3B5dGhvbi9xZW11L3FtcC9xbXBfdHVpLnB5Ci1pbmRleCAyZDllYmJkLi5kMTFi
OWZjIDEwMDY0NAoraW5kZXggMmQ5ZWJiZDIwLi5kMTFiOWZjNTQgMTAwNjQ0CiAtLS0gYS9weXRo
b24vcWVtdS9xbXAvcW1wX3R1aS5weQogKysrIGIvcHl0aG9uL3FlbXUvcW1wL3FtcF90dWkucHkK
IEBAIC0zNzcsNyArMzc3LDEyIEBAIGRlZiBydW4oc2VsZiwgZGVidWc6IGJvb2wgPSBGYWxzZSkg
LT4gTm9uZToKQEAgLTcxLDcgKzcxLDcgQEAgaW5kZXggMmQ5ZWJiZC4uZDExYjlmYyAxMDA2NDQK
ICAKICAgICAgICAgICMgR3JhY2VmdWxseSBoYW5kbGUgU0lHVEVSTSBhbmQgU0lHSU5UIHNpZ25h
bHMKIGRpZmYgLS1naXQgYS9weXRob24vdGVzdHMvcHJvdG9jb2wucHkgYi9weXRob24vdGVzdHMv
cHJvdG9jb2wucHkKLWluZGV4IDU2YzRkNDQuLjhkY2VmNTcgMTAwNjQ0CitpbmRleCA1NmM0ZDQ0
MWYuLjhkY2VmNTczYiAxMDA2NDQKIC0tLSBhL3B5dGhvbi90ZXN0cy9wcm90b2NvbC5weQogKysr
IGIvcHl0aG9uL3Rlc3RzL3Byb3RvY29sLnB5CiBAQCAtMjI4LDcgKzIyOCw3IEBAIGRlZiBhc3lu
Y190ZXN0KGFzeW5jX3Rlc3RfbWV0aG9kKToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaAppbmRleCAxY2M5NzM0
NDNlLi43MTIzNzdiMzdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA3ZTA5NjU0ZmExNzlhZDVmYWIxZGMwYTQ3ODg2YzZhMWEyYWNjMDk3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0Y2FlOWMwOWU3Mjc5ZTRmZmM1YjYzMTEwMmE4OGE4ZmExNzU1NzMw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTmF0YW5hZWwgQ29wYSA8bmNvcGFAYWxw
aW5lbGludXgub3JnPgogRGF0ZTogV2VkLCAxOCBTZXAgMjAyNCAxNjoxOTozNyAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSB0YXJnZXQvcmlzY3Yva3ZtOiBkbyBub3QgdXNlIG5vbi1wb3J0YWJsZSBz
dHJlcnJvcm5hbWVfbnAoKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdV8xMC4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjAuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdV8xMC4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXVfMTAuMC4zLmJiCi0tIAoyLjQ3LjEKCg==

--===============4179012450879018928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/qemu: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.0.3.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-add
 ition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/core2-64-poky-linux/qemu/qemu-common: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-common: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-dbg: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1866627648 to 1866834024 (+0%)
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
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 185128914 to 185124818 (-0%)
packages/core2-64-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-src: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-src: PKGSIZE changed from 33860011 to 33860101 (+0%)
packages/core2-64-poky-linux/qemu/qemu-src: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31625096 to 31629192 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29184224 to 29188320 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26876200 to 26880296 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13618088 to 13622184 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15710664 to 15714760 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13609896 to 13613992 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15813472 to 15817568 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16967304 to 16971400 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12136320 to 12140416 (+0%)
packages/core2-64-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.2" to "10.0.3"
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3343488 to 3347584 (+0%)
packages/core2-64-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.2 [default] to 10.0.3 [default]
packages/core2-64-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.2" to "10.0.3"
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

--===============4179012450879018928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1934 targets, 50 skipped, 0 masked, 0 errors.
Removing 122 recipes from the core2-64 sysroot...done.
Removing 125 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-24e1c2567f54ec442d7785f6496dfaf0f284fee9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:24e1c2567f54ec442d7785f6496dfaf0f284fee9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 994 Local 740 Mirrors 0 Missed 254 Current 409 (74% match, 81% complete)
Removing 16 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 419 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 479 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 488 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 496 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 505 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 552 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 556 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 571 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-10.0.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 575 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: recipe qemu-10.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 599 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 608 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-native-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 613 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 622 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-native-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 631 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 651 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-native-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 658 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 662 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 666 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-native-20.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 693 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 694 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsdl2-2.32.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe clang-cross-x86_64-20.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 706 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 707 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-native-20.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsdl2-2.32.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 718 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 719 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 721 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 733 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 736 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 741 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 744 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-native-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 770 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-tools-native-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 777 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 780 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-native-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 785 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-native-2_25.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 786 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-native-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 797 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 799 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_create_spdx_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 816 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 817 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 818 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 820 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 824 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 833 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 837 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 840 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 841 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 847 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_25.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 849 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 850 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 857 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 858 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 861 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 866 of 1403 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 869 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 887 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 888 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 890 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 891 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 892 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 896 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 907 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 915 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 921 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 922 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 923 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe clang-cross-x86_64-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 924 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 929 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 930 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 935 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 938 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 939 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 945 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 946 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 947 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 951 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 952 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 959 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 973 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 977 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 979 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 982 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 985 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 986 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 989 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 996 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 998 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1002 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1003 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1006 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1010 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1018 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1023 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1032 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1034 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1038 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1039 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1040 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1043 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1048 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1051 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1052 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1067 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1068 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1070 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1072 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1080 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1085 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1087 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1088 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1093 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1096 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1098 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1101 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1104 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1105 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1107 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1110 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1112 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1113 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1119 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1122 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1128 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1129 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1131 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1134 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1143 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1144 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1147 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1148 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1149 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1154 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1161 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1164 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1165 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1166 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1171 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1174 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1177 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1178 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1180 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1183 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1184 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1185 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1186 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1188 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1194 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1197 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1198 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1201 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1207 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1208 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1209 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1211 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1212 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1214 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1218 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1223 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1224 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1228 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1232 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1237 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1238 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1240 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1242 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1243 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1244 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1247 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1248 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1249 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1250 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1251 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1252 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1253 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1254 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1257 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1260 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1262 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1265 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1266 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1268 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1269 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1271 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1272 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1274 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1275 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1279 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1280 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1282 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1283 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1284 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1286 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1290 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1292 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1293 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1294 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1295 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1298 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1300 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1301 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1302 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1304 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1305 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1309 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1311 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1312 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1314 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1316 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1317 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1318 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1320 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1321 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1328 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1329 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1330 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1335 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1339 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 534 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1342 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1344 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 614 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: Running task 664 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1347 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1349 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1351 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running task 698 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: Running setscene task 1353 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1355 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1357 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1358 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1359 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 773 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 795 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: Running task 833 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_write_config)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41-r0: task do_fetch: Started
NOTE: Running task 937 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 939 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: Running task 945 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 976 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: Running task 977 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 984 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1361 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1363 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1013 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running setscene task 1365 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1366 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1022 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: Running task 1028 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1082 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1083 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1084 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: Running task 1085 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe util-linux-2.41-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1086 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: Running task 1093 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: Running task 1103 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Started
NOTE: Running task 1129 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1133 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: Running task 1136 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: Running setscene task 1368 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: Running task 1138 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1139 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: Running task 1141 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1144 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1145 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1154 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1156 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1177 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1179 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: Running task 1181 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: Running task 1182 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: Running task 1184 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1370 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1189 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1371 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1372 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1190 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: Running task 1191 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1201 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: Running task 1202 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: Running task 1210 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe util-linux-2.41-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: Running task 1211 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1218 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1375 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1376 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1377 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: Running task 1228 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 1229 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1230 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1380 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_patch: Started
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_patch)
NOTE: Running task 1260 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1265 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1276 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: Running task 1283 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1297 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: Running task 1323 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1344 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: Running task 1345 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: Running task 1394 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: Running setscene task 1385 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1388 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1390 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: Running task 1435 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: Running task 1443 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: Running task 1449 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1472 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: Running task 1476 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: Running task 1492 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1511 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_fetch)
NOTE: Running task 1512 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: Running task 1516 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1525 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 1526 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1392 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1394 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: Running setscene task 1395 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1531 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe bluez5-5.83-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_fetch: Succeeded
NOTE: Running task 1540 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe util-linux-2.41-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_unpack)
NOTE: Running task 1576 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: Running task 1579 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1590 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1608 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1610 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: Running task 1614 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 1616 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe bluez5-5.83-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1648 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1649 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: Running task 1686 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1689 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Running task 1691 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1692 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: Running task 1701 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: Running task 1704 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: Running task 1716 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1733 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_unpack: Succeeded
NOTE: Running task 1747 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1750 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: Running task 1755 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1760 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1761 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_fetch: Started
NOTE: Running task 1771 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1772 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.83-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1773 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: Running task 1774 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1775 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1776 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1783 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running task 1859 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1888 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: Running task 1893 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1902 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_unpack: Started
NOTE: Running task 1903 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_generate_toolchain_file)
NOTE: Running task 1906 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: Running task 1908 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: Running task 1909 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1910 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe bluez5-5.83-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1927 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_unpack: Started
NOTE: Running task 1974 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_fetch: Started
NOTE: recipe clang-20.1.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1397 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe clang-20.1.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1998 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: Running task 1999 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 2000 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2001 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: Running task 2002 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2003 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Succeeded
NOTE: Running task 2004 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_patch)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2005 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2012 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: Running task 2015 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: Running task 2028 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Succeeded
NOTE: Running task 2044 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: Running task 2045 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_fetch)
NOTE: Running task 2046 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_fetch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1401 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: Running setscene task 1402 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Started
NOTE: recipe ell-0.78-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2047 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.78-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Succeeded
NOTE: Running task 2059 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 2061 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: Running task 2063 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_write_config: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe ofono-2.17-r0: task do_fetch: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2089 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: Running task 2090 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2094 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2095 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_patch)
NOTE: Running task 2096 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_unpack)
NOTE: recipe ofono-2.17-r0: task do_fetch: Succeeded
NOTE: Running task 2100 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2101 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_unpack)
NOTE: Running task 2102 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_patch: Succeeded
NOTE: Running task 2104 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_generate_toolchain_file)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe ell-0.78-r0: task do_unpack: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Started
NOTE: Running task 2106 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: Running task 2114 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2117 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe ofono-2.17-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.78-r0: task do_unpack: Succeeded
NOTE: Running task 2125 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_patch)
NOTE: Running task 2126 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: Running task 2128 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe mesa-native-2_25.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2213 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: Running task 2271 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_25.1.6-r0: task do_write_config: Started
NOTE: recipe ell-0.78-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2338 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe ell-0.78-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2474 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.17-r0: task do_unpack: Succeeded
NOTE: Running task 2496 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2556 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2585 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2604 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2605 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2606 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.17-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Succeeded
NOTE: Running task 2611 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2612 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe ofono-2.17-r0: task do_patch: Succeeded
NOTE: Running task 2615 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Succeeded
NOTE: Running task 2618 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2627 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: Running task 2628 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 2629 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2634 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2635 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: Running task 2646 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_fetch)
NOTE: recipe libsdl2-2.32.8-r0: task do_fetch: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: Running task 2664 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_write_config)
NOTE: Running task 2665 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2666 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2667 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Started
NOTE: Running task 2668 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2669 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2670 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: Running task 2678 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 2679 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2680 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_fetch)
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 2681 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2682 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 2683 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_fetch)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_25.1.6-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: Running task 2684 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_configure)
NOTE: recipe pixman-1_0.46.2-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2687 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_unpack)
NOTE: recipe pixman-1_0.46.2-r0: task do_fetch: Succeeded
NOTE: Running task 2692 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2697 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_recipe_qa)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_patch: Started
NOTE: recipe qemu-10.0.3-r0: task do_recipe_qa: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 2698 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: Running task 2699 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe qemu-10.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2708 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_fetch)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Started
NOTE: Running task 2731 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_unpack)
NOTE: Running task 2733 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe qemu-10.0.3-r0: task do_fetch: Started
NOTE: recipe qemu-10.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Started
NOTE: Running task 2734 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libsdl2-2.32.8-r0: task do_unpack: Succeeded
NOTE: Running task 2735 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_patch)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe libsdl2-2.32.8-r0: task do_patch: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe mesa-native-2_25.1.6-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2736 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 2755 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe libsdl2-2.32.8-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot unihash changed to 8c93dafe3f2a8dcf911693c65fcf2f58c29d2f3fa2db913de59bfbaa4259cffd
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-native-2_25.1.6-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2757 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: Running task 2759 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: Running task 2760 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_unpack)
NOTE: Running task 2761 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2762 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2763 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_unpack)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2764 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Started
NOTE: Running task 2765 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_compile)
NOTE: recipe pixman-1_0.46.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_unpack: Succeeded
NOTE: Running task 2766 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_patch)
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 2767 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 2768 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2769 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2770 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_patch: Started
NOTE: Running task 2771 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_patch)
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2772 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2774 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: Running task 2787 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: recipe qemu-10.0.3-r0: task do_unpack: Started
NOTE: Running task 2817 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: Running task 2818 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2819 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Started
NOTE: Running task 2820 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_install)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2822 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_write_config)
NOTE: Running task 2823 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2824 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Started
NOTE: Running task 2825 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Started
NOTE: Running task 2826 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_write_config: Succeeded
NOTE: Running task 2840 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2841 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2842 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2843 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 2844 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2845 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_write_config)
NOTE: Running task 2846 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2847 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2848 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Started
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Started
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 2850 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running task 2851 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: Running task 2852 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_write_config)
NOTE: Running task 2853 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 2854 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Succeeded
NOTE: Running task 2855 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2856 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot)
NOTE: recipe mesa-2_25.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2858 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.1.6-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2859 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_generate_toolchain_file)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2860 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsdl2-2.32.8-r0: task do_generate_toolchain_file: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to 53cc88d93534b872c401cdf63c6718e7e46b2b1ffc8dd77adc02a889b03ccee3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsdl2-2.32.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to f1de4a65034064e087b26385d8f52817ed08039c694c8e79fe4b756050c8d095
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot unihash changed to b8d1dc350e09f0dfae1ca60f83f343c003e585f9c7e261ca414f4415667ec26e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: Running setscene task 1329 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1353 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1354 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1359 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1360 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1377 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: Running task 2861 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2862 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1394 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1395 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 2863 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: Running setscene task 1396 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2864 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 2866 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_configure)
NOTE: Running task 2867 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2868 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: Running task 2869 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1397 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1398 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1399 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2871 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2872 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1400 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to 38f83a11c9c34479afc73fac7ad6563dfc8a0d789690806b117aa9d1863d6952
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 32ee5a5ad9b804a546f1e9cbd96aaab6f158fc0ceace8d11e17f9d6b2acd57ae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: Running setscene task 1340 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1358 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1359 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running setscene task 1364 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Running setscene task 1373 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running task 2886 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 2887 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1374 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1375 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 1376 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1377 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: Running setscene task 1378 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: Running setscene task 1379 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2888 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: Running task 2889 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to fac3f88d3ed718e9a0846ad6924e184735b3e9027353121ced860f29c15fb8ed
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to ce66ff801eec67b426376350b04a19677c6c952cbc90b350ae486ae2c8a4aecc
NOTE: Running setscene task 1343 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1366 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1369 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1371 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running task 2890 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: Running task 2891 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 2892 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: Running task 2893 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: Running task 2894 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot unihash changed to 3e5f700f958e585a7ac486aef44123b934b81480f4d4cd927187a08105ecbc29
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_populate_sysroot became valid
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Running setscene task 1352 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running setscene task 1357 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: Running setscene task 1358 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1385 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2895 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: Running task 2896 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_configure)
NOTE: Running task 2938 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: Running task 2939 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2958 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: Running task 2970 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package)
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 2971 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_install)
NOTE: Running setscene task 1386 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1387 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1388 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1389 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1390 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_package_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1391 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_compile)
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: Running task 2982 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_compile: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: Running task 2984 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 3001 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: Running task 3016 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 1392 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running task 3040 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: recipe libucontext-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3041 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_fetch: Started
NOTE: Running task 3042 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running task 3043 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: Running setscene task 1393 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package unihash changed to 6d9729a802f6a5f5723b70e02e900e44687be041e0803967a8eb9644f05184dc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata became valid
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Running setscene task 1393 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 8aaca668f128f33d7b0bf430c3373e51183f113b61bc467eeb49fd68561be3cc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: recipe libepoxy-native-1.5.10-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot unihash changed to 8f8b06ef9156d55d1078d63c717f57d9b7e5c4f80522320ba67c6e2a8fd29922
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 1393 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot unihash changed to 7e997068b6f0c2fbf7c324167acd1a7fc617cbaa67deb2282704bee3e363fb0a
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3046 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 3047 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: Running task 3057 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 3084 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_fetch)
NOTE: Running task 3095 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: Running task 3108 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_fetch: Started
NOTE: Running task 3118 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_fetch: Succeeded
NOTE: Running task 3119 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_unpack)
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 3120 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3121 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package)
NOTE: recipe libsdl2-native-2.32.8-r0: task do_unpack: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_patch: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 3125 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_package: Started
NOTE: Running task 3142 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to ee70c338b49a1a499f11192918fca7ea0562883a130cdfb56250c63823df16e4
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: Running task 3156 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1394 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package unihash changed to 9241809893cd529815b8cfe30bb2915a95e6912c5f888e9c829cf1abc6825763
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata became valid
NOTE: Running setscene task 1369 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1393 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running task 3157 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_compile)
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3158 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to 408c17271eb3d05303a56f6a12892d35342c23d50559157d345204e83bf778ed
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot became valid
NOTE: recipe qemu-10.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1284 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_package_setscene)
NOTE: Running setscene task 1290 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: Running setscene task 1371 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1377 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1390 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running task 3159 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_patch)
NOTE: Running task 3160 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_patch)
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 3167 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe qemu-10.0.3-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_patch: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_patch: Succeeded
NOTE: Running task 3172 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_write_config: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3173 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1393 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 3176 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx)
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3177 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 3184 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1394 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_package: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1395 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package unihash changed to d6b7ad019537fd65b5003326a9eaf42fd73029916f0ef520764d7b34c0a23ae9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata became valid
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to 34f150270bdf437337e35bfe69a3c68687ccd1c2d63a09dd9da451054e6d8e50
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1392 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: Running task 3185 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3187 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: Running task 3189 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 3238 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_generate_toolchain_file)
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: Running setscene task 1396 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe qemu-10.0.3-r0: task do_patch: Succeeded
NOTE: Running task 3239 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3247 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe libsdl2-native-2.32.8-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3276 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3277 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure)
NOTE: recipe qemu-10.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3315 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_write_config: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3316 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.41-r0: task do_configure: Started
NOTE: recipe virglrenderer-native-1.1.1-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3318 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3319 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3324 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe qemu-10.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3325 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3326 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3340 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3341 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3342 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 3343 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Succeeded
NOTE: Running task 3344 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_install)
NOTE: recipe libdrm-2.4.125-r0: task do_install: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1397 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1398 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1399 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1400 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1401 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1402 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_install: Succeeded
NOTE: Running task 3345 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot)
NOTE: Running task 3346 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to 0c8b406e3324bc256f522f49e71b22788924c0a8746a79967767533c5add642b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: Running setscene task 1402 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_package: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running task 3422 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3432 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3460 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_create_spdx)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot unihash changed to 17325b3e62fb2644124d283705bbc541fecf8fe8e0581bb7f927fd852b098a6e
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3461 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3462 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3463 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3464 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3465 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_configure: Started
NOTE: Running task 3466 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3467 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: Running task 3468 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3469 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3470 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3471 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3472 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3473 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure: Succeeded
NOTE: Running task 3474 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_configure_ptest_base)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3475 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.125-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package unihash changed to 3d94fc8025710f808501ede8d5330a27913165c0abc6cac81a3265f3e3ebb7b9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata became valid
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 3477 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3478 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3480 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3481 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: Running task 3482 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3483 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_configure)
NOTE: Running task 3484 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure)
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3485 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3486 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3487 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3488 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3489 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_install)
NOTE: Running task 3490 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 3491 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3492 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3493 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3494 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3495 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3496 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3497 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 3498 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 3499 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_install: Succeeded
NOTE: Running task 3500 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot)
NOTE: Running task 3501 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to e4561828b0c025ce6778a444d78c05eda3daed3bd71517c443629c5afc520008
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata became valid
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_package: Started
NOTE: Running setscene task 1328 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1381 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1382 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 1390 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: Running task 3502 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: Running task 3503 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1396 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot unihash changed to 8d67b6fc930caac5f0590d1c9de0a9166038baeebb962c97802f607c7c3ce198
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Started
NOTE: Running task 3504 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1397 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3505 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3506 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.45-r0: task do_package_setscene: Started
NOTE: Running task 3507 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3508 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1398 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running task 3509 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3510 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.41/temp/log.do_packagedata_setscene.4043984
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3511 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.2-r0: task do_package: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_package unihash changed to f7e121b3bb8019387851a4deb2661652a3ef5524d8fc537d0249dc2f15e297dd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata became valid
NOTE: Running setscene task 1398 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3515 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3517 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.45-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1399 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1400 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package_setscene)
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3518 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 3519 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_install)
NOTE: Running task 3520 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: Running task 3521 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_install: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3522 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Succeeded
NOTE: Running task 3523 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 3524 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 3525 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_package)
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot unihash changed to 001d1dddc9fac469048806a553149454ececb2f6fc9ae5f1bec778150419522d
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1401 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1402 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 3526 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_compile_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_package unihash changed to a897ce11a2e7fb704a8a6eb5f3ddbc1c02a9426dcbd3a2dce97baafc875cb8fe
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata became valid
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3527 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_install)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3529 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package became valid
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install: Succeeded
NOTE: Running task 3530 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3531 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3537 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot unihash changed to 5271f1a3861eaade2f7d0d3310b1f2d6c1ff73a1c93cacf6db555ff155cd3fc3
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3549 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3550 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3553 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3554 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package became valid
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3574 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3581 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_create_spdx)
NOTE: recipe binutils-2.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3582 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 3583 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3584 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3585 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3586 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3587 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Succeeded
NOTE: Running task 3588 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.45-r0: task do_configure: Succeeded
NOTE: Running task 3589 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_compile)
NOTE: recipe binutils-2.45-r0: task do_compile: Started
NOTE: recipe util-linux-2.41-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package became valid
NOTE: Running setscene task 1403 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package_setscene)
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running task 3590 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3591 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3592 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to bc285eca02bdf44f58b27b1b33af82fbba0b0006c0603d5315e4a512cd7e712e
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3599 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3600 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3602 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3603 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3604 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_packagedata: Succeeded
NOTE: Running task 3605 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to 7f032fd724b098139678faaf402dcb27bc4f0513e627b5e3a259b33e1f171e71
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: recipe util-linux-2.41-r0: task do_create_spdx: Started
NOTE: Running setscene task 1402 of 1403 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3607 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_create_spdx: Succeeded
NOTE: Running task 3608 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_collect_spdx_deps)
NOTE: Running task 3609 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3610 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3611 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3612 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3613 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: Running task 3621 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk)
NOTE: Running task 3622 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb)
NOTE: Running task 3623 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: Running task 3624 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa)
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.3-r0: task do_package_qa: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3625 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 3626 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb unihash changed to 3f052b9ca2a077bf3d9fdd934ceb0e5d18d1188aac85ffc3381d5762343db10d
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk unihash changed to 3919438e590ad78735550a405aefee5d314b82cd314ae228f62f73e21b9d873e
NOTE: recipe bash-5.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa unihash changed to 6dacfeaa20e5bb8fb87136f222360860ffb39a3dc9a5cececa4408042dbf755d
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm unihash changed to 0c6a8101cc12e2780ab4a6038e53ced01373c8055539711cab1e8f8a64a9f07e
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3627 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to ba47ccf3d54323529fa1bae3b5c867909f33d96b94802e65a988efc569eda74e
NOTE: Setscene tasks completed
NOTE: Running task 3628 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.45-r0: task do_compile: Succeeded
NOTE: Running task 3629 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_install)
NOTE: recipe binutils-2.45-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile: Succeeded
NOTE: Running task 3630 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3631 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install: Succeeded
NOTE: Running task 3632 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3633 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot)
NOTE: Running task 3634 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3635 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3636 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3637 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3638 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3639 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe libslirp-4.9.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3640 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe binutils-2.45-r0: task do_install: Succeeded
NOTE: Running task 3641 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_configure: Succeeded
NOTE: Running task 3644 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_compile)
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_compile: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3645 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3646 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_create_spdx)
NOTE: recipe clang-20.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.45-r0: task do_create_spdx: Started
NOTE: recipe libslirp-4.9.1-r0: task do_compile: Succeeded
NOTE: Running task 3647 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_install)
NOTE: recipe libslirp-4.9.1-r0: task do_install: Started
NOTE: recipe binutils-2.45-r0: task do_create_spdx: Succeeded
NOTE: Running task 3648 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps)
NOTE: recipe clang-20.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3649 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_configure)
NOTE: recipe clang-20.1.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe clang-20.1.8-r0: task do_configure: Started
NOTE: recipe clang-20.1.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_install: Succeeded
NOTE: Running task 3650 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 3651 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3652 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 3653 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3654 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 3655 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 3656 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3657 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3658 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3659 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-native-2_25.1.6-r0: task do_compile: Succeeded
NOTE: Running task 3660 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe ell-0.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package: Succeeded
NOTE: Running task 3661 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata)
NOTE: recipe ell-0.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3662 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_configure)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_install: Succeeded
NOTE: Running task 3663 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: recipe ell-0.78-r0: task do_configure: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3664 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3665 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: Running task 3666 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3667 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_create_spdx: Started
NOTE: recipe mesa-native-2_25.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3668 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 3669 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3670 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 3671 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb:do_configure)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_configure: Started
NOTE: recipe libsdl2-native-2.32.8-r0: task do_configure: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3672 of 3833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_compile: Started
NOTE: recipe ell-0.78-r0: task do_configure: Succeeded
NOTE: Running task 3673 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_compile)
NOTE: recipe ell-0.78-r0: task do_compile: Started
NOTE: recipe clang-20.1.8-r0: task do_configure: Succeeded
NOTE: Running task 3674 of 3833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata: Failed
NOTE: recipe clang-20.1.8-r0: task do_compile: Started
NOTE: recipe ell-0.78-r0: task do_compile: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: recipe libsdl2-native-2.32.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
Bitbake still alive (no events for 600s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_compile
NOTE: recipe clang-20.1.8-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3674 tasks of which 3189 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801072145.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801072145.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.84.2/temp/log.do_packagedata.4170752
Summary: There were 278 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bits went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-coresched went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fcntl-lock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41.1-r0 to 0:2.41-r0) [version-going-backwards]
ERROR: util-linux-2.41-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.84.3-r0 to 1:2.84.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.84.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glib-2.0/2.84.2/temp/log.do_packagedata.4170752
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata) failed with exit code '1'

--===============4179012450879018928==--

