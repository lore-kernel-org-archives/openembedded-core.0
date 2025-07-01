Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F5CC83F1D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1429.1751386808085277878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wv26Ndca;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dckxPput;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010197c6c9dd1f-2f10d7e9-1aa4-4884-b687-04f4de9e01a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zwPbnC7MyMPuDoXfh4nVWCLDm2FDNObKZDzmy5/QyDY=;
	b=wv26Ndca0feKLKWT9iKOaw1UYDm18j9HIEdHiFrfLsyz/hCQdzO7Z/FCYGdorD8L
	iUvJgHTvQF0Z5qRarRhQlaVS2oKtHAdAyuILpckTj0pWOa3WgLnLf6DXqhGYKhLYpXQ
	jAQbhY/MhmxVxDUrflLMGUH0NjNYHuTSYQ/fZ/o4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zwPbnC7MyMPuDoXfh4nVWCLDm2FDNObKZDzmy5/QyDY=;
	b=dckxPputZ4AjKOUbyZuPXViTd5itnSr+gCquKe94P5ampbShMaCupO0wKfNmQ3WQ
	fQ6QwNwrwg4ZK4wQDQmj9o8sZ8DtFU/MSDR1Rq9POQMUhZpBZ/5V7r8F7vOoRyUj8F9
	8dyliW2PHtyKUUX2K1NXlue2Ukb9NmDkixNQJve8=
Content-Type: multipart/mixed; boundary="===============7822441225437988237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.14.4 SUCCEEDED
Message-ID: <01010197c6c9dd1f-2f10d7e9-1aa4-4884-b687-04f4de9e01a6-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219614

--===============7822441225437988237==
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
From 5860d166288e84961d01dd24d48de9d80f789749 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:50:14 +0000
Subject: [PATCH] libxml2: upgrade 2.14.3 -> 2.14.4

---
 ...-installation-directories-in-libxml2.patch | 14 ++++----
 .../libxml/libxml2/CVE-2025-6021.patch        | 36 +++----------------
 .../libxml/libxml2/install-tests.patch        |  4 +--
 .../{libxml2_2.14.3.bb => libxml2_2.14.4.bb}  |  2 +-
 4 files changed, 14 insertions(+), 42 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.3.bb => libxml2_2.14.4.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 6ea5adafa2..6e84a3c85a 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 55ed199fdb55a1a600616ba14ad0feedcf828d86 Mon Sep 17 00:00:00 2001
+From 2a7b8bc68c11e2251b439c4148e5a8709741ebdc Mon Sep 17 00:00:00 2001
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
index 157486848b..74f03864cc 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -1,4 +1,4 @@
-From 33d7969baf541326a35e2fbe31943c46af8c71db Mon Sep 17 00:00:00 2001
+From d0949832da040e092701f14497710c1f38986cbd Mon Sep 17 00:00:00 2001
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
index 789aeca119..741ce2886f 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
+From 0b7c43a81b7acf50a9a3cdd109bec2d829fd1aac Mon Sep 17 00:00:00 2001
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


--===============7822441225437988237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.14.3-2.14.4.patch"

RnJvbSA1ODYwZDE2NjI4OGU4NDk2MWQwMWRkMjRkNDhkZTlkODBmNzg5NzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzo1MDoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xNC4zIC0+IDIuMTQuNAoKLS0tCiAuLi4taW5zdGFsbGF0aW9uLWRp
cmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2ggfCAxNCArKysrLS0tLQogLi4uL2xpYnhtbC9saWJ4
bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2ggICAgICAgIHwgMzYgKysrLS0tLS0tLS0tLS0tLS0tLQog
Li4uL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0Y2ggICAgICAgIHwgIDQgKy0tCiAu
Li4ve2xpYnhtbDJfMi4xNC4zLmJiID0+IGxpYnhtbDJfMi4xNC40LmJifSAgfCAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwve2xpYnhtbDJfMi4xNC4zLmJiID0+IGxpYnhtbDJfMi4x
NC40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4
bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGli
eG1sMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyLzAwMDEtUmV2ZXJ0
LWNtYWtlLUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaAppbmRl
eCA2ZWE1YWRhZmEyLi42ZTg0YTNjODVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9uLWRpcmVjdG9y
aWVzLWluLWxpYnhtbDIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4
bWwyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1NWVkMTk5ZmRiNTVhMWE2MDA2MTZiYTE0
YWQwZmVlZGNmODI4ZDg2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYTdiOGJjNjhj
MTFlMjI1MWI0MzljNDE0OGU1YTg3MDk3NDFlYmRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPgogRGF0ZTogTW9uLCAy
NiBNYXkgMjAyNSAyMToxMToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgImNtYWtl
OiBGaXggaW5zdGFsbGF0aW9uIGRpcmVjdG9yaWVzIGluCkBAIC0xNSwxMCArMTUsMTAgQEAgU2ln
bmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPgogIDMgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNDBlNzUxNTEuLmQyMWViZmU1
IDEwMDY0NAoraW5kZXggYWFhMDJlMy4uZmIyNDFiYiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5h
YwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTA2MSwxNyArMTA2MSw2IEBAIEFDX1NVQlNUKFhN
TF9QUklWQVRFX0xJQlMpCitAQCAtMTA2NSwxNyArMTA2NSw2IEBAIEFDX1NVQlNUKFhNTF9QUklW
QVRFX0xJQlMpCiAgQUNfU1VCU1QoWE1MX1BSSVZBVEVfQ0ZMQUdTKQogIEFDX1NVQlNUKFhNTF9J
TkNMVURFRElSKQogIApAQCAtMzcsNyArMzcsNyBAQCBpbmRleCA0MGU3NTE1MS4uZDIxZWJmZTUg
MTAwNjQ0CiAgQUNfREVGSU5FX1VOUVVPVEVEKFtYTUxfU1lTQ09ORkRJUl0sIFsiJFhNTF9TWVND
T05GRElSIl0sCiAgICAgICAgICAgICAgICAgICAgIFtTeXN0ZW0gY29uZmlndXJhdGlvbiBkaXJl
Y3RvcnkgKC9ldGMpXSkKIGRpZmYgLS1naXQgYS9saWJ4bWwyLWNvbmZpZy5jbWFrZS5pbiBiL2xp
YnhtbDItY29uZmlnLmNtYWtlLmluCi1pbmRleCA0OTQ1ZGRhNC4uMzEwMzY4MDUgMTAwNjQ0Citp
bmRleCBlMDQwYTc1Li5kYzBkNmI4IDEwMDY0NAogLS0tIGEvbGlieG1sMi1jb25maWcuY21ha2Uu
aW4KICsrKyBiL2xpYnhtbDItY29uZmlnLmNtYWtlLmluCiBAQCAtMjQsMTcgKzI0LDIwIEBACkBA
IC02Niw3ICs2Niw3IEBAIGluZGV4IDQ5NDVkZGE0Li4zMTAzNjgwNSAxMDA2NDQKICBzZXQoTElC
WE1MMl9MSUJSQVJJRVMgJHtMSUJYTUwyX0xJQlJBUll9KQogIHNldChMSUJYTUwyX0lOQ0xVREVf
RElSUyAke0xJQlhNTDJfSU5DTFVERV9ESVJ9KQogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IDRjNTkyMTFkLi4zZTVmMjVkMyAxMDA2NDQKK2luZGV4IDk4YmM2
ZTMuLjNlZjBiZDAgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQK
IEBAIC01OTksOSArNTk5LDYgQEAgY29uZmlnX2NtYWtlID0gY29uZmlndXJhdGlvbl9kYXRhKCkK
QEAgLTc3LDUgKzc3LDUgQEAgaW5kZXggNGM1OTIxMWQuLjNlNWYyNWQzIDEwMDY0NAogLWNvbmZp
Z19jbWFrZS5zZXQoJ0lOU1RBTExfSU5DTFVERURJUicsIGRpcl9pbmNsdWRlKQogLWNvbmZpZ19j
bWFrZS5zZXQoJ0lOU1RBTExfTElCRElSJywgZGlyX2xpYikKICBjb25maWdfY21ha2Uuc2V0KCdW
RVJTSU9OJywgbWVzb24ucHJvamVjdF92ZXJzaW9uKCkpCi0gY29uZmlnX2NtYWtlLnNldCgnV0lU
SF9IVFRQJywgd2FudF9odHRwLnRvX2ludCgpLnRvX3N0cmluZygpKQotIGNvbmZpZ19jbWFrZS5z
ZXQoJ1dJVEhfSUNPTlYnLCB3YW50X2ljb252LnRvX2ludCgpLnRvX3N0cmluZygpKQorIGNvbmZp
Z19jbWFrZS5zZXQxMCgnQlVJTERfU0hBUkVEX0xJQlMnLAorICAgICAgICAgICAgICAgICAgICBn
ZXRfb3B0aW9uKCdkZWZhdWx0X2xpYnJhcnknKSAhPSAnc3RhdGljJykKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoCmluZGV4IDE1
NzQ4Njg0OGIuLjc0ZjAzODY0Y2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnht
bC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGli
eG1sL2xpYnhtbDIvQ1ZFLTIwMjUtNjAyMS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzNk
Nzk2OWJhZjU0MTMyNmEzNWUyZmJlMzE5NDNjNDZhZjhjNzFkYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZDA5NDk4MzJkYTA0MGUwOTI3MDFmMTQ0OTc3MTBjMWYzODk4NmNiZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5pY2sgV2VsbG5ob2ZlciA8d2VsbG5ob2ZlckBh
ZXZ1bS5kZT4KIERhdGU6IFR1ZSwgMjcgTWF5IDIwMjUgMTI6NTM6MTcgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gdHJlZTogRml4IGludGVnZXIgb3ZlcmZsb3cgaW4geG1sQnVpbGRRTmFtZQpAQCAt
MTQsMTEgKzE0LDExIEBAIENWRTogQ1ZFLTIwMjUtNjAyMQogVXBzdHJlYW0tU3RhdHVzOiBCYWNr
cG9ydCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIvLS9jb21taXQvYWNi
YmVlZjlmNWRjZGNjOTAxYzVmM2ZhMTRkNTgzZWY4Y2ZkMjJmMF0KIFNpZ25lZC1vZmYtYnk6IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIC0tLQotIHRyZWUuYyB8IDkgKysr
KysrLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
KyB0cmVlLmMgfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAt
LWdpdCBhL3RyZWUuYyBiL3RyZWUuYwotaW5kZXggNzQ1NGIwNy4uMjJlYzExYyAxMDA2NDQKK2lu
ZGV4IGUxNGJjNjIuLjIyZWMxMWMgMTAwNjQ0CiAtLS0gYS90cmVlLmMKICsrKyBiL3RyZWUuYwog
QEAgLTIzLDYgKzIzLDcgQEAKQEAgLTI5LDMxICsyOSwzIEBAIGluZGV4IDc0NTRiMDcuLjIyZWMx
MWMgMTAwNjQ0CiAgCiAgI2lmZGVmIExJQlhNTF9aTElCX0VOQUJMRUQKICAjaW5jbHVkZSA8emxp
Yi5oPgotQEAgLTE2OCwxMCArMTY5LDEwIEBAIHhtbEdldFBhcmFtZXRlckVudGl0eUZyb21EdGQo
Y29uc3QgeG1sRHRkICpkdGQsIGNvbnN0IHhtbENoYXIgKm5hbWUpIHsKLSB4bWxDaGFyICoKLSB4
bWxCdWlsZFFOYW1lKGNvbnN0IHhtbENoYXIgKm5jbmFtZSwgY29uc3QgeG1sQ2hhciAqcHJlZml4
LAotIAkgICAgICB4bWxDaGFyICptZW1vcnksIGludCBsZW4pIHsKLS0gICAgaW50IGxlbm4sIGxl
bnA7Ci0rICAgIHNpemVfdCBsZW5uLCBsZW5wOwotICAgICB4bWxDaGFyICpyZXQ7Ci0gCi0tICAg
IGlmIChuY25hbWUgPT0gTlVMTCkgcmV0dXJuKE5VTEwpOwotKyAgICBpZiAoKG5jbmFtZSA9PSBO
VUxMKSB8fCAobGVuIDwgMCkpIHJldHVybihOVUxMKTsKLSAgICAgaWYgKHByZWZpeCA9PSBOVUxM
KSByZXR1cm4oKHhtbENoYXIgKikgbmNuYW1lKTsKLSAKLSAjaWZkZWYgRlVaWklOR19CVUlMRF9N
T0RFX1VOU0FGRV9GT1JfUFJPRFVDVElPTgotQEAgLTE4Miw4ICsxODMsMTAgQEAgeG1sQnVpbGRR
TmFtZShjb25zdCB4bWxDaGFyICpuY25hbWUsIGNvbnN0IHhtbENoYXIgKnByZWZpeCwKLSAKLSAg
ICAgbGVubiA9IHN0cmxlbigoY2hhciAqKSBuY25hbWUpOwotICAgICBsZW5wID0gc3RybGVuKChj
aGFyICopIHByZWZpeCk7Ci0rICAgIGlmIChsZW5uID49IFNJWkVfTUFYIC0gbGVucCAtIDEpCi0r
ICAgICAgICByZXR1cm4oTlVMTCk7Ci0gCi0tICAgIGlmICgobWVtb3J5ID09IE5VTEwpIHx8IChs
ZW4gPCBsZW5uICsgbGVucCArIDIpKSB7Ci0rICAgIGlmICgobWVtb3J5ID09IE5VTEwpIHx8ICgo
c2l6ZV90KSBsZW4gPCBsZW5uICsgbGVucCArIDIpKSB7Ci0gCXJldCA9IHhtbE1hbGxvYyhsZW5u
ICsgbGVucCArIDIpOwotIAlpZiAocmV0ID09IE5VTEwpCi0gCSAgICByZXR1cm4oTlVMTCk7Ci0t
LSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1s
Mi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIv
aW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCA3ODlhZWNhMTE5Li43NDFjZTI4ODZmIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhjMTA1NGVhY2I0MzA0NzIwNjhmMjFlNDg0MDc0OWMz
ODRlOGU4NjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBiN2M0M2E4MWI3YWNmNTBh
OWEzY2RkMTA5YmVjMmQ4MjlmZDFhYWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1vbiwgNSBEZWMgMjAyMiAx
NzowMjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgeW9jdG8tc3BlY2lmaWMgaW5zdGFs
bC1wdGVzdCB0YXJnZXQKQEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IDRjYjlh
NWMuLjhhZGNkN2UgMTAwNjQ0CitpbmRleCA2Zjk4MTQ0Li5lY2IzYjU0IDEwMDY0NAogLS0tIGEv
TWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCiBAQCAtMjYsNiArMjYsMTYgQEAgY2hlY2tf
UFJPR1JBTVMgPSBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1s
Ml8yLjE0LjMuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE0LjQuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1s
L2xpYnhtbDJfMi4xNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGli
eG1sMl8yLjE0LjQuYmIKaW5kZXggNGJhYWI1OTE4Ni4uNTJiMjA0MDEyMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNC4zLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTQuNC5iYgpAQCAtMjEsNyArMjEsNyBAQCBTUkNf
VVJJICs9ICJodHRwOi8vd3d3LnczLm9yZy9YTUwvVGVzdC94bWx0czIwMTMwOTIzLnRhcjtzdWJk
aXI9JHtCUH07bmFtZT10ZXN0dAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjUtNjAyMS5wYXRj
aCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNmRlNTVj
YWNjOGMyYmM3NThmMmVmNmY5M2MzMTNjYjMwZTRkZDVkODRhYzVkM2M3Y2NiZDkzNDRkOGNjNjgz
MyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjI0MTc1ZWMzMGE5N2NmYTg2YmRmOWJl
ZmI3Y2NmNDYxM2Y4ZjRiMjcxM2M1MTAzZTBkZDBiYzljNzExYTI3NzMiCiBTUkNfVVJJW3Rlc3R0
YXIuc2hhMjU2c3VtXSA9ICJjNmIyZDQyZWU1MGI4YjIzNmU3MTFhOTdkNjhlNmM0YjVjOGQ4M2U2
OWEyYmU0NzIyMzc5ZjA4NzAyZWE3MjczIgogCiAjIERpc3B1dGVkIGFzIGEgc2VjdXJpdHkgaXNz
dWUsIGJ1dCBmaXhlZCBpbiBkMzlmNzgwCi0tIAoyLjQ3LjEKCg==

--===============7822441225437988237==
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

--===============7822441225437988237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.3.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.14.3;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch file://CVE-2025-6021.patch" to "https://download.gnome.org/sources//libxml2/2.14/libxml2-2.14.4.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.14.4;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch file://CVE-2025-6021.patch"
packages/core2-64-poky-linux/libxml2: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 7650960 to 7653088 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.16.0.3", added "/usr/lib/.debug/libxml2.so.16.0.4"
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dbg: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGSIZE changed from 389595 to 389841 (+0%)
packages/core2-64-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-dev: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-doc: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-locale: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-ptest: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-python: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-python: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-src: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-src: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2-utils: PV changed from "2.14.3" to "2.14.4"
packages/core2-64-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.0.3", added "/usr/lib/libxml2.so.16.0.4"
packages/core2-64-poky-linux/libxml2/libxml2: PKGV changed from 2.14.3 [default] to 2.14.4 [default]
packages/core2-64-poky-linux/libxml2/libxml2: PV changed from "2.14.3" to "2.14.4"
Changes to packages/core2-64-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so.16.0.3 moved to /usr/lib/libxml2.so.16.0.4
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.0.3 to libxml2.so.16.0.4
  /usr/lib/libxml2.so.16.0.3 moved to /usr/lib/libxml2.so.16.0.4

--===============7822441225437988237==--

