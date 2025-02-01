Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07671C0219B
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42710.1738416041887559687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Eir823nt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zJLUXtId;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abc424-d3ec24fc-b84f-4946-80b7-844a6d7b252f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aS4i6kj0GAo3gpjA0iTOPoRflAgYm/NHjtrA1m268Jw=;
	b=Eir823ntOY8UsPjx6HGzSWka4qjw5DjUTGGS4dUkanr04xgUl/5XqfNHJog9hP4g
	z3oijv1D90It9EV7H1diWwAEHVaLonXCBZswt4qf/D52kyXEC8KgYSIe+9ls8ln12BA
	EyMiSirSGz+JEJgMrHjBb1GiJNspOYdPesFju/KI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aS4i6kj0GAo3gpjA0iTOPoRflAgYm/NHjtrA1m268Jw=;
	b=zJLUXtIdFKJw6OrRcw0G7qKZU1Gm+WOj2UR6zUa03wDz/k8njOLjKRU/CFJTisEA
	pWH/MPQXD0Dfsip4v6hPFSyQNII9y1F+2+wYNL+Q4+MfWWI3BEmjib60XcyocGWwS5z
	8mAGpH8UZmZDijHPVM7XMj9pQfnz+80Gv5KrH6Rs=
Content-Type: multipart/mixed; boundary="===============6136840475915476914=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] coreutils: upgrading to 9.6 FAILED
Message-ID: <01010194c1abc424-d3ec24fc-b84f-4946-80b7-844a6d7b252f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210517

--===============6136840475915476914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *coreutils* to *9.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-coreutils-upgrade-9.5-9.6.patch
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
From 553a18e358744c4bcbc36e0dea039a36c7ee6afe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 06:57:55 +0000
Subject: [PATCH] coreutils: upgrade 9.5 -> 9.6

---
 ...local.mk-fix-cross-compiling-problem.patch |  6 ++---
 .../coreutils/intermittent-testfailure.patch  | 16 +++++++++----
 .../remove-usr-local-lib-from-m4.patch        |  4 ++--
 .../{coreutils_9.5.bb => coreutils_9.6.bb}    | 24 +++++++++++++++++--
 4 files changed, 38 insertions(+), 12 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_9.5.bb => coreutils_9.6.bb} (91%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
index 97a6357ab9..80597b5836 100644
--- a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
+++ b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
@@ -1,4 +1,4 @@
-From 7cb2d20cfa2a27191255031d231cd41917dcffe8 Mon Sep 17 00:00:00 2001
+From e052faf6c64a5a90a69924d8db677b4fc84c6561 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 26 Dec 2016 16:10:35 +0800
 Subject: [PATCH] local.mk: fix cross compiling problem
@@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/local.mk b/src/local.mk
-index 96ee941..cdd47d6 100644
+index fd9dc81..ef6e968 100644
 --- a/src/local.mk
 +++ b/src/local.mk
-@@ -704,4 +704,4 @@ cu_install_program = @INSTALL@
+@@ -731,4 +731,4 @@ cu_install_program = @INSTALL@
  else
  cu_install_program = src/ginstall
  endif
diff --git a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
index 0794532bdf..9ca1a5f450 100644
--- a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
+++ b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
@@ -1,4 +1,7 @@
-tests/df: Fix intermittent test failure
+From 7231a399f770f514ca2756f67af145650502d454 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 8 Aug 2024 10:37:58 +0100
+Subject: [PATCH] tests/df: Fix intermittent test failure
 
 The test writes to the disk and means the space used changes. If this
 crosses a number boundary, the heading spacing can change:
@@ -12,11 +15,14 @@ the spacing doesn't matter. Therefore strip any duplicate spaces using tr.
 Submitted: https://github.com/coreutils/coreutils/pull/88
 Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/c5725c8c4bb21903490a48035286d0f94463642e]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ tests/df/df-P.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: coreutils-9.5/tests/df/df-P.sh
-===================================================================
---- coreutils-9.5.orig/tests/df/df-P.sh
-+++ coreutils-9.5/tests/df/df-P.sh
+diff --git a/tests/df/df-P.sh b/tests/df/df-P.sh
+index d35597f..30b3ef1 100755
+--- a/tests/df/df-P.sh
++++ b/tests/df/df-P.sh
 @@ -20,8 +20,8 @@
  print_ver_ df
  
diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
index 718de0ab78..57416315aa 100644
--- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
@@ -1,4 +1,4 @@
-From f53ffb5b27ab7d4a4c62df00ebd6a1a6936d1709 Mon Sep 17 00:00:00 2001
+From 6c3c3e198861b3bcb3b54c98183c57b467a80b0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Aug 2011 14:12:30 -0700
 Subject: [PATCH] coreutils: Fix build on uclibc
@@ -17,7 +17,7 @@ Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
  1 file changed, 12 deletions(-)
 
 diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
-index 9d0236f..68f7c52 100644
+index 8ab613d..5af7571 100644
 --- a/m4/getloadavg.m4
 +++ b/m4/getloadavg.m4
 @@ -46,18 +46,6 @@ if test $ac_cv_func_getloadavg != yes; then
diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
similarity index 91%
rename from meta/recipes-core/coreutils/coreutils_9.5.bb
rename to meta/recipes-core/coreutils/coreutils_9.6.bb
index ae07cba164..01c30555af 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -1,3 +1,23 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/ls.c
+# +++ src/ls.c
+# @@ -1,5 +1,5 @@
+#  /* 'dir', 'vdir' and 'ls' directory listing programs for GNU.
+# -   Copyright (C) 1985-2024 Free Software Foundation, Inc.
+# +   Copyright (C) 1985-2025 Free Software Foundation, Inc.
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "The basic file, shell and text manipulation utilities"
 DESCRIPTION = "The GNU Core Utilities provide the basic file, shell and text \
 manipulation utilities. These are the core utilities which are expected to exist on \
@@ -6,7 +26,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=9ac94aaed7fd46fd8df7147a9e3410cb \
+                    file://src/ls.c;beginline=1;endline=15;md5=824c1997414aea9f344747bd81cf5a31 \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -19,7 +39,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://intermittent-testfailure.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"
+SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
-- 
2.44.1


--===============6136840475915476914==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-coreutils-upgrade-9.5-9.6.patch"

RnJvbSA1NTNhMThlMzU4NzQ0YzRiY2JjMzZlMGRlYTAzOWEzNmM3ZWU2YWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNjo1Nzo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNv
cmV1dGlsczogdXBncmFkZSA5LjUgLT4gOS42CgotLS0KIC4uLmxvY2FsLm1rLWZpeC1jcm9zcy1j
b21waWxpbmctcHJvYmxlbS5wYXRjaCB8ICA2ICsrLS0tCiAuLi4vY29yZXV0aWxzL2ludGVybWl0
dGVudC10ZXN0ZmFpbHVyZS5wYXRjaCAgfCAxNiArKysrKysrKystLS0tCiAuLi4vcmVtb3ZlLXVz
ci1sb2NhbC1saWItZnJvbS1tNC5wYXRjaCAgICAgICAgfCAgNCArKy0tCiAuLi4ve2NvcmV1dGls
c185LjUuYmIgPT4gY29yZXV0aWxzXzkuNi5iYn0gICAgfCAyNCArKysrKysrKysrKysrKysrKy0t
CiA0IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy97Y29yZXV0aWxzXzkuNS5iYiA9PiBjb3Jl
dXRpbHNfOS42LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1
dGlscy9jb3JldXRpbHMvMDAwMS1sb2NhbC5tay1maXgtY3Jvc3MtY29tcGlsaW5nLXByb2JsZW0u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzLzAwMDEtbG9jYWwu
bWstZml4LWNyb3NzLWNvbXBpbGluZy1wcm9ibGVtLnBhdGNoCmluZGV4IDk3YTYzNTdhYjkuLjgw
NTk3YjU4MzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRp
bHMvMDAwMS1sb2NhbC5tay1maXgtY3Jvc3MtY29tcGlsaW5nLXByb2JsZW0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy8wMDAxLWxvY2FsLm1rLWZpeC1j
cm9zcy1jb21waWxpbmctcHJvYmxlbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2NiMmQy
MGNmYTJhMjcxOTEyNTUwMzFkMjMxY2Q0MTkxN2RjZmZlOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZTA1MmZhZjZjNjRhNWE5MGE2OTkyNGQ4ZGI2NzdiNGZjODRjNjU2MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IE1vbiwgMjYgRGVjIDIwMTYgMTY6MTA6MzUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
bG9jYWwubWs6IGZpeCBjcm9zcyBjb21waWxpbmcgcHJvYmxlbQpAQCAtMTUsMTAgKzE1LDEwIEBA
IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Ny
Yy9sb2NhbC5tayBiL3NyYy9sb2NhbC5tawotaW5kZXggOTZlZTk0MS4uY2RkNDdkNiAxMDA2NDQK
K2luZGV4IGZkOWRjODEuLmVmNmU5NjggMTAwNjQ0CiAtLS0gYS9zcmMvbG9jYWwubWsKICsrKyBi
L3NyYy9sb2NhbC5tawotQEAgLTcwNCw0ICs3MDQsNCBAQCBjdV9pbnN0YWxsX3Byb2dyYW0gPSBA
SU5TVEFMTEAKK0BAIC03MzEsNCArNzMxLDQgQEAgY3VfaW5zdGFsbF9wcm9ncmFtID0gQElOU1RB
TExACiAgZWxzZQogIGN1X2luc3RhbGxfcHJvZ3JhbSA9IHNyYy9naW5zdGFsbAogIGVuZGlmCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzL2ludGVybWl0
dGVudC10ZXN0ZmFpbHVyZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3Jl
dXRpbHMvaW50ZXJtaXR0ZW50LXRlc3RmYWlsdXJlLnBhdGNoCmluZGV4IDA3OTQ1MzJiZGYuLjlj
YTFhNWY0NTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRp
bHMvaW50ZXJtaXR0ZW50LXRlc3RmYWlsdXJlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2NvcmV1dGlscy9jb3JldXRpbHMvaW50ZXJtaXR0ZW50LXRlc3RmYWlsdXJlLnBhdGNoCkBAIC0x
LDQgKzEsNyBAQAotdGVzdHMvZGY6IEZpeCBpbnRlcm1pdHRlbnQgdGVzdCBmYWlsdXJlCitGcm9t
IDcyMzFhMzk5Zjc3MGY1MTRjYTI3NTZmNjdhZjE0NTY1MDUwMmQ0NTQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KK0RhdGU6IFRodSwgOCBBdWcgMjAyNCAxMDozNzo1OCArMDEwMAorU3ViamVj
dDogW1BBVENIXSB0ZXN0cy9kZjogRml4IGludGVybWl0dGVudCB0ZXN0IGZhaWx1cmUKIAogVGhl
IHRlc3Qgd3JpdGVzIHRvIHRoZSBkaXNrIGFuZCBtZWFucyB0aGUgc3BhY2UgdXNlZCBjaGFuZ2Vz
LiBJZiB0aGlzCiBjcm9zc2VzIGEgbnVtYmVyIGJvdW5kYXJ5LCB0aGUgaGVhZGluZyBzcGFjaW5n
IGNhbiBjaGFuZ2U6CkBAIC0xMiwxMSArMTUsMTQgQEAgdGhlIHNwYWNpbmcgZG9lc24ndCBtYXR0
ZXIuIFRoZXJlZm9yZSBzdHJpcCBhbnkgZHVwbGljYXRlIHNwYWNlcyB1c2luZyB0ci4KIFN1Ym1p
dHRlZDogaHR0cHM6Ly9naXRodWIuY29tL2NvcmV1dGlscy9jb3JldXRpbHMvcHVsbC84OAogVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL2NvcmV1dGlscy9jb3Jl
dXRpbHMvY29tbWl0L2M1NzI1YzhjNGJiMjE5MDM0OTBhNDgwMzUyODZkMGY5NDQ2MzY0MmVdCiBT
aWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZz4KKy0tLQorIHRlc3RzL2RmL2RmLVAuc2ggfCA0ICsrLS0KKyAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCi1JbmRleDogY29yZXV0aWxzLTku
NS90ZXN0cy9kZi9kZi1QLnNoCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gY29yZXV0aWxzLTkuNS5vcmlnL3Rl
c3RzL2RmL2RmLVAuc2gKLSsrKyBjb3JldXRpbHMtOS41L3Rlc3RzL2RmL2RmLVAuc2gKK2RpZmYg
LS1naXQgYS90ZXN0cy9kZi9kZi1QLnNoIGIvdGVzdHMvZGYvZGYtUC5zaAoraW5kZXggZDM1NTk3
Zi4uMzBiM2VmMSAxMDA3NTUKKy0tLSBhL3Rlc3RzL2RmL2RmLVAuc2gKKysrKyBiL3Rlc3RzL2Rm
L2RmLVAuc2gKIEBAIC0yMCw4ICsyMCw4IEBACiAgcHJpbnRfdmVyXyBkZgogIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy9yZW1vdmUtdXNyLWxvY2Fs
LWxpYi1mcm9tLW00LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGls
cy9yZW1vdmUtdXNyLWxvY2FsLWxpYi1mcm9tLW00LnBhdGNoCmluZGV4IDcxOGRlMGFiNzguLjU3
NDE2MzE1YWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRp
bHMvcmVtb3ZlLXVzci1sb2NhbC1saWItZnJvbS1tNC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9jb3JldXRpbHMvY29yZXV0aWxzL3JlbW92ZS11c3ItbG9jYWwtbGliLWZyb20tbTQucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY1M2ZmYjViMjdhYjdkNGE0YzYyZGYwMGViZDZhMWE2
OTM2ZDE3MDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZjM2MzZTE5ODg2MWIzYmNi
M2I1NGM5ODE4M2M1N2I0NjdhODBiMGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzIEF1ZyAyMDExIDE0OjEy
OjMwIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvcmV1dGlsczogRml4IGJ1aWxkIG9uIHVjbGli
YwpAQCAtMTcsNyArMTcsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW1Vwc3Ry
ZWFtIGRvZXMgY2FyZSBmb3IgQUlYIHdoaWxlIHdlIG1heSBub3RdCiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbTQvZ2V0bG9hZGF2Zy5tNCBiL200L2dl
dGxvYWRhdmcubTQKLWluZGV4IDlkMDIzNmYuLjY4ZjdjNTIgMTAwNjQ0CitpbmRleCA4YWI2MTNk
Li41YWY3NTcxIDEwMDY0NAogLS0tIGEvbTQvZ2V0bG9hZGF2Zy5tNAogKysrIGIvbTQvZ2V0bG9h
ZGF2Zy5tNAogQEAgLTQ2LDE4ICs0Niw2IEBAIGlmIHRlc3QgJGFjX2N2X2Z1bmNfZ2V0bG9hZGF2
ZyAhPSB5ZXM7IHRoZW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9j
b3JldXRpbHNfOS41LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlsc185
LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUv
Y29yZXV0aWxzL2NvcmV1dGlsc185LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2Nv
cmV1dGlscy9jb3JldXRpbHNfOS42LmJiCmluZGV4IGFlMDdjYmExNjQuLjAxYzMwNTU1YWYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOS41LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOS42LmJiCkBAIC0xLDMg
KzEsMjMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4g
dXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVh
c2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUg
Y2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRh
Zy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQu
JykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBzcmMvbHMuYworIyArKysgc3JjL2xzLmMK
KyMgQEAgLTEsNSArMSw1IEBACisjICAvKiAnZGlyJywgJ3ZkaXInIGFuZCAnbHMnIGRpcmVjdG9y
eSBsaXN0aW5nIHByb2dyYW1zIGZvciBHTlUuCisjIC0gICBDb3B5cmlnaHQgKEMpIDE5ODUtMjAy
NCBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgKyAgIENvcHlyaWdodCAoQykgMTk4
NS0yMDI1IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAgCisjICAgICBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQorIyAgICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyMgCisjCisKIFNVTU1BUlkgPSAiVGhlIGJhc2ljIGZp
bGUsIHNoZWxsIGFuZCB0ZXh0IG1hbmlwdWxhdGlvbiB1dGlsaXRpZXMiCiBERVNDUklQVElPTiA9
ICJUaGUgR05VIENvcmUgVXRpbGl0aWVzIHByb3ZpZGUgdGhlIGJhc2ljIGZpbGUsIHNoZWxsIGFu
ZCB0ZXh0IFwKIG1hbmlwdWxhdGlvbiB1dGlsaXRpZXMuIFRoZXNlIGFyZSB0aGUgY29yZSB1dGls
aXRpZXMgd2hpY2ggYXJlIGV4cGVjdGVkIHRvIGV4aXN0IG9uIFwKQEAgLTYsNyArMjYsNyBAQCBI
T01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvY29yZXV0aWxzLyIKIEJVR1RS
QUNLRVIgPSAiaHR0cDovL2RlYmJ1Z3MuZ251Lm9yZy9jb3JldXRpbHMiCiBMSUNFTlNFID0gIkdQ
TC0zLjAtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0x
ZWJiZDNlMzQyMzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCBcCi0gICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9zcmMvbHMuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTE1O21kNT05YWM5NGFhZWQ3ZmQ0NmZk
OGRmNzE0N2E5ZTM0MTBjYiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvbHMuYzti
ZWdpbmxpbmU9MTtlbmRsaW5lPTE1O21kNT04MjRjMTk5NzQxNGFlYTlmMzQ0NzQ3YmQ4MWNmNWEz
MSBcCiAgICAgICAgICAgICAgICAgICAgICIKIERFUEVORFMgPSAiZ21wIGxpYmNhcCIKIERFUEVO
RFM6Y2xhc3MtbmF0aXZlID0gIiIKQEAgLTE5LDcgKzM5LDcgQEAgU1JDX1VSSSA9ICIke0dOVV9N
SVJST1J9L2NvcmV1dGlscy8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vaW50ZXJt
aXR0ZW50LXRlc3RmYWlsdXJlLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDMyOGVkZWFjOTJmNmE2NjVk
ZTlmMzIzYzkzYjcxMmFmMTg1OGJjMmUwZDg4ZjNmNzEwMDQ2OTQ3MGExYjhhIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjdhMDEyNDMyN2IzOThmZDllYjFhNmFiZGU1ODMzODk4MjE0MjJjNzQ0ZmZh
MTA3MzRiMjRmNTU3NjEwZDMyODMiCiAKICMgaHR0cDovL2dpdC5zYXZhbm5haC5nbnUub3JnL2Nn
aXQvY29yZXV0aWxzLmdpdC9jb21taXQvP2lkPXY4LjI3LTEwMS1nZjVkN2MwODQyCiAjCi0tIAoy
LjQ0LjEKCg==

--===============6136840475915476914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:04c920650e99395f16907576df69537dfae688df"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 456 Local 420 Mirrors 0 Missed 36 Current 459 (92% match, 96% complete)
Removing 24 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 653 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_setscene)
NOTE: Running setscene task 693 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_setscene)
NOTE: Running setscene task 704 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: Running setscene task 711 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 760 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 988 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa: Started
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 856 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1521 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1568 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1571 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_populate_lic)
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.6-r0: task do_populate_lic: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 867 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_populate_lic: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 868 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 872 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 899 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 915 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1938 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2374 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2448 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure)
NOTE: recipe coreutils-9.6-r0: task do_configure: Started
NOTE: recipe coreutils-9.6-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2450 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile)
NOTE: recipe coreutils-9.6-r0: task do_compile: Started
NOTE: recipe coreutils-9.6-r0: task do_compile: Succeeded
NOTE: Running task 2451 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2452 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install)
NOTE: recipe coreutils-9.6-r0: task do_install: Started
NOTE: recipe coreutils-9.6-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2454 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package)
NOTE: Running task 2455 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.6-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.6-r0: task do_package: Started
NOTE: recipe coreutils-9.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata)
NOTE: recipe coreutils-9.6-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2457 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_spdx)
NOTE: Running task 2458 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk)
NOTE: Running task 2459 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb)
NOTE: Running task 2460 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm)
NOTE: Running task 2461 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa)
NOTE: recipe coreutils-9.6-r0: task do_create_spdx: Started
NOTE: Running task 2462 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_ipk)
NOTE: Running task 2463 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_deb)
NOTE: Running task 2464 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_rpm)
NOTE: Running task 2465 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_qa)
NOTE: Running task 2466 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk)
NOTE: Running task 2467 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb)
NOTE: Running task 2468 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm)
NOTE: Running task 2469 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa)
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb: Started
NOTE: Running task 2470 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk)
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_ipk: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_deb: Started
NOTE: Running task 2471 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb)
NOTE: recipe python3-3.13.1-r0: task do_package_qa: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2472 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm)
NOTE: recipe gawk-5.3.1-r0: task do_package_qa: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.3.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_ipk unihash changed to 4ff6a889b5cbb91a72d83d87d2a6607d01ea62f8ad5743f0581d1069ab3f7d84
NOTE: Running task 2473 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa)
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2474 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk)
NOTE: recipe gawk-5.3.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_deb unihash changed to 4916c7e06523d24c8cf1b9b88c0bac6d0eef75919197375e72e619b26b49ba6d
NOTE: Running task 2475 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk unihash changed to 5798ef22cd86c414e2734b415d30c62a63abe4d7119b132f2d1eae5780b687fe
NOTE: Running task 2476 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk unihash changed to 3f7a8e1f272b071f3c0ff94bddf4fb03ded7550e0617345abe1f512f1da3c6db
NOTE: Running task 2477 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa)
NOTE: recipe attr-2.5.2-r0: task do_package_qa: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk unihash changed to ac8f705a014d98398ae4f284715bab13443f4a13c381fb282d9ed768339d42c9
NOTE: Running task 2478 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_ipk)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb unihash changed to 19222cecdb814960604e2384362698c3057ba9bf4e32c1ca9cee33a06fce9578
NOTE: Running task 2479 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_deb)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm unihash changed to 06ffbe2524fb0e58e4c9f23ad09c234e77455aa28460b193eeb9a5c05a16ee16
NOTE: Running task 2480 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_rpm)
NOTE: recipe findutils-4.10.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa unihash changed to 647ad6a1962527f3c2dfd036df5b0dcad351aaa710eee8c8c80f1664df813407
NOTE: Running task 2481 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_qa)
NOTE: recipe gawk-5.3.1-r0: task do_package_qa: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_write_ipk: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_qa unihash changed to 893ad043f70ae8621c48f0fd3c2ea219f62a6b90605a3cf365ef817fd2da7ddd
NOTE: Running task 2482 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_ipk)
NOTE: recipe acl-2.3.2-r0: task do_package_write_deb: Started
NOTE: recipe acl-2.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.3.2-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb unihash changed to e82f8dc2446acb92cd048fb41efea9e4a852f6e84fc0b468ee573209e54fdf17
NOTE: Running task 2483 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_deb)
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk unihash changed to db791241cfc5f7b1809c82e32b8d5e82e3c1a706e0dd95de374dd2c4f7479a9a
NOTE: Running task 2484 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_write_rpm)
NOTE: recipe gawk-5.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_package_write_rpm unihash changed to acd9507b078c053cb0ff3430b8a857acdf745b0702bb0e50b8aeda67a2c8f2f0
NOTE: Running task 2485 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa)
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.6-r0: task do_package_qa: Started
NOTE: recipe acl-2.3.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_ipk unihash changed to 9711482a9edb02aa1311aa3319baf2fc88b888ed643b101902ee60fd25b60a10
NOTE: Running task 2486 of 2487 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_create_package_spdx)
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa unihash changed to 28a56c50bc5226b89937afd6ae031869e2a039b6f819e844858f9a5d249363ae
NOTE: recipe coreutils-9.6-r0: task do_create_package_spdx: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb unihash changed to 95131da1523858fdb5af32abfd850875ade2ed786950369a0d8cc4f8ced98603
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_deb unihash changed to 7d73caee25a165c1a73e30e69604e07ba94e04412130dbd785d6ec943db134d0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm unihash changed to 768d3805f0cc4bd16ae7cd62f7df5bdd8eefc9cf63690894047a60ff33d7e3ed
NOTE: recipe attr-2.5.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa unihash changed to 9f3d8d2b59312599c51df9fa41cbfd308690e05cbd7d05d69cf8df93d6ce544a
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm unihash changed to d09eb193a620ffc4425760a9a2e9364abfd17f8de77e2fbdeac7d66579780fed
NOTE: recipe acl-2.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_rpm unihash changed to 17f8e5b800ac687b873ee7c2138cd5b1519535d92c949692d51c69d220fb5475
NOTE: recipe coreutils-9.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package_qa unihash changed to 07ce86c89eb04890417832227e689a7ae47eaa18e733e0c652a6d2b50b5cbcfa
NOTE: recipe coreutils-9.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa unihash changed to e5f37599ecf61b7bf5ad854f2c9224b9a3a477f2901244cf790d8d0786d5974d
NOTE: recipe coreutils-9.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm unihash changed to 60891a9145902c2b9d327aa55e49d23c499ebf2bb30aebe3df3752f5e3c152c4
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb unihash changed to 001c653d1f0a0b210c07dded8ea649fe4b5637358ea1e682d16d40f8ca5fd696
NOTE: recipe coreutils-9.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2486 tasks of which 2439 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201065615.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201065615.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/coreutils/9.6/temp/log.do_package_qa.2226957
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: File /usr/lib/coreutils/ptest/Makefile in package coreutils-ptest contains reference to TMPDIR [buildpaths]
ERROR: coreutils-9.6-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/coreutils/9.6/temp/log.do_package_qa.2226957
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_package_qa) failed with exit code '1'

--===============6136840475915476914==--

