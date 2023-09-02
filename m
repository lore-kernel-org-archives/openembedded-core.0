Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6852CCA1019
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5677.1693650553246216440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZaSCgzYC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KfCjcmDJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a5570867a-a5aa0d3f-f950-4a23-9cf0-0e6ec21736bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5J4jo39J9njlxkv2LK/59Q2AUbj0FzBVfu0CdzqYc9A=;
	b=ZaSCgzYCSUbd3eFXtuiG6Ozj3Hn44eov96tpMWzX5EhesXt3nQ2or3h0EsWbWpXP
	QKzskWjOVCoJvI8VM3arGJk5NHLwM1ced9+SkL5GS29N/2HmZDYqqifCN5k06altY4V
	+kweqnJRQvv9ZyF/Udkdnof5Ro0GSTyRJAkFDTKg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5J4jo39J9njlxkv2LK/59Q2AUbj0FzBVfu0CdzqYc9A=;
	b=KfCjcmDJrM5km0tGomHtjCbmAlAimkOY1ZLwOllfPoe9/Hd1HbtPUcrAODRJL7aE
	OmmpXvaogom2QgtW4hoTRusnzkuymp5aAg/3v5JpgqhRuILajIBFeIpME0sOHnmsDCC
	sa84T01QU99fIqeUesN1T8N7ZbC8scgICO63K0c8=
Content-Type: multipart/mixed; boundary="===============5812747192802598064=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-c: upgrading to 0.17 SUCCEEDED
Message-ID: <0101018a5570867a-a5aa0d3f-f950-4a23-9cf0-0e6ec21736bf-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187058

--===============5812747192802598064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *json-c* to *0.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-c-upgrade-0.16-0.17.patch
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
From 15f176032f86719f375e04f587d6828dc8809ed0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 12:14:28 +0000
Subject: [PATCH] json-c: upgrade 0.16 -> 0.17

---
 .../json-c/0001-Fix-build-with-clang-15.patch | 34 -------------------
 .../json-c/{json-c_0.16.bb => json-c_0.17.bb} | 10 +++---
 2 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
 rename meta/recipes-devtools/json-c/{json-c_0.16.bb => json-c_0.17.bb} (78%)

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
deleted file mode 100644
index 215f4d829a..0000000000
--- a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0145b575ac1fe6a77e00d639864f26fc91ceb12f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Aug 2022 20:37:03 -0700
-Subject: [PATCH] Fix build with clang-15+
-
-Fixes
-json_util.c:63:35: error: a function declaration without a prototype is deprecated in all versions of C [-We
-rror,-Wstrict-prototypes]
-const char *json_util_get_last_err()
-                                  ^
-                                   void
-
-Upstream-Status: Backport [https://github.com/json-c/json-c/pull/783]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- json_util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_util.c b/json_util.c
-index 952770a..83d9c68 100644
---- a/json_util.c
-+++ b/json_util.c
-@@ -60,7 +60,7 @@ static int _json_object_to_fd(int fd, struct json_object *obj, int flags, const
- 
- static char _last_err[256] = "";
- 
--const char *json_util_get_last_err()
-+const char *json_util_get_last_err(void)
- {
- 	if (_last_err[0] == '\0')
- 		return NULL;
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
similarity index 78%
rename from meta/recipes-devtools/json-c/json-c_0.16.bb
rename to meta/recipes-devtools/json-c/json-c_0.17.bb
index 3aba41dfcf..aff5ad5076 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -4,12 +4,10 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = " \
-    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-    file://0001-Fix-build-with-clang-15.patch \
-    file://run-ptest \
-"
-SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
-- 
2.39.2


--===============5812747192802598064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/json-c/json-c-dbg: PKGSIZE changed from 549028 to 590620 (+8%)
packages/core2-32-poky-linux/json-c/json-c-dbg: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-dbg: FILELIST: removed "/usr/lib/.debug/libjson-c.so.5.2.0", added "/usr/lib/.debug/libjson-c.so.5.3.0 /usr/lib/json-c/ptest/tests/.debug/test_int_get /usr/lib/json-c/ptest/tests/.debug/test_json_patch"
packages/core2-32-poky-linux/json-c/json-c-dbg: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-dev: PKGSIZE changed from 107760 to 111942 (+4%)
packages/core2-32-poky-linux/json-c/json-c-dev: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-dev: FILELIST: added "/usr/include/json-c/json_patch.h"
packages/core2-32-poky-linux/json-c/json-c-dev: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-doc: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-doc: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-locale: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-locale: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-ptest: PKGSIZE changed from 449388 to 503686 (+12%)
packages/core2-32-poky-linux/json-c/json-c-ptest: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-ptest: FILELIST: added "/usr/lib/json-c/ptest/tests/test_int_get.expected /usr/lib/json-c/ptest/tests/test_json_patch /usr/lib/json-c/ptest/tests/test_json_patch.test /usr/lib/json-c/ptest/tests/test_json_patch.expected /usr/lib/json-c/ptest/tests/test_int_get /usr/lib/json-c/ptest/tests/test_int_get.test"
packages/core2-32-poky-linux/json-c/json-c-ptest: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-src: PKGSIZE changed from 363315 to 395147 (+9%)
packages/core2-32-poky-linux/json-c/json-c-src: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-src: FILELIST: removed "/usr/src/debug/json-c/0.16-r0/tests/parse_flags.h /usr/src/debug/json-c/0.16-r0/linkhash.c /usr/src/debug/json-c/0.16-r0/linkhash.h /usr/src/debug/json-c/0.16-r0/tests/test_double_serializer.c /usr/src/debug/json-c/0.16-r0/tests/test_set_serializer.c /usr/src/debug/json-c/0.16-r0/tests/parse_flags.c /usr/src/debug/json-c/0.16-r0/tests/test_json_pointer.c /usr/src/debug/json-c/0.16-r0/strerror_override.h /usr/src/debug/json-c/0.16-r0/tests/test_visit.c /usr/src/debug/json-c/0.16-r0/tests/test_util_file.c /usr/src/debug/json-c/0.16-r0/json_tokener.c /usr/src/debug/json-c/0.16-r0/strerror_override.c /usr/src/debug/json-c/0.16-r0/tests/test_float.c /usr/src/debug/json-c/0.16-r0/tests/test_strerror.c /usr/src/debug/json-c/0.16-r0/json_object_iterator.c /usr/src/debug/json-c/0.16-r0/json_util.c /usr/src/debug/json-c/0.16-r0/tests/test1.c /usr/src/debug/json-c/0.16-r0/json_object.c /usr/src/debug/json-c/0.16-r0/arraylist.c /
 usr/src/debug/json-c/0.16-r0/debug.c /usr/src/debug/json-c/0.16-r0/arraylist.h /usr/src/debug/json-c/0.16-r0/json_object_iterator.h /usr/src/debug/json-c/0.16-r0/json_util.h /usr/src/debug/json-c/0.16-r0/json_object.h /usr/src/debug/json-c/0.16-r0/random_seed.c /usr/src/debug/json-c/0.16-r0/random_seed.h /usr/src/debug/json-c/0.16-r0/tests/test_locale.c /usr/src/debug/json-c/0.16-r0/tests/test_parse_int64.c /usr/src/debug/json-c/0.16-r0/json_c_version.c /usr/src/debug/json-c/0.16-r0/json_types.h /usr/src/debug/json-c/0.16-r0/json_visit.h /usr/src/debug/json-c/0.16-r0/tests/test2.c /usr/src/debug/json-c/0.16-r0/json_visit.c /usr/src/debug/json-c/0.16-r0/json_c_version.h /usr/src/debug/json-c/0.16-r0/tests/test_charcase.c /usr/src/debug/json-c/0.16-r0/tests/test_null.c /usr/src/debug/json-c/0.16-r0/tests/testReplaceExisting.c /usr/src/debug/json-c/0.16-r0/tests/test_object_iterator.c /usr/src/debug/json-c/0.16-r0/tests/test_cast.c /usr/src/debug/json-c/0.16-r0/printbuf.h /usr/src/debu
 g/json-c/0.16-r0/printbuf.c /usr/src/debug/json-c/0.16-r0/tests/test_parse.c /usr/src/debug/json-c/0.16-r0/tests/test_printbuf.c /usr/src/debug/json-c/0.16-r0/tests/test_deep_copy.c /usr/src/debug/json-c/0.16-r0/json_object_private.h /usr/src/debug/json-c/0.16-r0/tests/test_set_value.c /usr/src/debug/json-c/0.16-r0/json_pointer.h /usr/src/debug/json-c/0.16-r0/json_tokener.h /usr/src/debug/json-c/0.16-r0/tests/test_compare.c /usr/src/debug/json-c/0.16-r0/tests/test4.c /usr/src/debug/json-c/0.16-r0/tests/test_int_add.c /usr/src/debug/json-c/0.16-r0/json_pointer.c", added "/usr/src/debug/json-c/0.17-r0/tests/parse_flags.h /usr/src/debug/json-c/0.17-r0/linkhash.c /usr/src/debug/json-c/0.17-r0/linkhash.h /usr/src/debug/json-c/0.17-r0/tests/test_set_serializer.c /usr/src/debug/json-c/0.17-r0/tests/test_double_serializer.c /usr/src/debug/json-c/0.17-r0/tests/parse_flags.c /usr/src/debug/json-c/0.17-r0/tests/test_json_pointer.c /usr/src/debug/json-c/0.17-r0/strerror_override.h /usr/src/debu
 g/json-c/0.17-r0/tests/test_visit.c /usr/src/debug/json-c/0.17-r0/tests/test_util_file.c /usr/src/debug/json-c/0.17-r0/strerror_override.c /usr/src/debug/json-c/0.17-r0/tests/test_float.c /usr/src/debug/json-c/0.17-r0/tests/test_strerror.c /usr/src/debug/json-c/0.17-r0/json_object_iterator.c /usr/src/debug/json-c/0.17-r0/json_util.c /usr/src/debug/json-c/0.17-r0/tests/test1.c /usr/src/debug/json-c/0.17-r0/json_object.c /usr/src/debug/json-c/0.17-r0/arraylist.c /usr/src/debug/json-c/0.17-r0/debug.c /usr/src/debug/json-c/0.17-r0/arraylist.h /usr/src/debug/json-c/0.17-r0/json_object_iterator.h /usr/src/debug/json-c/0.17-r0/json_util.h /usr/src/debug/json-c/0.17-r0/json_object.h /usr/src/debug/json-c/0.17-r0/json_pointer_private.h /usr/src/debug/json-c/0.17-r0/tests/test_json_patch.c /usr/src/debug/json-c/0.17-r0/random_seed.c /usr/src/debug/json-c/0.17-r0/random_seed.h /usr/src/debug/json-c/0.17-r0/tests/test_locale.c /usr/src/debug/json-c/0.17-r0/tests/test_parse_int64.c /usr/src/debu
 g/json-c/0.17-r0/json_c_version.c /usr/src/debug/json-c/0.17-r0/json_patch.h /usr/src/debug/json-c/0.17-r0/json_types.h /usr/src/debug/json-c/0.17-r0/json_visit.h /usr/src/debug/json-c/0.17-r0/tests/test2.c /usr/src/debug/json-c/0.17-r0/json_patch.c /usr/src/debug/json-c/0.17-r0/json_c_version.h /usr/src/debug/json-c/0.17-r0/json_visit.c /usr/src/debug/json-c/0.17-r0/tests/test_charcase.c /usr/src/debug/json-c/0.17-r0/tests/test_null.c /usr/src/debug/json-c/0.17-r0/tests/testReplaceExisting.c /usr/src/debug/json-c/0.17-r0/tests/test_object_iterator.c /usr/src/debug/json-c/0.17-r0/tests/test_cast.c /usr/src/debug/json-c/0.17-r0/printbuf.h /usr/src/debug/json-c/0.17-r0/printbuf.c /usr/src/debug/json-c/0.17-r0/tests/test_parse.c /usr/src/debug/json-c/0.17-r0/tests/test_printbuf.c /usr/src/debug/json-c/0.17-r0/tests/test_deep_copy.c /usr/src/debug/json-c/0.17-r0/json_object_private.h /usr/src/debug/json-c/0.17-r0/tests/test_set_value.c /usr/src/debug/json-c/0.17-r0/json_tokener.c /usr/s
 rc/debug/json-c/0.17-r0/json_pointer.h /usr/src/debug/json-c/0.17-r0/json_tokener.h /usr/src/debug/json-c/0.17-r0/tests/test_compare.c /usr/src/debug/json-c/0.17-r0/tests/test4.c /usr/src/debug/json-c/0.17-r0/tests/test_int_add.c /usr/src/debug/json-c/0.17-r0/tests/test_int_get.c /usr/src/debug/json-c/0.17-r0/json_pointer.c"
packages/core2-32-poky-linux/json-c/json-c-src: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-staticdev: PKGSIZE changed from 255464 to 272192 (+7%)
packages/core2-32-poky-linux/json-c/json-c-staticdev: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-staticdev: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c: PKGSIZE changed from 71270 to 79462 (+11%)
packages/core2-32-poky-linux/json-c/json-c: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.2.0", added "/usr/lib/libjson-c.so.5.3.0"
packages/core2-32-poky-linux/json-c/json-c: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c: SRC_URI changed from "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.16.tar.gz file://0001-Fix-build-with-clang-15.patch file://run-ptest" to "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.17.tar.gz file://run-ptest"
packages/core2-32-poky-linux/json-c: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c: PV changed from "0.16" to "0.17"
Changes to packages/core2-32-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.2.0 to libjson-c.so.5.3.0
  /usr/lib/libjson-c.so.5.2.0 moved to /usr/lib/libjson-c.so.5.3.0
  /usr/include/json-c/json_patch.h was added

--===============5812747192802598064==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-c-upgrade-0.16-0.17.patch"

RnJvbSAxNWYxNzYwMzJmODY3MTlmMzc1ZTA0ZjU4N2Q2ODI4ZGM4ODA5ZWQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMjoxNDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpz
b24tYzogdXBncmFkZSAwLjE2IC0+IDAuMTcKCi0tLQogLi4uL2pzb24tYy8wMDAxLUZpeC1idWls
ZC13aXRoLWNsYW5nLTE1LnBhdGNoIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2pzb24t
Yy97anNvbi1jXzAuMTYuYmIgPT4ganNvbi1jXzAuMTcuYmJ9IHwgMTAgKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWMvMDAwMS1GaXgtYnVpbGQt
d2l0aC1jbGFuZy0xNS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMv
e2pzb24tY18wLjE2LmJiID0+IGpzb24tY18wLjE3LmJifSAoNzglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMvanNvbi1jLzAwMDEtRml4LWJ1aWxkLXdpdGgtY2xh
bmctMTUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1jL2pzb24tYy8wMDAxLUZp
eC1idWlsZC13aXRoLWNsYW5nLTE1LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAyMTVmNGQ4MjlhLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29u
LWMvanNvbi1jLzAwMDEtRml4LWJ1aWxkLXdpdGgtY2xhbmctMTUucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSwzNCArMCwwIEBACi1Gcm9tIDAxNDViNTc1YWMxZmU2YTc3ZTAwZDYzOTg2NGYyNmZj
OTFjZWIxMmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgotRGF0ZTogU2F0LCAxMyBBdWcgMjAyMiAyMDozNzowMyAtMDcwMAotU3Vi
amVjdDogW1BBVENIXSBGaXggYnVpbGQgd2l0aCBjbGFuZy0xNSsKLQotRml4ZXMKLWpzb25fdXRp
bC5jOjYzOjM1OiBlcnJvcjogYSBmdW5jdGlvbiBkZWNsYXJhdGlvbiB3aXRob3V0IGEgcHJvdG90
eXBlIGlzIGRlcHJlY2F0ZWQgaW4gYWxsIHZlcnNpb25zIG9mIEMgWy1XZQotcnJvciwtV3N0cmlj
dC1wcm90b3R5cGVzXQotY29uc3QgY2hhciAqanNvbl91dGlsX2dldF9sYXN0X2VycigpCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9qc29uLWMvanNvbi1jL3B1bGwvNzgzXQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGpzb25fdXRpbC5jIHwgMiArLQotIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvanNv
bl91dGlsLmMgYi9qc29uX3V0aWwuYwotaW5kZXggOTUyNzcwYS4uODNkOWM2OCAxMDA2NDQKLS0t
LSBhL2pzb25fdXRpbC5jCi0rKysgYi9qc29uX3V0aWwuYwotQEAgLTYwLDcgKzYwLDcgQEAgc3Rh
dGljIGludCBfanNvbl9vYmplY3RfdG9fZmQoaW50IGZkLCBzdHJ1Y3QganNvbl9vYmplY3QgKm9i
aiwgaW50IGZsYWdzLCBjb25zdAotIAotIHN0YXRpYyBjaGFyIF9sYXN0X2VyclsyNTZdID0gIiI7
Ci0gCi0tY29uc3QgY2hhciAqanNvbl91dGlsX2dldF9sYXN0X2VycigpCi0rY29uc3QgY2hhciAq
anNvbl91dGlsX2dldF9sYXN0X2Vycih2b2lkKQotIHsKLSAJaWYgKF9sYXN0X2VyclswXSA9PSAn
XDAnKQotIAkJcmV0dXJuIE5VTEw7Ci0tLSAKLTIuMzcuMgotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvanNvbi1jL2pzb24tY18wLjE2LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2pzb24tYy9qc29uLWNfMC4xNy5iYgpzaW1pbGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1jL2pzb24tY18wLjE2LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1jL2pzb24tY18wLjE3LmJiCmluZGV4IDNhYmE0MWRm
Y2YuLmFmZjVhZDUwNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMv
anNvbi1jXzAuMTYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWNf
MC4xNy5iYgpAQCAtNCwxMiArNCwxMCBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
anNvbi1jL2pzb24tYy93aWtpIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1kZTU0YjYwZmJiYzM1MTIzYmExOTNmZWE4ZWUyMTZmMiIKIAot
U1JDX1VSSSA9ICIgXAotICAgIGh0dHBzOi8vczMuYW1hem9uYXdzLmNvbS9qc29uLWNfcmVsZWFz
ZXMvcmVsZWFzZXMvJHtCUH0udGFyLmd6IFwKLSAgICBmaWxlOi8vMDAwMS1GaXgtYnVpbGQtd2l0
aC1jbGFuZy0xNS5wYXRjaCBcCi0gICAgZmlsZTovL3J1bi1wdGVzdCBcCi0iCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOGU0NWFjOGY5NmVjNzc5MWVhZjNiYjdlZTUwZTljMjEwMGJiYmM4N2I4ZDBm
MWQwMzBjNWJhOGEwMjg4ZDk2YiIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9zMy5hbWF6b25hd3MuY29t
L2pzb24tY19yZWxlYXNlcy9yZWxlYXNlcy8ke0JQfS50YXIuZ3ogXAorICAgICAgICAgICBmaWxl
Oi8vcnVuLXB0ZXN0IFwKKyAgICAgICAgICAgIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc1NTA5
MTRkNThmYjYzYjJjMzU0NmYzY2NmYmUxMWYxYzA5NDE0N2JkMzFhNjlkY2QyMzcxNGQ3OTU2MTU5
ZTYiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vJHtCUE59LyR7
QlBOfS90YWdzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAianNvbi1jLSg/UDxwdmVyPlxkKyhc
LlxkKykrKS1cZCsiCi0tIAoyLjM5LjIKCg==

--===============5812747192802598064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/json-c/json-c-dev: FILELIST: added "/usr/include/json-c/json_patch.h"
packages/core2-32-poky-linux/json-c/json-c-ptest: FILELIST: added "/usr/lib/json-c/ptest/tests/test_json_patch /usr/lib/json-c/ptest/tests/test_int_get.expected /usr/lib/json-c/ptest/tests/test_int_get.test /usr/lib/json-c/ptest/tests/test_json_patch.test /usr/lib/json-c/ptest/tests/test_int_get /usr/lib/json-c/ptest/tests/test_json_patch.expected"
packages/core2-32-poky-linux/json-c/json-c-ptest: PKGSIZE changed from 449388 to 503686 (+12%)
packages/core2-32-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.2.0", added "/usr/lib/libjson-c.so.5.3.0"
packages/core2-32-poky-linux/json-c/json-c: PKGSIZE changed from 71270 to 79462 (+11%)
Changes to packages/core2-32-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.2.0 to libjson-c.so.5.3.0
  /usr/lib/libjson-c.so.5.2.0 moved to /usr/lib/libjson-c.so.5.3.0
  /usr/include/json-c/json_patch.h was added

--===============5812747192802598064==--

