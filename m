Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1236FC3DA7E
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18602.1718475798656301488
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QE4AUpfv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=euwHditK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101901d23b972-715d92dc-6868-48ea-859c-51f6c175eb3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X3GN7SO5kYJtF12cAj5Ntg/uGLLA20MJOgguE01Va0U=;
	b=QE4AUpfvA0cpz+hdNxK6KUdQWtztpw9aueBpSdsF74yThBTutDVZYVDCurwXhTdI
	v2/OQ0INNNAHgJOAQKXTlvZQUIA8Mj8zx+q4okwRwvrOWIAJwf78aWJ9Dh0lkERrSk/
	aOx8oAId8zz0g2XH8N3Qc9a/f0rEAAhUdiHlJ/cs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X3GN7SO5kYJtF12cAj5Ntg/uGLLA20MJOgguE01Va0U=;
	b=euwHditK8SAtnWhsYaUTyHHUlsfpf3+rcohNLxmfo4f7Glaz4tqj4uj50lOsFa2w
	Hai4CYYM7eJfMBsa0S9dKKhWRdTlyMaaxij+UJeRMzDCM3K0y656t9slzOsfDbLPH+M
	XIOwGwyg5A651WanUsOvYqHigPe0XnTe1A2oAx8A=
Content-Type: multipart/mixed; boundary="===============6767291196312912834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.44 SUCCEEDED
Message-ID: <010101901d23b972-715d92dc-6868-48ea-859c-51f6c175eb3d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200687

--===============6767291196312912834==
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
From 06bd98281237fb3dc7a0990b46fe3ec919f1b863 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 09:35:10 +0000
Subject: [PATCH] mtools: upgrade 4.0.43 -> 4.0.44

---
 .../mtools/mtools/clang_UNUSED.patch          | 19 +++++++++++++------
 .../mtools/disable-hardcoded-configs.patch    |  7 +++----
 .../mtools/mtools/mtools-makeinfo.patch       | 11 +++++------
 .../{mtools_4.0.43.bb => mtools_4.0.44.bb}    |  2 +-
 4 files changed, 22 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.43.bb => mtools_4.0.44.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 6bb9d6a3da..9c5e09f9b3 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,12 +1,19 @@
-Undefine UNUSED macros with clang
+From c11d4a4a2dabaf06f3d1da28326d9f647862f52e Mon Sep 17 00:00:00 2001
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
index 57be935487..7213afd325 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 2ef9b371a5cc44e730143e694d71665831fac216 Mon Sep 17 00:00:00 2001
+From 91b85cf1edd8dfa3a526fa15802918384181e300 Mon Sep 17 00:00:00 2001
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
index 6ae91d6cb9..ff6db46650 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,17 +1,16 @@
-From 3cf56b36db78679273f61ba78fbbf7f3fab52f68 Mon Sep 17 00:00:00 2001
+From 606f102f8f5ac07773f1043441c68caede058612 Mon Sep 17 00:00:00 2001
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


--===============6767291196312912834==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.43-4.0.44.patch"

RnJvbSAwNmJkOTgyODEyMzdmYjNkYzdhMDk5MGI0NmZlM2VjOTE5ZjFiODYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDk6MzU6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dG9vbHM6IHVwZ3JhZGUgNC4wLjQzIC0+IDQuMC40NAoKLS0tCiAuLi4vbXRvb2xzL210b29scy9j
bGFuZ19VTlVTRUQucGF0Y2ggICAgICAgICAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCiAuLi4v
bXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgfCAgNyArKystLS0tCiAu
Li4vbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2ggICAgICAgfCAxMSArKysrKy0t
LS0tLQogLi4uL3ttdG9vbHNfNC4wLjQzLmJiID0+IG10b29sc180LjAuNDQuYmJ9ICAgIHwgIDIg
Ky0KIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy97bXRvb2xzXzQuMC40My5iYiA9PiBt
dG9vbHNfNC4wLjQ0LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaAppbmRleCA2YmI5ZDZhM2RhLi45YzVl
MDlmOWIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9j
bGFuZ19VTlVTRUQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9v
bHMvY2xhbmdfVU5VU0VELnBhdGNoCkBAIC0xLDEyICsxLDE5IEBACi1VbmRlZmluZSBVTlVTRUQg
bWFjcm9zIHdpdGggY2xhbmcKK0Zyb20gYzExZDRhNGEyZGFiYWYwNmYzZDFkYTI4MzI2ZDlmNjQ3
ODYyZjUyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEtoZW0gUmFqIDxyYWoua2hl
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
ZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaAppbmRleCA1N2JlOTM1NDg3Li43MjEzYWZkMzI1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhh
cmRjb2RlZC1jb25maWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMv
bXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDJlZjliMzcxYTVjYzQ0ZTczMDE0M2U2OTRkNzE2NjU4MzFmYWMyMTYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDkxYjg1Y2YxZWRkOGRmYTNhNTI2ZmExNTgwMjkxODM4NDE4MWUz
MDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3No
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
b2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2gKaW5kZXggNmFlOTFkNmNiOS4uZmY2ZGI0
NjY1MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRv
b2xzLW1ha2VpbmZvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRv
b2xzL210b29scy1tYWtlaW5mby5wYXRjaApAQCAtMSwxNyArMSwxNiBAQAotRnJvbSAzY2Y1NmIz
NmRiNzg2NzkyNzNmNjFiYTc4ZmJiZjdmM2ZhYjUyZjY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2MDZmMTAyZjhmNWFjMDc3NzNmMTA0MzQ0MWM2OGNhZWRlMDU4NjEyIE1vbiBTZXAg
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

--===============6767291196312912834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.43.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.44.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 818456 to 818616 (+0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 242854 to 244453 (+1%)
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PKGSIZE changed from 597781 to 598938 (+0%)
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools: PKGSIZE changed from 227346 to 223250 (-2%)
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.43 [default] to 4.0.44 [default]

--===============6767291196312912834==--

