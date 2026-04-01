Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A566D107639B
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14746.1775054159060256522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=o2kWWxo6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ay7VUVrk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d4978fa31-fece51c9-c9ce-4466-9baa-adc8100bf62b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uQEGFeHrYkvzApQvjXSY+5rYGFrWpA0NoOsUUDe90aE=;
	b=o2kWWxo6pVN+1qA1yUEBK4a8zW5Zkk95F2q2Qj169nM56ZU3NRJB/ywAJikTnFqm
	rnE3O/RmGq2UeUzO5iqJ0KUP+5zimBcD/uZ8P2L9aEX2cUWBAn/5tiDiZDz0W8b3cfT
	KRM+Q9AY4ZNzwcU7P6zbtY3XKiiE9lSZtvUp93MY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uQEGFeHrYkvzApQvjXSY+5rYGFrWpA0NoOsUUDe90aE=;
	b=ay7VUVrkgFh3FHIDobn7BqpISLPmrzCnwV2gUSCjviWKfGTBvTUhxOcKfZRu6tXO
	DuUPDkxTRKIGWH+QTcsCwoBeWJxCRlbM2J1JGx1YLXvaZKiWuOgDAw6Yb6eyuQdyLC9
	Xe/oVpytA0EDZEDou+eHhF9qmBb87MV44OPIJ63U=
Content-Type: multipart/mixed; boundary="===============0802619715264443057=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kea: upgrading to 3.0.3 SUCCEEDED
Message-ID: <0101019d4978fa31-fece51c9-c9ce-4466-9baa-adc8100bf62b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234369

--===============0802619715264443057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *3.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-3.0.2-3.0.3.patch
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
From 7c440b9aa1614c454a0861f47fef89e7928b1ca6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 07:03:22 +0000
Subject: [PATCH] kea: upgrade 3.0.2 -> 3.0.3

---
 .../files/0001-build-boost-1.89.0-fixes.patch |  4 ++--
 ...s-dhcpsrv-Avoid-Boost-lexical_cast-o.patch |  2 +-
 ...se-a-runtime-safe-interpreter-string.patch |  4 ++--
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |  2 +-
 ...er_level_impl.cc-add-a-missing-inclu.patch |  2 +-
 ...er_unittest_support.cc-do-not-write-.patch |  2 +-
 .../kea/files/fix-multilib-conflict.patch     |  2 +-
 .../kea/{kea_3.0.2.bb => kea_3.0.3.bb}        | 23 +++++++++++++++++--
 8 files changed, 30 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_3.0.2.bb => kea_3.0.3.bb} (83%)

diff --git a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
index 46a1e38eae..8fa65e356b 100644
--- a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
@@ -1,4 +1,4 @@
-From c7d1036c6476ddca79a6beb03604a2364d7c469e Mon Sep 17 00:00:00 2001
+From f7c3968a1445c176ce01bb10c4a669ed0487ca5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 27 Aug 2025 22:20:09 -0700
 Subject: [PATCH] build: boost 1.89.0 fixes
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 8ed5b2d..d5723ba 100644
+index b0cecee..7508a4a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -189,7 +189,7 @@ message(f'Detected system "@SYSTEM@".')
diff --git a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
index 7c24a3a27c..27db8bf7e3 100644
--- a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
+++ b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
@@ -1,4 +1,4 @@
-From 4a507d1822cbfb561657ed9a8ccb0dfeced30cac Mon Sep 17 00:00:00 2001
+From 37045166dad309e4aa61b942286e2f2b3c922b1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Sep 2025 12:52:51 -0700
 Subject: [PATCH] d2/dhcp[46]/radius/dhcpsrv: Avoid Boost lexical_cast on enums
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
index 3740c4abc7..efe0e86575 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -1,4 +1,4 @@
-From f7024a5e7153538072a57858e1b48bbb806167e7 Mon Sep 17 00:00:00 2001
+From 27460bbd84a582a9871a84d27a96019e333e54cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:02:49 -0700
 Subject: [PATCH] meson: use a runtime-safe interpreter string
@@ -44,7 +44,7 @@ index 74ba705..71f1c7b 100644
  if PDFLATEX.found()
      doc_conf.set('HAVE_PDFLATEX', 'yes')
 diff --git a/meson.build b/meson.build
-index d5723ba..3bb5185 100644
+index 7508a4a..769e157 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -638,9 +638,13 @@ link_args = []
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
index 076de53c0a..f5115a56d3 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -1,4 +1,4 @@
-From 920e4895c679a5bfda29e66fa199ad8e889659d0 Mon Sep 17 00:00:00 2001
+From c8085690fa4cddb912e167088935ee57fbe61c1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
index 269615dbef..c6f353c559 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
@@ -1,4 +1,4 @@
-From 1ad52a9bbec644e653cc67a596b811b70787c2dd Mon Sep 17 00:00:00 2001
+From e1a0833d4a5ef4466790accc88bc1a91c8eba604 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 17 Dec 2025 12:36:24 +0100
 Subject: [PATCH] src/lib/log/logger_level_impl.cc: add a missing include to
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 7d051705e8..4676ed6352 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 1a0a7b9633ebc4c171b8ee6db6fcf48e8e27a4b8 Mon Sep 17 00:00:00 2001
+From a30634c11e34d948b914c8de943e71ecafcc12f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 34ae256823..1a4919e139 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 00e2905dc622f98f608d253b1148a3d778131cad Mon Sep 17 00:00:00 2001
+From 66cd683edcf9fec2fb759c6e4c59e933eb30abc5 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 14 Oct 2025 01:37:35 +0000
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-connectivity/kea/kea_3.0.3.bb
similarity index 83%
rename from meta/recipes-connectivity/kea/kea_3.0.2.bb
rename to meta/recipes-connectivity/kea/kea_3.0.3.bb
index f46cb1bf80..f8b929361c 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.3.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
+# +Copyright (C) 2009-2026 Internet Systems Consortium, Inc. ("ISC")
+#  
+#  This Source Code Form is subject to the terms of the Mozilla Public
+#  License, v. 2.0. If a copy of the MPL was not distributed with this
+# 
+#
+
 SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb634ed1d923b8b8fd1ed7ffc9b70ae4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a64dc8efc3c40d0502ad372f810700e4"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -23,7 +42,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
            file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch \
            "
-SRC_URI[sha256sum] = "29f4e44fa48f62fe15158d17411e003496203250db7b3459c2c79c09f379a541"
+SRC_URI[sha256sum] = "09702ddb078b637e85de9236cbedd3fb9d7af7c6e797026c538b45748ad4d631"
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-- 
2.47.1


--===============0802619715264443057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.120 /usr/lib/libkea-config.so.83 /usr/lib/libkea-hooks.so.120.0.0 /usr/lib/libkea-cc.so.82 /usr/lib/libkea-config.so.83.0.0 /usr/lib/libkea-util.so.101 /usr/lib/libkea-process.so.90.0.0 /usr/lib/libkea-cc.so.82.0.0 /usr/lib/libkea-process.so.90 /usr/lib/libkea-util.so.101.0.0", added "/usr/lib/libkea-config.so.84 /usr/lib/libkea-util.so.102.0.0 /usr/lib/libkea-hooks.so.121 /usr/lib/libkea-cc.so.83 /usr/lib/libkea-hooks.so.121.0.0 /usr/lib/libkea-util.so.102 /usr/lib/libkea-config.so.84.0.0 /usr/lib/libkea-process.so.91.0.0 /usr/lib/libkea-cc.so.83.0.0 /usr/lib/libkea-process.so.91"
Changes to packages/x86-64-v3-poky-linux/kea (sysroot):
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.82 to libkea-cc.so.83
  /usr/lib/libkea-config.so changed symlink target from libkea-config.so.83 to libkea-config.so.84
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.120 to libkea-hooks.so.121
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.90 to libkea-process.so.91
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.101 to libkea-util.so.102
  /usr/lib/libkea-cc.so.82.0.0 moved to /usr/lib/libkea-cc.so.83.0.0
  /usr/lib/libkea-cc.so.82 moved to /usr/lib/libkea-cc.so.83
  /usr/lib/libkea-config.so.83.0.0 moved to /usr/lib/libkea-config.so.84.0.0
  /usr/lib/libkea-config.so.83 moved to /usr/lib/libkea-config.so.84
  /usr/lib/libkea-hooks.so.120.0.0 moved to /usr/lib/libkea-hooks.so.121.0.0
  /usr/lib/libkea-hooks.so.120 moved to /usr/lib/libkea-hooks.so.121
  /usr/lib/libkea-process.so.90.0.0 moved to /usr/lib/libkea-process.so.91.0.0
  /usr/lib/libkea-process.so.90 moved to /usr/lib/libkea-process.so.91
  /usr/lib/libkea-util.so.101.0.0 moved to /usr/lib/libkea-util.so.102.0.0
  /usr/lib/libkea-util.so.101 moved to /usr/lib/libkea-util.so.102

--===============0802619715264443057==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-3.0.2-3.0.3.patch"

RnJvbSA3YzQ0MGI5YWExNjE0YzQ1NGEwODYxZjQ3ZmVmODllNzkyOGIxY2E2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwNzowMzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
YTogdXBncmFkZSAzLjAuMiAtPiAzLjAuMwoKLS0tCiAuLi4vZmlsZXMvMDAwMS1idWlsZC1ib29z
dC0xLjg5LjAtZml4ZXMucGF0Y2ggfCAgNCArKy0tCiAuLi5zLWRoY3BzcnYtQXZvaWQtQm9vc3Qt
bGV4aWNhbF9jYXN0LW8ucGF0Y2ggfCAgMiArLQogLi4uc2UtYS1ydW50aW1lLXNhZmUtaW50ZXJw
cmV0ZXItc3RyaW5nLnBhdGNoIHwgIDQgKystLQogLi4uLzAwMDEtbWtfY2ZncnB0LnNoLXN0cmlw
LXByZWZpeGVzLnBhdGNoICAgIHwgIDIgKy0KIC4uLmVyX2xldmVsX2ltcGwuY2MtYWRkLWEtbWlz
c2luZy1pbmNsdS5wYXRjaCB8ICAyICstCiAuLi5lcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5v
dC13cml0ZS0ucGF0Y2ggfCAgMiArLQogLi4uL2tlYS9maWxlcy9maXgtbXVsdGlsaWItY29uZmxp
Y3QucGF0Y2ggICAgIHwgIDIgKy0KIC4uLi9rZWEve2tlYV8zLjAuMi5iYiA9PiBrZWFfMy4wLjMu
YmJ9ICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrLS0KIDggZmlsZXMgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9rZWEve2tlYV8zLjAuMi5iYiA9PiBrZWFfMy4wLjMuYmJ9ICg4MyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1idWlsZC1ib29z
dC0xLjg5LjAtZml4ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxl
cy8wMDAxLWJ1aWxkLWJvb3N0LTEuODkuMC1maXhlcy5wYXRjaAppbmRleCA0NmExZTM4ZWFlLi44
ZmE2NWUzNTZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxl
cy8wMDAxLWJ1aWxkLWJvb3N0LTEuODkuMC1maXhlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLWJ1aWxkLWJvb3N0LTEuODkuMC1maXhlcy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzdkMTAzNmM2NDc2ZGRjYTc5YTZiZWIwMzYwNGEyMzY0
ZDdjNDY5ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjdjMzk2OGExNDQ1YzE3NmNl
MDFiYjEwYzRhNjY5ZWQwNDg3Y2E1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDIyOjIw
OjA5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkOiBib29zdCAxLjg5LjAgZml4ZXMKQEAg
LTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDhlZDViMmQuLmQ1
NzIzYmEgMTAwNjQ0CitpbmRleCBiMGNlY2VlLi43NTA4YTRhIDEwMDY0NAogLS0tIGEvbWVzb24u
YnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTg5LDcgKzE4OSw3IEBAIG1lc3NhZ2UoZidE
ZXRlY3RlZCBzeXN0ZW0gIkBTWVNURU1AIi4nKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1kMi1kaGNwLTQ2LXJhZGl1cy1kaGNwc3J2LUF2b2lk
LUJvb3N0LWxleGljYWxfY2FzdC1vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9r
ZWEvZmlsZXMvMDAwMS1kMi1kaGNwLTQ2LXJhZGl1cy1kaGNwc3J2LUF2b2lkLUJvb3N0LWxleGlj
YWxfY2FzdC1vLnBhdGNoCmluZGV4IDdjMjRhM2EyN2MuLjI3ZGI4YmY3ZTMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtZDItZGhjcC00Ni1yYWRp
dXMtZGhjcHNydi1Bdm9pZC1Cb29zdC1sZXhpY2FsX2Nhc3Qtby5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLWQyLWRoY3AtNDYtcmFkaXVzLWRoY3Bz
cnYtQXZvaWQtQm9vc3QtbGV4aWNhbF9jYXN0LW8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDRhNTA3ZDE4MjJjYmZiNTYxNjU3ZWQ5YThjY2IwZGZlY2VkMzBjYWMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDM3MDQ1MTY2ZGFkMzA5ZTRhYTYxYjk0MjI4NmUyZjJiM2M5MjJiMWIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogRGF0ZTogV2VkLCAzIFNlcCAyMDI1IDEyOjUyOjUxIC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGQyL2RoY3BbNDZdL3JhZGl1cy9kaGNwc3J2OiBBdm9pZCBCb29zdCBsZXhpY2FsX2Nhc3Qg
b24gZW51bXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVz
LzAwMDEtbWVzb24tdXNlLWEtcnVudGltZS1zYWZlLWludGVycHJldGVyLXN0cmluZy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtbWVzb24tdXNlLWEtcnVu
dGltZS1zYWZlLWludGVycHJldGVyLXN0cmluZy5wYXRjaAppbmRleCAzNzQwYzRhYmM3Li5lZmUw
ZTg2NTc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8w
MDAxLW1lc29uLXVzZS1hLXJ1bnRpbWUtc2FmZS1pbnRlcnByZXRlci1zdHJpbmcucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1tZXNvbi11c2UtYS1y
dW50aW1lLXNhZmUtaW50ZXJwcmV0ZXItc3RyaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBmNzAyNGE1ZTcxNTM1MzgwNzJhNTc4NThlMWI0OGJiYjgwNjE2N2U3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAyNzQ2MGJiZDg0YTU4MmE5ODcxYTg0ZDI3YTk2MDE5ZTMzM2U1NGNk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFRodSwgMjggQXVnIDIwMjUgMTc6MDI6NDkgLTA3MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gbWVzb246IHVzZSBhIHJ1bnRpbWUtc2FmZSBpbnRlcnByZXRlciBzdHJpbmcKQEAgLTQ0
LDcgKzQ0LDcgQEAgaW5kZXggNzRiYTcwNS4uNzFmMWM3YiAxMDA2NDQKICBpZiBQREZMQVRFWC5m
b3VuZCgpCiAgICAgIGRvY19jb25mLnNldCgnSEFWRV9QREZMQVRFWCcsICd5ZXMnKQogZGlmZiAt
LWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IGQ1NzIzYmEuLjNiYjUxODUg
MTAwNjQ0CitpbmRleCA3NTA4YTRhLi43NjllMTU3IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQK
ICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNjM4LDkgKzYzOCwxMyBAQCBsaW5rX2FyZ3MgPSBbXQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1ta19j
ZmdycHQuc2gtc3RyaXAtcHJlZml4ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2tlYS9maWxlcy8wMDAxLW1rX2NmZ3JwdC5zaC1zdHJpcC1wcmVmaXhlcy5wYXRjaAppbmRleCAw
NzZkZTUzYzBhLi5mNTExNWE1NmQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2tlYS9maWxlcy8wMDAxLW1rX2NmZ3JwdC5zaC1zdHJpcC1wcmVmaXhlcy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLW1rX2NmZ3JwdC5zaC1z
dHJpcC1wcmVmaXhlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTIwZTQ4OTVjNjc5YTVi
ZmRhMjllNjZmYTE5OWFkOGU4ODk2NTlkMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YzgwODU2OTBmYTRjZGRiOTEyZTE2NzA4ODkzNWVlNTdmYmU2MWMxYiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUs
IDI4IEF1ZyAyMDI1IDE3OjMxOjM5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1rX2NmZ3JwdC5z
aDogc3RyaXAgcHJlZml4ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
a2VhL2ZpbGVzLzAwMDEtc3JjLWxpYi1sb2ctbG9nZ2VyX2xldmVsX2ltcGwuY2MtYWRkLWEtbWlz
c2luZy1pbmNsdS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAw
MDEtc3JjLWxpYi1sb2ctbG9nZ2VyX2xldmVsX2ltcGwuY2MtYWRkLWEtbWlzc2luZy1pbmNsdS5w
YXRjaAppbmRleCAyNjk2MTVkYmVmLi5jNmYzNTNjNTU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl9sZXZlbF9p
bXBsLmNjLWFkZC1hLW1pc3NpbmctaW5jbHUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfbGV2ZWxfaW1wbC5jYy1h
ZGQtYS1taXNzaW5nLWluY2x1LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxYWQ1MmE5YmJl
YzY0NGU2NTNjYzY3YTU5NmI4MTFiNzA3ODdjMmRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBlMWEwODMzZDRhNWVmNDQ2Njc5MGFjY2M4OGJjMWE5MWM4ZWJhNjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KIERhdGU6IFdlZCwgMTcgRGVjIDIwMjUgMTI6MzY6MjQgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gc3JjL2xpYi9sb2cvbG9nZ2VyX2xldmVsX2ltcGwuY2M6IGFkZCBhIG1pc3NpbmcgaW5jbHVk
ZSB0bwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAw
MS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1ub3Qtd3JpdGUtLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxv
Zy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1ub3Qtd3JpdGUtLnBhdGNoCmluZGV4IDdk
MDUxNzA1ZTguLjQ2NzZlZDYzNTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkva2VhL2ZpbGVzLzAwMDEtc3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2Mt
ZG8tbm90LXdyaXRlLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9m
aWxlcy8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13
cml0ZS0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFhMGE3Yjk2MzNlYmM0YzE3MWI4ZWU2
ZGI2ZmNmNDhlOGUyN2E0YjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEzMDYzNGMx
MWUzNGQ5NDhiOTE0YzhkZTk0M2U3MWVjYWZjYzEyZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFR1ZSwgMTAgTm92IDIwMjAgMTU6NTc6MDMgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL2xp
Yi9sb2cvbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2M6IGRvIG5vdCB3cml0ZSBidWlsZApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4LW11bHRpbGli
LWNvbmZsaWN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4
LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoCmluZGV4IDM0YWUyNTY4MjMuLjFhNDkxOWUxMzkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeC1tdWx0aWxp
Yi1jb25mbGljdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxl
cy9maXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAwZTI5
MDVkYzYyMmY5OGY2MDhkMjUzYjExNDhhM2Q3NzgxMzFjYWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDY2Y2Q2ODNlZGNmOWZlYzJmYjc1OWM2ZTRjNTllOTMzZWIzMGFiYzUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNv
bT4KIERhdGU6IFR1ZSwgMTQgT2N0IDIwMjUgMDE6Mzc6MzUgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gVGhlcmUgYXJlIGNvbmZsaWN0IG9mIGNvbmZpZyBmaWxlcyBiZXR3ZWVuIGtlYSBhbmQgbGli
MzIta2VhOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzMu
MC4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzMuMC4zLmJiCnNpbWls
YXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2Vh
L2tlYV8zLjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2Vh
XzMuMC4zLmJiCmluZGV4IGY0NmNiMWJmODAuLmY4YjkyOTM2MWMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8zLjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2tlYS9rZWFfMy4wLjMuYmIKQEAgLTEsOSArMSwyOCBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsNCArMSw0IEBACisj
IC1Db3B5cmlnaHQgKEMpIDIwMDktMjAyNSBJbnRlcm5ldCBTeXN0ZW1zIENvbnNvcnRpdW0sIElu
Yy4gKCJJU0MiKQorIyArQ29weXJpZ2h0IChDKSAyMDA5LTIwMjYgSW50ZXJuZXQgU3lzdGVtcyBD
b25zb3J0aXVtLCBJbmMuICgiSVNDIikKKyMgIAorIyAgVGhpcyBTb3VyY2UgQ29kZSBGb3JtIGlz
IHN1YmplY3QgdG8gdGhlIHRlcm1zIG9mIHRoZSBNb3ppbGxhIFB1YmxpYworIyAgTGljZW5zZSwg
di4gMi4wLiBJZiBhIGNvcHkgb2YgdGhlIE1QTCB3YXMgbm90IGRpc3RyaWJ1dGVkIHdpdGggdGhp
cworIyAKKyMKKwogU1VNTUFSWSA9ICJJU0MgS2VhIERIQ1AgU2VydmVyIgogREVTQ1JJUFRJT04g
PSAiS2VhIGlzIHRoZSBuZXh0IGdlbmVyYXRpb24gb2YgREhDUCBzb2Z0d2FyZSBkZXZlbG9wZWQg
YnkgSVNDLiBJdCBzdXBwb3J0cyBib3RoIERIQ1B2NCBhbmQgREhDUHY2IHByb3RvY29scyBhbG9u
ZyB3aXRoIHRoZWlyIGV4dGVuc2lvbnMsIGUuZy4gcHJlZml4IGRlbGVnYXRpb24gYW5kIGR5bmFt
aWMgdXBkYXRlcyB0byBETlMuIgogSE9NRVBBR0UgPSAiaHR0cDovL2tlYS5pc2Mub3JnIgogU0VD
VElPTiA9ICJjb25uZWN0aXZpdHkiCiBMSUNFTlNFID0gIk1QTC0yLjAiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1mYjYzNGVkMWQ5MjNiOGI4ZmQxZWQ3ZmZjOWI3MGFl
NCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWE2NGRjOGVmYzNjNDBk
MDUwMmFkMzcyZjgxMDcwMGU0IgogCiBERVBFTkRTID0gImJvb3N0IGxvZzRjcGx1cyBvcGVuc3Ns
IgogCkBAIC0yMyw3ICs0Miw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5pc2Mub3JnL2lzYy9r
ZWEvJHtQVn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZDItZGhjcC00
Ni1yYWRpdXMtZGhjcHNydi1Bdm9pZC1Cb29zdC1sZXhpY2FsX2Nhc3Qtby5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl9sZXZlbF9pbXBsLmNjLWFkZC1h
LW1pc3NpbmctaW5jbHUucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjlmNGU0NGZhNDhmNjJmZTE1MTU4ZDE3NDExZTAwMzQ5NjIwMzI1MGRiN2IzNDU5YzJjNzlj
MDlmMzc5YTU0MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwOTcwMmRkYjA3OGI2MzdlODVkZTky
MzZjYmVkZDNmYjlkN2FmN2M2ZTc5NzAyNmM1MzhiNDU3NDhhZDRkNjMxIgogCiBpbmhlcml0IG1l
c29uIHBrZ2NvbmZpZyBzeXN0ZW1kIHVwZGF0ZS1yYy5kIHVwc3RyZWFtLXZlcnNpb24taXMtZXZl
bgogCi0tIAoyLjQ3LjEKCg==

--===============0802619715264443057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kea/kea-dbg: PKGSIZE changed from 528021400 to 528210392 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-dbg: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-process.so.90.0.0 /usr/lib/.debug/libkea-config.so.83.0.0 /usr/lib/.debug/libkea-cc.so.82.0.0 /usr/lib/.debug/libkea-hooks.so.120.0.0 /usr/lib/.debug/libkea-util.so.101.0.0", added "/usr/lib/.debug/libkea-process.so.91.0.0 /usr/lib/.debug/libkea-config.so.84.0.0 /usr/lib/.debug/libkea-cc.so.83.0.0 /usr/lib/.debug/libkea-hooks.so.121.0.0 /usr/lib/.debug/libkea-util.so.102.0.0"
packages/x86-64-v3-poky-linux/kea/kea-dbg: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-dev: PKGSIZE changed from 4093978 to 4101970 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-dev: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-dev: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-doc: PKGSIZE changed from 1424692 to 1425460 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-doc: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-doc: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-locale: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-locale: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-python: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-python: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-src: PKGSIZE changed from 12018615 to 12034066 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-src: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-src: FILELIST: directory renamed /usr/src/debug/kea/3.0.2/src/lib/d2srv -> /usr/src/debug/kea/3.0.3/src/lib/d2srv, directory renamed /usr/src/debug/kea/3.0.2/src/lib/util/io -> /usr/src/debug/kea/3.0.3/src/lib/util/io, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/lease_query -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/lease_query, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcp -> /usr/src/debug/kea/3.0.3/src/lib/dhcp, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/high_availability -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/high_availability, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/host_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/host_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/bin/agent -> /usr/src/debug/kea/3.0.3/src/bin/agent, directory renamed /usr/src/debug/kea/3.0.2/src/bin/perfdhcp -> /usr/src/debug/kea/3.0.3/src/bin/perfdhcp, directory renamed /usr/src/debug/kea/3.0.2/src/lib/
 asiolink -> /usr/src/debug/kea/3.0.3/src/lib/asiolink, directory renamed /usr/src/debug/kea/3.0.2/src/bin/lfc -> /usr/src/debug/kea/3.0.3/src/bin/lfc, directory renamed /usr/src/debug/kea/3.0.2/src/lib/config -> /usr/src/debug/kea/3.0.3/src/lib/config, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dns -> /usr/src/debug/kea/3.0.3/src/lib/dns, directory renamed /usr/src/debug/kea/3.0.2/src/lib/util -> /usr/src/debug/kea/3.0.3/src/lib/util, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/stat_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/stat_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/cryptolink -> /usr/src/debug/kea/3.0.3/src/lib/cryptolink, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/ddns_tuning -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/ddns_tuning, directory renamed /usr/src/debug/kea/3.0.2/src/lib/database -> /usr/src/debug/kea/3.0.3/src/lib/database, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/flex_option -> /usr/src/debu
 g/kea/3.0.3/src/hooks/dhcp/flex_option, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/run_script -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/run_script, directory renamed /usr/src/debug/kea/3.0.2/src/lib/process -> /usr/src/debug/kea/3.0.3/src/lib/process, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/bootp -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/bootp, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/lease_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/lease_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/hooks -> /usr/src/debug/kea/3.0.3/src/lib/hooks, directory renamed /usr/src/debug/kea/3.0.2/src/lib/log -> /usr/src/debug/kea/3.0.3/src/lib/log, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/class_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/class_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/flex_id -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/flex_id, directory renamed /usr/src/debug/kea/3.0.2/src/lib/tc
 p -> /usr/src/debug/kea/3.0.3/src/lib/tcp, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/limits -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/limits, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcpsrv/parsers -> /usr/src/debug/kea/3.0.3/src/lib/dhcpsrv/parsers, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcp_ddns -> /usr/src/debug/kea/3.0.3/src/lib/dhcp_ddns, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/host_cache -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/host_cache, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/radius -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/radius, directory renamed /usr/src/debug/kea/3.0.2/src/lib/asiodns -> /usr/src/debug/kea/3.0.3/src/lib/asiodns, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/subnet_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/subnet_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/util/encode -> /usr/src/debug/kea/3.0.3/src/lib/util/encode, directory renamed /usr/src/d
 ebug/kea/3.0.2/src/hooks/dhcp/ping_check -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/ping_check, directory renamed /usr/src/debug/kea/3.0.2/src/lib/stats -> /usr/src/debug/kea/3.0.3/src/lib/stats, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcpsrv -> /usr/src/debug/kea/3.0.3/src/lib/dhcpsrv, directory renamed /usr/src/debug/kea/3.0.2/src/lib/eval -> /usr/src/debug/kea/3.0.3/src/lib/eval, directory renamed /usr/src/debug/kea/3.0.2/src/bin/dhcp6 -> /usr/src/debug/kea/3.0.3/src/bin/dhcp6, directory renamed /usr/src/debug/kea/3.0.2/src/bin/dhcp4 -> /usr/src/debug/kea/3.0.3/src/bin/dhcp4, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/forensic_log -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/forensic_log, directory renamed /usr/src/debug/kea/3.0.2/src/lib/log/interprocess -> /usr/src/debug/kea/3.0.3/src/lib/log/interprocess, directory renamed /usr/src/debug/kea/3.0.2/src/bin/d2 -> /usr/src/debug/kea/3.0.3/src/bin/d2, directory renamed /usr/src/debug/kea/3.0.2/src/lib/cc -
 > /usr/src/debug/kea/3.0.3/src/lib/cc, directory renamed /usr/src/debug/kea/3.0.2/src/lib/exceptions -> /usr/src/debug/kea/3.0.3/src/lib/exceptions, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/perfmon -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/perfmon, directory renamed /usr/src/debug/kea/3.0.2/src/lib/http -> /usr/src/debug/kea/3.0.3/src/lib/http, directory renamed /usr/src/debug/kea/3.0.2/src/lib/process/cfgrpt -> /usr/src/debug/kea/3.0.3/src/lib/process/cfgrpt, directory renamed /usr/src/debug/kea/3.0.2/src/lib/config_backend -> /usr/src/debug/kea/3.0.3/src/lib/config_backend
packages/x86-64-v3-poky-linux/kea/kea-src: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-staticdev: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-staticdev: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea: PKGSIZE changed from 26609599 to 26630079 (+0%)
packages/x86-64-v3-poky-linux/kea/kea: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.120 /usr/lib/libkea-cc.so.82 /usr/lib/libkea-hooks.so.120.0.0 /usr/lib/libkea-util.so.101 /usr/lib/libkea-cc.so.82.0.0 /usr/lib/libkea-process.so.90.0.0 /usr/lib/libkea-config.so.83.0.0 /usr/lib/libkea-util.so.101.0.0 /usr/lib/libkea-config.so.83 /usr/lib/libkea-process.so.90", added "/usr/lib/libkea-hooks.so.121 /usr/lib/libkea-hooks.so.121.0.0 /usr/lib/libkea-cc.so.83 /usr/lib/libkea-util.so.102 /usr/lib/libkea-cc.so.83.0.0 /usr/lib/libkea-process.so.91.0.0 /usr/lib/libkea-config.so.84.0.0 /usr/lib/libkea-util.so.102.0.0 /usr/lib/libkea-config.so.84 /usr/lib/libkea-process.so.91"
packages/x86-64-v3-poky-linux/kea/kea: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/3.0.2/kea-3.0.2.tar.xz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://kea.volatiles file://fix-multilib-conflict.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch file://0001-build-boost-1.89.0-fixes.patch file://0001-meson-use-a-runtime-safe-interpreter-string.patch file://0001-mk_cfgrpt.sh-strip-prefixes.patch file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch" to "http://ftp.isc.org/isc/kea/3.0.3/kea-3.0.3.tar.xz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://kea.volatiles file://fix-multilib-conflict.patch file://0001-src-lib-log-logger_unittest_support.cc
 -do-not-write-.patch file://0001-build-boost-1.89.0-fixes.patch file://0001-meson-use-a-runtime-safe-interpreter-string.patch file://0001-mk_cfgrpt.sh-strip-prefixes.patch file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch"
Changes to packages/x86-64-v3-poky-linux/kea (sysroot):
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.82 to libkea-cc.so.83
  /usr/lib/libkea-config.so changed symlink target from libkea-config.so.83 to libkea-config.so.84
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.120 to libkea-hooks.so.121
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.90 to libkea-process.so.91
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.101 to libkea-util.so.102
  /usr/lib/libkea-cc.so.82.0.0 moved to /usr/lib/libkea-cc.so.83.0.0
  /usr/lib/libkea-cc.so.82 moved to /usr/lib/libkea-cc.so.83
  /usr/lib/libkea-config.so.83.0.0 moved to /usr/lib/libkea-config.so.84.0.0
  /usr/lib/libkea-config.so.83 moved to /usr/lib/libkea-config.so.84
  /usr/lib/libkea-hooks.so.120.0.0 moved to /usr/lib/libkea-hooks.so.121.0.0
  /usr/lib/libkea-hooks.so.120 moved to /usr/lib/libkea-hooks.so.121
  /usr/lib/libkea-process.so.90.0.0 moved to /usr/lib/libkea-process.so.91.0.0
  /usr/lib/libkea-process.so.90 moved to /usr/lib/libkea-process.so.91
  /usr/lib/libkea-util.so.101.0.0 moved to /usr/lib/libkea-util.so.102.0.0
  /usr/lib/libkea-util.so.101 moved to /usr/lib/libkea-util.so.102

--===============0802619715264443057==--

