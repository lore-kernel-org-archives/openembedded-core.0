Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60873C2FC1A
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5939.1689456454169559596
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HaCsGwMv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101895b73a680-ef7e4e7f-3d79-4194-a94b-39c4bc79bd19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1ACbkg2aBUWNWDb96w1R2FfKev6X/55QXoZsU1imqvY=;
	b=HaCsGwMvmSISM2zeDXAVRFoJFvj3rmewWJVXScN/Hff1HD3Cad7eVXsx69Bk4mUc
	XqMyN/a/DnrD10SuSj+sJjmEts8q5BzK+31RBbg0wmG1EN/lkLClSg9dJyu8gdYyEoh
	rjxy3yuRMLeGu1K3mQbUU6GBkjAXelNkCIkZ3lpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1ACbkg2aBUWNWDb96w1R2FfKev6X/55QXoZsU1imqvY=;
	b=ZGabTgz3UX7QB+GcM/YS/o/SynxbFxGFkXI12zQM9cEXx10vOcu8bGdT4P/HbFQg
	DUtnyahf4vP8PbNBUg2AaF+l7MPvhXM6vQX1OqYa4hdDTmYjXErek0/pughik5JlWJM
	12G5Aly7Cfi7RBy6yzIXpeKg7SmerjPgU4hnkrQ4=
Content-Type: multipart/mixed; boundary="===============7104022713462365529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39.1 FAILED
Message-ID: <010101895b73a680-ef7e4e7f-3d79-4194-a94b-39c4bc79bd19-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184325

--===============7104022713462365529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.39.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.38.1-2.39.1.patch
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
From 8b69bbaff1a8387bd97648a7eda99175074a0ede Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:31:48 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.38.1 -> 2.39.1

---
 ...2.38.1.bb => util-linux-libuuid_2.39.1.bb} | 22 ++++++++
 meta/recipes-core/util-linux/util-linux.inc   |  8 ++-
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 4 files changed, 25 insertions(+), 98 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.1.bb} (40%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
similarity index 40%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
index 5d759aed94..72db8f400f 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.licensing
+# +++ README.licensing
+# @@ -9,6 +9,8 @@
+#     * GPL-2.0            - GNU General Public License version 2
+#  
+#     * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
+# +
+# +   * BSD-2-Clause       - Simplified BSD License
+#  
+#     * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
+#  
+# 
+#
+
 # To allow util-linux to optionally build-depend on cryptsetup, libuuid is
 # split out of the main recipe, as it's needed by cryptsetup
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3868b1c41d..f1a89e7aa2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -12,7 +12,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
                     file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-"
+                    "
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -35,8 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-check-for-sys-pidfd.h.patch \
-           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
-SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
+SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
deleted file mode 100644
index 19f57f14bc..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 14:39:19 -0700
-Subject: [PATCH] check for sys/pidfd.h
-
-This header in newer glibc defines the signatures of functions
-pidfd_send_signal() and pidfd_open() and when these functions are
-defined by libc then we need to include the relevant header to get
-the definitions. Clang 15+ has started to error out when function
-signatures are missing.
-
-Fixes errors like
-misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac          | 1 +
- include/pidfd-utils.h | 4 +++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a511e93de..fd7d9245f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
- 	sys/mkdev.h \
- 	sys/mount.h \
- 	sys/param.h \
-+	sys/pidfd.h \
- 	sys/prctl.h \
- 	sys/resource.h \
- 	sys/sendfile.h \
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index eddede976..d9e33cbc5 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -4,8 +4,10 @@
- #ifdef HAVE_SYS_SYSCALL_H
- # include <sys/syscall.h>
- # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
-+#  ifdef HAVE_SYS_PIDFD_H
-+#   include <sys/pidfd.h>
-+#  endif
- #  include <sys/types.h>
--
- #  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
--- 
-2.37.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
deleted file mode 100644
index 00611fe578..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
-From: Mateusz Marciniec <mateuszmar2@gmail.com>
-Date: Fri, 19 Aug 2022 14:47:49 +0200
-Subject: [PATCH] configure.ac: Improve check for magic
-
-Check whether magic.h header exists before defining HAVE_MAGIC.
-
-Despite library availability there still can be missing header.
-Current test doesn't cover that possibility which will lead compilation
-to fail in case of separate sysroot.
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]
-
-Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
-Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index daa8f0dca..968a0daf0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
- )
- AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
-   AC_CHECK_LIB([magic], [magic_open], [
--    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
--    MAGIC_LIBS="-lmagic"
-+    AC_CHECK_HEADER(magic.h, [
-+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
-+      MAGIC_LIBS="-lmagic"
-+    ])
-   ])
- ])
- AC_SUBST([MAGIC_LIBS])
--- 
-2.37.1
-
-- 
2.39.2


--===============7104022713462365529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.38.1-2.39.1.patch"

RnJvbSA4YjY5YmJhZmYxYTgzODdiZDk3NjQ4YTdlZGE5OTE3NTA3NGEwZWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6MzE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3JhZGUgMi4zOC4xIC0+IDIuMzkuMQoKLS0tCiAuLi4yLjM4
LjEuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMS5iYn0gfCAyMiArKysrKysrKwogbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgIDggKystCiAuLi4v
MDAwMS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2ggICAgICAgICAgfCA1MyAtLS0tLS0tLS0t
LS0tLS0tLS0tCiAuLi5jb25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2gg
fCA0MCAtLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA5
OCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGls
LWxpbnV4LWxpYnV1aWRfMi4zOC4xLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8yLjM5LjEuYmJ9
ICg0MCUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtY2hlY2stZm9yLXN5cy1waWRmZC5oLnBhdGNoCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmln
dXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOC4xLmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggNDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4xLmJiCmluZGV4IDVkNzU5YWVk
OTQuLjcyZGI4ZjQwMGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC1saWJ1dWlkXzIuMzguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LjEuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBG
SVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdk
ZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhl
IExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisj
IHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBs
ZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUg
Y2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRS5saWNlbnNpbmcKKyMgKysrIFJFQURNRS5saWNlbnNp
bmcKKyMgQEAgLTksNiArOSw4IEBACisjICAgICAqIEdQTC0yLjAgICAgICAgICAgICAtIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMgorIyAgCisjICAgICAqIExHUEwtMi4xLW9y
LWxhdGVyICAtIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSAyLjEgb3IgYW55IGxh
dGVyIHZlcnNpb24KKyMgKworIyArICAgKiBCU0QtMi1DbGF1c2UgICAgICAgLSBTaW1wbGlmaWVk
IEJTRCBMaWNlbnNlCisjICAKKyMgICAgICogQlNELTMtQ2xhdXNlICAgICAgIC0gQlNEIDMtQ2xh
dXNlICJOZXciIG9yICJSZXZpc2VkIiBMaWNlbnNlCisjICAKKyMgCisjCisKICMgVG8gYWxsb3cg
dXRpbC1saW51eCB0byBvcHRpb25hbGx5IGJ1aWxkLWRlcGVuZCBvbiBjcnlwdHNldHVwLCBsaWJ1
dWlkIGlzCiAjIHNwbGl0IG91dCBvZiB0aGUgbWFpbiByZWNpcGUsIGFzIGl0J3MgbmVlZGVkIGJ5
IGNyeXB0c2V0dXAKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5p
bmMKaW5kZXggMzg2OGIxYzQxZC4uZjFhODllN2FhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCkBAIC0xMiw3ICsxMiw3IEBAIExJQ0VOU0U6JHtQTn0t
bGliZmRpc2sgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYm1vdW50ID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDRU5TRToke1BOfS1saWJzbWFydGNvbHMgPSAiTEdQTC0y
LjEtb3ItbGF0ZXIiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRS5saWNlbnNp
bmc7bWQ1PTBmZDVjMDUwYzYxODdkMmJmMGE0NDkyYjdmNGUzM2RhIFwKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL1JFQURNRS5saWNlbnNpbmc7bWQ1PTEyYWU3NzY4YTY1ZWM4ZjJlNDRkOTMw
ZGY5Y2I0M2ZhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0RvY3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5HUEwtMi4wLW9yLWxhdGVyO21kNT1iMjM0
ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9Eb2N1bWVudGF0aW9uL2xpY2Vuc2VzL0NPUFlJTkcuTEdQTC0yLjEtb3ItbGF0ZXI7bWQ1PTRm
YmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKQEAgLTIzLDcgKzIzLDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2luZzttZDU9MGZkNWMwNTBjNjE4N2Qy
YmYwYTQ0OTJiN2Y0ZTMzZGEKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2xpYmJsa2lkL0NP
UFlJTkc7bWQ1PTY5M2JjYmJlMTZkM2E0YTRiMzdiYzkwNmJjMDFjYzA0IFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL2xpYmZkaXNrL0NPUFlJTkc7bWQ1PTY5M2JjYmJlMTZkM2E0YTRiMzdi
YzkwNmJjMDFjYzA0IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2xpYnNtYXJ0Y29scy9D
T1BZSU5HO21kNT02OTNiY2JiZTE2ZDNhNGE0YjM3YmM5MDZiYzAxY2MwNCBcCi0iCisgICAgICAg
ICAgICAgICAgICAgICIKIAogRklMRVNFWFRSQVBBVEhTOnByZXBlbmQgOj0gIiR7VEhJU0RJUn0v
dXRpbC1saW51eDoiCiBNQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFyKCdQVicp
LnNwbGl0KCcuJylbMDoyXSl9IgpAQCAtMzUsOCArMzUsNiBAQCBTUkNfVVJJID0gIiR7S0VSTkVM
T1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJTSU9OfS91dGls
LWxpbgogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovL2Rp
c3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vYXZv
aWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1jaGVjay1m
b3Itc3lzLXBpZGZkLmgucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUu
YWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI2MDQ5MmExOWI0NGU2Y2Y5YTNkZGZmNjgzMjViMzMzYjhiNTJiNmM1
OWNlM2ViZDZhMGVjYWE0YzUxMTdlODRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg5MGFlOGZm
ODEwMjQ3YmQxOWUyNzRkZjc2ZTgzNzFkMjAyY2RhMDFhZDI3NzY4MWIwZWE4OGVlYWEwMDI4NmIi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAw
MS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvMDAwMS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDE5ZjU3ZjE0YmMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY2hlY2stZm9yLXN5cy1waWRm
ZC5oLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTMgKzAsMCBAQAotRnJvbSA1NDhiYzU2OGYz
YzczNWU1M2ZiNWIwYTVhYjY0NzNhM2YxNDU3YjkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFN1biwgNyBBdWcgMjAy
MiAxNDozOToxOSAtMDcwMAotU3ViamVjdDogW1BBVENIXSBjaGVjayBmb3Igc3lzL3BpZGZkLmgK
LQotVGhpcyBoZWFkZXIgaW4gbmV3ZXIgZ2xpYmMgZGVmaW5lcyB0aGUgc2lnbmF0dXJlcyBvZiBm
dW5jdGlvbnMKLXBpZGZkX3NlbmRfc2lnbmFsKCkgYW5kIHBpZGZkX29wZW4oKSBhbmQgd2hlbiB0
aGVzZSBmdW5jdGlvbnMgYXJlCi1kZWZpbmVkIGJ5IGxpYmMgdGhlbiB3ZSBuZWVkIHRvIGluY2x1
ZGUgdGhlIHJlbGV2YW50IGhlYWRlciB0byBnZXQKLXRoZSBkZWZpbml0aW9ucy4gQ2xhbmcgMTUr
IGhhcyBzdGFydGVkIHRvIGVycm9yIG91dCB3aGVuIGZ1bmN0aW9uCi1zaWduYXR1cmVzIGFyZSBt
aXNzaW5nLgotCi1GaXhlcyBlcnJvcnMgbGlrZQotbWlzYy11dGlscy9raWxsLmM6NDAyOjY6IGVy
cm9yOiBjYWxsIHRvIHVuZGVjbGFyZWQgZnVuY3Rpb24gJ3BpZGZkX3NlbmRfc2lnbmFsJzsgSVNP
IEM5OSBhbmQgbGF0ZXIgZG8gbm90IHN1cHBvcnQgaW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRp
b25zIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQotICAgICAgICBpZiAocGlkZmRf
c2VuZF9zaWduYWwocGZkLCBjdGwtPm51bXNpZywgJmluZm8sIDApIDwgMCkKLQotVXBzdHJlYW0t
U3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvcHVsbC8xNzY5XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KLS0tLQotIGNvbmZpZ3VyZS5hYyAgICAgICAgICB8IDEgKwotIGluY2x1ZGUvcGlkZmQtdXRp
bHMuaCB8IDQgKysrLQotIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IGE1MTFlOTNkZS4uZmQ3ZDkyNDVmIDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9j
b25maWd1cmUuYWMKLUBAIC0zNDIsNiArMzQyLDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhbIFwKLSAJ
c3lzL21rZGV2LmggXAotIAlzeXMvbW91bnQuaCBcCi0gCXN5cy9wYXJhbS5oIFwKLSsJc3lzL3Bp
ZGZkLmggXAotIAlzeXMvcHJjdGwuaCBcCi0gCXN5cy9yZXNvdXJjZS5oIFwKLSAJc3lzL3NlbmRm
aWxlLmggXAotZGlmZiAtLWdpdCBhL2luY2x1ZGUvcGlkZmQtdXRpbHMuaCBiL2luY2x1ZGUvcGlk
ZmQtdXRpbHMuaAotaW5kZXggZWRkZWRlOTc2Li5kOWUzM2NiYzUgMTAwNjQ0Ci0tLS0gYS9pbmNs
dWRlL3BpZGZkLXV0aWxzLmgKLSsrKyBiL2luY2x1ZGUvcGlkZmQtdXRpbHMuaAotQEAgLTQsOCAr
NCwxMCBAQAotICNpZmRlZiBIQVZFX1NZU19TWVNDQUxMX0gKLSAjIGluY2x1ZGUgPHN5cy9zeXNj
YWxsLmg+Ci0gIyBpZiBkZWZpbmVkKFNZU19waWRmZF9zZW5kX3NpZ25hbCkgJiYgZGVmaW5lZChT
WVNfcGlkZmRfb3BlbikKLSsjICBpZmRlZiBIQVZFX1NZU19QSURGRF9ICi0rIyAgIGluY2x1ZGUg
PHN5cy9waWRmZC5oPgotKyMgIGVuZGlmCi0gIyAgaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci0tCi0g
IyAgaWZuZGVmIEhBVkVfUElERkRfU0VORF9TSUdOQUwKLSBzdGF0aWMgaW5saW5lIGludCBwaWRm
ZF9zZW5kX3NpZ25hbChpbnQgcGlkZmQsIGludCBzaWcsIHNpZ2luZm9fdCAqaW5mbywKLSAJCQkJ
ICAgIHVuc2lnbmVkIGludCBmbGFncykKLS0tIAotMi4zNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNvbmZpZ3VyZS5hYy1JbXBy
b3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWNvbmZpZ3VyZS5hYy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDA2MTFmZTU3OC4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jb25maWd1
cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0
MCArMCwwIEBACi1Gcm9tIDI2MzM4MWRkZDQ2ZWVhMjI5M2M3MGJjODExMjczYjY2YmM1MjA4N2Ig
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNYXRldXN6IE1hcmNpbmllYyA8bWF0ZXVz
em1hcjJAZ21haWwuY29tPgotRGF0ZTogRnJpLCAxOSBBdWcgMjAyMiAxNDo0Nzo0OSArMDIwMAot
U3ViamVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IEltcHJvdmUgY2hlY2sgZm9yIG1hZ2ljCi0K
LUNoZWNrIHdoZXRoZXIgbWFnaWMuaCBoZWFkZXIgZXhpc3RzIGJlZm9yZSBkZWZpbmluZyBIQVZF
X01BR0lDLgotCi1EZXNwaXRlIGxpYnJhcnkgYXZhaWxhYmlsaXR5IHRoZXJlIHN0aWxsIGNhbiBi
ZSBtaXNzaW5nIGhlYWRlci4KLUN1cnJlbnQgdGVzdCBkb2Vzbid0IGNvdmVyIHRoYXQgcG9zc2li
aWxpdHkgd2hpY2ggd2lsbCBsZWFkIGNvbXBpbGF0aW9uCi10byBmYWlsIGluIGNhc2Ugb2Ygc2Vw
YXJhdGUgc3lzcm9vdC4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotW2h0dHBzOi8vZ2l0
aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29tbWl0LzI2MzM4MWRkZDQ2ZWVhMjI5M2M3
MGJjODExMjczYjY2YmM1MjA4N2JdCi0KLVNpZ25lZC1vZmYtYnk6IE1hdGV1c3ogTWFyY2luaWVj
IDxtYXRldXN6bWFyMkBnbWFpbC5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBUb21hc3ogRHppZW5kemll
bHNraSA8dG9tYXN6LmR6aWVuZHppZWxza2lAZ21haWwuY29tPgotLS0tCi0gY29uZmlndXJlLmFj
IHwgNiArKysrLS0KLSAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQotCi1kaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBk
YWE4ZjBkY2EuLjk2OGEwZGFmMCAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29u
ZmlndXJlLmFjCi1AQCAtMTU3MCw4ICsxNTcwLDEwIEBAIEFDX0FSR19XSVRIKFtsaWJtYWdpY10s
Ci0gKQotIEFTX0lGKFt0ZXN0ICJ4JHdpdGhfbGlibWFnaWMiID0geG5vXSwgW2hhdmVfbWFnaWM9
bm9dLCBbCi0gICBBQ19DSEVDS19MSUIoW21hZ2ljXSwgW21hZ2ljX29wZW5dLCBbCi0tICAgIEFD
X0RFRklORShbSEFWRV9NQUdJQ10sIFsxXSwgW0RlZmluZSB0byAxIGlmIHlvdSBoYXZlIHRoZSBs
aWJtYWdpYyBwcmVzZW50Ll0pCi0tICAgIE1BR0lDX0xJQlM9Ii1sbWFnaWMiCi0rICAgIEFDX0NI
RUNLX0hFQURFUihtYWdpYy5oLCBbCi0rICAgICAgQUNfREVGSU5FKFtIQVZFX01BR0lDXSwgWzFd
LCBbRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIGxpYm1hZ2ljIHByZXNlbnQuXSkKLSsgICAg
ICBNQUdJQ19MSUJTPSItbG1hZ2ljIgotKyAgICBdKQotICAgXSkKLSBdKQotIEFDX1NVQlNUKFtN
QUdJQ19MSUJTXSkKLS0tIAotMi4zNy4xCi0KLS0gCjIuMzkuMgoK

--===============7104022713462365529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6a8c277d67dcea2aeb56e60e30f3a26cee4a7a5f"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 15 Mirrors 0 Missed 36 Current 153 (29% match, 82% complete)
Removing 4 stale sstate objects for arch qemux86...done.
Removing 12 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 172 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 177 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 178 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 179 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 183 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 259 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_fetch)
NOTE: Running task 415 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running noexec task 555 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_fetch)
NOTE: Running noexec task 582 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_fetch)
NOTE: Running task 583 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_fetch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_fetch: Started
NOTE: Running task 599 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Started
NOTE: Running task 600 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_unpack)
NOTE: Running task 601 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 602 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe binutils-cross-i686-2.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 614 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 615 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_unpack)
NOTE: Running task 616 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 200 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 617 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 618 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_fetch)
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 202 of 204 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.37-r1: task do_fetch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 622 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_patch)
NOTE: Running task 623 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_patch: Succeeded
NOTE: Running task 624 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 625 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_lic)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_patch: Succeeded
NOTE: Running task 627 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 628 of 778 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_configure)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_configure: Started
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Failed
NOTE: recipe glibc-2.37-r1: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 638 tasks of which 617 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.38.1-r0/temp/log.do_fetch.129473
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch) failed with exit code '1'

--===============7104022713462365529==--

