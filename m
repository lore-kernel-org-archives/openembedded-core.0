Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA023D609A7
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17398.1765872136614573548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JG1qRtyY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SBJoL8pQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ef3f4-d64b7752-ff31-4c57-b99c-1b472543d7ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z2RUhHdCZvN4jwRq/bk3ktnx/A+ROCdU0H4G9zwrOgk=;
	b=JG1qRtyYSFjqmjLDBYC4pbOhJ8fvALse5QaUfPA9QHEz89A7XgHeU2EXA7Sakdff
	pwwULdRmbW/HiQd8e9e0H4o4fIfiokWxI1qBNWcdtxC34fMUrpnQBcwTMi139Cj4jSZ
	/W/zfHW3oW1xN1BcihcRxteWMtiy0zvfcPuvGx3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z2RUhHdCZvN4jwRq/bk3ktnx/A+ROCdU0H4G9zwrOgk=;
	b=SBJoL8pQWKp50rLt7XvK3W78bfwwQLHhasOD2+1qJVPajA0vinwwGnaGNyqOuoEY
	g71WLhZJLW+SlPwLRPgl6O4GisJRr7QL6NuwhfPMqOQZUJIxjmI6TAFzvicG3bo9zoK
	CBUlZe6oifgbvhW7hi9rWvyTprFkboeU78WefL04=
Content-Type: multipart/mixed; boundary="===============6899521705493409293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpcre2: upgrading to 10.47 SUCCEEDED
Message-ID: <0101019b262ef3f4-d64b7752-ff31-4c57-b99c-1b472543d7ea-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227917

--===============6899521705493409293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcre2* to *10.47* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.46-10.47.patch
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
From 40b1ce70b408130b06b3d35ad5bfd9774b38c5e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:39:44 +0000
Subject: [PATCH] libpcre2: upgrade 10.46 -> 10.47

---
 .../{libpcre2_10.46.bb => libpcre2_10.47.bb}  | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.46.bb => libpcre2_10.47.bb} (54%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.46.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
similarity index 54%
rename from meta/recipes-support/libpcre/libpcre2_10.46.bb
rename to meta/recipes-support/libpcre/libpcre2_10.47.bb
index 0d7823c079..7ab7945de0 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.46.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -1,3 +1,47 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE.md
+# +++ LICENCE.md
+# @@ -1,4 +1,4 @@
+# -PCRE2 License
+# +PCRE2 Licence
+#  =============
+#  
+#  | SPDX-License-Identifier: | BSD-3-Clause WITH PCRE2-exception |
+# @@ -16,7 +16,8 @@
+#  The basic library functions are written in C and are freestanding. Also
+#  included in the distribution is a just-in-time compiler that can be used to
+#  optimize pattern matching. This is an optional feature that can be omitted when
+# -the library is built.
+# +the library is built. The just-in-time compiler is separately licensed under the
+# +"2-clause BSD" licence.
+#  
+#  
+#  COPYRIGHT
+# @@ -52,6 +53,8 @@
+#  
+#      Copyright (c) 2009-2024 Zoltan Herczeg
+#      All rights reserved.
+# +
+# +The code in the `deps/sljit` directory has its own LICENSE file.
+#  
+#  ### All other contributions
+#  
+# @@ -99,5 +102,3 @@
+#  PCRE2, it must respect the condition, but if package B is software that
+#  includes package A, the condition is not imposed on package B unless it uses
+#  PCRE2 independently.
+# -
+# -End
+# 
+#
+
 DESCRIPTION = "There are two major versions of the PCRE library. The \
 newest version is PCRE2, which is a re-working of the original PCRE \
 library to provide an entirely new API. The original, very widely \
@@ -8,14 +52,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.md;md5=8446a1fd12e40d9d64c79234fbb1f812"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f"
+SRC_URI[sha256sum] = "47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.47.1


--===============6899521705493409293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.14.0", added "/usr/lib/libpcre2-16.so.0.15.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.14.0", added "/usr/lib/libpcre2-32.so.0.15.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 2590992 to 2883424 (+11%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/doc/pcre2/html/pcre2_next_match.html /usr/share/man/man3/pcre2_next_match.3"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.14.0 /usr/lib/libpcre2-posix.so.3.0.6", added "/usr/lib/libpcre2-8.so.0.15.0 /usr/lib/libpcre2-posix.so.3.0.7"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PKGSIZE changed from 186304 to 284656 (+53%)
Changes to packages/x86-64-v3-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-8.so.0.14.0 moved to /usr/lib/libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3.0.6 moved to /usr/lib/libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-16.so.0.15.0 was added
  /usr/lib/libpcre2-32.so.0.15.0 was added
  /usr/lib/libpcre2-16.so.0.14.0 was removed
  /usr/lib/libpcre2-32.so.0.14.0 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-8.so.0.14.0 moved to /usr/lib/libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3.0.6 moved to /usr/lib/libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-16.so.0.15.0 was added
  /usr/lib/libpcre2-32.so.0.15.0 was added
  /usr/lib/libpcre2-16.so.0.14.0 was removed
  /usr/lib/libpcre2-32.so.0.14.0 was removed

--===============6899521705493409293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
packages/x86-64-v3-poky-linux/libpcre2: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2: SRC_URI changed from "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2" to "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2"
packages/x86-64-v3-poky-linux/libpcre2: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.14.0", added "/usr/lib/libpcre2-16.so.0.15.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PKGSIZE changed from 399605 to 403781 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.14.0", added "/usr/lib/libpcre2-32.so.0.15.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PKGSIZE changed from 383221 to 387397 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/.debug/libpcre2-32.so.0.14.0 /usr/lib/.debug/libpcre2-16.so.0.14.0 /usr/lib/.debug/libpcre2-posix.so.3.0.6 /usr/lib/.debug/libpcre2-8.so.0.14.0", added "/usr/lib/.debug/libpcre2-8.so.0.15.0 /usr/lib/.debug/libpcre2-32.so.0.15.0 /usr/lib/.debug/libpcre2-posix.so.3.0.7 /usr/lib/.debug/libpcre2-16.so.0.15.0"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 2590992 to 2883424 (+11%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PKGSIZE changed from 60174 to 60872 (+1%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/doc/pcre2/html/pcre2_next_match.html /usr/share/man/man3/pcre2_next_match.3"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2785005 to 2827983 (+2%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: FILELIST: removed "/usr/src/debug/libpcre2/10.46/src/pcre2_error.c /usr/src/debug/libpcre2/10.46/src/pcre2_jit_misc.c /usr/src/debug/libpcre2/10.46/src/pcre2_substitute.c /usr/src/debug/libpcre2/10.46/src/pcre2test.c /usr/src/debug/libpcre2/10.46/src/pcre2_intmodedep.h /usr/src/debug/libpcre2/10.46/src/pcre2.h /usr/src/debug/libpcre2/10.46/src/pcre2_jit_match.c /usr/src/debug/libpcre2/10.46/src/pcre2_auto_possess.c /usr/src/debug/libpcre2/10.46/src/pcre2_tables.c /usr/src/debug/libpcre2/10.46/src/pcre2_ucd.c /usr/src/debug/libpcre2/10.46/src/pcre2_ucptables.c /usr/src/debug/libpcre2/10.46/src/pcre2_newline.c /usr/src/debug/libpcre2/10.46/src/pcre2_string_utils.c /usr/src/debug/libpcre2/10.46/src/pcre2_printint.c /usr/src/debug/libpcre2/10.46/src/pcre2_study.c /usr/src/debug/libpcre2/10.46/src/pcre2_script_run.c /usr/src/debug/libpcre2/10.46/src/pcre2_compile.h /usr/src/debug/libpcre2/10.46/src/pcre2_maketables.c /usr/src/debug/libp
 cre2/10.46/src/pcre2_compile.c /usr/src/debug/libpcre2/10.46/src/pcre2_chkdint.c /usr/src/debug/libpcre2/10.46/src/pcre2_context.c /usr/src/debug/libpcre2/10.46/src/pcre2_convert.c /usr/src/debug/libpcre2/10.46/src/pcre2_config.c /usr/src/debug/libpcre2/10.46/src/pcre2_match_data.c /usr/src/debug/libpcre2/10.46/src/pcre2_substring.c /usr/src/debug/libpcre2/10.46/src/pcre2_find_bracket.c /usr/src/debug/libpcre2/10.46/src/pcre2_internal.h /usr/src/debug/libpcre2/10.46/src/pcre2_jit_compile.c /usr/src/debug/libpcre2/10.46/src/pcre2_match.c /usr/src/debug/libpcre2/10.46/src/pcre2_pattern_info.c /usr/src/debug/libpcre2/10.46/src/pcre2_valid_utf.c /usr/src/debug/libpcre2/10.46/src/pcre2_serialize.c /usr/src/debug/libpcre2/10.46/src/pcre2_ucp.h /usr/src/debug/libpcre2/10.46/src/pcre2grep.c /usr/src/debug/libpcre2/10.46/src/pcre2_ord2utf.c /usr/src/debug/libpcre2/10.46/src/pcre2_dfa_match.c /usr/src/debug/libpcre2/10.46/src/pcre2_chartables.c.dist /usr/src/debug/libpcre2/10.46/src/pcre2posi
 x.c /usr/src/debug/libpcre2/10.46/src/pcre2_compile_class.c /usr/src/debug/libpcre2/10.46/src/pcre2_extuni.c /usr/src/debug/libpcre2/10.46/src/pcre2_xclass.c /usr/src/debug/libpcre2/10.46/src/pcre2posix.h", added "/usr/src/debug/libpcre2/10.47/src/pcre2_error.c /usr/src/debug/libpcre2/10.47/src/pcre2_substitute.c /usr/src/debug/libpcre2/10.47/src/pcre2test.c /usr/src/debug/libpcre2/10.47/src/pcre2_intmodedep.h /usr/src/debug/libpcre2/10.47/src/pcre2.h /usr/src/debug/libpcre2/10.47/src/pcre2_auto_possess.c /usr/src/debug/libpcre2/10.47/src/pcre2_tables.c /usr/src/debug/libpcre2/10.47/src/pcre2_ucd.c /usr/src/debug/libpcre2/10.47/src/pcre2_newline.c /usr/src/debug/libpcre2/10.47/src/pcre2_string_utils.c /usr/src/debug/libpcre2/10.47/src/pcre2_ucptables_inc.h /usr/src/debug/libpcre2/10.47/src/pcre2_printint_inc.h /usr/src/debug/libpcre2/10.47/src/pcre2_study.c /usr/src/debug/libpcre2/10.47/src/pcre2_script_run.c /usr/src/debug/libpcre2/10.47/src/pcre2_jit_misc_inc.h /usr/src/debug/libp
 cre2/10.47/src/pcre2_jit_match_inc.h /usr/src/debug/libpcre2/10.47/src/pcre2_compile.h /usr/src/debug/libpcre2/10.47/src/pcre2_compile_cgroup.c /usr/src/debug/libpcre2/10.47/src/pcre2_maketables.c /usr/src/debug/libpcre2/10.47/src/pcre2_compile.c /usr/src/debug/libpcre2/10.47/src/pcre2_chkdint.c /usr/src/debug/libpcre2/10.47/src/pcre2_context.c /usr/src/debug/libpcre2/10.47/src/pcre2_convert.c /usr/src/debug/libpcre2/10.47/src/pcre2_config.c /usr/src/debug/libpcre2/10.47/src/pcre2_match_data.c /usr/src/debug/libpcre2/10.47/src/pcre2_substring.c /usr/src/debug/libpcre2/10.47/src/pcre2_find_bracket.c /usr/src/debug/libpcre2/10.47/src/pcre2_internal.h /usr/src/debug/libpcre2/10.47/src/pcre2_jit_compile.c /usr/src/debug/libpcre2/10.47/src/pcre2_match.c /usr/src/debug/libpcre2/10.47/src/pcre2_pattern_info.c /usr/src/debug/libpcre2/10.47/src/pcre2_valid_utf.c /usr/src/debug/libpcre2/10.47/src/pcre2_serialize.c /usr/src/debug/libpcre2/10.47/src/pcre2_ucp.h /usr/src/debug/libpcre2/10.47/src
 /pcre2_match_next.c /usr/src/debug/libpcre2/10.47/src/pcre2grep.c /usr/src/debug/libpcre2/10.47/src/pcre2_ord2utf.c /usr/src/debug/libpcre2/10.47/src/pcre2_dfa_match.c /usr/src/debug/libpcre2/10.47/src/pcre2_chartables.c.dist /usr/src/debug/libpcre2/10.47/src/pcre2posix.c /usr/src/debug/libpcre2/10.47/src/pcre2_compile_class.c /usr/src/debug/libpcre2/10.47/src/pcre2_extuni.c /usr/src/debug/libpcre2/10.47/src/pcre2_xclass.c /usr/src/debug/libpcre2/10.47/src/pcre2test_inc.h /usr/src/debug/libpcre2/10.47/src/pcre2posix.h"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2814034 to 2887584 (+3%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-posix.so.3.0.6 /usr/lib/libpcre2-8.so.0.14.0", added "/usr/lib/libpcre2-8.so.0.15.0 /usr/lib/libpcre2-posix.so.3.0.7"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PKGSIZE changed from 454899 to 463251 (+2%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PKGSIZE changed from 53292 to 53290 (-0%)
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PKGSIZE changed from 95676 to 97211 (+2%)
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.46" to "10.47"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PKGV changed from 10.46 [default] to 10.47 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PKGSIZE changed from 186304 to 284656 (+53%)
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PV changed from "10.46" to "10.47"
Changes to packages/x86-64-v3-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-8.so.0.14.0 moved to /usr/lib/libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3.0.6 moved to /usr/lib/libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-16.so.0.15.0 was added
  /usr/lib/libpcre2-32.so.0.15.0 was added
  /usr/lib/libpcre2-16.so.0.14.0 was removed
  /usr/lib/libpcre2-32.so.0.14.0 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.14.0 to libpcre2-16.so.0.15.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.14.0 to libpcre2-32.so.0.15.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.14.0 to libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.6 to libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-8.so.0.14.0 moved to /usr/lib/libpcre2-8.so.0.15.0
  /usr/lib/libpcre2-posix.so.3.0.6 moved to /usr/lib/libpcre2-posix.so.3.0.7
  /usr/lib/libpcre2-16.so.0.15.0 was added
  /usr/lib/libpcre2-32.so.0.15.0 was added
  /usr/lib/libpcre2-16.so.0.14.0 was removed
  /usr/lib/libpcre2-32.so.0.14.0 was removed

--===============6899521705493409293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.46-10.47.patch"

RnJvbSA0MGIxY2U3MGI0MDgxMzBiMDZiM2QzNWFkNWJmZDk3NzRiMzhjNWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6Mzk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY3JlMjogdXBncmFkZSAxMC40NiAtPiAxMC40NwoKLS0tCiAuLi4ve2xpYnBjcmUyXzEwLjQ2
LmJiID0+IGxpYnBjcmUyXzEwLjQ3LmJifSAgfCA0OCArKysrKysrKysrKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL3tsaWJwY3JlMl8xMC40Ni5iYiA9PiBsaWJwY3JlMl8x
MC40Ny5iYn0gKDU0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3Jl
L2xpYnBjcmUyXzEwLjQ2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3Jl
Ml8xMC40Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDU0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQ2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQ3LmJiCmluZGV4IDBkNzgyM2MwNzkuLjdhYjc5
NDVkZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUvbGlicGNyZTJf
MTAuNDYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8xMC40
Ny5iYgpAQCAtMSwzICsxLDQ3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5DRS5tZAor
IyArKysgTElDRU5DRS5tZAorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLVBDUkUyIExpY2Vuc2UKKyMg
K1BDUkUyIExpY2VuY2UKKyMgID09PT09PT09PT09PT0KKyMgIAorIyAgfCBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogfCBCU0QtMy1DbGF1c2UgV0lUSCBQQ1JFMi1leGNlcHRpb24gfAorIyBAQCAt
MTYsNyArMTYsOCBAQAorIyAgVGhlIGJhc2ljIGxpYnJhcnkgZnVuY3Rpb25zIGFyZSB3cml0dGVu
IGluIEMgYW5kIGFyZSBmcmVlc3RhbmRpbmcuIEFsc28KKyMgIGluY2x1ZGVkIGluIHRoZSBkaXN0
cmlidXRpb24gaXMgYSBqdXN0LWluLXRpbWUgY29tcGlsZXIgdGhhdCBjYW4gYmUgdXNlZCB0bwor
IyAgb3B0aW1pemUgcGF0dGVybiBtYXRjaGluZy4gVGhpcyBpcyBhbiBvcHRpb25hbCBmZWF0dXJl
IHRoYXQgY2FuIGJlIG9taXR0ZWQgd2hlbgorIyAtdGhlIGxpYnJhcnkgaXMgYnVpbHQuCisjICt0
aGUgbGlicmFyeSBpcyBidWlsdC4gVGhlIGp1c3QtaW4tdGltZSBjb21waWxlciBpcyBzZXBhcmF0
ZWx5IGxpY2Vuc2VkIHVuZGVyIHRoZQorIyArIjItY2xhdXNlIEJTRCIgbGljZW5jZS4KKyMgIAor
IyAgCisjICBDT1BZUklHSFQKKyMgQEAgLTUyLDYgKzUzLDggQEAKKyMgIAorIyAgICAgIENvcHly
aWdodCAoYykgMjAwOS0yMDI0IFpvbHRhbiBIZXJjemVnCisjICAgICAgQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyMgKworIyArVGhlIGNvZGUgaW4gdGhlIGBkZXBzL3Nsaml0YCBkaXJlY3RvcnkgaGFz
IGl0cyBvd24gTElDRU5TRSBmaWxlLgorIyAgCisjICAjIyMgQWxsIG90aGVyIGNvbnRyaWJ1dGlv
bnMKKyMgIAorIyBAQCAtOTksNSArMTAyLDMgQEAKKyMgIFBDUkUyLCBpdCBtdXN0IHJlc3BlY3Qg
dGhlIGNvbmRpdGlvbiwgYnV0IGlmIHBhY2thZ2UgQiBpcyBzb2Z0d2FyZSB0aGF0CisjICBpbmNs
dWRlcyBwYWNrYWdlIEEsIHRoZSBjb25kaXRpb24gaXMgbm90IGltcG9zZWQgb24gcGFja2FnZSBC
IHVubGVzcyBpdCB1c2VzCisjICBQQ1JFMiBpbmRlcGVuZGVudGx5LgorIyAtCisjIC1FbmQKKyMg
CisjCisKIERFU0NSSVBUSU9OID0gIlRoZXJlIGFyZSB0d28gbWFqb3IgdmVyc2lvbnMgb2YgdGhl
IFBDUkUgbGlicmFyeS4gVGhlIFwKIG5ld2VzdCB2ZXJzaW9uIGlzIFBDUkUyLCB3aGljaCBpcyBh
IHJlLXdvcmtpbmcgb2YgdGhlIG9yaWdpbmFsIFBDUkUgXAogbGlicmFyeSB0byBwcm92aWRlIGFu
IGVudGlyZWx5IG5ldyBBUEkuIFRoZSBvcmlnaW5hbCwgdmVyeSB3aWRlbHkgXApAQCAtOCwxNCAr
NTIsMTQgQEAgU1VNTUFSWSA9ICJQZXJsIENvbXBhdGlibGUgUmVndWxhciBFeHByZXNzaW9ucyB2
ZXJzaW9uIDIiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LnBjcmUub3JnIgogU0VDVElPTiA9ICJk
ZXZlbCIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5DRS5tZDttZDU9ODQ0NmExZmQxMmU0MGQ5ZDY0Yzc5MjM0ZmJiMWY4MTIiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLm1kO21kNT02NzIwYmYzYmNmZjU3NTQzYjkx
NWMyYjIyZTUyNmRmMCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
cGNyZTItJHtQVn0vcGNyZTItJHtQVn0udGFyLmJ6MiIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9QQ1JFMlByb2plY3QvcGNyZTIvcmVsZWFzZXMiCiBVUFNUUkVBTV9D
SEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvcGNyZTItKD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE1ZmJjNWFiYTZiZWVlMGIxN2FlY2IwNDYwMmFlMzk0
MzIzOTNhYmExZWJkOGUzOWI3Y2FiZjdkYjg4MzI5OWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NDdmZThjOTk0NjEyNTBkNDJmODllNmU4ZmRhZWJhOWRhMDU3ODU1ZDA2ZWI3ZmMwOGQ5Y2EwM2Zk
MDhkN2JjNyIKIAogQ1ZFX1BST0RVQ1QgPSAicGNyZTIiCiAKLS0gCjIuNDcuMQoK

--===============6899521705493409293==--

