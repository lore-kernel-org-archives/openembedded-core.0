Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581D5CDB464
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50430.1781195511166733339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=o6JdC35s;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SgL5FXNB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019eb78692de-fced2a4a-7d9f-4a85-be36-949e6947eb68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FuWuT1/a3mubLt8od0d5lIO9lEm1muXCBgwqNzB1O0c=;
	b=o6JdC35svZqgRn/pWVMaf+gBz0B0dkD9Hy0PtCw3mpyCUW81pO93aJhzw2QqzSh1
	EHchlyU9hAUKkHkCvq1+ee7LV6YTzZafSS8GjjG8h1u4FD6cDF3vnhO2Bw+Va2XqtUP
	fBt+N3PWYkxRD6IxhgfmWYKK6UlPgaVGKlerlLRo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FuWuT1/a3mubLt8od0d5lIO9lEm1muXCBgwqNzB1O0c=;
	b=SgL5FXNBx+THMqX0uL9aPgiLP+wo3irssEkXiNuSvOnH5X2tNqArI5HKKjnA1r9R
	m5Et5dzUHqoKdnSL/n9P0/k8WiGTbiTY8Xo1qD5m3/mBzwcx1zwkHztuk8VXucOw8AF
	t7OzVUVFpL9FPtZLoE8xniiF/m89KzdGupUOagtQ=
Content-Type: multipart/mixed; boundary="===============6781037669314750546=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl8: upgrading to 8.6.18 SUCCEEDED
Message-ID: <0101019eb78692de-fced2a4a-7d9f-4a85-be36-949e6947eb68-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238512

--===============6781037669314750546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl8* to *8.6.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tcl8-upgrade-8.6.17-8.6.18.patch
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
From 5c7598d87058a0310e9fdef52bc385aa4b40b660 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:02:11 +0000
Subject: [PATCH] tcl8: upgrade 8.6.17 -> 8.6.18

---
 ...neric-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch    | 6 +++---
 .../tcltk8/tcl8/fix_non_native_build_issue.patch            | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch      | 6 +++---
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch     | 4 ++--
 .../tcltk8/{tcl8_8.6.17.bb => tcl8_8.6.18.bb}               | 2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.17.bb => tcl8_8.6.18.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
index 6ba7ff4340..9cc29f773a 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From 7d404d1827ffb69a2aa7b60c10b435c6f47f7bfb Mon Sep 17 00:00:00 2001
+From 9f78045af22aa2217d7ec0233348983751223c89 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 18 Aug 2023 12:25:11 +0200
 Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generic/tcl.h b/generic/tcl.h
-index d8fd70a..ffff4b1 100644
+index 83f07e6..16e99f8 100644
 --- a/generic/tcl.h
 +++ b/generic/tcl.h
 @@ -1425,7 +1425,7 @@ typedef enum {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index ad91b9ffb3..c346a21a19 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From bfca2e4ae32ab546f796d9c7ff7cbf542d5b2bfe Mon Sep 17 00:00:00 2001
+From 0f47a7716dfd5166d44efee2ed1f4788914f0881 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 45e7b76..5a46e6a 100644
+index 54bb664..98d6192 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,7 +39,7 @@ index 45e7b76..5a46e6a 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 50b3e03..8a33d0c 100644
+index 00f16ae..640060b 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 07a1f4d040..33f6e1fd33 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From ad7847a15163f12c24d8ecb50dffa289876dc830 Mon Sep 17 00:00:00 2001
+From 18ed2dc77a50f68f56a9e353c072faf4fff0b303 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index ab2e7b5..45e7b76 100644
+index 3d52fe7..54bb664 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 0f8bd062ac..9420d20d8d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 2af07e2d0f0cb9f42ff982ce257e2067dcf1ec77 Mon Sep 17 00:00:00 2001
+From 94ef831d7052c819dddab92f22f1fc8319dd27bf Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 3efdfec..ab2e7b5 100644
+index 23f86c8..3d52fe7 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -812,7 +812,10 @@ install-binaries: binaries
@@ -27,7 +27,7 @@ index 3efdfec..ab2e7b5 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 7f5464e..cd8d929 100644
+index cd89170..122aff0 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index 12e1937aa1..d8f4286409 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 0b479a0dc845f9926cb40c13d86e55391a89fe98 Mon Sep 17 00:00:00 2001
+From 36331191e3443603277b3c2abbfa4c1bdf0fdb82 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,7 +17,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index ed07ca5..50b3e03 100644
+index 4078970..00f16ae 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 1b08fda5fa..545c1cdc60 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -24,7 +24,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
+SRC_URI[sha256sum] = "1880b6337de72431174511419550bb4cf1327b7c8200a5466d1c4eb3ecac5132"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.47.1


--===============6781037669314750546==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcl8-upgrade-8.6.17-8.6.18.patch"

RnJvbSA1Yzc1OThkODcwNThhMDMxMGU5ZmRlZjUyYmMzODVhYTRiNDBiNjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6MDI6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2w4OiB1cGdyYWRlIDguNi4xNyAtPiA4LjYuMTgKCi0tLQogLi4ubmVyaWMtdGNsLmgtdXNlLVRj
bF9XaWRlSW50LWZvci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0Y2ggfCA0ICsrLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1pbmNsdWRlZGlyLnBhdGNoICAgIHwgNiAr
KystLS0KIC4uLi90Y2x0azgvdGNsOC9maXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaCAg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNs
LWFkZC1zb25hbWUucGF0Y2ggICAgICB8IDYgKysrLS0tCiAuLi4vdGNsdGs4L3RjbDgvdGNsLXJl
bW92ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBhdGNoICAgICB8IDQgKystLQogLi4uL3RjbHRr
OC97dGNsOF84LjYuMTcuYmIgPT4gdGNsOF84LjYuMTguYmJ9ICAgICAgICAgICAgICAgfCAyICst
CiA2IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgve3RjbDhfOC42LjE3LmJiID0+IHRjbDhf
OC42LjE4LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0
azgvdGNsOC8wMDAxLWdlbmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50LWZvci1zZWNvbmRzLWlu
LVRjbF9UaW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvMDAwMS1n
ZW5lcmljLXRjbC5oLXVzZS1UY2xfV2lkZUludC1mb3Itc2Vjb25kcy1pbi1UY2xfVGltLnBhdGNo
CmluZGV4IDZiYTdmZjQzNDAuLjljYzI5Zjc3M2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2x0azgvdGNsOC8wMDAxLWdlbmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50LWZv
ci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Rj
bHRrOC90Y2w4LzAwMDEtZ2VuZXJpYy10Y2wuaC11c2UtVGNsX1dpZGVJbnQtZm9yLXNlY29uZHMt
aW4tVGNsX1RpbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2Q0MDRkMTgyN2ZmYjY5YTJh
YTdiNjBjMTBiNDM1YzZmNDdmN2JmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWY3
ODA0NWFmMjJhYTIyMTdkN2VjMDIzMzM0ODk4Mzc1MTIyM2M4OSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRl
OiBGcmksIDE4IEF1ZyAyMDIzIDEyOjI1OjExICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVy
aWMvdGNsLmg6IHVzZSBUY2xfV2lkZUludCBmb3Igc2Vjb25kcyBpbiBUY2xfVGltZQpAQCAtMTks
NyArMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJv
bml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvZ2VuZXJpYy90Y2wuaCBiL2dlbmVyaWMvdGNsLmgKLWluZGV4IGQ4ZmQ3
MGEuLmZmZmY0YjEgMTAwNjQ0CitpbmRleCA4M2YwN2U2Li4xNmU5OWY4IDEwMDY0NAogLS0tIGEv
Z2VuZXJpYy90Y2wuaAogKysrIGIvZ2VuZXJpYy90Y2wuaAogQEAgLTE0MjUsNyArMTQyNSw3IEBA
IHR5cGVkZWYgZW51bSB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4
L3RjbDgvYWx0ZXItaW5jbHVkZWRpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0
azgvdGNsOC9hbHRlci1pbmNsdWRlZGlyLnBhdGNoCmluZGV4IGFkOTFiOWZmYjMuLmMzNDZhMjFh
MTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1p
bmNsdWRlZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9h
bHRlci1pbmNsdWRlZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZmNhMmU0YWUzMmFi
NTQ2Zjc5NmQ5YzdmZjdjYmY1NDJkNWIyYmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwZjQ3YTc3MTZkZmQ1MTY2ZDQ0ZWZlZTJlZDFmNDc4ODkxNGYwODgxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFR1ZSwgMjIgTm92IDIwMjIgMTg6NDg6MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNs
OiB1cGRhdGUgdGhlIGhlYWRlciBsb2NhdGlvbgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogIDMgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdW5peC9N
YWtlZmlsZS5pbiBiL3VuaXgvTWFrZWZpbGUuaW4KLWluZGV4IDQ1ZTdiNzYuLjVhNDZlNmEgMTAw
NjQ0CitpbmRleCA1NGJiNjY0Li45OGQ2MTkyIDEwMDY0NAogLS0tIGEvdW5peC9NYWtlZmlsZS5p
bgogKysrIGIvdW5peC9NYWtlZmlsZS5pbgogQEAgLTU3LDcgKzU3LDcgQEAgU0NSSVBUX0lOU1RB
TExfRElSCT0gJChJTlNUQUxMX1JPT1QpJChUQ0xfTElCUkFSWSkKQEAgLTM5LDcgKzM5LDcgQEAg
aW5kZXggNDVlN2I3Ni4uNWE0NmU2YSAxMDA2NDQKICAjIFBhdGggdG8gdGhlIHByaXZhdGUgdGNs
IGhlYWRlciBkaXI6CiAgUFJJVkFURV9JTkNMVURFX0RJUgk9IEBQUklWQVRFX0lOQ0xVREVfRElS
QAogZGlmZiAtLWdpdCBhL3VuaXgvY29uZmlndXJlLmluIGIvdW5peC9jb25maWd1cmUuaW4KLWlu
ZGV4IDUwYjNlMDMuLjhhMzNkMGMgMTAwNjQ0CitpbmRleCAwMGYxNmFlLi42NDAwNjBiIDEwMDY0
NAogLS0tIGEvdW5peC9jb25maWd1cmUuaW4KICsrKyBiL3VuaXgvY29uZmlndXJlLmluCiBAQCAt
Nzc1LDcgKzc3NSw3IEBAIGV2YWwgIlRDTF9MSUJfRklMRT1saWJ0Y2wke0xJQl9TVUZGSVh9Igpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ZpeF9ub25fbmF0
aXZlX2J1aWxkX2lzc3VlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4
L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoCmluZGV4IDA3YTFmNGQwNDAuLjMzZjZl
MWZkMzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9maXhf
bm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNsdGs4L3RjbDgvZml4X25vbl9uYXRpdmVfYnVpbGRfaXNzdWUucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGFkNzg0N2ExNTE2M2YxMmMyNGQ4ZWNiNTBkZmZhMjg5ODc2ZGM4MzAgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE4ZWQyZGM3N2E1MGY2OGY1NmE5ZTM1M2MwNzJmYWY0
ZmZmMGIzMDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBOaXRpbiBBIEthbWJsZSA8
bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxMyBBdWcgMjAxMCAxMjoyNDow
MCAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6IGZpeCBhIGJ1aWxkIGlzc3VlCkBAIC0xMCw3
ICsxMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvdW5peC9NYWtlZmlsZS5pbiBiL3VuaXgvTWFrZWZpbGUuaW4KLWlu
ZGV4IGFiMmU3YjUuLjQ1ZTdiNzYgMTAwNjQ0CitpbmRleCAzZDUyZmU3Li41NGJiNjY0IDEwMDY0
NAogLS0tIGEvdW5peC9NYWtlZmlsZS5pbgogKysrIGIvdW5peC9NYWtlZmlsZS5pbgogQEAgLTcy
Myw3ICs3MjMsNyBAQCB0Y2x0ZXN0LXJlYWw6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1zb25hbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1zb25hbWUucGF0Y2gKaW5kZXggMGY4YmQwNjJhYy4u
OTQyMGQyMGQ4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4
L3RjbC1hZGQtc29uYW1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgv
dGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmFmMDdlMmQw
ZjBjYjlmNDJmZjk4MmNlMjU3ZTIwNjdkY2YxZWM3NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOTRlZjgzMWQ3MDUyYzgxOWRkZGFiOTJmMjJmMWZjODMxOWRkMjdiZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxycHVyZGllQGxpbnV4LmludGVs
LmNvbT4KIERhdGU6IFdlZCwgOSBEZWMgMjAwOSAyMzo1OTo0NCArMDAwMAogU3ViamVjdDogW1BB
VENIXSB0Y2w6IEFkZCB0Y2x0ayBmcm9tIE9FLmRldiBidXQgd2l0aCBsZWdhY3kgc3RhZ2luZyBm
dW5jdGlvbgpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9N
YWtlZmlsZS5pbgotaW5kZXggM2VmZGZlYy4uYWIyZTdiNSAxMDA2NDQKK2luZGV4IDIzZjg2Yzgu
LjNkNTJmZTcgMTAwNjQ0CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2Vm
aWxlLmluCiBAQCAtODEyLDcgKzgxMiwxMCBAQCBpbnN0YWxsLWJpbmFyaWVzOiBiaW5hcmllcwpA
QCAtMjcsNyArMjcsNyBAQCBpbmRleCAzZWZkZmVjLi5hYjJlN2I1IDEwMDY0NAogIAlAJChJTlNU
QUxMX1BST0dSQU0pICR7VENMX0VYRX0gIiQoQklOX0lOU1RBTExfRElSKS90Y2xzaCQoVkVSU0lP
Tikke0VYRV9TVUZGSVh9IgogIAlAZWNobyAiSW5zdGFsbGluZyB0Y2xDb25maWcuc2ggdG8gJChD
T05GSUdfSU5TVEFMTF9ESVIpLyIKIGRpZmYgLS1naXQgYS91bml4L3RjbC5tNCBiL3VuaXgvdGNs
Lm00Ci1pbmRleCA3ZjU0NjRlLi5jZDhkOTI5IDEwMDY0NAoraW5kZXggY2Q4OTE3MC4uMTIyYWZm
MCAxMDA2NDQKIC0tLSBhL3VuaXgvdGNsLm00CiArKysgYi91bml4L3RjbC5tNAogQEAgLTEzNzgs
NiArMTM3OCw5IEBAIEFDX0RFRlVOKFtTQ19DT05GSUdfQ0ZMQUdTXSwgWwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1yZW1vdmUtaGFyZGNvZGVkLWlu
c3RhbGwtcGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90Y2wt
cmVtb3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0Y2gKaW5kZXggMTJlMTkzN2FhMS4uZDhm
NDI4NjQwOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3Rj
bC1yZW1vdmUtaGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYjQ3OWEwZGM4NDVmOTkyNmNiNDBjMTNkODZlNTUz
OTFhODlmZTk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNjMzMTE5MWUzNDQzNjAz
Mjc3YjNjMmFiYmZhNGMxYmRmMGZkYjgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
IlNvbmcuTGkiIDxTb25nLkxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDEgQXVnIDIwMTIg
MTk6MDU6NTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOmluc3RhbGwgdGNsIHRvIGxpYjY0
IGluc3RlYWQgb2YgbGliIG9uIDY0Yml0IHRhcmdldApAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBZaSBaaGFvIDx5aS56aGFvQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L2NvbmZp
Z3VyZS5pbiBiL3VuaXgvY29uZmlndXJlLmluCi1pbmRleCBlZDA3Y2E1Li41MGIzZTAzIDEwMDY0
NAoraW5kZXggNDA3ODk3MC4uMDBmMTZhZSAxMDA2NDQKIC0tLSBhL3VuaXgvY29uZmlndXJlLmlu
CiArKysgYi91bml4L2NvbmZpZ3VyZS5pbgogQEAgLTc3NCw3ICs3NzQsNyBAQCBldmFsICJUQ0xf
TElCX0ZJTEU9bGlidGNsJHtMSUJfU1VGRklYfSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNs
dGs4L3RjbDhfOC42LjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTguYmIKaW5kZXggMWIwOGZkYTVmYS4uNTQ1
YzFjZGM2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4Xzgu
Ni4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42LjE4LmJi
CkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkkgPSAiJHtCQVNFX1NSQ19VUkl9IFwKICAgICAgICAg
ICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdlbmVyaWMtdGNs
LmgtdXNlLVRjbF9XaWRlSW50LWZvci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0Y2ggXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTFkOGNiZTQ0YjM4YmVhYTI5ZmMyMTMwYzRl
N2I3OWI4YmYwMmUyYmNjMDI4ZmZlZmQ3YTI1YTIxMjIyMDJhMCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxODgwYjYzMzdkZTcyNDMxMTc0NTExNDE5NTUwYmI0Y2YxMzI3YjdjODIwMGE1NDY2ZDFj
NGViM2VjYWM1MTMyIgogCiBTUkNfVVJJOmNsYXNzLW5hdGl2ZSA9ICIke0JBU0VfU1JDX1VSSX0i
CiAKLS0gCjIuNDcuMQoK

--===============6781037669314750546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/tcl8: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core8.6.17-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch" to "https://downloads.sourceforge.net/tcl/tcl-core8.6.18-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch"
packages/x86-64-v3-poky-linux/tcl8: PV changed from "8.6.17" to "8.6.18"
Changes to packages/x86-64-v3-poky-linux/tcl8 (sysroot):
  /usr/lib/tcl8/8.4/platform moved to /usr/lib/tcl8/8.6/platform
  /usr/lib/tcl8/8.4/platform/shell-1.1.4.tm moved to /usr/lib/tcl8/8.6/platform/shell-1.1.4.tm
  /usr/include/tcl8.6.17 moved to /usr/include/tcl8.6.18
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.11.tm
  /usr/lib/tcl8/8.6/http-2.9.8.tm moved to /usr/lib/tcl8/8.6/http-2.9.9.tm
  /usr/lib/tcl8/8.6/platform-1.1.0.tm was added
  /usr/lib/tcl8/8.4 was removed
  /usr/lib/tcl8/8.4/platform-1.0.19.tm was removed
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGSIZE changed from 8522120 to 8523808 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: FILELIST: directory renamed /usr/include/tcl8.6.17/generic -> /usr/include/tcl8.6.18/generic, directory renamed /usr/include/tcl8.6.17/compat -> /usr/include/tcl8.6.18/compat, directory renamed /usr/include/tcl8.6.17/unix -> /usr/include/tcl8.6.18/unix
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGSIZE changed from 1456892 to 1456818 (-0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGSIZE changed from 3176831 to 3179431 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGSIZE changed from 6751648 to 6754626 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: FILELIST: directory renamed /usr/src/debug/tcl8/8.6.17/generic -> /usr/src/debug/tcl8/8.6.18/generic, directory renamed /usr/src/debug/tcl8/8.6.17/unix -> /usr/src/debug/tcl8/8.6.18/unix, directory renamed /usr/src/debug/tcl8/8.6.17/libtommath -> /usr/src/debug/tcl8/8.6.18/libtommath, directory renamed /usr/src/debug/tcl8/8.6.17/compat -> /usr/src/debug/tcl8/8.6.18/compat
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGSIZE changed from 7653678 to 7661399 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: directory renamed /usr/lib/tcl8/8.4/platform -> /usr/lib/tcl8/8.6/platform, removed "/usr/lib/tcl8/8.4/platform-1.0.19.tm /usr/lib/tcl8/8.6/http-2.9.8.tm /usr/bin/tclsh8.6.17 /usr/lib/tcl8/8.5/tcltest-2.5.10.tm", added "/usr/bin/tclsh8.6.18 /usr/lib/tcl8/8.6/http-2.9.9.tm /usr/lib/tcl8/8.6/platform-1.1.0.tm /usr/lib/tcl8/8.5/tcltest-2.5.11.tm"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGSIZE changed from 3396959 to 3393567 (-0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILES: removed "/usr/lib/tcl8.6.17", added "/usr/lib/tcl8.6.18"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.17 to ./tclsh8.6.18
  /usr/lib/tcl8/8.4/platform moved to /usr/lib/tcl8/8.6/platform
  /usr/lib/tcl8/8.4/platform/shell-1.1.4.tm moved to /usr/lib/tcl8/8.6/platform/shell-1.1.4.tm
  /usr/bin/tclsh8.6.17 moved to /usr/bin/tclsh8.6.18
  /usr/include/tcl8.6.17 moved to /usr/include/tcl8.6.18
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.11.tm
  /usr/lib/tcl8/8.6/http-2.9.8.tm moved to /usr/lib/tcl8/8.6/http-2.9.9.tm
  /usr/lib/tcl8/8.6/platform-1.1.0.tm was added
  /usr/lib/tcl8/8.4 was removed
  /usr/lib/tcl8/8.4/platform-1.0.19.tm was removed

--===============6781037669314750546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/tcl8 (sysroot):
  /usr/lib/tcl8/8.4/platform moved to /usr/lib/tcl8/8.6/platform
  /usr/lib/tcl8/8.4/platform/shell-1.1.4.tm moved to /usr/lib/tcl8/8.6/platform/shell-1.1.4.tm
  /usr/include/tcl8.6.17 moved to /usr/include/tcl8.6.18
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.11.tm
  /usr/lib/tcl8/8.6/http-2.9.8.tm moved to /usr/lib/tcl8/8.6/http-2.9.9.tm
  /usr/lib/tcl8/8.6/platform-1.1.0.tm was added
  /usr/lib/tcl8/8.4 was removed
  /usr/lib/tcl8/8.4/platform-1.0.19.tm was removed
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: FILELIST: directory renamed /usr/include/tcl8.6.17/generic -> /usr/include/tcl8.6.18/generic, directory renamed /usr/include/tcl8.6.17/unix -> /usr/include/tcl8.6.18/unix, directory renamed /usr/include/tcl8.6.17/compat -> /usr/include/tcl8.6.18/compat
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: directory renamed /usr/lib/tcl8/8.4/platform -> /usr/lib/tcl8/8.6/platform, removed "/usr/lib/tcl8/8.4/platform-1.0.19.tm /usr/lib/tcl8/8.6/http-2.9.8.tm /usr/bin/tclsh8.6.17 /usr/lib/tcl8/8.5/tcltest-2.5.10.tm", added "/usr/lib/tcl8/8.6/http-2.9.9.tm /usr/bin/tclsh8.6.18 /usr/lib/tcl8/8.6/platform-1.1.0.tm /usr/lib/tcl8/8.5/tcltest-2.5.11.tm"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.17 to ./tclsh8.6.18
  /usr/lib/tcl8/8.4/platform moved to /usr/lib/tcl8/8.6/platform
  /usr/lib/tcl8/8.4/platform/shell-1.1.4.tm moved to /usr/lib/tcl8/8.6/platform/shell-1.1.4.tm
  /usr/bin/tclsh8.6.17 moved to /usr/bin/tclsh8.6.18
  /usr/include/tcl8.6.17 moved to /usr/include/tcl8.6.18
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.11.tm
  /usr/lib/tcl8/8.6/http-2.9.8.tm moved to /usr/lib/tcl8/8.6/http-2.9.9.tm
  /usr/lib/tcl8/8.6/platform-1.1.0.tm was added
  /usr/lib/tcl8/8.4 was removed
  /usr/lib/tcl8/8.4/platform-1.0.19.tm was removed

--===============6781037669314750546==--

