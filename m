Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF2AC624D6
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3415.1788589712312415955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jJdmWWpO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eNpbo0xh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a07041205e-ed1d54df-bcb3-4335-988f-691221f198e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6iPSOy6XQ1zGvEbakofPNZzYs/UzTzsPyFe2A6eglO0=;
	b=jJdmWWpOowY/2YjniWIIQPOSgNIt+HV9sS7lrtWsmedkdMXjSYF+KmjoiVA4QVIH
	07BzjGMagNuZiCLcFDANMog/RRaY14Jmt6c827UcsYagD8737BxfRdBFHUqrVri5vOu
	9pUrWU0nI/WWu2bQFMraJPz5qkBnjcJ35vAd4JLM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6iPSOy6XQ1zGvEbakofPNZzYs/UzTzsPyFe2A6eglO0=;
	b=eNpbo0xhxBoSf3uLw/Evdd0bg4DmOnfLCG+qdujNp4VkO0cesZemc9vUwQLNhDdz
	RiN3wgT/G3KVmSkhOhjoGU1PsXcb4m2jDNBmRmFWx8Jr4ibiDcsf4Ulf78xj2K10Oiz
	nhwmQLYDu+R2WBPFgz2nfaiV6vhEjvglDCgUYmes=
Content-Type: multipart/mixed; boundary="===============6381990093743007256=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.15.4 SUCCEEDED
Message-ID: <010101a07041205e-ed1d54df-bcb3-4335-988f-691221f198e5-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245132

--===============6381990093743007256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxml2* to *2.15.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxml2-upgrade-2.15.3-2.15.4.patch
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
From a09ca2ffaba825830a3dbca8f0a01f24535474cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 5 Sep 2026 05:20:55 +0000
Subject: [PATCH] libxml2: upgrade 2.15.3 -> 2.15.4

Source: NEWS

v2.15.4: Sep 01 2026

### Security

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and xmlXIncludeProcessTree

### Improvements

- Improve bound checks for xmlcatalog and xmllint arguments (out-of-bound)
- Fix memory leak in static Windows library (memory-leak)
- xmlreader: Copy DTD in xmlTextReaderDumpCopy
- parser: Fix double free in xmlIOParseDTD (double-free)
- parser: fix division-by-zero when maxAmpl is set to 0
- parser: Fix memory leak in xmlCtxtSetSaxHandler (memory-leak)
- catalog: Make sure to reset catalog resolve cache
- xmlAddChild: unlink node before free for text nodes (memory-leak)
- Normalize entity values in attr in xmlNodeGetContent
- Handle whitespace for date/time/duration types
- catalog: Fix NULL deref for nextCatalog without 'catalog' attribute (null-deref)

### Thanks

Thanks to the following new contributors:

- Brett Kail
- Ion Nistor
- Kevin Braun
- Mohammad Seet
- rootvector2
- Ruben Thijssen
- yirou_yang
- Zhihan Zheng
- zhuofeng

### Full list of commits and contributors on this release

13  Daniel Garcia Moreno
 8  Mohammad Seet
 6  zhuofeng
 2  Benjamin Gilbert
 1  Brett Kail
 1  Hieu Le Minh
 1  Ion Nistor
 1  Kevin Braun
 1  Nick Wellnhofer
 1  Ruben Thijssen
 1  Zhihan Zheng
 1  rootvector2
 1  yirou_yang
---
 ...-installation-directories-in-libxml2.patch |  6 +-
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 -------------------
 .../libxml/libxml2/install-tests.patch        |  2 +-
 .../{libxml2_2.15.3.bb => libxml2_2.15.4.bb}  |  3 +-
 4 files changed, 5 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.3.bb => libxml2_2.15.4.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index d19b284866..a1d24b596e 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 803e6f21d3d7ef6399f6ffe58cd28fa6dc7b94e9 Mon Sep 17 00:00:00 2001
+From aa31b72c260de3f15289db8d78c9674b0cf55f7f Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -66,10 +66,10 @@ index ff6433f..b775cfe 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 2cfecb6..f78da31 100644
+index f8337ea..19fdbb0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -593,9 +593,6 @@ config_cmake = configuration_data()
+@@ -594,9 +594,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
deleted file mode 100644
index a14e566681..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 22 May 2026 12:21:20 +0200
-Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
-
-CVE: CVE-2026-11979
-Signed-off-by: Anton Skorup <anton.skorup@axis.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
----
- test/catalogs/test.sh | 11 +++++++++++
- xmlcatalog.c          | 16 ++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
-index 7e5eaa76..84e8b90a 100755
---- a/test/catalogs/test.sh
-+++ b/test/catalogs/test.sh
-@@ -10,6 +10,17 @@ fi
- 
- exitcode=0
- 
-+# Test xmlcatalog --shell command line
-+# Case 1: Really long argument (470 chars)
-+input=""; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 2: public + long argument
-+input="public "; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 3: public + lots of args
-+input="public "; for i in {1..80}; do input="${input} x"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+
- for i in test/catalogs/*.script ; do
-     name=$(basename $i .script)
-     xml="./test/catalogs/$name.xml"
-diff --git a/xmlcatalog.c b/xmlcatalog.c
-index b400c7cb..5113e930 100644
---- a/xmlcatalog.c
-+++ b/xmlcatalog.c
-@@ -135,6 +135,12 @@ static void usershell(void) {
- 	       (*cur != '\n') && (*cur != '\r')) {
- 	    if (*cur == 0)
- 		break;
-+            /* Do not read beyond the command array capacity */
-+            if (i >= (int)sizeof(command) - 2) {
-+                printf("Invalid command %s\n", cur);
-+                i = 0;
-+                break;
-+            }
- 	    command[i++] = *cur++;
- 	}
- 	command[i] = 0;
-@@ -152,6 +158,11 @@ static void usershell(void) {
- 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
- 	    if (*cur == 0)
- 		break;
-+            if (i >= (int)sizeof(arg) - 2) {
-+                printf("Invalid arg %s\n", arg);
-+                i = 0;
-+                break;
-+            }
- 	    arg[i++] = *cur++;
- 	}
- 	arg[i] = 0;
-@@ -164,6 +175,11 @@ static void usershell(void) {
- 	cur = arg;
- 	memset(argv, 0, sizeof(argv));
- 	while (*cur != 0) {
-+            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
-+                printf("Too much arguments\n");
-+                break;
-+            }
-+
- 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
- 	    if (*cur == '\'') {
- 		cur++;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 996ade614e..55559b7df3 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From c6b547e06beb0f0ba99e30d036f055eaed9ec4dc Mon Sep 17 00:00:00 2001
+From 11159757ae9ff484e02764b36cef970b3d0178c2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.4.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.15.3.bb
rename to meta/recipes-core/libxml/libxml2_2.15.4.bb
index 8b0ba29412..99f3b9675a 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.4.bb
@@ -18,10 +18,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
+SRC_URI[archive.sha256sum] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.47.1


--===============6381990093743007256==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxml2-upgrade-2.15.3-2.15.4.patch"

RnJvbSBhMDljYTJmZmFiYTgyNTgzMGEzZGJjYThmMGEwMWYyNDUzNTQ3NGNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNSBTZXAgMjAyNiAwNToyMDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhtbDI6IHVwZ3JhZGUgMi4xNS4zIC0+IDIuMTUuNAoKU291cmNlOiBORVdTCgp2Mi4xNS40OiBT
ZXAgMDEgMjAyNgoKIyMjIFNlY3VyaXR5CgotIHhtbHJlZ2V4cDogUHJldmVudCBvdXQtb2YtYm91
bmRzIHJlYWQgaW4gTlhUIG1hY3JvCi0gZml4OiBhZGQgbWlzc2luZyBvdmVyZmxvdyBjaGVja3Mg
aW4gZGljdC5jLCB1cmkuYywgYW5kIHZhbGlkLmMKLSB4bWxyZWdleHA6IENhbGMgc3RyaW5nIGxl
bmd0aCBhZnRlciBudWxsIGNoZWNraW5nCi0geHBvaW50ZXI6IENoZWNrIG92ZXJmbG93IGluIHht
bFhQdHJFdmFsWFB0clBhcnQKLSB4bWxJTzogQ2hlY2sgZm9yIGludCBvdmVyZmxvdyBiZWZvcmUg
Y2FsbGluZyB3cml0ZWNhbGxiYWNrCi0gZml4KHhpbmNsdWRlKTogcHJvcGFnYXRlIHBhcnNlRmxh
Z3MgaW4geG1sWEluY2x1ZGVQcm9jZXNzIGFuZCB4bWxYSW5jbHVkZVByb2Nlc3NUcmVlCgojIyMg
SW1wcm92ZW1lbnRzCgotIEltcHJvdmUgYm91bmQgY2hlY2tzIGZvciB4bWxjYXRhbG9nIGFuZCB4
bWxsaW50IGFyZ3VtZW50cyAob3V0LW9mLWJvdW5kKQotIEZpeCBtZW1vcnkgbGVhayBpbiBzdGF0
aWMgV2luZG93cyBsaWJyYXJ5IChtZW1vcnktbGVhaykKLSB4bWxyZWFkZXI6IENvcHkgRFREIGlu
IHhtbFRleHRSZWFkZXJEdW1wQ29weQotIHBhcnNlcjogRml4IGRvdWJsZSBmcmVlIGluIHhtbElP
UGFyc2VEVEQgKGRvdWJsZS1mcmVlKQotIHBhcnNlcjogZml4IGRpdmlzaW9uLWJ5LXplcm8gd2hl
biBtYXhBbXBsIGlzIHNldCB0byAwCi0gcGFyc2VyOiBGaXggbWVtb3J5IGxlYWsgaW4geG1sQ3R4
dFNldFNheEhhbmRsZXIgKG1lbW9yeS1sZWFrKQotIGNhdGFsb2c6IE1ha2Ugc3VyZSB0byByZXNl
dCBjYXRhbG9nIHJlc29sdmUgY2FjaGUKLSB4bWxBZGRDaGlsZDogdW5saW5rIG5vZGUgYmVmb3Jl
IGZyZWUgZm9yIHRleHQgbm9kZXMgKG1lbW9yeS1sZWFrKQotIE5vcm1hbGl6ZSBlbnRpdHkgdmFs
dWVzIGluIGF0dHIgaW4geG1sTm9kZUdldENvbnRlbnQKLSBIYW5kbGUgd2hpdGVzcGFjZSBmb3Ig
ZGF0ZS90aW1lL2R1cmF0aW9uIHR5cGVzCi0gY2F0YWxvZzogRml4IE5VTEwgZGVyZWYgZm9yIG5l
eHRDYXRhbG9nIHdpdGhvdXQgJ2NhdGFsb2cnIGF0dHJpYnV0ZSAobnVsbC1kZXJlZikKCiMjIyBU
aGFua3MKClRoYW5rcyB0byB0aGUgZm9sbG93aW5nIG5ldyBjb250cmlidXRvcnM6CgotIEJyZXR0
IEthaWwKLSBJb24gTmlzdG9yCi0gS2V2aW4gQnJhdW4KLSBNb2hhbW1hZCBTZWV0Ci0gcm9vdHZl
Y3RvcjIKLSBSdWJlbiBUaGlqc3NlbgotIHlpcm91X3lhbmcKLSBaaGloYW4gWmhlbmcKLSB6aHVv
ZmVuZwoKIyMjIEZ1bGwgbGlzdCBvZiBjb21taXRzIGFuZCBjb250cmlidXRvcnMgb24gdGhpcyBy
ZWxlYXNlCgoxMyAgRGFuaWVsIEdhcmNpYSBNb3Jlbm8KIDggIE1vaGFtbWFkIFNlZXQKIDYgIHpo
dW9mZW5nCiAyICBCZW5qYW1pbiBHaWxiZXJ0CiAxICBCcmV0dCBLYWlsCiAxICBIaWV1IExlIE1p
bmgKIDEgIElvbiBOaXN0b3IKIDEgIEtldmluIEJyYXVuCiAxICBOaWNrIFdlbGxuaG9mZXIKIDEg
IFJ1YmVuIFRoaWpzc2VuCiAxICBaaGloYW4gWmhlbmcKIDEgIHJvb3R2ZWN0b3IyCiAxICB5aXJv
dV95YW5nCi0tLQogLi4uLWluc3RhbGxhdGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBhdGNo
IHwgIDYgKy0KIC4uLi9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNi0xMTk3OS5wYXRjaCAgICAgICB8
IDgxIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3Rz
LnBhdGNoICAgICAgICB8ICAyICstCiAuLi4ve2xpYnhtbDJfMi4xNS4zLmJiID0+IGxpYnhtbDJf
Mi4xNS40LmJifSAgfCAgMyArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDg3
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2xpYnht
bC9saWJ4bWwyL0NWRS0yMDI2LTExOTc5LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL3tsaWJ4bWwyXzIuMTUuMy5iYiA9PiBsaWJ4bWwyXzIuMTUuNC5iYn0gKDk2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1j
bWFrZS1GaXgtaW5zdGFsbGF0aW9uLWRpcmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi8wMDAxLVJldmVydC1jbWFrZS1GaXgtaW5zdGFs
bGF0aW9uLWRpcmVjdG9yaWVzLWluLWxpYnhtbDIucGF0Y2gKaW5kZXggZDE5YjI4NDg2Ni4uYTFk
MjRiNTk2ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvMDAw
MS1SZXZlcnQtY21ha2UtRml4LWluc3RhbGxhdGlvbi1kaXJlY3Rvcmllcy1pbi1saWJ4bWwyLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyLzAwMDEtUmV2ZXJ0LWNt
YWtlLUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4tbGlieG1sMi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gODAzZTZmMjFkM2Q3ZWY2Mzk5ZjZmZmU1OGNkMjhmYTZkYzdiOTRlOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWEzMWI3MmMyNjBkZTNmMTUyODlkYjhkNzhj
OTY3NGIwY2Y1NWY3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KIERhdGU6IE1vbiwgMjYgTWF5IDIwMjUgMjE6MTE6
MTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJjbWFrZTogRml4IGluc3RhbGxhdGlv
biBkaXJlY3RvcmllcyBpbgpAQCAtNjYsMTAgKzY2LDEwIEBAIGluZGV4IGZmNjQzM2YuLmI3NzVj
ZmUgMTAwNjQ0CiAgc2V0KExJQlhNTDJfTElCUkFSSUVTICR7TElCWE1MMl9MSUJSQVJZfSkKICBz
ZXQoTElCWE1MMl9JTkNMVURFX0RJUlMgJHtMSUJYTUwyX0lOQ0xVREVfRElSfSkKIGRpZmYgLS1n
aXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAyY2ZlY2I2Li5mNzhkYTMxIDEw
MDY0NAoraW5kZXggZjgzMzdlYS4uMTlmZGJiMCAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiAr
KysgYi9tZXNvbi5idWlsZAotQEAgLTU5Myw5ICs1OTMsNiBAQCBjb25maWdfY21ha2UgPSBjb25m
aWd1cmF0aW9uX2RhdGEoKQorQEAgLTU5NCw5ICs1OTQsNiBAQCBjb25maWdfY21ha2UgPSBjb25m
aWd1cmF0aW9uX2RhdGEoKQogIGNvbmZpZ19jbWFrZS5zZXQoJ0xJQlhNTF9NQUpPUl9WRVJTSU9O
Jywgdl9tYWopCiAgY29uZmlnX2NtYWtlLnNldCgnTElCWE1MX01JTk9SX1ZFUlNJT04nLCB2X21p
bikKICBjb25maWdfY21ha2Uuc2V0KCdMSUJYTUxfTUlDUk9fVkVSU0lPTicsIHZfbWljKQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMjYtMTE5Nzku
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNi0xMTk3OS5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTE0ZTU2NjY4MS4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9DVkUtMjAyNi0xMTk3OS5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDgxICswLDAgQEAKLUZyb20gZGZhZDA2NjBmN2RhYjNi
NWY4MzE3YjcwM2IxNmFkMGIwZDEyNjk3ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IERhbmllbCBHYXJjaWEgTW9yZW5vIDxkYW5pZWwuZ2FyY2lhQHN1c2UuY29tPgotRGF0ZTogRnJp
LCAyMiBNYXkgMjAyNiAxMjoyMToyMCArMDIwMAotU3ViamVjdDogW1BBVENIXSB4bWxjYXRhbG9n
OiBvdmVyZmxvdyBjaGVjayBmb3IgbGFyZ2UgLS1zaGVsbCBjb21tYW5kcwotCi1GaXggaHR0cHM6
Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIvLS93b3JrX2l0ZW1zLzExMjQKLQotQ1ZF
OiBDVkUtMjAyNi0xMTk3OQotU2lnbmVkLW9mZi1ieTogQW50b24gU2tvcnVwIDxhbnRvbi5za29y
dXBAYXhpcy5jb20+Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5n
bm9tZS5vcmcvR05PTUUvbGlieG1sMi8tL2NvbW1pdC9jMmUyMzNmYzFiMzQxNjg1ZmM5OTYyMWIy
NzY4YjUwM2Y3NzdhNzJlXQotLS0tCi0gdGVzdC9jYXRhbG9ncy90ZXN0LnNoIHwgMTEgKysrKysr
KysrKysKLSB4bWxjYXRhbG9nLmMgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCi0gMiBm
aWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS90ZXN0L2NhdGFs
b2dzL3Rlc3Quc2ggYi90ZXN0L2NhdGFsb2dzL3Rlc3Quc2gKLWluZGV4IDdlNWVhYTc2Li44NGU4
YjkwYSAxMDA3NTUKLS0tLSBhL3Rlc3QvY2F0YWxvZ3MvdGVzdC5zaAotKysrIGIvdGVzdC9jYXRh
bG9ncy90ZXN0LnNoCi1AQCAtMTAsNiArMTAsMTcgQEAgZmkKLSAKLSBleGl0Y29kZT0wCi0gCi0r
IyBUZXN0IHhtbGNhdGFsb2cgLS1zaGVsbCBjb21tYW5kIGxpbmUKLSsjIENhc2UgMTogUmVhbGx5
IGxvbmcgYXJndW1lbnQgKDQ3MCBjaGFycykKLStpbnB1dD0iIjsgZm9yIGkgaW4gezEuLjQ3MH07
IGRvIGlucHV0PSIke2lucHV0fUEiOyBkb25lCi0rZWNobyAkaW5wdXQgfCAkeG1sY2F0YWxvZyAt
LXNoZWxsIHRlc3QvY2F0YWxvZ3MvZG9ja2Jvb2sueG1sIHx8IGV4aXQgMQotKyMgQ2FzZSAyOiBw
dWJsaWMgKyBsb25nIGFyZ3VtZW50Ci0raW5wdXQ9InB1YmxpYyAiOyBmb3IgaSBpbiB7MS4uNDcw
fTsgZG8gaW5wdXQ9IiR7aW5wdXR9QSI7IGRvbmUKLStlY2hvICRpbnB1dCB8ICR4bWxjYXRhbG9n
IC0tc2hlbGwgdGVzdC9jYXRhbG9ncy9kb2NrYm9vay54bWwgfHwgZXhpdCAxCi0rIyBDYXNlIDM6
IHB1YmxpYyArIGxvdHMgb2YgYXJncwotK2lucHV0PSJwdWJsaWMgIjsgZm9yIGkgaW4gezEuLjgw
fTsgZG8gaW5wdXQ9IiR7aW5wdXR9IHgiOyBkb25lCi0rZWNobyAkaW5wdXQgfCAkeG1sY2F0YWxv
ZyAtLXNoZWxsIHRlc3QvY2F0YWxvZ3MvZG9ja2Jvb2sueG1sIHx8IGV4aXQgMQotKwotIGZvciBp
IGluIHRlc3QvY2F0YWxvZ3MvKi5zY3JpcHQgOyBkbwotICAgICBuYW1lPSQoYmFzZW5hbWUgJGkg
LnNjcmlwdCkKLSAgICAgeG1sPSIuL3Rlc3QvY2F0YWxvZ3MvJG5hbWUueG1sIgotZGlmZiAtLWdp
dCBhL3htbGNhdGFsb2cuYyBiL3htbGNhdGFsb2cuYwotaW5kZXggYjQwMGM3Y2IuLjUxMTNlOTMw
IDEwMDY0NAotLS0tIGEveG1sY2F0YWxvZy5jCi0rKysgYi94bWxjYXRhbG9nLmMKLUBAIC0xMzUs
NiArMTM1LDEyIEBAIHN0YXRpYyB2b2lkIHVzZXJzaGVsbCh2b2lkKSB7Ci0gCSAgICAgICAoKmN1
ciAhPSAnXG4nKSAmJiAoKmN1ciAhPSAnXHInKSkgewotIAkgICAgaWYgKCpjdXIgPT0gMCkKLSAJ
CWJyZWFrOwotKyAgICAgICAgICAgIC8qIERvIG5vdCByZWFkIGJleW9uZCB0aGUgY29tbWFuZCBh
cnJheSBjYXBhY2l0eSAqLwotKyAgICAgICAgICAgIGlmIChpID49IChpbnQpc2l6ZW9mKGNvbW1h
bmQpIC0gMikgewotKyAgICAgICAgICAgICAgICBwcmludGYoIkludmFsaWQgY29tbWFuZCAlc1xu
IiwgY3VyKTsKLSsgICAgICAgICAgICAgICAgaSA9IDA7Ci0rICAgICAgICAgICAgICAgIGJyZWFr
OwotKyAgICAgICAgICAgIH0KLSAJICAgIGNvbW1hbmRbaSsrXSA9ICpjdXIrKzsKLSAJfQotIAlj
b21tYW5kW2ldID0gMDsKLUBAIC0xNTIsNiArMTU4LDExIEBAIHN0YXRpYyB2b2lkIHVzZXJzaGVs
bCh2b2lkKSB7Ci0gCXdoaWxlICgoKmN1ciAhPSAnXG4nKSAmJiAoKmN1ciAhPSAnXHInKSAmJiAo
KmN1ciAhPSAwKSkgewotIAkgICAgaWYgKCpjdXIgPT0gMCkKLSAJCWJyZWFrOwotKyAgICAgICAg
ICAgIGlmIChpID49IChpbnQpc2l6ZW9mKGFyZykgLSAyKSB7Ci0rICAgICAgICAgICAgICAgIHBy
aW50ZigiSW52YWxpZCBhcmcgJXNcbiIsIGFyZyk7Ci0rICAgICAgICAgICAgICAgIGkgPSAwOwot
KyAgICAgICAgICAgICAgICBicmVhazsKLSsgICAgICAgICAgICB9Ci0gCSAgICBhcmdbaSsrXSA9
ICpjdXIrKzsKLSAJfQotIAlhcmdbaV0gPSAwOwotQEAgLTE2NCw2ICsxNzUsMTEgQEAgc3RhdGlj
IHZvaWQgdXNlcnNoZWxsKHZvaWQpIHsKLSAJY3VyID0gYXJnOwotIAltZW1zZXQoYXJndiwgMCwg
c2l6ZW9mKGFyZ3YpKTsKLSAJd2hpbGUgKCpjdXIgIT0gMCkgewotKyAgICAgICAgICAgIGlmIChp
ID49IChpbnQpc2l6ZW9mKGFyZ3YpIC8gKGludClzaXplb2YoY2hhciopKSB7Ci0rICAgICAgICAg
ICAgICAgIHByaW50ZigiVG9vIG11Y2ggYXJndW1lbnRzXG4iKTsKLSsgICAgICAgICAgICAgICAg
YnJlYWs7Ci0rICAgICAgICAgICAgfQotKwotIAkgICAgd2hpbGUgKCgqY3VyID09ICcgJykgfHwg
KCpjdXIgPT0gJ1x0JykpIGN1cisrOwotIAkgICAgaWYgKCpjdXIgPT0gJ1wnJykgewotIAkJY3Vy
Kys7Ci0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwv
bGlieG1sMi9pbnN0YWxsLXRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDIvaW5zdGFsbC10ZXN0cy5wYXRjaAppbmRleCA5OTZhZGU2MTRlLi41NTU1OWI3ZGYzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMi9pbnN0YWxsLXRlc3Rz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL2luc3RhbGwtdGVz
dHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM2YjU0N2UwNmJlYjBmMGJhOTllMzBkMDM2
ZjA1NWVhZWQ5ZWM0ZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDExMTU5NzU3YWU5
ZmY0ODRlMDI3NjRiMzZjZWY5NzBiM2QwMTc4YzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMTcgT2N0
IDIwMjUgMTQ6MTU6MzYgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYWRkIHlvY3RvLXNwZWNpZmlj
IGluc3RhbGwtcHRlc3QgdGFyZ2V0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4
bWwvbGlieG1sMl8yLjE1LjMuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8y
LjE1LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
cmUvbGlieG1sL2xpYnhtbDJfMi4xNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMl8yLjE1LjQuYmIKaW5kZXggOGIwYmEyOTQxMi4uOTlmM2I5Njc1YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDJfMi4xNS4zLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuMTUuNC5iYgpAQCAtMTgsMTAgKzE4
LDkgQEAgU1JDX1VSSSArPSAiaHR0cDovL3d3dy53My5vcmcvWE1ML1Rlc3QveG1sdHMyMDEzMDky
My50YXI7c3ViZGlyPSR7QlB9O25hbWU9dGVzdHQKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVz
dCBcCiAgICAgICAgICAgIGZpbGU6Ly9pbnN0YWxsLXRlc3RzLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtUmV2ZXJ0LWNtYWtlLUZpeC1pbnN0YWxsYXRpb24tZGlyZWN0b3JpZXMtaW4t
bGlieG1sMi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi0xMTk3OS5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNzgyNjJhNmU3
YWMxNzBkNjUyOGViZmUyZWZjY2RmMjIwMTkxYTVhZjZhNmNkNjFlYTRhOWE5YTUwNDJjN2EwNyIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjk4MDg3ZmQxODFkOTA3MDcyNGYzZmJjNjVj
NzM3N2RiMDMwMzhlYjkyYmQ4ODIzNzRkYWZmNDQ5NDAxMzg4MjEiCiBTUkNfVVJJW3Rlc3R0YXIu
c2hhMjU2c3VtXSA9ICJjNmIyZDQyZWU1MGI4YjIzNmU3MTFhOTdkNjhlNmM0YjVjOGQ4M2U2OWEy
YmU0NzIyMzc5ZjA4NzAyZWE3MjczIgogCiBDVkVfU1RBVFVTW0NWRS0yMDI1LTYxNzBdID0gImZp
eGVkLXZlcnNpb246IGZpeGVkIGluIHZlcnNpb24gMi4xNC41IgotLSAKMi40Ny4xCgo=

--===============6381990093743007256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxml2-changelog.txt"

Changelog for libxml2: 2.15.3 -> 2.15.4
Source: NEWS

v2.15.4: Sep 01 2026

### Security

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and xmlXIncludeProcessTree

### Improvements

- Improve bound checks for xmlcatalog and xmllint arguments (out-of-bound)
- Fix memory leak in static Windows library (memory-leak)
- xmlreader: Copy DTD in xmlTextReaderDumpCopy
- parser: Fix double free in xmlIOParseDTD (double-free)
- parser: fix division-by-zero when maxAmpl is set to 0
- parser: Fix memory leak in xmlCtxtSetSaxHandler (memory-leak)
- catalog: Make sure to reset catalog resolve cache
- xmlAddChild: unlink node before free for text nodes (memory-leak)
- Normalize entity values in attr in xmlNodeGetContent
- Handle whitespace for date/time/duration types
- catalog: Fix NULL deref for nextCatalog without 'catalog' attribute (null-deref)

### Thanks

Thanks to the following new contributors:

- Brett Kail
- Ion Nistor
- Kevin Braun
- Mohammad Seet
- rootvector2
- Ruben Thijssen
- yirou_yang
- Zhihan Zheng
- zhuofeng

### Full list of commits and contributors on this release

13  Daniel Garcia Moreno
 8  Mohammad Seet
 6  zhuofeng
 2  Benjamin Gilbert
 1  Brett Kail
 1  Hieu Le Minh
 1  Ion Nistor
 1  Kevin Braun
 1  Nick Wellnhofer
 1  Ruben Thijssen
 1  Zhihan Zheng
 1  rootvector2
 1  yirou_yang

--===============6381990093743007256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxml2: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2: SRC_URI changed from "https://download.gnome.org/sources//libxml2/2.15/libxml2-2.15.3.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.15.3;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch file://CVE-2026-11979.patch" to "https://download.gnome.org/sources//libxml2/2.15/libxml2-2.15.4.tar.xz;name=archive http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=libxml2-2.15.4;name=testtar file://run-ptest file://install-tests.patch file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch"
packages/x86-64-v3-poky-linux/libxml2: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: FILELIST: removed "/usr/lib/.debug/libxml2.so.16.1.3", added "/usr/lib/.debug/libxml2.so.16.1.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: PKGSIZE changed from 5119504 to 5134088 (+0%)
packages/x86-64-v3-poky-linux/libxml2/libxml2-dbg: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-dev: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-dev: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-doc: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-doc: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-locale: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-locale: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/test/XInclude/issue1120/issue1120-2.xml /usr/lib/libxml2/ptest/result/XInclude/issue1120-2.xml.err /usr/lib/libxml2/ptest/result/XInclude/issue1120-1.xml.err /usr/lib/libxml2/ptest/result/XInclude/issue1120-2.xml /usr/lib/libxml2/ptest/result/XInclude/issue1120-1.xml /usr/lib/libxml2/ptest/test/schemas/date-whitespace_0.xml /usr/lib/libxml2/ptest/test/schemas/date-whitespace_1.xml /usr/lib/libxml2/ptest/result/schemas/date-whitespace_0_1.err /usr/lib/libxml2/ptest/test/catalogs/next-catalog-missing-attr.xml /usr/lib/libxml2/ptest/test/XInclude/issue1120/issue1120-1.xml /usr/lib/libxml2/ptest/test/schemas/date-whitespace_0.xsd /usr/lib/libxml2/ptest/result/schemas/date-whitespace_0_0.err"
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: PKGSIZE changed from 16406007 to 16422924 (+0%)
packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: FILELIST: directory renamed /usr/src/debug/libxml2/2.15.3/include/libxml -> /usr/src/debug/libxml2/2.15.4/include/libxml, directory renamed /usr/src/debug/libxml2/2.15.3/codegen -> /usr/src/debug/libxml2/2.15.4/codegen, directory renamed /usr/src/debug/libxml2/2.15.3 -> /usr/src/debug/libxml2/2.15.4, directory renamed /usr/src/debug/libxml2/2.15.3/include/private -> /usr/src/debug/libxml2/2.15.4/include/private
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: PKGSIZE changed from 5508800 to 5523563 (+0%)
packages/x86-64-v3-poky-linux/libxml2/libxml2-src: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-staticdev: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-staticdev: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2-utils: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2-utils: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.1.3", added "/usr/lib/libxml2.so.16.1.4"
packages/x86-64-v3-poky-linux/libxml2/libxml2: PV changed from "2.15.3" to "2.15.4"
Changes to packages/x86-64-v3-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.3 to libxml2.so.16.1.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.3 to libxml2.so.16.1.4
  /usr/lib/libxml2.so.16.1.3 moved to /usr/lib/libxml2.so.16.1.4
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============6381990093743007256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxml2/libxml2-ptest: FILELIST: added "/usr/lib/libxml2/ptest/test/schemas/date-whitespace_0.xml /usr/lib/libxml2/ptest/test/schemas/date-whitespace_1.xml /usr/lib/libxml2/ptest/result/XInclude/issue1120-2.xml /usr/lib/libxml2/ptest/test/schemas/date-whitespace_0.xsd /usr/lib/libxml2/ptest/test/XInclude/issue1120/issue1120-1.xml /usr/lib/libxml2/ptest/result/XInclude/issue1120-2.xml.err /usr/lib/libxml2/ptest/test/catalogs/next-catalog-missing-attr.xml /usr/lib/libxml2/ptest/result/XInclude/issue1120-1.xml.err /usr/lib/libxml2/ptest/result/schemas/date-whitespace_0_1.err /usr/lib/libxml2/ptest/result/schemas/date-whitespace_0_0.err /usr/lib/libxml2/ptest/result/XInclude/issue1120-1.xml /usr/lib/libxml2/ptest/test/XInclude/issue1120/issue1120-2.xml"
packages/x86-64-v3-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxml2.so.16.1.3", added "/usr/lib/libxml2.so.16.1.4"
Changes to packages/x86-64-v3-poky-linux/libxml2 (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.3 to libxml2.so.16.1.4
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.3 to libxml2.so.16.1.4
  /usr/lib/libxml2.so.16.1.3 moved to /usr/lib/libxml2.so.16.1.4
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============6381990093743007256==--

