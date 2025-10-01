Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D20CCD18A
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.18070.1759325535574003788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pwRwI130;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PXO/8gOI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101999ff93ac9-a5116b83-a413-4c5b-a88f-37aebf12c671-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8o4qC4wA3X+h+tHIC3vgjI7fzGae7pVWDVbwp1yJ6bA=;
	b=pwRwI130uWbjk6Hx9dfXPCGLO0QkKG1ctVU9/FUmhMiop9NQviItdrvTAlkHI9ue
	y0owmze8i7iY9u/B7FIvhM7RF1v9gJyo9chqiHEHAEp1+bAr/5H7II+3hsY0qyWq4WP
	yy/aCZMxa+pU9h6Lh4wwCcfjM3mEUeDPVO9GJTps=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8o4qC4wA3X+h+tHIC3vgjI7fzGae7pVWDVbwp1yJ6bA=;
	b=PXO/8gOI9TXetb+iv0OcSfsdX6vP4oYham6U0T/wFNnqHpUjdvNGwCjeg5Kx4POO
	1hBTC94VA6Flu3x5uATHY/IY6FjTcvWs0hE8NoC93HtKmzIiHKFrXSjf54Q4GTlNTzL
	ldPubnv8JRAV3n/wuu0oLuzYBwsPlOAjc5jiYhvI=
Content-Type: multipart/mixed; boundary="===============4463699386844070635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.15.0 FAILED
Message-ID: <010101999ff93ac9-a5116b83-a413-4c5b-a88f-37aebf12c671-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224222

--===============4463699386844070635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxml2* to *2.15.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.14.6-2.15.0.patch
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
From 78ac82c7ebed8c566d8aac9c31748681c4c3060e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:24:58 +0000
Subject: [PATCH] libxml2: upgrade 2.14.6 -> 2.15.0

---
 ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch |  4 ++--
 meta/recipes-core/libxml/libxml2/install-tests.patch |  6 +++---
 .../libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb}  |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 627f8472c3..c9f23e4340 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
+From daef8210314f7062e21d7466c065e79a3ca26084 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aaa02e3..fb241bb 100644
+index 4eb629b..150e06e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -37,7 +37,7 @@ index aaa02e3..fb241bb 100644
  AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
                     [System configuration directory (/etc)])
 diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
-index e040a75..dc0d6b8 100644
+index ff6433f..b775cfe 100644
 --- a/libxml2-config.cmake.in
 +++ b/libxml2-config.cmake.in
 @@ -24,17 +24,20 @@
@@ -66,10 +66,10 @@ index e040a75..dc0d6b8 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 98bc6e3..3ef0bd0 100644
+index 31c73b6..8728852 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -599,9 +599,6 @@ config_cmake = configuration_data()
+@@ -577,9 +577,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
index 0b73bceb24..e836170bd9 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -1,4 +1,4 @@
-From e546e423d69ec9b3c71167d3c3140fa1b9af93c7 Mon Sep 17 00:00:00 2001
+From b1251ec22786abbd1adadda3bd349d2078904bd2 Mon Sep 17 00:00:00 2001
 From: Nick Wellnhofer <wellnhofer@aevum.de>
 Date: Tue, 27 May 2025 12:53:17 +0200
 Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
@@ -18,7 +18,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/tree.c b/tree.c
-index e14bc62..22ec11c 100644
+index e4fd0d6..e353c1f 100644
 --- a/tree.c
 +++ b/tree.c
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 4c1faa83cb..93dbd45e0e 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
+From d90ac19aa6118c6bde2963bc11bc0ee73a11c673 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 6f98144..ecb3b54 100644
+index 19ec305..9161af9 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
+@@ -29,6 +29,16 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
index 6ed8760f4c..3eebe99a60 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.47.1


--===============4463699386844070635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.14.6-2.15.0.patch"

RnJvbSA3OGFjODJjN2ViZWQ4YzU2NmQ4YWFjOWMzMTc0ODY4MWM0YzMwNjBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODoyNDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xNC42IC0+IDIuMTUuMAoKLS0tCiAuLi5ha2UtRml4LWluc3RhbGxh
dGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoIHwgMTIgKysrKysrLS0tLS0tCiBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoIHwgIDQgKyst
LQogbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaCB8
ICA2ICsrKy0tLQogLi4uL2xpYnhtbC97bGlieG1sMl8yLjE0LjYuYmIgPT4gbGlieG1sMl8yLjE1
LjAuYmJ9ICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC97bGlieG1sMl8yLjE0
LjYuYmIgPT4gbGlieG1sMl8yLjE1LjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlv
bi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1s
L2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlvbi1kaXJlY3Rvcmllcy1p
bi1saWJ4bWwyLnBhdGNoCmluZGV4IDYyN2Y4NDcyYzMuLmM5ZjIzZTQzNDAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1p
bnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9u
LWRpcmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFhN2Ux
NzdhNzMxNWM4NTZhMmYwZTNjMmExN2VlMGZkOWUyOTdiYzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGRhZWY4MjEwMzE0ZjcwNjJlMjFkNzQ2NmMwNjVlNzlhM2NhMjYwODQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVu
cy5jb20+CiBEYXRlOiBNb24sIDI2IE1heSAyMDI1IDIxOjExOjE0ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFJldmVydCAiY21ha2U6IEZpeCBpbnN0YWxsYXRpb24gZGlyZWN0b3JpZXMgaW4KQEAg
LTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29A
c2llbWVucy5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRl
eCBhYWEwMmUzLi5mYjI0MWJiIDEwMDY0NAoraW5kZXggNGViNjI5Yi4uMTUwZTA2ZSAxMDA2NDQK
IC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTA2NSwxNyArMTA2
NSw2IEBAIEFDX1NVQlNUKFhNTF9QUklWQVRFX0xJQlMpCitAQCAtMTAwNiwxNyArMTAwNiw2IEBA
IEFDX1NVQlNUKFhNTF9QUklWQVRFX0xJQlMpCiAgQUNfU1VCU1QoWE1MX1BSSVZBVEVfQ0ZMQUdT
KQogIEFDX1NVQlNUKFhNTF9JTkNMVURFRElSKQogIApAQCAtMzcsNyArMzcsNyBAQCBpbmRleCBh
YWEwMmUzLi5mYjI0MWJiIDEwMDY0NAogIEFDX0RFRklORV9VTlFVT1RFRChbWE1MX1NZU0NPTkZE
SVJdLCBbIiRYTUxfU1lTQ09ORkRJUiJdLAogICAgICAgICAgICAgICAgICAgICBbU3lzdGVtIGNv
bmZpZ3VyYXRpb24gZGlyZWN0b3J5ICgvZXRjKV0pCiBkaWZmIC0tZ2l0IGEvbGlieG1sMi1jb25m
aWcuY21ha2UuaW4gYi9saWJ4bWwyLWNvbmZpZy5jbWFrZS5pbgotaW5kZXggZTA0MGE3NS4uZGMw
ZDZiOCAxMDA2NDQKK2luZGV4IGZmNjQzM2YuLmI3NzVjZmUgMTAwNjQ0CiAtLS0gYS9saWJ4bWwy
LWNvbmZpZy5jbWFrZS5pbgogKysrIGIvbGlieG1sMi1jb25maWcuY21ha2UuaW4KIEBAIC0yNCwx
NyArMjQsMjAgQEAKQEAgLTY2LDEwICs2NiwxMCBAQCBpbmRleCBlMDQwYTc1Li5kYzBkNmI4IDEw
MDY0NAogIHNldChMSUJYTUwyX0xJQlJBUklFUyAke0xJQlhNTDJfTElCUkFSWX0pCiAgc2V0KExJ
QlhNTDJfSU5DTFVERV9ESVJTICR7TElCWE1MMl9JTkNMVURFX0RJUn0pCiBkaWZmIC0tZ2l0IGEv
bWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggOThiYzZlMy4uM2VmMGJkMCAxMDA2NDQK
K2luZGV4IDMxYzczYjYuLjg3Mjg4NTIgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIv
bWVzb24uYnVpbGQKLUBAIC01OTksOSArNTk5LDYgQEAgY29uZmlnX2NtYWtlID0gY29uZmlndXJh
dGlvbl9kYXRhKCkKK0BAIC01NzcsOSArNTc3LDYgQEAgY29uZmlnX2NtYWtlID0gY29uZmlndXJh
dGlvbl9kYXRhKCkKICBjb25maWdfY21ha2Uuc2V0KCdMSUJYTUxfTUFKT1JfVkVSU0lPTicsIHZf
bWFqKQogIGNvbmZpZ19jbWFrZS5zZXQoJ0xJQlhNTF9NSU5PUl9WRVJTSU9OJywgdl9taW4pCiAg
Y29uZmlnX2NtYWtlLnNldCgnTElCWE1MX01JQ1JPX1ZFUlNJT04nLCB2X21pYykKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoCmlu
ZGV4IDBiNzNiY2ViMjQuLmU4MzYxNzBiZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMjUtNjAyMS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZTU0NmU0MjNkNjllYzliM2M3MTE2N2QzYzMxNDBmYTFiOWFmOTNjNyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYjEyNTFlYzIyNzg2YWJiZDFhZGFkZGEzYmQzNDlkMjA3ODkwNGJk
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5pY2sgV2VsbG5ob2ZlciA8d2VsbG5o
b2ZlckBhZXZ1bS5kZT4KIERhdGU6IFR1ZSwgMjcgTWF5IDIwMjUgMTI6NTM6MTcgKzAyMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdHJlZTogRml4IGludGVnZXIgb3ZlcmZsb3cgaW4geG1sQnVpbGRRTmFt
ZQpAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYg
LS1naXQgYS90cmVlLmMgYi90cmVlLmMKLWluZGV4IGUxNGJjNjIuLjIyZWMxMWMgMTAwNjQ0Citp
bmRleCBlNGZkMGQ2Li5lMzUzYzFmIDEwMDY0NAogLS0tIGEvdHJlZS5jCiArKysgYi90cmVlLmMK
IEBAIC0yMyw2ICsyMyw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwv
bGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCA0YzFmYWE4M2NiLi45M2RiZDQ1ZTBlIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3Rz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVz
dHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdlOTlmZWY2ZWFlMDY0MmEzZjFlNTExZTRk
MjRhYmY3ZDZkMjhmNTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ5MGFjMTlhYTYx
MThjNmJkZTI5NjNiYzExYmMwZWU3M2ExMWM2NzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1vbiwgNSBEZWMg
MjAyMiAxNzowMjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBhZGQgeW9jdG8tc3BlY2lmaWMg
aW5zdGFsbC1wdGVzdCB0YXJnZXQKQEAgLTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5k
ZXggNmY5ODE0NC4uZWNiM2I1NCAxMDA2NDQKK2luZGV4IDE5ZWMzMDUuLjkxNjFhZjkgMTAwNjQ0
CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KLUBAIC0yNiw2ICsyNiwxNiBA
QCBjaGVja19QUk9HUkFNUyA9IFwKK0BAIC0yOSw2ICsyOSwxNiBAQCBjaGVja19QUk9HUkFNUyA9
IFwKICAJdGVzdHBhcnNlciBcCiAgCXRlc3RyZWN1cnNlCiAgCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE0LjYuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMl8yLjE1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNC42LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE1LjAuYmIKaW5kZXggNmVkODc2MGY0Yy4u
M2VlYmU5OWE2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJf
Mi4xNC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTUuMC5i
YgpAQCAtMjEsNyArMjEsNyBAQCBTUkNfVVJJICs9ICJodHRwOi8vd3d3LnczLm9yZy9YTUwvVGVz
dC94bWx0czIwMTMwOTIzLnRhcjtzdWJkaXI9JHtCUH07bmFtZT10ZXN0dAogICAgICAgICAgICBm
aWxlOi8vQ1ZFLTIwMjUtNjAyMS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiN2NlNDU4YTBhZmZlYjgzZjBiNTVmMWY0ZjllMGU1NTczNWRiZmMx
YTlkZTEyNGVlODZmYjRhNjZiNTk3MjAzYSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjVhYmM3NjY0OTdjNWIxZDZkOTkyMzFmNjYyZTMwYzk5NDAyYTkwZDAzYjA2YzY3YjYyZDZjMTE3
OWRlZGQ1NjEiCiBTUkNfVVJJW3Rlc3R0YXIuc2hhMjU2c3VtXSA9ICJjNmIyZDQyZWU1MGI4YjIz
NmU3MTFhOTdkNjhlNmM0YjVjOGQ4M2U2OWEyYmU0NzIyMzc5ZjA4NzAyZWE3MjczIgogCiBDVkVf
U1RBVFVTW0NWRS0yMDI1LTYxNzBdID0gImZpeGVkLXZlcnNpb246IGZpeGVkIGluIHZlcnNpb24g
Mi4xNC41IgotLSAKMi40Ny4xCgo=

--===============4463699386844070635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-908e31e7128b300c62b86f2c04d108a5a5db291e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:908e31e7128b300c62b86f2c04d108a5a5db291e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 353 Local 301 Mirrors 0 Missed 52 Current 353 (85% match, 92% complete)
Removing 10 stale sstate objects for arch x86-64-v3...done.
Removing 9 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 461 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 570 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_setscene)
NOTE: Running setscene task 610 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 611 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 615 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 666 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-10.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-systemctl-native-257.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 676 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 678 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-systemctl-native-257.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-native-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 820 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_recipe_qa)
NOTE: Running task 824 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: Running task 857 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 912 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 917 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 967 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_recipe_qa)
NOTE: Running task 978 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 983 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: Running task 986 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Running task 994 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 1012 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.15.0-r0: task do_recipe_qa: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: Running task 1014 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.0-r0: task do_recipe_qa: Started
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: Running task 1015 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 1016 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1051 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: Running task 1060 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: Running task 1061 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: Running task 1126 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: Running task 1131 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-native-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1239 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_fetch)
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 1240 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: Running task 1241 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: Running task 1242 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: recipe libxml2-native-2.15.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1243 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_fetch)
NOTE: recipe libxml2-2.15.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: Running task 1244 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: Running task 1245 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.0-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1247 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_unpack)
NOTE: recipe libxml2-2.15.0-r0: task do_unpack: Started
NOTE: Running task 1248 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-native-2.15.0-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 1257 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1263 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_patch)
NOTE: recipe libxml2-native-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 700 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.0-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-native-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1273 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: Running task 1274 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1278 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_populate_lic)
NOTE: recipe libxml2-native-2.15.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1293 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxml2-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1299 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_configure)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.0-r0: task do_configure: Started
NOTE: recipe python3-3.13.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 706 of 706 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1835 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1840 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 1841 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe libxml2-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: Running task 1842 of 1962 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_configure)
NOTE: recipe libxml2-2.15.0-r0: task do_configure: Started
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.0-r0: task do_configure: Failed
NOTE: recipe libxml2-2.15.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1843 tasks of which 1799 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001082433.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001082433.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libxml2-native/2.15.0/temp/log.do_configure.1424763
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxml2/2.15.0/temp/log.do_configure.1425298
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-native-2.15.0-r0 do_configure: QA Issue: libxml2-native: configure was passed unrecognised options: --without-lzma [unknown-configure-option]
ERROR: libxml2-native-2.15.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: libxml2-2.15.0-r0 do_configure: QA Issue: libxml2: configure was passed unrecognised options: --without-lzma [unknown-configure-option]
ERROR: libxml2-2.15.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libxml2-native/2.15.0/temp/log.do_configure.1424763
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_configure) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxml2/2.15.0/temp/log.do_configure.1425298
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.15.0.bb:do_configure) failed with exit code '1'

--===============4463699386844070635==--

