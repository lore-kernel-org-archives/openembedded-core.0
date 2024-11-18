Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4D7D60CE9
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4693.1731964647033860545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Az+P5Ygx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cuWxoQIs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101934123d9c3-39531156-f04e-4d3f-adcf-848c88cc1a2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hM4PHzzUgWDOrSxMKZrRUHVXhfWo0cSiZPmLCJgzPNI=;
	b=Az+P5YgxEGj2cIAAdWJI5sBnhQqbPZJfYZ+jn2w0bjvjQoHynY3roxb9fiLrnPe3
	YgPHE66h8L2aXUHfCHzvzTcffofVz3l974SClDsvl9SBzmzXyzBDlawBXUhhCN1A97G
	2Q3UVfkcXf50ZlRS6ELV2te9XXQRy8yd9q4PRhUA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hM4PHzzUgWDOrSxMKZrRUHVXhfWo0cSiZPmLCJgzPNI=;
	b=cuWxoQIsYyXikClw1VcDUEh5+9j84ZAZC5rufmRqeqHKsW1C8heQyYFTIbguS/UM
	gTDOaNNq75fcvRzRJFUfwgq1Z1IGY2mIuyzYbN0Yk4HCM9IiHvWc6THho6o0SX5T9IE
	LPtaw1+3TRLqj0gNz69FvC8oUyx+9niUthOJ1tew=
Content-Type: multipart/mixed; boundary="===============6034762791475071202=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 76-1 FAILED
Message-ID: <010101934123d9c3-39531156-f04e-4d3f-adcf-848c88cc1a2d-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207362

--===============6034762791475071202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *icu* to *76-1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-icu-upgrade-75-1-76-1.patch
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
From 90787bada9b4f027029fed9eead38b39d282ea60 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 12:27:05 +0000
Subject: [PATCH] icu: upgrade 75-1 -> 76-1

---
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch | 10 +--
 .../icu/0001-icu-Added-armeb-support.patch    | 10 +--
 ...813_rise_buffer_sizes_pkgdata_PR3058.patch | 72 -------------------
 .../icu/icu/fix-install-manx.patch            | 53 --------------
 .../icu/{icu_75-1.bb => icu_76-1.bb}          | 64 +++++++++++++++--
 5 files changed, 70 insertions(+), 139 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
 delete mode 100644 meta/recipes-support/icu/icu/fix-install-manx.patch
 rename meta/recipes-support/icu/{icu_75-1.bb => icu_76-1.bb} (68%)

diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
index c0e9e2806b..eabe420f72 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
+From f49cca36bdeeb81bf18531a0b060b991a96365c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
@@ -7,13 +7,13 @@ Upstream-Status: Inappropriate [ OE Configuration ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- config/mh-linux | 2 +-
+ source/config/mh-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/config/mh-linux b/config/mh-linux
+diff --git a/source/config/mh-linux b/source/config/mh-linux
 index 53d6780..b622513 100644
---- a/config/mh-linux
-+++ b/config/mh-linux
+--- a/source/config/mh-linux
++++ b/source/config/mh-linux
 @@ -23,7 +23,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
  LD_RPATH_PRE = -Wl,-rpath,
  
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index a25285fb54..a4eda9643b 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
+From c5a7c056af2e63f0a362e65dba77d78a2b849371 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
@@ -9,13 +9,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
- i18n/double-conversion-utils.h | 2 +-
+ source/i18n/double-conversion-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
 index 303668f..7d859dc 100644
---- a/i18n/double-conversion-utils.h
-+++ b/i18n/double-conversion-utils.h
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
 @@ -146,7 +146,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "correct" section.
diff --git a/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch b/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
deleted file mode 100644
index 5b97350e6f..0000000000
--- a/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From db70adaddcfa8050db6a69cdfef080a7f1423ad7 Mon Sep 17 00:00:00 2001
-From: Carlos Alberto Lopez Perez <clopez@igalia.com>
-Date: Mon, 1 Jul 2024 22:15:18 +0100
-Subject: [PATCH] ICU-22813 Rise the size of the buffers used for the command
- strings at pkgdata
-
-The tool pkgdata uses snprintf() to build the strings of the commands that
-will execute later during the install process. But the maximum size of this
-buffers is not enough when there is a long path.
-
-This has caused issues on some CI systems that use very long paths, causing
-the install process to produce a wrong result.
-
-The maximum path on Linux is 4096 (defined as PATH_MAX at <linux/limits.h>)
-So the size of SMALL_BUFFER_MAX_SIZE should be 4096 to avoid errors related
-to truncated paths.
-
-Upstream-Status: Backport [https://github.com/unicode-org/icu/pull/3058]
-
-Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
----
- tools/pkgdata/pkgdata.cpp | 6 +++---
- tools/toolutil/pkg_genc.h | 5 ++---
- 2 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
-index c2ac112..8d08c85 100644
---- a/tools/pkgdata/pkgdata.cpp
-+++ b/tools/pkgdata/pkgdata.cpp
-@@ -1134,7 +1134,7 @@ static int32_t pkg_createSymLinks(const char *targetDir, UBool specialHandling)
- 
- static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE];
-+    char cmd[LARGE_BUFFER_MAX_SIZE];
- 
-     auto ret = snprintf(cmd,
-             sizeof(cmd),
-@@ -1205,7 +1205,7 @@ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir,
- 
- static int32_t pkg_installCommonMode(const char *installDir, const char *fileName) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
- 
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status = U_ZERO_ERROR;
-@@ -1237,7 +1237,7 @@ static int32_t pkg_installCommonMode(const char *installDir, const char *fileNam
- #endif
- static int32_t pkg_installFileMode(const char *installDir, const char *srcDir, const char *fileListName) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
- 
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status = U_ZERO_ERROR;
-diff --git a/tools/toolutil/pkg_genc.h b/tools/toolutil/pkg_genc.h
-index 2dd1b45..f811fe5 100644
---- a/tools/toolutil/pkg_genc.h
-+++ b/tools/toolutil/pkg_genc.h
-@@ -59,9 +59,8 @@
- #define PKGDATA_FILE_SEP_STRING U_FILE_SEP_STRING
- #endif
- 
--#define LARGE_BUFFER_MAX_SIZE 2048
--#define SMALL_BUFFER_MAX_SIZE 512
--#define SMALL_BUFFER_FLAG_NAMES 32
-+#define LARGE_BUFFER_MAX_SIZE 16384
-+#define SMALL_BUFFER_MAX_SIZE 4096
- #define BUFFER_PADDING_SIZE 20
- 
- /** End platform defines **/
diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
deleted file mode 100644
index 7b1ca81451..0000000000
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2d544cac238eccbfc32cafc9502ddf6e00994211 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 9 Oct 2015 17:50:41 +0100
-Subject: [PATCH] icu: fix install race
-
-The generic recursive target calls target-local so also adding it to the
-dependency list results in races due to install-local being executed twice in
-parallel.  For example, install-manx can fail if the two install processes race
-and one process tries to chown a file that the other process has just deleted.
-
-Also install-manx should be a phony target, and for clarity use $^ instead of $?
-in the install command.
-
-Upstream-Status: Backport [0f022dca90cfe6bbf6a74f605dcaf1b489d58a9b]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 8366f01..79b91c9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -77,7 +77,7 @@ EXTRA_DATA =
- 
- ## List of phony targets
- .PHONY : all all-local all-recursive install install-local install-udata install-udata-files install-udata-dlls		\
--install-recursive clean clean-local clean-recursive distclean		\
-+install-recursive install-manx clean clean-local clean-recursive distclean		\
- distclean-local distclean-recursive doc dist dist-local dist-recursive	\
- check check-local check-recursive clean-recursive-with-twist install-icu \
- doc install-doc tests icu4j-data icu4j-data-install update-windows-makefiles xcheck-local xcheck-recursive xperf xcheck xperf-recursive \
-@@ -88,9 +88,9 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
- 
- ## List of standard targets
- all: all-local all-recursive
--install: install-recursive install-local
-+install: install-recursive
- clean: clean-recursive-with-twist clean-local
--distclean : distclean-recursive distclean-local
-+distclean : distclean-recursive
- dist: dist-recursive
- check: all check-recursive
- check-recursive: all
-@@ -357,7 +357,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
- install-manx: $(MANX_FILES)
- 	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
- ifneq ($(MANX_FILES),)
--	$(INSTALL_DATA) $? $(DESTDIR)$(mandir)/man$(SECTION)
-+	$(INSTALL_DATA) $^ $(DESTDIR)$(mandir)/man$(SECTION)
- endif
- 
- config/%.$(SECTION): $(srcdir)/config/%.$(SECTION).in
diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_76-1.bb
similarity index 68%
rename from meta/recipes-support/icu/icu_75-1.bb
rename to meta/recipes-support/icu/icu_76-1.bb
index 8f7f5e6cc7..db6599edd1 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -1,3 +1,60 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- ../LICENSE
+# +++ ../LICENSE
+# @@ -433,6 +433,34 @@
+#  
+#  ----------------------------------------------------------------------
+#  
+# +JSON parsing library (nlohmann/json)
+# +
+# +File: vendor/json/upstream/single_include/nlohmann/json.hpp (only for ICU4C)
+# +
+# +MIT License
+# +
+# +Copyright (c) 2013-2022 Niels Lohmann
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all
+# +copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# +SOFTWARE.
+# +
+# +----------------------------------------------------------------------
+# +
+#  File: aclocal.m4 (only for ICU4C)
+#  Section: pkg.m4 - Macros to locate and utilise pkg-config.
+#  
+# @@ -473,7 +501,7 @@
+#  
+#  This file is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+# -the Free Software Foundation; either version 3 of the License, or
+# +the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+#  
+#  This program is distributed in the hope that it will be useful, but
+# 
+#
+
 SUMMARY = "International Component for Unicode libraries"
 DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
 portable set of C/C++ and Java libraries for Unicode support, software \
@@ -92,7 +149,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=9cf7c317c3f2a0962437465a9022dbe9"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=7c364a0debecf16d5a13de2b7f1aaabd"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('-')
@@ -118,15 +175,14 @@ DATA_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
-           file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
-           file://ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch \
+           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
            "
 
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "cb968df3e4d2e87e8b11c49a5d01c787bd13b9545280fc6642f826527618caef"
+SRC_URI[code.sha256sum] = "dfacb46bfe4747410472ce3e1144bf28a102feeaa4e3875bac9b4c6cf30f4f3e"
 SRC_URI[data.sha256sum] = "a5104212dc317a64f9b035723ea706f2f4fd5a0f37b7923fae7aeb9d1d0061b1"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
-- 
2.44.1


--===============6034762791475071202==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-75-1-76-1.patch"

RnJvbSA5MDc4N2JhZGE5YjRmMDI3MDI5ZmVkOWVlYWQzOGIzOWQyODJlYTYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMTI6Mjc6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Y3U6IHVwZ3JhZGUgNzUtMSAtPiA3Ni0xCgotLS0KIC4uLi8wMDAxLURpc2FibGUtTERGTEFHU0lD
VURULWZvci1MaW51eC5wYXRjaCB8IDEwICstLQogLi4uL2ljdS8wMDAxLWljdS1BZGRlZC1hcm1l
Yi1zdXBwb3J0LnBhdGNoICAgIHwgMTAgKy0tCiAuLi44MTNfcmlzZV9idWZmZXJfc2l6ZXNfcGtn
ZGF0YV9QUjMwNTgucGF0Y2ggfCA3MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vaWN1L2ljdS9m
aXgtaW5zdGFsbC1tYW54LnBhdGNoICAgICAgICAgICAgfCA1MyAtLS0tLS0tLS0tLS0tLQogLi4u
L2ljdS97aWN1Xzc1LTEuYmIgPT4gaWN1Xzc2LTEuYmJ9ICAgICAgICAgIHwgNjQgKysrKysrKysr
KysrKysrLS0KIDUgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKSwgMTM5IGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvSUNV
LTIyODEzX3Jpc2VfYnVmZmVyX3NpemVzX3BrZ2RhdGFfUFIzMDU4LnBhdGNoCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS9maXgtaW5zdGFsbC1tYW54LnBh
dGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L3tpY3VfNzUtMS5iYiA9PiBpY3Vf
NzYtMS5iYn0gKDY4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1
LzAwMDEtRGlzYWJsZS1MREZMQUdTSUNVRFQtZm9yLUxpbnV4LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdS8wMDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1MaW51eC5wYXRj
aAppbmRleCBjMGU5ZTI4MDZiLi5lYWJlNDIwZjcyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1LzAwMDEtRGlzYWJsZS1MREZMQUdTSUNVRFQtZm9yLUxpbnV4LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1EaXNhYmxlLUxERkxBR1NJ
Q1VEVC1mb3ItTGludXgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBmNGU5ZWVlNjRiZDQy
MjBhYTRmYWUxYWI0ZjdiYmYxMGI4N2NkNjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGY0OWNjYTM2YmRlZWI4MWJmMTg1MzFhMGIwNjBiOTkxYTk2MzY1YzAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0
LCAxNSBGZWIgMjAxNCAyMTowNjo0MiArMDAwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlIExE
RkxBR1NJQ1VEVCBmb3IgTGludXgKQEAgLTcsMTMgKzcsMTMgQEAgVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFsgT0UgQ29uZmlndXJhdGlvbiBdCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtLS0KLSBjb25maWcvbWgtbGludXggfCAyICstCisg
c291cmNlL2NvbmZpZy9taC1saW51eCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL2NvbmZpZy9taC1saW51eCBiL2Nv
bmZpZy9taC1saW51eAorZGlmZiAtLWdpdCBhL3NvdXJjZS9jb25maWcvbWgtbGludXggYi9zb3Vy
Y2UvY29uZmlnL21oLWxpbnV4CiBpbmRleCA1M2Q2NzgwLi5iNjIyNTEzIDEwMDY0NAotLS0tIGEv
Y29uZmlnL21oLWxpbnV4Ci0rKysgYi9jb25maWcvbWgtbGludXgKKy0tLSBhL3NvdXJjZS9jb25m
aWcvbWgtbGludXgKKysrKyBiL3NvdXJjZS9jb25maWcvbWgtbGludXgKIEBAIC0yMyw3ICsyMyw3
IEBAIExEX1JQQVRIPSAtV2wsLXpvcmlnaW4sLXJwYXRoLCckJCdPUklHSU4KICBMRF9SUEFUSF9Q
UkUgPSAtV2wsLXJwYXRoLAogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1
L2ljdS8wMDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvaWN1L2ljdS8wMDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoCmluZGV4IGEy
NTI4NWZiNTQuLmE0ZWRhOTY0M2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3UvMDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGNmNTVjMDc3Yjc3YjdhMjE5NTAyMzY0ZWFhZGYxMmMwNzRhYjAw
NWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM1YTdjMDU2YWYyZTYzZjBhMzYyZTY1
ZGJhNzdkNzhhMmI4NDkzNzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkgTWFv
aHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+CiBEYXRlOiBXZWQsIDggTWF5IDIwMTkgMTQ6
NDI6MzAgKzA5MDAKIFN1YmplY3Q6IFtQQVRDSF0gaWN1OiBBZGRlZCBhcm1lYiBzdXBwb3J0LgpA
QCAtOSwxMyArOSwxMyBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1i
eTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3UuY29tPgogLS0tCi0gaTE4bi9kb3Vi
bGUtY29udmVyc2lvbi11dGlscy5oIHwgMiArLQorIHNvdXJjZS9pMThuL2RvdWJsZS1jb252ZXJz
aW9uLXV0aWxzLmggfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKLWRpZmYgLS1naXQgYS9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmgg
Yi9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmgKK2RpZmYgLS1naXQgYS9zb3VyY2UvaTE4
bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oIGIvc291cmNlL2kxOG4vZG91YmxlLWNvbnZlcnNp
b24tdXRpbHMuaAogaW5kZXggMzAzNjY4Zi4uN2Q4NTlkYyAxMDA2NDQKLS0tLSBhL2kxOG4vZG91
YmxlLWNvbnZlcnNpb24tdXRpbHMuaAotKysrIGIvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGls
cy5oCistLS0gYS9zb3VyY2UvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oCisrKysgYi9z
b3VyY2UvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oCiBAQCAtMTQ2LDcgKzE0Niw3IEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyKiogYXJndikgewogIC8vCiAgLy8gSWYgaXQgcHJpbnRz
ICJjb3JyZWN0IiB0aGVuIHRoZSBhcmNoaXRlY3R1cmUgc2hvdWxkIGJlIGhlcmUsIGluIHRoZSAi
Y29ycmVjdCIgc2VjdGlvbi4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9p
Y3UvSUNVLTIyODEzX3Jpc2VfYnVmZmVyX3NpemVzX3BrZ2RhdGFfUFIzMDU4LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS9JQ1UtMjI4MTNfcmlzZV9idWZmZXJfc2l6ZXNfcGtn
ZGF0YV9QUjMwNTgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDViOTczNTBl
NmYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS9JQ1UtMjI4
MTNfcmlzZV9idWZmZXJfc2l6ZXNfcGtnZGF0YV9QUjMwNTgucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSw3MiArMCwwIEBACi1Gcm9tIGRiNzBhZGFkZGNmYTgwNTBkYjZhNjljZGZlZjA4MGE3ZjE0
MjNhZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBDYXJsb3MgQWxiZXJ0byBMb3Bl
eiBQZXJleiA8Y2xvcGV6QGlnYWxpYS5jb20+Ci1EYXRlOiBNb24sIDEgSnVsIDIwMjQgMjI6MTU6
MTggKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gSUNVLTIyODEzIFJpc2UgdGhlIHNpemUgb2YgdGhl
IGJ1ZmZlcnMgdXNlZCBmb3IgdGhlIGNvbW1hbmQKLSBzdHJpbmdzIGF0IHBrZ2RhdGEKLQotVGhl
IHRvb2wgcGtnZGF0YSB1c2VzIHNucHJpbnRmKCkgdG8gYnVpbGQgdGhlIHN0cmluZ3Mgb2YgdGhl
IGNvbW1hbmRzIHRoYXQKLXdpbGwgZXhlY3V0ZSBsYXRlciBkdXJpbmcgdGhlIGluc3RhbGwgcHJv
Y2Vzcy4gQnV0IHRoZSBtYXhpbXVtIHNpemUgb2YgdGhpcwotYnVmZmVycyBpcyBub3QgZW5vdWdo
IHdoZW4gdGhlcmUgaXMgYSBsb25nIHBhdGguCi0KLVRoaXMgaGFzIGNhdXNlZCBpc3N1ZXMgb24g
c29tZSBDSSBzeXN0ZW1zIHRoYXQgdXNlIHZlcnkgbG9uZyBwYXRocywgY2F1c2luZwotdGhlIGlu
c3RhbGwgcHJvY2VzcyB0byBwcm9kdWNlIGEgd3JvbmcgcmVzdWx0LgotCi1UaGUgbWF4aW11bSBw
YXRoIG9uIExpbnV4IGlzIDQwOTYgKGRlZmluZWQgYXMgUEFUSF9NQVggYXQgPGxpbnV4L2xpbWl0
cy5oPikKLVNvIHRoZSBzaXplIG9mIFNNQUxMX0JVRkZFUl9NQVhfU0laRSBzaG91bGQgYmUgNDA5
NiB0byBhdm9pZCBlcnJvcnMgcmVsYXRlZAotdG8gdHJ1bmNhdGVkIHBhdGhzLgotCi1VcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vdW5pY29kZS1vcmcvaWN1L3B1
bGwvMzA1OF0KLQotU2lnbmVkLW9mZi1ieTogQ2FybG9zIEFsYmVydG8gTG9wZXogUGVyZXogPGNs
b3BlekBpZ2FsaWEuY29tPgotLS0tCi0gdG9vbHMvcGtnZGF0YS9wa2dkYXRhLmNwcCB8IDYgKysr
LS0tCi0gdG9vbHMvdG9vbHV0aWwvcGtnX2dlbmMuaCB8IDUgKystLS0KLSAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3Rvb2xz
L3BrZ2RhdGEvcGtnZGF0YS5jcHAgYi90b29scy9wa2dkYXRhL3BrZ2RhdGEuY3BwCi1pbmRleCBj
MmFjMTEyLi44ZDA4Yzg1IDEwMDY0NAotLS0tIGEvdG9vbHMvcGtnZGF0YS9wa2dkYXRhLmNwcAot
KysrIGIvdG9vbHMvcGtnZGF0YS9wa2dkYXRhLmNwcAotQEAgLTExMzQsNyArMTEzNCw3IEBAIHN0
YXRpYyBpbnQzMl90IHBrZ19jcmVhdGVTeW1MaW5rcyhjb25zdCBjaGFyICp0YXJnZXREaXIsIFVC
b29sIHNwZWNpYWxIYW5kbGluZykKLSAKLSBzdGF0aWMgaW50MzJfdCBwa2dfaW5zdGFsbExpYnJh
cnkoY29uc3QgY2hhciAqaW5zdGFsbERpciwgY29uc3QgY2hhciAqdGFyZ2V0RGlyLCBVQm9vbCBu
b1ZlcnNpb24pIHsKLSAgICAgaW50MzJfdCByZXN1bHQgPSAwOwotLSAgICBjaGFyIGNtZFtTTUFM
TF9CVUZGRVJfTUFYX1NJWkVdOwotKyAgICBjaGFyIGNtZFtMQVJHRV9CVUZGRVJfTUFYX1NJWkVd
OwotIAotICAgICBhdXRvIHJldCA9IHNucHJpbnRmKGNtZCwKLSAgICAgICAgICAgICBzaXplb2Yo
Y21kKSwKLUBAIC0xMjA1LDcgKzEyMDUsNyBAQCBzdGF0aWMgaW50MzJfdCBwa2dfaW5zdGFsbExp
YnJhcnkoY29uc3QgY2hhciAqaW5zdGFsbERpciwgY29uc3QgY2hhciAqdGFyZ2V0RGlyLAotIAot
IHN0YXRpYyBpbnQzMl90IHBrZ19pbnN0YWxsQ29tbW9uTW9kZShjb25zdCBjaGFyICppbnN0YWxs
RGlyLCBjb25zdCBjaGFyICpmaWxlTmFtZSkgewotICAgICBpbnQzMl90IHJlc3VsdCA9IDA7Ci0t
ICAgIGNoYXIgY21kW1NNQUxMX0JVRkZFUl9NQVhfU0laRV0gPSAiIjsKLSsgICAgY2hhciBjbWRb
TEFSR0VfQlVGRkVSX01BWF9TSVpFXSA9ICIiOwotIAotICAgICBpZiAoIVRfRmlsZVN0cmVhbV9m
aWxlX2V4aXN0cyhpbnN0YWxsRGlyKSkgewotICAgICAgICAgVUVycm9yQ29kZSBzdGF0dXMgPSBV
X1pFUk9fRVJST1I7Ci1AQCAtMTIzNyw3ICsxMjM3LDcgQEAgc3RhdGljIGludDMyX3QgcGtnX2lu
c3RhbGxDb21tb25Nb2RlKGNvbnN0IGNoYXIgKmluc3RhbGxEaXIsIGNvbnN0IGNoYXIgKmZpbGVO
YW0KLSAjZW5kaWYKLSBzdGF0aWMgaW50MzJfdCBwa2dfaW5zdGFsbEZpbGVNb2RlKGNvbnN0IGNo
YXIgKmluc3RhbGxEaXIsIGNvbnN0IGNoYXIgKnNyY0RpciwgY29uc3QgY2hhciAqZmlsZUxpc3RO
YW1lKSB7Ci0gICAgIGludDMyX3QgcmVzdWx0ID0gMDsKLS0gICAgY2hhciBjbWRbU01BTExfQlVG
RkVSX01BWF9TSVpFXSA9ICIiOwotKyAgICBjaGFyIGNtZFtMQVJHRV9CVUZGRVJfTUFYX1NJWkVd
ID0gIiI7Ci0gCi0gICAgIGlmICghVF9GaWxlU3RyZWFtX2ZpbGVfZXhpc3RzKGluc3RhbGxEaXIp
KSB7Ci0gICAgICAgICBVRXJyb3JDb2RlIHN0YXR1cyA9IFVfWkVST19FUlJPUjsKLWRpZmYgLS1n
aXQgYS90b29scy90b29sdXRpbC9wa2dfZ2VuYy5oIGIvdG9vbHMvdG9vbHV0aWwvcGtnX2dlbmMu
aAotaW5kZXggMmRkMWI0NS4uZjgxMWZlNSAxMDA2NDQKLS0tLSBhL3Rvb2xzL3Rvb2x1dGlsL3Br
Z19nZW5jLmgKLSsrKyBiL3Rvb2xzL3Rvb2x1dGlsL3BrZ19nZW5jLmgKLUBAIC01OSw5ICs1OSw4
IEBACi0gI2RlZmluZSBQS0dEQVRBX0ZJTEVfU0VQX1NUUklORyBVX0ZJTEVfU0VQX1NUUklORwot
ICNlbmRpZgotIAotLSNkZWZpbmUgTEFSR0VfQlVGRkVSX01BWF9TSVpFIDIwNDgKLS0jZGVmaW5l
IFNNQUxMX0JVRkZFUl9NQVhfU0laRSA1MTIKLS0jZGVmaW5lIFNNQUxMX0JVRkZFUl9GTEFHX05B
TUVTIDMyCi0rI2RlZmluZSBMQVJHRV9CVUZGRVJfTUFYX1NJWkUgMTYzODQKLSsjZGVmaW5lIFNN
QUxMX0JVRkZFUl9NQVhfU0laRSA0MDk2Ci0gI2RlZmluZSBCVUZGRVJfUEFERElOR19TSVpFIDIw
Ci0gCi0gLyoqIEVuZCBwbGF0Zm9ybSBkZWZpbmVzICoqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaWN1L2ljdS9maXgtaW5zdGFsbC1tYW54LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdS9maXgtaW5zdGFsbC1tYW54LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA3YjFjYTgxNDUxLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2ljdS9pY3UvZml4LWluc3RhbGwtbWFueC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDUzICswLDAgQEAKLUZyb20gMmQ1NDRjYWMyMzhlY2NiZmMzMmNhZmM5NTAyZGRmNmUwMDk5NDIx
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBpbnRlbC5jb20+Ci1EYXRlOiBGcmksIDkgT2N0IDIwMTUgMTc6NTA6NDEgKzAxMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gaWN1OiBmaXggaW5zdGFsbCByYWNlCi0KLVRoZSBnZW5lcmljIHJlY3Vyc2l2
ZSB0YXJnZXQgY2FsbHMgdGFyZ2V0LWxvY2FsIHNvIGFsc28gYWRkaW5nIGl0IHRvIHRoZQotZGVw
ZW5kZW5jeSBsaXN0IHJlc3VsdHMgaW4gcmFjZXMgZHVlIHRvIGluc3RhbGwtbG9jYWwgYmVpbmcg
ZXhlY3V0ZWQgdHdpY2UgaW4KLXBhcmFsbGVsLiAgRm9yIGV4YW1wbGUsIGluc3RhbGwtbWFueCBj
YW4gZmFpbCBpZiB0aGUgdHdvIGluc3RhbGwgcHJvY2Vzc2VzIHJhY2UKLWFuZCBvbmUgcHJvY2Vz
cyB0cmllcyB0byBjaG93biBhIGZpbGUgdGhhdCB0aGUgb3RoZXIgcHJvY2VzcyBoYXMganVzdCBk
ZWxldGVkLgotCi1BbHNvIGluc3RhbGwtbWFueCBzaG91bGQgYmUgYSBwaG9ueSB0YXJnZXQsIGFu
ZCBmb3IgY2xhcml0eSB1c2UgJF4gaW5zdGVhZCBvZiAkPwotaW4gdGhlIGluc3RhbGwgY29tbWFu
ZC4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbMGYwMjJkY2E5MGNmZTZiYmY2YTc0ZjYw
NWRjYWYxYjQ4OWQ1OGE5Yl0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBpbnRlbC5jb20+Ci0tLS0KLSBNYWtlZmlsZS5pbiB8IDggKysrKy0tLS0KLSAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvTWFr
ZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgotaW5kZXggODM2NmYwMS4uNzliOTFjOSAxMDA2NDQKLS0t
LSBhL01ha2VmaWxlLmluCi0rKysgYi9NYWtlZmlsZS5pbgotQEAgLTc3LDcgKzc3LDcgQEAgRVhU
UkFfREFUQSA9Ci0gCi0gIyMgTGlzdCBvZiBwaG9ueSB0YXJnZXRzCi0gLlBIT05ZIDogYWxsIGFs
bC1sb2NhbCBhbGwtcmVjdXJzaXZlIGluc3RhbGwgaW5zdGFsbC1sb2NhbCBpbnN0YWxsLXVkYXRh
IGluc3RhbGwtdWRhdGEtZmlsZXMgaW5zdGFsbC11ZGF0YS1kbGxzCQlcCi0taW5zdGFsbC1yZWN1
cnNpdmUgY2xlYW4gY2xlYW4tbG9jYWwgY2xlYW4tcmVjdXJzaXZlIGRpc3RjbGVhbgkJXAotK2lu
c3RhbGwtcmVjdXJzaXZlIGluc3RhbGwtbWFueCBjbGVhbiBjbGVhbi1sb2NhbCBjbGVhbi1yZWN1
cnNpdmUgZGlzdGNsZWFuCQlcCi0gZGlzdGNsZWFuLWxvY2FsIGRpc3RjbGVhbi1yZWN1cnNpdmUg
ZG9jIGRpc3QgZGlzdC1sb2NhbCBkaXN0LXJlY3Vyc2l2ZQlcCi0gY2hlY2sgY2hlY2stbG9jYWwg
Y2hlY2stcmVjdXJzaXZlIGNsZWFuLXJlY3Vyc2l2ZS13aXRoLXR3aXN0IGluc3RhbGwtaWN1IFwK
LSBkb2MgaW5zdGFsbC1kb2MgdGVzdHMgaWN1NGotZGF0YSBpY3U0ai1kYXRhLWluc3RhbGwgdXBk
YXRlLXdpbmRvd3MtbWFrZWZpbGVzIHhjaGVjay1sb2NhbCB4Y2hlY2stcmVjdXJzaXZlIHhwZXJm
IHhjaGVjayB4cGVyZi1yZWN1cnNpdmUgXAotQEAgLTg4LDkgKzg4LDkgQEAgY2hlY2stZXhoYXVz
dGl2ZSBjaGVjay1leGhhdXN0aXZlLWxvY2FsIGNoZWNrLWV4aGF1c3RpdmUtcmVjdXJzaXZlIHJl
bGVhc2VEaXN0Ci0gCi0gIyMgTGlzdCBvZiBzdGFuZGFyZCB0YXJnZXRzCi0gYWxsOiBhbGwtbG9j
YWwgYWxsLXJlY3Vyc2l2ZQotLWluc3RhbGw6IGluc3RhbGwtcmVjdXJzaXZlIGluc3RhbGwtbG9j
YWwKLStpbnN0YWxsOiBpbnN0YWxsLXJlY3Vyc2l2ZQotIGNsZWFuOiBjbGVhbi1yZWN1cnNpdmUt
d2l0aC10d2lzdCBjbGVhbi1sb2NhbAotLWRpc3RjbGVhbiA6IGRpc3RjbGVhbi1yZWN1cnNpdmUg
ZGlzdGNsZWFuLWxvY2FsCi0rZGlzdGNsZWFuIDogZGlzdGNsZWFuLXJlY3Vyc2l2ZQotIGRpc3Q6
IGRpc3QtcmVjdXJzaXZlCi0gY2hlY2s6IGFsbCBjaGVjay1yZWN1cnNpdmUKLSBjaGVjay1yZWN1
cnNpdmU6IGFsbAotQEAgLTM1Nyw3ICszNTcsNyBAQCBjb25maWcuc3RhdHVzOiAkKHNyY2Rpcikv
Y29uZmlndXJlICQoc3JjZGlyKS9jb21tb24vdW5pY29kZS91dmVybnVtLmgKLSBpbnN0YWxsLW1h
bng6ICQoTUFOWF9GSUxFUykKLSAJJChNS0lOU1RBTExESVJTKSAkKERFU1RESVIpJChtYW5kaXIp
L21hbiQoU0VDVElPTikKLSBpZm5lcSAoJChNQU5YX0ZJTEVTKSwpCi0tCSQoSU5TVEFMTF9EQVRB
KSAkPyAkKERFU1RESVIpJChtYW5kaXIpL21hbiQoU0VDVElPTikKLSsJJChJTlNUQUxMX0RBVEEp
ICReICQoREVTVERJUikkKG1hbmRpcikvbWFuJChTRUNUSU9OKQotIGVuZGlmCi0gCi0gY29uZmln
LyUuJChTRUNUSU9OKTogJChzcmNkaXIpL2NvbmZpZy8lLiQoU0VDVElPTikuaW4KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzUtMS5iYiBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2ljdS9pY3VfNzYtMS5iYgpzaW1pbGFyaXR5IGluZGV4IDY4JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc1LTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2ljdS9pY3VfNzYtMS5iYgppbmRleCA4ZjdmNWU2Y2M3Li5kYjY1OTllZGQxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc1LTEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Ni0xLmJiCkBAIC0xLDMgKzEsNjAgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSAuLi9MSUNFTlNFCisjICsrKyAuLi9MSUNFTlNFCisjIEBAIC00MzMs
NiArNDMzLDM0IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyArSlNPTiBwYXJzaW5n
IGxpYnJhcnkgKG5sb2htYW5uL2pzb24pCisjICsKKyMgK0ZpbGU6IHZlbmRvci9qc29uL3Vwc3Ry
ZWFtL3NpbmdsZV9pbmNsdWRlL25sb2htYW5uL2pzb24uaHBwIChvbmx5IGZvciBJQ1U0QykKKyMg
KworIyArTUlUIExpY2Vuc2UKKyMgKworIyArQ29weXJpZ2h0IChjKSAyMDEzLTIwMjIgTmllbHMg
TG9obWFubgorIyArCisjICtQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNo
YXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICtvZiB0aGlzIHNvZnR3YXJl
IGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8g
ZGVhbAorIyAraW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3
aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyArdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1l
cmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAorIyArY29w
aWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNv
ZnR3YXJlIGlzCisjICtmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2lu
ZyBjb25kaXRpb25zOgorIyArCisjICtUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhp
cyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwKKyMgK2NvcGllcyBv
ciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICsKKyMgK1RIRSBTT0ZU
V0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBF
WFBSRVNTIE9SCisjICtJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBX
QVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgK0ZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQorIyAr
QVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFN
QUdFUyBPUiBPVEhFUgorIyArTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgK09VVCBPRiBPUiBJTiBD
T05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1Mg
SU4gVEhFCisjICtTT0ZUV0FSRS4KKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICBGaWxl
OiBhY2xvY2FsLm00IChvbmx5IGZvciBJQ1U0QykKKyMgIFNlY3Rpb246IHBrZy5tNCAtIE1hY3Jv
cyB0byBsb2NhdGUgYW5kIHV0aWxpc2UgcGtnLWNvbmZpZy4KKyMgIAorIyBAQCAtNDczLDcgKzUw
MSw3IEBACisjICAKKyMgIFRoaXMgZmlsZSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0CisjICB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorIyAtdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMyBvZiB0aGUgTGljZW5zZSwgb3IKKyMg
K3RoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIGVpdGhlciB2ZXJzaW9uIDMgb2YgdGhlIExp
Y2Vuc2UsIG9yCisjICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorIyAgCisj
ICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwgYnV0CisjIAorIworCiBTVU1NQVJZID0gIkludGVybmF0aW9uYWwgQ29tcG9uZW50
IGZvciBVbmljb2RlIGxpYnJhcmllcyIKIERFU0NSSVBUSU9OID0gIlRoZSBJbnRlcm5hdGlvbmFs
IENvbXBvbmVudCBmb3IgVW5pY29kZSAoSUNVKSBpcyBhIG1hdHVyZSwgXAogcG9ydGFibGUgc2V0
IG9mIEMvQysrIGFuZCBKYXZhIGxpYnJhcmllcyBmb3IgVW5pY29kZSBzdXBwb3J0LCBzb2Z0d2Fy
ZSBcCkBAIC05Miw3ICsxNDksNyBAQCBGSUxFUzpsaWJpY3VpbyA9ICIke2xpYmRpcn0vbGliaWN1
aW8uc28uKiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly8uLi9MSUNFTlNFO21kNT05Y2Y3YzMxN2MzZjJhMDk2MjQzNzQ2
NWE5MDIyZGJlOSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLy4uL0xJQ0VOU0U7bWQ1PTdj
MzY0YTBkZWJlY2YxNmQ1YTEzZGUyYjdmMWFhYWJkIgogCiBkZWYgaWN1X2Rvd25sb2FkX3ZlcnNp
b24oZCk6CiAgICAgcHZzcGxpdCA9IGQuZ2V0VmFyKCdQVicpLnNwbGl0KCctJykKQEAgLTExOCwx
NSArMTc1LDE0IEBAIERBVEFfU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
cmVsZWFzZS0ke0lDVV9GT0xERVJ9L2ljdTRjLSR7SUNVX1BWCiBTUkNfVVJJID0gIiR7QkFTRV9T
UkNfVVJJfTtuYW1lPWNvZGUgXAogICAgICAgICAgICAke0RBVEFfU1JDX1VSSX07bmFtZT1kYXRh
IFwKICAgICAgICAgICAgZmlsZTovL2ZpbHRlci5qc29uIFwKLSAgICAgICAgICAgZmlsZTovL2Zp
eC1pbnN0YWxsLW1hbngucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pY3UtQWRkZWQt
YXJtZWItc3VwcG9ydC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9JQ1UtMjI4MTNfcmlzZV9i
dWZmZXJfc2l6ZXNfcGtnZGF0YV9QUjMwNTgucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAw
MS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2ggXAogICAgICAgICAgICAiCiAK
IFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICJcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LURpc2FibGUtTERGTEFHU0lDVURULWZvci1MaW51eC5wYXRjaCBcCiAgICAgICAgICAgIgotU1JD
X1VSSVtjb2RlLnNoYTI1NnN1bV0gPSAiY2I5NjhkZjNlNGQyZTg3ZThiMTFjNDlhNWQwMWM3ODdi
ZDEzYjk1NDUyODBmYzY2NDJmODI2NTI3NjE4Y2FlZiIKK1NSQ19VUklbY29kZS5zaGEyNTZzdW1d
ID0gImRmYWNiNDZiZmU0NzQ3NDEwNDcyY2UzZTExNDRiZjI4YTEwMmZlZWFhNGUzODc1YmFjOWI0
YzZjZjMwZjRmM2UiCiBTUkNfVVJJW2RhdGEuc2hhMjU2c3VtXSA9ICJhNTEwNDIxMmRjMzE3YTY0
ZjliMDM1NzIzZWE3MDZmMmY0ZmQ1YTBmMzdiNzkyM2ZhZTdhZWI5ZDFkMDA2MWIxIgogCiBVUFNU
UkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvcmVsZWFzZS0oP1A8cHZlcj4oPyEuK3Jj
KS4rKSIKLS0gCjIuNDQuMQoK

--===============6034762791475071202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:86ac1ed33b4932b090285f725d45b4b2eac8259f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 103 Local 87 Mirrors 0 Missed 16 Current 199 (84% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 768 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa)
NOTE: Running task 798 of 921 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa)
NOTE: recipe icu-76-1-r0: task do_recipe_qa: Started
NOTE: recipe icu-native-76-1-r0: task do_recipe_qa: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 889 of 921 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_fetch)
NOTE: recipe icu-native-76-1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 890 of 921 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_fetch)
NOTE: recipe icu-76-1-r0: task do_fetch: Started
NOTE: recipe icu-native-76-1-r0: task do_fetch: Started
WARNING: icu-76-1-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-data.zip;name=data - will attempt other sources if available
WARNING: icu-native-76-1-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-data.zip;name=data - will attempt other sources if available
NOTE: recipe icu-76-1-r0: task do_fetch: Failed
NOTE: recipe icu-native-76-1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 890 tasks of which 886 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118122415.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118122415.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/icu/76-1/temp/log.do_fetch.1018676
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/76-1/temp/log.do_fetch.1018687
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: icu-76-1-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-data.zip;name=data'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/icu4c-76_1-data.zip.tmp' has sha256 checksum '133ae58a67d68b46f7296822904cd3c30126a0b4b2f65f0f905e7f47c0ef9e47' when 'a5104212dc317a64f9b035723ea706f2f4fd5a0f37b7923fae7aeb9d1d0061b1' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "133ae58a67d68b46f7296822904cd3c30126a0b4b2f65f0f905e7f47c0ef9e47"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-76-1-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-data.zip;name=data')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/icu/76-1/temp/log.do_fetch.1018676
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_fetch) failed with exit code '1'
ERROR: icu-native-76-1-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-data.zip;name=data'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/icu4c-76_1-data.zip.tmp' has sha256 checksum '133ae58a67d68b46f7296822904cd3c30126a0b4b2f65f0f905e7f47c0ef9e47' when 'a5104212dc317a64f9b035723ea706f2f4fd5a0f37b7923fae7aeb9d1d0061b1' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "133ae58a67d68b46f7296822904cd3c30126a0b4b2f65f0f905e7f47c0ef9e47"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-native-76-1-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-data.zip;name=data')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/76-1/temp/log.do_fetch.1018687
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_fetch) failed with exit code '1'

--===============6034762791475071202==--

