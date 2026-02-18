Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B921E9A053
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1434.1771440115108149018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D0i6wwZN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WdZzHjqy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720f09da-8ad9c535-9164-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2iwvomDg5B26Vt5CWlb8Y7zIpfcv3DEuoiGrepkzjvc=;
	b=D0i6wwZNMLUMKh6QnPqvaqmzveX0rkZ1vpEVx7bWJy+gjdewwxEm+l4+Pr5qppxn
	OVOlTrZrRO6OFtB6LNjMqdTegruwdYr0uWTEQymGPrCEFp/N5rd4ZoCbHuXI4EynfdV
	oJavLVGxEpk9vsJmamMjiaFCM23NLzSofTIQ+s5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2iwvomDg5B26Vt5CWlb8Y7zIpfcv3DEuoiGrepkzjvc=;
	b=WdZzHjqymNUTFCCJPRFig6G7faUvuqFQSxJsF7cNXJvldbVjjYFMpEaVZqQ+2A4T
	/ilQxZilOUsWBRj10Un9MMgjnOp2YgWDyENEHHz/G8SPSB4sH1y1ltq2NU7fc8JtdZf
	nQdZyLzXkdxTMOSpvL9bgnRYW7KCzYbAPb2z6HKs=
Content-Type: multipart/mixed; boundary="===============0724506258490484587=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.59 SUCCEEDED
Message-ID: <0101019c720f09da-8ad9c535-9164-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231405

--===============0724506258490484587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgpg-error* to *1.59* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgpg-error-upgrade-1.58-1.59.patch
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
From 778ac3ff7484af74ad1b074c5bb894e18a211fdf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:25:42 +0000
Subject: [PATCH] libgpg-error: upgrade 1.58 -> 1.59

---
 ...not-fail-when-testing-config-scripts.patch |  6 ++---
 .../libgpg-error/libgpg-error/pkgconfig.patch |  5 +---
 ...gpg-error_1.58.bb => libgpg-error_1.59.bb} | 23 +++++++++++++++++--
 3 files changed, 25 insertions(+), 9 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.58.bb => libgpg-error_1.59.bb} (71%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 39798c009f..96c279532c 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From b1b6c28b4753c027052aeb6275a73eed06f0bf49 Mon Sep 17 00:00:00 2001
+From 9d57d6d7cdd5ea1bda8222c2db0ab84a520b8402 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e56bb23..8c3ba7b 100644
+index 82b4193..23b082b 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -326,6 +326,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
+@@ -331,6 +331,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 38c55ad342..ef0b76dbd0 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From fdc0b6f84bae7cd6eea18712049da62cdfd5e630 Mon Sep 17 00:00:00 2001
+From ca70d16383c51f19480cd2d24b18a2eb6aea2f67 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
@@ -241,6 +241,3 @@ index 263f21b..e54ab38 100644
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
 +
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
similarity index 71%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
index d42a9028e8..a538e0f1b6 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/gpg-error.h.in
+# +++ src/gpg-error.h.in
+# @@ -1,4 +1,4 @@
+# - * Copyright (C) 2001-2024 g10 Code GmbH
+# + * Copyright (C) 2001-2026 g10 Code GmbH
+#   *
+#   * This file is part of libgpg-error (aka libgpgrt).
+#   *
+# 
+#
+
 SUMMARY = "Small library that defines common error values for all GnuPG components"
 DESCRIPTION = "Contains common error codes and error handling functions used by GnuPG, Libgcrypt, GPGME and more packages. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
@@ -6,7 +25,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=badc79a9308e1cbd2657b2441c7cf017 \
+                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=f146974b5d59380f15c9f0eaaac4cbec \
                     file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7 \
                     "
 
@@ -19,7 +38,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27"
+SRC_URI[sha256sum] = "a19bc5087fd97026d93cb4b45d51638d1a25202a5e1fbc3905799f424cfa6134"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.47.1


--===============0724506258490484587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGSIZE changed from 40694 to 45183 (+11%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.41.1", added "/usr/lib/libgpg-error.so.0.41.2"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so.0.41.1 moved to /usr/lib/libgpg-error.so.0.41.2
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so.0.41.1 moved to /usr/lib/libgpg-error.so.0.41.2

--===============0724506258490484587==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgpg-error-upgrade-1.58-1.59.patch"

RnJvbSA3NzhhYzNmZjc0ODRhZjc0YWQxYjA3NGM1YmI4OTRlMThhMjExZmRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6MjU6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJncGctZXJyb3I6IHVwZ3JhZGUgMS41OCAtPiAxLjU5CgotLS0KIC4uLm5vdC1mYWlsLXdoZW4t
dGVzdGluZy1jb25maWctc2NyaXB0cy5wYXRjaCB8ICA2ICsrLS0tCiAuLi4vbGliZ3BnLWVycm9y
L2xpYmdwZy1lcnJvci9wa2djb25maWcucGF0Y2ggfCAgNSArLS0tCiAuLi5ncGctZXJyb3JfMS41
OC5iYiA9PiBsaWJncGctZXJyb3JfMS41OS5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0tCiAz
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL3tsaWJncGctZXJyb3JfMS41OC5iYiA9
PiBsaWJncGctZXJyb3JfMS41OS5iYn0gKDcxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLzAwMDEtRG8tbm90LWZhaWwtd2hlbi10
ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3Bn
LWVycm9yL2xpYmdwZy1lcnJvci8wMDAxLURvLW5vdC1mYWlsLXdoZW4tdGVzdGluZy1jb25maWct
c2NyaXB0cy5wYXRjaAppbmRleCAzOTc5OGMwMDlmLi45NmMyNzk1MzJjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLzAwMDEtRG8tbm90
LWZhaWwtd2hlbi10ZXN0aW5nLWNvbmZpZy1zY3JpcHRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvMDAwMS1Eby1ub3QtZmFpbC13aGVu
LXRlc3RpbmctY29uZmlnLXNjcmlwdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGIxYjZj
MjhiNDc1M2MwMjcwNTJhZWI2Mjc1YTczZWVkMDZmMGJmNDkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDlkNTdkNmQ3Y2RkNWVhMWJkYTgyMjJjMmRiMGFiODRhNTIwYjg0MDIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjggRmViIDIwMjAgMDk6MTk6NTYgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRG8gbm90IGZhaWwgd2hlbiB0ZXN0aW5nIGNvbmZpZyBzY3JpcHRzCkBAIC0x
NCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggZTU2YmIyMy4u
OGMzYmE3YiAxMDA2NDQKK2luZGV4IDgyYjQxOTMuLjIzYjA4MmIgMTAwNjQ0CiAtLS0gYS9zcmMv
TWFrZWZpbGUuYW0KICsrKyBiL3NyYy9NYWtlZmlsZS5hbQotQEAgLTMyNiw2ICszMjYsNSBAQCBn
cGctZXJyb3ItY29uZmlnOiBncGdydC1jb25maWcgZ3BnLWVycm9yLWNvbmZpZy1vbGQgZ3BnLWVy
cm9yLWNvbmZpZy10ZXN0LnNoCitAQCAtMzMxLDYgKzMzMSw1IEBAIGdwZy1lcnJvci1jb25maWc6
IGdwZ3J0LWNvbmZpZyBncGctZXJyb3ItY29uZmlnLW9sZCBncGctZXJyb3ItY29uZmlnLXRlc3Qu
c2gKICAJZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAJICBlY2hvICJubyI7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKICAJICBlY2hvICIqKiogIFBsZWFzZSByZXBvcnQgdG8gPGh0dHBzOi8vYnVncy5n
bnVwZy5vcmc+IHdpdGggZ3BnLWVycm9yLWNvbmZpZy10ZXN0LmxvZyI7IFwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3IvcGtnY29uZmln
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9w
a2djb25maWcucGF0Y2gKaW5kZXggMzhjNTVhZDM0Mi4uZWYwYjc2ZGJkMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci9wa2djb25maWcu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJv
ci9wa2djb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZkYzBiNmY4NGJhZTdjZDZl
ZWExODcxMjA0OWRhNjJjZGZkNWU2MzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNh
NzBkMTYzODNjNTFmMTk0ODBjZDJkMjRiMThhMmViNmFlYTJmNjcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBXZWQsIDIxIEF1ZyAyMDI0IDIwOjAzOjI5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN1cHBv
cnQgcGtnY29uZmlnCkBAIC0yNDEsNiArMjQxLDMgQEAgaW5kZXggMjYzZjIxYi4uZTU0YWIzOCAx
MDA2NDQKIC0gIEFDX1NVQlNUKEdQR19FUlJPUl9NVF9MSUJTKQogIF0pCiArCi0tLSAKLTIuMzQu
MQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3Bn
LWVycm9yXzEuNTguYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3Bn
LWVycm9yXzEuNTkuYmIKc2ltaWxhcml0eSBpbmRleCA3MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjU4LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yXzEuNTkuYmIKaW5k
ZXggZDQyYTkwMjhlOC4uYTUzOGUwZjFiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvcl8xLjU4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmdwZy1lcnJvci9saWJncGctZXJyb3JfMS41OS5iYgpAQCAtMSwzICsxLDIyIEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gc3JjL2dwZy1lcnJvci5oLmluCisjICsrKyBzcmMvZ3Bn
LWVycm9yLmguaW4KKyMgQEAgLTEsNCArMSw0IEBACisjIC0gKiBDb3B5cmlnaHQgKEMpIDIwMDEt
MjAyNCBnMTAgQ29kZSBHbWJICisjICsgKiBDb3B5cmlnaHQgKEMpIDIwMDEtMjAyNiBnMTAgQ29k
ZSBHbWJICisjICAgKgorIyAgICogVGhpcyBmaWxlIGlzIHBhcnQgb2YgbGliZ3BnLWVycm9yIChh
a2EgbGliZ3BncnQpLgorIyAgICoKKyMgCisjCisKIFNVTU1BUlkgPSAiU21hbGwgbGlicmFyeSB0
aGF0IGRlZmluZXMgY29tbW9uIGVycm9yIHZhbHVlcyBmb3IgYWxsIEdudVBHIGNvbXBvbmVudHMi
CiBERVNDUklQVElPTiA9ICJDb250YWlucyBjb21tb24gZXJyb3IgY29kZXMgYW5kIGVycm9yIGhh
bmRsaW5nIGZ1bmN0aW9ucyB1c2VkIGJ5IEdudVBHLCBMaWJnY3J5cHQsIEdQR01FIGFuZCBtb3Jl
IHBhY2thZ2VzLiAiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmdudXBnLm9yZy9yZWxhdGVkX3Nv
ZnR3YXJlL2xpYmdwZy1lcnJvci8iCkBAIC02LDcgKzI1LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRw
czovL2J1Z3MuZzEwY29kZS5jb20vZ251cGcvaW5kZXgiCiBMSUNFTlNFID0gIkdQTC0yLjAtb3It
bGF0ZXIgJiBMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTU5NTMwYmRmMzM2NTliMjllNzNkNGFkYjlmOWY2NTUyIFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL0NPUFlJTkcuTElCO21kNT0yZDUwMjVkNGFhMzQ5NWJlZmVmOGYxNzIw
NmE1YjBhMSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvZ3BnLWVycm9yLmguaW47
YmVnaW5saW5lPTI7ZW5kbGluZT0xODttZDU9YmFkYzc5YTkzMDhlMWNiZDI2NTdiMjQ0MWM3Y2Yw
MTcgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL2dwZy1lcnJvci5oLmluO2JlZ2lu
bGluZT0yO2VuZGxpbmU9MTg7bWQ1PWYxNDY5NzRiNWQ1OTM4MGYxNWM5ZjBlYWFhYzRjYmVjIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9pbml0LmM7YmVnaW5saW5lPTI7ZW5kbGlu
ZT0xNzttZDU9ZjAxY2RmY2Y3NDdhZjUzODA1OTBjZmQ5YmJmZWFhZjcgXAogICAgICAgICAgICAg
ICAgICAgICAiCiAKQEAgLTE5LDcgKzM4LDcgQEAgU1JDX1VSSSA9ICIke0dOVVBHX01JUlJPUn0v
bGliZ3BnLWVycm9yL2xpYmdwZy1lcnJvci0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmls
ZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY5
NDNhZWE5YTgzMGE4YmQ5MzhlNTEyNGI1NzllZmFlY2UyNGEzMjI1ZmY0YzNkMjc2MTFhODBjZTEy
NjBjMjciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTE5YmM1MDg3ZmQ5NzAyNmQ5M2NiNGI0NWQ1
MTYzOGQxYTI1MjAyYTVlMWZiYzM5MDU3OTlmNDI0Y2ZhNjEzNCIKIAogQklOQ09ORklHID0gIiR7
YmluZGlyfS9ncGctZXJyb3ItY29uZmlnIgogCi0tIAoyLjQ3LjEKCg==

--===============0724506258490484587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgpg-error: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.58.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.59.tar.bz2 file://pkgconfig.patch file://0001-Do-not-fail-when-testing-config-scripts.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgpg-error: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: FILELIST: removed "/usr/lib/.debug/libgpg-error.so.0.41.1", added "/usr/lib/.debug/libgpg-error.so.0.41.2"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGSIZE changed from 1335240 to 1335328 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dbg: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-dev: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-doc: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-cs: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-da: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-de: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-eo: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-es: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-fr: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-hu: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-it: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ja: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-nl: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pl: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-pt: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ro: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGSIZE changed from 40694 to 45183 (+11%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-ru: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sr: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGSIZE changed from 33573 to 33554 (-0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-sv: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-tr: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-uk: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-vi: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-cn: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-locale-zh-tw: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-ptest: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: FILELIST: directory renamed /usr/src/debug/libgpg-error/1.58/doc -> /usr/src/debug/libgpg-error/1.59/doc, directory renamed /usr/src/debug/libgpg-error/1.58/tests -> /usr/src/debug/libgpg-error/1.59/tests, directory renamed /usr/src/debug/libgpg-error/1.58/src -> /usr/src/debug/libgpg-error/1.59/src
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGSIZE changed from 1024500 to 1024661 (+0%)
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-src: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error-staticdev: PV changed from "1.58" to "1.59"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: FILELIST: removed "/usr/lib/libgpg-error.so.0.41.1", added "/usr/lib/libgpg-error.so.0.41.2"
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PKGV changed from 1.58 [default] to 1.59 [default]
packages/x86-64-v3-poky-linux/libgpg-error/libgpg-error: PV changed from "1.58" to "1.59"
Changes to packages/x86-64-v3-poky-linux/libgpg-error (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so.0.41.1 moved to /usr/lib/libgpg-error.so.0.41.2
Changes to packages/x86_64-linux/libgpg-error-native (sysroot):
  /usr/lib/libgpg-error.so.0 changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so changed symlink target from libgpg-error.so.0.41.1 to libgpg-error.so.0.41.2
  /usr/lib/libgpg-error.so.0.41.1 moved to /usr/lib/libgpg-error.so.0.41.2

--===============0724506258490484587==--

