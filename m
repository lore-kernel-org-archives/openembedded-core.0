Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCE4CA600F
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 05:25:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9086.1791437152240507165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 22:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sgtA0uct;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=M1IwCDA6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a119f99ba8-c21dcf08-d659-4663-9f02-89d1a800234b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791437151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uXlwRExq3TAWIWGi76Eq7zBEdEgHvl39IAMfzEnOtgU=;
	b=sgtA0uctADFqcTbJW1rJsZxBmvxuretYuBc3ZC01IEC10uzrvlYp7BxP01/KlKri
	TpJ8j0VObWkWLNI9a2BKhibOs8chXbJDgUs2DjHKfb69qohN+vnYsPAWvKPGhEu9xMI
	+VtqzRkPIYtXhxg2lz0H+0xK/BGrPRKRUofmHsqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791437151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uXlwRExq3TAWIWGi76Eq7zBEdEgHvl39IAMfzEnOtgU=;
	b=M1IwCDA6aQUnr/AkwDXh66153p5ZAr6x1ipA1p18/EGRQNYmVR5CJPMpWZbL0+B7
	/UzCeTh07+ppMCcFfIV32p+50UCTAqnPKlsGTBYJlH2sIy8qUG+keGiv+AO419fQ6qN
	k/f95Kwl5GEVETyGSUk4cOCjXt7DYxlvrG3xgMUE=
Content-Type: multipart/mixed; boundary="===============5059106444369236365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] subversion: upgrading to 1.15.0 SUCCEEDED
Message-ID: <010101a119f99ba8-c21dcf08-d659-4663-9f02-89d1a800234b-000000@us-west-2.amazonses.com>
Date: Thu, 8 Oct 2026 05:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.08-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 05:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247409

--===============5059106444369236365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *subversion* to *1.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-subversion-upgrade-1.14.5-1.15.0.patch
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
From 6af68af11458398f515255a91935e5509a3b7769 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 8 Oct 2026 05:15:23 +0000
Subject: [PATCH] subversion: upgrade 1.14.5 -> 1.15.0

Version 1.15.0
(21 Sep 2026, from /branches/1.15.x)
https://svn.apache.org/repos/asf/subversion/tags/1.15.0

See the 1.15 release notes for a more verbose overview of the changes since
the 1.14 release:  https://subversion.apache.org/docs/release-notes/1.15.html

 User-visible changes:
  - Major new features:

  - Minor new features and improvements:
  - Client-side improvements and bugfixes:
  - Server-side improvements and bugfixes:
  - Other tool improvements and bugfixes:

 Developer-visible changes:
  - General:

  - Bindings:
  - Server-side bugfixes:
---
 ...-fix-svn-revision-host-contamination.patch |  9 ++--
 .../subversion/subversion/parallel.patch      | 19 ++++---
 .../subversion/subversion/serfmacro.patch     | 12 +++--
 ...version_1.14.5.bb => subversion_1.15.0.bb} | 53 ++++++++++++++++++-
 4 files changed, 74 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.5.bb => subversion_1.15.0.bb} (61%)

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
index 9741a6499c..cfcf090ce3 100644
--- a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
+++ b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
@@ -1,4 +1,4 @@
-From 54b2cf44445820ea7c3250a25ed957a389aafbd6 Mon Sep 17 00:00:00 2001
+From d8f18b85e017f7fcfffaeb46cfbf6cc07ce1376c Mon Sep 17 00:00:00 2001
 From: Haixiao Yan <haixiao.yan.cn@windriver.com>
 Date: Thu, 28 May 2026 09:20:59 +0800
 Subject: [PATCH] build: do not run svnversion during install
@@ -23,10 +23,10 @@ Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7f0a37dd9a9b..914c1c37790c 100644
+index bea3a35..92ca3a0 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -499,10 +499,7 @@ local-install: @INSTALL_RULES@
+@@ -500,10 +500,7 @@ local-install: @INSTALL_RULES@
  revision-install:
  	test -d $(DESTDIR)$(includedir)/subversion-1 || \
  	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
@@ -38,6 +38,3 @@ index 7f0a37dd9a9b..914c1c37790c 100644
  
  install-static: @INSTALL_STATIC_RULES@
  
--- 
-2.53.0
-
diff --git a/meta/recipes-devtools/subversion/subversion/parallel.patch b/meta/recipes-devtools/subversion/subversion/parallel.patch
index 1fee1523ee..ad0babe034 100644
--- a/meta/recipes-devtools/subversion/subversion/parallel.patch
+++ b/meta/recipes-devtools/subversion/subversion/parallel.patch
@@ -1,4 +1,8 @@
-Ensure that directories are created before files are compiled into them.
+From a0aad59e068b6ed852db38cf26c5d862ce0ec2ab Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 5 Mar 2026 11:51:30 +0000
+Subject: [PATCH] Ensure that directories are created before files are compiled
+ into them.
 
 This is a hacky workaround, upstream have been informed and a better
 solution proposed:
@@ -7,12 +11,15 @@ https://lists.apache.org/thread/nr0w8hcpr9my2gkys09kj89rlxgd84of
 
 Upstream-Status: Inappropriate [discussion upstream]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git i/Makefile.in w/Makefile.in
-index 0fb9e39602..8bae2cc3d2 100644
---- i/Makefile.in
-+++ w/Makefile.in
-@@ -424,7 +424,9 @@ ECHO_N = @ECHO_N@
+diff --git a/Makefile.in b/Makefile.in
+index 983f3d1..bea3a35 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -419,7 +419,9 @@ ECHO_N = @ECHO_N@
  
  TESTS = $(TEST_PROGRAMS) @BDB_TEST_PROGRAMS@
  
diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 507de0f08b..b16a0c866f 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,3 +1,8 @@
+From d8f21366d2b9bd72faf078099d4ba8146396ac59 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 7 Dec 2016 13:54:18 +0000
+Subject: [PATCH] subversion: Fix issues in LDFLAGS sed manipulation
+
 The existing sed expression can match expressions like
 --sysroot=/some/path/xxx-linux/ which clearly isn't intended and injects
 incorrect paths into LDFLAGS.
@@ -14,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/build/ac-macros/serf.m4 b/build/ac-macros/serf.m4
-index 0a549b3..3a069ac 100644
+index 4637430..126eb74 100644
 --- a/build/ac-macros/serf.m4
 +++ b/build/ac-macros/serf.m4
-@@ -171,7 +171,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
+@@ -185,7 +185,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
            SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_pc_arg --cflags-only-I`]
            SVN_SERF_LIBS=[`$PKG_CONFIG $serf_pc_arg --libs-only-l`]
            dnl don't use --libs-only-L because then we might miss some options
@@ -26,6 +31,3 @@ index 0a549b3..3a069ac 100644
            break
          else
            AC_MSG_RESULT([no])
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/recipes-devtools/subversion/subversion_1.15.0.bb
similarity index 61%
rename from meta/recipes-devtools/subversion/subversion_1.14.5.bb
rename to meta/recipes-devtools/subversion/subversion_1.15.0.bb
index f6a5b9950f..a70e1f813d 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.15.0.bb
@@ -1,9 +1,58 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -367,35 +367,6 @@
+#   *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+#   *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+#  
+# -For the (modified) 'linenoise' library in tools/dev/svnmover/linenoise
+# -
+# -  Copyright (c) 2010-2014, Salvatore Sanfilippo <antirez at gmail dot com>
+# -  Copyright (c) 2010-2013, Pieter Noordhuis <pcnoordhuis at gmail dot com>
+# -
+# -  All rights reserved.
+# -
+# -  Redistribution and use in source and binary forms, with or without
+# -  modification, are permitted provided that the following conditions are met:
+# -
+# -  * Redistributions of source code must retain the above copyright notice,
+# -    this list of conditions and the following disclaimer.
+# -
+# -  * Redistributions in binary form must reproduce the above copyright notice,
+# -    this list of conditions and the following disclaimer in the documentation
+# -    and/or other materials provided with the distribution.
+# -
+# -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# -  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+# -  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# -  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# -  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+# -  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+# -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+# -  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+# -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# -
+#  For the (modified) LZ4 library files in subversion/libsvn_subr/lz4
+#  
+#    LZ4 Library
+# 
+#
+
 SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.apache.org"
 DESCRIPTION = "Subversion is an open source version control system."
 SECTION = "console/network"
 LICENSE = "Apache-2.0 AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6487ae7094d359fa90fb9c4096e52e2b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9c5b0e279cdb238d735af75554a3902"
 
 DEPENDS = "apr-util serf sqlite3 file lz4 expat"
 DEPENDS:append:class-native = " file-replacement-native"
@@ -14,7 +63,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-svn-revision-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
+SRC_URI[sha256sum] = "dfb7b1e5270c7def971ccbd5938b0c03b1b5bd60b6674a2d8a74a9560839fb8c"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.47.1


--===============5059106444369236365==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-subversion-upgrade-1.14.5-1.15.0.patch"

RnJvbSA2YWY2OGFmMTE0NTgzOThmNTE1MjU1YTkxOTM1ZTU1MDlhM2I3NzY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOCBPY3QgMjAyNiAwNToxNToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
YnZlcnNpb246IHVwZ3JhZGUgMS4xNC41IC0+IDEuMTUuMAoKVmVyc2lvbiAxLjE1LjAKKDIxIFNl
cCAyMDI2LCBmcm9tIC9icmFuY2hlcy8xLjE1LngpCmh0dHBzOi8vc3ZuLmFwYWNoZS5vcmcvcmVw
b3MvYXNmL3N1YnZlcnNpb24vdGFncy8xLjE1LjAKClNlZSB0aGUgMS4xNSByZWxlYXNlIG5vdGVz
IGZvciBhIG1vcmUgdmVyYm9zZSBvdmVydmlldyBvZiB0aGUgY2hhbmdlcyBzaW5jZQp0aGUgMS4x
NCByZWxlYXNlOiAgaHR0cHM6Ly9zdWJ2ZXJzaW9uLmFwYWNoZS5vcmcvZG9jcy9yZWxlYXNlLW5v
dGVzLzEuMTUuaHRtbAoKIFVzZXItdmlzaWJsZSBjaGFuZ2VzOgogIC0gTWFqb3IgbmV3IGZlYXR1
cmVzOgoKICAtIE1pbm9yIG5ldyBmZWF0dXJlcyBhbmQgaW1wcm92ZW1lbnRzOgogIC0gQ2xpZW50
LXNpZGUgaW1wcm92ZW1lbnRzIGFuZCBidWdmaXhlczoKICAtIFNlcnZlci1zaWRlIGltcHJvdmVt
ZW50cyBhbmQgYnVnZml4ZXM6CiAgLSBPdGhlciB0b29sIGltcHJvdmVtZW50cyBhbmQgYnVnZml4
ZXM6CgogRGV2ZWxvcGVyLXZpc2libGUgY2hhbmdlczoKICAtIEdlbmVyYWw6CgogIC0gQmluZGlu
Z3M6CiAgLSBTZXJ2ZXItc2lkZSBidWdmaXhlczoKLS0tCiAuLi4tZml4LXN2bi1yZXZpc2lvbi1o
b3N0LWNvbnRhbWluYXRpb24ucGF0Y2ggfCAgOSArKy0tCiAuLi4vc3VidmVyc2lvbi9zdWJ2ZXJz
aW9uL3BhcmFsbGVsLnBhdGNoICAgICAgfCAxOSArKysrLS0tCiAuLi4vc3VidmVyc2lvbi9zdWJ2
ZXJzaW9uL3NlcmZtYWNyby5wYXRjaCAgICAgfCAxMiArKystLQogLi4udmVyc2lvbl8xLjE0LjUu
YmIgPT4gc3VidmVyc2lvbl8xLjE1LjAuYmJ9IHwgNTMgKysrKysrKysrKysrKysrKysrLQogNCBm
aWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVyc2lvbi97c3VidmVyc2lvbl8xLjE0LjUuYmIgPT4g
c3VidmVyc2lvbl8xLjE1LjAuYmJ9ICg2MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi8wMDAxLWZpeC1zdm4tcmV2aXNpb24taG9zdC1j
b250YW1pbmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3Vi
dmVyc2lvbi8wMDAxLWZpeC1zdm4tcmV2aXNpb24taG9zdC1jb250YW1pbmF0aW9uLnBhdGNoCmlu
ZGV4IDk3NDFhNjQ5OWMuLmNmY2YwOTBjZTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vMDAwMS1maXgtc3ZuLXJldmlzaW9uLWhvc3QtY29u
dGFtaW5hdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVyc2lvbi9z
dWJ2ZXJzaW9uLzAwMDEtZml4LXN2bi1yZXZpc2lvbi1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDU0YjJjZjQ0NDQ1ODIwZWE3YzMyNTBhMjVlZDk1N2EzODlh
YWZiZDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ4ZjE4Yjg1ZTAxN2Y3ZmNmZmZh
ZWI0NmNmYmY2Y2MwN2NlMTM3NmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIYWl4
aWFvIFlhbiA8aGFpeGlhby55YW4uY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjggTWF5
IDIwMjYgMDk6MjA6NTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYnVpbGQ6IGRvIG5vdCBydW4g
c3ZudmVyc2lvbiBkdXJpbmcgaW5zdGFsbApAQCAtMjMsMTAgKzIzLDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IEhhaXhpYW8gWWFuIDxoYWl4aWFvLnlhbi5jbkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01h
a2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDdmMGEzN2RkOWE5Yi4uOTE0YzFjMzc3OTBj
IDEwMDY0NAoraW5kZXggYmVhM2EzNS4uOTJjYTNhMCAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmlu
CiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTQ5OSwxMCArNDk5LDcgQEAgbG9jYWwtaW5zdGFsbDog
QElOU1RBTExfUlVMRVNACitAQCAtNTAwLDEwICs1MDAsNyBAQCBsb2NhbC1pbnN0YWxsOiBASU5T
VEFMTF9SVUxFU0AKICByZXZpc2lvbi1pbnN0YWxsOgogIAl0ZXN0IC1kICQoREVTVERJUikkKGlu
Y2x1ZGVkaXIpL3N1YnZlcnNpb24tMSB8fCBcCiAgCSAgJChNS0RJUikgJChERVNURElSKSQoaW5j
bHVkZWRpcikvc3VidmVyc2lvbi0xCkBAIC0zOCw2ICszOCwzIEBAIGluZGV4IDdmMGEzN2RkOWE5
Yi4uOTE0YzFjMzc3OTBjIDEwMDY0NAogIAogIGluc3RhbGwtc3RhdGljOiBASU5TVEFMTF9TVEFU
SUNfUlVMRVNACiAgCi0tLSAKLTIuNTMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3VidmVyc2lvbi9zdWJ2ZXJzaW9uL3BhcmFsbGVsLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbi9wYXJhbGxlbC5wYXRjaAppbmRleCAxZmVl
MTUyM2VlLi5hZDBiYWJlMDM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3Vi
dmVyc2lvbi9zdWJ2ZXJzaW9uL3BhcmFsbGVsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vcGFyYWxsZWwucGF0Y2gKQEAgLTEsNCArMSw4IEBA
Ci1FbnN1cmUgdGhhdCBkaXJlY3RvcmllcyBhcmUgY3JlYXRlZCBiZWZvcmUgZmlsZXMgYXJlIGNv
bXBpbGVkIGludG8gdGhlbS4KK0Zyb20gYTBhYWQ1OWUwNjhiNmVkODUyZGIzOGNmMjZjNWQ4NjJj
ZTBlYzJhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPgorRGF0ZTogVGh1LCA1IE1hciAyMDI2IDExOjUxOjMwICswMDAwCitT
dWJqZWN0OiBbUEFUQ0hdIEVuc3VyZSB0aGF0IGRpcmVjdG9yaWVzIGFyZSBjcmVhdGVkIGJlZm9y
ZSBmaWxlcyBhcmUgY29tcGlsZWQKKyBpbnRvIHRoZW0uCiAKIFRoaXMgaXMgYSBoYWNreSB3b3Jr
YXJvdW5kLCB1cHN0cmVhbSBoYXZlIGJlZW4gaW5mb3JtZWQgYW5kIGEgYmV0dGVyCiBzb2x1dGlv
biBwcm9wb3NlZDoKQEAgLTcsMTIgKzExLDE1IEBAIGh0dHBzOi8vbGlzdHMuYXBhY2hlLm9yZy90
aHJlYWQvbnIwdzhoY3ByOW15MmdreXMwOWtqODlybHhnZDg0b2YKIAogVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFtkaXNjdXNzaW9uIHVwc3RyZWFtXQogU2lnbmVkLW9mZi1ieTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CistLS0KKyBNYWtlZmlsZS5pbiB8IDQgKysr
LQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAotZGlm
ZiAtLWdpdCBpL01ha2VmaWxlLmluIHcvTWFrZWZpbGUuaW4KLWluZGV4IDBmYjllMzk2MDIuLjhi
YWUyY2MzZDIgMTAwNjQ0Ci0tLS0gaS9NYWtlZmlsZS5pbgotKysrIHcvTWFrZWZpbGUuaW4KLUBA
IC00MjQsNyArNDI0LDkgQEAgRUNIT19OID0gQEVDSE9fTkAKK2RpZmYgLS1naXQgYS9NYWtlZmls
ZS5pbiBiL01ha2VmaWxlLmluCitpbmRleCA5ODNmM2QxLi5iZWEzYTM1IDEwMDY0NAorLS0tIGEv
TWFrZWZpbGUuaW4KKysrKyBiL01ha2VmaWxlLmluCitAQCAtNDE5LDcgKzQxOSw5IEBAIEVDSE9f
TiA9IEBFQ0hPX05ACiAgCiAgVEVTVFMgPSAkKFRFU1RfUFJPR1JBTVMpIEBCREJfVEVTVF9QUk9H
UkFNU0AKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1
YnZlcnNpb24vc2VyZm1hY3JvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNp
b24vc3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2gKaW5kZXggNTA3ZGUwZjA4Yi4uYjE2YTBjODY2
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lv
bi9zZXJmbWFjcm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24v
c3VidmVyc2lvbi9zZXJmbWFjcm8ucGF0Y2gKQEAgLTEsMyArMSw4IEBACitGcm9tIGQ4ZjIxMzY2
ZDJiOWJkNzJmYWYwNzgwOTlkNGJhODE0NjM5NmFjNTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CitEYXRlOiBXZWQs
IDcgRGVjIDIwMTYgMTM6NTQ6MTggKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gc3VidmVyc2lvbjog
Rml4IGlzc3VlcyBpbiBMREZMQUdTIHNlZCBtYW5pcHVsYXRpb24KKwogVGhlIGV4aXN0aW5nIHNl
ZCBleHByZXNzaW9uIGNhbiBtYXRjaCBleHByZXNzaW9ucyBsaWtlCiAtLXN5c3Jvb3Q9L3NvbWUv
cGF0aC94eHgtbGludXgvIHdoaWNoIGNsZWFybHkgaXNuJ3QgaW50ZW5kZWQgYW5kIGluamVjdHMK
IGluY29ycmVjdCBwYXRocyBpbnRvIExERkxBR1MuCkBAIC0xNCwxMCArMTksMTAgQEAgU2lnbmVk
LW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvYnVp
bGQvYWMtbWFjcm9zL3NlcmYubTQgYi9idWlsZC9hYy1tYWNyb3Mvc2VyZi5tNAotaW5kZXggMGE1
NDliMy4uM2EwNjlhYyAxMDA2NDQKK2luZGV4IDQ2Mzc0MzAuLjEyNmViNzQgMTAwNjQ0CiAtLS0g
YS9idWlsZC9hYy1tYWNyb3Mvc2VyZi5tNAogKysrIGIvYnVpbGQvYWMtbWFjcm9zL3NlcmYubTQK
LUBAIC0xNzEsNyArMTcxLDcgQEAgQUNfREVGVU4oU1ZOX1NFUkZfUEtHX0NPTkZJRywKK0BAIC0x
ODUsNyArMTg1LDcgQEAgQUNfREVGVU4oU1ZOX1NFUkZfUEtHX0NPTkZJRywKICAgICAgICAgICAg
U1ZOX1NFUkZfSU5DTFVERVM9W2AkUEtHX0NPTkZJRyAkc2VyZl9wY19hcmcgLS1jZmxhZ3Mtb25s
eS1JYF0KICAgICAgICAgICAgU1ZOX1NFUkZfTElCUz1bYCRQS0dfQ09ORklHICRzZXJmX3BjX2Fy
ZyAtLWxpYnMtb25seS1sYF0KICAgICAgICAgICAgZG5sIGRvbid0IHVzZSAtLWxpYnMtb25seS1M
IGJlY2F1c2UgdGhlbiB3ZSBtaWdodCBtaXNzIHNvbWUgb3B0aW9ucwpAQCAtMjYsNiArMzEsMyBA
QCBpbmRleCAwYTU0OWIzLi4zYTA2OWFjIDEwMDY0NAogICAgICAgICAgICBicmVhawogICAgICAg
ICAgZWxzZQogICAgICAgICAgICBBQ19NU0dfUkVTVUxUKFtub10pCi0tLSAKLTIuNy40Ci0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb25fMS4x
NC41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE1
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA2MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb25fMS4xNS4wLmJiCmluZGV4IGY2YTViOTk1
MGYuLmE3MGUxZjgxM2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJz
aW9uL3N1YnZlcnNpb25fMS4xNC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2
ZXJzaW9uL3N1YnZlcnNpb25fMS4xNS4wLmJiCkBAIC0xLDkgKzEsNTggQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0zNjcsMzUgKzM2Nyw2IEBA
CisjICAgKiAgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQg
T0YgVEhFIFVTRSBPRiBUSElTCisjICAgKiAgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRiBU
SEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjICAKKyMgLUZvciB0aGUgKG1vZGlmaWVk
KSAnbGluZW5vaXNlJyBsaWJyYXJ5IGluIHRvb2xzL2Rldi9zdm5tb3Zlci9saW5lbm9pc2UKKyMg
LQorIyAtICBDb3B5cmlnaHQgKGMpIDIwMTAtMjAxNCwgU2FsdmF0b3JlIFNhbmZpbGlwcG8gPGFu
dGlyZXogYXQgZ21haWwgZG90IGNvbT4KKyMgLSAgQ29weXJpZ2h0IChjKSAyMDEwLTIwMTMsIFBp
ZXRlciBOb29yZGh1aXMgPHBjbm9vcmRodWlzIGF0IGdtYWlsIGRvdCBjb20+CisjIC0KKyMgLSAg
QWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgLQorIyAtICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGlu
IHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgLSAgbW9kaWZpY2F0
aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
IGFyZSBtZXQ6CisjIC0KKyMgLSAgKiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVz
dCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UsCisjIC0gICAgdGhpcyBsaXN0IG9m
IGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KKyMgLQorIyAtICAqIFJl
ZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29w
eXJpZ2h0IG5vdGljZSwKKyMgLSAgICB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZv
bGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZSBkb2N1bWVudGF0aW9uCisjIC0gICAgYW5kL29yIG90
aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0KKyMgLSAg
VEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENP
TlRSSUJVVE9SUworIyAtICAiQVMgSVMiIEFORCBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJB
TlRJRVMsIElOQ0xVRElORywgQlVUIE5PVAorIyAtICBMSU1JVEVEIFRPLCBUSEUgSU1QTElFRCBX
QVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUworIyAtICBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UgQVJFIERJU0NMQUlNRUQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBDT1BZ
UklHSFQKKyMgLSAgT1dORVIgT1IgQ09OVFJJQlVUT1JTIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVD
VCwgSU5ESVJFQ1QsIElOQ0lERU5UQUwsCisjIC0gIFNQRUNJQUwsIEVYRU1QTEFSWSwgT1IgQ09O
U0VRVUVOVElBTCBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRAorIyAtICBUTywg
UFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUiBTRVJWSUNFUzsgTE9TUyBPRiBVU0Us
IERBVEEsIE9SCisjIC0gIFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZF
UiBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkgT0YKKyMgLSAgTElBQklMSVRZLCBXSEVUSEVSIElO
IENPTlRSQUNULCBTVFJJQ1QgTElBQklMSVRZLCBPUiBUT1JUIChJTkNMVURJTkcKKyMgLSAgTkVH
TElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBPVVQgT0YgVEhFIFVTRSBP
RiBUSElTCisjIC0gIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZ
IE9GIFNVQ0ggREFNQUdFLgorIyAtCisjICBGb3IgdGhlIChtb2RpZmllZCkgTFo0IGxpYnJhcnkg
ZmlsZXMgaW4gc3VidmVyc2lvbi9saWJzdm5fc3Vici9sejQKKyMgIAorIyAgICBMWjQgTGlicmFy
eQorIyAKKyMKKwogU1VNTUFSWSA9ICJTdWJ2ZXJzaW9uIChzdm4pIHZlcnNpb24gY29udHJvbCBz
eXN0ZW0gY2xpZW50IgogSE9NRVBBR0UgPSAiaHR0cDovL3N1YnZlcnNpb24uYXBhY2hlLm9yZyIK
IERFU0NSSVBUSU9OID0gIlN1YnZlcnNpb24gaXMgYW4gb3BlbiBzb3VyY2UgdmVyc2lvbiBjb250
cm9sIHN5c3RlbS4iCiBTRUNUSU9OID0gImNvbnNvbGUvbmV0d29yayIKIExJQ0VOU0UgPSAiQXBh
Y2hlLTIuMCBBTkQgTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
NjQ4N2FlNzA5NGQzNTlmYTkwZmI5YzQwOTZlNTJlMmIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT1kOWM1YjBlMjc5Y2RiMjM4ZDczNWFmNzU1NTRhMzkwMiIKIAogREVQ
RU5EUyA9ICJhcHItdXRpbCBzZXJmIHNxbGl0ZTMgZmlsZSBsejQgZXhwYXQiCiBERVBFTkRTOmFw
cGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGUtcmVwbGFjZW1lbnQtbmF0aXZlIgpAQCAtMTQsNyAr
NjMsNyBAQCBTUkNfVVJJID0gIiR7QVBBQ0hFX01JUlJPUn0vJHtCUE59LyR7QlBOfS0ke1BWfS50
YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZml4LXN2bi1yZXZpc2lvbi1ob3N0LWNv
bnRhbWluYXRpb24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJlNzhhMjllNzc2NmI4YjdiMzU0NDk3ZDA4ZjcxYTU1NjQxYWJjNTM2NzVjZTE4NzU1ODQ3ODFh
YWUzNTY0NGExIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmYjdiMWU1MjcwYzdkZWY5NzFjY2Jk
NTkzOGIwYzAzYjFiNWJkNjBiNjY3NGEyZDhhNzRhOTU2MDgzOWZiOGMiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZyBnZXR0ZXh0IHB5dGhvbjNuYXRpdmUKIAotLSAKMi40Ny4xCgo=

--===============5059106444369236365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/subversion/subversion-locale-ja: PKGSIZE changed from 196537 to 175534 (-11%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-zh-cn: PKGSIZE changed from 274291 to 562416 (+105%)

--===============5059106444369236365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="subversion-changelog.txt"

Version 1.15.0
(21 Sep 2026, from /branches/1.15.x)
https://svn.apache.org/repos/asf/subversion/tags/1.15.0

See the 1.15 release notes for a more verbose overview of the changes since
the 1.14 release:  https://subversion.apache.org/docs/release-notes/1.15.html

 User-visible changes:
  - Major new features:

  - Minor new features and improvements:
  - Client-side improvements and bugfixes:
  - Server-side improvements and bugfixes:
  - Other tool improvements and bugfixes:

 Developer-visible changes:
  - General:

  - Bindings:
  - Server-side bugfixes:

--===============5059106444369236365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/subversion: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion: SRC_URI changed from "https://archive.apache.org/dist/subversion/subversion-1.14.5.tar.bz2 file://serfmacro.patch file://parallel.patch file://0001-fix-svn-revision-host-contamination.patch" to "https://archive.apache.org/dist/subversion/subversion-1.15.0.tar.bz2 file://serfmacro.patch file://parallel.patch file://0001-fix-svn-revision-host-contamination.patch"
packages/x86-64-v3-poky-linux/subversion/subversion-dbg: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-dbg: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-dbg: PKGSIZE changed from 16177064 to 16253400 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-dev: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-dev: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-dev: PKGSIZE changed from 1810470 to 1835552 (+1%)
packages/x86-64-v3-poky-linux/subversion/subversion-doc: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-doc: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-doc: PKGSIZE changed from 25001 to 25017 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-de: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-de: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-de: PKGSIZE changed from 353591 to 353597 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-es: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-es: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-fr: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-fr: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-fr: PKGSIZE changed from 399800 to 399808 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-it: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-it: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-it: PKGSIZE changed from 182873 to 182813 (-0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-ja: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-ja: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-ja: PKGSIZE changed from 196537 to 175534 (-11%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-ko: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-ko: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-ko: PKGSIZE changed from 236291 to 236293 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-nb: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-nb: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-nb: PKGSIZE changed from 241482 to 241484 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-pl: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-pl: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-pl: PKGSIZE changed from 203056 to 203058 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-pt-br: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-pt-br: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-sv: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-sv: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-sv: PKGSIZE changed from 588023 to 611526 (+4%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-zh-cn: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-zh-cn: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-locale-zh-cn: PKGSIZE changed from 274291 to 562416 (+105%)
packages/x86-64-v3-poky-linux/subversion/subversion-locale-zh-tw: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-locale-zh-tw: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-src: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-src: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion-src: FILELIST: directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_fs_x -> /usr/src/debug/subversion/1.15.0/subversion/libsvn_fs_x, directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_repos -> /usr/src/debug/subversion/1.15.0/subversion/libsvn_repos, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnadmin -> /usr/src/debug/subversion/1.15.0/subversion/svnadmin, directory renamed /usr/src/debug/subversion/1.14.5/subversion/include -> /usr/src/debug/subversion/1.15.0/subversion/include, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnfsfs -> /usr/src/debug/subversion/1.15.0/subversion/svnfsfs, directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_fs -> /usr/src/debug/subversion/1.15.0/subversion/libsvn_fs, directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/utf8proc -> /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/utf8proc,
  directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnmucc -> /usr/src/debug/subversion/1.15.0/subversion/svnmucc, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svn -> /usr/src/debug/subversion/1.15.0/subversion/svn, directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_fs_fs -> /usr/src/debug/subversion/1.15.0/subversion/libsvn_fs_fs, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnbench -> /usr/src/debug/subversion/1.15.0/subversion/svnbench, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svndumpfilter -> /usr/src/debug/subversion/1.15.0/subversion/svndumpfilter, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnlook -> /usr/src/debug/subversion/1.15.0/subversion/svnlook, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnsync -> /usr/src/debug/subversion/1.15.0/subversion/svnsync, directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_fs_util -> /usr/src/debug/sub
 version/1.15.0/subversion/libsvn_fs_util, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnversion -> /usr/src/debug/subversion/1.15.0/subversion/svnversion, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnrdump -> /usr/src/debug/subversion/1.15.0/subversion/svnrdump, directory renamed /usr/src/debug/subversion/1.14.5/subversion/svnserve -> /usr/src/debug/subversion/1.15.0/subversion/svnserve, directory renamed /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/lz4 -> /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/lz4, removed "/usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/simple_providers.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/ctype.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/prompt.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/diff_memory.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/add.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/debug.c /usr/src/debug
 /subversion/1.14.5/subversion/libsvn_delta/xdelta.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/marshal.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/diff_editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/config_impl.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/branch_nested.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/ambient_depth_filter_editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_local/ra_plugin.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_object_pool.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/merge_elements.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/branch_compat.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/user.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/crypto.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/crypto.c /usr/src/debug/subve
 rsion/1.14.5/subversion/include/private/svn_client_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/xml.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/path_driver.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/hash.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/version.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/wrapper_template.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_fspath.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/cat.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_io_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/spillbuf.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_local/split_url.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_diff_tree.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/questions.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/getlocks.c /usr/src/debug/subversion/1.14.5/s
 ubversion/libsvn_wc/translate.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/translate.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/encode.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/fnv1a.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/config_keys.inc /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/fnv1a.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/username_providers.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_eol_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/stream.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/branch_migrate.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/mtcc.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/sqlite.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_dirent_uri_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/com
 pat.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache_config.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/log.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/branch_repos.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/properties.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db_private.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_repos_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/token.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/token.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/externals.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/list.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_ra_svn_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wcroot_anchor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/compat.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/token-map.h /usr/src/debug/subversion
 /1.14.5/subversion/libsvn_wc/upgrade.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/wc_editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/ctx.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/subst.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/auth.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/copy.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/compress_zlib.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/auth.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/revert.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/old-and-busted.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/inherited_props.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_client_mtcc.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/ra_serf.h /usr/src/d
 ebug/subversion/1.14.5/subversion/libsvn_subr/sorts.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/merge.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/url.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_cert.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/error.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/getlocations.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/branch.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/prefix_string.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/getlocationsegments.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_sorts_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/mergeinfo.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/adm_crawler.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/mergeinfo.h /usr/src/debug/subversion/1.14.5/subversio
 n/libsvn_diff/parse-diff.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/property.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/diff3.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/time.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/log.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/utf_validate.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/context.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/text_delta.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/diff.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache-inprocess.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/eol.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/nls.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/lock.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/include/p
 rivate/svn_adler32.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/deprecated.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/object_pool.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_cmdline_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/streams.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/config_win.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/compose_delta.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/lock.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/copy.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/diff.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/opt.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/lock.c /usr/src/debug/subversion/1.14.5/
 subversion/libsvn_diff/diff.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/opt.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_branch.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/diff_file.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/relocate.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/diff_tree.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/list.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/lock.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/serf.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/stat.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/util.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/config_file.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/dso.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/quoprint.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/stream_bucket.c /usr/src/debug/subversi
 on/1.14.5/subversion/libsvn_ra_serf/multistatus.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/tree_conflicts.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/tree_conflicts.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/apr_escape.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_branch_compat.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_client_shelf2.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/path.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/xml.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_config_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/blame.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/merge.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/patch.c /usr/src/debug/subversion/1.14.5/subversion/l
 ibsvn_client/shelf.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_element.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_mutex.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_delta_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db_util.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/log.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/pool.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/conflicts.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/get_lock.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/config_auth.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_fs_fs_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/default_editor.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_error_private.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_utf_private.h /usr/src/debug/subversion/1.14.5/s
 ubversion/libsvn_delta/version.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db_wcroot.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/debug_reporter.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/status.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/workqueue.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/workqueue.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_mergeinfo_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/magic.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/sb_bucket.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/prop_commands.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/validate.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_subr_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/revert.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/shelf2.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/up
 date_editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/changelist.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_branch_nested.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/io.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/checkout.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/binary_diff.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_client_shelf.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/cmdline.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/upgrade.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/commit_util.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/diff.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/utf8proc.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/gpg_agent.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/x509parse.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache-null.c /usr/src
 /debug/subversion/1.14.5/subversion/libsvn_wc/delete.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/bit_array.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_sqlite.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_editor.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/info.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/get_deleted_rev.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/commit.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/get_file.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/temp_serializer.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/packed_data.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/ra_svn.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/client.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/element.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/getdate.c /usr/src/debug/subversion/1.14.5/s
 ubversion/libsvn_delta/delta.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/base64.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/mergeinfo.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/iter.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/version.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/win32_crypto.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/info.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/wrapped_sasl.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_token.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/internal_auth.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/md5.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/blncache.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/utf_width.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/blncache.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/util.c /usr/src/debug/sub
 version/1.14.5/subversion/libsvn_subr/compress_lz4.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_local/ra_local.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/atomic.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache-membuffer.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/win32_xlate.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_diff_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/types.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/node.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_packed_data.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/utf.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db_update_move.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/externals.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_opt_private.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_wc_private.h /usr/src/debug/subver
 sion/1.14.5/subversion/libsvn_subr/dirent_uri.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/dirent_uri.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/diff_local.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/root_pools.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/revisions.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/util_error.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/config.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/debug_editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/sqlite3wrapper.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/ssl_server_trust_providers.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/status.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/switch.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/update.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/commit.c /usr/src/debug/subversion/1.14.5/subver
 sion/include/private/svn_string_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/delete.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/export.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/import.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/iprops.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/layout.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/client.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/ssl_client_cert_providers.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/options.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/ra.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/x509.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/ssl_client_cert_pw_providers.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/cyrus_auth.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/revision_status.c /usr/src/debug/subversion/1.14.5/subversion/
 libsvn_diff/diff4.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/date.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_branch_impl.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/adm_ops.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/repos_diff.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/deprecated.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/wc_db_pristine.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/win32_crashrpt.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_log.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_ra_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/resolved.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_auth_private.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_skel.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_su
 br/target.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/editorp.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/adm_files.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/version.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/adler32.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/adm_files.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_temp_serializer.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/svndiff.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/lcs.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/string.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/props.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/cancel.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/compat.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_delta/depth_filter_editor.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/props.h /usr/src/debug/subversion/1.14.5/subvers
 ion/libsvn_subr/macos_keychain.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cache-memcache.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/skel.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/request_body.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/compat_providers.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_branch_repos.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/replay.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/blame.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/merge.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/cmdline.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/diff_summarize.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_fs_util.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/entries.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/entries.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_su
 br/checksum.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/ra_loader.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/checksum.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/ra_loader.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/crop.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_atomic.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra/util.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/util.c /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_magic.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/conflicts.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/locking_commands.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/eagain_bucket.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_svn/cram.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_diff/util.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/mergeinfo.c /usr/src/debug/subversion/1.14.5/subver
 sion/libsvn_subr/x509info.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/conflicts.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_ra_serf/update.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/sysinfo.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_cache.h /usr/src/debug/subversion/1.14.5/subversion/include/private/svn_fs_private.h /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/sysinfo.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/relocate.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_wc/cleanup.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/cleanup.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_client/diff_local.c /usr/src/debug/subversion/1.14.5/subversion/libsvn_subr/mutex.c", added "/usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/simple_providers.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/ctype.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/prompt.c /usr/src/
 debug/subversion/1.15.0/subversion/libsvn_diff/diff_memory.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/add.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/debug.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/xdelta.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/marshal.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/diff_editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/config_impl.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/deprecated.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/ambient_depth_filter_editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_local/ra_plugin.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_object_pool.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/user.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/crypto.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/crypto.c /usr/src/debug/subversion/1.15.0/subve
 rsion/include/private/svn_client_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/xml.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/path_driver.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/hash.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/version.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/wrapper_template.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_fspath.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/cat.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/working_file_writer.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_io_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/ra_init.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/xml_stream.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/spillbuf.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_local/split_url.c /usr/src/debug/subversion/1.15.0/subversion/includ
 e/private/svn_diff_tree.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/questions.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/getlocks.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/translate.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/xml_escape.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/textbase.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/translate.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/encode.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/fnv1a.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/config_keys.inc /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/fnv1a.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/username_providers.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_eol_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/stream.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/mtcc.c /usr/src/debug/
 subversion/1.15.0/subversion/libsvn_delta/editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/sqlite.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_dirent_uri_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/compat.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache_config.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/log.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/properties.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db_private.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_repos_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff_tree_tee.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/token.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/token.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/externals.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/list.c /usr/src/debug/subversion/1.15.0/subversion/i
 nclude/private/svn_ra_svn_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wcroot_anchor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/compat.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/token-map.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/upgrade.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/wc_editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/ctx.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/deprecated.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/subst.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/auth.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/copy.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/compress_zlib.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/auth.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/revert.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/editor.c /usr/src/debug/subversion/1.15.0/subversion/l
 ibsvn_wc/old-and-busted.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/inherited_props.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_client_mtcc.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/ra_serf.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/sorts.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/merge.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/url.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_cert.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/error.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/getlocations.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/prefix_string.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/getlocationsegments.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_sorts_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_clien
 t/mergeinfo.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/adm_crawler.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/mergeinfo.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/parse-diff.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/property.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff3.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/time.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/task.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/log.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/utf_validate.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/context.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/text_delta.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/diff.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache-inprocess.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/eol.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_s
 ubr/nls.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/lock.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/deprecated.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_adler32.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/deprecated.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/object_pool.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_cmdline_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/opt_subcommand.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/deprecated.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/streams.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/config_win.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/compose_delta.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/lock.h /usr/src/debug/subver
 sion/1.15.0/subversion/libsvn_client/copy.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/opt.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/lock.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/opt.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/diff_patch.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/relocate.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff_file.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff_tree.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/list.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/lock.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/serf.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/stat.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/util.c /usr/src/debug/subversion/1.15.0/sub
 version/libsvn_subr/config_file.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/dso.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/quoprint.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/stream_bucket.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/multistatus.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/tree_conflicts.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/tree_conflicts.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/apr_escape.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_client_shelf2.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/path.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/xml.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_config_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/blam
 e.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/merge.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/patch.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/shelf.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_mutex.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_delta_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db_util.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/log.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/pool.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/conflicts.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/get_lock.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/config_auth.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_fs_fs_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/default_editor.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_error_private.h /usr/
 src/debug/subversion/1.15.0/subversion/include/private/svn_utf_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/version.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db_wcroot.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/debug_reporter.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/status.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/workqueue.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/workqueue.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_mergeinfo_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/magic.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/sb_bucket.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/prop_commands.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/validate.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_subr_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/textbase.h /usr/src/debug/sub
 version/1.15.0/subversion/libsvn_client/revert.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/shelf2.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/textbase.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_thread_cond.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/update_editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/changelist.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/io.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/checkout.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/binary_diff.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_client_shelf.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/cmdline.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/upgrade.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/commit_util.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/diff.c /usr/src/debug/subversion/1.15.0/subversion/l
 ibsvn_subr/utf8proc.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/gpg_agent.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/x509parse.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache-null.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/delete.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/bit_array.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_sqlite.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_editor.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/info.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/get_deleted_rev.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/commit.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/get_file.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/temp_serializer.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/packed_data.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/ra_svn.h /u
 sr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/client.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/getdate.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cmdline_editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/delta.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/base64.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/mergeinfo.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/iter.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/version.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/win32_crypto.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/info.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/wrapped_sasl.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_task.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_token.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/internal_auth.c /usr/src/debug/subversion/1.15.0/subversi
 on/libsvn_subr/md5.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/blncache.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/utf_width.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/blncache.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/util.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/compress_lz4.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_local/ra_local.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/atomic.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache-membuffer.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/win32_xlate.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_diff_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/types.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/node.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_packed_data.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/utf.c /usr/src
 /debug/subversion/1.15.0/subversion/libsvn_wc/wc_db_update_move.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/externals.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_opt_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/thread_cond.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_wc_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/dirent_uri.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/dirent_uri.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/diff_local.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff_tree_debug.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/root_pools.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/revisions.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/util_error.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/config.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/debug_editor.c /usr/src/
 debug/subversion/1.15.0/subversion/libsvn_subr/sqlite3wrapper.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_waitable_counter.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/ssl_server_trust_providers.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/status.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/switch.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/update.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/commit.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_string_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/delete.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/export.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/import.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/iprops.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/layout.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/client.h /usr/src/debug
 /subversion/1.15.0/subversion/libsvn_diff/diff_tree_reverse.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/ssl_client_cert_providers.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/options.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/ra.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/x509.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/ssl_client_cert_pw_providers.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/cyrus_auth.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/revision_status.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff4.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/date.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff_tree_copy_as_changed.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/adm_ops.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/repos_diff.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/deprecated.c /usr/src/de
 bug/subversion/1.15.0/subversion/libsvn_subr/deprecated.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db_pristine.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/win32_crashrpt.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_log.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_ra_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/resolved.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_auth_private.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_skel.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/target.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/editorp.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/opt_revision.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/adm_files.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/version.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/adler32.c /usr/src/debug/subversion
 /1.15.0/subversion/libsvn_wc/adm_files.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_temp_serializer.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/ra_init.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/svndiff.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/lcs.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/string.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/props.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/cancel.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/compat.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_delta/depth_filter_editor.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/props.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/macos_keychain.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cache-memcache.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/skel.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/request_b
 ody.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/compat_providers.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/replay.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/blame.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/merge.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/cmdline.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/diff_summarize.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_fs_util.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/entries.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/entries.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/checksum.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_local/ra_init.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/ra_loader.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/checksum.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/ra_loader.c /usr/src/debug/subversion/1.15.0/
 subversion/libsvn_wc/crop.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_atomic.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra/util.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/util.c /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_magic.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/conflicts.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/locking_commands.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/eagain_bucket.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_svn/cram.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/util.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/mergeinfo.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/x509info.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/conflicts.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_ra_serf/update.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/sysinfo.h /usr/src/debug/sub
 version/1.15.0/subversion/include/private/svn_cache.h /usr/src/debug/subversion/1.15.0/subversion/include/private/svn_fs_private.h /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/sysinfo.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/relocate.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/wc_db_textbase.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_wc/cleanup.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/cleanup.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/waitable_counter.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_diff/diff_tree_filter.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_client/diff_local.c /usr/src/debug/subversion/1.15.0/subversion/libsvn_subr/mutex.c"
packages/x86-64-v3-poky-linux/subversion/subversion-src: PKGSIZE changed from 20044572 to 20082566 (+0%)
packages/x86-64-v3-poky-linux/subversion/subversion-staticdev: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion-staticdev: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion: PV changed from "1.14.5" to "1.15.0"
packages/x86-64-v3-poky-linux/subversion/subversion: PKGV changed from 1.14.5 [default] to 1.15.0 [default]
packages/x86-64-v3-poky-linux/subversion/subversion: PKGSIZE changed from 5323815 to 5348391 (+0%)

--===============5059106444369236365==--

