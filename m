Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A5FC52D54
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2172.1719853075376707204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BMlJbYG+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Q1JDKZRk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101906f3b4bf9-09c1eb8f-6c4d-4403-a688-06132ec9baae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zl3oM32KGU60qPO8uXiz1F6E9UXfhksHP9epHSPwmBM=;
	b=BMlJbYG+knIGMAJiRLTPWk+ARlsqYqdnr4DoOqFT64uPiGrYTa8inwSDig4zIDJK
	j0LxZNqunujlHgDpxnnFS85M7zUMfzGz7TKThSGxjfRroG2YnMPP6Q2zR0tSZFP2bZe
	w0IxhBdDeTdhk0vdCxmAtb3K8SYIXPMBV+GwjHIE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zl3oM32KGU60qPO8uXiz1F6E9UXfhksHP9epHSPwmBM=;
	b=Q1JDKZRkDUclCdeUcMv/voFlg7azAKGimhG1pY74u+zYTVDhxz4ZONfiCT+dIeSs
	KjZWJeGse57JzeM2MSG2ISFdqQwWoHaCJFIv+rtnwiY4NOs3+S5wmCJf1YjrympuGy6
	29sfv2f/Kap2eUsP13cNgGFDsLZM8+GSjEhC4ua0=
Content-Type: multipart/mixed; boundary="===============8999145774918758075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.44 SUCCEEDED
Message-ID: <010101906f3b4bf9-09c1eb8f-6c4d-4403-a688-06132ec9baae-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201328

--===============8999145774918758075==
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
From cfeb6409c2a802287cfcdd21ddc44e15392ef849 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 08:19:51 +0000
Subject: [PATCH] mtools: upgrade 4.0.43 -> 4.0.44

---
 .../mtools/mtools/clang_UNUSED.patch          | 19 +++++++++++++------
 .../mtools/disable-hardcoded-configs.patch    |  7 +++----
 .../mtools/mtools/mtools-makeinfo.patch       | 11 +++++------
 .../{mtools_4.0.43.bb => mtools_4.0.44.bb}    |  2 +-
 4 files changed, 22 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.43.bb => mtools_4.0.44.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 6bb9d6a3da..9b55532157 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,12 +1,19 @@
-Undefine UNUSED macros with clang
+From 29a61c0b6a60965633422395b98d5ef825984aee Mon Sep 17 00:00:00 2001
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
index 57be935487..5515e25d54 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 2ef9b371a5cc44e730143e694d71665831fac216 Mon Sep 17 00:00:00 2001
+From ca9f26f26ba0bffaf86a12fc0c45f17a5aaa8542 Mon Sep 17 00:00:00 2001
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
index 6ae91d6cb9..281438e05f 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,17 +1,16 @@
-From 3cf56b36db78679273f61ba78fbbf7f3fab52f68 Mon Sep 17 00:00:00 2001
+From a0c5f0f6959486d887887b18f4945a75ca38cb63 Mon Sep 17 00:00:00 2001
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


--===============8999145774918758075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.43.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.44.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools: PV changed from "4.0.43" to "4.0.44"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.43 [default] to 4.0.44 [default]
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 818456 to 818616 (+0%)
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

--===============8999145774918758075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.43-4.0.44.patch"

RnJvbSBjZmViNjQwOWMyYTgwMjI4N2NmY2RkMjFkZGM0NGUxNTM5MmVmODQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwODoxOTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDMgLT4gNC4wLjQ0CgotLS0KIC4uLi9tdG9vbHMvbXRvb2xzL2Ns
YW5nX1VOVVNFRC5wYXRjaCAgICAgICAgICB8IDE5ICsrKysrKysrKysrKystLS0tLS0KIC4uLi9t
dG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaCAgICB8ICA3ICsrKy0tLS0KIC4u
Li9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5mby5wYXRjaCAgICAgICB8IDExICsrKysrLS0t
LS0tCiAuLi4ve210b29sc180LjAuNDMuYmIgPT4gbXRvb2xzXzQuMC40NC5iYn0gICAgfCAgMiAr
LQogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL3ttdG9vbHNfNC4wLjQzLmJiID0+IG10
b29sc180LjAuNDQuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNoCmluZGV4IDZiYjlkNmEzZGEuLjliNTU1
MzIxNTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Ns
YW5nX1VOVVNFRC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29s
cy9jbGFuZ19VTlVTRUQucGF0Y2gKQEAgLTEsMTIgKzEsMTkgQEAKLVVuZGVmaW5lIFVOVVNFRCBt
YWNyb3Mgd2l0aCBjbGFuZworRnJvbSAyOWE2MWMwYjZhNjA5NjU2MzM0MjIzOTViOThkNWVmODI1
OTg0YWVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KK0RhdGU6IFdlZCwgMTkgU2VwIDIwMTggMTE6NTU6NDEgLTA3MDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gVW5kZWZpbmUgVU5VU0VEIG1hY3JvcyB3aXRoIGNsYW5nCiAKIFVwc3RyZWFt
LVN0YXR1czogUGVuZGluZwogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KLUluZGV4OiBtdG9vbHMtNC4wLjE4L3N5c2luY2x1ZGVzLmgKLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0t
LSBtdG9vbHMtNC4wLjE4Lm9yaWcvc3lzaW5jbHVkZXMuaAotKysrIG10b29scy00LjAuMTgvc3lz
aW5jbHVkZXMuaAotQEAgLTEwMSw3ICsxMDEsNyBAQCB0eXBlZGVmIHZvaWQgKmNhZGRyX3Q7Cist
LS0KKyBzeXNpbmNsdWRlcy5oIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvc3lzaW5jbHVkZXMuaCBiL3N5c2luY2x1
ZGVzLmgKK2luZGV4IGUxNmFiNDUuLjhkMjg1ZDQgMTAwNjQ0CistLS0gYS9zeXNpbmNsdWRlcy5o
CisrKysgYi9zeXNpbmNsdWRlcy5oCitAQCAtOTgsNyArOTgsNyBAQCB0eXBlZGVmIHZvaWQgKmNh
ZGRyX3Q7CiAgI2lmIGRlZmluZWQgX19HTlVDX18gJiYgZGVmaW5lZCBfX1NURENfXwogIC8qIGdj
YyAtdHJhZGl0aW9uYWwgZG9lc24ndCBoYXZlIFBBQ0tFRCwgVU5VU0VEIGFuZCBOT1JFVFVSTiAq
LwogICMgZGVmaW5lIFBBQ0tFRCBfX2F0dHJpYnV0ZV9fICgocGFja2VkKSkKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNv
bmZpZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxl
LWhhcmRjb2RlZC1jb25maWdzLnBhdGNoCmluZGV4IDU3YmU5MzU0ODcuLjU1MTVlMjVkNTQgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFy
ZGNvZGVkLWNvbmZpZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9t
dG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMmVmOWIzNzFhNWNjNDRlNzMwMTQzZTY5NGQ3MTY2NTgzMWZhYzIxNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gY2E5ZjI2ZjI2YmEwYmZmYWY4NmExMmZjMGM0NWYxN2E1YWFhODU0
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEVkIEJhcnRvc2ggPGVkLmJhcnRvc2hA
bGludXguaW50ZWwuY29tPgogRGF0ZTogVHVlLCAxMyBKdW4gMjAxNyAxNDo1NTo1MiArMDMwMAog
U3ViamVjdDogW1BBVENIXSBEaXNhYmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4KQEAgLTYsMTYg
KzYsMTUgQEAgU3ViamVjdDogW1BBVENIXSBEaXNhYmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4K
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbbmF0aXZlXQogCiBTaWduZWQtb2ZmLWJ5
OiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3NoQGxpbnV4LmludGVsLmNvbT4KLQogLS0tCiAgY29uZmln
LmMgfCA4IC0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9jb25maWcuYyBiL2NvbmZpZy5jCi1pbmRleCAyZjZhMjk3Li4zMTgxZWQ3IDEwMDY0
NAoraW5kZXggMzU4MjgyYi4uOGViYWZiNCAxMDA2NDQKIC0tLSBhL2NvbmZpZy5jCiArKysgYi9j
b25maWcuYwotQEAgLTg0NCwxNCArODQ0LDYgQEAgdm9pZCByZWFkX2NvbmZpZyh2b2lkKQorQEAg
LTg2OCwxNCArODY4LDYgQEAgdm9pZCByZWFkX2NvbmZpZyh2b2lkKQogIAltZW1jcHkoZGV2aWNl
cywgY29uc3RfZGV2aWNlcywKICAJICAgICAgIG5yX2NvbnN0X2RldmljZXMqc2l6ZW9mKHN0cnVj
dCBkZXZpY2UpKTsKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMv
bXRvb2xzL210b29scy1tYWtlaW5mby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9v
bHMvbXRvb2xzL210b29scy1tYWtlaW5mby5wYXRjaAppbmRleCA2YWU5MWQ2Y2I5Li4yODE0Mzhl
MDVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9v
bHMtbWFrZWluZm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9v
bHMvbXRvb2xzLW1ha2VpbmZvLnBhdGNoCkBAIC0xLDE3ICsxLDE2IEBACi1Gcm9tIDNjZjU2YjM2
ZGI3ODY3OTI3M2Y2MWJhNzhmYmJmN2YzZmFiNTJmNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGEwYzVmMGY2OTU5NDg2ZDg4Nzg4N2IxOGY0OTQ1YTc1Y2EzOGNiNjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJjaW4gSnVzemtpZXdpY3ogPGhyd0BvcGVuZWRoYW5k
LmNvbT4KIERhdGU6IEZyaSwgOCBKdW4gMjAwNyAwODozNToxMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBtdG9vbHM6IGltcG9ydGVkIGZyb20gT0UKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlIFtsaWNlbnNpbmddCi0KIC0tLQogIE1ha2VmaWxlLmluICB8IDExICsrKysrKy0tLS0t
CiAgY29uZmlndXJlLmluIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgMiBmaWxl
cyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgotaW5kZXggNjE2ZDU5Zi4uODViNWIxZCAxMDA2
NDQKK2luZGV4IDVkYjUwZDcuLjkyYWQ0NjEgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5pbgogKysr
IGIvTWFrZWZpbGUuaW4KIEBAIC0yNiwxMCArMjYsMTEgQEAgVVNFUkNGTEFHUyA9CkBAIC0zMCw3
ICsyOSw3IEBAIGluZGV4IDYxNmQ1OWYuLjg1YjViMWQgMTAwNjQ0CiAgCiAgCiAgIyBkbyBub3Qg
ZWRpdCBiZWxvdyB0aGlzIGxpbmUKLUBAIC0xOTksNyArMjAwLDcgQEAgZHZpOiBtdG9vbHMuZHZp
CitAQCAtMTg1LDcgKzE4Niw3IEBAIGR2aTogbXRvb2xzLmR2aQogIAogIHBzOiBtdG9vbHMucHMK
ICAlLnBzOiAlLmR2aQpAQCAtNDAsMTAgKzM5LDEwIEBAIGluZGV4IDYxNmQ1OWYuLjg1YjViMWQg
MTAwNjQ0CiAgcGRmOiBtdG9vbHMucGRmCiAgJS5wZGY6ICUudGV4aSBzeXNjb25mZGlyLnRleGkK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUuaW4gYi9jb25maWd1cmUuaW4KLWluZGV4IDVmZjc1YzEu
LmMwZjc0NDAgMTAwNjQ0CitpbmRleCAxZGU5MTZlLi5mZDZjYjA4IDEwMDY0NAogLS0tIGEvY29u
ZmlndXJlLmluCiArKysgYi9jb25maWd1cmUuaW4KLUBAIC0zNSw2ICszNSwzMyBAQCBBQ19DQU5P
TklDQUxfU1lTVEVNCitAQCAtMzIsNiArMzIsMzMgQEAgQUNfQ0FOT05JQ0FMX1RBUkdFVAogIEFD
X0NfQ09OU1QKICBBQ19DX0lOTElORQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210b29scy9tdG9vbHNfNC4wLjQzLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29s
cy9tdG9vbHNfNC4wLjQ0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40My5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ0LmJiCmluZGV4IDg1OTEwMzk3OWUu
LmQ4ZGQ2NzFiZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRv
b2xzXzQuMC40My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180
LjAuNDQuYmIKQEAgLTI0LDcgKzI0LDcgQEAgUlJFQ09NTUVORFM6JHtQTn06bGliYy1nbGliYyA9
ICJcCiAJZ2xpYmMtZ2NvbnYtaWJtODY2IFwKIAlnbGliYy1nY29udi1pYm04NjkgXAogCSIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI1NDFlMTc5NjY1ZGM0ZTI3MmI5NjAyZjIwNzQyNDM1OTFhMTU3
ZGE4OWNjNDcwNjRkYThjNTgyOWRiZDJiMzM5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3ZGM0
ZGYwMjI1MzNjM2Q0YjJlYzFjNzg5NzNjMjdjN2U4YjU4NTM3NGMyZDQ2YWI2NGM2YTNkYjMxZWRk
YjgiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9tdG9vbHMvbXRvb2xzLSR7UFZ9LnRhci5i
ejIgXAogICAgICAgICAgICBmaWxlOi8vbXRvb2xzLW1ha2VpbmZvLnBhdGNoIFwKLS0gCjIuNDQu
MAoK

--===============8999145774918758075==--

