Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48153CEB2FA
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12117.1763224716893409416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ery5I7MW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R97iahGY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a886204a2-58c104cf-0a72-4958-957f-feb153119e91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=neExQRyo/NQEK6HSKsChK1hD6/ySEB4vhW4VSVpDvsw=;
	b=ery5I7MWP4IVL2xny/4vTc7RvXDs7J5nYueW7GIYol8qTJm9HlO9CnTyiAXpXxvy
	TL2WR7hMzpqVTvI1c7ttSpxhzEYJvR00+9H62As9sFjbZXzCuFAh2euN0gysib3BDsk
	duLLAxn7U/1smFUMBgm2a4Meou4RF82GryBpl3i8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=neExQRyo/NQEK6HSKsChK1hD6/ySEB4vhW4VSVpDvsw=;
	b=R97iahGYqAqC/E4lZakoLSFn2FKnGqHKs16yOBjFG4zCOUQwSe9qI4tXCMQFhG8s
	3NIWZGyjs6NRuIbSycp8y0x1TdhmwNu2QLfBQw9eBXYO6gvw9m9xwBC6GUIz+WCCJ7S
	0/O1s/ZXNxwQb3/6CHbq31qMDglvs+pXDsmKkkQs=
Content-Type: multipart/mixed; boundary="===============2253191399512162734=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.15.1 FAILED
Message-ID: <0101019a886204a2-58c104cf-0a72-4958-957f-feb153119e91-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226325

--===============2253191399512162734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxml2* to *2.15.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.14.6-2.15.1.patch
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
From af35535a57575ddb8422dca8cb20f5552629152c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 08:29:34 +0000
Subject: [PATCH] libxml2: upgrade 2.14.6 -> 2.15.1

---
 ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch |  4 ++--
 meta/recipes-core/libxml/libxml2/install-tests.patch |  6 +++---
 .../libxml/{libxml2_2.14.6.bb => libxml2_2.15.1.bb}  |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.1.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 627f8472c3..a7c52e7d91 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
+From d33bc2a0e4a7477ccf2291c240a3ebd43fbd3b19 Mon Sep 17 00:00:00 2001
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
index 0b73bceb24..d7c1194c15 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -1,4 +1,4 @@
-From e546e423d69ec9b3c71167d3c3140fa1b9af93c7 Mon Sep 17 00:00:00 2001
+From c109011d2336d6bc92702ed524570a6fd6c619b0 Mon Sep 17 00:00:00 2001
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
index 4c1faa83cb..8bea1b5358 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
+From ad98e3cc944f5bed164eaac6328e5f1b3fab6ce2 Mon Sep 17 00:00:00 2001
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
  
diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.1.bb
index 6ed8760f4c..8ad700d515 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.47.1


--===============2253191399512162734==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.14.6-2.15.1.patch"

RnJvbSBhZjM1NTM1YTU3NTc1ZGRiODQyMmRjYThjYjIwZjU1NTI2MjkxNTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDg6Mjk6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTQuNiAtPiAyLjE1LjEKCi0tLQogLi4uYWtlLUZpeC1pbnN0YWxs
YXRpb24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaCB8IDEyICsrKysrKy0tLS0tLQogbWV0
YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMjUtNjAyMS5wYXRjaCB8ICA0ICsr
LS0KIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0Y2gg
fCAgNiArKystLS0KIC4uLi9saWJ4bWwve2xpYnhtbDJfMi4xNC42LmJiID0+IGxpYnhtbDJfMi4x
NS4xLmJifSAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwve2xpYnhtbDJfMi4x
NC42LmJiID0+IGxpYnhtbDJfMi4xNS4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1pbnN0YWxsYXRp
b24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnht
bC9saWJ4bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMt
aW4tbGlieG1sMi5wYXRjaAppbmRleCA2MjdmODQ3MmMzLi5hN2M1MmU3ZDkxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgt
aW5zdGFsbGF0aW9uLWRpcmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlv
bi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxYTdl
MTc3YTczMTVjODU2YTJmMGUzYzJhMTdlZTBmZDllMjk3YmM5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBkMzNiYzJhMGU0YTc0NzdjY2YyMjkxYzI0MGEzZWJkNDNmYmQzYjE5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1l
bnMuY29tPgogRGF0ZTogTW9uLCAyNiBNYXkgMjAyNSAyMToxMToxNCArMDIwMAogU3ViamVjdDog
W1BBVENIXSBSZXZlcnQgImNtYWtlOiBGaXggaW5zdGFsbGF0aW9uIGRpcmVjdG9yaWVzIGluCkBA
IC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtv
QHNpZW1lbnMuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5k
ZXggYWFhMDJlMy4uZmIyNDFiYiAxMDA2NDQKK2luZGV4IDRlYjYyOWIuLjE1MGUwNmUgMTAwNjQ0
CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTEwNjUsMTcgKzEw
NjUsNiBAQCBBQ19TVUJTVChYTUxfUFJJVkFURV9MSUJTKQorQEAgLTEwMDYsMTcgKzEwMDYsNiBA
QCBBQ19TVUJTVChYTUxfUFJJVkFURV9MSUJTKQogIEFDX1NVQlNUKFhNTF9QUklWQVRFX0NGTEFH
UykKICBBQ19TVUJTVChYTUxfSU5DTFVERURJUikKICAKQEAgLTM3LDcgKzM3LDcgQEAgaW5kZXgg
YWFhMDJlMy4uZmIyNDFiYiAxMDA2NDQKICBBQ19ERUZJTkVfVU5RVU9URUQoW1hNTF9TWVNDT05G
RElSXSwgWyIkWE1MX1NZU0NPTkZESVIiXSwKICAgICAgICAgICAgICAgICAgICAgW1N5c3RlbSBj
b25maWd1cmF0aW9uIGRpcmVjdG9yeSAoL2V0YyldKQogZGlmZiAtLWdpdCBhL2xpYnhtbDItY29u
ZmlnLmNtYWtlLmluIGIvbGlieG1sMi1jb25maWcuY21ha2UuaW4KLWluZGV4IGUwNDBhNzUuLmRj
MGQ2YjggMTAwNjQ0CitpbmRleCBmZjY0MzNmLi5iNzc1Y2ZlIDEwMDY0NAogLS0tIGEvbGlieG1s
Mi1jb25maWcuY21ha2UuaW4KICsrKyBiL2xpYnhtbDItY29uZmlnLmNtYWtlLmluCiBAQCAtMjQs
MTcgKzI0LDIwIEBACkBAIC02NiwxMCArNjYsMTAgQEAgaW5kZXggZTA0MGE3NS4uZGMwZDZiOCAx
MDA2NDQKICBzZXQoTElCWE1MMl9MSUJSQVJJRVMgJHtMSUJYTUwyX0xJQlJBUll9KQogIHNldChM
SUJYTUwyX0lOQ0xVREVfRElSUyAke0xJQlhNTDJfSU5DTFVERV9ESVJ9KQogZGlmZiAtLWdpdCBh
L21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDk4YmM2ZTMuLjNlZjBiZDAgMTAwNjQ0
CitpbmRleCAzMWM3M2I2Li44NzI4ODUyIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBi
L21lc29uLmJ1aWxkCi1AQCAtNTk5LDkgKzU5OSw2IEBAIGNvbmZpZ19jbWFrZSA9IGNvbmZpZ3Vy
YXRpb25fZGF0YSgpCitAQCAtNTc3LDkgKzU3Nyw2IEBAIGNvbmZpZ19jbWFrZSA9IGNvbmZpZ3Vy
YXRpb25fZGF0YSgpCiAgY29uZmlnX2NtYWtlLnNldCgnTElCWE1MX01BSk9SX1ZFUlNJT04nLCB2
X21haikKICBjb25maWdfY21ha2Uuc2V0KCdMSUJYTUxfTUlOT1JfVkVSU0lPTicsIHZfbWluKQog
IGNvbmZpZ19jbWFrZS5zZXQoJ0xJQlhNTF9NSUNST19WRVJTSU9OJywgdl9taWMpCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMjUtNjAyMS5wYXRjaApp
bmRleCAwYjczYmNlYjI0Li5kN2MxMTk0YzE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNS02MDIxLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhtbC9saWJ4bWwyL0NWRS0yMDI1LTYwMjEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGU1NDZlNDIzZDY5ZWM5YjNjNzExNjdkM2MzMTQwZmExYjlhZjkzYzcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGMxMDkwMTFkMjMzNmQ2YmM5MjcwMmVkNTI0NTcwYTZmZDZjNjE5
YjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBOaWNrIFdlbGxuaG9mZXIgPHdlbGxu
aG9mZXJAYWV2dW0uZGU+CiBEYXRlOiBUdWUsIDI3IE1heSAyMDI1IDEyOjUzOjE3ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRyZWU6IEZpeCBpbnRlZ2VyIG92ZXJmbG93IGluIHhtbEJ1aWxkUU5h
bWUKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZm
IC0tZ2l0IGEvdHJlZS5jIGIvdHJlZS5jCi1pbmRleCBlMTRiYzYyLi4yMmVjMTFjIDEwMDY0NAor
aW5kZXggZTRmZDBkNi4uZTM1M2MxZiAxMDA2NDQKIC0tLSBhL3RyZWUuYwogKysrIGIvdHJlZS5j
CiBAQCAtMjMsNiArMjMsNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1s
L2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9s
aWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0Y2gKaW5kZXggNGMxZmFhODNjYi4uOGJlYTFiNTM1OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRl
c3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZTk5ZmVmNmVhZTA2NDJhM2YxZTUxMWU0
ZDI0YWJmN2Q2ZDI4ZjUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZDk4ZTNjYzk0
NGY1YmVkMTY0ZWFhYzYzMjhlNWYxYjNmYWI2Y2UyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBNb24sIDUgRGVj
IDIwMjIgMTc6MDI6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gYWRkIHlvY3RvLXNwZWNpZmlj
IGluc3RhbGwtcHRlc3QgdGFyZ2V0CkBAIC0xMiwxMCArMTIsMTAgQEAgU2lnbmVkLW9mZi1ieTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWlu
ZGV4IDZmOTgxNDQuLmVjYjNiNTQgMTAwNjQ0CitpbmRleCAxOWVjMzA1Li45MTYxYWY5IDEwMDY0
NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtMjYsNiArMjYsMTYg
QEAgY2hlY2tfUFJPR1JBTVMgPSBcCitAQCAtMjksNiArMjksMTYgQEAgY2hlY2tfUFJPR1JBTVMg
PSBcCiAgCXRlc3RwYXJzZXIgXAogIAl0ZXN0cmVjdXJzZQogIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNC42LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDJfMi4xNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTQuNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNS4xLmJiCmluZGV4IDZlZDg3NjBmNGMu
LjhhZDcwMGQ1MTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwy
XzIuMTQuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE1LjEu
YmIKQEAgLTIxLDcgKzIxLDcgQEAgU1JDX1VSSSArPSAiaHR0cDovL3d3dy53My5vcmcvWE1ML1Rl
c3QveG1sdHMyMDEzMDkyMy50YXI7c3ViZGlyPSR7QlB9O25hbWU9dGVzdHQKICAgICAgICAgICAg
ZmlsZTovL0NWRS0yMDI1LTYwMjEucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbYXJj
aGl2ZS5zaGEyNTZzdW1dID0gIjdjZTQ1OGEwYWZmZWI4M2YwYjU1ZjFmNGY5ZTBlNTU3MzVkYmZj
MWE5ZGUxMjRlZTg2ZmI0YTY2YjU5NzIwM2EiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9
ICJjMDA4YmFjMDhmZDVjN2I0YTg3ZjdiOGE3MWYyODNmYTU4MWQ4MGQ4MGZmOGQyZWZkM2IyNjIy
NGMzOWJjNTRjIgogU1JDX1VSSVt0ZXN0dGFyLnNoYTI1NnN1bV0gPSAiYzZiMmQ0MmVlNTBiOGIy
MzZlNzExYTk3ZDY4ZTZjNGI1YzhkODNlNjlhMmJlNDcyMjM3OWYwODcwMmVhNzI3MyIKIAogQ1ZF
X1NUQVRVU1tDVkUtMjAyNS02MTcwXSA9ICJmaXhlZC12ZXJzaW9uOiBmaXhlZCBpbiB2ZXJzaW9u
IDIuMTQuNSIKLS0gCjIuNDcuMQoK

--===============2253191399512162734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-b47486162e2ed121e26df8a3dd4a5463fe93381f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:b47486162e2ed121e26df8a3dd4a5463fe93381f"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 343 Local 293 Mirrors 0 Missed 50 Current 363 (85% match, 92% complete)
Removing 11 stale sstate objects for arch x86-64-v3...done.
Removing 9 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 476 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 495 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 534 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 540 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_setscene)
NOTE: Running setscene task 564 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 615 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 625 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Started
NOTE: Running setscene task 626 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 669 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 671 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 675 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 687 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 692 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-10.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-native-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 937 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_fetch)
NOTE: Running task 939 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe qemu-native-10.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 980 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: Running task 1039 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 1044 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: Running task 1103 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_fetch)
NOTE: Running task 1114 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 1119 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: Running task 1122 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Running task 1129 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 1149 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running task 1258 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1306 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_unpack)
NOTE: Running task 1307 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1308 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_fetch: Started
NOTE: Running task 1309 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: Running task 1310 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1311 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: Running task 1312 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: Running task 1313 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: Running task 1314 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running task 1315 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_unpack)
NOTE: Running task 1316 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 1326 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: recipe libxml2-native-2.15.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 706 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1333 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe meson-native-1.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1334 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: Running task 1337 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe meson-native-1.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: recipe libxml2-native-2.15.1-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: Running task 1636 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_patch)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 1733 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 705 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1796 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: Running task 1814 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1815 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1817 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1818 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_lic)
NOTE: recipe libxml2-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_lic: Started
NOTE: recipe libxml2-native-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch unihash changed to 72e7a4cde2d37d7d00e09962bd2846d69197a73e68e59dc3ac5230238c7cd001
NOTE: Reported task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx as unihash c252f2e5f5100abee914564ca08c5174b7ba9ce5fb715a65b059e4788724cc66 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '20418092ab41e50af812e22774eabf067dcc444cccf3a7af9b07c88a3103f0c2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c252f2e5f5100abee914564ca08c5174b7ba9ce5fb715a65b059e4788724cc66'})
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx unihash changed 20418092ab41e50af812e22774eabf067dcc444cccf3a7af9b07c88a3103f0c2 -> c252f2e5f5100abee914564ca08c5174b7ba9ce5fb715a65b059e4788724cc66 as wanted
NOTE: Already covered setscene for virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx as unihash db942da9a8adaad2641bb6e80cdb13e2d85aa9559262cfa39d7a72ae6b05db08 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1a09cdfdf1de5776266031f8bca2305259519fa9254aeed187fda499c0a6a9ac', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'db942da9a8adaad2641bb6e80cdb13e2d85aa9559262cfa39d7a72ae6b05db08'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx unihash changed 1a09cdfdf1de5776266031f8bca2305259519fa9254aeed187fda499c0a6a9ac -> db942da9a8adaad2641bb6e80cdb13e2d85aa9559262cfa39d7a72ae6b05db08 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot as unihash 539041259ff6bb087c38c56dad4669bd71d708c1289f16dff4ca510b48b9b69f to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ed1fcf1df348a2fe04b7df4879fc66dced74d912a7dfee0e6ec9aada28993199', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '539041259ff6bb087c38c56dad4669bd71d708c1289f16dff4ca510b48b9b69f'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot unihash changed ed1fcf1df348a2fe04b7df4879fc66dced74d912a7dfee0e6ec9aada28993199 -> 539041259ff6bb087c38c56dad4669bd71d708c1289f16dff4ca510b48b9b69f as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx as unihash fed492eeb4d2ffb80b65f3c2a55e6a6c7a2649c3d4e5c29dadab9b7e1d778d3c to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '72740a2aa120728017d157b022d7d9d569d6c5db19c70bd1df02b7f991d38b97', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'fed492eeb4d2ffb80b65f3c2a55e6a6c7a2649c3d4e5c29dadab9b7e1d778d3c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx unihash changed 72740a2aa120728017d157b022d7d9d569d6c5db19c70bd1df02b7f991d38b97 -> fed492eeb4d2ffb80b65f3c2a55e6a6c7a2649c3d4e5c29dadab9b7e1d778d3c as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_lic unihash changed to abed9e644605de4b5a804a3c7d4b0b0e0e3a9b2ee6a372f858c82ee7f88f09cc
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_deploy_source_date_epoch unihash changed to 0546f4507be13d89537f5875ed2768e77624e6a9a75d37feae30328ad22f4339
NOTE: Running task 1820 of 1962 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure)
NOTE: recipe libxml2-native-2.15.1-r0: task do_configure: Started
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 706 of 706 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1835 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1840 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_collect_spdx_deps)
NOTE: recipe libxml2-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe libxml2-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1842 of 1962 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure)
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_configure: Started
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.15.1-r0: task do_configure: Failed
NOTE: recipe libxml2-2.15.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1843 tasks of which 1801 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115082908.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115082908.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libxml2-native/2.15.1/temp/log.do_configure.3573571
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxml2/2.15.1/temp/log.do_configure.3573837
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-native-2.15.1-r0 do_configure: QA Issue: libxml2-native: configure was passed unrecognised options: --without-lzma [unknown-configure-option]
ERROR: libxml2-native-2.15.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: libxml2-2.15.1-r0 do_configure: QA Issue: libxml2: configure was passed unrecognised options: --without-lzma [unknown-configure-option]
ERROR: libxml2-2.15.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libxml2-native/2.15.1/temp/log.do_configure.3573571
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxml2/2.15.1/temp/log.do_configure.3573837
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_configure) failed with exit code '1'

--===============2253191399512162734==--

