Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325BBC54EE7
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.36648.1709330718247372961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eYOt5ACY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V8OBM5X3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dfc0cdb5d-c9dedd04-e23d-4bae-bb52-9f0d4747bffc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=EPBjfgooDGt930jJVSa49Os5Ln5gZBGO9mgElnhVfEU=;
	b=eYOt5ACYlSRenWPVGR4D7Er3KF3jGMcUTe3MvOSgYpzbaqaPfv8A+o6SOqoq7nin
	bDd7qeDHBmM3+4iU+ha7MHy591u04rYNeYtGDLEAGpCkOrXEhPFQVdarMoLa0gLzgQW
	YCdfK403hG7dicYbkSx/7vp/FIVmU+ezMO04mGKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=EPBjfgooDGt930jJVSa49Os5Ln5gZBGO9mgElnhVfEU=;
	b=V8OBM5X39Q3Ncz9znjNZauAU+c3IU8GrDz4C+5wa7v8gKEON1HrVMJLfehEj/l0n
	EhVnGjfFYB/W4Z2LTl6io8yfxdNB2bVmwiWneNq8vQ2WIAoFYwjCLPehk4r2gZ9s08Y
	gsQj3vM5nfl6wF9caU3+mnk431o3t+us616eKcI4=
Content-Type: multipart/mixed; boundary="===============3982651074480368138=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre2: upgrading to 10.43 SUCCEEDED
Message-ID: <0101018dfc0cdb5d-c9dedd04-e23d-4bae-bb52-9f0d4747bffc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196540

--===============3982651074480368138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcre2* to *10.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.42-10.43.patch
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
From 3d6ccad5b62370655eb953415c313404447a8a5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 21:49:06 +0000
Subject: [PATCH] libpcre2: upgrade 10.42 -> 10.43

---
 .../{libpcre2_10.42.bb => libpcre2_10.43.bb}  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.42.bb => libpcre2_10.43.bb} (61%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.42.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
similarity index 61%
rename from meta/recipes-support/libpcre/libpcre2_10.42.bb
rename to meta/recipes-support/libpcre/libpcre2_10.43.bb
index f471b3f90a..f75a296b21 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.42.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -1,3 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -26,7 +26,7 @@
+#  Retired from University of Cambridge Computing Service,
+#  Cambridge, England.
+#  
+# -Copyright (c) 1997-2022 University of Cambridge
+# +Copyright (c) 1997-2024 University of Cambridge
+#  All rights reserved.
+#  
+#  
+# @@ -37,7 +37,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2010-2022 Zoltan Herczeg
+# +Copyright(c) 2010-2024 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# @@ -48,7 +48,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2009-2022 Zoltan Herczeg
+# +Copyright(c) 2009-2024 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# 
+#
+
 DESCRIPTION = "There are two major versions of the PCRE library. The \
 newest version is PCRE2, which is a re-working of the original PCRE \
 library to provide an entirely new API. The original, very widely \
@@ -8,14 +48,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840"
+SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.42.0


--===============3982651074480368138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libpcre2: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2: SRC_URI changed from "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2" to "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.43/pcre2-10.43.tar.bz2"
packages/core2-64-poky-linux/libpcre2/libpcre2-16: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.11.2", added "/usr/lib/libpcre2-16.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-16: PKGSIZE changed from 350573 to 354309 (+1%)
packages/core2-64-poky-linux/libpcre2/libpcre2-32: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.11.2", added "/usr/lib/libpcre2-32.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-32: PKGSIZE changed from 338285 to 342021 (+1%)
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/.debug/libpcre2-32.so.0.11.2 /usr/lib/.debug/libpcre2-16.so.0.11.2 /usr/lib/.debug/libpcre2-8.so.0.11.2 /usr/lib/.debug/libpcre2-posix.so.3.0.4", added "/usr/lib/.debug/libpcre2-8.so.0.12.0 /usr/lib/.debug/libpcre2-32.so.0.12.0 /usr/lib/.debug/libpcre2-posix.so.3.0.5 /usr/lib/.debug/libpcre2-16.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 2179136 to 2235720 (+3%)
packages/core2-64-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-dev: PKGSIZE changed from 56038 to 57062 (+2%)
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/man/man3/pcre2_set_max_varlookbehind.3 /usr/share/doc/pcre2/html/pcre2_get_match_data_heapframes_size.html /usr/share/man/man3/pcre2_get_match_data_heapframes_size.3 /usr/share/doc/pcre2/html/pcre2_set_max_varlookbehind.html"
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2537659 to 2628270 (+4%)
packages/core2-64-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-src: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-src: FILELIST: removed "/usr/src/debug/libpcre2/10.42/src/pcre2_match.c /usr/src/debug/libpcre2/10.42/src/pcre2test.c /usr/src/debug/libpcre2/10.42/src/pcre2_intmodedep.h /usr/src/debug/libpcre2/10.42/src/pcre2_find_bracket.c /usr/src/debug/libpcre2/10.42/src/pcre2_pattern_info.c /usr/src/debug/libpcre2/10.42/src/pcre2_error.c /usr/src/debug/libpcre2/10.42/src/pcre2_chartables.c.dist /usr/src/debug/libpcre2/10.42/src/pcre2_script_run.c /usr/src/debug/libpcre2/10.42/src/pcre2_extuni.c /usr/src/debug/libpcre2/10.42/src/pcre2_auto_possess.c /usr/src/debug/libpcre2/10.42/src/pcre2_config.c /usr/src/debug/libpcre2/10.42/src/pcre2_newline.c /usr/src/debug/libpcre2/10.42/src/pcre2_valid_utf.c /usr/src/debug/libpcre2/10.42/src/pcre2_internal.h /usr/src/debug/libpcre2/10.42/src/pcre2posix.h /usr/src/debug/libpcre2/10.42/src/pcre2_tables.c /usr/src/debug/libpcre2/10.42/src/pcre2_ucptables.c /usr/src/debug/libpcre2/10.42/src/pcre2_string_utils.c /u
 sr/src/debug/libpcre2/10.42/src/pcre2_printint.c /usr/src/debug/libpcre2/10.42/src/pcre2_serialize.c /usr/src/debug/libpcre2/10.42/src/pcre2.h /usr/src/debug/libpcre2/10.42/src/pcre2posix.c /usr/src/debug/libpcre2/10.42/src/pcre2_dfa_match.c /usr/src/debug/libpcre2/10.42/src/pcre2_substring.c /usr/src/debug/libpcre2/10.42/src/pcre2_ucp.h /usr/src/debug/libpcre2/10.42/src/pcre2_ucd.c /usr/src/debug/libpcre2/10.42/src/pcre2_substitute.c /usr/src/debug/libpcre2/10.42/src/pcre2grep.c /usr/src/debug/libpcre2/10.42/src/pcre2_compile.c /usr/src/debug/libpcre2/10.42/src/pcre2_context.c /usr/src/debug/libpcre2/10.42/src/pcre2_convert.c /usr/src/debug/libpcre2/10.42/src/pcre2_jit_misc.c /usr/src/debug/libpcre2/10.42/src/pcre2_xclass.c /usr/src/debug/libpcre2/10.42/src/pcre2_jit_compile.c /usr/src/debug/libpcre2/10.42/src/pcre2_maketables.c /usr/src/debug/libpcre2/10.42/src/pcre2_match_data.c /usr/src/debug/libpcre2/10.42/src/pcre2_study.c /usr/src/debug/libpcre2/10.42/src/pcre2_ord2utf.c /usr
 /src/debug/libpcre2/10.42/src/pcre2_jit_match.c", added "/usr/src/debug/libpcre2/10.43/src/pcre2_match.c /usr/src/debug/libpcre2/10.43/src/pcre2test.c /usr/src/debug/libpcre2/10.43/src/pcre2_intmodedep.h /usr/src/debug/libpcre2/10.43/src/pcre2_find_bracket.c /usr/src/debug/libpcre2/10.43/src/pcre2_pattern_info.c /usr/src/debug/libpcre2/10.43/src/pcre2_error.c /usr/src/debug/libpcre2/10.43/src/pcre2_chartables.c.dist /usr/src/debug/libpcre2/10.43/src/pcre2_script_run.c /usr/src/debug/libpcre2/10.43/src/pcre2_extuni.c /usr/src/debug/libpcre2/10.43/src/pcre2_auto_possess.c /usr/src/debug/libpcre2/10.43/src/pcre2_config.c /usr/src/debug/libpcre2/10.43/src/pcre2_newline.c /usr/src/debug/libpcre2/10.43/src/pcre2_valid_utf.c /usr/src/debug/libpcre2/10.43/src/pcre2_internal.h /usr/src/debug/libpcre2/10.43/src/pcre2posix.h /usr/src/debug/libpcre2/10.43/src/pcre2_tables.c /usr/src/debug/libpcre2/10.43/src/pcre2_ucptables.c /usr/src/debug/libpcre2/10.43/src/pcre2_string_utils.c /usr/src/debug/
 libpcre2/10.43/src/pcre2_printint.c /usr/src/debug/libpcre2/10.43/src/pcre2_serialize.c /usr/src/debug/libpcre2/10.43/src/pcre2.h /usr/src/debug/libpcre2/10.43/src/pcre2posix.c /usr/src/debug/libpcre2/10.43/src/pcre2_dfa_match.c /usr/src/debug/libpcre2/10.43/src/pcre2_substring.c /usr/src/debug/libpcre2/10.43/src/pcre2_ucp.h /usr/src/debug/libpcre2/10.43/src/pcre2_ucd.c /usr/src/debug/libpcre2/10.43/src/pcre2_substitute.c /usr/src/debug/libpcre2/10.43/src/pcre2grep.c /usr/src/debug/libpcre2/10.43/src/pcre2_compile.c /usr/src/debug/libpcre2/10.43/src/pcre2_chkdint.c /usr/src/debug/libpcre2/10.43/src/pcre2_context.c /usr/src/debug/libpcre2/10.43/src/pcre2_convert.c /usr/src/debug/libpcre2/10.43/src/pcre2_jit_misc.c /usr/src/debug/libpcre2/10.43/src/pcre2_xclass.c /usr/src/debug/libpcre2/10.43/src/pcre2_jit_compile.c /usr/src/debug/libpcre2/10.43/src/pcre2_maketables.c /usr/src/debug/libpcre2/10.43/src/pcre2_match_data.c /usr/src/debug/libpcre2/10.43/src/pcre2_study.c /usr/src/debug/li
 bpcre2/10.43/src/pcre2_ord2utf.c /usr/src/debug/libpcre2/10.43/src/pcre2_jit_match.c"
packages/core2-64-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2577856 to 2635840 (+2%)
packages/core2-64-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/libpcre2: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.11.2 /usr/lib/libpcre2-posix.so.3.0.4", added "/usr/lib/libpcre2-8.so.0.12.0 /usr/lib/libpcre2-posix.so.3.0.5"
packages/core2-64-poky-linux/libpcre2/libpcre2: PKGSIZE changed from 401771 to 405507 (+1%)
packages/core2-64-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/pcre2grep-doc: PKGSIZE changed from 50359 to 52733 (+5%)
packages/core2-64-poky-linux/libpcre2/pcre2grep: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/pcre2grep: PKGSIZE changed from 53536 to 53704 (+0%)
packages/core2-64-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/pcre2test-doc: PKGSIZE changed from 89779 to 92270 (+3%)
packages/core2-64-poky-linux/libpcre2/pcre2test: PV changed from "10.42" to "10.43"
packages/core2-64-poky-linux/libpcre2/pcre2test: PKGV changed from 10.42 [default] to 10.43 [default]
packages/core2-64-poky-linux/libpcre2/pcre2test: PKGSIZE changed from 165168 to 173656 (+5%)
Changes to packages/core2-64-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.11.2 to libpcre2-16.so.0.12.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.11.2 to libpcre2-16.so.0.12.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.11.2 to libpcre2-32.so.0.12.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.11.2 to libpcre2-32.so.0.12.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.11.2 to libpcre2-8.so.0.12.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.11.2 to libpcre2-8.so.0.12.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.4 to libpcre2-posix.so.3.0.5
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.4 to libpcre2-posix.so.3.0.5
  /usr/lib/libpcre2-8.so.0.11.2 moved to /usr/lib/libpcre2-8.so.0.12.0
  /usr/lib/libpcre2-posix.so.3.0.4 moved to /usr/lib/libpcre2-posix.so.3.0.5
  /usr/lib/libpcre2-16.so.0.12.0 was added
  /usr/lib/libpcre2-32.so.0.12.0 was added
  /usr/lib/libpcre2-16.so.0.11.2 was removed
  /usr/lib/libpcre2-32.so.0.11.2 was removed

--===============3982651074480368138==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.42-10.43.patch"

RnJvbSAzZDZjY2FkNWI2MjM3MDY1NWViOTUzNDE1YzMxMzQwNDQ0N2E4YTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAyMTo0OTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjcmUyOiB1cGdyYWRlIDEwLjQyIC0+IDEwLjQzCgotLS0KIC4uLi97bGlicGNyZTJfMTAuNDIu
YmIgPT4gbGlicGNyZTJfMTAuNDMuYmJ9ICB8IDQ0ICsrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUve2xpYnBjcmUyXzEwLjQyLmJiID0+IGxpYnBjcmUyXzEw
LjQzLmJifSAoNjElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUv
bGlicGNyZTJfMTAuNDIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xpYnBjcmUy
XzEwLjQzLmJiCnNpbWlsYXJpdHkgaW5kZXggNjElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAuNDIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAuNDMuYmIKaW5kZXggZjQ3MWIzZjkwYS4uZjc1YTI5
NmIyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8x
MC40Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQz
LmJiCkBAIC0xLDMgKzEsNDMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVl
cyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2lu
ZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0
ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1
bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNl
LVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHll
YXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTkNFCisjICsr
KyBMSUNFTkNFCisjIEBAIC0yNiw3ICsyNiw3IEBACisjICBSZXRpcmVkIGZyb20gVW5pdmVyc2l0
eSBvZiBDYW1icmlkZ2UgQ29tcHV0aW5nIFNlcnZpY2UsCisjICBDYW1icmlkZ2UsIEVuZ2xhbmQu
CisjICAKKyMgLUNvcHlyaWdodCAoYykgMTk5Ny0yMDIyIFVuaXZlcnNpdHkgb2YgQ2FtYnJpZGdl
CisjICtDb3B5cmlnaHQgKGMpIDE5OTctMjAyNCBVbml2ZXJzaXR5IG9mIENhbWJyaWRnZQorIyAg
QWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgCisjIEBAIC0zNyw3ICszNyw3IEBACisjICBF
bWFpbCBsb2NhbCBwYXJ0OiBoem1lc3RlcgorIyAgRW1haWwgZG9tYWluOiAgICAgZnJlZW1haWwu
aHUKKyMgIAorIyAtQ29weXJpZ2h0KGMpIDIwMTAtMjAyMiBab2x0YW4gSGVyY3plZworIyArQ29w
eXJpZ2h0KGMpIDIwMTAtMjAyNCBab2x0YW4gSGVyY3plZworIyAgQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KKyMgIAorIyAgCisjIEBAIC00OCw3ICs0OCw3IEBACisjICBFbWFpbCBsb2NhbCBwYXJ0OiBo
em1lc3RlcgorIyAgRW1haWwgZG9tYWluOiAgICAgZnJlZW1haWwuaHUKKyMgIAorIyAtQ29weXJp
Z2h0KGMpIDIwMDktMjAyMiBab2x0YW4gSGVyY3plZworIyArQ29weXJpZ2h0KGMpIDIwMDktMjAy
NCBab2x0YW4gSGVyY3plZworIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgCisjIAor
IworCiBERVNDUklQVElPTiA9ICJUaGVyZSBhcmUgdHdvIG1ham9yIHZlcnNpb25zIG9mIHRoZSBQ
Q1JFIGxpYnJhcnkuIFRoZSBcCiBuZXdlc3QgdmVyc2lvbiBpcyBQQ1JFMiwgd2hpY2ggaXMgYSBy
ZS13b3JraW5nIG9mIHRoZSBvcmlnaW5hbCBQQ1JFIFwKIGxpYnJhcnkgdG8gcHJvdmlkZSBhbiBl
bnRpcmVseSBuZXcgQVBJLiBUaGUgb3JpZ2luYWwsIHZlcnkgd2lkZWx5IFwKQEAgLTgsMTQgKzQ4
LDE0IEBAIFNVTU1BUlkgPSAiUGVybCBDb21wYXRpYmxlIFJlZ3VsYXIgRXhwcmVzc2lvbnMgdmVy
c2lvbiAyIgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5wY3JlLm9yZyIKIFNFQ1RJT04gPSAiZGV2
ZWwiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOQ0U7bWQ1PTQxYmZiOTc3ZTQ5MzNjNTA2NTg4NzI0Y2U2OWJmNWQyIgorTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9MzIxYTVlYjQ2YWNhZTZiNmMxZmYyYzdhODY2
ZDgzNmEiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3BjcmUyLSR7
UFZ9L3BjcmUyLSR7UFZ9LnRhci5iejIiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dp
dGh1Yi5jb20vUGhpbGlwSGF6ZWwvcGNyZTIvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdF
WCA9ICJyZWxlYXNlcy90YWcvcGNyZTItKD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjhkMzZjZDhjYjZlYTJhNGMyYmIzNThmZjY0MTFiMGM3ODg2MzNhMmE0
NWRhYmJmMWFlYjRiNzAxZDFiNWU4NDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTJhNTM5ODRm
ZjBiMDdkZmRiNWFlNDQ4NmJiYjliMjFjY2E4ZTdkZjI0MzQwOTZjYzliZjFiNzI4YzM1MGJjYiIK
IAogQ1ZFX1BST0RVQ1QgPSAicGNyZTIiCiAKLS0gCjIuNDIuMAoK

--===============3982651074480368138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.11.2", added "/usr/lib/libpcre2-16.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.11.2", added "/usr/lib/libpcre2-32.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/man/man3/pcre2_set_max_varlookbehind.3 /usr/share/man/man3/pcre2_get_match_data_heapframes_size.3 /usr/share/doc/pcre2/html/pcre2_set_max_varlookbehind.html /usr/share/doc/pcre2/html/pcre2_get_match_data_heapframes_size.html"
packages/core2-64-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-posix.so.3.0.4 /usr/lib/libpcre2-8.so.0.11.2", added "/usr/lib/libpcre2-posix.so.3.0.5 /usr/lib/libpcre2-8.so.0.12.0"
Changes to packages/core2-64-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.11.2 to libpcre2-16.so.0.12.0
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.11.2 to libpcre2-16.so.0.12.0
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.11.2 to libpcre2-32.so.0.12.0
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.11.2 to libpcre2-32.so.0.12.0
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.11.2 to libpcre2-8.so.0.12.0
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.11.2 to libpcre2-8.so.0.12.0
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.4 to libpcre2-posix.so.3.0.5
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.4 to libpcre2-posix.so.3.0.5
  /usr/lib/libpcre2-8.so.0.11.2 moved to /usr/lib/libpcre2-8.so.0.12.0
  /usr/lib/libpcre2-posix.so.3.0.4 moved to /usr/lib/libpcre2-posix.so.3.0.5
  /usr/lib/libpcre2-16.so.0.12.0 was added
  /usr/lib/libpcre2-32.so.0.12.0 was added
  /usr/lib/libpcre2-16.so.0.11.2 was removed
  /usr/lib/libpcre2-32.so.0.11.2 was removed

--===============3982651074480368138==--

