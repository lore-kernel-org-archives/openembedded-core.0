Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D9FCD8CB9
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1566.1780328135645243064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CpfteMi0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rbhMcLC8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d3afb4-cf07850d-7c8b-4838-a52d-d7f53d4261dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZMz4z33Ls8TdE8fHLGkk64M/MlqhaSH+bqk0+XVwUN4=;
	b=CpfteMi0MhxsZU3vUTaIGc3zNqYmiPp0pC51RWo2AZx/w5SabSAtkf1+lZbQF49F
	cozOP05hsqHi4sawSEad9s4jAPtrChF6KnT+CIMRAGHLxb/ketUG4mXWwF2mntYTrxq
	ufs2+oq6yt5BSaBm26TNJu8SFIz3lEO5EV3VzwC8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZMz4z33Ls8TdE8fHLGkk64M/MlqhaSH+bqk0+XVwUN4=;
	b=rbhMcLC8KuT7OCk84sGigWAW9rITW+ojJI5PkJsbFEwms3HAwekwwQE4nkxnwsIi
	cwPddatI2xwBaaHgydAFgfP9C9holPhyY1hbu3Hr2DQDf7eqzBazNeMT16xacGYfeZf
	fojlcj/YFLNlLxmJzF31qEYX4qV6g98h2zSi2CIs=
Content-Type: multipart/mixed; boundary="===============3966168473366297922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.18.0 SUCCEEDED
Message-ID: <0101019e83d3afb4-cf07850d-7c8b-4838-a52d-d7f53d4261dc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237918

--===============3966168473366297922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fontconfig* to *2.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fontconfig-upgrade-2.17.1-2.18.0.patch
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
From 27ba0ac578a9c5a321bfc1d2c31997bb3ede1075 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:15:17 +0000
Subject: [PATCH] fontconfig: upgrade 2.17.1 -> 2.18.0

---
 ...ded-missing-target-rule-dependencies.patch | 31 ---------
 .../fontconfig/fontconfig/musl-fix.patch      | 66 -------------------
 .../fontconfig/revert-static-pkgconfig.patch  |  8 +++
 ...tconfig_2.17.1.bb => fontconfig_2.18.0.bb} |  4 +-
 4 files changed, 9 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.17.1.bb => fontconfig_2.18.0.bb} (92%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
deleted file mode 100644
index 40b25cc926..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0bba79bfd3d8a216794d15af97ce4abefd4b8748 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Florian=20=22sp1rit=22=E2=80=8B?= <sp1rit@disroot.org>
-Date: Sat, 9 Aug 2025 20:22:43 +0200
-Subject: [PATCH] build: Added missing target rule-dependencies
-
-02b835b62 did not appropriately ensure, that the patternlib_internal
-target waits until the {ft_,}alias_headers have finished generating the
-headers that it depends on.
-
-Upstream-Status: Backport [0bba79bfd3d8a216794d15af97ce4abefd4b8748]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index c4d65d6c..10866aa8 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -9,7 +9,7 @@ endif
- # Factor our pattern manipulation code into its own library
- # to break the depedency cycle:
- # FontConfig pattern handling - Fontations code - FontConfig.
--pattern_sources = [ 'fcpat.c', fcstdint_h, fclang_h ]
-+pattern_sources = [ 'fcpat.c', fcstdint_h, fclang_h, alias_headers, ft_alias_headers ]
- pattern_lib = static_library('patternlib_internal',
-                                     pattern_sources,
-                                     include_directories: incbase,
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch b/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
deleted file mode 100644
index c4508bd15a..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 75cc3e6ef0e451f42d3464ed4d639304ad9a4f58 Mon Sep 17 00:00:00 2001
-From: Akira TAGOH <akira@tagoh.org>
-Date: Thu, 3 Jul 2025 03:31:49 +0900
-Subject: [PATCH] test: Fix a build issue with musl libc
-
-Fixes https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/484
-
-Changelog: fixed
-Upstream-Status: Backport [https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/75cc3e6ef0e451f42d3464ed4d639304ad9a4f58]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- test/test-mt-fccfg.c | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/test/test-mt-fccfg.c b/test/test-mt-fccfg.c
-index 24ad7583..3b7d843d 100644
---- a/test/test-mt-fccfg.c
-+++ b/test/test-mt-fccfg.c
-@@ -1,9 +1,12 @@
- /* Copyright (C) 2025 fontconfig Authors */
- /* SPDX-License-Identifier: HPND */
-+#ifdef HAVE_CONFIG_H
-+#  include "config.h"
-+#endif
-+
- #include <fontconfig/fontconfig.h>
- 
- #include <stdio.h>
--#define __USE_XOPEN
- #include <pthread.h>
- #include <stdlib.h>
- 
-@@ -13,6 +16,21 @@ struct thr_arg_s {
-     int thr_num;
- };
- 
-+#ifdef _WIN32
-+int
-+setenv (const char *name, const char *value, int o)
-+{
-+    size_t len = strlen (name) + strlen (value) + 1;
-+    char  *s = malloc (len + 1);
-+    int    ret;
-+
-+    snprintf (s, len, "%s=%s", name, value);
-+    ret = _putenv (s);
-+    free (s);
-+    return ret;
-+}
-+#endif
-+
- static void *
- run_test_in_thread (void *arg)
- {
-@@ -61,7 +79,7 @@ test (void)
-     if (c1 == c2)
- 	return 1;
-     /* To make visible if we have any references */
--    putenv ("FC_DEBUG=16");
-+    setenv ("FC_DEBUG", "16", 1);
-     FcFini();
- 
-     return 0;
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index 30d6423037..2eb548783b 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -1,3 +1,8 @@
+From ccd98685b3cd1f9c5f674d2807d32f1956a47ec4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Apr 2015 20:35:32 -0700
+Subject: [PATCH] fontconfig: Fix pkgconfig file generation to not have
+
 Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
 We really dont do static linking so its not going to cause issues for us but as such this is harming us by adding absolute
 paths into -I options into fontconfig.pc which is them prepended with sysroot when read back by cross pkg-config and
@@ -7,6 +12,9 @@ gently refuses and rightly so.
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fontconfig.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/fontconfig.pc.in b/fontconfig.pc.in
 index 61b35fb..5bc9bab 100644
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.0.bb
similarity index 92%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.0.bb
index 0d0fcfcceb..7d356c409a 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.0.bb
@@ -22,10 +22,8 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 
 SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
-           file://musl-fix.patch \
-           file://0001-build-Added-missing-target-rule-dependencies.patch \
            "
-SRC_URI[sha256sum] = "9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541"
+SRC_URI[sha256sum] = "e7064a4725431ddba06ff8b971ec5a4b422e23b0169ce215747beedcb30e9073"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============3966168473366297922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGSIZE changed from 142368 to 156824 (+10%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: FILELIST: added "/usr/bin/fc-genconf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: FILELIST: removed "/usr/lib/libfontconfig.so.1.16.0", added "/usr/share/fontconfig/conf.avail/05-macos.conf /etc/fonts/conf.d/48-guessfamily.conf /etc/fonts/conf.d/05-macos.conf /usr/lib/libfontconfig.so.1.17.0"
Changes to packages/x86-64-v3-poky-linux/fontconfig (sysroot):
  /usr/lib/libfontconfig.so.1 changed symlink target from libfontconfig.so.1.16.0 to libfontconfig.so.1.17.0
  /usr/lib/libfontconfig.so.1.16.0 moved to /usr/lib/libfontconfig.so.1.17.0
  /usr/share/fontconfig/conf.avail/05-macos.conf was added

--===============3966168473366297922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.17.1-2.18.0.patch"

RnJvbSAyN2JhMGFjNTc4YTljNWEzMjFiZmMxZDJjMzE5OTdiYjNlZGUxMDc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMToxNToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZv
bnRjb25maWc6IHVwZ3JhZGUgMi4xNy4xIC0+IDIuMTguMAoKLS0tCiAuLi5kZWQtbWlzc2luZy10
YXJnZXQtcnVsZS1kZXBlbmRlbmNpZXMucGF0Y2ggfCAzMSAtLS0tLS0tLS0KIC4uLi9mb250Y29u
ZmlnL2ZvbnRjb25maWcvbXVzbC1maXgucGF0Y2ggICAgICB8IDY2IC0tLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLi9mb250Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoICB8ICA4ICsr
KwogLi4udGNvbmZpZ18yLjE3LjEuYmIgPT4gZm9udGNvbmZpZ18yLjE4LjAuYmJ9IHwgIDQgKy0K
IDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMDAgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZp
Zy8wMDAxLWJ1aWxkLUFkZGVkLW1pc3NpbmctdGFyZ2V0LXJ1bGUtZGVwZW5kZW5jaWVzLnBhdGNo
CiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9u
dGNvbmZpZy9tdXNsLWZpeC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250
Y29uZmlnL3tmb250Y29uZmlnXzIuMTcuMS5iYiA9PiBmb250Y29uZmlnXzIuMTguMC5iYn0gKDky
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29u
ZmlnLzAwMDEtYnVpbGQtQWRkZWQtbWlzc2luZy10YXJnZXQtcnVsZS1kZXBlbmRlbmNpZXMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnLzAwMDEtYnVp
bGQtQWRkZWQtbWlzc2luZy10YXJnZXQtcnVsZS1kZXBlbmRlbmNpZXMucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDQwYjI1Y2M5MjYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy8wMDAxLWJ1aWxkLUFkZGVkLW1p
c3NpbmctdGFyZ2V0LXJ1bGUtZGVwZW5kZW5jaWVzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MzEgKzAsMCBAQAotRnJvbSAwYmJhNzliZmQzZDhhMjE2Nzk0ZDE1YWY5N2NlNGFiZWZkNGI4NzQ4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP0Zsb3JpYW49MjA9MjJz
cDFyaXQ9MjI9RTI9ODA9OEI/PSA8c3Axcml0QGRpc3Jvb3Qub3JnPgotRGF0ZTogU2F0LCA5IEF1
ZyAyMDI1IDIwOjIyOjQzICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkOiBBZGRlZCBtaXNz
aW5nIHRhcmdldCBydWxlLWRlcGVuZGVuY2llcwotCi0wMmI4MzViNjIgZGlkIG5vdCBhcHByb3By
aWF0ZWx5IGVuc3VyZSwgdGhhdCB0aGUgcGF0dGVybmxpYl9pbnRlcm5hbAotdGFyZ2V0IHdhaXRz
IHVudGlsIHRoZSB7ZnRfLH1hbGlhc19oZWFkZXJzIGhhdmUgZmluaXNoZWQgZ2VuZXJhdGluZyB0
aGUKLWhlYWRlcnMgdGhhdCBpdCBkZXBlbmRzIG9uLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0IFswYmJhNzliZmQzZDhhMjE2Nzk0ZDE1YWY5N2NlNGFiZWZkNGI4NzQ4XQotU2lnbmVkLW9m
Zi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBzcmMvbWVzb24u
YnVpbGQgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvbWVzb24uYnVpbGQgYi9zcmMvbWVzb24uYnVpbGQKLWlu
ZGV4IGM0ZDY1ZDZjLi4xMDg2NmFhOCAxMDA2NDQKLS0tLSBhL3NyYy9tZXNvbi5idWlsZAotKysr
IGIvc3JjL21lc29uLmJ1aWxkCi1AQCAtOSw3ICs5LDcgQEAgZW5kaWYKLSAjIEZhY3RvciBvdXIg
cGF0dGVybiBtYW5pcHVsYXRpb24gY29kZSBpbnRvIGl0cyBvd24gbGlicmFyeQotICMgdG8gYnJl
YWsgdGhlIGRlcGVkZW5jeSBjeWNsZToKLSAjIEZvbnRDb25maWcgcGF0dGVybiBoYW5kbGluZyAt
IEZvbnRhdGlvbnMgY29kZSAtIEZvbnRDb25maWcuCi0tcGF0dGVybl9zb3VyY2VzID0gWyAnZmNw
YXQuYycsIGZjc3RkaW50X2gsIGZjbGFuZ19oIF0KLStwYXR0ZXJuX3NvdXJjZXMgPSBbICdmY3Bh
dC5jJywgZmNzdGRpbnRfaCwgZmNsYW5nX2gsIGFsaWFzX2hlYWRlcnMsIGZ0X2FsaWFzX2hlYWRl
cnMgXQotIHBhdHRlcm5fbGliID0gc3RhdGljX2xpYnJhcnkoJ3BhdHRlcm5saWJfaW50ZXJuYWwn
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhdHRlcm5fc291cmNlcywK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVz
OiBpbmNiYXNlLAotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy9tdXNsLWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvbXVzbC1maXgucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IGM0NTA4YmQxNWEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy9tdXNsLWZpeC5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDY2ICswLDAgQEAKLUZyb20gNzVjYzNlNmVmMGU0NTFmNDJkMzQ2NGVkNGQ2
MzkzMDRhZDlhNGY1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFraXJhIFRBR09I
IDxha2lyYUB0YWdvaC5vcmc+Ci1EYXRlOiBUaHUsIDMgSnVsIDIwMjUgMDM6MzE6NDkgKzA5MDAK
LVN1YmplY3Q6IFtQQVRDSF0gdGVzdDogRml4IGEgYnVpbGQgaXNzdWUgd2l0aCBtdXNsIGxpYmMK
LQotRml4ZXMgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZvbnRjb25maWcvZm9udGNv
bmZpZy8tL2lzc3Vlcy80ODQKLQotQ2hhbmdlbG9nOiBmaXhlZAotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZvbnRjb25maWcvZm9udGNv
bmZpZy8tL2NvbW1pdC83NWNjM2U2ZWYwZTQ1MWY0MmQzNDY0ZWQ0ZDYzOTMwNGFkOWE0ZjU4XQot
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0t
LQotIHRlc3QvdGVzdC1tdC1mY2NmZy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQotIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0t
Z2l0IGEvdGVzdC90ZXN0LW10LWZjY2ZnLmMgYi90ZXN0L3Rlc3QtbXQtZmNjZmcuYwotaW5kZXgg
MjRhZDc1ODMuLjNiN2Q4NDNkIDEwMDY0NAotLS0tIGEvdGVzdC90ZXN0LW10LWZjY2ZnLmMKLSsr
KyBiL3Rlc3QvdGVzdC1tdC1mY2NmZy5jCi1AQCAtMSw5ICsxLDEyIEBACi0gLyogQ29weXJpZ2h0
IChDKSAyMDI1IGZvbnRjb25maWcgQXV0aG9ycyAqLwotIC8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBIUE5EICovCi0rI2lmZGVmIEhBVkVfQ09ORklHX0gKLSsjICBpbmNsdWRlICJjb25maWcu
aCIKLSsjZW5kaWYKLSsKLSAjaW5jbHVkZSA8Zm9udGNvbmZpZy9mb250Y29uZmlnLmg+Ci0gCi0g
I2luY2x1ZGUgPHN0ZGlvLmg+Ci0tI2RlZmluZSBfX1VTRV9YT1BFTgotICNpbmNsdWRlIDxwdGhy
ZWFkLmg+Ci0gI2luY2x1ZGUgPHN0ZGxpYi5oPgotIAotQEAgLTEzLDYgKzE2LDIxIEBAIHN0cnVj
dCB0aHJfYXJnX3MgewotICAgICBpbnQgdGhyX251bTsKLSB9OwotIAotKyNpZmRlZiBfV0lOMzIK
LStpbnQKLStzZXRlbnYgKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnZhbHVlLCBpbnQg
bykKLSt7Ci0rICAgIHNpemVfdCBsZW4gPSBzdHJsZW4gKG5hbWUpICsgc3RybGVuICh2YWx1ZSkg
KyAxOwotKyAgICBjaGFyICAqcyA9IG1hbGxvYyAobGVuICsgMSk7Ci0rICAgIGludCAgICByZXQ7
Ci0rCi0rICAgIHNucHJpbnRmIChzLCBsZW4sICIlcz0lcyIsIG5hbWUsIHZhbHVlKTsKLSsgICAg
cmV0ID0gX3B1dGVudiAocyk7Ci0rICAgIGZyZWUgKHMpOwotKyAgICByZXR1cm4gcmV0OwotK30K
LSsjZW5kaWYKLSsKLSBzdGF0aWMgdm9pZCAqCi0gcnVuX3Rlc3RfaW5fdGhyZWFkICh2b2lkICph
cmcpCi0gewotQEAgLTYxLDcgKzc5LDcgQEAgdGVzdCAodm9pZCkKLSAgICAgaWYgKGMxID09IGMy
KQotIAlyZXR1cm4gMTsKLSAgICAgLyogVG8gbWFrZSB2aXNpYmxlIGlmIHdlIGhhdmUgYW55IHJl
ZmVyZW5jZXMgKi8KLS0gICAgcHV0ZW52ICgiRkNfREVCVUc9MTYiKTsKLSsgICAgc2V0ZW52ICgi
RkNfREVCVUciLCAiMTYiLCAxKTsKLSAgICAgRmNGaW5pKCk7Ci0gCi0gICAgIHJldHVybiAwOwot
LS0gCi1HaXRMYWIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25m
aWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcu
cGF0Y2gKaW5kZXggMzBkNjQyMzAzNy4uMmViNTQ4NzgzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZp
Zy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmln
L3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoCkBAIC0xLDMgKzEsOCBAQAorRnJvbSBjY2Q5
ODY4NWIzY2QxZjljNWY2NzRkMjgwN2QzMmYxOTU2YTQ3ZWM0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KK0RhdGU6IFRodSwgMjMg
QXByIDIwMTUgMjA6MzU6MzIgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gZm9udGNvbmZpZzogRml4
IHBrZ2NvbmZpZyBmaWxlIGdlbmVyYXRpb24gdG8gbm90IGhhdmUKKwogUmV2ZXJ0IHBhcnQgb2Yg
aHR0cDovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2ZvbnRjb25maWcvY29tbWl0L2ZvbnRjb25maWcu
cGMuaW4/aWQ9MzM4ZmZlNmI4ODZhZDRiYTg2ZmY0NzFjYjU5YzRhNWU1ZmZiZTQwOAogV2UgcmVh
bGx5IGRvbnQgZG8gc3RhdGljIGxpbmtpbmcgc28gaXRzIG5vdCBnb2luZyB0byBjYXVzZSBpc3N1
ZXMgZm9yIHVzIGJ1dCBhcyBzdWNoIHRoaXMgaXMgaGFybWluZyB1cyBieSBhZGRpbmcgYWJzb2x1
dGUKIHBhdGhzIGludG8gLUkgb3B0aW9ucyBpbnRvIGZvbnRjb25maWcucGMgd2hpY2ggaXMgdGhl
bSBwcmVwZW5kZWQgd2l0aCBzeXNyb290IHdoZW4gcmVhZCBiYWNrIGJ5IGNyb3NzIHBrZy1jb25m
aWcgYW5kCkBAIC03LDYgKzEyLDkgQEAgZ2VudGx5IHJlZnVzZXMgYW5kIHJpZ2h0bHkgc28uCiAK
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0UtU3BlY2lmaWNdCiBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorLS0tCisgZm9udGNvbmZpZy5wYy5p
biB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL2ZvbnRjb25maWcucGMuaW4gYi9mb250Y29uZmlnLnBjLmluCiBpbmRl
eCA2MWIzNWZiLi41YmM5YmFiIDEwMDY0NApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE3LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIu
MTcuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNv
bmZpZ18yLjE4LjAuYmIKaW5kZXggMGQwZmNmY2NlYi4uN2QzNTZjNDA5YSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE3LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjAuYmIK
QEAgLTIyLDEwICsyMiw4IEBAIERFUEVORFMgPSAiZXhwYXQgZnJlZXR5cGUgemxpYiBncGVyZi1u
YXRpdmUgdXRpbC1saW51eCIKIAogU1JDX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvYXBpL3Y0L3Byb2plY3RzLzg5MC9wYWNrYWdlcy9nZW5lcmljL2ZvbnRjb25maWcvJHtQ
Vn0vZm9udGNvbmZpZy0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vcmV2ZXJ0LXN0
YXRpYy1wa2djb25maWcucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vbXVzbC1maXgucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1idWlsZC1BZGRlZC1taXNzaW5nLXRhcmdldC1ydWxl
LWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI5ZjVjYWU5M2Y0ZmZmYzFmYmMwNWFlOTljZGZjNzA4Y2Q2MGRmZDY2MTJmZmMwNTEyODI3MDI1
YzAyNmZhNTQxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3MDY0YTQ3MjU0MzFkZGJhMDZmZjhi
OTcxZWM1YTRiNDIyZTIzYjAxNjljZTIxNTc0N2JlZWRjYjMwZTkwNzMiCiAKIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZm9udGNvbmZpZy9mb250
Y29uZmlnLy0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/UDxwdmVy
Pi4rKSIKLS0gCjIuNDcuMQoK

--===============3966168473366297922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 2504504 to 2617344 (+5%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: FILELIST: removed "/usr/lib/.debug/libfontconfig.so.1.16.0", added "/usr/lib/.debug/libfontconfig.so.1.17.0 /usr/bin/.debug/fc-genconf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGSIZE changed from 43207 to 44602 (+3%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 1007008 to 1062168 (+5%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: FILELIST: directory renamed /usr/src/debug/fontconfig/2.17.1/fc-pattern -> /usr/src/debug/fontconfig/2.18.0/fc-pattern, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-conflist -> /usr/src/debug/fontconfig/2.18.0/fc-conflist, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-match -> /usr/src/debug/fontconfig/2.18.0/fc-match, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-cache -> /usr/src/debug/fontconfig/2.18.0/fc-cache, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-cat -> /usr/src/debug/fontconfig/2.18.0/fc-cat, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-lang -> /usr/src/debug/fontconfig/2.18.0/fc-lang, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-scan -> /usr/src/debug/fontconfig/2.18.0/fc-scan, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-case -> /usr/src/debug/fontconfig/2.18.0/fc-case, directory renamed /usr/src/debug/fontconfig/2.17.1 -> /usr/src/debug/fontconfig/2.1
 8.0, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-query -> /usr/src/debug/fontconfig/2.18.0/fc-query, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-validate -> /usr/src/debug/fontconfig/2.18.0/fc-validate, directory renamed /usr/src/debug/fontconfig/2.17.1/fontconfig -> /usr/src/debug/fontconfig/2.18.0/fontconfig, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-list -> /usr/src/debug/fontconfig/2.18.0/fc-list, removed "/usr/src/debug/fontconfig/2.17.1/src/fcserialize.c /usr/src/debug/fontconfig/2.17.1/src/fcmd5.h /usr/src/debug/fontconfig/2.17.1/src/fcptrlist.c /usr/src/debug/fontconfig/2.17.1/src/fcmatch.c /usr/src/debug/fontconfig/2.17.1/src/fcmatrix.c /usr/src/debug/fontconfig/2.17.1/src/fcformat.c /usr/src/debug/fontconfig/2.17.1/src/fccache.c /usr/src/debug/fontconfig/2.17.1/src/fcobjshash.gperf /usr/src/debug/fontconfig/2.17.1/src/fcdir.c /usr/src/debug/fontconfig/2.17.1/src/fcmutex.h /usr/src/debug/fontconfig/2.17.1/src/fcatomic.h /usr/src/debug/fontcon
 fig/2.17.1/src/fcdefault.c /usr/src/debug/fontconfig/2.17.1/src/fcint.h /usr/src/debug/fontconfig/2.17.1/src/fcatomic.c /usr/src/debug/fontconfig/2.17.1/src/fcdbg.c /usr/src/debug/fontconfig/2.17.1/src/fcfs.c /usr/src/debug/fontconfig/2.17.1/src/fcweight.c /usr/src/debug/fontconfig/2.17.1/src/fcpat.c /usr/src/debug/fontconfig/2.17.1/src/fccharset.c /usr/src/debug/fontconfig/2.17.1/src/fcfreetype.c /usr/src/debug/fontconfig/2.17.1/src/fcstr.c /usr/src/debug/fontconfig/2.17.1/src/fchash.c /usr/src/debug/fontconfig/2.17.1/src/fcobjs.c /usr/src/debug/fontconfig/2.17.1/src/fclist.c /usr/src/debug/fontconfig/2.17.1/src/ftglue.c /usr/src/debug/fontconfig/2.17.1/src/ftglue.h /usr/src/debug/fontconfig/2.17.1/src/fcstat.c /usr/src/debug/fontconfig/2.17.1/src/fccompat.c /usr/src/debug/fontconfig/2.17.1/src/fcxml.c /usr/src/debug/fontconfig/2.17.1/src/fccfg.c /usr/src/debug/fontconfig/2.17.1/src/fcfoundry.h /usr/src/debug/fontconfig/2.17.1/src/fcname.c /usr/src/debug/fontconfig/2.17.1/src/fclan
 g.c /usr/src/debug/fontconfig/2.17.1/src/fcinit.c /usr/src/debug/fontconfig/2.17.1/src/fcrange.c", added "/usr/src/debug/fontconfig/2.18.0/src/fcserialize.c /usr/src/debug/fontconfig/2.18.0/src/fcmd5.h /usr/src/debug/fontconfig/2.18.0/src/fcptrlist.c /usr/src/debug/fontconfig/2.18.0/src/fcmatch.c /usr/src/debug/fontconfig/2.18.0/src/fcmatrix.c /usr/src/debug/fontconfig/2.18.0/src/fcconffile.c /usr/src/debug/fontconfig/2.18.0/src/fccache.c /usr/src/debug/fontconfig/2.18.0/src/fcformat.c /usr/src/debug/fontconfig/2.18.0/src/fcobjshash.gperf /usr/src/debug/fontconfig/2.18.0/src/fcdir.c /usr/src/debug/fontconfig/2.18.0/src/fcmutex.h /usr/src/debug/fontconfig/2.18.0/src/fcatomic.h /usr/src/debug/fontconfig/2.18.0/src/fcdefault.c /usr/src/debug/fontconfig/2.18.0/src/fcint.h /usr/src/debug/fontconfig/2.18.0/src/fcatomic.c /usr/src/debug/fontconfig/2.18.0/src/fcdbg.c /usr/src/debug/fontconfig/2.18.0/src/fcfs.c /usr/src/debug/fontconfig/2.18.0/fc-genconf/fc-genconf.c /usr/src/debug/fontconfi
 g/2.18.0/src/fcweight.c /usr/src/debug/fontconfig/2.18.0/src/fcpat.c /usr/src/debug/fontconfig/2.18.0/src/fccharset.c /usr/src/debug/fontconfig/2.18.0/src/fcfreetype.c /usr/src/debug/fontconfig/2.18.0/src/fcstr.c /usr/src/debug/fontconfig/2.18.0/src/fchash.c /usr/src/debug/fontconfig/2.18.0/fc-const/fcconst.h /usr/src/debug/fontconfig/2.18.0/src/fcobjs.c /usr/src/debug/fontconfig/2.18.0/src/fclist.c /usr/src/debug/fontconfig/2.18.0/src/ftglue.c /usr/src/debug/fontconfig/2.18.0/src/ftglue.h /usr/src/debug/fontconfig/2.18.0/src/fcstat.c /usr/src/debug/fontconfig/2.18.0/src/fccompat.c /usr/src/debug/fontconfig/2.18.0/src/fcxml.c /usr/src/debug/fontconfig/2.18.0/src/fccfg.c /usr/src/debug/fontconfig/2.18.0/src/fcfoundry.h /usr/src/debug/fontconfig/2.18.0/src/fcname.c /usr/src/debug/fontconfig/2.18.0/src/fclang.c /usr/src/debug/fontconfig/2.18.0/src/fcinit.c /usr/src/debug/fontconfig/2.18.0/src/fcrange.c"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGSIZE changed from 142368 to 156824 (+10%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: FILELIST: added "/usr/bin/fc-genconf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 482072 to 525857 (+9%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: FILELIST: removed "/usr/lib/libfontconfig.so.1.16.0", added "/usr/lib/libfontconfig.so.1.17.0 /usr/share/fontconfig/conf.avail/05-macos.conf /etc/fonts/conf.d/05-macos.conf /etc/fonts/conf.d/48-guessfamily.conf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig: PKGV changed from 2.17.1 [default] to 2.18.0 [default]
packages/x86-64-v3-poky-linux/fontconfig: PV changed from "2.17.1" to "2.18.0"
packages/x86-64-v3-poky-linux/fontconfig: SRC_URI changed from "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz file://revert-static-pkgconfig.patch file://musl-fix.patch file://0001-build-Added-missing-target-rule-dependencies.patch" to "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.0/fontconfig-2.18.0.tar.xz file://revert-static-pkgconfig.patch"
Changes to packages/x86-64-v3-poky-linux/fontconfig (sysroot):
  /usr/lib/libfontconfig.so.1 changed symlink target from libfontconfig.so.1.16.0 to libfontconfig.so.1.17.0
  /usr/lib/libfontconfig.so.1.16.0 moved to /usr/lib/libfontconfig.so.1.17.0
  /usr/share/fontconfig/conf.avail/05-macos.conf was added

--===============3966168473366297922==--

