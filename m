Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86B8F428F0
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19746.1776261886253508270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K08s0Tll;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ef1GPBdx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d91756eaa-d9a07d6d-53c0-4c39-90b4-ff998c3f2db9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YXraoKGzGLhNBfIR2Dz0EPc7wIr17B2ZarM9rGgGm8w=;
	b=K08s0TlliqfZQi13NlS1clS93MV6+vYRrPO2QRTv2VmVUpFRZbljCTRJfhu+ge33
	dId6OKM9vWSMBbJ4WHFRdWynFa4Bkt80MpLVK2is6n8AoFse2OZiNpx74hLN5kb0hbR
	HEX6eIN4j20sPAdK0UG9ao0ID1JAlKenrieKYhjI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YXraoKGzGLhNBfIR2Dz0EPc7wIr17B2ZarM9rGgGm8w=;
	b=Ef1GPBdxCxt5VCc4zTh9jUmV/rIJi2JKH9niBG2l1MVuazAlWLWwUlmqp3L3CYQf
	aWTc5goj9eoTa+zlKLu3GmucnGEEQAoFLS/zCSQCIkn//uEP+vm6dKFUy+bGpe2Z7Ui
	+eLEiFoAR7w6WH1toRhk0R2yF8nSHjCixJtJKQPI=
Content-Type: multipart/mixed; boundary="===============0505166230225355816=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] groff: upgrading to 1.24.1 SUCCEEDED
Message-ID: <0101019d91756eaa-d9a07d6d-53c0-4c39-90b4-ff998c3f2db9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235263

--===============0505166230225355816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *groff* to *1.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-groff-upgrade-1.24.0-1.24.1.patch
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
From 5d29e980fcd5fa03c053a91114fdac94b2faa8d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:58:37 +0000
Subject: [PATCH] groff: upgrade 1.24.0 -> 1.24.1

---
 .../files/0001-Make-manpages-mulitlib-identical.patch |  7 +++----
 ...ix-test-groff-not-found-in-cross-compilation.patch |  5 +----
 ...se-SOURCE_DATE_EPOCH-for-reproducible-builds.patch |  7 ++-----
 .../files/groff-not-search-fonts-on-build-host.patch  | 11 ++++++-----
 .../groff/{groff_1.24.0.bb => groff_1.24.1.bb}        |  2 +-
 5 files changed, 13 insertions(+), 19 deletions(-)
 rename meta/recipes-extended/groff/{groff_1.24.0.bb => groff_1.24.1.bb} (96%)

diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
index 6dc84c9062..a0ce805ea8 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -1,20 +1,19 @@
-From aa1f37f1e0ff0dc0eeb199b52959e0deb275721e Mon Sep 17 00:00:00 2001
+From 1dcb852eb256ee40ffe1e6fc8468eb281e4a74ea Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
 
 Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index f7ab410..7e1f3fb 100644
+index e75d5d6..4195c15 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -891,7 +891,7 @@ SUFFIXES += .man
+@@ -858,7 +858,7 @@ SUFFIXES += .man
  	     -e "s|[@]PAGE[@]|\\\\%$(PAGE)|g" \
  	     -e "s|[@]PDFDOCDIR[@]|`echo $(pdfdocdir) | sed -f $(makevarescape)`|g" \
  	     -e "s|[@]PSPRINT[@]|`echo $(PSPRINT) | sed -f $(makevarescape)`|g" \
diff --git a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
index e9214519e7..199201872f 100644
--- a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
+++ b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
@@ -1,4 +1,4 @@
-From c0f835a59d7b33452f280c8a73c3214e0a3a3d9f Mon Sep 17 00:00:00 2001
+From 47f613a515b684d30201e96c03e7d02c5b115b73 Mon Sep 17 00:00:00 2001
 From: Zhang Peng <peng.zhang1.cn@windriver.com>
 Date: Fri, 6 Mar 2026 05:18:33 +0000
 Subject: [PATCH] groff: fix test-groff not found in cross-compilation
@@ -77,6 +77,3 @@ index a65898a..9c6a8b6 100644
  
 -exec $builddir/groff "$@"
 +exec $GROFF_BIN_PATH/groff "$@"
--- 
-2.51.2
-
diff --git a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch b/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
index 8ab3668edc..354c1d6778 100644
--- a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
+++ b/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
@@ -1,4 +1,4 @@
-From f28f0c4d8dfdfb1c173d21df6ffbe35448fada9f Mon Sep 17 00:00:00 2001
+From 8089607540320577cc950190e08f536542d39c82 Mon Sep 17 00:00:00 2001
 From: Zhang Peng <peng.zhang1.cn@windriver.com>
 Date: Mon, 9 Mar 2026 20:10:00 +0800
 Subject: [PATCH] gropdf: use SOURCE_DATE_EPOCH for reproducible builds
@@ -17,7 +17,7 @@ Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
-index f519a53..3a79b4c 100644
+index 3658cc6..de825e2 100644
 --- a/src/devices/gropdf/gropdf.pl
 +++ b/src/devices/gropdf/gropdf.pl
 @@ -30,6 +30,13 @@ use POSIX qw(mktime);
@@ -34,6 +34,3 @@ index f519a53..3a79b4c 100644
  use constant
  {
      WIDTH    => 0,
--- 
-2.50.0
-
diff --git a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
index 111dbd385e..6b8ae56583 100644
--- a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
+++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
@@ -1,7 +1,8 @@
-From eb16276c3e2e34aa2e57f6a0e68554657b90cd28 Mon Sep 17 00:00:00 2001
+From 71aeede2bd885ba1ceefcb68703715c1ae5308db Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 11 May 2019 17:06:29 +0800
 Subject: [PATCH] groff searchs fonts which are provided by ghostscript on
+
  build host. It causes non-determinism issue. So not search font dirs on host.
 
 Upstream-Status: Inappropriate [cross build specific]
@@ -13,16 +14,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Rebase to 1.24.0
 Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
-
 ---
  font/devpdf/Foundry.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
-index e5aba65..5441734 100644
+index 2760596..3a43aaa 100644
 --- a/font/devpdf/Foundry.in
 +++ b/font/devpdf/Foundry.in
-@@ -23,7 +23,7 @@
+@@ -21,7 +21,7 @@
  
  #=======================================================================
  #Foundry|Name|Search path
@@ -31,7 +31,7 @@ index e5aba65..5441734 100644
  
  # Enable the font description files for grops (generated from Adobe
  # foundry font files) to be used with gropdf.  afmtodit must not be
-@@ -79,7 +79,7 @@ EURO|N||||*../devps/freeeuro.pfa
+@@ -73,7 +73,7 @@ EURO|N||||*../devps/freeeuro.pfa
  # URW fonts are typically shipped with Ghostscript, but can be replaced.
  
  #Foundry|Name|Search path
@@ -39,3 +39,4 @@ index e5aba65..5441734 100644
 +foundry|U|(gs)
  
  # Define flags for afmtodit.
+ 
diff --git a/meta/recipes-extended/groff/groff_1.24.0.bb b/meta/recipes-extended/groff/groff_1.24.1.bb
similarity index 96%
rename from meta/recipes-extended/groff/groff_1.24.0.bb
rename to meta/recipes-extended/groff/groff_1.24.1.bb
index dbc8cdf6d0..c4df5f1b18 100644
--- a/meta/recipes-extended/groff/groff_1.24.0.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"
+SRC_URI[sha256sum] = "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8"
 
 DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"
-- 
2.47.1


--===============0505166230225355816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/groff/groff-doc: FILELIST: directory renamed /usr/share/doc/groff-1.24.0/examples/mm -> /usr/share/doc/groff-1.24.1/examples/mm, directory renamed /usr/share/doc/groff-1.24.0/examples/chem/cstr-122 -> /usr/share/doc/groff-1.24.1/examples/chem/cstr-122, directory renamed /usr/share/doc/groff-1.24.0 -> /usr/share/doc/groff-1.24.1, directory renamed /usr/share/doc/groff-1.24.0/examples/mom -> /usr/share/doc/groff-1.24.1/examples/mom, directory renamed /usr/share/doc/groff-1.24.0/pdf -> /usr/share/doc/groff-1.24.1/pdf, directory renamed /usr/share/doc/groff-1.24.0/html/mom -> /usr/share/doc/groff-1.24.1/html/mom, directory renamed /usr/share/doc/groff-1.24.0/examples -> /usr/share/doc/groff-1.24.1/examples, directory renamed /usr/share/doc/groff-1.24.0/examples/hdtbl -> /usr/share/doc/groff-1.24.1/examples/hdtbl, directory renamed /usr/share/doc/groff-1.24.0/examples/chem -> /usr/share/doc/groff-1.24.1/examples/chem
packages/x86-64-v3-poky-linux/groff/groff: FILELIST: directory renamed /usr/share/groff/1.24.0/font/devlj4/generate -> /usr/share/groff/1.24.1/font/devlj4/generate, directory renamed /usr/share/groff/1.24.0/tmac/mm -> /usr/share/groff/1.24.1/tmac/mm, directory renamed /usr/share/groff/1.24.0/font/devpdf/enc -> /usr/share/groff/1.24.1/font/devpdf/enc, directory renamed /usr/share/groff/1.24.0/font/devpdf/map -> /usr/share/groff/1.24.1/font/devpdf/map, directory renamed /usr/share/groff/1.24.0/font/devlj4 -> /usr/share/groff/1.24.1/font/devlj4, directory renamed /usr/share/groff/1.24.0/tmac -> /usr/share/groff/1.24.1/tmac, directory renamed /usr/share/groff/1.24.0/font/devdvi -> /usr/share/groff/1.24.1/font/devdvi, directory renamed /usr/share/groff/1.24.0/font/devhtml -> /usr/share/groff/1.24.1/font/devhtml, directory renamed /usr/share/groff/1.24.0/oldfont/devps -> /usr/share/groff/1.24.1/oldfont/devps, directory renamed /usr/share/groff/1.24.0/font/devps -> /usr/share/groff/1.24.1/f
 ont/devps, directory renamed /usr/share/groff/1.24.0/font/devps/generate -> /usr/share/groff/1.24.1/font/devps/generate, directory renamed /usr/share/groff/1.24.0/font/devdvi/generate -> /usr/share/groff/1.24.1/font/devdvi/generate, directory renamed /usr/share/groff/1.24.0/font/devlbp -> /usr/share/groff/1.24.1/font/devlbp, directory renamed /usr/share/groff/1.24.0/tmac/mdoc -> /usr/share/groff/1.24.1/tmac/mdoc, directory renamed /usr/share/groff/1.24.0/font/devlatin1 -> /usr/share/groff/1.24.1/font/devlatin1, directory renamed /usr/share/groff/1.24.0 -> /usr/share/groff/1.24.1, directory renamed /usr/share/groff/1.24.0/font/devascii -> /usr/share/groff/1.24.1/font/devascii, directory renamed /usr/share/groff/1.24.0/font/devpdf -> /usr/share/groff/1.24.1/font/devpdf, directory renamed /usr/share/groff/1.24.0/font/devutf8 -> /usr/share/groff/1.24.1/font/devutf8
Changes to packages/x86-64-v3-poky-linux/groff (sysroot):
  /usr/share/groff/current changed symlink target from 1.24.0 to 1.24.1
  /usr/share/groff/1.24.0 moved to /usr/share/groff/1.24.1

--===============0505166230225355816==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-groff-upgrade-1.24.0-1.24.1.patch"

RnJvbSA1ZDI5ZTk4MGZjZDVmYTAzYzA1M2E5MTExNGZkYWM5NGIyZmFhOGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6NTg6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cm9mZjogdXBncmFkZSAxLjI0LjAgLT4gMS4yNC4xCgotLS0KIC4uLi9maWxlcy8wMDAxLU1ha2Ut
bWFucGFnZXMtbXVsaXRsaWItaWRlbnRpY2FsLnBhdGNoIHwgIDcgKysrLS0tLQogLi4uaXgtdGVz
dC1ncm9mZi1ub3QtZm91bmQtaW4tY3Jvc3MtY29tcGlsYXRpb24ucGF0Y2ggfCAgNSArLS0tLQog
Li4uc2UtU09VUkNFX0RBVEVfRVBPQ0gtZm9yLXJlcHJvZHVjaWJsZS1idWlsZHMucGF0Y2ggfCAg
NyArKy0tLS0tCiAuLi4vZmlsZXMvZ3JvZmYtbm90LXNlYXJjaC1mb250cy1vbi1idWlsZC1ob3N0
LnBhdGNoICB8IDExICsrKysrKy0tLS0tCiAuLi4vZ3JvZmYve2dyb2ZmXzEuMjQuMC5iYiA9PiBn
cm9mZl8xLjI0LjEuYmJ9ICAgICAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9n
cm9mZi97Z3JvZmZfMS4yNC4wLmJiID0+IGdyb2ZmXzEuMjQuMS5iYn0gKDk2JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JvZmYvZmlsZXMvMDAwMS1NYWtlLW1hbnBhZ2Vz
LW11bGl0bGliLWlkZW50aWNhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncm9mZi9m
aWxlcy8wMDAxLU1ha2UtbWFucGFnZXMtbXVsaXRsaWItaWRlbnRpY2FsLnBhdGNoCmluZGV4IDZk
Yzg0YzkwNjIuLmEwY2U4MDVlYTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
cm9mZi9maWxlcy8wMDAxLU1ha2UtbWFucGFnZXMtbXVsaXRsaWItaWRlbnRpY2FsLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncm9mZi9maWxlcy8wMDAxLU1ha2UtbWFucGFnZXMt
bXVsaXRsaWItaWRlbnRpY2FsLnBhdGNoCkBAIC0xLDIwICsxLDE5IEBACi1Gcm9tIGFhMWYzN2Yx
ZTBmZjBkYzBlZWIxOTliNTI5NTllMGRlYjI3NTcyMWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDFkY2I4NTJlYjI1NmVlNDBmZmUxZTZmYzg0NjhlYjI4MWU0YTc0ZWEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNv
bT4KIERhdGU6IFNhdCwgNyBNYXIgMjAyMCAwMDo1OToxMyArMDAwMAogU3ViamVjdDogW1BBVENI
XSBNYWtlIG1hbnBhZ2VzIG11bGl0bGliIGlkZW50aWNhbAogCiBVcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbYnkgZW1haWwgdG8gZy5icmFuZGVuLnJvYmluc29uQGdtYWlsLmNvbV0KIFNpZ25l
ZC1vZmYtYnk6IEplcmVteSBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPgotCiAtLS0KICBN
YWtlZmlsZS5hbSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4
IGY3YWI0MTAuLjdlMWYzZmIgMTAwNjQ0CitpbmRleCBlNzVkNWQ2Li40MTk1YzE1IDEwMDY0NAog
LS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtODkxLDcgKzg5MSw3IEBA
IFNVRkZJWEVTICs9IC5tYW4KK0BAIC04NTgsNyArODU4LDcgQEAgU1VGRklYRVMgKz0gLm1hbgog
IAkgICAgIC1lICJzfFtAXVBBR0VbQF18XFxcXCUkKFBBR0UpfGciIFwKICAJICAgICAtZSAic3xb
QF1QREZET0NESVJbQF18YGVjaG8gJChwZGZkb2NkaXIpIHwgc2VkIC1mICQobWFrZXZhcmVzY2Fw
ZSlgfGciIFwKICAJICAgICAtZSAic3xbQF1QU1BSSU5UW0BdfGBlY2hvICQoUFNQUklOVCkgfCBz
ZWQgLWYgJChtYWtldmFyZXNjYXBlKWB8ZyIgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2dyb2ZmL2ZpbGVzLzAwMDEtZ3JvZmYtZml4LXRlc3QtZ3JvZmYtbm90LWZvdW5kLWlu
LWNyb3NzLWNvbXBpbGF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyb2ZmL2Zp
bGVzLzAwMDEtZ3JvZmYtZml4LXRlc3QtZ3JvZmYtbm90LWZvdW5kLWluLWNyb3NzLWNvbXBpbGF0
aW9uLnBhdGNoCmluZGV4IGU5MjE0NTE5ZTcuLjE5OTIwMTg3MmYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9ncm9mZi9maWxlcy8wMDAxLWdyb2ZmLWZpeC10ZXN0LWdyb2ZmLW5v
dC1mb3VuZC1pbi1jcm9zcy1jb21waWxhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZ3JvZmYvZmlsZXMvMDAwMS1ncm9mZi1maXgtdGVzdC1ncm9mZi1ub3QtZm91bmQtaW4t
Y3Jvc3MtY29tcGlsYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMwZjgzNWE1OWQ3
YjMzNDUyZjI4MGM4YTczYzMyMTRlMGEzYTNkOWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDQ3ZjYxM2E1MTViNjg0ZDMwMjAxZTk2YzAzZTdkMDJjNWIxMTViNzMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBaaGFuZyBQZW5nIDxwZW5nLnpoYW5nMS5jbkB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogRnJpLCA2IE1hciAyMDI2IDA1OjE4OjMzICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGdyb2ZmOiBmaXggdGVzdC1ncm9mZiBub3QgZm91bmQgaW4gY3Jvc3MtY29tcGlsYXRpb24K
QEAgLTc3LDYgKzc3LDMgQEAgaW5kZXggYTY1ODk4YS4uOWM2YThiNiAxMDA2NDQKICAKIC1leGVj
ICRidWlsZGRpci9ncm9mZiAiJEAiCiArZXhlYyAkR1JPRkZfQklOX1BBVEgvZ3JvZmYgIiRAIgot
LS0gCi0yLjUxLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyb2ZmL2Zp
bGVzLzAwMDEtZ3JvcGRmLXVzZS1TT1VSQ0VfREFURV9FUE9DSC1mb3ItcmVwcm9kdWNpYmxlLWJ1
aWxkcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncm9mZi9maWxlcy8wMDAxLWdyb3Bk
Zi11c2UtU09VUkNFX0RBVEVfRVBPQ0gtZm9yLXJlcHJvZHVjaWJsZS1idWlsZHMucGF0Y2gKaW5k
ZXggOGFiMzY2OGVkYy4uMzU0YzFkNjc3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2dyb2ZmL2ZpbGVzLzAwMDEtZ3JvcGRmLXVzZS1TT1VSQ0VfREFURV9FUE9DSC1mb3ItcmVw
cm9kdWNpYmxlLWJ1aWxkcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JvZmYv
ZmlsZXMvMDAwMS1ncm9wZGYtdXNlLVNPVVJDRV9EQVRFX0VQT0NILWZvci1yZXByb2R1Y2libGUt
YnVpbGRzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMjhmMGM0ZDhkZmRmYjFjMTczZDIx
ZGY2ZmZiZTM1NDQ4ZmFkYTlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MDg5NjA3
NTQwMzIwNTc3Y2M5NTAxOTBlMDhmNTM2NTQyZDM5YzgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogWmhhbmcgUGVuZyA8cGVuZy56aGFuZzEuY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6
IE1vbiwgOSBNYXIgMjAyNiAyMDoxMDowMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBncm9wZGY6
IHVzZSBTT1VSQ0VfREFURV9FUE9DSCBmb3IgcmVwcm9kdWNpYmxlIGJ1aWxkcwpAQCAtMTcsNyAr
MTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBQZW5nIDxwZW5nLnpoYW5nMS5jbkB3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBh
L3NyYy9kZXZpY2VzL2dyb3BkZi9ncm9wZGYucGwgYi9zcmMvZGV2aWNlcy9ncm9wZGYvZ3JvcGRm
LnBsCi1pbmRleCBmNTE5YTUzLi4zYTc5YjRjIDEwMDY0NAoraW5kZXggMzY1OGNjNi4uZGU4MjVl
MiAxMDA2NDQKIC0tLSBhL3NyYy9kZXZpY2VzL2dyb3BkZi9ncm9wZGYucGwKICsrKyBiL3NyYy9k
ZXZpY2VzL2dyb3BkZi9ncm9wZGYucGwKIEBAIC0zMCw2ICszMCwxMyBAQCB1c2UgUE9TSVggcXco
bWt0aW1lKTsKQEAgLTM0LDYgKzM0LDMgQEAgaW5kZXggZjUxOWE1My4uM2E3OWI0YyAxMDA2NDQK
ICB1c2UgY29uc3RhbnQKICB7CiAgICAgIFdJRFRIICAgID0+IDAsCi0tLSAKLTIuNTAuMAotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JvZmYvZmlsZXMvZ3JvZmYtbm90LXNl
YXJjaC1mb250cy1vbi1idWlsZC1ob3N0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dy
b2ZmL2ZpbGVzL2dyb2ZmLW5vdC1zZWFyY2gtZm9udHMtb24tYnVpbGQtaG9zdC5wYXRjaAppbmRl
eCAxMTFkYmQzODVlLi42YjhhZTU2NTgzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ3JvZmYvZmlsZXMvZ3JvZmYtbm90LXNlYXJjaC1mb250cy1vbi1idWlsZC1ob3N0LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncm9mZi9maWxlcy9ncm9mZi1ub3Qtc2VhcmNo
LWZvbnRzLW9uLWJ1aWxkLWhvc3QucGF0Y2gKQEAgLTEsNyArMSw4IEBACi1Gcm9tIGViMTYyNzZj
M2UyZTM0YWEyZTU3ZjZhMGU2ODU1NDY1N2I5MGNkMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDcxYWVlZGUyYmQ4ODViYTFjZWVmY2I2ODcwMzcxNWMxYWU1MzA4ZGIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBTYXQsIDExIE1heSAyMDE5IDE3OjA2OjI5ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGdyb2ZmIHNlYXJjaHMgZm9udHMgd2hpY2ggYXJlIHByb3ZpZGVkIGJ5IGdob3N0c2NyaXB0
IG9uCisKICBidWlsZCBob3N0LiBJdCBjYXVzZXMgbm9uLWRldGVybWluaXNtIGlzc3VlLiBTbyBu
b3Qgc2VhcmNoIGZvbnQgZGlycyBvbiBob3N0LgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgW2Nyb3NzIGJ1aWxkIHNwZWNpZmljXQpAQCAtMTMsMTYgKzE0LDE1IEBAIFNpZ25lZC1v
ZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIAogUmViYXNlIHRv
IDEuMjQuMAogU2lnbmVkLW9mZi1ieTogWmhhbmcgUGVuZyA8cGVuZy56aGFuZzEuY25Ad2luZHJp
dmVyLmNvbT4KLQogLS0tCiAgZm9udC9kZXZwZGYvRm91bmRyeS5pbiB8IDQgKystLQogIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9mb250L2RldnBkZi9Gb3VuZHJ5LmluIGIvZm9udC9kZXZwZGYvRm91bmRyeS5pbgotaW5kZXgg
ZTVhYmE2NS4uNTQ0MTczNCAxMDA2NDQKK2luZGV4IDI3NjA1OTYuLjNhNDNhYWEgMTAwNjQ0CiAt
LS0gYS9mb250L2RldnBkZi9Gb3VuZHJ5LmluCiArKysgYi9mb250L2RldnBkZi9Gb3VuZHJ5Lmlu
Ci1AQCAtMjMsNyArMjMsNyBAQAorQEAgLTIxLDcgKzIxLDcgQEAKICAKICAjPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KICAjRm91bmRyeXxOYW1lfFNlYXJjaCBwYXRoCkBAIC0zMSw3ICszMSw3IEBAIGluZGV4IGU1
YWJhNjUuLjU0NDE3MzQgMTAwNjQ0CiAgCiAgIyBFbmFibGUgdGhlIGZvbnQgZGVzY3JpcHRpb24g
ZmlsZXMgZm9yIGdyb3BzIChnZW5lcmF0ZWQgZnJvbSBBZG9iZQogICMgZm91bmRyeSBmb250IGZp
bGVzKSB0byBiZSB1c2VkIHdpdGggZ3JvcGRmLiAgYWZtdG9kaXQgbXVzdCBub3QgYmUKLUBAIC03
OSw3ICs3OSw3IEBAIEVVUk98Tnx8fHwqLi4vZGV2cHMvZnJlZWV1cm8ucGZhCitAQCAtNzMsNyAr
NzMsNyBAQCBFVVJPfE58fHx8Ki4uL2RldnBzL2ZyZWVldXJvLnBmYQogICMgVVJXIGZvbnRzIGFy
ZSB0eXBpY2FsbHkgc2hpcHBlZCB3aXRoIEdob3N0c2NyaXB0LCBidXQgY2FuIGJlIHJlcGxhY2Vk
LgogIAogICNGb3VuZHJ5fE5hbWV8U2VhcmNoIHBhdGgKQEAgLTM5LDMgKzM5LDQgQEAgaW5kZXgg
ZTVhYmE2NS4uNTQ0MTczNCAxMDA2NDQKICtmb3VuZHJ5fFV8KGdzKQogIAogICMgRGVmaW5lIGZs
YWdzIGZvciBhZm10b2RpdC4KKyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
cm9mZi9ncm9mZl8xLjI0LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JvZmYvZ3JvZmZf
MS4yNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ncm9mZi9ncm9mZl8xLjI0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9ncm9mZi9ncm9mZl8xLjI0LjEuYmIKaW5kZXggZGJjOGNkZjZkMC4uYzRkZjVmMWIxOCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyb2ZmL2dyb2ZmXzEuMjQuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JvZmYvZ3JvZmZfMS4yNC4xLmJiCkBAIC0xNCw3
ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9ncm9mZi9ncm9mZi0ke1BWfS50YXIu
Z3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1ncm9wZGYtdXNlLVNPVVJDRV9EQVRFX0VQT0NI
LWZvci1yZXByb2R1Y2libGUtYnVpbGRzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZTc5YmJjZDhmZjNlZDAyMDBlN2FjNTVkMzk2MmExNWUxMThjMTIyOTk5
MDIxMzAyNWYyZmM4YjI2NDcyNzU3MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NGUyODE5Nzk1
YjZhZmY0MzFhZWFjOTgzZDYzYTljODk2OGVlYWJhMmEyZWJhN2RmOGJhNGM3YjQxZTdjZmQ4Igog
CiBERVBFTkRTID0gImJpc29uLW5hdGl2ZSBncm9mZi1uYXRpdmUiCiBSREVQRU5EUzoke1BOfSAr
PSAicGVybCBzZWQiCi0tIAoyLjQ3LjEKCg==

--===============0505166230225355816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/groff/groff-dbg: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff-dbg: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff-dbg: PKGSIZE changed from 12959160 to 12959600 (+0%)
packages/x86-64-v3-poky-linux/groff/groff-dev: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff-dev: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff-doc: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff-doc: FILELIST: directory renamed /usr/share/doc/groff-1.24.0 -> /usr/share/doc/groff-1.24.1, directory renamed /usr/share/doc/groff-1.24.0/examples/chem/cstr-122 -> /usr/share/doc/groff-1.24.1/examples/chem/cstr-122, directory renamed /usr/share/doc/groff-1.24.0/examples/mm -> /usr/share/doc/groff-1.24.1/examples/mm, directory renamed /usr/share/doc/groff-1.24.0/examples/mom -> /usr/share/doc/groff-1.24.1/examples/mom, directory renamed /usr/share/doc/groff-1.24.0/examples/chem -> /usr/share/doc/groff-1.24.1/examples/chem, directory renamed /usr/share/doc/groff-1.24.0/examples -> /usr/share/doc/groff-1.24.1/examples, directory renamed /usr/share/doc/groff-1.24.0/html/mom -> /usr/share/doc/groff-1.24.1/html/mom, directory renamed /usr/share/doc/groff-1.24.0/examples/hdtbl -> /usr/share/doc/groff-1.24.1/examples/hdtbl, directory renamed /usr/share/doc/groff-1.24.0/pdf -> /usr/share/doc/groff-1.24.1/pdf
packages/x86-64-v3-poky-linux/groff/groff-doc: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff-doc: PKGSIZE changed from 19481731 to 19485309 (+0%)
packages/x86-64-v3-poky-linux/groff/groff-locale: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff-locale: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff-src: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff-src: FILELIST: directory renamed /usr/src/debug/groff/1.24.0/src/devices/grops -> /usr/src/debug/groff/1.24.1/src/devices/grops, directory renamed /usr/src/debug/groff/1.24.0/src/devices/grodvi -> /usr/src/debug/groff/1.24.1/src/devices/grodvi, directory renamed /usr/src/debug/groff/1.24.0/src/utils/hpftodit -> /usr/src/debug/groff/1.24.1/src/utils/hpftodit, directory renamed /usr/src/debug/groff/1.24.0/src/utils/tfmtodit -> /usr/src/debug/groff/1.24.1/src/utils/tfmtodit, directory renamed /usr/src/debug/groff/1.24.0/src/utils/lookbib -> /usr/src/debug/groff/1.24.1/src/utils/lookbib, directory renamed /usr/src/debug/groff/1.24.0/src/utils/pfbtops -> /usr/src/debug/groff/1.24.1/src/utils/pfbtops, directory renamed /usr/src/debug/groff/1.24.0/src/devices/grohtml -> /usr/src/debug/groff/1.24.1/src/devices/grohtml, directory renamed /usr/src/debug/groff/1.24.0/lib -> /usr/src/debug/groff/1.24.1/lib, directory renamed /usr/src/debug/groff/1.24.0/s
 rc/preproc/pic -> /usr/src/debug/groff/1.24.1/src/preproc/pic, directory renamed /usr/src/debug/groff/1.24.0/src/utils/indxbib -> /usr/src/debug/groff/1.24.1/src/utils/indxbib, directory renamed /usr/src/debug/groff/1.24.0/src/devices/grolbp -> /usr/src/debug/groff/1.24.1/src/devices/grolbp, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/preconv -> /usr/src/debug/groff/1.24.1/src/preproc/preconv, directory renamed /usr/src/debug/groff/1.24.0/src/devices/grotty -> /usr/src/debug/groff/1.24.1/src/devices/grotty, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/soelim -> /usr/src/debug/groff/1.24.1/src/preproc/soelim, directory renamed /usr/src/debug/groff/1.24.0/src/libs/libdriver -> /usr/src/debug/groff/1.24.1/src/libs/libdriver, directory renamed /usr/src/debug/groff/1.24.0/src/utils/lkbib -> /usr/src/debug/groff/1.24.1/src/utils/lkbib, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/tbl -> /usr/src/debug/groff/1.24.1/src/preproc/tbl, directory renamed 
 /usr/src/debug/groff/1.24.0/src/roff/groff -> /usr/src/debug/groff/1.24.1/src/roff/groff, directory renamed /usr/src/debug/groff/1.24.0/src/roff/troff -> /usr/src/debug/groff/1.24.1/src/roff/troff, directory renamed /usr/src/debug/groff/1.24.0/src/libs/libbib -> /usr/src/debug/groff/1.24.1/src/libs/libbib, directory renamed /usr/src/debug/groff/1.24.0/src/include -> /usr/src/debug/groff/1.24.1/src/include, directory renamed /usr/src/debug/groff/1.24.0/src/devices/grolj4 -> /usr/src/debug/groff/1.24.1/src/devices/grolj4, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/eqn -> /usr/src/debug/groff/1.24.1/src/preproc/eqn, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/html -> /usr/src/debug/groff/1.24.1/src/preproc/html, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/refer -> /usr/src/debug/groff/1.24.1/src/preproc/refer, directory renamed /usr/src/debug/groff/1.24.0/src/preproc/grn -> /usr/src/debug/groff/1.24.1/src/preproc/grn, directory renamed /usr/sr
 c/debug/groff/1.24.0/src/libs/libgroff -> /usr/src/debug/groff/1.24.1/src/libs/libgroff, directory renamed /usr/src/debug/groff/1.24.0/src/utils/addftinfo -> /usr/src/debug/groff/1.24.1/src/utils/addftinfo
packages/x86-64-v3-poky-linux/groff/groff-src: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff-src: PKGSIZE changed from 3723036 to 3723463 (+0%)
packages/x86-64-v3-poky-linux/groff/groff-staticdev: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff-staticdev: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff/groff: FILELIST: directory renamed /usr/share/groff/1.24.0/tmac/mdoc -> /usr/share/groff/1.24.1/tmac/mdoc, directory renamed /usr/share/groff/1.24.0/font/devutf8 -> /usr/share/groff/1.24.1/font/devutf8, directory renamed /usr/share/groff/1.24.0 -> /usr/share/groff/1.24.1, directory renamed /usr/share/groff/1.24.0/font/devps/generate -> /usr/share/groff/1.24.1/font/devps/generate, directory renamed /usr/share/groff/1.24.0/font/devlbp -> /usr/share/groff/1.24.1/font/devlbp, directory renamed /usr/share/groff/1.24.0/font/devps -> /usr/share/groff/1.24.1/font/devps, directory renamed /usr/share/groff/1.24.0/font/devhtml -> /usr/share/groff/1.24.1/font/devhtml, directory renamed /usr/share/groff/1.24.0/font/devdvi -> /usr/share/groff/1.24.1/font/devdvi, directory renamed /usr/share/groff/1.24.0/font/devpdf/enc -> /usr/share/groff/1.24.1/font/devpdf/enc, directory renamed /usr/share/groff/1.24.0/tmac -> /usr/share/groff/1.24.1/tmac, directory renamed /us
 r/share/groff/1.24.0/font/devlatin1 -> /usr/share/groff/1.24.1/font/devlatin1, directory renamed /usr/share/groff/1.24.0/font/devlj4 -> /usr/share/groff/1.24.1/font/devlj4, directory renamed /usr/share/groff/1.24.0/font/devascii -> /usr/share/groff/1.24.1/font/devascii, directory renamed /usr/share/groff/1.24.0/font/devlj4/generate -> /usr/share/groff/1.24.1/font/devlj4/generate, directory renamed /usr/share/groff/1.24.0/oldfont/devps -> /usr/share/groff/1.24.1/oldfont/devps, directory renamed /usr/share/groff/1.24.0/font/devdvi/generate -> /usr/share/groff/1.24.1/font/devdvi/generate, directory renamed /usr/share/groff/1.24.0/font/devpdf/map -> /usr/share/groff/1.24.1/font/devpdf/map, directory renamed /usr/share/groff/1.24.0/tmac/mm -> /usr/share/groff/1.24.1/tmac/mm, directory renamed /usr/share/groff/1.24.0/font/devpdf -> /usr/share/groff/1.24.1/font/devpdf
packages/x86-64-v3-poky-linux/groff/groff: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
packages/x86-64-v3-poky-linux/groff/groff: PKGSIZE changed from 9880446 to 9880481 (+0%)
packages/x86-64-v3-poky-linux/groff: PV changed from "1.24.0" to "1.24.1"
packages/x86-64-v3-poky-linux/groff: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/groff/groff-1.24.0.tar.gz file://groff-not-search-fonts-on-build-host.patch file://0001-Make-manpages-mulitlib-identical.patch file://0001-groff-fix-test-groff-not-found-in-cross-compilation.patch file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch" to "https://ftpmirror.gnu.org/gnu/groff/groff-1.24.1.tar.gz file://groff-not-search-fonts-on-build-host.patch file://0001-Make-manpages-mulitlib-identical.patch file://0001-groff-fix-test-groff-not-found-in-cross-compilation.patch file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch"
packages/x86-64-v3-poky-linux/groff: PKGV changed from 1.24.0 [default] to 1.24.1 [default]
Changes to packages/x86-64-v3-poky-linux/groff (sysroot):
  /usr/share/groff/current changed symlink target from 1.24.0 to 1.24.1
  /usr/share/groff/1.24.0 moved to /usr/share/groff/1.24.1

--===============0505166230225355816==--

