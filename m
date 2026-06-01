Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB47CD8CAC
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1565.1780328135276847590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jTrOL5xD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Jqw87TZv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e83d3a252-1bc21773-3f4a-423e-a229-7390ec23075d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8SsL1Ylik/gE0fIld+v/hqmCXUoDt/QOK94vA4hIZx0=;
	b=jTrOL5xDyFBvxbCyeVBgkB/fVvd3iFne/VhcZw+DYZWhL5tFkyzudwALh83qYAwq
	P4uh3ECixxAMct98KsRKSt79PCGL0QQ60yk4OSAaWwPuuX7qEbqGXwB+c4VEKaORVdR
	bHCjFT8fLru4SdHSQbaBs/7rUAPJBGUz2Ln3zamg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8SsL1Ylik/gE0fIld+v/hqmCXUoDt/QOK94vA4hIZx0=;
	b=Jqw87TZvOnedlvtUmC/XoSEUzjhtNr1XX0+ciZ2RLi7j5Ik22UtbihboCLae7Dxa
	oz5DNphYg7+QL8DJL6wP8ti77tFNSzegpll39DFHXsfPOy4Wf/qfxVCQAcjqpNN9HNt
	nDDkdAwy4aCNo7+Ch9VUm7g8sf1l58Kufn19Q204=
Content-Type: multipart/mixed; boundary="===============4515851547647291599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl8: upgrading to 8.6.18 SUCCEEDED
Message-ID: <0101019e83d3a252-1bc21773-3f4a-423e-a229-7390ec23075d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237905

--===============4515851547647291599==
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
From 84e2af6a993a5947cd99a9a132e07818c880f411 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:17:53 +0000
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
index 6ba7ff4340..58235698b1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From 7d404d1827ffb69a2aa7b60c10b435c6f47f7bfb Mon Sep 17 00:00:00 2001
+From 779d933232468f62f01f49f387122187cd13aa5c Mon Sep 17 00:00:00 2001
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
index ad91b9ffb3..e560658d63 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From bfca2e4ae32ab546f796d9c7ff7cbf542d5b2bfe Mon Sep 17 00:00:00 2001
+From f01032229938b0e842d72433ecf3b1beab8f78f9 Mon Sep 17 00:00:00 2001
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
index 07a1f4d040..eb6ebd0c6d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From ad7847a15163f12c24d8ecb50dffa289876dc830 Mon Sep 17 00:00:00 2001
+From 17a0c5006fa4738abf585b1320a6b0ce391539b2 Mon Sep 17 00:00:00 2001
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
index 0f8bd062ac..ede3d0369c 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 2af07e2d0f0cb9f42ff982ce257e2067dcf1ec77 Mon Sep 17 00:00:00 2001
+From a81025ec26de9ca4220f57c8aacad458962518d2 Mon Sep 17 00:00:00 2001
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
index 12e1937aa1..47d9252a53 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 0b479a0dc845f9926cb40c13d86e55391a89fe98 Mon Sep 17 00:00:00 2001
+From 51f57753b98cfadad66312161d14790285c25aef Mon Sep 17 00:00:00 2001
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


--===============4515851547647291599==
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
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: directory renamed /usr/lib/tcl8/8.4/platform -> /usr/lib/tcl8/8.6/platform, removed "/usr/bin/tclsh8.6.17 /usr/lib/tcl8/8.5/tcltest-2.5.10.tm /usr/lib/tcl8/8.4/platform-1.0.19.tm /usr/lib/tcl8/8.6/http-2.9.8.tm", added "/usr/lib/tcl8/8.6/http-2.9.9.tm /usr/lib/tcl8/8.5/tcltest-2.5.11.tm /usr/bin/tclsh8.6.18 /usr/lib/tcl8/8.6/platform-1.1.0.tm"
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

--===============4515851547647291599==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcl8-upgrade-8.6.17-8.6.18.patch"

RnJvbSA4NGUyYWY2YTk5M2E1OTQ3Y2Q5OWE5YTEzMmUwNzgxOGM4ODBmNDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDoxNzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRj
bDg6IHVwZ3JhZGUgOC42LjE3IC0+IDguNi4xOAoKLS0tCiAuLi5uZXJpYy10Y2wuaC11c2UtVGNs
X1dpZGVJbnQtZm9yLXNlY29uZHMtaW4tVGNsX1RpbS5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2ggICAgfCA2ICsr
Ky0tLQogLi4uL3RjbHRrOC90Y2w4L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoICAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90Y2wt
YWRkLXNvbmFtZS5wYXRjaCAgICAgIHwgNiArKystLS0KIC4uLi90Y2x0azgvdGNsOC90Y2wtcmVt
b3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0Y2ggICAgIHwgNCArKy0tCiAuLi4vdGNsdGs4
L3t0Y2w4XzguNi4xNy5iYiA9PiB0Y2w4XzguNi4xOC5iYn0gICAgICAgICAgICAgICB8IDIgKy0K
IDYgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC97dGNsOF84LjYuMTcuYmIgPT4gdGNsOF84
LjYuMTguYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4LzAwMDEtZ2VuZXJpYy10Y2wuaC11c2UtVGNsX1dpZGVJbnQtZm9yLXNlY29uZHMtaW4t
VGNsX1RpbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC8wMDAxLWdl
bmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50LWZvci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0Y2gK
aW5kZXggNmJhN2ZmNDM0MC4uNTgyMzU2OThiMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3RjbHRrOC90Y2w4LzAwMDEtZ2VuZXJpYy10Y2wuaC11c2UtVGNsX1dpZGVJbnQtZm9y
LXNlY29uZHMtaW4tVGNsX1RpbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNs
dGs4L3RjbDgvMDAwMS1nZW5lcmljLXRjbC5oLXVzZS1UY2xfV2lkZUludC1mb3Itc2Vjb25kcy1p
bi1UY2xfVGltLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZDQwNGQxODI3ZmZiNjlhMmFh
N2I2MGMxMGI0MzVjNmY0N2Y3YmZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3Nzlk
OTMzMjMyNDY4ZjYyZjAxZjQ5ZjM4NzEyMjE4N2NkMTNhYTVjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6
IEZyaSwgMTggQXVnIDIwMjMgMTI6MjU6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJp
Yy90Y2wuaDogdXNlIFRjbF9XaWRlSW50IGZvciBzZWNvbmRzIGluIFRjbF9UaW1lCkBAIC0xOSw3
ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9nZW5lcmljL3RjbC5oIGIvZ2VuZXJpYy90Y2wuaAotaW5kZXggZDhmZDcw
YS4uZmZmZjRiMSAxMDA2NDQKK2luZGV4IDgzZjA3ZTYuLjE2ZTk5ZjggMTAwNjQ0CiAtLS0gYS9n
ZW5lcmljL3RjbC5oCiArKysgYi9nZW5lcmljL3RjbC5oCiBAQCAtMTQyNSw3ICsxNDI1LDcgQEAg
dHlwZWRlZiBlbnVtIHsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgv
dGNsOC9hbHRlci1pbmNsdWRlZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2gKaW5kZXggYWQ5MWI5ZmZiMy4uZTU2MDY1OGQ2
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWlu
Y2x1ZGVkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2Fs
dGVyLWluY2x1ZGVkaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJmY2EyZTRhZTMyYWI1
NDZmNzk2ZDljN2ZmN2NiZjU0MmQ1YjJiZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGYwMTAzMjIyOTkzOGIwZTg0MmQ3MjQzM2VjZjNiMWJlYWI4Zjc4ZjkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVHVlLCAyMiBOb3YgMjAyMiAxODo0ODoyNyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6
IHVwZGF0ZSB0aGUgaGVhZGVyIGxvY2F0aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNpZ25lZC1vZmYt
Ynk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L01h
a2VmaWxlLmluIGIvdW5peC9NYWtlZmlsZS5pbgotaW5kZXggNDVlN2I3Ni4uNWE0NmU2YSAxMDA2
NDQKK2luZGV4IDU0YmI2NjQuLjk4ZDYxOTIgMTAwNjQ0CiAtLS0gYS91bml4L01ha2VmaWxlLmlu
CiArKysgYi91bml4L01ha2VmaWxlLmluCiBAQCAtNTcsNyArNTcsNyBAQCBTQ1JJUFRfSU5TVEFM
TF9ESVIJPSAkKElOU1RBTExfUk9PVCkkKFRDTF9MSUJSQVJZKQpAQCAtMzksNyArMzksNyBAQCBp
bmRleCA0NWU3Yjc2Li41YTQ2ZTZhIDEwMDY0NAogICMgUGF0aCB0byB0aGUgcHJpdmF0ZSB0Y2wg
aGVhZGVyIGRpcjoKICBQUklWQVRFX0lOQ0xVREVfRElSCT0gQFBSSVZBVEVfSU5DTFVERV9ESVJA
CiBkaWZmIC0tZ2l0IGEvdW5peC9jb25maWd1cmUuaW4gYi91bml4L2NvbmZpZ3VyZS5pbgotaW5k
ZXggNTBiM2UwMy4uOGEzM2QwYyAxMDA2NDQKK2luZGV4IDAwZjE2YWUuLjY0MDA2MGIgMTAwNjQ0
CiAtLS0gYS91bml4L2NvbmZpZ3VyZS5pbgogKysrIGIvdW5peC9jb25maWd1cmUuaW4KIEBAIC03
NzUsNyArNzc1LDcgQEAgZXZhbCAiVENMX0xJQl9GSUxFPWxpYnRjbCR7TElCX1NVRkZJWH0iCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvZml4X25vbl9uYXRp
dmVfYnVpbGRfaXNzdWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgv
Zml4X25vbl9uYXRpdmVfYnVpbGRfaXNzdWUucGF0Y2gKaW5kZXggMDdhMWY0ZDA0MC4uZWI2ZWJk
MGM2ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ZpeF9u
b25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90
Y2x0azgvdGNsOC9maXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gYWQ3ODQ3YTE1MTYzZjEyYzI0ZDhlY2I1MGRmZmEyODk4NzZkYzgzMCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTdhMGM1MDA2ZmE0NzM4YWJmNTg1YjEzMjBhNmIwY2Uz
OTE1MzliMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5pdGluIEEgS2FtYmxlIDxu
aXRpbi5hLmthbWJsZUBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDEzIEF1ZyAyMDEwIDEyOjI0OjAw
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRjbDogZml4IGEgYnVpbGQgaXNzdWUKQEAgLTEwLDcg
KzEwLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtlZmlsZS5pbgotaW5k
ZXggYWIyZTdiNS4uNDVlN2I3NiAxMDA2NDQKK2luZGV4IDNkNTJmZTcuLjU0YmI2NjQgMTAwNjQ0
CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxlLmluCiBAQCAtNzIz
LDcgKzcyMyw3IEBAIHRjbHRlc3QtcmVhbDoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy90Y2x0azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy90Y2x0azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaAppbmRleCAwZjhiZDA2MmFjLi5l
ZGUzZDAzNjljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgv
dGNsLWFkZC1zb25hbWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90
Y2w4L3RjbC1hZGQtc29uYW1lLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYWYwN2UyZDBm
MGNiOWY0MmZmOTgyY2UyNTdlMjA2N2RjZjFlYzc3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBhODEwMjVlYzI2ZGU5Y2E0MjIwZjU3YzhhYWNhZDQ1ODk2MjUxOGQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJwdXJkaWVAbGludXguaW50ZWwu
Y29tPgogRGF0ZTogV2VkLCA5IERlYyAyMDA5IDIzOjU5OjQ0ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHRjbDogQWRkIHRjbHRrIGZyb20gT0UuZGV2IGJ1dCB3aXRoIGxlZ2FjeSBzdGFnaW5nIGZ1
bmN0aW9uCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3VuaXgvTWFrZWZpbGUuaW4gYi91bml4L01h
a2VmaWxlLmluCi1pbmRleCAzZWZkZmVjLi5hYjJlN2I1IDEwMDY0NAoraW5kZXggMjNmODZjOC4u
M2Q1MmZlNyAxMDA2NDQKIC0tLSBhL3VuaXgvTWFrZWZpbGUuaW4KICsrKyBiL3VuaXgvTWFrZWZp
bGUuaW4KIEBAIC04MTIsNyArODEyLDEwIEBAIGluc3RhbGwtYmluYXJpZXM6IGJpbmFyaWVzCkBA
IC0yNyw3ICsyNyw3IEBAIGluZGV4IDNlZmRmZWMuLmFiMmU3YjUgMTAwNjQ0CiAgCUAkKElOU1RB
TExfUFJPR1JBTSkgJHtUQ0xfRVhFfSAiJChCSU5fSU5TVEFMTF9ESVIpL3RjbHNoJChWRVJTSU9O
KSR7RVhFX1NVRkZJWH0iCiAgCUBlY2hvICJJbnN0YWxsaW5nIHRjbENvbmZpZy5zaCB0byAkKENP
TkZJR19JTlNUQUxMX0RJUikvIgogZGlmZiAtLWdpdCBhL3VuaXgvdGNsLm00IGIvdW5peC90Y2wu
bTQKLWluZGV4IDdmNTQ2NGUuLmNkOGQ5MjkgMTAwNjQ0CitpbmRleCBjZDg5MTcwLi4xMjJhZmYw
IDEwMDY0NAogLS0tIGEvdW5peC90Y2wubTQKICsrKyBiL3VuaXgvdGNsLm00CiBAQCAtMTM3OCw2
ICsxMzc4LDkgQEAgQUNfREVGVU4oW1NDX0NPTkZJR19DRkxBR1NdLCBbCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92ZS1oYXJkY29kZWQtaW5z
dGFsbC1wYXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1y
ZW1vdmUtaGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaAppbmRleCAxMmUxOTM3YWExLi40N2Q5
MjUyYTUzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNs
LXJlbW92ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2x0azgvdGNsOC90Y2wtcmVtb3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBiNDc5YTBkYzg0NWY5OTI2Y2I0MGMxM2Q4NmU1NTM5
MWE4OWZlOTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUxZjU3NzUzYjk4Y2ZhZGFk
NjYzMTIxNjFkMTQ3OTAyODVjMjVhZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiAi
U29uZy5MaSIgPFNvbmcuTGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMSBBdWcgMjAxMiAx
OTowNTo1MSArMDgwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6aW5zdGFsbCB0Y2wgdG8gbGliNjQg
aW5zdGVhZCBvZiBsaWIgb24gNjRiaXQgdGFyZ2V0CkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1v
ZmYtYnk6IFlpIFpoYW8gPHlpLnpoYW9Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3VuaXgvY29uZmln
dXJlLmluIGIvdW5peC9jb25maWd1cmUuaW4KLWluZGV4IGVkMDdjYTUuLjUwYjNlMDMgMTAwNjQ0
CitpbmRleCA0MDc4OTcwLi4wMGYxNmFlIDEwMDY0NAogLS0tIGEvdW5peC9jb25maWd1cmUuaW4K
ICsrKyBiL3VuaXgvY29uZmlndXJlLmluCiBAQCAtNzc0LDcgKzc3NCw3IEBAIGV2YWwgIlRDTF9M
SUJfRklMRT1saWJ0Y2wke0xJQl9TVUZGSVh9IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3RjbHRrOC90Y2w4XzguNi4xNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0
azgvdGNsOF84LjYuMTguYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4XzguNi4xNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4XzguNi4xOC5iYgppbmRleCAxYjA4ZmRhNWZhLi41NDVj
MWNkYzYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42
LjE3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTguYmIK
QEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VSSSA9ICIke0JBU0VfU1JDX1VSSX0gXAogICAgICAgICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZ2VuZXJpYy10Y2wu
aC11c2UtVGNsX1dpZGVJbnQtZm9yLXNlY29uZHMtaW4tVGNsX1RpbS5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMWQ4Y2JlNDRiMzhiZWFhMjlmYzIxMzBjNGU3
Yjc5YjhiZjAyZTJiY2MwMjhmZmVmZDdhMjVhMjEyMjIwMmEwIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjE4ODBiNjMzN2RlNzI0MzExNzQ1MTE0MTk1NTBiYjRjZjEzMjdiN2M4MjAwYTU0NjZkMWM0
ZWIzZWNhYzUxMzIiCiAKIFNSQ19VUkk6Y2xhc3MtbmF0aXZlID0gIiR7QkFTRV9TUkNfVVJJfSIK
IAotLSAKMi40Ny4xCgo=

--===============4515851547647291599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/tcl8: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core8.6.17-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch" to "https://downloads.sourceforge.net/tcl/tcl-core8.6.18-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch"
packages/x86-64-v3-poky-linux/tcl8: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
Changes to packages/x86-64-v3-poky-linux/tcl8 (sysroot):
  /usr/lib/tcl8/8.4/platform moved to /usr/lib/tcl8/8.6/platform
  /usr/lib/tcl8/8.4/platform/shell-1.1.4.tm moved to /usr/lib/tcl8/8.6/platform/shell-1.1.4.tm
  /usr/include/tcl8.6.17 moved to /usr/include/tcl8.6.18
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.11.tm
  /usr/lib/tcl8/8.6/http-2.9.8.tm moved to /usr/lib/tcl8/8.6/http-2.9.9.tm
  /usr/lib/tcl8/8.6/platform-1.1.0.tm was added
  /usr/lib/tcl8/8.4 was removed
  /usr/lib/tcl8/8.4/platform-1.0.19.tm was removed
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGSIZE changed from 8522120 to 8523808 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: FILELIST: directory renamed /usr/include/tcl8.6.17/compat -> /usr/include/tcl8.6.18/compat, directory renamed /usr/include/tcl8.6.17/unix -> /usr/include/tcl8.6.18/unix, directory renamed /usr/include/tcl8.6.17/generic -> /usr/include/tcl8.6.18/generic
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGSIZE changed from 1456892 to 1456818 (-0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGSIZE changed from 3176831 to 3179431 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGSIZE changed from 6751648 to 6754626 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: FILELIST: directory renamed /usr/src/debug/tcl8/8.6.17/libtommath -> /usr/src/debug/tcl8/8.6.18/libtommath, directory renamed /usr/src/debug/tcl8/8.6.17/compat -> /usr/src/debug/tcl8/8.6.18/compat, directory renamed /usr/src/debug/tcl8/8.6.17/unix -> /usr/src/debug/tcl8/8.6.18/unix, directory renamed /usr/src/debug/tcl8/8.6.17/generic -> /usr/src/debug/tcl8/8.6.18/generic
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGSIZE changed from 7653678 to 7661399 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8: PV changed from "8.6.17" to "8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGV changed from 8.6.17 [default] to 8.6.18 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILES: removed "/usr/lib/tcl8.6.17", added "/usr/lib/tcl8.6.18"
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: directory renamed /usr/lib/tcl8/8.4/platform -> /usr/lib/tcl8/8.6/platform, removed "/usr/bin/tclsh8.6.17 /usr/lib/tcl8/8.4/platform-1.0.19.tm /usr/lib/tcl8/8.6/http-2.9.8.tm /usr/lib/tcl8/8.5/tcltest-2.5.10.tm", added "/usr/bin/tclsh8.6.18 /usr/lib/tcl8/8.6/platform-1.1.0.tm /usr/lib/tcl8/8.5/tcltest-2.5.11.tm /usr/lib/tcl8/8.6/http-2.9.9.tm"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGSIZE changed from 3396959 to 3393567 (-0%)
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

--===============4515851547647291599==--

