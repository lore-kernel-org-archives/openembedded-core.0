Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AF9F4210D
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19737.1776261873959099597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E6D/cspv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=orleSdRH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91753e2b-69f7fe97-bec4-44eb-9a86-1d46288be893-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qgx4qrfIDIuMD6fMamfhLDFVoRXQ77mLm6VbqPKbpLI=;
	b=E6D/cspvfmSLDy1116Ay+MTSHmy2Pp5VvYu1+4hQiZaFeeszVfmLwQnHvoGTXCWS
	Y1py8laG/wVmG6lQwJzF4XfEa1tF1lmEUoXR64I8q1FrlSNALzAPaK7Q14K3ZB+HGDq
	YsHT25QwImMZfElrLHMKVjT4WM1jZMEYYJOC41vY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qgx4qrfIDIuMD6fMamfhLDFVoRXQ77mLm6VbqPKbpLI=;
	b=orleSdRH0BbQe9A8kdumuF3HB0rrf1+xyzyGaQahJX5fBvfWfS00p1UV86FDW1tJ
	6oOx+RzXL+4MiTo6bb4A7CfkLWhQk7N3a4hNxpRRKbahTXosqbQT7yCVhpTHoyKoP2b
	AWrDAmcSgirpJtFMyzExyYzINBlqC4B/9LVovLHI=
Content-Type: multipart/mixed; boundary="===============5166929260456480099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kea: upgrading to 3.0.3 SUCCEEDED
Message-ID: <0101019d91753e2b-69f7fe97-bec4-44eb-9a86-1d46288be893-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235218

--===============5166929260456480099==
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
From 02ee21ab2041bfa866c114c364acefb315bf04a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:24:41 +0000
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
index 46a1e38eae..e551288e25 100644
--- a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
@@ -1,4 +1,4 @@
-From c7d1036c6476ddca79a6beb03604a2364d7c469e Mon Sep 17 00:00:00 2001
+From 810810cb3826304a997eb364aced7cc4f59edccd Mon Sep 17 00:00:00 2001
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
index 7c24a3a27c..d0eb5c208f 100644
--- a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
+++ b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
@@ -1,4 +1,4 @@
-From 4a507d1822cbfb561657ed9a8ccb0dfeced30cac Mon Sep 17 00:00:00 2001
+From 4ea21099f62e2dd7a54ca11d442f6d05b867e1fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Sep 2025 12:52:51 -0700
 Subject: [PATCH] d2/dhcp[46]/radius/dhcpsrv: Avoid Boost lexical_cast on enums
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
index 3740c4abc7..1d46453527 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -1,4 +1,4 @@
-From f7024a5e7153538072a57858e1b48bbb806167e7 Mon Sep 17 00:00:00 2001
+From cc91c754bcf738aab062e722614ffa93a91a7fee Mon Sep 17 00:00:00 2001
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
index 076de53c0a..8044d9c2de 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -1,4 +1,4 @@
-From 920e4895c679a5bfda29e66fa199ad8e889659d0 Mon Sep 17 00:00:00 2001
+From 68b254e4a7f06b5711898a539713801c931b0dc6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
index 269615dbef..90cf9dff47 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
@@ -1,4 +1,4 @@
-From 1ad52a9bbec644e653cc67a596b811b70787c2dd Mon Sep 17 00:00:00 2001
+From de78201c080d4b3a28293b63f3a9d0017ec9f58f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 17 Dec 2025 12:36:24 +0100
 Subject: [PATCH] src/lib/log/logger_level_impl.cc: add a missing include to
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 7d051705e8..9b6bcc62c1 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 1a0a7b9633ebc4c171b8ee6db6fcf48e8e27a4b8 Mon Sep 17 00:00:00 2001
+From c8fe43b2c5f2407f1e93fe956e9adb4bf1c9361d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 34ae256823..bd865bf462 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 00e2905dc622f98f608d253b1148a3d778131cad Mon Sep 17 00:00:00 2001
+From e949c8f8e06902f064a68945e9808fa06e8b3144 Mon Sep 17 00:00:00 2001
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


--===============5166929260456480099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.120 /usr/lib/libkea-process.so.90.0.0 /usr/lib/libkea-process.so.90 /usr/lib/libkea-hooks.so.120.0.0 /usr/lib/libkea-cc.so.82 /usr/lib/libkea-util.so.101 /usr/lib/libkea-cc.so.82.0.0 /usr/lib/libkea-config.so.83 /usr/lib/libkea-util.so.101.0.0 /usr/lib/libkea-config.so.83.0.0", added "/usr/lib/libkea-hooks.so.121 /usr/lib/libkea-process.so.91.0.0 /usr/lib/libkea-process.so.91 /usr/lib/libkea-cc.so.83 /usr/lib/libkea-hooks.so.121.0.0 /usr/lib/libkea-util.so.102 /usr/lib/libkea-cc.so.83.0.0 /usr/lib/libkea-config.so.84 /usr/lib/libkea-util.so.102.0.0 /usr/lib/libkea-config.so.84.0.0"
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

--===============5166929260456480099==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-3.0.2-3.0.3.patch"

RnJvbSAwMmVlMjFhYjIwNDFiZmE4NjZjMTE0YzM2NGFjZWZiMzE1YmYwNGEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6MjQ6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
ZWE6IHVwZ3JhZGUgMy4wLjIgLT4gMy4wLjMKCi0tLQogLi4uL2ZpbGVzLzAwMDEtYnVpbGQtYm9v
c3QtMS44OS4wLWZpeGVzLnBhdGNoIHwgIDQgKystLQogLi4ucy1kaGNwc3J2LUF2b2lkLUJvb3N0
LWxleGljYWxfY2FzdC1vLnBhdGNoIHwgIDIgKy0KIC4uLnNlLWEtcnVudGltZS1zYWZlLWludGVy
cHJldGVyLXN0cmluZy5wYXRjaCB8ICA0ICsrLS0KIC4uLi8wMDAxLW1rX2NmZ3JwdC5zaC1zdHJp
cC1wcmVmaXhlcy5wYXRjaCAgICB8ICAyICstCiAuLi5lcl9sZXZlbF9pbXBsLmNjLWFkZC1hLW1p
c3NpbmctaW5jbHUucGF0Y2ggfCAgMiArLQogLi4uZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1u
b3Qtd3JpdGUtLnBhdGNoIHwgIDIgKy0KIC4uLi9rZWEvZmlsZXMvZml4LW11bHRpbGliLWNvbmZs
aWN0LnBhdGNoICAgICB8ICAyICstCiAuLi4va2VhL3trZWFfMy4wLjIuYmIgPT4ga2VhXzMuMC4z
LmJifSAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiA4IGZpbGVzIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkva2VhL3trZWFfMy4wLjIuYmIgPT4ga2VhXzMuMC4zLmJifSAoODMlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtYnVpbGQtYm9v
c3QtMS44OS4wLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmls
ZXMvMDAwMS1idWlsZC1ib29zdC0xLjg5LjAtZml4ZXMucGF0Y2gKaW5kZXggNDZhMWUzOGVhZS4u
ZTU1MTI4OGUyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmls
ZXMvMDAwMS1idWlsZC1ib29zdC0xLjg5LjAtZml4ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1idWlsZC1ib29zdC0xLjg5LjAtZml4ZXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM3ZDEwMzZjNjQ3NmRkY2E3OWE2YmViMDM2MDRhMjM2
NGQ3YzQ2OWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgxMDgxMGNiMzgyNjMwNGE5
OTdlYjM2NGFjZWQ3Y2M0ZjU5ZWRjY2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAyNyBBdWcgMjAyNSAyMjoy
MDowOSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBidWlsZDogYm9vc3QgMS44OS4wIGZpeGVzCkBA
IC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCA4ZWQ1YjJkLi5k
NTcyM2JhIDEwMDY0NAoraW5kZXggYjBjZWNlZS4uNzUwOGE0YSAxMDA2NDQKIC0tLSBhL21lc29u
LmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTE4OSw3ICsxODksNyBAQCBtZXNzYWdlKGYn
RGV0ZWN0ZWQgc3lzdGVtICJAU1lTVEVNQCIuJykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtZDItZGhjcC00Ni1yYWRpdXMtZGhjcHNydi1Bdm9p
ZC1Cb29zdC1sZXhpY2FsX2Nhc3Qtby5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
a2VhL2ZpbGVzLzAwMDEtZDItZGhjcC00Ni1yYWRpdXMtZGhjcHNydi1Bdm9pZC1Cb29zdC1sZXhp
Y2FsX2Nhc3Qtby5wYXRjaAppbmRleCA3YzI0YTNhMjdjLi5kMGViNWMyMDhmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLWQyLWRoY3AtNDYtcmFk
aXVzLWRoY3BzcnYtQXZvaWQtQm9vc3QtbGV4aWNhbF9jYXN0LW8ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1kMi1kaGNwLTQ2LXJhZGl1cy1kaGNw
c3J2LUF2b2lkLUJvb3N0LWxleGljYWxfY2FzdC1vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA0YTUwN2QxODIyY2JmYjU2MTY1N2VkOWE4Y2NiMGRmZWNlZDMwY2FjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0ZWEyMTA5OWY2MmUyZGQ3YTU0Y2ExMWQ0NDJmNmQwNWI4NjdlMWZl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFdlZCwgMyBTZXAgMjAyNSAxMjo1Mjo1MSAtMDcwMAogU3ViamVjdDogW1BB
VENIXSBkMi9kaGNwWzQ2XS9yYWRpdXMvZGhjcHNydjogQXZvaWQgQm9vc3QgbGV4aWNhbF9jYXN0
IG9uIGVudW1zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxl
cy8wMDAxLW1lc29uLXVzZS1hLXJ1bnRpbWUtc2FmZS1pbnRlcnByZXRlci1zdHJpbmcucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8wMDAxLW1lc29uLXVzZS1hLXJ1
bnRpbWUtc2FmZS1pbnRlcnByZXRlci1zdHJpbmcucGF0Y2gKaW5kZXggMzc0MGM0YWJjNy4uMWQ0
NjQ1MzUyNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMv
MDAwMS1tZXNvbi11c2UtYS1ydW50aW1lLXNhZmUtaW50ZXJwcmV0ZXItc3RyaW5nLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtbWVzb24tdXNlLWEt
cnVudGltZS1zYWZlLWludGVycHJldGVyLXN0cmluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZjcwMjRhNWU3MTUzNTM4MDcyYTU3ODU4ZTFiNDhiYmI4MDYxNjdlNyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gY2M5MWM3NTRiY2Y3MzhhYWIwNjJlNzIyNjE0ZmZhOTNhOTFhN2Zl
ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBUaHUsIDI4IEF1ZyAyMDI1IDE3OjAyOjQ5IC0wNzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIG1lc29uOiB1c2UgYSBydW50aW1lLXNhZmUgaW50ZXJwcmV0ZXIgc3RyaW5nCkBAIC00
NCw3ICs0NCw3IEBAIGluZGV4IDc0YmE3MDUuLjcxZjFjN2IgMTAwNjQ0CiAgaWYgUERGTEFURVgu
Zm91bmQoKQogICAgICBkb2NfY29uZi5zZXQoJ0hBVkVfUERGTEFURVgnLCAneWVzJykKIGRpZmYg
LS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBkNTcyM2JhLi4zYmI1MTg1
IDEwMDY0NAoraW5kZXggNzUwOGE0YS4uNzY5ZTE1NyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxk
CiArKysgYi9tZXNvbi5idWlsZAogQEAgLTYzOCw5ICs2MzgsMTMgQEAgbGlua19hcmdzID0gW10K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtbWtf
Y2ZncnB0LnNoLXN0cmlwLXByZWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9rZWEvZmlsZXMvMDAwMS1ta19jZmdycHQuc2gtc3RyaXAtcHJlZml4ZXMucGF0Y2gKaW5kZXgg
MDc2ZGU1M2MwYS4uODA0NGQ5YzJkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9rZWEvZmlsZXMvMDAwMS1ta19jZmdycHQuc2gtc3RyaXAtcHJlZml4ZXMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1ta19jZmdycHQuc2gt
c3RyaXAtcHJlZml4ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkyMGU0ODk1YzY3OWE1
YmZkYTI5ZTY2ZmExOTlhZDhlODg5NjU5ZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDY4YjI1NGU0YTdmMDZiNTcxMTg5OGE1Mzk3MTM4MDFjOTMxYjBkYzYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1
LCAyOCBBdWcgMjAyNSAxNzozMTozOSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBta19jZmdycHQu
c2g6IHN0cmlwIHByZWZpeGVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2tlYS9maWxlcy8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl9sZXZlbF9pbXBsLmNjLWFkZC1hLW1p
c3NpbmctaW5jbHUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy8w
MDAxLXNyYy1saWItbG9nLWxvZ2dlcl9sZXZlbF9pbXBsLmNjLWFkZC1hLW1pc3NpbmctaW5jbHUu
cGF0Y2gKaW5kZXggMjY5NjE1ZGJlZi4uOTBjZjlkZmY0NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfbGV2ZWxf
aW1wbC5jYy1hZGQtYS1taXNzaW5nLWluY2x1LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtc3JjLWxpYi1sb2ctbG9nZ2VyX2xldmVsX2ltcGwuY2Mt
YWRkLWEtbWlzc2luZy1pbmNsdS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWFkNTJhOWJi
ZWM2NDRlNjUzY2M2N2E1OTZiODExYjcwNzg3YzJkZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGU3ODIwMWMwODBkNGIzYTI4MjkzYjYzZjNhOWQwMDE3ZWM5ZjU4ZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXgu
ZGU+CiBEYXRlOiBXZWQsIDE3IERlYyAyMDI1IDEyOjM2OjI0ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHNyYy9saWIvbG9nL2xvZ2dlcl9sZXZlbF9pbXBsLmNjOiBhZGQgYSBtaXNzaW5nIGluY2x1
ZGUgdG8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAw
MDEtc3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtc3JjLWxpYi1s
b2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5wYXRjaAppbmRleCA3
ZDA1MTcwNWU4Li45YjZiY2M2MmMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2tlYS9maWxlcy8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNj
LWRvLW5vdC13cml0ZS0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEv
ZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1ub3Qt
d3JpdGUtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxYTBhN2I5NjMzZWJjNGMxNzFiOGVl
NmRiNmZjZjQ4ZThlMjdhNGI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOGZlNDNi
MmM1ZjI0MDdmMWU5M2ZlOTU2ZTlhZGI0YmYxYzkzNjFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBUdWUsIDEwIE5vdiAyMDIwIDE1OjU3OjAzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9s
aWIvbG9nL2xvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjOiBkbyBub3Qgd3JpdGUgYnVpbGQKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeC1tdWx0aWxp
Yi1jb25mbGljdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2Zp
eC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaAppbmRleCAzNGFlMjU2ODIzLi5iZDg2NWJmNDYyIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXgtbXVsdGls
aWItY29uZmxpY3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmls
ZXMvZml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMGUy
OTA1ZGM2MjJmOThmNjA4ZDI1M2IxMTQ4YTNkNzc4MTMxY2FkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlOTQ5YzhmOGUwNjkwMmYwNjRhNjg5NDVlOTgwOGZhMDZlOGIzMTQ0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUdWUsIDE0IE9jdCAyMDI1IDAxOjM3OjM1ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIFRoZXJlIGFyZSBjb25mbGljdCBvZiBjb25maWcgZmlsZXMgYmV0d2VlbiBrZWEgYW5kIGxp
YjMyLWtlYToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8z
LjAuMi5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8zLjAuMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tl
YS9rZWFfMy4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tl
YV8zLjAuMy5iYgppbmRleCBmNDZjYjFiZjgwLi5mOGI5MjkzNjFjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9rZWFfMy4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rZWEva2VhXzMuMC4zLmJiCkBAIC0xLDkgKzEsMjggQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDQgKzEsNCBAQAor
IyAtQ29weXJpZ2h0IChDKSAyMDA5LTIwMjUgSW50ZXJuZXQgU3lzdGVtcyBDb25zb3J0aXVtLCBJ
bmMuICgiSVNDIikKKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDI2IEludGVybmV0IFN5c3RlbXMg
Q29uc29ydGl1bSwgSW5jLiAoIklTQyIpCisjICAKKyMgIFRoaXMgU291cmNlIENvZGUgRm9ybSBp
cyBzdWJqZWN0IHRvIHRoZSB0ZXJtcyBvZiB0aGUgTW96aWxsYSBQdWJsaWMKKyMgIExpY2Vuc2Us
IHYuIDIuMC4gSWYgYSBjb3B5IG9mIHRoZSBNUEwgd2FzIG5vdCBkaXN0cmlidXRlZCB3aXRoIHRo
aXMKKyMgCisjCisKIFNVTU1BUlkgPSAiSVNDIEtlYSBESENQIFNlcnZlciIKIERFU0NSSVBUSU9O
ID0gIktlYSBpcyB0aGUgbmV4dCBnZW5lcmF0aW9uIG9mIERIQ1Agc29mdHdhcmUgZGV2ZWxvcGVk
IGJ5IElTQy4gSXQgc3VwcG9ydHMgYm90aCBESENQdjQgYW5kIERIQ1B2NiBwcm90b2NvbHMgYWxv
bmcgd2l0aCB0aGVpciBleHRlbnNpb25zLCBlLmcuIHByZWZpeCBkZWxlZ2F0aW9uIGFuZCBkeW5h
bWljIHVwZGF0ZXMgdG8gRE5TLiIKIEhPTUVQQUdFID0gImh0dHA6Ly9rZWEuaXNjLm9yZyIKIFNF
Q1RJT04gPSAiY29ubmVjdGl2aXR5IgogTElDRU5TRSA9ICJNUEwtMi4wIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZmI2MzRlZDFkOTIzYjhiOGZkMWVkN2ZmYzliNzBh
ZTQiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hNjRkYzhlZmMzYzQw
ZDA1MDJhZDM3MmY4MTA3MDBlNCIKIAogREVQRU5EUyA9ICJib29zdCBsb2c0Y3BsdXMgb3BlbnNz
bCIKIApAQCAtMjMsNyArNDIsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9mdHAuaXNjLm9yZy9pc2Mv
a2VhLyR7UFZ9LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWQyLWRoY3At
NDYtcmFkaXVzLWRoY3BzcnYtQXZvaWQtQm9vc3QtbGV4aWNhbF9jYXN0LW8ucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfbGV2ZWxfaW1wbC5jYy1hZGQt
YS1taXNzaW5nLWluY2x1LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjI5ZjRlNDRmYTQ4ZjYyZmUxNTE1OGQxNzQxMWUwMDM0OTYyMDMyNTBkYjdiMzQ1OWMyYzc5
YzA5ZjM3OWE1NDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDk3MDJkZGIwNzhiNjM3ZTg1ZGU5
MjM2Y2JlZGQzZmI5ZDdhZjdjNmU3OTcwMjZjNTM4YjQ1NzQ4YWQ0ZDYzMSIKIAogaW5oZXJpdCBt
ZXNvbiBwa2djb25maWcgc3lzdGVtZCB1cGRhdGUtcmMuZCB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2
ZW4KIAotLSAKMi40Ny4xCgo=

--===============5166929260456480099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kea/kea-dbg: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-dbg: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-cc.so.82.0.0 /usr/lib/.debug/libkea-hooks.so.120.0.0 /usr/lib/.debug/libkea-util.so.101.0.0 /usr/lib/.debug/libkea-process.so.90.0.0 /usr/lib/.debug/libkea-config.so.83.0.0", added "/usr/lib/.debug/libkea-hooks.so.121.0.0 /usr/lib/.debug/libkea-cc.so.83.0.0 /usr/lib/.debug/libkea-util.so.102.0.0 /usr/lib/.debug/libkea-process.so.91.0.0 /usr/lib/.debug/libkea-config.so.84.0.0"
packages/x86-64-v3-poky-linux/kea/kea-dbg: PKGSIZE changed from 528021384 to 528210376 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-dev: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-dev: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-dev: PKGSIZE changed from 4093978 to 4101970 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-doc: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-doc: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-doc: PKGSIZE changed from 1424692 to 1425460 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-locale: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-locale: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-python: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-python: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-src: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-src: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea-src: FILELIST: directory renamed /usr/src/debug/kea/3.0.2/src/bin/lfc -> /usr/src/debug/kea/3.0.3/src/bin/lfc, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/forensic_log -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/forensic_log, directory renamed /usr/src/debug/kea/3.0.2/src/lib/log/interprocess -> /usr/src/debug/kea/3.0.3/src/lib/log/interprocess, directory renamed /usr/src/debug/kea/3.0.2/src/lib/http -> /usr/src/debug/kea/3.0.3/src/lib/http, directory renamed /usr/src/debug/kea/3.0.2/src/lib/asiodns -> /usr/src/debug/kea/3.0.3/src/lib/asiodns, directory renamed /usr/src/debug/kea/3.0.2/src/lib/cryptolink -> /usr/src/debug/kea/3.0.3/src/lib/cryptolink, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/bootp -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/bootp, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcpsrv -> /usr/src/debug/kea/3.0.3/src/lib/dhcpsrv, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/class_cmds 
 -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/class_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/cc -> /usr/src/debug/kea/3.0.3/src/lib/cc, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dns -> /usr/src/debug/kea/3.0.3/src/lib/dns, directory renamed /usr/src/debug/kea/3.0.2/src/bin/d2 -> /usr/src/debug/kea/3.0.3/src/bin/d2, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcp -> /usr/src/debug/kea/3.0.3/src/lib/dhcp, directory renamed /usr/src/debug/kea/3.0.2/src/lib/tcp -> /usr/src/debug/kea/3.0.3/src/lib/tcp, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/ping_check -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/ping_check, directory renamed /usr/src/debug/kea/3.0.2/src/lib/process -> /usr/src/debug/kea/3.0.3/src/lib/process, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/host_cache -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/host_cache, directory renamed /usr/src/debug/kea/3.0.2/src/lib/process/cfgrpt -> /usr/src/debug/kea/3.0.3/src/lib/process/cf
 grpt, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcp_ddns -> /usr/src/debug/kea/3.0.3/src/lib/dhcp_ddns, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/flex_option -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/flex_option, directory renamed /usr/src/debug/kea/3.0.2/src/lib/d2srv -> /usr/src/debug/kea/3.0.3/src/lib/d2srv, directory renamed /usr/src/debug/kea/3.0.2/src/lib/eval -> /usr/src/debug/kea/3.0.3/src/lib/eval, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/radius -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/radius, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/run_script -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/run_script, directory renamed /usr/src/debug/kea/3.0.2/src/lib/util -> /usr/src/debug/kea/3.0.3/src/lib/util, directory renamed /usr/src/debug/kea/3.0.2/src/lib/util/encode -> /usr/src/debug/kea/3.0.3/src/lib/util/encode, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/host_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhc
 p/host_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/limits -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/limits, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/stat_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/stat_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/config_backend -> /usr/src/debug/kea/3.0.3/src/lib/config_backend, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/lease_query -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/lease_query, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/flex_id -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/flex_id, directory renamed /usr/src/debug/kea/3.0.2/src/bin/dhcp6 -> /usr/src/debug/kea/3.0.3/src/bin/dhcp6, directory renamed /usr/src/debug/kea/3.0.2/src/lib/config -> /usr/src/debug/kea/3.0.3/src/lib/config, directory renamed /usr/src/debug/kea/3.0.2/src/bin/dhcp4 -> /usr/src/debug/kea/3.0.3/src/bin/dhcp4, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/subnet_cmds -> /usr/src/
 debug/kea/3.0.3/src/hooks/dhcp/subnet_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/hooks -> /usr/src/debug/kea/3.0.3/src/lib/hooks, directory renamed /usr/src/debug/kea/3.0.2/src/lib/stats -> /usr/src/debug/kea/3.0.3/src/lib/stats, directory renamed /usr/src/debug/kea/3.0.2/src/lib/log -> /usr/src/debug/kea/3.0.3/src/lib/log, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/high_availability -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/high_availability, directory renamed /usr/src/debug/kea/3.0.2/src/lib/dhcpsrv/parsers -> /usr/src/debug/kea/3.0.3/src/lib/dhcpsrv/parsers, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/ddns_tuning -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/ddns_tuning, directory renamed /usr/src/debug/kea/3.0.2/src/lib/database -> /usr/src/debug/kea/3.0.3/src/lib/database, directory renamed /usr/src/debug/kea/3.0.2/src/lib/asiolink -> /usr/src/debug/kea/3.0.3/src/lib/asiolink, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/per
 fmon -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/perfmon, directory renamed /usr/src/debug/kea/3.0.2/src/bin/agent -> /usr/src/debug/kea/3.0.3/src/bin/agent, directory renamed /usr/src/debug/kea/3.0.2/src/bin/perfdhcp -> /usr/src/debug/kea/3.0.3/src/bin/perfdhcp, directory renamed /usr/src/debug/kea/3.0.2/src/hooks/dhcp/lease_cmds -> /usr/src/debug/kea/3.0.3/src/hooks/dhcp/lease_cmds, directory renamed /usr/src/debug/kea/3.0.2/src/lib/util/io -> /usr/src/debug/kea/3.0.3/src/lib/util/io, directory renamed /usr/src/debug/kea/3.0.2/src/lib/exceptions -> /usr/src/debug/kea/3.0.3/src/lib/exceptions
packages/x86-64-v3-poky-linux/kea/kea-src: PKGSIZE changed from 12018614 to 12034065 (+0%)
packages/x86-64-v3-poky-linux/kea/kea-staticdev: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea-staticdev: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea/kea: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-util.so.101.0.0 /usr/lib/libkea-config.so.83 /usr/lib/libkea-cc.so.82.0.0 /usr/lib/libkea-config.so.83.0.0 /usr/lib/libkea-cc.so.82 /usr/lib/libkea-hooks.so.120.0.0 /usr/lib/libkea-process.so.90 /usr/lib/libkea-util.so.101 /usr/lib/libkea-process.so.90.0.0 /usr/lib/libkea-hooks.so.120", added "/usr/lib/libkea-util.so.102.0.0 /usr/lib/libkea-config.so.84 /usr/lib/libkea-cc.so.83.0.0 /usr/lib/libkea-config.so.84.0.0 /usr/lib/libkea-hooks.so.121.0.0 /usr/lib/libkea-cc.so.83 /usr/lib/libkea-util.so.102 /usr/lib/libkea-process.so.91 /usr/lib/libkea-process.so.91.0.0 /usr/lib/libkea-hooks.so.121"
packages/x86-64-v3-poky-linux/kea/kea: PKGSIZE changed from 26609599 to 26630079 (+0%)
packages/x86-64-v3-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/3.0.2/kea-3.0.2.tar.xz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://kea.volatiles file://fix-multilib-conflict.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch file://0001-build-boost-1.89.0-fixes.patch file://0001-meson-use-a-runtime-safe-interpreter-string.patch file://0001-mk_cfgrpt.sh-strip-prefixes.patch file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch" to "http://ftp.isc.org/isc/kea/3.0.3/kea-3.0.3.tar.xz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://kea.volatiles file://fix-multilib-conflict.patch file://0001-src-lib-log-logger_unittest_support.cc
 -do-not-write-.patch file://0001-build-boost-1.89.0-fixes.patch file://0001-meson-use-a-runtime-safe-interpreter-string.patch file://0001-mk_cfgrpt.sh-strip-prefixes.patch file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch"
packages/x86-64-v3-poky-linux/kea: PV changed from "3.0.2" to "3.0.3"
packages/x86-64-v3-poky-linux/kea: PKGV changed from 3.0.2 [default] to 3.0.3 [default]
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

--===============5166929260456480099==--

