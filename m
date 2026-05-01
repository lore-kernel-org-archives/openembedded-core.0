Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A428CD3431
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15710.1777645532874758684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YHmtmZPi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=is00dwKO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee3d28-42adf2e8-7dab-4422-a76c-e73b9ffc84e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zcCsW7P64mzMasnPs1ZjvR/xw/MfZSt1zzU0iIrJZIk=;
	b=YHmtmZPi9t18xGh3mYQDy7tN0ds8CXdhNlbZ4/8M3H0h2Mvm6i4LjHOUKLCHqp+q
	zifEHpIkMXFYpvJVS4wYVLUCHitzQRUOqhsR38BgnriccwpeEvWJ+WsktKKqE7cE29T
	iXSWDud5cLcMNAVFngYvoA8MZSjBhhSKErwaeFng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zcCsW7P64mzMasnPs1ZjvR/xw/MfZSt1zzU0iIrJZIk=;
	b=is00dwKOkVzwPiAtnFK6ega0I9GIoEgGiTf8uHoTYRvqFwcb4pHhvhnk8ksrqWY2
	nLLBiy20aosh9f/xUiG85FoeMHkhbvsXKn+NyPv4D4jl1MD9wCPJXyP4nmDZlCpzqXo
	lNjnTbQVJc3tf0XKG8w2acBggoR8owgyVlUSf7ZA=
Content-Type: multipart/mixed; boundary="===============8658371049098326452=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.15.3 SUCCEEDED
Message-ID: <0101019de3ee3d28-42adf2e8-7dab-4422-a76c-e73b9ffc84e6-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236217

--===============8658371049098326452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxml2* to *2.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.15.2-2.15.3.patch
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
From 49c940622f1859458ea52c9b47afc8e7a5b8c2c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 07:06:32 +0000
Subject: [PATCH] libxml2: upgrade 2.15.2 -> 2.15.3

---
 ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
 meta/recipes-core/libxml/libxml2/install-tests.patch |  9 +++------
 .../libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb}  |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 627f8472c3..d19b284866 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
+From 803e6f21d3d7ef6399f6ffe58cd28fa6dc7b94e9 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aaa02e3..fb241bb 100644
+index d8dc4e1..633334a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1008,17 +1008,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
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
+index 2cfecb6..f78da31 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -599,9 +599,6 @@ config_cmake = configuration_data()
+@@ -593,9 +593,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 9269536af0..996ade614e 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
+From c6b547e06beb0f0ba99e30d036f055eaed9ec4dc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 19ec305..64bf28a 100644
+index 0a2a729..7ca5bad 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -29,6 +29,14 @@ check_PROGRAMS = \
+@@ -30,6 +30,14 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
@@ -33,6 +33,3 @@ index 19ec305..64bf28a 100644
  bin_PROGRAMS = xmllint
  
  bin_SCRIPTS = xml2-config
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2_2.15.2.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.15.2.bb
rename to meta/recipes-core/libxml/libxml2_2.15.3.bb
index 99560f4b24..5c2896d907 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            "
 
-SRC_URI[archive.sha256sum] = "c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d"
+SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.47.1


--===============8658371049098326452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/test/relaxng/v012-reader-main.rng /usr/lib/libxml2/ptest/test/schemas/v012-reader-schema-main.xsd"
packages/x86-64-v3-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.1.2", added "/usr/lib/libxml2.so.16.1.3"
Changes to packages/x86-64-v3-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so.16.1.2 moved to /usr/lib/libxml2.so.16.1.3
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so.16.1.2 moved to /usr/lib/libxml2.so.16.1.3

--===============8658371049098326452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxml2: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.15/libxml2-2.15.2.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.15.2;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch" to "https://download.gnome.org/sources//libxml2/2.15/libxml2-2.15.3.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.15.3;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch"
packages/x86-64-v3-poky-linux/libxml2: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 4948152 to 4966976 (+0%)
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.16.1.2", added "/usr/lib/.debug/libxml2.so.16.1.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-dev: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-doc: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-locale: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: PKGSIZE changed from 16388498 to 16393176 (+0%)
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/test/relaxng/v012-reader-main.rng /usr/lib/libxml2/ptest/test/schemas/v012-reader-schema-main.xsd"
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 5491807 to 5508271 (+0%)
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: FILELIST: directory renamed /usr/src/debug/libxml2/2.15.2/include/private -> /usr/src/debug/libxml2/2.15.3/include/private, directory renamed /usr/src/debug/libxml2/2.15.2/include/libxml -> /usr/src/debug/libxml2/2.15.3/include/libxml, directory renamed /usr/src/debug/libxml2/2.15.2 -> /usr/src/debug/libxml2/2.15.3, directory renamed /usr/src/debug/libxml2/2.15.2/codegen -> /usr/src/debug/libxml2/2.15.3/codegen
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-utils: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.1.2", added "/usr/lib/libxml2.so.16.1.3"
packages/x86-64-v3-poky-linux/libxml2/libxml2: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
Changes to packages/x86-64-v3-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so.16.1.2 moved to /usr/lib/libxml2.so.16.1.3
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.2 to libxml2.so.16.1.3
  /usr/lib/libxml2.so.16.1.2 moved to /usr/lib/libxml2.so.16.1.3

--===============8658371049098326452==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.15.2-2.15.3.patch"

RnJvbSA0OWM5NDA2MjJmMTg1OTQ1OGVhNTJjOWI0N2FmYzhlN2E1YjhjMmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNzowNjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xNS4yIC0+IDIuMTUuMwoKLS0tCiAuLi5ha2UtRml4LWluc3RhbGxh
dGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoIHwgMTIgKysrKysrLS0tLS0tCiBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoIHwgIDkgKysr
LS0tLS0tCiAuLi4vbGlieG1sL3tsaWJ4bWwyXzIuMTUuMi5iYiA9PiBsaWJ4bWwyXzIuMTUuMy5i
Yn0gIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL3tsaWJ4bWwyXzIuMTUuMi5i
YiA9PiBsaWJ4bWwyXzIuMTUuMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9uLWRp
cmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGli
eG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFsbGF0aW9uLWRpcmVjdG9yaWVzLWluLWxp
YnhtbDIucGF0Y2gKaW5kZXggNjI3Zjg0NzJjMy4uZDE5YjI4NDg2NiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvMDAwMS1SZXZlcnQtY21ha2UtRml4LWluc3Rh
bGxhdGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2xpYnhtbC9saWJ4bWwyLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1pbnN0YWxsYXRpb24tZGly
ZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWE3ZTE3N2E3
MzE1Yzg1NmEyZjBlM2MyYTE3ZWUwZmQ5ZTI5N2JjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gODAzZTZmMjFkM2Q3ZWY2Mzk5ZjZmZmU1OGNkMjhmYTZkYzdiOTRlOSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNv
bT4KIERhdGU6IE1vbiwgMjYgTWF5IDIwMjUgMjE6MTE6MTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gUmV2ZXJ0ICJjbWFrZTogRml4IGluc3RhbGxhdGlvbiBkaXJlY3RvcmllcyBpbgpAQCAtMTUs
MTAgKzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVt
ZW5zLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGFh
YTAyZTMuLmZiMjQxYmIgMTAwNjQ0CitpbmRleCBkOGRjNGUxLi42MzMzMzRhIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0xMDY1LDE3ICsxMDY1LDYg
QEAgQUNfU1VCU1QoWE1MX1BSSVZBVEVfTElCUykKK0BAIC0xMDA4LDE3ICsxMDA4LDYgQEAgQUNf
U1VCU1QoWE1MX1BSSVZBVEVfTElCUykKICBBQ19TVUJTVChYTUxfUFJJVkFURV9DRkxBR1MpCiAg
QUNfU1VCU1QoWE1MX0lOQ0xVREVESVIpCiAgCkBAIC0zNyw3ICszNyw3IEBAIGluZGV4IGFhYTAy
ZTMuLmZiMjQxYmIgMTAwNjQ0CiAgQUNfREVGSU5FX1VOUVVPVEVEKFtYTUxfU1lTQ09ORkRJUl0s
IFsiJFhNTF9TWVNDT05GRElSIl0sCiAgICAgICAgICAgICAgICAgICAgIFtTeXN0ZW0gY29uZmln
dXJhdGlvbiBkaXJlY3RvcnkgKC9ldGMpXSkKIGRpZmYgLS1naXQgYS9saWJ4bWwyLWNvbmZpZy5j
bWFrZS5pbiBiL2xpYnhtbDItY29uZmlnLmNtYWtlLmluCi1pbmRleCBlMDQwYTc1Li5kYzBkNmI4
IDEwMDY0NAoraW5kZXggZmY2NDMzZi4uYjc3NWNmZSAxMDA2NDQKIC0tLSBhL2xpYnhtbDItY29u
ZmlnLmNtYWtlLmluCiArKysgYi9saWJ4bWwyLWNvbmZpZy5jbWFrZS5pbgogQEAgLTI0LDE3ICsy
NCwyMCBAQApAQCAtNjYsMTAgKzY2LDEwIEBAIGluZGV4IGUwNDBhNzUuLmRjMGQ2YjggMTAwNjQ0
CiAgc2V0KExJQlhNTDJfTElCUkFSSUVTICR7TElCWE1MMl9MSUJSQVJZfSkKICBzZXQoTElCWE1M
Ml9JTkNMVURFX0RJUlMgJHtMSUJYTUwyX0lOQ0xVREVfRElSfSkKIGRpZmYgLS1naXQgYS9tZXNv
bi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCA5OGJjNmUzLi4zZWYwYmQwIDEwMDY0NAoraW5k
ZXggMmNmZWNiNi4uZjc4ZGEzMSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNv
bi5idWlsZAotQEAgLTU5OSw5ICs1OTksNiBAQCBjb25maWdfY21ha2UgPSBjb25maWd1cmF0aW9u
X2RhdGEoKQorQEAgLTU5Myw5ICs1OTMsNiBAQCBjb25maWdfY21ha2UgPSBjb25maWd1cmF0aW9u
X2RhdGEoKQogIGNvbmZpZ19jbWFrZS5zZXQoJ0xJQlhNTF9NQUpPUl9WRVJTSU9OJywgdl9tYWop
CiAgY29uZmlnX2NtYWtlLnNldCgnTElCWE1MX01JTk9SX1ZFUlNJT04nLCB2X21pbikKICBjb25m
aWdfY21ha2Uuc2V0KCdMSUJYTUxfTUlDUk9fVkVSU0lPTicsIHZfbWljKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVzdHMucGF0Y2gKaW5kZXgg
OTI2OTUzNmFmMC4uOTk2YWRlNjE0ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGli
eG1sL2xpYnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAz
MzgxMjMyYmFiNzIxN2I5Y2I0N2U3Y2M3NjVjODM4MDE5MjA2OWIwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBjNmI1NDdlMDZiZWIwZjBiYTk5ZTMwZDAzNmYwNTVlYWVkOWVjNGRjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+CiBEYXRlOiBGcmksIDE3IE9jdCAyMDI1IDE0OjE1OjM2ICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGFkZCB5b2N0by1zcGVjaWZpYyBpbnN0YWxsLXB0ZXN0IHRhcmdldApAQCAtMTUsMTAg
KzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9N
YWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCAxOWVjMzA1Li42NGJmMjhhIDEwMDY0NAor
aW5kZXggMGEyYTcyOS4uN2NhNWJhZCAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9N
YWtlZmlsZS5hbQotQEAgLTI5LDYgKzI5LDE0IEBAIGNoZWNrX1BST0dSQU1TID0gXAorQEAgLTMw
LDYgKzMwLDE0IEBAIGNoZWNrX1BST0dSQU1TID0gXAogIAl0ZXN0cGFyc2VyIFwKICAJdGVzdHJl
Y3Vyc2UKICAKQEAgLTMzLDYgKzMzLDMgQEAgaW5kZXggMTllYzMwNS4uNjRiZjI4YSAxMDA2NDQK
ICBiaW5fUFJPR1JBTVMgPSB4bWxsaW50CiAgCiAgYmluX1NDUklQVFMgPSB4bWwyLWNvbmZpZwot
LS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bDJfMi4xNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNS4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnht
bC9saWJ4bWwyXzIuMTUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDJfMi4xNS4zLmJiCmluZGV4IDk5NTYwZjRiMjQuLjVjMjg5NmQ5MDcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTUuMi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjE1LjMuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JD
X1VSSSArPSAiaHR0cDovL3d3dy53My5vcmcvWE1ML1Rlc3QveG1sdHMyMDEzMDkyMy50YXI7c3Vi
ZGlyPSR7QlB9O25hbWU9dGVzdHQKICAgICAgICAgICAgZmlsZTovLzAwMDEtUmV2ZXJ0LWNtYWtl
LUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYzhiOWJjODFmOGI1OTBjMzNh
ZjhjYzZjMzM2ZGJmZjJmNTM0MDk5NzM1ODhhMzUxYzk1ZjFjNjIxYjEzZDA5ZCIKK1NSQ19VUklb
YXJjaGl2ZS5zaGEyNTZzdW1dID0gIjc4MjYyYTZlN2FjMTcwZDY1MjhlYmZlMmVmY2NkZjIyMDE5
MWE1YWY2YTZjZDYxZWE0YTlhOWE1MDQyYzdhMDciCiBTUkNfVVJJW3Rlc3R0YXIuc2hhMjU2c3Vt
XSA9ICJjNmIyZDQyZWU1MGI4YjIzNmU3MTFhOTdkNjhlNmM0YjVjOGQ4M2U2OWEyYmU0NzIyMzc5
ZjA4NzAyZWE3MjczIgogCiBDVkVfU1RBVFVTW0NWRS0yMDI1LTYxNzBdID0gImZpeGVkLXZlcnNp
b246IGZpeGVkIGluIHZlcnNpb24gMi4xNC41IgotLSAKMi40Ny4xCgo=

--===============8658371049098326452==--

