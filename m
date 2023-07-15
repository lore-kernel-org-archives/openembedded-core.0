Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50432C2FC17
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.6019.1689456454256984260
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MeTuTaal;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73a65e-37ff8d20-2689-43ad-b2bf-1610b6ae8e66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eom5nAhGqYJQ2MlEuirjem+jwcqCvaRBEYHCEtuV77g=;
	b=MeTuTaalj95k5/Yy2ivE5QS+oDE8aI8Uc96+re600e1lbQdOh7dcgjv1u5yPuL09
	jU/9MMp70xeXyXQ7jugd80Z9p12gspR0KSGCflI/0Jb52ZW48HX6+v9xzPs4/VPKmk8
	AFsjn+3VJUgs561ksZ4zURZPI7LOMorr3wDdXc7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eom5nAhGqYJQ2MlEuirjem+jwcqCvaRBEYHCEtuV77g=;
	b=DDt5Eut3Il+MFVcGPHoPZ0Go4LrsC6hD9pJC5S4QwVh9GnCFm5yDtI0qE5YCDzjo
	MHXSSXDr7S429DgsYV9W9BFEJWadj+rBuQgI8xmDXVBoXf1jb5SFRDdPpDMTGebnVGB
	ISZY3XNitqi7s7bhxQf9i3W7giKMBYrHkFyTZkK8=
Content-Type: multipart/mixed; boundary="===============3860768809703382087=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.39.1 FAILED
Message-ID: <010101895b73a65e-37ff8d20-2689-43ad-b2bf-1610b6ae8e66-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184328

--===============3860768809703382087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.39.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.38.1-2.39.1.patch
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
From 8c7e609433e4988cfb712dacd458b33531707634 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:37:25 +0000
Subject: [PATCH] util-linux: upgrade 2.38.1 -> 2.39.1

---
 meta/recipes-core/util-linux/util-linux.inc   |  8 ++-
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 ...l-linux_2.38.1.bb => util-linux_2.39.1.bb} | 22 ++++++++
 4 files changed, 25 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
 rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb => util-linux_2.39.1.bb} (95%)

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
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
similarity index 95%
rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.1.bb
index 9ea7a04e8a..e8f8a42dab 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
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
 require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-- 
2.39.2


--===============3860768809703382087==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.38.1-2.39.1.patch"

RnJvbSA4YzdlNjA5NDMzZTQ5ODhjZmI3MTJkYWNkNDU4YjMzNTMxNzA3NjM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6Mzc6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4OiB1cGdyYWRlIDIuMzguMSAtPiAyLjM5LjEKCi0tLQogbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgIDggKystCiAuLi4vMDAwMS1jaGVjay1m
b3Itc3lzLXBpZGZkLmgucGF0Y2ggICAgICAgICAgfCA1MyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5jb25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2ggfCA0MCAtLS0tLS0t
LS0tLS0tLQogLi4ubC1saW51eF8yLjM4LjEuYmIgPT4gdXRpbC1saW51eF8yLjM5LjEuYmJ9IHwg
MjIgKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgOTggZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtY2hlY2stZm9yLXN5cy1waWRmZC5oLnBhdGNoCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmln
dXJlLmFjLUltcHJvdmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC97dXRpbC1saW51eF8yLjM4LjEuYmIgPT4gdXRpbC1saW51eF8yLjM5
LjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
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
QUdJQ19MSUJTXSkKLS0tIAotMi4zNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eF8yLjM4LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXhfMi4zOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjM4LjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjM5LjEuYmIK
aW5kZXggOWVhN2EwNGU4YS4uZThmOGE0MmRhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuMzguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi4zOS4xLmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBSRUFETUUubGljZW5zaW5nCisjICsrKyBSRUFETUUubGljZW5zaW5n
CisjIEBAIC05LDYgKzksOCBAQAorIyAgICAgKiBHUEwtMi4wICAgICAgICAgICAgLSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIKKyMgIAorIyAgICAgKiBMR1BMLTIuMS1vci1s
YXRlciAgLSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgMi4xIG9yIGFueSBsYXRl
ciB2ZXJzaW9uCisjICsKKyMgKyAgICogQlNELTItQ2xhdXNlICAgICAgIC0gU2ltcGxpZmllZCBC
U0QgTGljZW5zZQorIyAgCisjICAgICAqIEJTRC0zLUNsYXVzZSAgICAgICAtIEJTRCAzLUNsYXVz
ZSAiTmV3IiBvciAiUmV2aXNlZCIgTGljZW5zZQorIyAgCisjIAorIworCiByZXF1aXJlIHV0aWwt
bGludXguaW5jCiAKICNndGstZG9jIGlzIG5vdCBlbmFibGVkIGFzIGl0IHJlcXVpcmVzIHhtbHRv
IHdoaWNoIHJlcXVpcmVzIHV0aWwtbGludXgKLS0gCjIuMzkuMgoK

--===============3860768809703382087==
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
meta-yocto-bsp       = "tmp-auh-upgrades:9a45847eb20a12bfdb5fc160b1979f751f6d26b3"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 505 Local 96 Mirrors 0 Missed 409 Current 292 (19% match, 48% complete)
Removing 52 stale sstate objects for arch x86_64...done.
Removing 89 stale sstate objects for arch core2-32...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 104 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 350 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 359 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 367 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 477 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 499 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 633 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.1.38+gitAUTOINC+2eaed50911_b110cf9bbc-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 636 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 646 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 712 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 745 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 762 of 797 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-6.1.38+gitAUTOINC+2eaed50911_b110cf9bbc-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 793 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 795 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 197 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 265 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 340 of 2557 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 382 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 383 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_patch: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 430 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 435 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 436 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_fetch)
NOTE: Running task 437 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 460 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb:do_fetch)
NOTE: Running task 462 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 463 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 472 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 473 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: Running task 474 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running task 477 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 478 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_fetch)
NOTE: Running task 479 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_fetch)
NOTE: Running task 480 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 481 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_fetch)
NOTE: Running task 482 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_fetch)
NOTE: Running task 512 of 2557 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch)
NOTE: recipe glibc-2.37-r1: task do_patch: Started
NOTE: recipe perl-5.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: Running setscene task 797 of 797 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_patch: Succeeded
NOTE: Running task 614 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_unpack)
NOTE: Running task 621 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 622 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running noexec task 632 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_configure)
NOTE: Running noexec task 633 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_compile)
NOTE: Running task 634 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe libxcrypt-4.4.35-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe xz-5.4.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 638 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 639 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.35-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 640 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39.1-r0: task do_fetch: Started
NOTE: Running task 641 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 642 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 643 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: Running task 644 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_patch)
NOTE: Running task 645 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 646 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 647 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 648 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_unpack)
NOTE: Running task 649 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 650 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_unpack)
NOTE: Running task 651 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_unpack)
NOTE: Running task 652 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 653 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_unpack)
NOTE: Running task 654 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_unpack)
NOTE: Running task 655 of 2557 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_unpack)
NOTE: Running task 668 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 669 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch)
NOTE: Running task 670 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_fetch)
NOTE: Running task 674 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 675 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 696 of 2557 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 703 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 706 of 2557 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 711 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 712 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 713 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 715 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 716 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: Running task 717 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 718 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 722 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 723 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 732 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 745 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_collect_spdx_deps)
NOTE: Running task 746 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 751 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 752 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 757 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 758 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: Running task 771 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_fetch)
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_install: Started
NOTE: Running task 774 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 775 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_fetch)
NOTE: Running task 778 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 780 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 781 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 782 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 783 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 784 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 785 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_fetch: Started
NOTE: Running task 786 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: Running task 787 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: Running task 788 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.1-r0: task do_fetch: Succeeded
NOTE: Running task 790 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: Running task 791 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 792 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe curl-8.1.2-r0: task do_fetch: Started
NOTE: Running task 793 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 794 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 795 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 796 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: Running task 797 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: Running task 798 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 799 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: Running task 800 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: Running task 801 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 802 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_write_config: Started
NOTE: Running task 803 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 804 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 805 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_patch: Succeeded
NOTE: Running task 806 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 807 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 809 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 810 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_unpack)
NOTE: recipe curl-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 811 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_unpack)
NOTE: Running task 813 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_patch: Succeeded
NOTE: Running task 814 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 815 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_unpack)
NOTE: Running task 816 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 817 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 818 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 829 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: Running task 831 of 2557 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 833 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 834 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 835 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: Running task 836 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: Running task 837 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 850 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Started
NOTE: Running task 851 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 855 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: Running task 857 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_fetch)
NOTE: Running task 858 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe libxml2-2.11.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: Running task 859 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.3-r0: task do_patch: Started
NOTE: Running task 860 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 861 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe curl-8.1.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: Running task 862 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_patch)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: Running task 864 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 865 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 870 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 871 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 874 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 876 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 880 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 881 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 884 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 885 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 887 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: Running task 889 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_patch: Succeeded
NOTE: Running task 890 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: Running task 893 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: Running task 894 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 896 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 899 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe libedit-20221030-3.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: Running task 900 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 903 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running task 904 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: Running task 905 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.69-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe libxcrypt-4.4.35-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 907 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.35.bb:do_patch)
NOTE: Running task 909 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 910 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 911 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 912 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_patch)
NOTE: Running task 913 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 917 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 918 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: Running task 919 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 920 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: Running task 938 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 939 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_patch)
NOTE: Running task 940 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 941 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: Running task 942 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 944 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: Running task 946 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: Running task 954 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 964 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: Running task 967 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: Running task 976 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_write_config)
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Started
NOTE: Running task 977 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Started
NOTE: Running task 980 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.38+gitAUTOINC+2eaed50911_b110cf9bbc-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_patch: Started
NOTE: Running task 982 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: Running task 991 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 993 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: Running task 994 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: Running task 995 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 996 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 998 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Started
NOTE: Running task 1015 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 1016 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1017 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_fetch)
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe libpam-1.5.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Failed
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe linux-yocto-6.1.38+gitAUTOINC+2eaed50911_b110cf9bbc-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.35-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe perl-5.36.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_install: Succeeded
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 1019 tasks of which 834 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch
Summary: There were 9 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-libuuid-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.38.1-r0/temp/log.do_fetch.303525
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch) failed with exit code '1'
ERROR: util-linux-libuuid-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-libuuid-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/util-linux-libuuid/2.38.1-r0/temp/log.do_fetch.303734
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch) failed with exit code '1'

--===============3860768809703382087==--

