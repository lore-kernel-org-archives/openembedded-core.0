Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2898C47422
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4643.1704114721239349130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=htKaelWV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IXhBnCgo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018cc5270f6c-183874bc-ab21-494a-be70-52724be852cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=BjklvhWer59ZtnREAlobMwgcOjTf4Iadwt4TX19VSD8=;
	b=htKaelWVtovnNsuV8rO2okaFrdGZi3blcQDZhmaHoLGFC2zNQOLSV4I9O52oktxu
	INEtN9b2d1kk/S/pEv7rw0FLpRLQnZxHLT9HXNVgUwe3q9Gwh86ilmPQavlreEGGlTX
	4m7wQGMj8eoa+Bu48l6zaKYFwG6ivcLbEAXzPEMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=BjklvhWer59ZtnREAlobMwgcOjTf4Iadwt4TX19VSD8=;
	b=IXhBnCgogYsgQleoXWnkKRJnwJOpVKui46n0G0S8k4grlUEiv1pIlH5vx7dASkqW
	WfXgCU/hMKfWV2xy+bE/+k4sKeL7St0aXDcQ6pgyCRzkX3PIY0OJ874cEhFYXk4tZTU
	M6ZKT7o0p89si9LNUYueyfk0le57dn6mO9whEJhU=
Content-Type: multipart/mixed; boundary="===============6724328217659416627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre2: upgrading to 10.43-RC1 SUCCEEDED
Message-ID: <0101018cc5270f6c-183874bc-ab21-494a-be70-52724be852cd-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193180

--===============6724328217659416627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcre2* to *10.43-RC1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.42-10.43-RC1.patch
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
From 20d4b5d4617761ae8ec6fdf4ec775fb600945ec0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 12:53:46 +0000
Subject: [PATCH] libpcre2: upgrade 10.42 -> 10.43-RC1

---
 ...ibpcre2_10.42.bb => libpcre2_10.43-RC1.bb} | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.42.bb => libpcre2_10.43-RC1.bb} (60%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.42.bb b/meta/recipes-support/libpcre/libpcre2_10.43-RC1.bb
similarity index 60%
rename from meta/recipes-support/libpcre/libpcre2_10.42.bb
rename to meta/recipes-support/libpcre/libpcre2_10.43-RC1.bb
index cd65493c48..59cc320dfe 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.42.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43-RC1.bb
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
+# +Copyright (c) 1997-2023 University of Cambridge
+#  All rights reserved.
+#  
+#  
+# @@ -37,7 +37,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2010-2022 Zoltan Herczeg
+# +Copyright(c) 2010-2023 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# @@ -48,7 +48,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2009-2022 Zoltan Herczeg
+# +Copyright(c) 2009-2023 Zoltan Herczeg
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
+LIC_FILES_CHKSUM = "file://LICENCE;md5=0ea220f7d7f5a132a97d9e1b2e9ef6e7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840"
+SRC_URI[sha256sum] = "1d9a325f72ebe70f11778551660373e0a292b6d7c1962c5d069adbef18b96674"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.42.0


--===============6724328217659416627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.11.2", added "/usr/lib/libpcre2-16.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.11.2", added "/usr/lib/libpcre2-32.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/man/man3/pcre2_get_match_data_heapframes_size.3 /usr/share/man/man3/pcre2_set_max_varlookbehind.3 /usr/share/doc/pcre2/html/pcre2_get_match_data_heapframes_size.html /usr/share/doc/pcre2/html/pcre2_set_max_varlookbehind.html"
packages/core2-64-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.11.2 /usr/lib/libpcre2-posix.so.3.0.4", added "/usr/lib/libpcre2-posix.so.3.0.5 /usr/lib/libpcre2-8.so.0.12.0"
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
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
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

--===============6724328217659416627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libpcre2: SRC_URI changed from "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2" to "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.43-RC1/pcre2-10.43-RC1.tar.bz2"
packages/core2-64-poky-linux/libpcre2: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.11.2", added "/usr/lib/libpcre2-16.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-16: PKGSIZE changed from 350573 to 354669 (+1%)
packages/core2-64-poky-linux/libpcre2/libpcre2-16: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.11.2", added "/usr/lib/libpcre2-32.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-32: PKGSIZE changed from 338285 to 342381 (+1%)
packages/core2-64-poky-linux/libpcre2/libpcre2-32: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/.debug/libpcre2-posix.so.3.0.4 /usr/lib/.debug/libpcre2-32.so.0.11.2 /usr/lib/.debug/libpcre2-16.so.0.11.2 /usr/lib/.debug/libpcre2-8.so.0.11.2", added "/usr/lib/.debug/libpcre2-32.so.0.12.0 /usr/lib/.debug/libpcre2-posix.so.3.0.5 /usr/lib/.debug/libpcre2-8.so.0.12.0 /usr/lib/.debug/libpcre2-16.so.0.12.0"
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 2179104 to 2235128 (+3%)
packages/core2-64-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-dev: PKGSIZE changed from 56038 to 56974 (+2%)
packages/core2-64-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: FILELIST: added "/usr/share/man/man3/pcre2_set_max_varlookbehind.3 /usr/share/man/man3/pcre2_get_match_data_heapframes_size.3 /usr/share/doc/pcre2/html/pcre2_get_match_data_heapframes_size.html /usr/share/doc/pcre2/html/pcre2_set_max_varlookbehind.html"
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2537659 to 2624091 (+3%)
packages/core2-64-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-src: FILELIST: removed "/usr/src/debug/libpcre2/10.42/src/pcre2_pattern_info.c /usr/src/debug/libpcre2/10.42/src/pcre2_xclass.c /usr/src/debug/libpcre2/10.42/src/pcre2_intmodedep.h /usr/src/debug/libpcre2/10.42/src/pcre2_config.c /usr/src/debug/libpcre2/10.42/src/pcre2_internal.h /usr/src/debug/libpcre2/10.42/src/pcre2_substring.c /usr/src/debug/libpcre2/10.42/src/pcre2_ucd.c /usr/src/debug/libpcre2/10.42/src/pcre2_chartables.c.dist /usr/src/debug/libpcre2/10.42/src/pcre2_jit_misc.c /usr/src/debug/libpcre2/10.42/src/pcre2_ucptables.c /usr/src/debug/libpcre2/10.42/src/pcre2_match.c /usr/src/debug/libpcre2/10.42/src/pcre2test.c /usr/src/debug/libpcre2/10.42/src/pcre2_dfa_match.c /usr/src/debug/libpcre2/10.42/src/pcre2_valid_utf.c /usr/src/debug/libpcre2/10.42/src/pcre2_tables.c /usr/src/debug/libpcre2/10.42/src/pcre2_serialize.c /usr/src/debug/libpcre2/10.42/src/pcre2_newline.c /usr/src/debug/libpcre2/10.42/src/pcre2_script_run.c /usr/src/
 debug/libpcre2/10.42/src/pcre2_maketables.c /usr/src/debug/libpcre2/10.42/src/pcre2_substitute.c /usr/src/debug/libpcre2/10.42/src/pcre2posix.c /usr/src/debug/libpcre2/10.42/src/pcre2_compile.c /usr/src/debug/libpcre2/10.42/src/pcre2_context.c /usr/src/debug/libpcre2/10.42/src/pcre2_convert.c /usr/src/debug/libpcre2/10.42/src/pcre2posix.h /usr/src/debug/libpcre2/10.42/src/pcre2_printint.c /usr/src/debug/libpcre2/10.42/src/pcre2_jit_compile.c /usr/src/debug/libpcre2/10.42/src/pcre2_string_utils.c /usr/src/debug/libpcre2/10.42/src/pcre2.h /usr/src/debug/libpcre2/10.42/src/pcre2_extuni.c /usr/src/debug/libpcre2/10.42/src/pcre2_find_bracket.c /usr/src/debug/libpcre2/10.42/src/pcre2_match_data.c /usr/src/debug/libpcre2/10.42/src/pcre2_auto_possess.c /usr/src/debug/libpcre2/10.42/src/pcre2grep.c /usr/src/debug/libpcre2/10.42/src/pcre2_jit_match.c /usr/src/debug/libpcre2/10.42/src/pcre2_ucp.h /usr/src/debug/libpcre2/10.42/src/pcre2_study.c /usr/src/debug/libpcre2/10.42/src/pcre2_error.c /u
 sr/src/debug/libpcre2/10.42/src/pcre2_ord2utf.c", added "/usr/src/debug/libpcre2/10.43-RC1/src/pcre2_convert.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2.h /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_match_data.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_substring.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_jit_compile.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_dfa_match.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_jit_match.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_ord2utf.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_error.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_extuni.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_context.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_internal.h /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_newline.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_chkdint.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_config.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_ucptables.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_pattern_info.c /usr/src/debu
 g/libpcre2/10.43-RC1/src/pcre2_auto_possess.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_find_bracket.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_printint.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_xclass.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_match.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_tables.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_string_utils.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_substitute.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_jit_misc.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_maketables.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_script_run.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_chartables.c.dist /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_ucd.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2grep.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2test.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2posix.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_ucp.h /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_serialize.c /usr/src/debug/libpcre2/1
 0.43-RC1/src/pcre2_valid_utf.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2posix.h /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_intmodedep.h /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_study.c /usr/src/debug/libpcre2/10.43-RC1/src/pcre2_compile.c"
packages/core2-64-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2577856 to 2633402 (+2%)
packages/core2-64-poky-linux/libpcre2/libpcre2-src: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.11.2 /usr/lib/libpcre2-posix.so.3.0.4", added "/usr/lib/libpcre2-8.so.0.12.0 /usr/lib/libpcre2-posix.so.3.0.5"
packages/core2-64-poky-linux/libpcre2/libpcre2: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/libpcre2: PKGSIZE changed from 401771 to 405867 (+1%)
packages/core2-64-poky-linux/libpcre2/libpcre2: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/pcre2grep-doc: PKGSIZE changed from 50359 to 52733 (+5%)
packages/core2-64-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/pcre2grep: PKGSIZE changed from 53536 to 53704 (+0%)
packages/core2-64-poky-linux/libpcre2/pcre2grep: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/pcre2test-doc: PKGSIZE changed from 89779 to 92196 (+3%)
packages/core2-64-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.42" to "10.43-RC1"
packages/core2-64-poky-linux/libpcre2/pcre2test: PKGV changed from 10.42 [default] to 10.43-RC1 [default]
packages/core2-64-poky-linux/libpcre2/pcre2test: PKGSIZE changed from 165168 to 173632 (+5%)
packages/core2-64-poky-linux/libpcre2/pcre2test: PV changed from "10.42" to "10.43-RC1"
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
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
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

--===============6724328217659416627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.42-10.43-RC1.patch"

RnJvbSAyMGQ0YjVkNDYxNzc2MWFlOGVjNmZkZjRlYzc3NWZiNjAwOTQ1ZWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMjo1Mzo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjcmUyOiB1cGdyYWRlIDEwLjQyIC0+IDEwLjQzLVJDMQoKLS0tCiAuLi5pYnBjcmUyXzEwLjQy
LmJiID0+IGxpYnBjcmUyXzEwLjQzLVJDMS5iYn0gfCA0NCArKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL3tsaWJwY3JlMl8xMC40Mi5iYiA9PiBsaWJwY3Jl
Ml8xMC40My1SQzEuYmJ9ICg2MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlicGNyZS9saWJwY3JlMl8xMC40Mi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUv
bGlicGNyZTJfMTAuNDMtUkMxLmJiCnNpbWlsYXJpdHkgaW5kZXggNjAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAuNDIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAuNDMtUkMxLmJiCmluZGV4IGNk
NjU0OTNjNDguLjU5Y2MzMjBkZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnBjcmUvbGlicGNyZTJfMTAuNDIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicGNy
ZS9saWJwY3JlMl8xMC40My1SQzEuYmIKQEAgLTEsMyArMSw0MyBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIExJQ0VOQ0UKKyMgKysrIExJQ0VOQ0UKKyMgQEAgLTI2LDcgKzI2LDcgQEAKKyMgIFJl
dGlyZWQgZnJvbSBVbml2ZXJzaXR5IG9mIENhbWJyaWRnZSBDb21wdXRpbmcgU2VydmljZSwKKyMg
IENhbWJyaWRnZSwgRW5nbGFuZC4KKyMgIAorIyAtQ29weXJpZ2h0IChjKSAxOTk3LTIwMjIgVW5p
dmVyc2l0eSBvZiBDYW1icmlkZ2UKKyMgK0NvcHlyaWdodCAoYykgMTk5Ny0yMDIzIFVuaXZlcnNp
dHkgb2YgQ2FtYnJpZGdlCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICAKKyMgQEAg
LTM3LDcgKzM3LDcgQEAKKyMgIEVtYWlsIGxvY2FsIHBhcnQ6IGh6bWVzdGVyCisjICBFbWFpbCBk
b21haW46ICAgICBmcmVlbWFpbC5odQorIyAgCisjIC1Db3B5cmlnaHQoYykgMjAxMC0yMDIyIFpv
bHRhbiBIZXJjemVnCisjICtDb3B5cmlnaHQoYykgMjAxMC0yMDIzIFpvbHRhbiBIZXJjemVnCisj
ICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICAKKyMgQEAgLTQ4LDcgKzQ4LDcgQEAKKyMg
IEVtYWlsIGxvY2FsIHBhcnQ6IGh6bWVzdGVyCisjICBFbWFpbCBkb21haW46ICAgICBmcmVlbWFp
bC5odQorIyAgCisjIC1Db3B5cmlnaHQoYykgMjAwOS0yMDIyIFpvbHRhbiBIZXJjemVnCisjICtD
b3B5cmlnaHQoYykgMjAwOS0yMDIzIFpvbHRhbiBIZXJjemVnCisjICBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgorIyAgCisjICAKKyMgCisjCisKIERFU0NSSVBUSU9OID0gIlRoZXJlIGFyZSB0d28gbWFq
b3IgdmVyc2lvbnMgb2YgdGhlIFBDUkUgbGlicmFyeS4gVGhlIFwKIG5ld2VzdCB2ZXJzaW9uIGlz
IFBDUkUyLCB3aGljaCBpcyBhIHJlLXdvcmtpbmcgb2YgdGhlIG9yaWdpbmFsIFBDUkUgXAogbGli
cmFyeSB0byBwcm92aWRlIGFuIGVudGlyZWx5IG5ldyBBUEkuIFRoZSBvcmlnaW5hbCwgdmVyeSB3
aWRlbHkgXApAQCAtOCwxNCArNDgsMTQgQEAgU1VNTUFSWSA9ICJQZXJsIENvbXBhdGlibGUgUmVn
dWxhciBFeHByZXNzaW9ucyB2ZXJzaW9uIDIiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LnBjcmUu
b3JnIgogU0VDVElPTiA9ICJkZXZlbCIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9NDFiZmI5NzdlNDkzM2M1MDY1ODg3MjRj
ZTY5YmY1ZDIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT0wZWEyMjBm
N2Q3ZjVhMTMyYTk3ZDllMWIyZTllZjZlNyIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VS
SX0vZG93bmxvYWQvcGNyZTItJHtQVn0vcGNyZTItJHtQVn0udGFyLmJ6MiIKIAogR0lUSFVCX0JB
U0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9QaGlsaXBIYXplbC9wY3JlMi9yZWxlYXNlcyIK
IFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy9wY3JlMi0oP1A8cHZlcj4uKyki
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZDM2Y2Q4Y2I2ZWEyYTRjMmJiMzU4ZmY2NDExYjBj
Nzg4NjMzYTJhNDVkYWJiZjFhZWI0YjcwMWQxYjVlODQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjFkOWEzMjVmNzJlYmU3MGYxMTc3ODU1MTY2MDM3M2UwYTI5MmI2ZDdjMTk2MmM1ZDA2OWFkYmVm
MThiOTY2NzQiCiAKIENWRV9QUk9EVUNUID0gInBjcmUyIgogCi0tIAoyLjQyLjAKCg==

--===============6724328217659416627==--

