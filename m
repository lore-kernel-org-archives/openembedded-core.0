Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EF1EEE26F
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.29469.1694804394146914285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YEclrF8/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HOxkOnZf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36bb77-9fb938a1-10bb-45f6-b8f9-3ce3d676bf21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fWa3tX3rWBOZ2z54N2aENrfIXkWRYrwiOh7dU7pTmlA=;
	b=YEclrF8/O6BPEDkERoc074ioB2VV/OC8AJBdKrkClkuw5Peq8i3mWv3VZ5IvWulC
	ASCO8qsM1THly2f8W0p5v/Duhjm0io8VWNJE7OpLBddEcwnvgzNL6P9OH79Cp5pnFVo
	0+Jbc8skcCL8zSdBoVF9EBMBxzlV0LBpC0CW6XOk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fWa3tX3rWBOZ2z54N2aENrfIXkWRYrwiOh7dU7pTmlA=;
	b=HOxkOnZfK1ulEQJ7HqlJFoGBsNeInndztzRzBepqS02N5iFkywftJbPKkihT5hr2
	guU1iHxitDiYVB1UJGyJKXw1olhZZIM48jzQrf9vcwH+2TeYuLJY9LKTqD7bTfHPuhn
	L6KNPWDeIiTYRhjw8IJaZGE1yavoDX3R88duP3fA=
Content-Type: multipart/mixed; boundary="===============4055006338774895218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-c: upgrading to 0.17 SUCCEEDED
Message-ID: <0101018a9a36bb77-9fb938a1-10bb-45f6-b8f9-3ce3d676bf21-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187712

--===============4055006338774895218==
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
From 4d2f5214d78a9b6d0527731d6ebff10cfff30b21 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 08:42:06 +0000
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


--===============4055006338774895218==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-c-upgrade-0.16-0.17.patch"

RnJvbSA0ZDJmNTIxNGQ3OGE5YjZkMDUyNzczMWQ2ZWJmZjEwY2ZmZjMwYjIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDg6NDI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
c29uLWM6IHVwZ3JhZGUgMC4xNiAtPiAwLjE3CgotLS0KIC4uLi9qc29uLWMvMDAwMS1GaXgtYnVp
bGQtd2l0aC1jbGFuZy0xNS5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9qc29u
LWMve2pzb24tY18wLjE2LmJiID0+IGpzb24tY18wLjE3LmJifSB8IDEwICsrKy0tLQogMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMvanNvbi1jLzAwMDEtRml4LWJ1aWxk
LXdpdGgtY2xhbmctMTUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1j
L3tqc29uLWNfMC4xNi5iYiA9PiBqc29uLWNfMC4xNy5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1jL2pzb24tYy8wMDAxLUZpeC1idWlsZC13aXRoLWNs
YW5nLTE1LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWMvMDAwMS1G
aXgtYnVpbGQtd2l0aC1jbGFuZy0xNS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMjE1ZjRkODI5YS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNv
bi1jL2pzb24tYy8wMDAxLUZpeC1idWlsZC13aXRoLWNsYW5nLTE1LnBhdGNoCisrKyAvZGV2L251
bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJvbSAwMTQ1YjU3NWFjMWZlNmE3N2UwMGQ2Mzk4NjRmMjZm
YzkxY2ViMTJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KLURhdGU6IFNhdCwgMTMgQXVnIDIwMjIgMjA6Mzc6MDMgLTA3MDAKLVN1
YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIHdpdGggY2xhbmctMTUrCi0KLUZpeGVzCi1qc29uX3V0
aWwuYzo2MzozNTogZXJyb3I6IGEgZnVuY3Rpb24gZGVjbGFyYXRpb24gd2l0aG91dCBhIHByb3Rv
dHlwZSBpcyBkZXByZWNhdGVkIGluIGFsbCB2ZXJzaW9ucyBvZiBDIFstV2UKLXJyb3IsLVdzdHJp
Y3QtcHJvdG90eXBlc10KLWNvbnN0IGNoYXIgKmpzb25fdXRpbF9nZXRfbGFzdF9lcnIoKQotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dp
dGh1Yi5jb20vanNvbi1jL2pzb24tYy9wdWxsLzc4M10KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBqc29uX3V0aWwuYyB8IDIgKy0KLSAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2pz
b25fdXRpbC5jIGIvanNvbl91dGlsLmMKLWluZGV4IDk1Mjc3MGEuLjgzZDljNjggMTAwNjQ0Ci0t
LS0gYS9qc29uX3V0aWwuYwotKysrIGIvanNvbl91dGlsLmMKLUBAIC02MCw3ICs2MCw3IEBAIHN0
YXRpYyBpbnQgX2pzb25fb2JqZWN0X3RvX2ZkKGludCBmZCwgc3RydWN0IGpzb25fb2JqZWN0ICpv
YmosIGludCBmbGFncywgY29uc3QKLSAKLSBzdGF0aWMgY2hhciBfbGFzdF9lcnJbMjU2XSA9ICIi
OwotIAotLWNvbnN0IGNoYXIgKmpzb25fdXRpbF9nZXRfbGFzdF9lcnIoKQotK2NvbnN0IGNoYXIg
Kmpzb25fdXRpbF9nZXRfbGFzdF9lcnIodm9pZCkKLSB7Ci0gCWlmIChfbGFzdF9lcnJbMF0gPT0g
J1wwJykKLSAJCXJldHVybiBOVUxMOwotLS0gCi0yLjM3LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWNfMC4xNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9qc29uLWMvanNvbi1jXzAuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWNfMC4xNi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWNfMC4xNy5iYgppbmRleCAzYWJhNDFk
ZmNmLi5hZmY1YWQ1MDc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1j
L2pzb24tY18wLjE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMvanNvbi1j
XzAuMTcuYmIKQEAgLTQsMTIgKzQsMTAgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29t
L2pzb24tYy9qc29uLWMvd2lraSIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZGU1NGI2MGZiYmMzNTEyM2JhMTkzZmVhOGVlMjE2ZjIiCiAK
LVNSQ19VUkkgPSAiIFwKLSAgICBodHRwczovL3MzLmFtYXpvbmF3cy5jb20vanNvbi1jX3JlbGVh
c2VzL3JlbGVhc2VzLyR7QlB9LnRhci5neiBcCi0gICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLXdp
dGgtY2xhbmctMTUucGF0Y2ggXAotICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjhlNDVhYzhmOTZlYzc3OTFlYWYzYmI3ZWU1MGU5YzIxMDBiYmJjODdiOGQw
ZjFkMDMwYzViYThhMDI4OGQ5NmIiCitTUkNfVVJJID0gImh0dHBzOi8vczMuYW1hem9uYXdzLmNv
bS9qc29uLWNfcmVsZWFzZXMvcmVsZWFzZXMvJHtCUH0udGFyLmd6IFwKKyAgICAgICAgICAgZmls
ZTovL3J1bi1wdGVzdCBcCisgICAgICAgICAgICIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NTUw
OTE0ZDU4ZmI2M2IyYzM1NDZmM2NjZmJlMTFmMWMwOTQxNDdiZDMxYTY5ZGNkMjM3MTRkNzk1NjE1
OWU2IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tLyR7QlBOfS8k
e0JQTn0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImpzb24tYy0oP1A8cHZlcj5cZCso
XC5cZCspKyktXGQrIgotLSAKMi4zOS4yCgo=

--===============4055006338774895218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/json-c/json-c-dbg: PKGSIZE changed from 549996 to 591660 (+8%)
packages/core2-32-poky-linux/json-c/json-c-dbg: FILELIST: removed "/usr/lib/.debug/libjson-c.so.5.2.0", added "/usr/lib/json-c/ptest/tests/.debug/test_json_patch /usr/lib/.debug/libjson-c.so.5.3.0 /usr/lib/json-c/ptest/tests/.debug/test_int_get"
packages/core2-32-poky-linux/json-c/json-c-dbg: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-dbg: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-dev: PKGSIZE changed from 107760 to 111942 (+4%)
packages/core2-32-poky-linux/json-c/json-c-dev: FILELIST: added "/usr/include/json-c/json_patch.h"
packages/core2-32-poky-linux/json-c/json-c-dev: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-dev: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-doc: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-doc: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-locale: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-locale: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-ptest: PKGSIZE changed from 449388 to 503686 (+12%)
packages/core2-32-poky-linux/json-c/json-c-ptest: FILELIST: added "/usr/lib/json-c/ptest/tests/test_json_patch.test /usr/lib/json-c/ptest/tests/test_json_patch.expected /usr/lib/json-c/ptest/tests/test_json_patch /usr/lib/json-c/ptest/tests/test_int_get /usr/lib/json-c/ptest/tests/test_int_get.test /usr/lib/json-c/ptest/tests/test_int_get.expected"
packages/core2-32-poky-linux/json-c/json-c-ptest: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-ptest: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-src: PKGSIZE changed from 363315 to 395147 (+9%)
packages/core2-32-poky-linux/json-c/json-c-src: FILELIST: removed "/usr/src/debug/json-c/0.16-r0/tests/test_strerror.c /usr/src/debug/json-c/0.16-r0/tests/test4.c /usr/src/debug/json-c/0.16-r0/tests/test_float.c /usr/src/debug/json-c/0.16-r0/tests/testReplaceExisting.c /usr/src/debug/json-c/0.16-r0/strerror_override.c /usr/src/debug/json-c/0.16-r0/tests/test_set_serializer.c /usr/src/debug/json-c/0.16-r0/tests/test_util_file.c /usr/src/debug/json-c/0.16-r0/tests/test_deep_copy.c /usr/src/debug/json-c/0.16-r0/strerror_override.h /usr/src/debug/json-c/0.16-r0/json_object.c /usr/src/debug/json-c/0.16-r0/json_object_private.h /usr/src/debug/json-c/0.16-r0/tests/parse_flags.h /usr/src/debug/json-c/0.16-r0/tests/test1.c /usr/src/debug/json-c/0.16-r0/json_c_version.c /usr/src/debug/json-c/0.16-r0/tests/test_locale.c /usr/src/debug/json-c/0.16-r0/tests/test_charcase.c /usr/src/debug/json-c/0.16-r0/tests/parse_flags.c /usr/src/debug/json-c/0.16-r0/tests/test_null.c /usr/src/debug/json-c/0.16-
 r0/json_object.h /usr/src/debug/json-c/0.16-r0/tests/test_compare.c /usr/src/debug/json-c/0.16-r0/tests/test_int_add.c /usr/src/debug/json-c/0.16-r0/json_c_version.h /usr/src/debug/json-c/0.16-r0/tests/test_json_pointer.c /usr/src/debug/json-c/0.16-r0/json_util.c /usr/src/debug/json-c/0.16-r0/arraylist.c /usr/src/debug/json-c/0.16-r0/arraylist.h /usr/src/debug/json-c/0.16-r0/json_util.h /usr/src/debug/json-c/0.16-r0/tests/test_set_value.c /usr/src/debug/json-c/0.16-r0/tests/test_parse_int64.c /usr/src/debug/json-c/0.16-r0/json_pointer.h /usr/src/debug/json-c/0.16-r0/json_tokener.h /usr/src/debug/json-c/0.16-r0/tests/test_double_serializer.c /usr/src/debug/json-c/0.16-r0/tests/test_parse.c /usr/src/debug/json-c/0.16-r0/json_pointer.c /usr/src/debug/json-c/0.16-r0/json_tokener.c /usr/src/debug/json-c/0.16-r0/random_seed.c /usr/src/debug/json-c/0.16-r0/tests/test_object_iterator.c /usr/src/debug/json-c/0.16-r0/debug.c /usr/src/debug/json-c/0.16-r0/json_object_iterator.c /usr/src/debug/
 json-c/0.16-r0/json_types.h /usr/src/debug/json-c/0.16-r0/json_visit.h /usr/src/debug/json-c/0.16-r0/printbuf.h /usr/src/debug/json-c/0.16-r0/random_seed.h /usr/src/debug/json-c/0.16-r0/printbuf.c /usr/src/debug/json-c/0.16-r0/json_visit.c /usr/src/debug/json-c/0.16-r0/json_object_iterator.h /usr/src/debug/json-c/0.16-r0/linkhash.c /usr/src/debug/json-c/0.16-r0/tests/test_printbuf.c /usr/src/debug/json-c/0.16-r0/linkhash.h /usr/src/debug/json-c/0.16-r0/tests/test_visit.c /usr/src/debug/json-c/0.16-r0/tests/test2.c /usr/src/debug/json-c/0.16-r0/tests/test_cast.c", added "/usr/src/debug/json-c/0.17-r0/tests/test_strerror.c /usr/src/debug/json-c/0.17-r0/tests/test4.c /usr/src/debug/json-c/0.17-r0/tests/test_json_patch.c /usr/src/debug/json-c/0.17-r0/tests/test_float.c /usr/src/debug/json-c/0.17-r0/strerror_override.c /usr/src/debug/json-c/0.17-r0/tests/test_set_serializer.c /usr/src/debug/json-c/0.17-r0/tests/test_deep_copy.c /usr/src/debug/json-c/0.17-r0/tests/test_util_file.c /usr/sr
 c/debug/json-c/0.17-r0/strerror_override.h /usr/src/debug/json-c/0.17-r0/json_object.c /usr/src/debug/json-c/0.17-r0/json_object_private.h /usr/src/debug/json-c/0.17-r0/tests/parse_flags.h /usr/src/debug/json-c/0.17-r0/tests/test1.c /usr/src/debug/json-c/0.17-r0/json_c_version.c /usr/src/debug/json-c/0.17-r0/tests/test_locale.c /usr/src/debug/json-c/0.17-r0/tests/test_charcase.c /usr/src/debug/json-c/0.17-r0/tests/parse_flags.c /usr/src/debug/json-c/0.17-r0/tests/test_null.c /usr/src/debug/json-c/0.17-r0/json_object.h /usr/src/debug/json-c/0.17-r0/tests/test_compare.c /usr/src/debug/json-c/0.17-r0/tests/test_int_add.c /usr/src/debug/json-c/0.17-r0/tests/test_int_get.c /usr/src/debug/json-c/0.17-r0/json_c_version.h /usr/src/debug/json-c/0.17-r0/tests/test_json_pointer.c /usr/src/debug/json-c/0.17-r0/json_util.c /usr/src/debug/json-c/0.17-r0/arraylist.c /usr/src/debug/json-c/0.17-r0/arraylist.h /usr/src/debug/json-c/0.17-r0/json_util.h /usr/src/debug/json-c/0.17-r0/tests/test_set_valu
 e.c /usr/src/debug/json-c/0.17-r0/tests/test_parse_int64.c /usr/src/debug/json-c/0.17-r0/tests/testReplaceExisting.c /usr/src/debug/json-c/0.17-r0/json_pointer.h /usr/src/debug/json-c/0.17-r0/json_tokener.h /usr/src/debug/json-c/0.17-r0/tests/test_double_serializer.c /usr/src/debug/json-c/0.17-r0/tests/test_parse.c /usr/src/debug/json-c/0.17-r0/json_pointer.c /usr/src/debug/json-c/0.17-r0/json_tokener.c /usr/src/debug/json-c/0.17-r0/random_seed.c /usr/src/debug/json-c/0.17-r0/tests/test_object_iterator.c /usr/src/debug/json-c/0.17-r0/debug.c /usr/src/debug/json-c/0.17-r0/json_object_iterator.c /usr/src/debug/json-c/0.17-r0/json_patch.h /usr/src/debug/json-c/0.17-r0/json_types.h /usr/src/debug/json-c/0.17-r0/json_visit.h /usr/src/debug/json-c/0.17-r0/printbuf.h /usr/src/debug/json-c/0.17-r0/random_seed.h /usr/src/debug/json-c/0.17-r0/json_pointer_private.h /usr/src/debug/json-c/0.17-r0/json_patch.c /usr/src/debug/json-c/0.17-r0/json_object_iterator.h /usr/src/debug/json-c/0.17-r0/jso
 n_visit.c /usr/src/debug/json-c/0.17-r0/printbuf.c /usr/src/debug/json-c/0.17-r0/linkhash.c /usr/src/debug/json-c/0.17-r0/tests/test_printbuf.c /usr/src/debug/json-c/0.17-r0/linkhash.h /usr/src/debug/json-c/0.17-r0/tests/test_visit.c /usr/src/debug/json-c/0.17-r0/tests/test2.c /usr/src/debug/json-c/0.17-r0/tests/test_cast.c"
packages/core2-32-poky-linux/json-c/json-c-src: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-src: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c-staticdev: PKGSIZE changed from 255464 to 272192 (+7%)
packages/core2-32-poky-linux/json-c/json-c-staticdev: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c-staticdev: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c/json-c: PKGSIZE changed from 71270 to 79462 (+11%)
packages/core2-32-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.2.0", added "/usr/lib/libjson-c.so.5.3.0"
packages/core2-32-poky-linux/json-c/json-c: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c/json-c: PV changed from "0.16" to "0.17"
packages/core2-32-poky-linux/json-c: SRC_URI changed from "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.16.tar.gz file://0001-Fix-build-with-clang-15.patch file://run-ptest" to "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.17.tar.gz file://run-ptest"
packages/core2-32-poky-linux/json-c: PKGV changed from 0.16 [default] to 0.17 [default]
packages/core2-32-poky-linux/json-c: PV changed from "0.16" to "0.17"
Changes to packages/core2-32-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.2.0 to libjson-c.so.5.3.0
  /usr/lib/libjson-c.so.5.2.0 moved to /usr/lib/libjson-c.so.5.3.0
  /usr/include/json-c/json_patch.h was added

--===============4055006338774895218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/json-c/json-c-dev: FILELIST: added "/usr/include/json-c/json_patch.h"
packages/core2-32-poky-linux/json-c/json-c-ptest: FILELIST: added "/usr/lib/json-c/ptest/tests/test_json_patch.expected /usr/lib/json-c/ptest/tests/test_json_patch /usr/lib/json-c/ptest/tests/test_json_patch.test /usr/lib/json-c/ptest/tests/test_int_get.test /usr/lib/json-c/ptest/tests/test_int_get.expected /usr/lib/json-c/ptest/tests/test_int_get"
packages/core2-32-poky-linux/json-c/json-c-ptest: PKGSIZE changed from 449388 to 503686 (+12%)
packages/core2-32-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.2.0", added "/usr/lib/libjson-c.so.5.3.0"
packages/core2-32-poky-linux/json-c/json-c: PKGSIZE changed from 71270 to 79462 (+11%)
Changes to packages/core2-32-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.2.0 to libjson-c.so.5.3.0
  /usr/lib/libjson-c.so.5.2.0 moved to /usr/lib/libjson-c.so.5.3.0
  /usr/include/json-c/json_patch.h was added

--===============4055006338774895218==--

