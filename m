Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B838C531C7
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1410.1771440094592340505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HcxnhPUC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nMQu4se9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c720ed212-3bcc8dde-0640-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h0JTxMRp1pHd9YdNB+GbI8VQMz0ul5wuFD2AntUGD0w=;
	b=HcxnhPUCWuVJETnLCQq2Cvk3ci/WF8eEGLlqL0iKuOXS+yLfyYBBYLtXBkRpeWaX
	PvlTkieu1SAJ47pXnhFs6UR9SvTveIUPB4saanjQXmJnmdYHG3JwQ9kBgVuHVWL/SCf
	jRW0zVD75MezLPXI8MGbHz2M3SuiStNlls0j8rSk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h0JTxMRp1pHd9YdNB+GbI8VQMz0ul5wuFD2AntUGD0w=;
	b=nMQu4se9rgd+2ZwUBpnScN3H+emR1ZZ75BmSqAuVBmVpxG08EckGBWVigptALJL3
	Idnw3OK9ujpf58/Sp86VafcZX3yHwJlyevnPgOcrgfYdXZeZNlPfChvJ3abtLOoKtGj
	x/elMJlVeUN6qV718MZKz17GYMmgXknJ5HMUYUnw=
Content-Type: multipart/mixed; boundary="===============7696520231111117786=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zlib: upgrading to 1.3.2 SUCCEEDED
Message-ID: <0101019c720ed212-3bcc8dde-0640-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231346

--===============7696520231111117786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *zlib* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zlib-upgrade-1.3.1-1.3.2.patch
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
From 8d7bc339a0e3233de0d89d3a80d3f78c8d88d7e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:41:39 +0000
Subject: [PATCH] zlib: upgrade 1.3.1 -> 1.3.2

---
 ...configure-Pass-LDFLAGS-to-link-tests.patch | 78 -------------------
 .../zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb}     |  3 +-
 2 files changed, 1 insertion(+), 80 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
 rename meta/recipes-core/zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb} (90%)

diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
deleted file mode 100644
index 07b2cd3879..0000000000
--- a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ea77f1f003a4d18b23cca703f3c824942863a1b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Mar 2022 22:38:47 -0800
-Subject: [PATCH] configure: Pass LDFLAGS to link tests
-
-LDFLAGS can contain critical flags without which linking wont succeed
-therefore ensure that all configure tests involving link time checks are
-using LDFLAGS on compiler commandline along with CFLAGS to ensure the
-tests perform correctly. Without this some tests may fail resulting in
-wrong confgure result, ending in miscompiling the package
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index c55098a..a7c6d72 100755
---- a/configure
-+++ b/configure
-@@ -443,7 +443,7 @@ if test $shared -eq 1; then
-   echo Checking for shared library support... | tee -a configure.log
-   # we must test in two steps (cc then ld), required at least on SunOS 4.x
-   if try $CC -c $SFLAGS $test.c &&
--     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
-+     try $LDSHARED $SFLAGS $LDFLAGS -o $test$shared_ext $test.o; then
-     echo Building shared library $SHAREDLIBV with $CC. | tee -a configure.log
-   elif test -z "$old_cc" -a -z "$old_cflags"; then
-     echo No shared library support. | tee -a configure.log
-@@ -505,7 +505,7 @@ int main(void) {
- }
- EOF
-   fi
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     sizet=`./$test`
-     echo "Checking for a pointer-size integer type..." $sizet"." | tee -a configure.log
-     CFLAGS="${CFLAGS} -DNO_SIZE_T=${sizet}"
-@@ -539,7 +539,7 @@ int main(void) {
-   return 0;
- }
- EOF
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for fseeko... Yes." | tee -a configure.log
-   else
-     CFLAGS="${CFLAGS} -DNO_FSEEKO"
-@@ -556,7 +556,7 @@ cat > $test.c <<EOF
- #include <errno.h>
- int main() { return strlen(strerror(errno)); }
- EOF
--if try $CC $CFLAGS -o $test $test.c; then
-+if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-   echo "Checking for strerror... Yes." | tee -a configure.log
- else
-   CFLAGS="${CFLAGS} -DNO_STRERROR"
-@@ -663,7 +663,7 @@ int main()
-   return (mytest("Hello%d\n", 1));
- }
- EOF
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configure.log
- 
-     echo >> configure.log
-@@ -753,7 +753,7 @@ int main()
- }
- EOF
- 
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for snprintf() in stdio.h... Yes." | tee -a configure.log
- 
-     echo >> configure.log
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
similarity index 90%
rename from meta/recipes-core/zlib/zlib_1.3.1.bb
rename to meta/recipes-core/zlib/zlib_1.3.2.bb
index ef83142121..43e93810e0 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
-           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
+SRC_URI[sha256sum] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
-- 
2.47.1


--===============7696520231111117786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/zlib (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so.1.3.1 moved to /usr/lib/libz.so.1.3.2
packages/x86-64-v3-poky-linux/zlib/zlib: FILELIST: removed "/usr/lib/libz.so.1.3.1", added "/usr/lib/libz.so.1.3.2"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/zlib-native (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so.1.3.1 moved to /usr/lib/libz.so.1.3.2

--===============7696520231111117786==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zlib-upgrade-1.3.1-1.3.2.patch"

RnJvbSA4ZDdiYzMzOWEwZTMyMzNkZTBkODlkM2E4MGQzZjc4YzhkODhkN2U4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6NDE6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB6
bGliOiB1cGdyYWRlIDEuMy4xIC0+IDEuMy4yCgotLS0KIC4uLmNvbmZpZ3VyZS1QYXNzLUxERkxB
R1MtdG8tbGluay10ZXN0cy5wYXRjaCB8IDc4IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi96bGli
L3t6bGliXzEuMy4xLmJiID0+IHpsaWJfMS4zLjIuYmJ9ICAgICB8ICAzICstCiAyIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtY29yZS96bGliL3psaWIvMDAwMS1jb25maWd1cmUtUGFzcy1MREZMQUdT
LXRvLWxpbmstdGVzdHMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS96bGliL3t6bGli
XzEuMy4xLmJiID0+IHpsaWJfMS4zLjIuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvemxpYi96bGliLzAwMDEtY29uZmlndXJlLVBhc3MtTERGTEFHUy10by1saW5rLXRl
c3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvemxpYi96bGliLzAwMDEtY29uZmlndXJlLVBh
c3MtTERGTEFHUy10by1saW5rLXRlc3RzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwN2IyY2QzODc5Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3psaWIv
emxpYi8wMDAxLWNvbmZpZ3VyZS1QYXNzLUxERkxBR1MtdG8tbGluay10ZXN0cy5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDc4ICswLDAgQEAKLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFto
dHRwczovL2dpdGh1Yi5jb20vbWFkbGVyL3psaWIvcHVsbC81OTldCi1TaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLQotRnJvbSBlYTc3ZjFmMDAzYTRkMThi
MjNjY2E3MDNmM2M4MjQ5NDI4NjNhMWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFR1ZSwgOCBNYXIgMjAyMiAyMjoz
ODo0NyAtMDgwMAotU3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IFBhc3MgTERGTEFHUyB0byBs
aW5rIHRlc3RzCi0KLUxERkxBR1MgY2FuIGNvbnRhaW4gY3JpdGljYWwgZmxhZ3Mgd2l0aG91dCB3
aGljaCBsaW5raW5nIHdvbnQgc3VjY2VlZAotdGhlcmVmb3JlIGVuc3VyZSB0aGF0IGFsbCBjb25m
aWd1cmUgdGVzdHMgaW52b2x2aW5nIGxpbmsgdGltZSBjaGVja3MgYXJlCi11c2luZyBMREZMQUdT
IG9uIGNvbXBpbGVyIGNvbW1hbmRsaW5lIGFsb25nIHdpdGggQ0ZMQUdTIHRvIGVuc3VyZSB0aGUK
LXRlc3RzIHBlcmZvcm0gY29ycmVjdGx5LiBXaXRob3V0IHRoaXMgc29tZSB0ZXN0cyBtYXkgZmFp
bCByZXN1bHRpbmcgaW4KLXdyb25nIGNvbmZndXJlIHJlc3VsdCwgZW5kaW5nIGluIG1pc2NvbXBp
bGluZyB0aGUgcGFja2FnZQotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgotCi0tLS0KLSBjb25maWd1cmUgfCAxMiArKysrKystLS0tLS0KLSAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvY29u
ZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCBjNTUwOThhLi5hN2M2ZDcyIDEwMDc1NQotLS0tIGEv
Y29uZmlndXJlCi0rKysgYi9jb25maWd1cmUKLUBAIC00NDMsNyArNDQzLDcgQEAgaWYgdGVzdCAk
c2hhcmVkIC1lcSAxOyB0aGVuCi0gICBlY2hvIENoZWNraW5nIGZvciBzaGFyZWQgbGlicmFyeSBz
dXBwb3J0Li4uIHwgdGVlIC1hIGNvbmZpZ3VyZS5sb2cKLSAgICMgd2UgbXVzdCB0ZXN0IGluIHR3
byBzdGVwcyAoY2MgdGhlbiBsZCksIHJlcXVpcmVkIGF0IGxlYXN0IG9uIFN1bk9TIDQueAotICAg
aWYgdHJ5ICRDQyAtYyAkU0ZMQUdTICR0ZXN0LmMgJiYKLS0gICAgIHRyeSAkTERTSEFSRUQgJFNG
TEFHUyAtbyAkdGVzdCRzaGFyZWRfZXh0ICR0ZXN0Lm87IHRoZW4KLSsgICAgIHRyeSAkTERTSEFS
RUQgJFNGTEFHUyAkTERGTEFHUyAtbyAkdGVzdCRzaGFyZWRfZXh0ICR0ZXN0Lm87IHRoZW4KLSAg
ICAgZWNobyBCdWlsZGluZyBzaGFyZWQgbGlicmFyeSAkU0hBUkVETElCViB3aXRoICRDQy4gfCB0
ZWUgLWEgY29uZmlndXJlLmxvZwotICAgZWxpZiB0ZXN0IC16ICIkb2xkX2NjIiAtYSAteiAiJG9s
ZF9jZmxhZ3MiOyB0aGVuCi0gICAgIGVjaG8gTm8gc2hhcmVkIGxpYnJhcnkgc3VwcG9ydC4gfCB0
ZWUgLWEgY29uZmlndXJlLmxvZwotQEAgLTUwNSw3ICs1MDUsNyBAQCBpbnQgbWFpbih2b2lkKSB7
Ci0gfQotIEVPRgotICAgZmkKLS0gIGlmIHRyeSAkQ0MgJENGTEFHUyAtbyAkdGVzdCAkdGVzdC5j
OyB0aGVuCi0rICBpZiB0cnkgJENDICRDRkxBR1MgJExERkxBR1MgLW8gJHRlc3QgJHRlc3QuYzsg
dGhlbgotICAgICBzaXpldD1gLi8kdGVzdGAKLSAgICAgZWNobyAiQ2hlY2tpbmcgZm9yIGEgcG9p
bnRlci1zaXplIGludGVnZXIgdHlwZS4uLiIgJHNpemV0Ii4iIHwgdGVlIC1hIGNvbmZpZ3VyZS5s
b2cKLSAgICAgQ0ZMQUdTPSIke0NGTEFHU30gLUROT19TSVpFX1Q9JHtzaXpldH0iCi1AQCAtNTM5
LDcgKzUzOSw3IEBAIGludCBtYWluKHZvaWQpIHsKLSAgIHJldHVybiAwOwotIH0KLSBFT0YKLS0g
IGlmIHRyeSAkQ0MgJENGTEFHUyAtbyAkdGVzdCAkdGVzdC5jOyB0aGVuCi0rICBpZiB0cnkgJEND
ICRDRkxBR1MgJExERkxBR1MgLW8gJHRlc3QgJHRlc3QuYzsgdGhlbgotICAgICBlY2hvICJDaGVj
a2luZyBmb3IgZnNlZWtvLi4uIFllcy4iIHwgdGVlIC1hIGNvbmZpZ3VyZS5sb2cKLSAgIGVsc2UK
LSAgICAgQ0ZMQUdTPSIke0NGTEFHU30gLUROT19GU0VFS08iCi1AQCAtNTU2LDcgKzU1Niw3IEBA
IGNhdCA+ICR0ZXN0LmMgPDxFT0YKLSAjaW5jbHVkZSA8ZXJybm8uaD4KLSBpbnQgbWFpbigpIHsg
cmV0dXJuIHN0cmxlbihzdHJlcnJvcihlcnJubykpOyB9Ci0gRU9GCi0taWYgdHJ5ICRDQyAkQ0ZM
QUdTIC1vICR0ZXN0ICR0ZXN0LmM7IHRoZW4KLStpZiB0cnkgJENDICRDRkxBR1MgJExERkxBR1Mg
LW8gJHRlc3QgJHRlc3QuYzsgdGhlbgotICAgZWNobyAiQ2hlY2tpbmcgZm9yIHN0cmVycm9yLi4u
IFllcy4iIHwgdGVlIC1hIGNvbmZpZ3VyZS5sb2cKLSBlbHNlCi0gICBDRkxBR1M9IiR7Q0ZMQUdT
fSAtRE5PX1NUUkVSUk9SIgotQEAgLTY2Myw3ICs2NjMsNyBAQCBpbnQgbWFpbigpCi0gICByZXR1
cm4gKG15dGVzdCgiSGVsbG8lZFxuIiwgMSkpOwotIH0KLSBFT0YKLS0gIGlmIHRyeSAkQ0MgJENG
TEFHUyAtbyAkdGVzdCAkdGVzdC5jOyB0aGVuCi0rICBpZiB0cnkgJENDICRDRkxBR1MgJExERkxB
R1MgLW8gJHRlc3QgJHRlc3QuYzsgdGhlbgotICAgICBlY2hvICJDaGVja2luZyBmb3IgdnNucHJp
bnRmKCkgaW4gc3RkaW8uaC4uLiBZZXMuIiB8IHRlZSAtYSBjb25maWd1cmUubG9nCi0gCi0gICAg
IGVjaG8gPj4gY29uZmlndXJlLmxvZwotQEAgLTc1Myw3ICs3NTMsNyBAQCBpbnQgbWFpbigpCi0g
fQotIEVPRgotIAotLSAgaWYgdHJ5ICRDQyAkQ0ZMQUdTIC1vICR0ZXN0ICR0ZXN0LmM7IHRoZW4K
LSsgIGlmIHRyeSAkQ0MgJENGTEFHUyAkTERGTEFHUyAtbyAkdGVzdCAkdGVzdC5jOyB0aGVuCi0g
ICAgIGVjaG8gIkNoZWNraW5nIGZvciBzbnByaW50ZigpIGluIHN0ZGlvLmguLi4gWWVzLiIgfCB0
ZWUgLWEgY29uZmlndXJlLmxvZwotIAotICAgICBlY2hvID4+IGNvbmZpZ3VyZS5sb2cKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3psaWIvemxpYl8xLjMuMS5iYiBiL21ldGEvcmVjaXBl
cy1jb3JlL3psaWIvemxpYl8xLjMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS96bGliL3psaWJfMS4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb3JlL3psaWIvemxpYl8xLjMuMi5iYgppbmRleCBlZjgzMTQyMTIxLi40M2U5MzgxMGUw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS96bGliL3psaWJfMS4zLjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvemxpYi96bGliXzEuMy4yLmJiCkBAIC04LDEyICs4LDExIEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3psaWIuaDtiZWdpbmxpbmU9NjtlbmRsaW5lPTIzO21k
NT01Mzc3MjMyMjY4ZTk1MmU5ZWY2CiAKICMgVGhlIHNvdXJjZSB0YXJiYWxsIG5lZWRzIHRvIGJl
IC5neiBhcyBvbmx5IHRoZSAuZ3ogZW5kcyB1cCBpbiBmb3NzaWxzLwogU1JDX1VSSSA9ICJodHRw
czovL3psaWIubmV0LyR7QlB9LnRhci5neiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZp
Z3VyZS1QYXNzLUxERkxBR1MtdG8tbGluay10ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDov
L3psaWIubmV0LyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhOTNiMmI3ZGZkYWM3N2NlYmE1
YTU1OGE1ODBlNzQ2NjdkZDZmZWRlNDU4NWI5MWVlZmI2MGYwM2I3MmRmMjMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYmIzMjlhMGEyY2QwMjc0ZDA1NTE5ZDYxYzY2N2MwNjJlMDY5OTBkNzJlMTI1
ZWUyZGZhOGRlNjRmMDExOWQxNiIKIAogIyBXaGVuIGEgbmV3IHJlbGVhc2UgaXMgbWFkZSB0aGUg
cHJldmlvdXMgcmVsZWFzZSBpcyBtb3ZlZCB0byBmb3NzaWxzLywgc28gYWRkIHRoaXMKICMgdG8g
UFJFTUlSUk9SUyBzbyBpdCBpcyBhbHNvIHNlYXJjaGVkIGF1dG9tYXRpY2FsbHkuCi0tIAoyLjQ3
LjEKCg==

--===============7696520231111117786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/zlib: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib: SRC_URI changed from "https://zlib.net/zlib-1.3.1.tar.gz file://0001-configure-Pass-LDFLAGS-to-link-tests.patch file://run-ptest" to "https://zlib.net/zlib-1.3.2.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/zlib: PV changed from "1.3.1" to "1.3.2"
Changes to packages/x86-64-v3-poky-linux/zlib (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so.1.3.1 moved to /usr/lib/libz.so.1.3.2
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: FILELIST: removed "/usr/lib/.debug/libz.so.1.3.1", added "/usr/lib/.debug/libz.so.1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: PKGSIZE changed from 239824 to 247408 (+3%)
packages/x86-64-v3-poky-linux/zlib/zlib-dbg: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-dev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-dev: PKGSIZE changed from 113538 to 121028 (+7%)
packages/x86-64-v3-poky-linux/zlib/zlib-dev: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-doc: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-doc: PKGSIZE changed from 4476 to 4482 (+0%)
packages/x86-64-v3-poky-linux/zlib/zlib-doc: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-locale: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-locale: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-ptest: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-ptest: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-src: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-src: FILELIST: directory renamed /usr/src/debug/zlib/1.3.1 -> /usr/src/debug/zlib/1.3.2, directory renamed /usr/src/debug/zlib/1.3.1/test -> /usr/src/debug/zlib/1.3.2/test
packages/x86-64-v3-poky-linux/zlib/zlib-src: PKGSIZE changed from 1104981 to 1123110 (+2%)
packages/x86-64-v3-poky-linux/zlib/zlib-src: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib-staticdev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib-staticdev: PKGSIZE changed from 370924 to 380358 (+3%)
packages/x86-64-v3-poky-linux/zlib/zlib-staticdev: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/zlib/zlib: FILELIST: removed "/usr/lib/libz.so.1.3.1", added "/usr/lib/libz.so.1.3.2"
packages/x86-64-v3-poky-linux/zlib/zlib: PV changed from "1.3.1" to "1.3.2"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/zlib-native (sysroot):
  /usr/lib/libz.so.1 changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so changed symlink target from libz.so.1.3.1 to libz.so.1.3.2
  /usr/lib/libz.so.1.3.1 moved to /usr/lib/libz.so.1.3.2

--===============7696520231111117786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e1c8b48aa72456abff81fc189a80b871e222f172"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:e1c8b48aa72456abff81fc189a80b871e222f172"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 187 Local 95 Mirrors 0 Missed 92 Current 255 (50% match, 79% complete)
done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 355 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 384 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 396 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 406 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 407 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 411 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 416 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 419 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 420 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 422 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 424 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 425 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 426 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 429 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 435 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 437 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 438 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 439 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 419 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 440 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 487 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_fetch)
NOTE: Running noexec task 501 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_fetch)
NOTE: Running task 503 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 582 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: Running noexec task 717 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_fetch: Started
NOTE: Running noexec task 791 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running task 793 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 795 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Started
NOTE: Running task 818 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 819 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 873 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 874 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 914 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 915 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_unpack)
NOTE: Running task 916 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 921 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: Running task 922 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 924 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 926 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 927 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: Running task 928 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 931 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: Running task 932 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 933 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: Running task 934 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: Running task 935 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: Running task 936 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 938 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: Running task 946 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: Running task 947 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: Running task 948 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running task 949 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running noexec task 952 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running noexec task 953 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 954 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: Running task 957 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 958 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 959 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: Running task 961 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: Running task 962 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: Running task 963 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 966 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 967 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 972 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 973 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 976 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: Running task 977 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 979 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1013 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: Running task 1031 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1047 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: Running task 1048 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1049 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 1053 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: Running task 1056 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1057 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1058 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1061 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1062 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1068 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to 0cab5ecd0a07bb61c61a6db3beed6f90afa6573f5e36302eaa1c1ec1295aa8d6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_patch)
NOTE: Running task 1075 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_collect_spdx_deps)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_patch: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1076 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Setscene tasks completed
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_configure)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: Running task 1080 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1082 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1083 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1084 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_configure: Succeeded
NOTE: Running task 1085 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_compile)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: Running task 1086 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package)
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package unihash changed to fdf4d2d807d63001a4657eaa88a0118577dfcae019545059dfc6325e10574e34
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_compile: Succeeded
NOTE: Running task 1088 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_install)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_install: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_install: Succeeded
NOTE: Running task 1089 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1090 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot)
NOTE: Running task 1091 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot)
NOTE: Running task 1092 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx)
NOTE: Running task 1093 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_create_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-cross-arm-2.45.1-r0: task do_create_spdx: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot unihash changed to 0956a9036d3c0afa61a3214cc94e99136cf40a9ba228eba600008ad1f927e084
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot unihash changed to 9d70f4a4cd922f3f623254b9c48bccb6888c1f2519acf29133e86b9c12ff78e2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx became valid
NOTE: Running setscene task 427 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running task 1094 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1095 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1098 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1099 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_configure)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_configure: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1100 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_compile)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_compile: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1101 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_gcc_stash_builddir: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_gcc_stash_builddir: Succeeded
NOTE: Running task 1102 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_install)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_install: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1103 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1104 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1105 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1106 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1107 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1108 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1109 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_configure)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1110 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: Running task 1111 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_collect_spdx_deps)
NOTE: Running task 1112 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_configure: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1113 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot)
NOTE: Running task 1114 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot unihash changed to 5d19061c0392fed59059d8ac0807ebda024f4d64d1fc507ce6f8a85850b498c2
NOTE: Setscene tasks completed
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to 9a9827e0c8743d33c6d7ab5295bfb70eae77f0707170b5ce2243080d0bf71fde
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1116 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1117 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_compile)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1118 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_install)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1119 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1120 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1121 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot unihash changed to 53ff86b49dfee9096f7f957c7e1a699011eb067a9f0404c3ddddb7ef16cdde18
NOTE: Setscene tasks completed
NOTE: Running task 1122 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1123 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx)
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1124 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Started
NOTE: Running task 1125 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Succeeded
NOTE: Running task 1126 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Started
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Succeeded
NOTE: Running task 1127 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.5+git-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_install: Succeeded
NOTE: Running task 1128 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot)
NOTE: Running task 1129 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot unihash changed to 884ad2bc8cd728e9b85552a4fbb96ad8b82a3e0c55e68924309b5f2171eb6d1c
NOTE: Setscene tasks completed
NOTE: Running task 1130 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1131 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1132 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to 13651611c128b05520f8001193d320fb5fd373dc9e99773f3d5cac7cf4d63eef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Running setscene task 441 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1134 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1135 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-15.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-15.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1136 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1137 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1138 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1139 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot)
NOTE: Running task 1140 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot unihash changed to 76c433ada44d4b7d91e271cbc25bccdb3f541d9a5a06f4ebb8521f3780475e2e
NOTE: Setscene tasks completed
NOTE: Running task 1141 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1142 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_configure)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package unihash changed to cd2b4e1245b3575afab2bec46b79f4178fd7b08e39462d8b02f51b5a0911639c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 438 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1144 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1145 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1146 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot)
NOTE: Running task 1149 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot unihash changed to 5de0112aec6d7818346a8f6742573e94fa736a0d5f08f68ae9148a22b43c6ad0
NOTE: Setscene tasks completed
NOTE: Running task 1150 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1151 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1152 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1153 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1154 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: recipe libtool-cross-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1156 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1157 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: Running task 1158 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1159 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1160 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1161 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1162 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot unihash changed to a74b3f3a95269722f4073dbf4b65649db0dc839e6397918ba6ca264fa3daa50d
NOTE: Setscene tasks completed
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1163 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1164 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1165 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1166 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1167 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1168 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package unihash changed to c6dd5beb1928929f3b46859d6f432ce85871db900d87e17f76b9df030eb561b9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1170 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1171 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx)
NOTE: Running task 1172 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1173 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1174 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1175 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1176 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_collect_spdx_deps)
NOTE: Running task 1177 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_collect_spdx_deps)
NOTE: Running task 1178 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libtool-cross-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe zlib-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 6871d9c64e3e89db2b7e5f6b277ffe143b43edf3ff880f0de6bc4cf86374bd25
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1179 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1182 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: Running task 1183 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1184 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1185 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to e79e70578a50a531e7c0f6f675cacfd007f1974ed3830adb119b40d435d23aa0
NOTE: Setscene tasks completed
NOTE: recipe libtool-cross-2.5.4-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1186 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_compile)
NOTE: recipe libtool-cross-2.5.4-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1187 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_install)
NOTE: recipe libtool-cross-2.5.4-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1188 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot unihash changed to 7383f5fcae9595261289c527bf5373e58778a0f63f39e2854a6b00d718caaa97
NOTE: Running task 1189 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1190 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1191 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1192 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1193 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1194 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_collect_spdx_deps)
NOTE: Running task 1195 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1196 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1197 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1198 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: Running task 1199 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: Running task 1200 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe base-passwd-3.6.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to 2810b745ec1d44117f40a913f57c1e612384cadc12ba46faef5efa685f78d2dd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1202 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Succeeded
NOTE: Running task 1203 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Succeeded
NOTE: Running task 1204 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_install)
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot unihash changed to a1b666bad6200e737f84860a34dbdddb80bea4844bc3b6ea5d37b693c3c87f67
NOTE: Setscene tasks completed
NOTE: Running task 1206 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package)
NOTE: Running task 1207 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-sysroot-4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1208 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_configure: Succeeded
NOTE: Running task 1209 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_compile: Succeeded
NOTE: Running task 1210 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe shadow-sysroot-4.6-r0: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_install: Succeeded
NOTE: Running task 1211 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot unihash changed to b837252a50eda77c8cc74c7dc2340fa2b67045ace852e9b6e6265bd712ffcf65
NOTE: Setscene tasks completed
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1212 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package unihash changed to 820688dfe285ffb37931804bae2a6ee329702f7e828761fd40ee54bcc215aa7c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata became valid
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running task 1213 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1215 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1216 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_collect_spdx_deps)
NOTE: recipe shadow-sysroot-4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1217 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1218 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1219 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1220 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: Running task 1221 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1222 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot)
NOTE: Running task 1223 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot unihash changed to bfbeb0af60fc885e74c81d9f8f16be2c612ff153643cd4bbfcac72dc4a983025
NOTE: Setscene tasks completed
NOTE: Running task 1224 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1225 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1226 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 1227 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: Running task 1228 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot)
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot unihash changed to cc1653799567b874b4166a12846557530fcc391ec6c7b03fa283bfbf7a244d47
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 32c3036155f000b854246340c746511e8b94d5aacaabca77b2262e32e558e218
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1230 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1231 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 44ada47b3e220a2febded1c1b02bb8c4e8fcda5d4f90a6226c999f7671f972cc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1233 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: Running task 1234 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk)
NOTE: Running task 1235 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb)
NOTE: Running task 1236 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: Running task 1237 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa)
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa unihash changed to fc5427730a5f8053ce254d9e35b2d19578dc650af853505d29d583c3bec46dc2
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk unihash changed to f3b0b62458066b657d813a1fbab2590481315aedb3c8bf29507496ef3bab6b5f
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm unihash changed to a664bbd804a3cabb833513d5ac78e77db34f964e90bf18e9838f06a948db02cc
NOTE: recipe make-4.4.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb unihash changed to 55b57a8ab089952a880c224659b3047be0f832ff5de389f391bab84787fec22f
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1238 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_compile)
NOTE: recipe shadow-4.18.0-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Running task 1239 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_install)
NOTE: recipe shadow-4.18.0-r0: task do_install: Started
NOTE: recipe shadow-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1241 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package)
NOTE: Running task 1242 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot unihash changed to 2ab1a3e4bb3292bf2843fdaa37e5041c502e9d703792ead2a82d90ab6277a47a
NOTE: Setscene tasks completed
NOTE: Running task 1243 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1244 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1246 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: Running task 1247 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot unihash changed to 358a29fad2be970177e94b6d3570378304b543011ae0cb5e1687bdef6e9ac688
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.18.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package unihash changed to b17ae62aa2b4563d6fa802562c36ccf66971b23917ea868b7e2689b11bb02f23
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1249 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1250 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1251 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to 4584e418afe1ad7d949d41c308268c738148ce81caeb28665400ca83bf114131
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1254 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx)
NOTE: Running task 1255 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package_write_ipk)
NOTE: Running task 1256 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package_write_deb)
NOTE: Running task 1257 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package_write_rpm)
NOTE: Running task 1258 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package_qa)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_package_write_deb: Started
NOTE: recipe zlib-1.3.2-r0: task do_package_write_ipk: Started
NOTE: recipe zlib-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.3.2-r0: task do_package_qa: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1259 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_package_spdx)
NOTE: recipe zlib-1.3.2-r0: task do_create_package_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_package_qa: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1260 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot)
NOTE: Running task 1261 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot unihash changed to 94a2566000435ccd73b5950b1eefd2eef22e71694af4129d94c4291a0352a697
NOTE: Setscene tasks completed
NOTE: Running task 1262 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1263 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 9ee01376811fbe98ac2e5e9ff947f08290571af4b9ec7435f1e4ce5039d83261
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Running setscene task 437 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/ncurses/6.5/temp/log.do_packagedata_setscene.169233
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata)
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1266 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1267 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to d79cf783e11be73d91e47cbbcb5b3f75ddd2adf8cefa9ed1b2b125da7238fd55
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 442 of 442 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1269 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk)
NOTE: Running task 1270 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb)
NOTE: Running task 1271 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: Running task 1272 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa unihash changed to 5ad86f8d111079589448273fef97d49e8a9a52d257c02e340f0886762162e261
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb unihash changed to 2fa0b64e76d6d3c8590ab672d061a6214e463ab9075829b99f7762a99881f5bd
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to 18d39f0e52b4462bae0eeafb9bdbd37adc63488ae2690e81613b7f1460e8458b
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk unihash changed to e65af9fbe34c9884c69e45aff701175cf9f963a0aba7cefbc3b64b57eab4f100
NOTE: Running noexec task 1273 of 1273 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1273 tasks of which 1016 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7696520231111117786==--

