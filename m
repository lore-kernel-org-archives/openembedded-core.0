Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF96C44500
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50706.1782540476668989662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nBPpkXZq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rceo7n7F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f07b11b7d-55dbe85d-db6a-482d-906b-7c5351aa6561-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V8KdMocIShCMTVhQye8slSG2rcmVDzBx5kLB7G3zSq8=;
	b=nBPpkXZqVq50Hut0ugozM7n1I5hn7WTyFxYDhGOSv34ZXyIa7re9AfMabx3W/GL8
	6AlVSfAn1F3RNhYjUsvbrretfyr74uWPq6Bovu9Px7nC0pFbZ8lF7zcOoxGwKU9z2rb
	Gg0wI3OsRFvr6gOG1ZxZ3XcNt+Zu74K3U9M+2mYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V8KdMocIShCMTVhQye8slSG2rcmVDzBx5kLB7G3zSq8=;
	b=rceo7n7F5P6iiwATL2bIQ7mKzyv//KL2bpTUjn2xgE2pArFDE1p6aUL/srCT+Atd
	u7OTs2JfVt5p9TpNvNOqTNcBeNri71hJSe55aXc6wCSfwXi6Tekhlm03KsDKzMfA8Bs
	1hefwOS0Hyy8lhfNTpU8w52CU+J3oX7UNMgsoKnQ=
Content-Type: multipart/mixed; boundary="===============5418094843759472859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.9.94 SUCCEEDED
Message-ID: <0101019f07b11b7d-55dbe85d-db6a-482d-906b-7c5351aa6561-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239679

--===============5418094843759472859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.9.94* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.5.1-2.9.94.patch
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
From 8f11fef88faff3dc5e911986b61837f11a794d8c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 05:40:04 +0000
Subject: [PATCH] pkgconf: upgrade 2.5.1 -> 2.9.94

---
 .../{pkgconf_2.5.1.bb => pkgconf_2.9.94.bb}   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.5.1.bb => pkgconf_2.9.94.bb} (79%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.9.94.bb
similarity index 79%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.9.94.bb
index 277ef9786c..2b3e50dd87 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.9.94.bb
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
+SRC_URI[sha256sum] = "2cdc42b17ecae868894569c034604f05866e09a06bf7e54a10e8b37e524a07e6"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============5418094843759472859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.5.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.9.94.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.7.0.0", added "/usr/bin/.debug/spdxtool /usr/lib/.debug/libpkgconf.so.8.0.0"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 669600 (+65%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 40833 (+50%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/man/man1/spdxtool.1 /usr/share/doc/pkgconf/CONTRIBUTING.md /usr/share/doc/pkgconf/DCO /usr/share/doc/pkgconf/COPYING"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 64051 (+44%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/2.5.1/cli/bomtool -> /usr/src/debug/pkgconf/2.9.94/cli/bomtool, removed "/usr/src/debug/pkgconf/2.5.1/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/personality.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.c /usr/src/debug/pkgconf/2.5.1/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/cache.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/audit.c /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.c /usr/src/debug/pkgconf/2.5.1/cli/getopt_long.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/iter.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.5.1/libpkgconf/client.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.5.1/cli/main.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/path.c
  /usr/src/debug/pkgconf/2.5.1/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/parser.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/queue.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.5.1/libpkgconf/tuple.c", added "/usr/src/debug/pkgconf/2.9.94/cli/renderer-msvc.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/license.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/version.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/path.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/buffer.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/client.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/fileio.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/output.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/parser.c /usr/src/debug/pkgconf/2.9.94/cli/renderer-msvc.h /usr/src/debug/pkgconf/2.9.94/libpkgconf/path.h /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/software.h /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/serialize.c /usr/src/debug/pkgconf/2.9.94
 /cli/spdxtool/software.c /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/serialize.h /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/simplelicensing.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/bytecode.c /usr/src/debug/pkgconf/2.9.94/cli/getopt_long.h /usr/src/debug/pkgconf/2.9.94/libpkgconf/variable.c /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/simplelicensing.h /usr/src/debug/pkgconf/2.9.94/cli/getopt_long.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/pkg.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/tuple.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/iter.h /usr/src/debug/pkgconf/2.9.94/libpkgconf/dependency.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/libpkgconf.h /usr/src/debug/pkgconf/2.9.94/libpkgconf/bufferset.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/cache.c /usr/src/debug/pkgconf/2.9.94/cli/core.h /usr/src/debug/pkgconf/2.9.94/cli/core.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/argvsplit.c /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/core.c /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/main.c /usr/s
 rc/debug/pkgconf/2.9.94/cli/spdxtool/util.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/bsdstubs.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/queue.c /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/core.h /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/util.h /usr/src/debug/pkgconf/2.9.94/libpkgconf/bsdstubs.h /usr/src/debug/pkgconf/2.9.94/cli/main.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/personality.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/audit.c /usr/src/debug/pkgconf/2.9.94/libpkgconf/fragment.c /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/generate.h /usr/src/debug/pkgconf/2.9.94/cli/spdxtool/generate.c"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 502849 (+67%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "2.5.1" to "2.9.94"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0", added "/usr/lib/libpkgconf.so.8.0.0 /usr/bin/spdxtool /usr/lib/libpkgconf.so.8"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 2.5.1 [default] to 2.9.94 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 174738 to 258933 (+48%)
Changes to packages/x86-64-v3-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
  /usr/bin/spdxtool was added

--===============5418094843759472859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 405656 to 669600 (+65%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 27212 to 40833 (+50%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/doc/pkgconf/CONTRIBUTING.md /usr/share/man/man1/spdxtool.1 /usr/share/doc/pkgconf/COPYING /usr/share/doc/pkgconf/DCO"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 44352 to 64051 (+44%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 300257 to 502849 (+67%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0", added "/usr/lib/libpkgconf.so.8.0.0 /usr/lib/libpkgconf.so.8 /usr/bin/spdxtool"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 174738 to 258933 (+48%)
Changes to packages/x86-64-v3-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.7.0.0 to libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7.0.0 moved to /usr/lib/libpkgconf.so.8.0.0
  /usr/lib/libpkgconf.so.7 moved to /usr/lib/libpkgconf.so.8
  /usr/bin/spdxtool was added

--===============5418094843759472859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.5.1-2.9.94.patch"

RnJvbSA4ZjExZmVmODhmYWZmM2RjNWU5MTE5ODZiNjE4MzdmMTFhNzk0ZDhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDU6NDA6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuNS4xIC0+IDIuOS45NAoKLS0tCiAuLi4ve3BrZ2NvbmZfMi41LjEu
YmIgPT4gcGtnY29uZl8yLjkuOTQuYmJ9ICAgfCAyNCArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi97cGtnY29uZl8yLjUuMS5iYiA9PiBwa2djb25mXzIu
OS45NC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29u
Zi9wa2djb25mXzIuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29u
Zl8yLjkuOTQuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjkuOTQuYmIKaW5kZXggMjc3ZWY5Nzg2Yy4uMmIz
ZTUwZGQ4NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29u
Zl8yLjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIu
OS45NC5iYgpAQCAtMSwzICsxLDIzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORwor
IyArKysgQ09QWUlORworIyBAQCAtMSw1ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAxMSwg
MjAxMiwgMjAxMywgMjAxNCwgMjAxNSwgMjAxNiwgMjAxNywgMjAxOAorIyAtICAgIHBrZ2NvbmYg
YXV0aG9ycyAoc2VlIEFVVEhPUlMgZmlsZSBpbiBzb3VyY2UgZGlyZWN0b3J5KS4KKyMgK0NvcHly
aWdodCAoYykgMjAxMS0yMDI2IHBrZ2NvbmYgYXV0aG9ycyAoc2VlIEFVVEhPUlMgZmlsZSBpbiBz
b3VyY2UgZGlyZWN0b3J5KS4KKyMgIAorIyAgUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlm
eSwgYW5kL29yIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBmb3IgYW55CisjICBwdXJwb3NlIHdp
dGggb3Igd2l0aG91dCBmZWUgaXMgaGVyZWJ5IGdyYW50ZWQsIHByb3ZpZGVkIHRoYXQgdGhlIGFi
b3ZlCisjIAorIworCiBTVU1NQVJZID0gInBrZ2NvbmYgcHJvdmlkZXMgY29tcGlsZXIgYW5kIGxp
bmtlciBjb25maWd1cmF0aW9uIGZvciBkZXZlbG9wbWVudCBmcmFtZXdvcmtzLiIKIERFU0NSSVBU
SU9OID0gInBrZ2NvbmYgaXMgYSBwcm9ncmFtIHdoaWNoIGhlbHBzIHRvIGNvbmZpZ3VyZSBjb21w
aWxlciBhbmQgbGlua2VyIFwKIGZsYWdzIGZvciBkZXZlbG9wbWVudCBmcmFtZXdvcmtzLiBJdCBp
cyBzaW1pbGFyIHRvIHBrZy1jb25maWcgZnJvbSBcCkBAIC0xMiw3ICszMiw3IEBAIFJQUk9WSURF
Uzoke1BOfSArPSAicGtnY29uZmlnIgogIyBUaGUgcGtnY29uZiBsaWNlbnNlIHNlZW1zIHRvIGJl
IGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvIEJTRC0yLUNsYXVzZSBvcgogIyBJU0MsIGJ1dCBo
YXMgZGlmZmVyZW50IHdvcmRpbmcsIHNvIG5lZWRzIGl0cyBvd24gbmFtZS4KIExJQ0VOU0UgPSAi
cGtnY29uZiIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTIyMTQyMjJl
YzFhODIwYmQ2Y2M3NTE2N2E1NjkyNWUwIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9MWUzM2MyOTdmMzVlMTY1ZWNmNGZiYzgxOTc0ZGM5Y2EiCiAKIFNSQ19VUkkgPSAi
XAogICAgIGh0dHBzOi8vZGlzdGZpbGVzLmFyaWFkbmUuc3BhY2UvcGtnY29uZi9wa2djb25mLSR7
UFZ9LnRhci54eiBcCkBAIC0yMCw3ICs0MCw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly9w
a2ctY29uZmlnLW5hdGl2ZS5pbiBcCiAgICAgZmlsZTovL3BrZy1jb25maWctZXNkay5pbiBcCiAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2QwNWM5NTg5YjlmODZlY2YwNDRjMTBhMjI2OTgyMmJj
OWViMDAxZWNlZDI1ODJjZmZmZDY1OGIwYTUwYzI0MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIy
Y2RjNDJiMTdlY2FlODY4ODk0NTY5YzAzNDYwNGYwNTg2NmUwOWEwNmJmN2U1NGExMGU4YjM3ZTUy
NGEwN2U2IgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============5418094843759472859==--

