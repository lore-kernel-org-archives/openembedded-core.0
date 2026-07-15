Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62DEC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 05:40:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.456.1784093997224760650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 22:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U46/9YPo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DVyenKQM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f6449f458-02ec5488-c7aa-4f89-8582-dbaa6b77e29a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784093996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=anoDZnFeHqPg5aaDNlQ2IKPN+qzETADBJoKvDv3gAUM=;
	b=U46/9YPo99NP+JaHo6DQys7r/mfZe2ZxYdcUuHohoncJfRncJl859SpOWqD+9H1i
	zIQcHHzzlNvvB3XzbqccPUOiOoFjrI575OeGfqBGSO6r2c0MiP3SU8vyKhUXCKVcCf4
	6KZFX1crpB1cd29nGVk3mUHJ2CSi7aQHaRvOY+Dw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784093996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=anoDZnFeHqPg5aaDNlQ2IKPN+qzETADBJoKvDv3gAUM=;
	b=DVyenKQMtPq8wSNfwZ2phEzLcBi90Wm8RpwUZXN+LcCprV/9YJgqQv/ZSFobGKlx
	Kd41kYaClc3zkzKJpaSH7nZjSmgHlIfISzfHwf8iNctJXf5Wle7Rc+Uv2UcDW04NO8Y
	ULFaQWQF9NKFHU6OKQFPZv1OQxofRWSmqxAPeABQ=
Content-Type: multipart/mixed; boundary="===============6228826937634883728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.3 SUCCEEDED
Message-ID: <0101019f6449f458-02ec5488-c7aa-4f89-8582-dbaa6b77e29a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jul 2026 05:39:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 05:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240936

--===============6228826937634883728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.5.1-3.0.3.patch
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
From cea48950c177a280c8f3a203c53b31e7b3715ab6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jul 2026 05:39:49 +0000
Subject: [PATCH] pkgconf: upgrade 2.5.1 -> 3.0.3

---
 .../{pkgconf_2.5.1.bb => pkgconf_3.0.3.bb}    | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.5.1.bb => pkgconf_3.0.3.bb} (79%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
similarity index 79%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
index 7d9205e560..488f2e268a 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb
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
+SRC_URI[sha256sum] = "aa033abb2b777ba4e66635495a931e53c49d86e4e4e38af68c0f76d666cbd8cf"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============6228826937634883728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.5.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.7.0.0", added "/usr/bin/.debug/pccritic /usr/bin/.debug/spdxtool /usr/lib/.debug/libpkgconf.so.8.0.0"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 767168 (+89%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 42032 (+54%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/doc/pkgconf/DCO /usr/share/doc/pkgconf/COPYING /usr/share/man/man1/spdxtool.1 /usr/share/doc/pkgconf/CONTRIBUTING.md /usr/share/man/man1/pccritic.1"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 67870 (+53%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/2.5.1/cli/bomtool -> /usr/src/debug/pkgconf/3.0.3/cli/bomtool, removed "/usr/src/debug/pkgconf/2.5.1/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/path.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/tuple.c /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.h /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/iter.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/parser.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/queue.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/client.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/personality.c /usr/src/debug/pkgconf/2.5.1/l
 ibpkgconf/cache.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.5.1/cli/main.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/audit.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.c", added "/usr/src/debug/pkgconf/3.0.3/cli/spdxtool/serialize.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/path.h /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/serialize.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/path.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/bytecode.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/tuple.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/generate.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/output.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/generate.c /usr/src/debug/pkgconf/3.0.3/cli/getopt_long.h /usr/src/debug/pkgconf/3.0.3/
 cli/getopt_long.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/iter.h /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/simplelicensing.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/variable.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/parser.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/simplelicensing.c /usr/src/debug/pkgconf/3.0.3/cli/pccritic/main.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/fileio.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/version.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/buffer.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/queue.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/dependency.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/client.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/main.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/software.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/util.h /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/core.c /usr/src/debug/pkgconf/3.0.3/cli/pccritic/critic.h /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/core.h /usr/src/debu
 g/pkgconf/3.0.3/cli/spdxtool/util.c /usr/src/debug/pkgconf/3.0.3/cli/spdxtool/software.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/bufferset.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/cache.c /usr/src/debug/pkgconf/3.0.3/cli/pccritic/critic.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/personality.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/fragment.c /usr/src/debug/pkgconf/3.0.3/cli/main.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/audit.c /usr/src/debug/pkgconf/3.0.3/cli/core.h /usr/src/debug/pkgconf/3.0.3/cli/renderer-msvc.h /usr/src/debug/pkgconf/3.0.3/libpkgconf/license.c /usr/src/debug/pkgconf/3.0.3/libpkgconf/pkg.c /usr/src/debug/pkgconf/3.0.3/cli/core.c /usr/src/debug/pkgconf/3.0.3/cli/renderer-msvc.c"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 552262 (+84%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "2.5.1" to "3.0.3"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0", added "/usr/bin/pccritic /usr/lib/libpkgconf.so.8.0.0 /usr/bin/spdxtool /usr/lib/libpkgconf.so.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 2.5.1 [default] to 3.0.3 [default]
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

--===============6228826937634883728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 767168 (+89%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 42032 (+54%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/doc/pkgconf/DCO /usr/share/man/man1/spdxtool.1 /usr/share/man/man1/pccritic.1 /usr/share/doc/pkgconf/CONTRIBUTING.md /usr/share/doc/pkgconf/COPYING"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 67870 (+53%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 552262 (+84%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7.0.0 /usr/lib/libpkgconf.so.7", added "/usr/bin/pccritic /usr/lib/libpkgconf.so.8.0.0 /usr/lib/libpkgconf.so.8 /usr/bin/spdxtool"
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

--===============6228826937634883728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.5.1-3.0.3.patch"

RnJvbSBjZWE0ODk1MGMxNzdhMjgwYzhmM2EyMDNjNTNiMzFlN2IzNzE1YWI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSnVsIDIwMjYgMDU6Mzk6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuNS4xIC0+IDMuMC4zCgotLS0KIC4uLi97cGtnY29uZl8yLjUuMS5i
YiA9PiBwa2djb25mXzMuMC4zLmJifSAgICB8IDI0ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuNS4xLmJiID0+IHBrZ2NvbmZfMy4w
LjMuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYv
cGtnY29uZl8yLjUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZf
My4wLjMuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuMy5iYgppbmRleCA3ZDkyMDVlNTYwLi40ODhmMmUy
NjhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIu
NS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjMu
YmIKQEAgLTEsMyArMSwyMyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysr
IENPUFlJTkcKKyMgQEAgLTEsNSArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMTEsIDIwMTIs
IDIwMTMsIDIwMTQsIDIwMTUsIDIwMTYsIDIwMTcsIDIwMTgKKyMgLSAgICBwa2djb25mIGF1dGhv
cnMgKHNlZSBBVVRIT1JTIGZpbGUgaW4gc291cmNlIGRpcmVjdG9yeSkuCisjICtDb3B5cmlnaHQg
KGMpIDIwMTEtMjAyNiBwa2djb25mIGF1dGhvcnMgKHNlZSBBVVRIT1JTIGZpbGUgaW4gc291cmNl
IGRpcmVjdG9yeSkuCisjICAKKyMgIFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2RpZnksIGFu
ZC9vciBkaXN0cmlidXRlIHRoaXMgc29mdHdhcmUgZm9yIGFueQorIyAgcHVycG9zZSB3aXRoIG9y
IHdpdGhvdXQgZmVlIGlzIGhlcmVieSBncmFudGVkLCBwcm92aWRlZCB0aGF0IHRoZSBhYm92ZQor
IyAKKyMKKwogU1VNTUFSWSA9ICJwa2djb25mIHByb3ZpZGVzIGNvbXBpbGVyIGFuZCBsaW5rZXIg
Y29uZmlndXJhdGlvbiBmb3IgZGV2ZWxvcG1lbnQgZnJhbWV3b3Jrcy4iCiBERVNDUklQVElPTiA9
ICJwa2djb25mIGlzIGEgcHJvZ3JhbSB3aGljaCBoZWxwcyB0byBjb25maWd1cmUgY29tcGlsZXIg
YW5kIGxpbmtlciBcCiBmbGFncyBmb3IgZGV2ZWxvcG1lbnQgZnJhbWV3b3Jrcy4gSXQgaXMgc2lt
aWxhciB0byBwa2ctY29uZmlnIGZyb20gXApAQCAtMTIsNyArMzIsNyBAQCBSUFJPVklERVM6JHtQ
Tn0gKz0gInBrZ2NvbmZpZyIKICMgVGhlIHBrZ2NvbmYgbGljZW5zZSBzZWVtcyB0byBiZSBmdW5j
dGlvbmFsbHkgZXF1aXZhbGVudCB0byBCU0QtMi1DbGF1c2Ugb3IKICMgSVNDLCBidXQgaGFzIGRp
ZmZlcmVudCB3b3JkaW5nLCBzbyBuZWVkcyBpdHMgb3duIG5hbWUuCiBMSUNFTlNFID0gInBrZ2Nv
bmYiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yMjE0MjIyZWMxYTgy
MGJkNmNjNzUxNjdhNTY5MjVlMCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTFlMzNjMjk3ZjM1ZTE2NWVjZjRmYmM4MTk3NGRjOWNhIgogCiBTUkNfVVJJID0gIlwKICAg
ICBodHRwczovL2Rpc3RmaWxlcy5hcmlhZG5lLnNwYWNlL3BrZ2NvbmYvcGtnY29uZi0ke1BWfS50
YXIueHogXApAQCAtMjAsNyArNDAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNv
bmZpZy1uYXRpdmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImNkMDVjOTU4OWI5Zjg2ZWNmMDQ0YzEwYTIyNjk4MjJiYzllYjAw
MWVjZWQyNTgyY2ZmZmQ2NThiMGE1MGMyNDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWEwMzNh
YmIyYjc3N2JhNGU2NjYzNTQ5NWE5MzFlNTNjNDlkODZlNGU0ZTM4YWY2OGMwZjc2ZDY2NmNiZDhj
ZiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInBrZ2NvbmYtKD9QPHB2ZXI+XGQrXC5cZCtcLig/
ITlcZCspXGQrKVwudGFyIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKLS0gCjIuNDcu
MQoK

--===============6228826937634883728==--

