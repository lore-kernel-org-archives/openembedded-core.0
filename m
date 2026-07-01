Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EFEC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38892.1782887648575864726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=paOFSQOr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CzHlLAHR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f1c628973-ce63ca4e-cf12-4704-94b1-5c8c5c24a06c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CFsYiYBOCrXCiH8YcsqshC6lUPjRY426qscbYlRHoVQ=;
	b=paOFSQOrL6u1gTfBn5Uic3bsOC/1aZ1a5yWH7YL3kpabwpsRyRzN/rQBtqyG+wvp
	BFDF/IfaOqONPOkpoD55fdCoL0pSorNIzJ6HJo5xwr9/BqTYhKkFFN45+6BY5L8fv6D
	CspWi8+wQAXg5ClUqyeIsKkPf+edOrIeKaYxL4J0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CFsYiYBOCrXCiH8YcsqshC6lUPjRY426qscbYlRHoVQ=;
	b=CzHlLAHRW/Qhqw4SWb7r5p7/Ni0yOBfJG68ewbonKAntz/oNORJkmBJlRiS3at9S
	kZqTxy712sBj4q/cAeiqNl9M2Utq0ZC4nQ1wy0JIm0KXjkL97FrLV7gdX8ZVV7CK33t
	4Mr7jMqrvvJR2unTLp+ciyf6u09r0wvmobQO9s/o=
Content-Type: multipart/mixed; boundary="===============0951888877796682393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.9.96 SUCCEEDED
Message-ID: <0101019f1c628973-ce63ca4e-cf12-4704-94b1-5c8c5c24a06c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239932

--===============0951888877796682393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.9.96* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.5.1-2.9.96.patch
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
From bdfca93584f801266adac5110fee8d60ec5eb3d0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 05:45:54 +0000
Subject: [PATCH] pkgconf: upgrade 2.5.1 -> 2.9.96

---
 .../{pkgconf_2.5.1.bb => pkgconf_2.9.96.bb}   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.5.1.bb => pkgconf_2.9.96.bb} (79%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.9.96.bb
similarity index 79%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.9.96.bb
index 277ef9786c..5641302d48 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.9.96.bb
@@ -1,3 +1,23 @@
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
+# @@ -1,5 +1,4 @@
+# -Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018
+# -    pkgconf authors (see AUTHORS file in source directory).
+# +Copyright (c) 2011-2026 pkgconf authors (see AUTHORS file in source directory).
+#  
+#  Permission to use, copy, modify, and/or distribute this software for any
+#  purpose with or without fee is hereby granted, provided that the above
+# 
+#
+
 SUMMARY = "pkgconf provides compiler and linker configuration for development frameworks."
 DESCRIPTION = "pkgconf is a program which helps to configure compiler and linker \
 flags for development frameworks. It is similar to pkg-config from \
@@ -12,7 +32,7 @@ RPROVIDES:${PN} += "pkgconfig"
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
 LICENSE = "pkgconf"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2214222ec1a820bd6cc75167a56925e0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e33c297f35e165ecf4fbc81974dc9ca"
 
 SRC_URI = "\
     https://distfiles.ariadne.space/pkgconf/pkgconf-${PV}.tar.xz \
@@ -20,7 +40,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582cfffd658b0a50c243"
+SRC_URI[sha256sum] = "f2e7898225914d8ded87c0bea1e2d238795e14834dd3cb33e8c93e5d55b47eb5"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============0951888877796682393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.5.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.9.96.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.7.0.0", added "/usr/bin/.debug/spdxtool /usr/bin/.debug/pccritic /usr/lib/.debug/libpkgconf.so.8.0.0"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 748456 (+85%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 41783 (+54%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/man/man1/spdxtool.1 /usr/share/doc/pkgconf/DCO /usr/share/man/man1/pccritic.1 /usr/share/doc/pkgconf/COPYING /usr/share/doc/pkgconf/CONTRIBUTING.md"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 67619 (+52%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/2.5.1/cli/bomtool -> /usr/src/debug/pkgconf/2.9.96/cli/bomtool, removed "/usr/src/debug/pkgconf/2.5.1/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/client.c /usr/src/debug/pkgconf/2.5.1/cli/main.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/path.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/queue.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/audit.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/cache.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/iter.h /usr/src/debug/pkgconf/2.5.1/cli/getopt_long
 .h /usr/src/debug/pkgconf/2.5.1/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/parser.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/personality.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/tuple.c", added "/usr/src/debug/pkgconf/2.9.96/libpkgconf/tuple.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.9.96/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/simplelicensing.h /usr/src/debug/pkgconf/2.9.96/libpkgconf/bufferset.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/simplelicensing.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/bytecode.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/variable.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/client.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/generate.h /usr/src/debug/pkgconf/2.9.96/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/output.c 
 /usr/src/debug/pkgconf/2.9.96/libpkgconf/parser.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/generate.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.9.96/cli/main.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/path.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/cache.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.9.96/libpkgconf/path.h /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/serialize.h /usr/src/debug/pkgconf/2.9.96/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/iter.h /usr/src/debug/pkgconf/2.9.96/cli/pccritic/critic.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/serialize.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/audit.c /usr/src/debug/pkgconf/2.9.96/cli/pccritic/critic.h /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/software.c /usr/src/debug/pkgconf/2.9.96/cli/getopt_long.h /usr/src/debug/pkgconf/2.9.96/cli/renderer-msvc.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/personality.c /usr/src/debug/pkgconf/2.9.96/cli/
 getopt_long.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/software.h /usr/src/debug/pkgconf/2.9.96/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.9.96/cli/core.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/core.h /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/util.h /usr/src/debug/pkgconf/2.9.96/libpkgconf/queue.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/core.c /usr/src/debug/pkgconf/2.9.96/cli/core.h /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/main.c /usr/src/debug/pkgconf/2.9.96/cli/spdxtool/util.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/license.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/version.c /usr/src/debug/pkgconf/2.9.96/cli/pccritic/main.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.9.96/libpkgconf/argvsplit.c"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 535840 (+78%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "2.5.1" to "2.9.96"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 2.5.1 [default] to 2.9.96 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7.0.0 /usr/lib/libpkgconf.so.7", added "/usr/bin/spdxtool /usr/lib/libpkgconf.so.8.0.0 /usr/bin/pccritic /usr/lib/libpkgconf.so.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 174738 to 298069 (+71%)
Changes to packages/x86-64-v3-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
  /usr/bin/pccritic was added
  /usr/bin/spdxtool was added

--===============0951888877796682393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 748456 (+85%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 41783 (+54%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 67619 (+52%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/man/man1/pccritic.1 /usr/share/man/man1/spdxtool.1 /usr/share/doc/pkgconf/COPYING /usr/share/doc/pkgconf/DCO /usr/share/doc/pkgconf/CONTRIBUTING.md"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 535840 (+78%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 174738 to 298069 (+71%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0", added "/usr/bin/pccritic /usr/lib/libpkgconf.so.8.0.0 /usr/bin/spdxtool /usr/lib/libpkgconf.so.8"
Changes to packages/x86-64-v3-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
  /usr/bin/pccritic was added
  /usr/bin/spdxtool was added

--===============0951888877796682393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.5.1-2.9.96.patch"

RnJvbSBiZGZjYTkzNTg0ZjgwMTI2NmFkYWM1MTEwZmVlOGQ2MGVjNWViM2QwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNTo0NTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMi41LjEgLT4gMi45Ljk2CgotLS0KIC4uLi97cGtnY29uZl8yLjUuMS5i
YiA9PiBwa2djb25mXzIuOS45Ni5iYn0gICB8IDI0ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuNS4xLmJiID0+IHBrZ2NvbmZfMi45
Ljk2LmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25m
L3BrZ2NvbmZfMi41LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25m
XzIuOS45Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuOS45Ni5iYgppbmRleCAyNzdlZjk3ODZjLi41NjQx
MzAyZDQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25m
XzIuNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi45
Ljk2LmJiCkBAIC0xLDMgKzEsMjMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZh
bHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxv
d2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5z
ZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5k
IHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNl
bnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0
IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisj
ICsrKyBDT1BZSU5HCisjIEBAIC0xLDUgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDExLCAy
MDEyLCAyMDEzLCAyMDE0LCAyMDE1LCAyMDE2LCAyMDE3LCAyMDE4CisjIC0gICAgcGtnY29uZiBh
dXRob3JzIChzZWUgQVVUSE9SUyBmaWxlIGluIHNvdXJjZSBkaXJlY3RvcnkpLgorIyArQ29weXJp
Z2h0IChjKSAyMDExLTIwMjYgcGtnY29uZiBhdXRob3JzIChzZWUgQVVUSE9SUyBmaWxlIGluIHNv
dXJjZSBkaXJlY3RvcnkpLgorIyAgCisjICBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5
LCBhbmQvb3IgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJlIGZvciBhbnkKKyMgIHB1cnBvc2Ugd2l0
aCBvciB3aXRob3V0IGZlZSBpcyBoZXJlYnkgZ3JhbnRlZCwgcHJvdmlkZWQgdGhhdCB0aGUgYWJv
dmUKKyMgCisjCisKIFNVTU1BUlkgPSAicGtnY29uZiBwcm92aWRlcyBjb21waWxlciBhbmQgbGlu
a2VyIGNvbmZpZ3VyYXRpb24gZm9yIGRldmVsb3BtZW50IGZyYW1ld29ya3MuIgogREVTQ1JJUFRJ
T04gPSAicGtnY29uZiBpcyBhIHByb2dyYW0gd2hpY2ggaGVscHMgdG8gY29uZmlndXJlIGNvbXBp
bGVyIGFuZCBsaW5rZXIgXAogZmxhZ3MgZm9yIGRldmVsb3BtZW50IGZyYW1ld29ya3MuIEl0IGlz
IHNpbWlsYXIgdG8gcGtnLWNvbmZpZyBmcm9tIFwKQEAgLTEyLDcgKzMyLDcgQEAgUlBST1ZJREVT
OiR7UE59ICs9ICJwa2djb25maWciCiAjIFRoZSBwa2djb25mIGxpY2Vuc2Ugc2VlbXMgdG8gYmUg
ZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgdG8gQlNELTItQ2xhdXNlIG9yCiAjIElTQywgYnV0IGhh
cyBkaWZmZXJlbnQgd29yZGluZywgc28gbmVlZHMgaXRzIG93biBuYW1lLgogTElDRU5TRSA9ICJw
a2djb25mIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MjIxNDIyMmVj
MWE4MjBiZDZjYzc1MTY3YTU2OTI1ZTAiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT0xZTMzYzI5N2YzNWUxNjVlY2Y0ZmJjODE5NzRkYzljYSIKIAogU1JDX1VSSSA9ICJc
CiAgICAgaHR0cHM6Ly9kaXN0ZmlsZXMuYXJpYWRuZS5zcGFjZS9wa2djb25mL3BrZ2NvbmYtJHtQ
Vn0udGFyLnh6IFwKQEAgLTIwLDcgKzQwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3Br
Zy1jb25maWctbmF0aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDA1Yzk1ODliOWY4NmVjZjA0NGMxMGEyMjY5ODIyYmM5
ZWIwMDFlY2VkMjU4MmNmZmZkNjU4YjBhNTBjMjQzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYy
ZTc4OTgyMjU5MTRkOGRlZDg3YzBiZWExZTJkMjM4Nzk1ZTE0ODM0ZGQzY2IzM2U4YzkzZTVkNTVi
NDdlYjUiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============0951888877796682393==--

