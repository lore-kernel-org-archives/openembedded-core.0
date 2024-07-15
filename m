Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9F5C54E91
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1369.1721071146922345961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ER9oTDW9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hUTql7Fw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010190b7d594bc-717d7e86-f31b-4dc7-9e2e-f8a1c7fb15b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y6kp2ilNVMqFi+kwdNOnzM1tGPZPQ6uzN9Xct9CBPWU=;
	b=ER9oTDW9kXmqFe9WI+f8NqNlXAAlGwK/S23/nuw8uxDZtYJ/P3BbkDxCxiFNMIdL
	178IwB5QyxH7U3HlH0WjJNcXUT110vYX/Lg4mxQsw6Wy47Pm3elJ9BOxu3SLXGjPZlj
	EsmATaGYOLl6naavHSKUubXCg9tKWOoOkIsfJZ+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y6kp2ilNVMqFi+kwdNOnzM1tGPZPQ6uzN9Xct9CBPWU=;
	b=hUTql7FwZFiTdssNjRHVupqC0Vc4cuKima6KJtJxmeLlsHi1QH6gRndlxq5RIC8w
	w/BNruvIvGfdd0TPj4l2qoWmXzQ8JJyXawRJ1KuOvSQNJY4Ekm87SNjGm0tY+/Z8/RW
	U/0Mr+0V0g+1PZwJ/SXqixWClsW/VToBj/65Rcbg=
Content-Type: multipart/mixed; boundary="===============2735138682768582104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.44 SUCCEEDED
Message-ID: <01010190b7d594bc-717d7e86-f31b-4dc7-9e2e-f8a1c7fb15b7-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201977

--===============2735138682768582104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.44* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.43-4.0.44.patch
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
From 445169befdc546a8b2d8349250bd5610c75e5526 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 10:08:41 +0000
Subject: [PATCH] mtools: upgrade 4.0.43 -> 4.0.44

---
 .../mtools/mtools/clang_UNUSED.patch          | 19 +++++++++++++------
 .../mtools/disable-hardcoded-configs.patch    |  7 +++----
 .../mtools/mtools/mtools-makeinfo.patch       | 11 +++++------
 .../{mtools_4.0.43.bb => mtools_4.0.44.bb}    |  2 +-
 4 files changed, 22 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.43.bb => mtools_4.0.44.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 6bb9d6a3da..de1371f4a0 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,12 +1,19 @@
-Undefine UNUSED macros with clang
+From ee9c0cd34204f38d0a6c78fe7ee615c8a2da66fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Sep 2018 11:55:41 -0700
+Subject: [PATCH] Undefine UNUSED macros with clang
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: mtools-4.0.18/sysincludes.h
-===================================================================
---- mtools-4.0.18.orig/sysincludes.h
-+++ mtools-4.0.18/sysincludes.h
-@@ -101,7 +101,7 @@ typedef void *caddr_t;
+---
+ sysincludes.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysincludes.h b/sysincludes.h
+index e16ab45..8d285d4 100644
+--- a/sysincludes.h
++++ b/sysincludes.h
+@@ -98,7 +98,7 @@ typedef void *caddr_t;
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 57be935487..f4fb4271da 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 2ef9b371a5cc44e730143e694d71665831fac216 Mon Sep 17 00:00:00 2001
+From f0846fccf803de319f2ad8a75925ad83c510b351 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -6,16 +6,15 @@ Subject: [PATCH] Disabled reading host configs.
 Upstream-Status: Inappropriate [native]
 
 Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
 ---
  config.c | 8 --------
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 2f6a297..3181ed7 100644
+index 358282b..8ebafb4 100644
 --- a/config.c
 +++ b/config.c
-@@ -844,14 +844,6 @@ void read_config(void)
+@@ -868,14 +868,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 6ae91d6cb9..bf13561dd0 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,17 +1,16 @@
-From 3cf56b36db78679273f61ba78fbbf7f3fab52f68 Mon Sep 17 00:00:00 2001
+From 71886e950fd3aba4d7775854cbd7c0c09ae27642 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
 
 Upstream-Status: Inappropriate [licensing]
-
 ---
  Makefile.in  | 11 ++++++-----
  configure.in | 27 +++++++++++++++++++++++++++
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 616d59f..85b5b1d 100644
+index 5db50d7..92ad461 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -30,7 +29,7 @@ index 616d59f..85b5b1d 100644
  
  
  # do not edit below this line
-@@ -199,7 +200,7 @@ dvi: mtools.dvi
+@@ -185,7 +186,7 @@ dvi: mtools.dvi
  
  ps: mtools.ps
  %.ps: %.dvi
@@ -40,10 +39,10 @@ index 616d59f..85b5b1d 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.in b/configure.in
-index 5ff75c1..c0f7440 100644
+index 1de916e..fd6cb08 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -35,6 +35,33 @@ AC_CANONICAL_SYSTEM
+@@ -32,6 +32,33 @@ AC_CANONICAL_TARGET
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.43.bb b/meta/recipes-devtools/mtools/mtools_4.0.44.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.43.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.44.bb
index 859103979e..d8dd671be2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.43.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.44.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "541e179665dc4e272b9602f2074243591a157da89cc47064da8c5829dbd2b339"
+SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.44.0


--===============2735138682768582104==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.43-4.0.44.patch"

RnJvbSA0NDUxNjliZWZkYzU0NmE4YjJkODM0OTI1MGJkNTYxMGM3NWU1NTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTA6MDg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dG9vbHM6IHVwZ3JhZGUgNC4wLjQzIC0+IDQuMC40NAoKLS0tCiAuLi4vbXRvb2xzL210b29scy9j
bGFuZ19VTlVTRUQucGF0Y2ggICAgICAgICAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCiAuLi4v
bXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgfCAgNyArKystLS0tCiAu
Li4vbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2ggICAgICAgfCAxMSArKysrKy0t
LS0tLQogLi4uL3ttdG9vbHNfNC4wLjQzLmJiID0+IG10b29sc180LjAuNDQuYmJ9ICAgIHwgIDIg
Ky0KIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy97bXRvb2xzXzQuMC40My5iYiA9PiBt
dG9vbHNfNC4wLjQ0LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaAppbmRleCA2YmI5ZDZhM2RhLi5kZTEz
NzFmNGEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9j
bGFuZ19VTlVTRUQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9v
bHMvY2xhbmdfVU5VU0VELnBhdGNoCkBAIC0xLDEyICsxLDE5IEBACi1VbmRlZmluZSBVTlVTRUQg
bWFjcm9zIHdpdGggY2xhbmcKK0Zyb20gZWU5YzBjZDM0MjA0ZjM4ZDBhNmM3OGZlN2VlNjE1Yzhh
MmRhNjZmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CitEYXRlOiBXZWQsIDE5IFNlcCAyMDE4IDExOjU1OjQxIC0wNzAwCitTdWJq
ZWN0OiBbUEFUQ0hdIFVuZGVmaW5lIFVOVVNFRCBtYWNyb3Mgd2l0aCBjbGFuZwogCiBVcHN0cmVh
bS1TdGF0dXM6IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+Ci1JbmRleDogbXRvb2xzLTQuMC4xOC9zeXNpbmNsdWRlcy5oCi09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0t
LS0gbXRvb2xzLTQuMC4xOC5vcmlnL3N5c2luY2x1ZGVzLmgKLSsrKyBtdG9vbHMtNC4wLjE4L3N5
c2luY2x1ZGVzLmgKLUBAIC0xMDEsNyArMTAxLDcgQEAgdHlwZWRlZiB2b2lkICpjYWRkcl90Owor
LS0tCisgc3lzaW5jbHVkZXMuaCB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL3N5c2luY2x1ZGVzLmggYi9zeXNpbmNs
dWRlcy5oCitpbmRleCBlMTZhYjQ1Li44ZDI4NWQ0IDEwMDY0NAorLS0tIGEvc3lzaW5jbHVkZXMu
aAorKysrIGIvc3lzaW5jbHVkZXMuaAorQEAgLTk4LDcgKzk4LDcgQEAgdHlwZWRlZiB2b2lkICpj
YWRkcl90OwogICNpZiBkZWZpbmVkIF9fR05VQ19fICYmIGRlZmluZWQgX19TVERDX18KICAvKiBn
Y2MgLXRyYWRpdGlvbmFsIGRvZXNuJ3QgaGF2ZSBQQUNLRUQsIFVOVVNFRCBhbmQgTk9SRVRVUk4g
Ki8KICAjIGRlZmluZSBQQUNLRUQgX19hdHRyaWJ1dGVfXyAoKHBhY2tlZCkpCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1j
b25maWdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJs
ZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaAppbmRleCA1N2JlOTM1NDg3Li5mNGZiNDI3MWRhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhh
cmRjb2RlZC1jb25maWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMv
bXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDJlZjliMzcxYTVjYzQ0ZTczMDE0M2U2OTRkNzE2NjU4MzFmYWMyMTYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGYwODQ2ZmNjZjgwM2RlMzE5ZjJhZDhhNzU5MjVhZDgzYzUxMGIz
NTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3No
QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFR1ZSwgMTMgSnVuIDIwMTcgMTQ6NTU6NTIgKzAzMDAK
IFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZWQgcmVhZGluZyBob3N0IGNvbmZpZ3MuCkBAIC02LDE2
ICs2LDE1IEBAIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZWQgcmVhZGluZyBob3N0IGNvbmZpZ3Mu
CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW25hdGl2ZV0KIAogU2lnbmVkLW9mZi1i
eTogRWQgQmFydG9zaCA8ZWQuYmFydG9zaEBsaW51eC5pbnRlbC5jb20+Ci0KIC0tLQogIGNvbmZp
Zy5jIHwgOCAtLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlnLmMgYi9jb25maWcuYwotaW5kZXggMmY2YTI5Ny4uMzE4MWVkNyAxMDA2
NDQKK2luZGV4IDM1ODI4MmIuLjhlYmFmYjQgMTAwNjQ0CiAtLS0gYS9jb25maWcuYwogKysrIGIv
Y29uZmlnLmMKLUBAIC04NDQsMTQgKzg0NCw2IEBAIHZvaWQgcmVhZF9jb25maWcodm9pZCkKK0BA
IC04NjgsMTQgKzg2OCw2IEBAIHZvaWQgcmVhZF9jb25maWcodm9pZCkKICAJbWVtY3B5KGRldmlj
ZXMsIGNvbnN0X2RldmljZXMsCiAgCSAgICAgICBucl9jb25zdF9kZXZpY2VzKnNpemVvZihzdHJ1
Y3QgZGV2aWNlKSk7CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xz
L210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRv
b2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2gKaW5kZXggNmFlOTFkNmNiOS4uYmYxMzU2
MWRkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRv
b2xzLW1ha2VpbmZvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRv
b2xzL210b29scy1tYWtlaW5mby5wYXRjaApAQCAtMSwxNyArMSwxNiBAQAotRnJvbSAzY2Y1NmIz
NmRiNzg2NzkyNzNmNjFiYTc4ZmJiZjdmM2ZhYjUyZjY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA3MTg4NmU5NTBmZDNhYmE0ZDc3NzU4NTRjYmQ3YzBjMDlhZTI3NjQyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyY2luIEp1c3praWV3aWN6IDxocndAb3BlbmVkaGFu
ZC5jb20+CiBEYXRlOiBGcmksIDggSnVuIDIwMDcgMDg6MzU6MTIgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gbXRvb2xzOiBpbXBvcnRlZCBmcm9tIE9FCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbbGljZW5zaW5nXQotCiAtLS0KICBNYWtlZmlsZS5pbiAgfCAxMSArKysrKystLS0t
LQogIGNvbmZpZ3VyZS5pbiB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogIDIgZmls
ZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDYxNmQ1OWYuLjg1YjViMWQgMTAw
NjQ0CitpbmRleCA1ZGI1MGQ3Li45MmFkNDYxIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsr
KyBiL01ha2VmaWxlLmluCiBAQCAtMjYsMTAgKzI2LDExIEBAIFVTRVJDRkxBR1MgPQpAQCAtMzAs
NyArMjksNyBAQCBpbmRleCA2MTZkNTlmLi44NWI1YjFkIDEwMDY0NAogIAogIAogICMgZG8gbm90
IGVkaXQgYmVsb3cgdGhpcyBsaW5lCi1AQCAtMTk5LDcgKzIwMCw3IEBAIGR2aTogbXRvb2xzLmR2
aQorQEAgLTE4NSw3ICsxODYsNyBAQCBkdmk6IG10b29scy5kdmkKICAKICBwczogbXRvb2xzLnBz
CiAgJS5wczogJS5kdmkKQEAgLTQwLDEwICszOSwxMCBAQCBpbmRleCA2MTZkNTlmLi44NWI1YjFk
IDEwMDY0NAogIHBkZjogbXRvb2xzLnBkZgogICUucGRmOiAlLnRleGkgc3lzY29uZmRpci50ZXhp
CiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmluIGIvY29uZmlndXJlLmluCi1pbmRleCA1ZmY3NWMx
Li5jMGY3NDQwIDEwMDY0NAoraW5kZXggMWRlOTE2ZS4uZmQ2Y2IwOCAxMDA2NDQKIC0tLSBhL2Nv
bmZpZ3VyZS5pbgogKysrIGIvY29uZmlndXJlLmluCi1AQCAtMzUsNiArMzUsMzMgQEAgQUNfQ0FO
T05JQ0FMX1NZU1RFTQorQEAgLTMyLDYgKzMyLDMzIEBAIEFDX0NBTk9OSUNBTF9UQVJHRVQKICBB
Q19DX0NPTlNUCiAgQUNfQ19JTkxJTkUKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tdG9vbHMvbXRvb2xzXzQuMC40My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9v
bHMvbXRvb2xzXzQuMC40NC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40NC5iYgppbmRleCA4NTkxMDM5Nzll
Li5kOGRkNjcxYmUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210
b29sc180LjAuNDMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNf
NC4wLjQ0LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFJSRUNPTU1FTkRTOiR7UE59OmxpYmMtZ2xpYmMg
PSAiXAogCWdsaWJjLWdjb252LWlibTg2NiBcCiAJZ2xpYmMtZ2NvbnYtaWJtODY5IFwKIAkiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNTQxZTE3OTY2NWRjNGUyNzJiOTYwMmYyMDc0MjQzNTkxYTE1
N2RhODljYzQ3MDY0ZGE4YzU4MjlkYmQyYjMzOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzN2Rj
NGRmMDIyNTMzYzNkNGIyZWMxYzc4OTczYzI3YzdlOGI1ODUzNzRjMmQ0NmFiNjRjNmEzZGIzMWVk
ZGI4IgogCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vbXRvb2xzL210b29scy0ke1BWfS50YXIu
YnoyIFwKICAgICAgICAgICAgZmlsZTovL210b29scy1tYWtlaW5mby5wYXRjaCBcCi0tIAoyLjQ0
LjAKCg==

--===============2735138682768582104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.43.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.44.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 818296 to 818456 (+0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 242854 to 244453 (+1%)
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PKGSIZE changed from 597781 to 598938 (+0%)
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools: PKGSIZE changed from 227346 to 223250 (-2%)
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.43" to "4.0.44"

--===============2735138682768582104==--

