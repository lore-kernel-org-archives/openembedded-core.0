Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFBCCA0EC8
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12494.1752594941910664380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fpoKjwu3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mDC+sakL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc92bf-de9095e1-8944-4c06-ac6e-06abde0dd07c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594944;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i/GaY6f4qURqNv79KhSpv1Iu2aPAh7ciTehXG7GpTSQ=;
	b=fpoKjwu3Q+A2RVJhGqSNlkYIpl+qlXBqYi/GnB/+LNGrO7wIjnFtLnQFinnSf2yK
	6wcvjg7BJU7Yz8lbrs0g3We/C3IbqTFyoHeXkwVEZ3kSAYFWjbPRRnIjGQxiYL7R8lh
	JdTL2IrUAZMR84tibMEDmHAlmDBCjwvC5eaAs004=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594944;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i/GaY6f4qURqNv79KhSpv1Iu2aPAh7ciTehXG7GpTSQ=;
	b=mDC+sakLHzU3E2GAUw8MtVwu/tyHiPBvwrrpRtBddTgLj68G/NIrk+TQR0JoOClA
	MSLvHIw7bfT1AihDVnrMsqViEo/J/LWlrVc5LU03TgU8C5ByxTXumbmq8xqpr7jOSBp
	1vc9D8b2U1d6m4fDrOQTI+G7hklGZ3YAewt1tkTg=
Content-Type: multipart/mixed; boundary="===============0722407533500477748=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 9.0.2 SUCCEEDED
Message-ID: <010101980ecc92bf-de9095e1-8944-4c06-ac6e-06abde0dd07c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220356

--===============0722407533500477748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl* to *9.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tcl-upgrade-9.0.1-9.0.2.patch
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
From 4c61bc4fd81c979dd33d466d716a08d44bb6e412 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:39:22 +0000
Subject: [PATCH] tcl: upgrade 9.0.1 -> 9.0.2

---
 ...-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch |  6 +++---
 .../tcltk/tcl/0002-tcl-fix-a-build-issue.patch         |  4 ++--
 ...tall-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch |  6 +++---
 .../tcl/0004-tcl-update-the-header-location.patch      | 10 +++++-----
 .../tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch   |  6 +++---
 .../tcltk/{tcl_9.0.1.bb => tcl_9.0.2.bb}               |  2 +-
 6 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_9.0.1.bb => tcl_9.0.2.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
index cefcb24433..974b96a3dc 100644
--- a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
@@ -1,4 +1,4 @@
-From 822a73a5dec13549cb20e6c7338b059ece2ea95a Mon Sep 17 00:00:00 2001
+From 815c1f28fdf2753a065939bdd8ee53d157470db0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: add .0 to libtcl.so filename
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [see above]
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index b72b0da..2de7b2f 100644
+index 2c0ddaa..e28d2d8 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -1021,7 +1021,10 @@ install-binaries: binaries
@@ -32,7 +32,7 @@ index b72b0da..2de7b2f 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 4265832..49ad5ab 100644
+index ce01ee8..4841e94 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
index a2d5622528..cbb2f931f8 100644
--- a/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
@@ -1,4 +1,4 @@
-From 363d9d8fb329b26d1e59ece7f269a7a28e6722c5 Mon Sep 17 00:00:00 2001
+From a68854a6f064053da4d901878b0aed33c611fe4e Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [upstream does not support installed tests]
  1 file changed, 9 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 2de7b2f..b5f9ab7 100644
+index e28d2d8..46c794c 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -912,7 +912,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
index 8a425637c6..37d3b1b392 100644
--- a/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
@@ -1,4 +1,4 @@
-From 964b9649f8d044d38fdc8c4201075692e5f537a0 Mon Sep 17 00:00:00 2001
+From a260c76790aabbe28392a95fe5d8efee25a04b86 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,10 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.ac b/unix/configure.ac
-index 7f012d4..43ec7e4 100644
+index cd36358..a218c86 100644
 --- a/unix/configure.ac
 +++ b/unix/configure.ac
-@@ -725,7 +725,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -730,7 +730,7 @@ fi
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
diff --git a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
index 50a4a27256..108d3ee844 100644
--- a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
@@ -1,4 +1,4 @@
-From d2fa5a1efa5e4f07b294660c2513766c168137ce Mon Sep 17 00:00:00 2001
+From 043d3a9d5a2291d1049f2fb77422b4cec212002f Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index b5f9ab7..fbc87a2 100644
+index 46c794c..cecb02b 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,10 +39,10 @@ index b5f9ab7..fbc87a2 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.ac b/unix/configure.ac
-index 43ec7e4..19524d1 100644
+index a218c86..6af3679 100644
 --- a/unix/configure.ac
 +++ b/unix/configure.ac
-@@ -726,7 +726,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -731,7 +731,7 @@ fi
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +51,7 @@ index 43ec7e4..19524d1 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -893,7 +893,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -896,7 +896,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
index 07912da5b3..5ef6f37418 100644
--- a/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
@@ -1,4 +1,4 @@
-From fd75e3613613726786c54a25ee611c5176b33510 Mon Sep 17 00:00:00 2001
+From cc29dfa81c3350263c628a477fdcad1b4e59942c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index 0092a03..eecfd3b 100644
+index 1afb846..f6a5f93 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3651,17 +3651,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
  	variable result
  	set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.2.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_9.0.1.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.2.bb
index 765dc64e4d..87773c7717 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0004-tcl-update-the-header-location.patch \
            file://0005-tcl-fix-race-in-interp.test.patch \
            "
-SRC_URI[sha256sum] = "488fcb6c875a1762e9e8478319b20fbad9a31de475f056aeed94cc54b44cf221"
+SRC_URI[sha256sum] = "b563649181dfe12f970673c427c59208074fd7c91a20132d6cadf5d82d3371be"
 
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
-- 
2.47.1


--===============0722407533500477748==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-tcl-upgrade-9.0.1-9.0.2.patch"

RnJvbSA0YzYxYmM0ZmQ4MWM5NzlkZDMzZDQ2NmQ3MTZhMDhkNDRiYjZlNDEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6Mzk6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2w6IHVwZ3JhZGUgOS4wLjEgLT4gOS4wLjIKCi0tLQogLi4uLXRjbHRrLWZyb20tT0UuZGV2LWJ1
dC13aXRoLWxlZ2FjeS1zdGFnaW5nLWZ1LnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vdGNsdGsvdGNs
LzAwMDItdGNsLWZpeC1hLWJ1aWxkLWlzc3VlLnBhdGNoICAgICAgICAgfCAgNCArKy0tCiAuLi50
YWxsLXRjbC10by1saWI2NC1pbnN0ZWFkLW9mLWxpYi1vbi02NGJpdC10YXIucGF0Y2ggfCAgNiAr
KystLS0KIC4uLi90Y2wvMDAwNC10Y2wtdXBkYXRlLXRoZS1oZWFkZXItbG9jYXRpb24ucGF0Y2gg
ICAgICB8IDEwICsrKysrLS0tLS0KIC4uLi90Y2x0ay90Y2wvMDAwNS10Y2wtZml4LXJhY2UtaW4t
aW50ZXJwLnRlc3QucGF0Y2ggICB8ICA2ICsrKy0tLQogLi4uL3RjbHRrL3t0Y2xfOS4wLjEuYmIg
PT4gdGNsXzkuMC4yLmJifSAgICAgICAgICAgICAgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3RjbHRrL3t0Y2xfOS4wLjEuYmIgPT4gdGNsXzkuMC4yLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2wvMDAwMS10Y2wtQWRkLXRjbHRr
LWZyb20tT0UuZGV2LWJ1dC13aXRoLWxlZ2FjeS1zdGFnaW5nLWZ1LnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjbHRrL3RjbC8wMDAxLXRjbC1BZGQtdGNsdGstZnJvbS1PRS5kZXYtYnV0
LXdpdGgtbGVnYWN5LXN0YWdpbmctZnUucGF0Y2gKaW5kZXggY2VmY2IyNDQzMy4uOTc0Yjk2YTNk
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbC8wMDAxLXRjbC1B
ZGQtdGNsdGstZnJvbS1PRS5kZXYtYnV0LXdpdGgtbGVnYWN5LXN0YWdpbmctZnUucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbC8wMDAxLXRjbC1BZGQtdGNsdGstZnJv
bS1PRS5kZXYtYnV0LXdpdGgtbGVnYWN5LXN0YWdpbmctZnUucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDgyMmE3M2E1ZGVjMTM1NDljYjIwZTZjNzMzOGIwNTllY2UyZWE5NWEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDgxNWMxZjI4ZmRmMjc1M2EwNjU5MzliZGQ4ZWU1M2QxNTc0
NzBkYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cnB1
cmRpZUBsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBXZWQsIDkgRGVjIDIwMDkgMjM6NTk6NDQgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOiBhZGQgLjAgdG8gbGlidGNsLnNvIGZpbGVuYW1lCkBA
IC0xNiw3ICsxNiw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbc2VlIGFib3Zl
XQogIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtlZmlsZS5pbgotaW5kZXggYjcy
YjBkYS4uMmRlN2IyZiAxMDA2NDQKK2luZGV4IDJjMGRkYWEuLmUyOGQyZDggMTAwNjQ0CiAtLS0g
YS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxlLmluCiBAQCAtMTAyMSw3ICsx
MDIxLDEwIEBAIGluc3RhbGwtYmluYXJpZXM6IGJpbmFyaWVzCkBAIC0zMiw3ICszMiw3IEBAIGlu
ZGV4IGI3MmIwZGEuLjJkZTdiMmYgMTAwNjQ0CiAgCUAkKElOU1RBTExfUFJPR1JBTSkgJHtUQ0xf
RVhFfSAiJChCSU5fSU5TVEFMTF9ESVIpL3RjbHNoJChWRVJTSU9OKSR7RVhFX1NVRkZJWH0iCiAg
CUBlY2hvICJJbnN0YWxsaW5nIHRjbENvbmZpZy5zaCB0byAkKENPTkZJR19JTlNUQUxMX0RJUikv
IgogZGlmZiAtLWdpdCBhL3VuaXgvdGNsLm00IGIvdW5peC90Y2wubTQKLWluZGV4IDQyNjU4MzIu
LjQ5YWQ1YWIgMTAwNjQ0CitpbmRleCBjZTAxZWU4Li40ODQxZTk0IDEwMDY0NAogLS0tIGEvdW5p
eC90Y2wubTQKICsrKyBiL3VuaXgvdGNsLm00CiBAQCAtMTI2OSw2ICsxMjY5LDkgQEAgQUNfREVG
VU4oW1NDX0NPTkZJR19DRkxBR1NdLCBbCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNsdGsvdGNsLzAwMDItdGNsLWZpeC1hLWJ1aWxkLWlzc3VlLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjbHRrL3RjbC8wMDAyLXRjbC1maXgtYS1idWlsZC1pc3N1ZS5wYXRjaApp
bmRleCBhMmQ1NjIyNTI4Li5jYmIyZjkzMWY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdGNsdGsvdGNsLzAwMDItdGNsLWZpeC1hLWJ1aWxkLWlzc3VlLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2wvMDAwMi10Y2wtZml4LWEtYnVpbGQtaXNzdWUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM2M2Q5ZDhmYjMyOWIyNmQxZTU5ZWNlN2YyNjlh
N2EyOGU2NzIyYzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE2ODg1NGE2ZjA2NDA1
M2RhNGQ5MDE4NzhiMGFlZDMzYzYxMWZlNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBOaXRpbiBBIEthbWJsZSA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPgogRGF0ZTogRnJpLCAx
MyBBdWcgMjAxMCAxMjoyNDowMCAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6IGZpeCBhIGJ1
aWxkIGlzc3VlCkBAIC05LDcgKzksNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUg
W3Vwc3RyZWFtIGRvZXMgbm90IHN1cHBvcnQgaW5zdGFsbGVkIHRlc3RzXQogIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdW5p
eC9NYWtlZmlsZS5pbiBiL3VuaXgvTWFrZWZpbGUuaW4KLWluZGV4IDJkZTdiMmYuLmI1ZjlhYjcg
MTAwNjQ0CitpbmRleCBlMjhkMmQ4Li40NmM3OTRjIDEwMDY0NAogLS0tIGEvdW5peC9NYWtlZmls
ZS5pbgogKysrIGIvdW5peC9NYWtlZmlsZS5pbgogQEAgLTkxMiw3ICs5MTIsNyBAQCB0Y2x0ZXN0
LXJlYWw6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsLzAwMDMt
dGNsLWluc3RhbGwtdGNsLXRvLWxpYjY0LWluc3RlYWQtb2YtbGliLW9uLTY0Yml0LXRhci5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2wvMDAwMy10Y2wtaW5zdGFsbC10Y2wt
dG8tbGliNjQtaW5zdGVhZC1vZi1saWItb24tNjRiaXQtdGFyLnBhdGNoCmluZGV4IDhhNDI1NjM3
YzYuLjM3ZDNiMWIzOTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90
Y2wvMDAwMy10Y2wtaW5zdGFsbC10Y2wtdG8tbGliNjQtaW5zdGVhZC1vZi1saWItb24tNjRiaXQt
dGFyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2wvMDAwMy10Y2wt
aW5zdGFsbC10Y2wtdG8tbGliNjQtaW5zdGVhZC1vZi1saWItb24tNjRiaXQtdGFyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA5NjRiOTY0OWY4ZDA0NGQzOGZkYzhjNDIwMTA3NTY5MmU1ZjUz
N2EwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMjYwYzc2NzkwYWFiYmUyODM5MmE5
NWZlNWQ4ZWZlZTI1YTA0Yjg2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogIlNvbmcu
TGkiIDxTb25nLkxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDEgQXVnIDIwMTIgMTk6MDU6
NTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOmluc3RhbGwgdGNsIHRvIGxpYjY0IGluc3Rl
YWQgb2YgbGliIG9uIDY0Yml0IHRhcmdldApAQCAtMTcsMTAgKzE3LDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IFlpIFpoYW8gPHlpLnpoYW9Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3VuaXgvY29uZmlndXJl
LmFjIGIvdW5peC9jb25maWd1cmUuYWMKLWluZGV4IDdmMDEyZDQuLjQzZWM3ZTQgMTAwNjQ0Citp
bmRleCBjZDM2MzU4Li5hMjE4Yzg2IDEwMDY0NAogLS0tIGEvdW5peC9jb25maWd1cmUuYWMKICsr
KyBiL3VuaXgvY29uZmlndXJlLmFjCi1AQCAtNzI1LDcgKzcyNSw3IEBAIGV2YWwgIlRDTF9MSUJf
RklMRT1saWJ0Y2wke0xJQl9TVUZGSVh9IgorQEAgLTczMCw3ICs3MzAsNyBAQCBmaQogIAogIGV2
YWwgIlRDTF9MSUJfRklMRT0ke1RDTF9MSUJfRklMRX0iCiAgCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsLzAwMDQtdGNsLXVwZGF0ZS10aGUtaGVhZGVyLWxvY2F0
aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbC8wMDA0LXRjbC11cGRh
dGUtdGhlLWhlYWRlci1sb2NhdGlvbi5wYXRjaAppbmRleCA1MGE0YTI3MjU2Li4xMDhkM2VlODQ0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsLzAwMDQtdGNsLXVw
ZGF0ZS10aGUtaGVhZGVyLWxvY2F0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy90Y2x0ay90Y2wvMDAwNC10Y2wtdXBkYXRlLXRoZS1oZWFkZXItbG9jYXRpb24ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGQyZmE1YTFlZmE1ZTRmMDdiMjk0NjYwYzI1MTM3NjZjMTY4MTM3
Y2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA0M2QzYTlkNWEyMjkxZDEwNDlmMmZi
Nzc0MjJiNGNlYzIxMjAwMmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkg
WXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyMiBOb3YgMjAyMiAxODo0
ODoyNyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6IHVwZGF0ZSB0aGUgaGVhZGVyIGxvY2F0
aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1
QHdpbmRyaXZlci5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtlZmls
ZS5pbgotaW5kZXggYjVmOWFiNy4uZmJjODdhMiAxMDA2NDQKK2luZGV4IDQ2Yzc5NGMuLmNlY2Iw
MmIgMTAwNjQ0CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxlLmlu
CiBAQCAtNTcsNyArNTcsNyBAQCBTQ1JJUFRfSU5TVEFMTF9ESVIJPSAkKElOU1RBTExfUk9PVCkk
KFRDTF9MSUJSQVJZKQpAQCAtMzksMTAgKzM5LDEwIEBAIGluZGV4IGI1ZjlhYjcuLmZiYzg3YTIg
MTAwNjQ0CiAgIyBQYXRoIHRvIHRoZSBwcml2YXRlIHRjbCBoZWFkZXIgZGlyOgogIFBSSVZBVEVf
SU5DTFVERV9ESVIJPSBAUFJJVkFURV9JTkNMVURFX0RJUkAKIGRpZmYgLS1naXQgYS91bml4L2Nv
bmZpZ3VyZS5hYyBiL3VuaXgvY29uZmlndXJlLmFjCi1pbmRleCA0M2VjN2U0Li4xOTUyNGQxIDEw
MDY0NAoraW5kZXggYTIxOGM4Ni4uNmFmMzY3OSAxMDA2NDQKIC0tLSBhL3VuaXgvY29uZmlndXJl
LmFjCiArKysgYi91bml4L2NvbmZpZ3VyZS5hYwotQEAgLTcyNiw3ICs3MjYsNyBAQCBldmFsICJU
Q0xfTElCX0ZJTEU9bGlidGNsJHtMSUJfU1VGRklYfSIKK0BAIC03MzEsNyArNzMxLDcgQEAgZmkK
ICBldmFsICJUQ0xfTElCX0ZJTEU9JHtUQ0xfTElCX0ZJTEV9IgogIAogIHRlc3QgLXogIiRUQ0xf
TElCUkFSWSIgJiYgVENMX0xJQlJBUlk9JyQobGliZGlyKS90Y2wkKFZFUlNJT04pJwpAQCAtNTEs
NyArNTEsNyBAQCBpbmRleCA0M2VjN2U0Li4xOTUyNGQxIDEwMDY0NAogIEhUTUxfRElSPSckKERJ
U1RESVIpL2h0bWwnCiAgCiAgIyBOb3RlOiAgaW4gdGhlIGZvbGxvd2luZyB2YXJpYWJsZSwgaXQn
cyBpbXBvcnRhbnQgdG8gdXNlIHRoZSBhYnNvbHV0ZQotQEAgLTg5Myw3ICs4OTMsNyBAQCBUQ0xf
QlVJTERfU1RVQl9MSUJfUEFUSD0iYHB3ZGAvJHtUQ0xfU1RVQl9MSUJfRklMRX0iCitAQCAtODk2
LDcgKzg5Niw3IEBAIFRDTF9CVUlMRF9TVFVCX0xJQl9QQVRIPSJgcHdkYC8ke1RDTF9TVFVCX0xJ
Ql9GSUxFfSIKICBUQ0xfU1RVQl9MSUJfUEFUSD0iJHtUQ0xfU1RVQl9MSUJfRElSfS8ke1RDTF9T
VFVCX0xJQl9GSUxFfSIKICAKICAjIEluc3RhbGwgdGltZSBoZWFkZXIgZGlyIGNhbiBiZSBzZXQg
dmlhIC0taW5jbHVkZWRpcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
L3RjbC8wMDA1LXRjbC1maXgtcmFjZS1pbi1pbnRlcnAudGVzdC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2x0ay90Y2wvMDAwNS10Y2wtZml4LXJhY2UtaW4taW50ZXJwLnRlc3QucGF0
Y2gKaW5kZXggMDc5MTJkYTViMy4uNWVmNmYzNzQxOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3RjbHRrL3RjbC8wMDA1LXRjbC1maXgtcmFjZS1pbi1pbnRlcnAudGVzdC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsLzAwMDUtdGNsLWZpeC1yYWNl
LWluLWludGVycC50ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZDc1ZTM2MTM2MTM3
MjY3ODZjNTRhMjVlZTYxMWM1MTc2YjMzNTEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjYzI5ZGZhODFjMzM1MDI2M2M2MjhhNDc3ZmRjYWQxYjRlNTk5NDJjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRl
OiBNb24sIDEyIEp1bCAyMDIxIDE0OjUwOjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRjbDog
Zml4IHJhY2UgaW4gaW50ZXJwLnRlc3QKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZXJw
LnRlc3QgYi90ZXN0cy9pbnRlcnAudGVzdAotaW5kZXggMDA5MmEwMy4uZWVjZmQzYiAxMDA2NDQK
K2luZGV4IDFhZmI4NDYuLmY2YTVmOTMgMTAwNjQ0CiAtLS0gYS90ZXN0cy9pbnRlcnAudGVzdAog
KysrIGIvdGVzdHMvaW50ZXJwLnRlc3QKLUBAIC0zNjE0LDE3ICszNjE0LDE4IEBAIHRlc3QgaW50
ZXJwLTM2Ljcge0NoaWxkQmdlcnJvciBzZXRzIGVycm9yIGhhbmRsZXIgb2YgY2hpbGQgWzE5OTkw
MzVdfSAtc2V0dXAgeworQEAgLTM2NTEsMTcgKzM2NTEsMTggQEAgdGVzdCBpbnRlcnAtMzYuNyB7
Q2hpbGRCZ2Vycm9yIHNldHMgZXJyb3IgaGFuZGxlciBvZiBjaGlsZCBbMTk5OTAzNV19IC1zZXR1
cCB7CiAgCXZhcmlhYmxlIHJlc3VsdAogIAlzZXQgcmVzdWx0IFtsaW5kZXggJGFyZ3MgMF0KICAg
ICAgfQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbF85LjAuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2xfOS4wLjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbF85LjAu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbF85LjAuMi5iYgpp
bmRleCA3NjVkYzY0ZTRkLi44Nzc3M2M3NzE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdGNsdGsvdGNsXzkuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0
ay90Y2xfOS4wLjIuYmIKQEAgLTIzLDcgKzIzLDcgQEAgU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdF
X01JUlJPUn0vdGNsL3RjbC1jb3JlJHtQVn0tc3JjLnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDA0LXRjbC11cGRhdGUtdGhlLWhlYWRlci1sb2NhdGlvbi5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDA1LXRjbC1maXgtcmFjZS1pbi1pbnRlcnAudGVzdC5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ODhmY2I2Yzg3NWExNzYyZTllODQ3ODMxOWIy
MGZiYWQ5YTMxZGU0NzVmMDU2YWVlZDk0Y2M1NGI0NGNmMjIxIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImI1NjM2NDkxODFkZmUxMmY5NzA2NzNjNDI3YzU5MjA4MDc0ZmQ3YzkxYTIwMTMyZDZjYWRm
NWQ4MmQzMzcxYmUiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy50Y2wudGsv
c29mdHdhcmUvdGNsdGsvZG93bmxvYWQuaHRtbCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInRj
bCg/UDxwdmVyPlxkKyhcLlxkKykrKS1zcmMiCi0tIAoyLjQ3LjEKCg==

--===============0722407533500477748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/tcl: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core9.0.1-src.tar.gz file://run-ptest file://0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch file://0002-tcl-fix-a-build-issue.patch file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch file://0004-tcl-update-the-header-location.patch file://0005-tcl-fix-race-in-interp.test.patch" to "https://downloads.sourceforge.net/tcl/tcl-core9.0.2-src.tar.gz file://run-ptest file://0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch file://0002-tcl-fix-a-build-issue.patch file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch file://0004-tcl-update-the-header-location.patch file://0005-tcl-fix-race-in-interp.test.patch"
packages/core2-64-poky-linux/tcl: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
Changes to packages/core2-64-poky-linux/tcl (sysroot):
  /usr/include/tcl9.0.1 moved to /usr/include/tcl9.0.2
  /usr/lib/tcl9.0/encoding/cp165.enc was added
packages/core2-64-poky-linux/tcl/tcl-dbg: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-dbg: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-dbg: PKGSIZE changed from 9581312 to 9602968 (+0%)
packages/core2-64-poky-linux/tcl/tcl-dev: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-dev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-dev: PKGSIZE changed from 1491209 to 1495702 (+0%)
packages/core2-64-poky-linux/tcl/tcl-doc: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-doc: FILELIST: added "/usr/share/man/man3/Tcl_CloseEx.3tcl9 /usr/share/man/man3/Tcl_NewMethod2.3tcl9 /usr/share/man/man3/Tcl_GetSizeIntFromObj.3tcl9 /usr/share/man/man3/Tcl_NewInstanceMethod2.3tcl9 /usr/share/man/man3/Tcl_MethodIsType2.3tcl9 /usr/share/man/mann/buildinfo.ntcl9"
packages/core2-64-poky-linux/tcl/tcl-doc: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-doc: PKGSIZE changed from 3482228 to 3496741 (+0%)
packages/core2-64-poky-linux/tcl/tcl-lib: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-lib: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-lib: PKGSIZE changed from 2194528 to 2202720 (+0%)
packages/core2-64-poky-linux/tcl/tcl-locale: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-locale: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-ptest: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-ptest: FILELIST: added "/usr/lib/tcl/ptest/library/tzdata/America/Coyhaique /usr/lib/tcl/ptest/library/encoding/cp165.enc /usr/lib/tcl/ptest/tests/brodnik.test"
packages/core2-64-poky-linux/tcl/tcl-ptest: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-ptest: PKGSIZE changed from 11342515 to 11377280 (+0%)
packages/core2-64-poky-linux/tcl/tcl-src: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-src: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-src: PKGSIZE changed from 9264031 to 9293854 (+0%)
packages/core2-64-poky-linux/tcl/tcl-staticdev: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl-staticdev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl-staticdev: PKGSIZE changed from 335416 to 337992 (+1%)
packages/core2-64-poky-linux/tcl/tcl: PV changed from "9.0.1" to "9.0.2"
packages/core2-64-poky-linux/tcl/tcl: FILELIST: removed "/usr/bin/tclsh9.0.1", added "/usr/lib/tcl9.0/encoding/cp165.enc /usr/bin/tclsh9.0.2"
packages/core2-64-poky-linux/tcl/tcl: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-64-poky-linux/tcl/tcl: FILES: removed "/usr/lib/tcl9.0.1", added "/usr/lib/tcl9.0.2"
packages/core2-64-poky-linux/tcl/tcl: PKGSIZE changed from 2325750 to 2327306 (+0%)
Changes to packages/x86_64-linux/tcl-native (sysroot):
  /usr/bin/tclsh changed symlink target from ./tclsh9.0.1 to ./tclsh9.0.2
  /usr/bin/tclsh9.0.1 moved to /usr/bin/tclsh9.0.2
  /usr/include/tcl9.0.1 moved to /usr/include/tcl9.0.2
  /usr/lib/tcl9.0/encoding/cp165.enc was added

--===============0722407533500477748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/tcl (sysroot):
  /usr/include/tcl9.0.1 moved to /usr/include/tcl9.0.2
  /usr/lib/tcl9.0/encoding/cp165.enc was added
packages/core2-64-poky-linux/tcl/tcl-doc: FILELIST: added "/usr/share/man/man3/Tcl_NewMethod2.3tcl9 /usr/share/man/man3/Tcl_GetSizeIntFromObj.3tcl9 /usr/share/man/man3/Tcl_NewInstanceMethod2.3tcl9 /usr/share/man/mann/buildinfo.ntcl9 /usr/share/man/man3/Tcl_CloseEx.3tcl9 /usr/share/man/man3/Tcl_MethodIsType2.3tcl9"
packages/core2-64-poky-linux/tcl/tcl-ptest: FILELIST: added "/usr/lib/tcl/ptest/tests/brodnik.test /usr/lib/tcl/ptest/library/encoding/cp165.enc /usr/lib/tcl/ptest/library/tzdata/America/Coyhaique"
packages/core2-64-poky-linux/tcl/tcl: FILELIST: removed "/usr/bin/tclsh9.0.1", added "/usr/lib/tcl9.0/encoding/cp165.enc /usr/bin/tclsh9.0.2"
Changes to packages/x86_64-linux/tcl-native (sysroot):
  /usr/bin/tclsh changed symlink target from ./tclsh9.0.1 to ./tclsh9.0.2
  /usr/bin/tclsh9.0.1 moved to /usr/bin/tclsh9.0.2
  /usr/include/tcl9.0.1 moved to /usr/include/tcl9.0.2
  /usr/lib/tcl9.0/encoding/cp165.enc was added

--===============0722407533500477748==--

