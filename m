Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA43C47DDD
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.88869.1705340031227592485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QGm42Vc3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n4NoLkAT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d0e2fced3-487ee28c-8c83-437a-8555-1f0e8f16c570-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z4OgD5SijYlLykB08jR7aDPTcaRPdJG/7p4hOzDVauo=;
	b=QGm42Vc3jrn3xeFdF+g4u88/5AoErNXxC4Eyw4VegtcInvcS2Ry9AZqxod0f7r/P
	CrtC1eJ1CaLTyks55MIuIRFMfZCO+HeKR9zQ9xAcevBHqcH3/zmcITOWQy3NHExQDOt
	H2kvzyn5hcGyrUUE3Ragnrjs261ipNDzA3SXB12M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z4OgD5SijYlLykB08jR7aDPTcaRPdJG/7p4hOzDVauo=;
	b=n4NoLkATgfEiY4to/mfVFQm7/yTRiCqdXnmj6CdXjB98+SsMEqgvXxWgj5z5pglO
	nUEq+75RNz0GPMNoVmNnYNRhipJlOt47IeOTmjgZUFu0iESfcRAzqqkDNb7JLvf27TK
	WsIVLfq9zbwquX/d3Zt84K7Y6rRh0IusErZsOKSo=
Content-Type: multipart/mixed; boundary="===============1054339067740779396=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.0.1 SUCCEEDED
Message-ID: <0101018d0e2fced3-487ee28c-8c83-437a-8555-1f0e8f16c570-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193771

--===============1054339067740779396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *virglrenderer* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.0.0-1.0.1.patch
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
From 6eb4551b283fce6b619c1905db867f1891f9a00e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 12:49:48 +0000
Subject: [PATCH] virglrenderer: upgrade 1.0.0 -> 1.0.1

---
 ...uild-use-python3-directly-for-python.patch |  6 +-
 ...st-Fix-undefined-behavior-with-clang.patch | 56 -------------------
 ...nderer_1.0.0.bb => virglrenderer_1.0.1.bb} |  3 +-
 3 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.0.0.bb => virglrenderer_1.0.1.bb} (92%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 06379ee716..dfd5438e57 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 2afe24fc95dbb89e99df29ccbe73afa835f58202 Mon Sep 17 00:00:00 2001
+From a961f8df2a2fb7cd01c68c3898073c5654de0a3b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index de6d16b5..79cedbf6 100644
+index 9f91ff2f..2391f89d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -68,7 +68,7 @@ flags = [
+@@ -74,7 +74,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
deleted file mode 100644
index 48488d7be1..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ea328b246d093477cf26a68b42e975aaaef6abad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Nov 2023 21:55:36 -0800
-Subject: [PATCH] vtest: Fix undefined behavior with clang
-
-This is seen when compiling with CC="clang -D_FORTIFY_SOURCE=2"
-Move #ifdef outside of printf() call.
-
-Fixes
-
-| ../git/vtest/vtest_server.c:244:2: error: embedding a directive within macro arguments has undefined behavior [-Werror,-Wembedded-directive]
-|   244 | #ifdef ENABLE_VENUS
-|       |  ^
-| ../git/vtest/vtest_server.c:246:2: error: embedding a directive within macro arguments has undefined behavior [-Werror,-Wembedded-directive]
-|   246 | #endif
-|       |  ^
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1309]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- vtest/vtest_server.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
-index 1ca7f74f..93d949d7 100644
---- a/vtest/vtest_server.c
-+++ b/vtest/vtest_server.c
-@@ -197,6 +197,12 @@ static void vtest_server_parse_args(int argc, char **argv)
-    /* getopt_long stores the option index here. */
-    int option_index = 0;
- 
-+#ifdef ENABLE_VENUS
-+   char* ven = " [--venus]";
-+#else
-+   char* ven = "";
-+#endif
-+
-    do {
-       ret = getopt_long(argc, argv, "", long_options, &option_index);
- 
-@@ -244,10 +250,8 @@ static void vtest_server_parse_args(int argc, char **argv)
-          printf("Usage: %s [--no-fork] [--no-loop-or-fork] [--multi-clients] "
-                 "[--use-glx] [--use-egl-surfaceless] [--use-gles] [--no-virgl]"
-                 "[--rendernode <dev>] [--socket-path <path>] "
--#ifdef ENABLE_VENUS
--                " [--venus]"
--#endif
--                " [file]\n", argv[0]);
-+                "%s"
-+                " [file]\n", argv[0], ven);
-          exit(EXIT_FAILURE);
-          break;
-       }
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
similarity index 92%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
index eb7ba1089f..0501b0c59c 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "9c9d55ecbe502e0d71ee99529709efcca69aac42"
+SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-vtest-Fix-undefined-behavior-with-clang.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============1054339067740779396==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.0.0-1.0.1.patch"

RnJvbSA2ZWI0NTUxYjI4M2ZjZTZiNjE5YzE5MDVkYjg2N2YxODkxZjlhMDBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTI6NDk6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMC4wIC0+IDEuMC4xCgotLS0KIC4uLnVpbGQtdXNlLXB5
dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8ICA2ICstCiAuLi5zdC1GaXgtdW5kZWZp
bmVkLWJlaGF2aW9yLXdpdGgtY2xhbmcucGF0Y2ggfCA1NiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5uZGVyZXJfMS4wLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjAuMS5iYn0gfCAgMyArLQogMyBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS12dGVzdC1GaXgtdW5kZWZpbmVkLWJlaGF2aW9yLXdpdGgtY2xhbmcucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci97dmlyZ2xyZW5kZXJlcl8x
LjAuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMC4xLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNv
bi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxk
LXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXggMDYzNzllZTcxNi4u
ZGZkNTQzOGU1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVy
ZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZv
ci1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIv
dmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1w
eXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJhZmUyNGZjOTVkYmI4OWU5OWRmMjlj
Y2JlNzNhZmE4MzVmNTgyMDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE5NjFmOGRm
MmEyZmI3Y2QwMWM2OGMzODk4MDczYzU2NTRkZTBhM2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IE1vbiwgNiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbi5i
dWlsZDogdXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0xNCwxMCArMTQsMTAg
QEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBkZTZkMTZiNS4uNzlj
ZWRiZjYgMTAwNjQ0CitpbmRleCA5ZjkxZmYyZi4uMjM5MWY4OWQgMTAwNjQ0CiAtLS0gYS9tZXNv
bi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC02OCw3ICs2OCw3IEBAIGZsYWdzID0gWwor
QEAgLTc0LDcgKzc0LDcgQEAgZmxhZ3MgPSBbCiAgCiAgYWRkX3Byb2plY3RfYXJndW1lbnRzKGNj
LmdldF9zdXBwb3J0ZWRfYXJndW1lbnRzKGZsYWdzKSwgbGFuZ3VhZ2UgOiAnYycpCiAgCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVy
LzAwMDEtdnRlc3QtRml4LXVuZGVmaW5lZC1iZWhhdmlvci13aXRoLWNsYW5nLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZ0ZXN0
LUZpeC11bmRlZmluZWQtYmVoYXZpb3Itd2l0aC1jbGFuZy5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggNDg0ODhkN2JlMS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtdnRlc3QtRml4LXVuZGVm
aW5lZC1iZWhhdmlvci13aXRoLWNsYW5nLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTYgKzAs
MCBAQAotRnJvbSBlYTMyOGIyNDZkMDkzNDc3Y2YyNmE2OGI0MmU5NzVhYWFlZjZhYmFkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
LURhdGU6IFR1ZSwgMjggTm92IDIwMjMgMjE6NTU6MzYgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSF0g
dnRlc3Q6IEZpeCB1bmRlZmluZWQgYmVoYXZpb3Igd2l0aCBjbGFuZwotCi1UaGlzIGlzIHNlZW4g
d2hlbiBjb21waWxpbmcgd2l0aCBDQz0iY2xhbmcgLURfRk9SVElGWV9TT1VSQ0U9MiIKLU1vdmUg
I2lmZGVmIG91dHNpZGUgb2YgcHJpbnRmKCkgY2FsbC4KLQotRml4ZXMKLQotfCAuLi9naXQvdnRl
c3QvdnRlc3Rfc2VydmVyLmM6MjQ0OjI6IGVycm9yOiBlbWJlZGRpbmcgYSBkaXJlY3RpdmUgd2l0
aGluIG1hY3JvIGFyZ3VtZW50cyBoYXMgdW5kZWZpbmVkIGJlaGF2aW9yIFstV2Vycm9yLC1XZW1i
ZWRkZWQtZGlyZWN0aXZlXQotfCAgIDI0NCB8ICNpZmRlZiBFTkFCTEVfVkVOVVMKLXwgICAgICAg
fCAgXgotfCAuLi9naXQvdnRlc3QvdnRlc3Rfc2VydmVyLmM6MjQ2OjI6IGVycm9yOiBlbWJlZGRp
bmcgYSBkaXJlY3RpdmUgd2l0aGluIG1hY3JvIGFyZ3VtZW50cyBoYXMgdW5kZWZpbmVkIGJlaGF2
aW9yIFstV2Vycm9yLC1XZW1iZWRkZWQtZGlyZWN0aXZlXQotfCAgIDI0NiB8ICNlbmRpZgotfCAg
ICAgICB8ICBeCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci8tL21lcmdlX3JlcXVlc3RzLzEzMDld
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gdnRl
c3QvdnRlc3Rfc2VydmVyLmMgfCAxMiArKysrKysrKy0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvdnRlc3QvdnRlc3Rf
c2VydmVyLmMgYi92dGVzdC92dGVzdF9zZXJ2ZXIuYwotaW5kZXggMWNhN2Y3NGYuLjkzZDk0OWQ3
IDEwMDY0NAotLS0tIGEvdnRlc3QvdnRlc3Rfc2VydmVyLmMKLSsrKyBiL3Z0ZXN0L3Z0ZXN0X3Nl
cnZlci5jCi1AQCAtMTk3LDYgKzE5NywxMiBAQCBzdGF0aWMgdm9pZCB2dGVzdF9zZXJ2ZXJfcGFy
c2VfYXJncyhpbnQgYXJnYywgY2hhciAqKmFyZ3YpCi0gICAgLyogZ2V0b3B0X2xvbmcgc3RvcmVz
IHRoZSBvcHRpb24gaW5kZXggaGVyZS4gKi8KLSAgICBpbnQgb3B0aW9uX2luZGV4ID0gMDsKLSAK
LSsjaWZkZWYgRU5BQkxFX1ZFTlVTCi0rICAgY2hhciogdmVuID0gIiBbLS12ZW51c10iOwotKyNl
bHNlCi0rICAgY2hhciogdmVuID0gIiI7Ci0rI2VuZGlmCi0rCi0gICAgZG8gewotICAgICAgIHJl
dCA9IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3YsICIiLCBsb25nX29wdGlvbnMsICZvcHRpb25faW5k
ZXgpOwotIAotQEAgLTI0NCwxMCArMjUwLDggQEAgc3RhdGljIHZvaWQgdnRlc3Rfc2VydmVyX3Bh
cnNlX2FyZ3MoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotICAgICAgICAgIHByaW50ZigiVXNhZ2U6
ICVzIFstLW5vLWZvcmtdIFstLW5vLWxvb3Atb3ItZm9ya10gWy0tbXVsdGktY2xpZW50c10gIgot
ICAgICAgICAgICAgICAgICAiWy0tdXNlLWdseF0gWy0tdXNlLWVnbC1zdXJmYWNlbGVzc10gWy0t
dXNlLWdsZXNdIFstLW5vLXZpcmdsXSIKLSAgICAgICAgICAgICAgICAgIlstLXJlbmRlcm5vZGUg
PGRldj5dIFstLXNvY2tldC1wYXRoIDxwYXRoPl0gIgotLSNpZmRlZiBFTkFCTEVfVkVOVVMKLS0g
ICAgICAgICAgICAgICAgIiBbLS12ZW51c10iCi0tI2VuZGlmCi0tICAgICAgICAgICAgICAgICIg
W2ZpbGVdXG4iLCBhcmd2WzBdKTsKLSsgICAgICAgICAgICAgICAgIiVzIgotKyAgICAgICAgICAg
ICAgICAiIFtmaWxlXVxuIiwgYXJndlswXSwgdmVuKTsKLSAgICAgICAgICBleGl0KEVYSVRfRkFJ
TFVSRSk7Ci0gICAgICAgICAgYnJlYWs7Ci0gICAgICAgfQotLS0gCi0yLjQzLjAKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8x
LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXJfMS4wLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjAuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjAuMS5i
YgppbmRleCBlYjdiYTEwODlmLi4wNTAxYjBjNTljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4wLjEuYmIKQEAg
LTksMTAgKzksOSBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQxOGZjYThmODgzMDlhNzZkYjEwIgogCiBERVBFTkRT
ID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFsL2VnbCB2aXJ0dWFsL2xpYmdibSIKLVNSQ1JFViA9
ICI5YzlkNTVlY2JlNTAyZTBkNzFlZTk5NTI5NzA5ZWZjY2E2OWFhYzQyIgorU1JDUkVWID0gIjY5
MDY4MGU1ZjBmOTUyZTIyNDI0ZmNhMTUzOGMxYjI0NDU3YTA4NjgiCiBTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC11
c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
LzAwMDEtdnRlc3QtRml4LXVuZGVmaW5lZC1iZWhhdmlvci13aXRoLWNsYW5nLnBhdGNoIFwKICAg
ICAgICAgICAgIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40Mi4wCgo=

--===============1054339067740779396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/virglrenderer (sysroot):
  /usr/lib/libvirglrenderer.so.1 changed symlink target from libvirglrenderer.so.1.8.8 to libvirglrenderer.so.1.8.9
  /usr/lib/libvirglrenderer.so.1.8.8 moved to /usr/lib/libvirglrenderer.so.1.8.9
  /usr/include/virgl/virgl-version.h was added
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dev: FILELIST: added "/usr/include/virgl/virgl-version.h"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dev: PKGSIZE changed from 17469 to 19963 (+14%)
packages/core2-64-poky-linux/virglrenderer/virglrenderer: FILELIST: removed "/usr/lib/libvirglrenderer.so.1.8.8", added "/usr/lib/libvirglrenderer.so.1.8.9"

--===============1054339067740779396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/virglrenderer: SRC_URI changed from "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https file://0001-meson.build-use-python3-directly-for-python.patch file://0001-vtest-Fix-undefined-behavior-with-clang.patch" to "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https file://0001-meson.build-use-python3-directly-for-python.patch"
packages/core2-64-poky-linux/virglrenderer: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer: PV changed from "1.0.0" to "1.0.1"
Changes to packages/core2-64-poky-linux/virglrenderer (sysroot):
  /usr/lib/libvirglrenderer.so.1 changed symlink target from libvirglrenderer.so.1.8.8 to libvirglrenderer.so.1.8.9
  /usr/lib/libvirglrenderer.so.1.8.8 moved to /usr/lib/libvirglrenderer.so.1.8.9
  /usr/include/virgl/virgl-version.h was added
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dbg: PKGSIZE changed from 26998768 to 28495288 (+6%)
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dbg: FILELIST: removed "/usr/lib/.debug/libvirglrenderer.so.1.8.8", added "/usr/lib/.debug/libvirglrenderer.so.1.8.9"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dbg: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dbg: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dev: PKGSIZE changed from 17469 to 19963 (+14%)
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dev: FILELIST: added "/usr/include/virgl/virgl-version.h"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer-dev: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-doc: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer-doc: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-locale: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer-locale: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-src: PKGSIZE changed from 5665951 to 5953728 (+5%)
packages/core2-64-poky-linux/virglrenderer/virglrenderer-src: FILELIST: directory renamed /usr/src/debug/virglrenderer/1.0.0/src/gallium -> /usr/src/debug/virglrenderer/1.0.1/src/gallium, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/gallium/auxiliary/cso_cache -> /usr/src/debug/virglrenderer/1.0.1/src/gallium/auxiliary/cso_cache, directory renamed /usr/src/debug/virglrenderer/1.0.0/server -> /usr/src/debug/virglrenderer/1.0.1/server, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/gallium/auxiliary/util -> /usr/src/debug/virglrenderer/1.0.1/src/gallium/auxiliary/util, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/venus -> /usr/src/debug/virglrenderer/1.0.1/src/venus, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/proxy -> /usr/src/debug/virglrenderer/1.0.1/src/proxy, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/venus/venus-protocol -> /usr/src/debug/virglrenderer/1.0.1/src/venus/venus-protocol, directory renamed /usr/src/debug/vir
 glrenderer/1.0.0/src/gallium/include/pipe -> /usr/src/debug/virglrenderer/1.0.1/src/gallium/include/pipe, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/drm -> /usr/src/debug/virglrenderer/1.0.1/src/drm, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/gallium/auxiliary/tgsi -> /usr/src/debug/virglrenderer/1.0.1/src/gallium/auxiliary/tgsi, directory renamed /usr/src/debug/virglrenderer/1.0.0/src/mesa/compat/c11 -> /usr/src/debug/virglrenderer/1.0.1/src/mesa/compat/c11, directory renamed /usr/src/debug/virglrenderer/1.0.0/src -> /usr/src/debug/virglrenderer/1.0.1/src, removed "/usr/src/debug/virglrenderer/1.0.0/src/mesa/util/hash_table.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/list.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/hash_table.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/pipe/p_compiler.h /usr/src/debug/virglrenderer/1.0.0/vtest/vtest_renderer.c /usr/src/debug/virglrenderer/1.0.0/vtest/util.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/util
 /u_thread.h /usr/src/debug/virglrenderer/1.0.0/vtest/util.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/anon_file.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/ralloc.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/anon_file.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/ralloc.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/u_math.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/xxhash.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/bitscan.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/libsync.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/os_file.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/os_misc.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/u_debug.h /usr/src/debug/virglrenderer/1.0.0/vtest/vtest.h /usr/src/debug/virglrenderer/1.0.0/vtest/vtest_protocol.h /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/os_file.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/os_misc.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/u_debug.c /usr
 /src/debug/virglrenderer/1.0.0/vtest/vtest_shm.c /usr/src/debug/virglrenderer/1.0.0/src/mesa/util/fast_urem_by_const.h /usr/src/debug/virglrenderer/1.0.0/vtest/vtest_shm.h /usr/src/debug/virglrenderer/1.0.0/vtest/vtest_server.c", added "/usr/src/debug/virglrenderer/1.0.1/src/mesa/util/hash_table.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/list.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/hash_table.c /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_renderer.c /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_main.c /usr/src/debug/virglrenderer/1.0.1/vtest/util.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/u_thread.h /usr/src/debug/virglrenderer/1.0.1/vtest/util.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/anon_file.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/ralloc.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/anon_file.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/xxhash.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/ralloc.h /usr/src/debug/v
 irglrenderer/1.0.1/src/mesa/util/u_math.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/u_debug.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/bitscan.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/libsync.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/os_file.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/os_misc.h /usr/src/debug/virglrenderer/1.0.1/vtest/vtest.h /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_protocol.h /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/os_file.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/os_misc.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/u_debug.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/u_formats.h /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_shm.c /usr/src/debug/virglrenderer/1.0.1/src/mesa/util/fast_urem_by_const.h /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_shm.h /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_server.c /usr/src/debug/virglrenderer/1.0.1/vtest/vtest_server.h"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-src: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer-src: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/virglrenderer/virglrenderer-staticdev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer-staticdev: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/virglrenderer/virglrenderer: PKGSIZE changed from 2725521 to 2886161 (+6%)
packages/core2-64-poky-linux/virglrenderer/virglrenderer: FILELIST: removed "/usr/lib/libvirglrenderer.so.1.8.8", added "/usr/lib/libvirglrenderer.so.1.8.9"
packages/core2-64-poky-linux/virglrenderer/virglrenderer: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/virglrenderer/virglrenderer: PV changed from "1.0.0" to "1.0.1"

--===============1054339067740779396==--

