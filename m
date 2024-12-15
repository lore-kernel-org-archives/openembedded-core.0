Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8701E77190
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.33349.1734254985558376412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jfC2ZNlS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=McnjLxlh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193c9a6fcee-4107c0ac-8b0b-472d-9c06-5291fd42e05f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254984;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dmg6+oDFn3fYDd0IuZP1EOLZwCR9rChRqnKN4bN50+c=;
	b=jfC2ZNlS2Ip1ZaUOu54/1ZvGMmSAI0uFPDU7HZzQ6pKwiLgaBnm61eLeT++VT6AA
	vimJW66hUtzZJr7f+IN/H+z7mF34fwQpfme/u33lzNZBUBaCppDUsVjafvukRyGnCsk
	1V4M4SIe0KCzAb3sM09plWcwFKMLjwx+jJYYlFvw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254984;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dmg6+oDFn3fYDd0IuZP1EOLZwCR9rChRqnKN4bN50+c=;
	b=McnjLxlhnvUXlTqhBZj/Ip6nMepymlPJ/PjiX5/MI9iU7rKZUmNvppuayzp/dhe/
	f3Mn5hEKfe8NVGJp+JgMjBq2iJUy7p4x4O0uLwxBGTXXNp3li5LZ8UBVOT+uhpaIC/z
	QBT2WXa66TGEbpSE9xbmzSzQgjfgmWzFyglxWRVc=
Content-Type: multipart/mixed; boundary="===============3156022087610829516=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl8: upgrading to 8.6.16 SUCCEEDED
Message-ID: <01010193c9a6fcee-4107c0ac-8b0b-472d-9c06-5291fd42e05f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208724

--===============3156022087610829516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl8* to *8.6.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tcl8-upgrade-8.6.15-8.6.16.patch
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
From 0c5405d7a6d757a83600c620e3bc90f918840716 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:38:41 +0000
Subject: [PATCH] tcl8: upgrade 8.6.15 -> 8.6.16

---
 .../tcltk8/tcl8/alter-includedir.patch                 | 10 +++++-----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch       |  4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch         |  6 +++---
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch |  8 ++++----
 .../tcl8/tcl-remove-hardcoded-install-path.patch       |  6 +++---
 .../tcltk8/{tcl8_8.6.15.bb => tcl8_8.6.16.bb}          |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.15.bb => tcl8_8.6.16.bb} (98%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index bfc718cfd3..e4ca5f2d9b 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
+From 1c72a4896b1070651530b7425ec4698ce9b9f5d5 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a3b7d69..969ddb8 100644
+index c3b75e3..60ed93e 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,10 +39,10 @@ index a3b7d69..969ddb8 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 4974fb6..a72934f 100644
+index 8e6726b..2345689 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 7480156ce0..883225710d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
+From afb654d6dcf3a92ed69ec5d266e0b94dc585c2f1 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 965f6da..a0bd63f 100644
+index a2f9e21..c3b75e3 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index 2e0dc94cff..21f62b3ffe 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
+From fbc4222e7ebc8d5f9eb9e86932f71250def693cc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index d742484..fc90990 100644
+index 24ffb1b..c6460ad 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 1cd4d76283..29e2e7f09d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
+From 977d35f23e3518dc61f2c3aaea8e862a690df268 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 7619afc..9dd053d 100644
+index bc743b3..a2f9e21 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -904,7 +904,10 @@ install-binaries: binaries
+@@ -812,7 +812,10 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
@@ -27,7 +27,7 @@ index 7619afc..9dd053d 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 0307a06..37c4d67 100644
+index 7f5464e..cd8d929 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index 93e7877256..f7e0a0dd4b 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
+From 213b03d3874335ae7c3c69ef1c5486bade9c258c Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,10 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index 4f62510..4974fb6 100644
+index e88ec3c..8e6726b 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
similarity index 98%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
index 928124148c..2f2b0c7db9 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
@@ -24,7 +24,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
+SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.44.1


--===============3156022087610829516==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcl8-upgrade-8.6.15-8.6.16.patch"

RnJvbSAwYzU0MDVkN2E2ZDc1N2E4MzYwMGM2MjBlM2JjOTBmOTE4ODQwNzE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6Mzg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2w4OiB1cGdyYWRlIDguNi4xNSAtPiA4LjYuMTYKCi0tLQogLi4uL3RjbHRrOC90Y2w4L2FsdGVy
LWluY2x1ZGVkaXIucGF0Y2ggICAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQogLi4uL3Rj
bHRrOC90Y2w4L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoICAgICAgIHwgIDQgKyst
LQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVycC5wYXRjaCAgICAgICAg
IHwgIDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1z
b25hbWUucGF0Y2ggfCAgOCArKysrLS0tLQogLi4uL3RjbDgvdGNsLXJlbW92ZS1oYXJkY29kZWQt
aW5zdGFsbC1wYXRoLnBhdGNoICAgICAgIHwgIDYgKysrLS0tCiAuLi4vdGNsdGs4L3t0Y2w4Xzgu
Ni4xNS5iYiA9PiB0Y2w4XzguNi4xNi5iYn0gICAgICAgICAgfCAgMiArLQogNiBmaWxlcyBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdGNsdGs4L3t0Y2w4XzguNi4xNS5iYiA9PiB0Y2w4XzguNi4xNi5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvYWx0ZXIt
aW5jbHVkZWRpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRl
ci1pbmNsdWRlZGlyLnBhdGNoCmluZGV4IGJmYzcxOGNmZDMuLmU0Y2E1ZjJkOWIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1pbmNsdWRlZGlyLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1pbmNsdWRl
ZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMTMwZGNhNjA2MzZkYzEyZDBkMTJkZjc1
YjAwMmZkMTIzMzQ5ZTIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYzcyYTQ4OTZi
MTA3MDY1MTUzMGI3NDI1ZWM0Njk4Y2U5YjlmNWQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjIg
Tm92IDIwMjIgMTg6NDg6MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOiB1cGRhdGUgdGhl
IGhlYWRlciBsb2NhdGlvbgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBNaW5nbGkg
WXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdW5peC9NYWtlZmlsZS5pbiBi
L3VuaXgvTWFrZWZpbGUuaW4KLWluZGV4IGEzYjdkNjkuLjk2OWRkYjggMTAwNjQ0CitpbmRleCBj
M2I3NWUzLi42MGVkOTNlIDEwMDY0NAogLS0tIGEvdW5peC9NYWtlZmlsZS5pbgogKysrIGIvdW5p
eC9NYWtlZmlsZS5pbgogQEAgLTU3LDcgKzU3LDcgQEAgU0NSSVBUX0lOU1RBTExfRElSCT0gJChJ
TlNUQUxMX1JPT1QpJChUQ0xfTElCUkFSWSkKQEAgLTM5LDEwICszOSwxMCBAQCBpbmRleCBhM2I3
ZDY5Li45NjlkZGI4IDEwMDY0NAogICMgUGF0aCB0byB0aGUgcHJpdmF0ZSB0Y2wgaGVhZGVyIGRp
cjoKICBQUklWQVRFX0lOQ0xVREVfRElSCT0gQFBSSVZBVEVfSU5DTFVERV9ESVJACiBkaWZmIC0t
Z2l0IGEvdW5peC9jb25maWd1cmUuaW4gYi91bml4L2NvbmZpZ3VyZS5pbgotaW5kZXggNDk3NGZi
Ni4uYTcyOTM0ZiAxMDA2NDQKK2luZGV4IDhlNjcyNmIuLjIzNDU2ODkgMTAwNjQ0CiAtLS0gYS91
bml4L2NvbmZpZ3VyZS5pbgogKysrIGIvdW5peC9jb25maWd1cmUuaW4KLUBAIC03NzYsNyArNzc2
LDcgQEAgZXZhbCAiVENMX0xJQl9GSUxFPWxpYnRjbCR7TElCX1NVRkZJWH0iCitAQCAtNzc1LDcg
Kzc3NSw3IEBAIGV2YWwgIlRDTF9MSUJfRklMRT1saWJ0Y2wke0xJQl9TVUZGSVh9IgogIGV2YWwg
IlRDTF9MSUJfRklMRT0ke1RDTF9MSUJfRklMRX0iCiAgCiAgdGVzdCAteiAiJFRDTF9MSUJSQVJZ
IiAmJiBUQ0xfTElCUkFSWT0nJChsaWJkaXIpL3RjbCQoVkVSU0lPTiknCkBAIC01MSw3ICs1MSw3
IEBAIGluZGV4IDQ5NzRmYjYuLmE3MjkzNGYgMTAwNjQ0CiAgSFRNTF9ESVI9JyQoRElTVERJUikv
aHRtbCcKICAKICAjIE5vdGU6ICBpbiB0aGUgZm9sbG93aW5nIHZhcmlhYmxlLCBpdCdzIGltcG9y
dGFudCB0byB1c2UgdGhlIGFic29sdXRlCi1AQCAtODk3LDcgKzg5Nyw3IEBAIFRDTF9CVUlMRF9T
VFVCX0xJQl9QQVRIPSJgcHdkYC8ke1RDTF9TVFVCX0xJQl9GSUxFfSIKK0BAIC04OTgsNyArODk4
LDcgQEAgVENMX0JVSUxEX1NUVUJfTElCX1BBVEg9ImBwd2RgLyR7VENMX1NUVUJfTElCX0ZJTEV9
IgogIFRDTF9TVFVCX0xJQl9QQVRIPSIke1RDTF9TVFVCX0xJQl9ESVJ9LyR7VENMX1NUVUJfTElC
X0ZJTEV9IgogIAogICMgSW5zdGFsbCB0aW1lIGhlYWRlciBkaXIgY2FuIGJlIHNldCB2aWEgLS1p
bmNsdWRlZGlyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgv
Zml4X25vbl9uYXRpdmVfYnVpbGRfaXNzdWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNsdGs4L3RjbDgvZml4X25vbl9uYXRpdmVfYnVpbGRfaXNzdWUucGF0Y2gKaW5kZXggNzQ4MDE1
NmNlMC4uODgzMjI1NzEwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2x0azgvdGNsOC9maXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYmQ1MTI1NDdmYzAwMmZkYjIwODA4YmY1YjhiOWZlZWI4NDhi
NjUxMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWZiNjU0ZDZkY2YzYTkyZWQ2OWVj
NWQyNjZlMGI5NGRjNTg1YzJmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5pdGlu
IEEgS2FtYmxlIDxuaXRpbi5hLmthbWJsZUBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDEzIEF1ZyAy
MDEwIDEyOjI0OjAwIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRjbDogZml4IGEgYnVpbGQgaXNz
dWUKQEAgLTEwLDcgKzEwLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtl
ZmlsZS5pbgotaW5kZXggOTY1ZjZkYS4uYTBiZDYzZiAxMDA2NDQKK2luZGV4IGEyZjllMjEuLmMz
Yjc1ZTMgMTAwNjQ0CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxl
LmluCiBAQCAtNzIzLDcgKzcyMyw3IEBAIHRjbHRlc3QtcmVhbDoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9pbnRlcnAucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdGNsdGs4L3RjbDgvaW50ZXJwLnBhdGNoCmluZGV4IDJlMGRjOTRjZmYuLjIxZjYy
YjNmZmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9pbnRl
cnAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVycC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDI2YWEyZmY2MmRkYTc3ZmQwMTFlOGY2MzBiOWQ0
ZWExNzk4NDgxNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmJjNDIyMmU3ZWJjOGQ1
ZjllYjllODY5MzJmNzEyNTBkZWY2OTNjYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogTW9uLCAxMiBKdWwgMjAy
MSAxNDo1MDoxMyArMDEwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6IGZpeCByYWNlIGluIGludGVy
cC50ZXN0CkBAIC0xMywxMCArMTMsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGFybS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVycC50ZXN0IGIvdGVzdHMvaW50
ZXJwLnRlc3QKLWluZGV4IGQ3NDI0ODQuLmZjOTA5OTAgMTAwNjQ0CitpbmRleCAyNGZmYjFiLi5j
NjQ2MGFkIDEwMDY0NAogLS0tIGEvdGVzdHMvaW50ZXJwLnRlc3QKICsrKyBiL3Rlc3RzL2ludGVy
cC50ZXN0Ci1AQCAtMzU5NSwxNyArMzU5NSwxOCBAQCB0ZXN0IGludGVycC0zNi43IHtDaGlsZEJn
ZXJyb3Igc2V0cyBlcnJvciBoYW5kbGVyIG9mIGNoaWxkIFsxOTk5MDM1XX0gLXNldHVwIHsKK0BA
IC0zNjE0LDE3ICszNjE0LDE4IEBAIHRlc3QgaW50ZXJwLTM2Ljcge0NoaWxkQmdlcnJvciBzZXRz
IGVycm9yIGhhbmRsZXIgb2YgY2hpbGQgWzE5OTkwMzVdfSAtc2V0dXAgewogICAgICAgICAgdmFy
aWFibGUgcmVzdWx0CiAgICAgICAgICBzZXQgcmVzdWx0IFtsaW5kZXggJGFyZ3MgMF0KICAgICAg
fQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1hZGQt
c29uYW1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1hZGQt
c29uYW1lLnBhdGNoCmluZGV4IDFjZDRkNzYyODMuLjI5ZTJlN2YwOWQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1zb25hbWUucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4OWZkNzNkYWY5YjNlYjJmODg5ZjY1YmFiYTVmOTBkOGE5
MzBjODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk3N2QzNWYyM2UzNTE4ZGM2MWYy
YzNhYWVhOGU4NjJhNjkwZGYyNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNo
YXJkIFB1cmRpZSA8cnB1cmRpZUBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBXZWQsIDkgRGVjIDIw
MDkgMjM6NTk6NDQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOiBBZGQgdGNsdGsgZnJvbSBP
RS5kZXYgYnV0IHdpdGggbGVnYWN5IHN0YWdpbmcgZnVuY3Rpb24KQEAgLTExLDEwICsxMSwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtlZmlsZS5pbgotaW5kZXggNzYxOWFm
Yy4uOWRkMDUzZCAxMDA2NDQKK2luZGV4IGJjNzQzYjMuLmEyZjllMjEgMTAwNjQ0CiAtLS0gYS91
bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxlLmluCi1AQCAtOTA0LDcgKzkwNCwx
MCBAQCBpbnN0YWxsLWJpbmFyaWVzOiBiaW5hcmllcworQEAgLTgxMiw3ICs4MTIsMTAgQEAgaW5z
dGFsbC1iaW5hcmllczogYmluYXJpZXMKICAJZG9uZQogIAlAZWNobyAiSW5zdGFsbGluZyAkKExJ
Ql9GSUxFKSB0byAkKERMTF9JTlNUQUxMX0RJUikvIgogIAlAQElOU1RBTExfTElCQApAQCAtMjcs
NyArMjcsNyBAQCBpbmRleCA3NjE5YWZjLi45ZGQwNTNkIDEwMDY0NAogIAlAJChJTlNUQUxMX1BS
T0dSQU0pICR7VENMX0VYRX0gIiQoQklOX0lOU1RBTExfRElSKS90Y2xzaCQoVkVSU0lPTikke0VY
RV9TVUZGSVh9IgogIAlAZWNobyAiSW5zdGFsbGluZyB0Y2xDb25maWcuc2ggdG8gJChDT05GSUdf
SU5TVEFMTF9ESVIpLyIKIGRpZmYgLS1naXQgYS91bml4L3RjbC5tNCBiL3VuaXgvdGNsLm00Ci1p
bmRleCAwMzA3YTA2Li4zN2M0ZDY3IDEwMDY0NAoraW5kZXggN2Y1NDY0ZS4uY2Q4ZDkyOSAxMDA2
NDQKIC0tLSBhL3VuaXgvdGNsLm00CiArKysgYi91bml4L3RjbC5tNAogQEAgLTEzNzgsNiArMTM3
OCw5IEBAIEFDX0RFRlVOKFtTQ19DT05GSUdfQ0ZMQUdTXSwgWwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1yZW1vdmUtaGFyZGNvZGVkLWluc3RhbGwt
cGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90Y2wtcmVtb3Zl
LWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0Y2gKaW5kZXggOTNlNzg3NzI1Ni4uZjdlMGEwZGQ0
YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1yZW1v
dmUtaGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAwNTBmYzU5N2ZiZmE0ZGEyYzMxYmQwZGY1OGM4NzE4OTJhNDkw
NDcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMTNiMDNkMzg3NDMzNWFlN2MzYzY5
ZWYxYzU0ODZiYWRlOWMyNThjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIlNvbmcu
TGkiIDxTb25nLkxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDEgQXVnIDIwMTIgMTk6MDU6
NTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOmluc3RhbGwgdGNsIHRvIGxpYjY0IGluc3Rl
YWQgb2YgbGliIG9uIDY0Yml0IHRhcmdldApAQCAtMTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IFlpIFpoYW8gPHlpLnpoYW9Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3VuaXgvY29uZmlndXJl
LmluIGIvdW5peC9jb25maWd1cmUuaW4KLWluZGV4IDRmNjI1MTAuLjQ5NzRmYjYgMTAwNjQ0Citp
bmRleCBlODhlYzNjLi44ZTY3MjZiIDEwMDY0NAogLS0tIGEvdW5peC9jb25maWd1cmUuaW4KICsr
KyBiL3VuaXgvY29uZmlndXJlLmluCi1AQCAtNzc1LDcgKzc3NSw3IEBAIGV2YWwgIlRDTF9MSUJf
RklMRT1saWJ0Y2wke0xJQl9TVUZGSVh9IgorQEAgLTc3NCw3ICs3NzQsNyBAQCBldmFsICJUQ0xf
TElCX0ZJTEU9bGlidGNsJHtMSUJfU1VGRklYfSIKICAKICBldmFsICJUQ0xfTElCX0ZJTEU9JHtU
Q0xfTElCX0ZJTEV9IgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4XzguNi4xNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYu
MTYuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3RjbHRrOC90Y2w4XzguNi4xNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3RjbHRrOC90Y2w4XzguNi4xNi5iYgppbmRleCA5MjgxMjQxNDhjLi4yZjJiMGM3ZGI5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42LjE1LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTYuYmIKQEAgLTI0LDcgKzI0
LDcgQEAgU1JDX1VSSSA9ICIke0JBU0VfU1JDX1VSSX0gXAogICAgICAgICAgICBmaWxlOi8vaW50
ZXJwLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NDQ3NzU0OTFlNDM1ZTM0ZDgzZDZjY2ZiYWRkMTM0MmYx
ODU1ZjE3MDUyNTMyMzNhODYxNTJkZjA3NjVlNzhkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNi
MzcxMzg2YTlhOTI4ZWVjZGJmMjYzYmNhYjdkNmE1MzFlNjIwY2EzZmJhYjRmZGVlYjNkNmE5YTU2
ZjM4ZTkiCiAKIFNSQ19VUkk6Y2xhc3MtbmF0aXZlID0gIiR7QkFTRV9TUkNfVVJJfSIKIAotLSAK
Mi40NC4xCgo=

--===============3156022087610829516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/tcl8: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core8.6.15-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest" to "https://downloads.sourceforge.net/tcl/tcl-core8.6.16-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest"
packages/core2-64-poky-linux/tcl8: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8: PV changed from "8.6.15" to "8.6.16"
Changes to packages/core2-64-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm
packages/core2-64-poky-linux/tcl8/tcl8-dbg: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-dbg: PKGSIZE changed from 8326656 to 8326152 (-0%)
packages/core2-64-poky-linux/tcl8/tcl8-dbg: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-dev: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-dev: PKGSIZE changed from 1457996 to 1457968 (-0%)
packages/core2-64-poky-linux/tcl8/tcl8-dev: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-doc: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-doc: PKGSIZE changed from 3172121 to 3173260 (+0%)
packages/core2-64-poky-linux/tcl8/tcl8-doc: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-lib: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-lib: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-locale: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-locale: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-ptest: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-ptest: PKGSIZE changed from 10085013 to 10111529 (+0%)
packages/core2-64-poky-linux/tcl8/tcl8-ptest: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-ptest: FILELIST: removed "/usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4 /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9 /usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4ADT /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7 /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8 /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6CDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5EDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7MDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8PDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5 /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9YDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6 /usr/lib/tcl8/ptest/library/tzdata/SystemV/HST10"
packages/core2-64-poky-linux/tcl8/tcl8-src: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-src: PKGSIZE changed from 7651582 to 7650620 (-0%)
packages/core2-64-poky-linux/tcl8/tcl8-src: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-staticdev: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-staticdev: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8: PKGSIZE changed from 2231768 to 2232318 (+0%)
packages/core2-64-poky-linux/tcl8/tcl8: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/lib/tcl8/8.5/tcltest-2.5.8.tm /usr/bin/tclsh8.6.15", added "/usr/lib/tcl8/8.5/tcltest-2.5.9.tm /usr/bin/tclsh8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8: FILES: removed "/usr/lib/tcl8.6.15", added "/usr/lib/tcl8.6.16"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.15 to ./tclsh8.6.16
  /usr/bin/tclsh8.6.15 moved to /usr/bin/tclsh8.6.16
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm

--===============3156022087610829516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm
packages/core2-64-poky-linux/tcl8/tcl8-ptest: FILELIST: removed "/usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4 /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9 /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6CDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8 /usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4ADT /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7MDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8PDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9YDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5 /usr/lib/tcl8/ptest/library/tzdata/SystemV/HST10 /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6 /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5EDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7"
packages/core2-64-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/bin/tclsh8.6.15 /usr/lib/tcl8/8.5/tcltest-2.5.8.tm", added "/usr/lib/tcl8/8.5/tcltest-2.5.9.tm /usr/bin/tclsh8.6.16"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.15 to ./tclsh8.6.16
  /usr/bin/tclsh8.6.15 moved to /usr/bin/tclsh8.6.16
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm

--===============3156022087610829516==--

