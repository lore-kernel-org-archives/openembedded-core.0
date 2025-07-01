Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2ACC83F2C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1403.1751386801499103242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R+LjS0e9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fQgdlgow;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010197c6c9f279-7f66e79e-c78f-4a9a-bd98-6296546ffcd2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XeN+MA0Y6W98jyUngdk+aOyz4SUgYtV6dwYzYGQbDvw=;
	b=R+LjS0e9sek47ERlfkz75B6x23a4MluIuTllx6qwoakH1pHjkfJtx/PzV8o8hmHB
	WCmHlIP0A7EyJ1twEneip2eEeFUA/Igz60hnzb/FE0G1CWptdaJ3nrYdYlOUIg88EcL
	nrKqP80f00s30xX9gtHYLtCu/LWVwCch3xMIKJFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XeN+MA0Y6W98jyUngdk+aOyz4SUgYtV6dwYzYGQbDvw=;
	b=fQgdlgownKmIZYNP673Bdfs3LOoClutYO2YNIAV1Fmx8h8zIjXmachM1iycgShFh
	49uWJcwQ7X7/qkEhfU1GkVtpHWRofLZSpWyw+BW84DdRM+EXt8Y+WhbE0FtzIDT0M0m
	J3XldeuXcYN5WqPY0hZgtoqBnS3dI9wmQ+1NqQpQ=
Content-Type: multipart/mixed; boundary="===============7643958564767768305=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.13.0 SUCCEEDED
Message-ID: <01010197c6c9f279-7f66e79e-c78f-4a9a-bd98-6296546ffcd2-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219633

--===============7643958564767768305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ninja* to *1.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.12.1-1.13.0.patch
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
From 8e1c51189e0b6f2e96088a03715d8d4ef74ffddc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:41:42 +0000
Subject: [PATCH] ninja: upgrade 1.12.1 -> 1.13.0

---
 .../recipes-devtools/ninja/{ninja_1.12.1.bb => ninja_1.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.12.1.bb => ninja_1.13.0.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.12.1.bb b/meta/recipes-devtools/ninja/ninja_1.13.0.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.12.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.0.bb
index 5aff82edec..fbc5a43d7d 100644
--- a/meta/recipes-devtools/ninja/ninja_1.12.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "2daa09ba270b0a43e1929d29b073348aa985dfaa"
+SRCREV = "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.47.1


--===============7643958564767768305==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.12.1-1.13.0.patch"

RnJvbSA4ZTFjNTExODllMGI2ZjJlOTYwODhhMDM3MTVkOGQ0ZWY3NGZmZGRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODo0MTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5p
bmphOiB1cGdyYWRlIDEuMTIuMSAtPiAxLjEzLjAKCi0tLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMv
bmluamEve25pbmphXzEuMTIuMS5iYiA9PiBuaW5qYV8xLjEzLjAuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL25pbmphL3tuaW5qYV8xLjEyLjEuYmIgPT4gbmluamFfMS4xMy4wLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjEy
LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4xMy4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9u
aW5qYV8xLjEyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5q
YV8xLjEzLjAuYmIKaW5kZXggNWFmZjgyZWRlYy4uZmJjNWE0M2Q3ZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTIuMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4xMy4wLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hODE1ODZhNjRhZDRlNDc2Yzc5MWNkYTdl
MmYyYzUyZSIKIAogREVQRU5EUyA9ICJyZTJjLW5hdGl2ZSBuaW5qYS1uYXRpdmUiCiAKLVNSQ1JF
ViA9ICIyZGFhMDliYTI3MGIwYTQzZTE5MjlkMjliMDczMzQ4YWE5ODVkZmFhIgorU1JDUkVWID0g
ImI0ZDUxZjZlZDViZWQwOWRkMmI3MDMyNGRmMGQ5Y2I0ZWNhZDI2MzgiCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9uaW5qYS1idWlsZC9uaW5qYS5naXQ7YnJhbmNoPXJlbGVhc2U7cHJv
dG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+Liop
IgotLSAKMi40Ny4xCgo=

--===============7643958564767768305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 7410960 to 8674328 (+17%)
packages/core2-64-poky-linux/ninja/ninja-src: PKGSIZE changed from 427205 to 556073 (+30%)
packages/core2-64-poky-linux/ninja/ninja: PKGSIZE changed from 313648 to 367056 (+17%)

--===============7643958564767768305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ninja: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja-dbg: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 7410960 to 8674328 (+17%)
packages/core2-64-poky-linux/ninja/ninja-dbg: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja-dev: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja-dev: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja-doc: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja-doc: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja-locale: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja-locale: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja-src: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja-src: PKGSIZE changed from 427205 to 556073 (+30%)
packages/core2-64-poky-linux/ninja/ninja-src: FILELIST: directory renamed /usr/src/debug/ninja/1.12.1/build -> /usr/src/debug/ninja/1.13.0/build, removed "/usr/src/debug/ninja/1.12.1/src/manifest_parser.h /usr/src/debug/ninja/1.12.1/src/ninja.cc /usr/src/debug/ninja/1.12.1/src/build.h /usr/src/debug/ninja/1.12.1/src/browse.h /usr/src/debug/ninja/1.12.1/src/lexer.cc /usr/src/debug/ninja/1.12.1/src/util.h /usr/src/debug/ninja/1.12.1/src/string_piece_util.cc /usr/src/debug/ninja/1.12.1/src/json.h /usr/src/debug/ninja/1.12.1/src/build_log.h /usr/src/debug/ninja/1.12.1/src/debug_flags.h /usr/src/debug/ninja/1.12.1/src/eval_env.cc /usr/src/debug/ninja/1.12.1/src/parser.cc /usr/src/debug/ninja/1.12.1/src/graphviz.cc /usr/src/debug/ninja/1.12.1/src/hash_map.h /usr/src/debug/ninja/1.12.1/src/metrics.cc /usr/src/debug/ninja/1.12.1/src/missing_deps.cc /usr/src/debug/ninja/1.12.1/src/edit_distance.h /usr/src/debug/ninja/1.12.1/src/parser.h /usr/src/debug/ninja/1.12.1/src/metrics.h /usr/src/debug
 /ninja/1.12.1/src/json.cc /usr/src/debug/ninja/1.12.1/src/clean.cc /usr/src/debug/ninja/1.12.1/src/clparser.cc /usr/src/debug/ninja/1.12.1/src/disk_interface.h /usr/src/debug/ninja/1.12.1/src/graph.h /usr/src/debug/ninja/1.12.1/src/clparser.h /usr/src/debug/ninja/1.12.1/src/graphviz.h /usr/src/debug/ninja/1.12.1/src/disk_interface.cc /usr/src/debug/ninja/1.12.1/src/depfile_parser.cc /usr/src/debug/ninja/1.12.1/src/lexer.h /usr/src/debug/ninja/1.12.1/src/deps_log.h /usr/src/debug/ninja/1.12.1/src/depfile_parser.h /usr/src/debug/ninja/1.12.1/src/eval_env.h /usr/src/debug/ninja/1.12.1/src/manifest_parser.cc /usr/src/debug/ninja/1.12.1/src/version.h /usr/src/debug/ninja/1.12.1/src/deps_log.cc /usr/src/debug/ninja/1.12.1/src/state.h /usr/src/debug/ninja/1.12.1/src/subprocess.h /usr/src/debug/ninja/1.12.1/src/state.cc /usr/src/debug/ninja/1.12.1/src/string_piece.h /usr/src/debug/ninja/1.12.1/src/browse.cc /usr/src/debug/ninja/1.12.1/src/subprocess-posix.cc /usr/src/debug/ninja/1.12.1/src/
 dyndep.cc /usr/src/debug/ninja/1.12.1/src/version.cc /usr/src/debug/ninja/1.12.1/src/missing_deps.h /usr/src/debug/ninja/1.12.1/src/string_piece_util.h /usr/src/debug/ninja/1.12.1/src/dyndep_parser.cc /usr/src/debug/ninja/1.12.1/src/clean.h /usr/src/debug/ninja/1.12.1/src/load_status.h /usr/src/debug/ninja/1.12.1/src/graph.cc /usr/src/debug/ninja/1.12.1/src/dyndep.h /usr/src/debug/ninja/1.12.1/src/util.cc /usr/src/debug/ninja/1.12.1/src/status.cc /usr/src/debug/ninja/1.12.1/src/exit_status.h /usr/src/debug/ninja/1.12.1/src/build_log.cc /usr/src/debug/ninja/1.12.1/src/line_printer.cc /usr/src/debug/ninja/1.12.1/src/line_printer.h /usr/src/debug/ninja/1.12.1/src/build.cc /usr/src/debug/ninja/1.12.1/src/dyndep_parser.h /usr/src/debug/ninja/1.12.1/src/timestamp.h /usr/src/debug/ninja/1.12.1/src/edit_distance.cc /usr/src/debug/ninja/1.12.1/src/debug_flags.cc /usr/src/debug/ninja/1.12.1/src/status.h", added "/usr/src/debug/ninja/1.13.0/src/clparser.h /usr/src/debug/ninja/1.13.0/src/metric
 s.h /usr/src/debug/ninja/1.13.0/src/status.h /usr/src/debug/ninja/1.13.0/src/depfile_parser.h /usr/src/debug/ninja/1.13.0/src/dyndep_parser.h /usr/src/debug/ninja/1.13.0/src/missing_deps.h /usr/src/debug/ninja/1.13.0/src/clean.h /usr/src/debug/ninja/1.13.0/src/status_printer.h /usr/src/debug/ninja/1.13.0/src/graph.h /usr/src/debug/ninja/1.13.0/src/json.cc /usr/src/debug/ninja/1.13.0/src/third_party/rapidhash/rapidhash.h /usr/src/debug/ninja/1.13.0/src/depfile_parser.cc /usr/src/debug/ninja/1.13.0/src/jobserver-posix.cc /usr/src/debug/ninja/1.13.0/src/status_printer.cc /usr/src/debug/ninja/1.13.0/src/timestamp.h /usr/src/debug/ninja/1.13.0/src/eval_env.h /usr/src/debug/ninja/1.13.0/src/line_printer.h /usr/src/debug/ninja/1.13.0/src/string_piece_util.h /usr/src/debug/ninja/1.13.0/src/edit_distance.cc /usr/src/debug/ninja/1.13.0/src/disk_interface.cc /usr/src/debug/ninja/1.13.0/src/deps_log.h /usr/src/debug/ninja/1.13.0/src/jobserver.cc /usr/src/debug/ninja/1.13.0/src/real_command_runn
 er.cc /usr/src/debug/ninja/1.13.0/src/command_collector.h /usr/src/debug/ninja/1.13.0/src/string_piece_util.cc /usr/src/debug/ninja/1.13.0/src/util.h /usr/src/debug/ninja/1.13.0/src/graph.cc /usr/src/debug/ninja/1.13.0/src/parser.cc /usr/src/debug/ninja/1.13.0/src/eval_env.cc /usr/src/debug/ninja/1.13.0/src/debug_flags.cc /usr/src/debug/ninja/1.13.0/src/state.cc /usr/src/debug/ninja/1.13.0/src/build_log.h /usr/src/debug/ninja/1.13.0/src/dyndep.h /usr/src/debug/ninja/1.13.0/src/json.h /usr/src/debug/ninja/1.13.0/src/exit_status.h /usr/src/debug/ninja/1.13.0/src/string_piece.h /usr/src/debug/ninja/1.13.0/src/line_printer.cc /usr/src/debug/ninja/1.13.0/src/manifest_parser.cc /usr/src/debug/ninja/1.13.0/src/edit_distance.h /usr/src/debug/ninja/1.13.0/src/parser.h /usr/src/debug/ninja/1.13.0/src/manifest_parser.h /usr/src/debug/ninja/1.13.0/src/graphviz.cc /usr/src/debug/ninja/1.13.0/src/subprocess-posix.cc /usr/src/debug/ninja/1.13.0/src/debug_flags.h /usr/src/debug/ninja/1.13.0/src/mis
 sing_deps.cc /usr/src/debug/ninja/1.13.0/src/lexer.h /usr/src/debug/ninja/1.13.0/src/build.h /usr/src/debug/ninja/1.13.0/src/version.h /usr/src/debug/ninja/1.13.0/src/version.cc /usr/src/debug/ninja/1.13.0/src/third_party/emhash/hash_table8.hpp /usr/src/debug/ninja/1.13.0/src/elide_middle.cc /usr/src/debug/ninja/1.13.0/src/elide_middle.h /usr/src/debug/ninja/1.13.0/src/util.cc /usr/src/debug/ninja/1.13.0/src/state.h /usr/src/debug/ninja/1.13.0/src/build.cc /usr/src/debug/ninja/1.13.0/src/subprocess.h /usr/src/debug/ninja/1.13.0/src/build_log.cc /usr/src/debug/ninja/1.13.0/src/graphviz.h /usr/src/debug/ninja/1.13.0/src/clean.cc /usr/src/debug/ninja/1.13.0/src/browse.h /usr/src/debug/ninja/1.13.0/src/browse.cc /usr/src/debug/ninja/1.13.0/src/clparser.cc /usr/src/debug/ninja/1.13.0/src/explanations.h /usr/src/debug/ninja/1.13.0/src/jobserver.h /usr/src/debug/ninja/1.13.0/src/lexer.cc /usr/src/debug/ninja/1.13.0/src/dyndep.cc /usr/src/debug/ninja/1.13.0/src/load_status.h /usr/src/debug/
 ninja/1.13.0/src/hash_map.h /usr/src/debug/ninja/1.13.0/src/metrics.cc /usr/src/debug/ninja/1.13.0/src/dyndep_parser.cc /usr/src/debug/ninja/1.13.0/src/deps_log.cc /usr/src/debug/ninja/1.13.0/src/disk_interface.h /usr/src/debug/ninja/1.13.0/src/ninja.cc"
packages/core2-64-poky-linux/ninja/ninja-src: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja-staticdev: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.12.1 [default] to 1.13.0 [default]
packages/core2-64-poky-linux/ninja/ninja: PV changed from "1.12.1" to "1.13.0"
packages/core2-64-poky-linux/ninja/ninja: PKGSIZE changed from 313648 to 367056 (+17%)
packages/core2-64-poky-linux/ninja/ninja: PKGV changed from 1.12.1 [default] to 1.13.0 [default]

--===============7643958564767768305==--

