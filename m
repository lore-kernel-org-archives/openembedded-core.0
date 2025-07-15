Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB917C83F37
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.12165.1752594932807501531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=38Ihk8US;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MVhjUCTg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101980ecc6e47-5d1a05d5-3f69-45ff-bad1-3b8fa3048700-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TOEtYHIbR/1tHJFdPqVJ//cpbdzZIF5DXK3S4/AUkmU=;
	b=38Ihk8USkcFkrII1u0JgmRal/Yf2I+fAZdJiWgJ3XuZpNaVxLRYqVgBcjupd0630
	8KWLaxiHUlrXkSk6GomM7gc0+NxjhQSVCMiDNTVwJTxbaQrQdD0XQeiGIZUA0yY2SQO
	7ciqFLRz0JxfKcHqMWTaFj8uDuFZFs3WAAj9GB+0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TOEtYHIbR/1tHJFdPqVJ//cpbdzZIF5DXK3S4/AUkmU=;
	b=MVhjUCTgizubJba0K2G3O3PGX3IhrvGmm2ddppvapXmBV9YYNdrBKBpL7hkpdarN
	a7xJWlMxnBoj+9LzyLRdp2q8e7EX0DdCN67+4NF7HaXxtUuiJ2MdCpotZFLoLVdPiTF
	rZpW66pCDQmAlUyVhkaXpjlaFqUCOrtBT/Jhs4/8=
Content-Type: multipart/mixed; boundary="===============8488238688969716209=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.14.4 SUCCEEDED
Message-ID: <010101980ecc6e47-5d1a05d5-3f69-45ff-bad1-3b8fa3048700-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220320

--===============8488238688969716209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxml2* to *2.14.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.14.3-2.14.4.patch
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
From e746cb224d3eb8ef587ff70732e22e90a2c20654 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 08:29:24 +0000
Subject: [PATCH] libxml2: upgrade 2.14.3 -> 2.14.4

---
 ...-installation-directories-in-libxml2.patch | 14 ++++----
 .../libxml/libxml2/CVE-2025-6021.patch        | 36 +++----------------
 .../libxml/libxml2/install-tests.patch        |  4 +--
 .../{libxml2_2.14.3.bb => libxml2_2.14.4.bb}  |  2 +-
 4 files changed, 14 insertions(+), 42 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.3.bb => libxml2_2.14.4.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 6ea5adafa2..627f8472c3 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 55ed199fdb55a1a600616ba14ad0feedcf828d86 Mon Sep 17 00:00:00 2001
+From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 40e75151..d21ebfe5 100644
+index aaa02e3..fb241bb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1061,17 +1061,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -37,7 +37,7 @@ index 40e75151..d21ebfe5 100644
  AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
                     [System configuration directory (/etc)])
 diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
-index 4945dda4..31036805 100644
+index e040a75..dc0d6b8 100644
 --- a/libxml2-config.cmake.in
 +++ b/libxml2-config.cmake.in
 @@ -24,17 +24,20 @@
@@ -66,7 +66,7 @@ index 4945dda4..31036805 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 4c59211d..3e5f25d3 100644
+index 98bc6e3..3ef0bd0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -599,9 +599,6 @@ config_cmake = configuration_data()
@@ -77,5 +77,5 @@ index 4c59211d..3e5f25d3 100644
 -config_cmake.set('INSTALL_INCLUDEDIR', dir_include)
 -config_cmake.set('INSTALL_LIBDIR', dir_lib)
  config_cmake.set('VERSION', meson.project_version())
- config_cmake.set('WITH_HTTP', want_http.to_int().to_string())
- config_cmake.set('WITH_ICONV', want_iconv.to_int().to_string())
+ config_cmake.set10('BUILD_SHARED_LIBS',
+                    get_option('default_library') != 'static')
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
index 157486848b..0b73bceb24 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -1,4 +1,4 @@
-From 33d7969baf541326a35e2fbe31943c46af8c71db Mon Sep 17 00:00:00 2001
+From e546e423d69ec9b3c71167d3c3140fa1b9af93c7 Mon Sep 17 00:00:00 2001
 From: Nick Wellnhofer <wellnhofer@aevum.de>
 Date: Tue, 27 May 2025 12:53:17 +0200
 Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
@@ -14,11 +14,11 @@ CVE: CVE-2025-6021
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- tree.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
+ tree.c | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/tree.c b/tree.c
-index 7454b07..22ec11c 100644
+index e14bc62..22ec11c 100644
 --- a/tree.c
 +++ b/tree.c
 @@ -23,6 +23,7 @@
@@ -29,31 +29,3 @@ index 7454b07..22ec11c 100644
  
  #ifdef LIBXML_ZLIB_ENABLED
  #include <zlib.h>
-@@ -168,10 +169,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
- xmlChar *
- xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
- 	      xmlChar *memory, int len) {
--    int lenn, lenp;
-+    size_t lenn, lenp;
-     xmlChar *ret;
- 
--    if (ncname == NULL) return(NULL);
-+    if ((ncname == NULL) || (len < 0)) return(NULL);
-     if (prefix == NULL) return((xmlChar *) ncname);
- 
- #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
-@@ -182,8 +183,10 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
- 
-     lenn = strlen((char *) ncname);
-     lenp = strlen((char *) prefix);
-+    if (lenn >= SIZE_MAX - lenp - 1)
-+        return(NULL);
- 
--    if ((memory == NULL) || (len < lenn + lenp + 2)) {
-+    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
- 	ret = xmlMalloc(lenn + lenp + 2);
- 	if (ret == NULL)
- 	    return(NULL);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 789aeca119..4c1faa83cb 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
+From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4cb9a5c..8adcd7e 100644
+index 6f98144..ecb3b54 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -26,6 +26,16 @@ check_PROGRAMS = \
diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipes-core/libxml/libxml2_2.14.4.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.14.3.bb
rename to meta/recipes-core/libxml/libxml2_2.14.4.bb
index 4baab59186..52b2040122 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.4.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"
+SRC_URI[archive.sha256sum] = "24175ec30a97cfa86bdf9befb7ccf4613f8f4b2713c5103e0dd0bc9c711a2773"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.47.1


--===============8488238688969716209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.3.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.14.3;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch file://CVE-2025-6021.patch" to "https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.4.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.14.4;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch file://CVE-2025-6021.patch"
packages/core2-64-poky-linux/libxml2: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.16.0.3", added "/usr/lib/.debug/libxml2.so.16.0.4"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7651136 to 7653264 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGSIZE changed from 389595 to 389841 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-utils: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.0.3", added "/usr/lib/libxml2.so.16.0.4"
packages/core2-64-poky-linux/libxml2/libxml2: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so.16.0.3 moved to /usr/lib/libxml2.so.16.0.4
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so.16.0.3 moved to /usr/lib/libxml2.so.16.0.4

--===============8488238688969716209==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.14.3-2.14.4.patch"

RnJvbSBlNzQ2Y2IyMjRkM2ViOGVmNTg3ZmY3MDczMmUyMmU5MGEyYzIwNjU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDg6Mjk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTQuMyAtPiAyLjE0LjQKCi0tLQogLi4uLWluc3RhbGxhdGlvbi1k
aXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoIHwgMTQgKysrKy0tLS0KIC4uLi9saWJ4bWwvbGli
eG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoICAgICAgICB8IDM2ICsrKy0tLS0tLS0tLS0tLS0tLS0K
IC4uLi9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoICAgICAgICB8ICA0ICstLQog
Li4uL3tsaWJ4bWwyXzIuMTQuMy5iYiA9PiBsaWJ4bWwyXzIuMTQuNC5iYn0gIHwgIDIgKy0KIDQg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL3tsaWJ4bWwyXzIuMTQuMy5iYiA9PiBsaWJ4bWwyXzIu
MTQuNC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGli
eG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9uLWRpcmVjdG9yaWVzLWluLWxp
YnhtbDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVy
dC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9uLWRpcmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2gKaW5k
ZXggNmVhNWFkYWZhMi4uNjI3Zjg0NzJjMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlvbi1kaXJlY3Rv
cmllcy1pbi1saWJ4bWwyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4
bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGli
eG1sMi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTVlZDE5OWZkYjU1YTFhNjAwNjE2YmEx
NGFkMGZlZWRjZjgyOGQ4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWE3ZTE3N2E3
MzE1Yzg1NmEyZjBlM2MyYTE3ZWUwZmQ5ZTI5N2JjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KIERhdGU6IE1vbiwg
MjYgTWF5IDIwMjUgMjE6MTE6MTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJjbWFr
ZTogRml4IGluc3RhbGxhdGlvbiBkaXJlY3RvcmllcyBpbgpAQCAtMTUsMTAgKzE1LDEwIEBAIFNp
Z25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KICAzIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDQwZTc1MTUxLi5kMjFlYmZl
NSAxMDA2NDQKK2luZGV4IGFhYTAyZTMuLmZiMjQxYmIgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTEwNjEsMTcgKzEwNjEsNiBAQCBBQ19TVUJTVChY
TUxfUFJJVkFURV9MSUJTKQorQEAgLTEwNjUsMTcgKzEwNjUsNiBAQCBBQ19TVUJTVChYTUxfUFJJ
VkFURV9MSUJTKQogIEFDX1NVQlNUKFhNTF9QUklWQVRFX0NGTEFHUykKICBBQ19TVUJTVChYTUxf
SU5DTFVERURJUikKICAKQEAgLTM3LDcgKzM3LDcgQEAgaW5kZXggNDBlNzUxNTEuLmQyMWViZmU1
IDEwMDY0NAogIEFDX0RFRklORV9VTlFVT1RFRChbWE1MX1NZU0NPTkZESVJdLCBbIiRYTUxfU1lT
Q09ORkRJUiJdLAogICAgICAgICAgICAgICAgICAgICBbU3lzdGVtIGNvbmZpZ3VyYXRpb24gZGly
ZWN0b3J5ICgvZXRjKV0pCiBkaWZmIC0tZ2l0IGEvbGlieG1sMi1jb25maWcuY21ha2UuaW4gYi9s
aWJ4bWwyLWNvbmZpZy5jbWFrZS5pbgotaW5kZXggNDk0NWRkYTQuLjMxMDM2ODA1IDEwMDY0NAor
aW5kZXggZTA0MGE3NS4uZGMwZDZiOCAxMDA2NDQKIC0tLSBhL2xpYnhtbDItY29uZmlnLmNtYWtl
LmluCiArKysgYi9saWJ4bWwyLWNvbmZpZy5jbWFrZS5pbgogQEAgLTI0LDE3ICsyNCwyMCBAQApA
QCAtNjYsNyArNjYsNyBAQCBpbmRleCA0OTQ1ZGRhNC4uMzEwMzY4MDUgMTAwNjQ0CiAgc2V0KExJ
QlhNTDJfTElCUkFSSUVTICR7TElCWE1MMl9MSUJSQVJZfSkKICBzZXQoTElCWE1MMl9JTkNMVURF
X0RJUlMgJHtMSUJYTUwyX0lOQ0xVREVfRElSfSkKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBi
L21lc29uLmJ1aWxkCi1pbmRleCA0YzU5MjExZC4uM2U1ZjI1ZDMgMTAwNjQ0CitpbmRleCA5OGJj
NmUzLi4zZWYwYmQwIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxk
CiBAQCAtNTk5LDkgKzU5OSw2IEBAIGNvbmZpZ19jbWFrZSA9IGNvbmZpZ3VyYXRpb25fZGF0YSgp
CkBAIC03Nyw1ICs3Nyw1IEBAIGluZGV4IDRjNTkyMTFkLi4zZTVmMjVkMyAxMDA2NDQKIC1jb25m
aWdfY21ha2Uuc2V0KCdJTlNUQUxMX0lOQ0xVREVESVInLCBkaXJfaW5jbHVkZSkKIC1jb25maWdf
Y21ha2Uuc2V0KCdJTlNUQUxMX0xJQkRJUicsIGRpcl9saWIpCiAgY29uZmlnX2NtYWtlLnNldCgn
VkVSU0lPTicsIG1lc29uLnByb2plY3RfdmVyc2lvbigpKQotIGNvbmZpZ19jbWFrZS5zZXQoJ1dJ
VEhfSFRUUCcsIHdhbnRfaHR0cC50b19pbnQoKS50b19zdHJpbmcoKSkKLSBjb25maWdfY21ha2Uu
c2V0KCdXSVRIX0lDT05WJywgd2FudF9pY29udi50b19pbnQoKS50b19zdHJpbmcoKSkKKyBjb25m
aWdfY21ha2Uuc2V0MTAoJ0JVSUxEX1NIQVJFRF9MSUJTJywKKyAgICAgICAgICAgICAgICAgICAg
Z2V0X29wdGlvbignZGVmYXVsdF9saWJyYXJ5JykgIT0gJ3N0YXRpYycpCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMjUtNjAyMS5wYXRjaAppbmRleCAx
NTc0ODY4NDhiLi4wYjczYmNlYjI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4
bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xp
YnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMz
ZDc5NjliYWY1NDEzMjZhMzVlMmZiZTMxOTQzYzQ2YWY4YzcxZGIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGU1NDZlNDIzZDY5ZWM5YjNjNzExNjdkM2MzMTQwZmExYjlhZjkzYzcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBOaWNrIFdlbGxuaG9mZXIgPHdlbGxuaG9mZXJA
YWV2dW0uZGU+CiBEYXRlOiBUdWUsIDI3IE1heSAyMDI1IDEyOjUzOjE3ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHRyZWU6IEZpeCBpbnRlZ2VyIG92ZXJmbG93IGluIHhtbEJ1aWxkUU5hbWUKQEAg
LTE0LDExICsxNCwxMSBAQCBDVkU6IENWRS0yMDI1LTYwMjEKIFVwc3RyZWFtLVN0YXR1czogQmFj
a3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwyLy0vY29tbWl0L2Fj
YmJlZWY5ZjVkY2RjYzkwMWM1ZjNmYTE0ZDU4M2VmOGNmZDIyZjBdCiBTaWduZWQtb2ZmLWJ5OiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAtLS0KLSB0cmVlLmMgfCA5ICsr
KysrKy0tLQotIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CisgdHJlZS5jIHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYg
LS1naXQgYS90cmVlLmMgYi90cmVlLmMKLWluZGV4IDc0NTRiMDcuLjIyZWMxMWMgMTAwNjQ0Citp
bmRleCBlMTRiYzYyLi4yMmVjMTFjIDEwMDY0NAogLS0tIGEvdHJlZS5jCiArKysgYi90cmVlLmMK
IEBAIC0yMyw2ICsyMyw3IEBACkBAIC0yOSwzMSArMjksMyBAQCBpbmRleCA3NDU0YjA3Li4yMmVj
MTFjIDEwMDY0NAogIAogICNpZmRlZiBMSUJYTUxfWkxJQl9FTkFCTEVECiAgI2luY2x1ZGUgPHps
aWIuaD4KLUBAIC0xNjgsMTAgKzE2OSwxMCBAQCB4bWxHZXRQYXJhbWV0ZXJFbnRpdHlGcm9tRHRk
KGNvbnN0IHhtbER0ZCAqZHRkLCBjb25zdCB4bWxDaGFyICpuYW1lKSB7Ci0geG1sQ2hhciAqCi0g
eG1sQnVpbGRRTmFtZShjb25zdCB4bWxDaGFyICpuY25hbWUsIGNvbnN0IHhtbENoYXIgKnByZWZp
eCwKLSAJICAgICAgeG1sQ2hhciAqbWVtb3J5LCBpbnQgbGVuKSB7Ci0tICAgIGludCBsZW5uLCBs
ZW5wOwotKyAgICBzaXplX3QgbGVubiwgbGVucDsKLSAgICAgeG1sQ2hhciAqcmV0OwotIAotLSAg
ICBpZiAobmNuYW1lID09IE5VTEwpIHJldHVybihOVUxMKTsKLSsgICAgaWYgKChuY25hbWUgPT0g
TlVMTCkgfHwgKGxlbiA8IDApKSByZXR1cm4oTlVMTCk7Ci0gICAgIGlmIChwcmVmaXggPT0gTlVM
TCkgcmV0dXJuKCh4bWxDaGFyICopIG5jbmFtZSk7Ci0gCi0gI2lmZGVmIEZVWlpJTkdfQlVJTERf
TU9ERV9VTlNBRkVfRk9SX1BST0RVQ1RJT04KLUBAIC0xODIsOCArMTgzLDEwIEBAIHhtbEJ1aWxk
UU5hbWUoY29uc3QgeG1sQ2hhciAqbmNuYW1lLCBjb25zdCB4bWxDaGFyICpwcmVmaXgsCi0gCi0g
ICAgIGxlbm4gPSBzdHJsZW4oKGNoYXIgKikgbmNuYW1lKTsKLSAgICAgbGVucCA9IHN0cmxlbigo
Y2hhciAqKSBwcmVmaXgpOwotKyAgICBpZiAobGVubiA+PSBTSVpFX01BWCAtIGxlbnAgLSAxKQot
KyAgICAgICAgcmV0dXJuKE5VTEwpOwotIAotLSAgICBpZiAoKG1lbW9yeSA9PSBOVUxMKSB8fCAo
bGVuIDwgbGVubiArIGxlbnAgKyAyKSkgewotKyAgICBpZiAoKG1lbW9yeSA9PSBOVUxMKSB8fCAo
KHNpemVfdCkgbGVuIDwgbGVubiArIGxlbnAgKyAyKSkgewotIAlyZXQgPSB4bWxNYWxsb2MobGVu
biArIGxlbnAgKyAyKTsKLSAJaWYgKHJldCA9PSBOVUxMKQotIAkgICAgcmV0dXJuKE5VTEwpOwot
LS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bDIvaW5zdGFsbC10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwy
L2luc3RhbGwtdGVzdHMucGF0Y2gKaW5kZXggNzg5YWVjYTExOS4uNGMxZmFhODNjYiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YzEwNTRlYWNiNDMwNDcyMDY4ZjIxZTQ4NDA3NDlj
Mzg0ZThlODY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ZTk5ZmVmNmVhZTA2NDJh
M2YxZTUxMWU0ZDI0YWJmN2Q2ZDI4ZjUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBNb24sIDUgRGVjIDIwMjIg
MTc6MDI6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gYWRkIHlvY3RvLXNwZWNpZmljIGluc3Rh
bGwtcHRlc3QgdGFyZ2V0CkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA0Y2I5
YTVjLi44YWRjZDdlIDEwMDY0NAoraW5kZXggNmY5ODE0NC4uZWNiM2I1NCAxMDA2NDQKIC0tLSBh
L01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQogQEAgLTI2LDYgKzI2LDE2IEBAIGNoZWNr
X1BST0dSQU1TID0gXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bDJfMi4xNC4zLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNC40LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnht
bC9saWJ4bWwyXzIuMTQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDJfMi4xNC40LmJiCmluZGV4IDRiYWFiNTkxODYuLjUyYjIwNDAxMjIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTQuMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE0LjQuYmIKQEAgLTIxLDcgKzIxLDcgQEAgU1JD
X1VSSSArPSAiaHR0cDovL3d3dy53My5vcmcvWE1ML1Rlc3QveG1sdHMyMDEzMDkyMy50YXI7c3Vi
ZGlyPSR7QlB9O25hbWU9dGVzdHQKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDI1LTYwMjEucGF0
Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjZkZTU1
Y2FjYzhjMmJjNzU4ZjJlZjZmOTNjMzEzY2IzMGU0ZGQ1ZDg0YWM1ZDNjN2NjYmQ5MzQ0ZDhjYzY4
MzMiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIyNDE3NWVjMzBhOTdjZmE4NmJkZjli
ZWZiN2NjZjQ2MTNmOGY0YjI3MTNjNTEwM2UwZGQwYmM5YzcxMWEyNzczIgogU1JDX1VSSVt0ZXN0
dGFyLnNoYTI1NnN1bV0gPSAiYzZiMmQ0MmVlNTBiOGIyMzZlNzExYTk3ZDY4ZTZjNGI1YzhkODNl
NjlhMmJlNDcyMjM3OWYwODcwMmVhNzI3MyIKIAogIyBEaXNwdXRlZCBhcyBhIHNlY3VyaXR5IGlz
c3VlLCBidXQgZml4ZWQgaW4gZDM5Zjc4MAotLSAKMi40Ny4xCgo=

--===============8488238688969716209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.0.3", added "/usr/lib/libxml2.so.16.0.4"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so.16.0.3 moved to /usr/lib/libxml2.so.16.0.4
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so.16.0.3 moved to /usr/lib/libxml2.so.16.0.4

--===============8488238688969716209==--

