Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDDCC5B557
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.131416.1723748333739600321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E0Gcg72p;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1o8QIXJW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019157683855-94b2c925-a156-461c-b44c-ab534091b4f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9hvs+SsiD3qsz/RrDcBh3ATUZVJt+ySRDYvYKB7VnPI=;
	b=E0Gcg72p/dSqCYLPMJDqBjMtqRAa6WoDKF/aNCPzfAt9IIkEDWzgwz8bGy8TorHI
	bKAaB9KWK1sDbsirSQXPWCHC9FBFoaRLp0evd15MninGyIi0IyW1GqM8jYFPzyQaMJ5
	5ka5pWrCT45VL2l6YCDDIhu+wAEipNti7iU81EjA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9hvs+SsiD3qsz/RrDcBh3ATUZVJt+ySRDYvYKB7VnPI=;
	b=1o8QIXJWh4IKv/nhiLEHW7nBpcl0/fHhCgqzc9cqZCMR92ivLdvIK+TvILDDBkja
	IZal6qUyqehV3p9xar75/AaZlH/Z+FmYRT2C4YfYOq7OSV8N+2cToEfKcUuoKGilEea
	Wb0kD+eSR8Py29BssrmxMVxxxsU6OB+Htvl8jWJ4=
Content-Type: multipart/mixed; boundary="===============3598367775216559985=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20240808-3.1 SUCCEEDED
Message-ID: <0101019157683855-94b2c925-a156-461c-b44c-ab534091b4f5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203354

--===============3598367775216559985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libedit* to *20240808-3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libedit-upgrade-20240517-3.1-20240808-3.1.patch
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
From e6d86b3e0307bc2967c68c4fecee0d04c8642789 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 10:38:38 +0000
Subject: [PATCH] libedit: upgrade 20240517-3.1 -> 20240808-3.1

---
 .../libedit/libedit/stdc-predef.patch            | 16 ++++++++++++----
 ...t_20240517-3.1.bb => libedit_20240808-3.1.bb} |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20240517-3.1.bb => libedit_20240808-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
index 75ef308fad..0ce6d127a9 100644
--- a/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
+++ b/meta/recipes-devtools/libedit/libedit/stdc-predef.patch
@@ -1,13 +1,21 @@
+From 32918b3a91d9fe4719bba78a44ec3262a2994e68 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jul 2019 10:48:19 -0700
+Subject: [PATCH] libedit: Move from meta-oe
+
 __STDC_ISO_10646__ is defined in stdc-predef.h
 therefore include it to see if its there on a platform
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/chartype.h | 1 +
+ 1 file changed, 1 insertion(+)
 
-Index: libedit-20160903-3.1/src/chartype.h
-===================================================================
---- libedit-20160903-3.1.orig/src/chartype.h
-+++ libedit-20160903-3.1/src/chartype.h
+diff --git a/src/chartype.h b/src/chartype.h
+index bcdb293..92327d3 100644
+--- a/src/chartype.h
++++ b/src/chartype.h
 @@ -29,6 +29,7 @@
  #ifndef _h_chartype_f
  #define _h_chartype_f
diff --git a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
index f8fa871ec9..56fee04ebb 100644
--- a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "3a489097bb4115495f3bd85ae782852b7097c556d9500088d74b6fa38dbd12ff"
+SRC_URI[sha256sum] = "5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.44.0


--===============3598367775216559985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libedit/libedit-dev: RRECOMMENDS: removed "update-alternatives-opkg-dev"
packages/core2-64-poky-linux/libedit/libedit-doc: FILELIST: removed "/usr/share/man/man3/tok_wend.3 /usr/share/man/man3/history_end.3 /usr/share/man/man3/tok_wreset.3 /usr/share/man/man3/history_winit.3 /usr/share/man/man3/tok_end.3 /usr/share/man/man3/tok_wline.3 /usr/share/man/man3/tok_line.3 /usr/share/man/man3/tok_init.3 /usr/share/man/man3/tok_winit.3 /usr/share/man/man3/history_wend.3 /usr/share/man/man3/tok_wstr.3 /usr/share/man/man3/history_w.3 /usr/share/man/man3/history_init.3 /usr/share/man/man3/history.3.libedit /usr/share/man/man3/tok_reset.3 /usr/share/man/man3/tok_str.3", added "/usr/share/man/man3/el_tok_wreset.3 /usr/share/man/man3/el_tok_end.3 /usr/share/man/man3/el_history_wend.3 /usr/share/man/man3/el_history_end.3 /usr/share/man/man3/el_tok_line.3 /usr/share/man/man3/el_tok_wend.3 /usr/share/man/man3/el_tok_wstr.3 /usr/share/man/man3/el_history_w.3 /usr/share/man/man3/el_history_init.3 /usr/share/man/man3/el_tok_str.3 /usr/share/man/man3/el_history.3 /usr/share/m
 an/man3/el_tok_reset.3 /usr/share/man/man3/el_tok_winit.3 /usr/share/man/man3/el_tok_wline.3 /usr/share/man/man3/el_tok_init.3 /usr/share/man/man3/el_history_winit.3"
packages/core2-64-poky-linux/libedit/libedit-doc: RDEPENDS: removed all items "update-alternatives-opkg"
packages/core2-64-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.73", added "/usr/lib/libedit.so.0.0.74"
Changes to packages/core2-64-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so.0.0.73 moved to /usr/lib/libedit.so.0.0.74
Changes to packages/x86_64-linux/libedit-native (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so.0.0.73 moved to /usr/lib/libedit.so.0.0.74
packages/core2-64-poky-linux/libedit/libedit-doc: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/share/man/man3/history.3 history.3 /usr/share/man/man3/history.3.libedit 90
  --
packages/core2-64-poky-linux/libedit/libedit-doc: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  history.3 /usr/share/man/man3/history.3.libedit
  --

--===============3598367775216559985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)
packages/core2-64-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20240517-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20240808-3.1.tar.gz file://stdc-predef.patch"
packages/core2-64-poky-linux/libedit: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit-dbg: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/.debug/libedit.so.0.0.73", added "/usr/lib/.debug/libedit.so.0.0.74"
packages/core2-64-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 582224 to 582424 (+0%)
packages/core2-64-poky-linux/libedit/libedit-dbg: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit-dev: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit-dev: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit-dev: RRECOMMENDS: removed "update-alternatives-opkg-dev"
packages/core2-64-poky-linux/libedit/libedit-doc: RDEPENDS: removed all items "update-alternatives-opkg"
packages/core2-64-poky-linux/libedit/libedit-doc: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit-doc: FILELIST: removed "/usr/share/man/man3/history_init.3 /usr/share/man/man3/history_wend.3 /usr/share/man/man3/history.3.libedit /usr/share/man/man3/history_winit.3 /usr/share/man/man3/tok_winit.3 /usr/share/man/man3/tok_wreset.3 /usr/share/man/man3/tok_reset.3 /usr/share/man/man3/history_w.3 /usr/share/man/man3/tok_wstr.3 /usr/share/man/man3/tok_wend.3 /usr/share/man/man3/tok_wline.3 /usr/share/man/man3/tok_line.3 /usr/share/man/man3/history_end.3 /usr/share/man/man3/tok_init.3 /usr/share/man/man3/tok_str.3 /usr/share/man/man3/tok_end.3", added "/usr/share/man/man3/el_tok_winit.3 /usr/share/man/man3/el_history_init.3 /usr/share/man/man3/el_tok_wline.3 /usr/share/man/man3/el_tok_wreset.3 /usr/share/man/man3/el_tok_reset.3 /usr/share/man/man3/el_history.3 /usr/share/man/man3/el_tok_line.3 /usr/share/man/man3/el_tok_str.3 /usr/share/man/man3/el_tok_wend.3 /usr/share/man/man3/el_tok_wstr.3 /usr/share/man/man3/el_history_winit.3 /usr/share/
 man/man3/el_history_end.3 /usr/share/man/man3/el_history_w.3 /usr/share/man/man3/el_history_wend.3 /usr/share/man/man3/el_tok_init.3 /usr/share/man/man3/el_tok_end.3"
packages/core2-64-poky-linux/libedit/libedit-doc: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit-locale: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit-locale: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit-src: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit-src: PKGSIZE changed from 587693 to 587994 (+0%)
packages/core2-64-poky-linux/libedit/libedit-src: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit-staticdev: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit-staticdev: PV changed from "20240517-3.1" to "20240808-3.1"
packages/core2-64-poky-linux/libedit/libedit: PKGV changed from 20240517-3.1 [default] to 20240808-3.1 [default]
packages/core2-64-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.73", added "/usr/lib/libedit.so.0.0.74"
packages/core2-64-poky-linux/libedit/libedit: PV changed from "20240517-3.1" to "20240808-3.1"
Changes to packages/core2-64-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so.0.0.73 moved to /usr/lib/libedit.so.0.0.74
Changes to packages/x86_64-linux/libedit-native (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.73 to libedit.so.0.0.74
  /usr/lib/libedit.so.0.0.73 moved to /usr/lib/libedit.so.0.0.74
packages/core2-64-poky-linux/libedit/libedit-doc: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/share/man/man3/history.3 history.3 /usr/share/man/man3/history.3.libedit 90
  --
packages/core2-64-poky-linux/libedit/libedit-doc: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  history.3 /usr/share/man/man3/history.3.libedit
  --

--===============3598367775216559985==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20240517-3.1-20240808-3.1.patch"

RnJvbSBlNmQ4NmIzZTAzMDdiYzI5NjdjNjhjNGZlY2VlMGQwNGM4NjQyNzg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTA6Mzg6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJlZGl0OiB1cGdyYWRlIDIwMjQwNTE3LTMuMSAtPiAyMDI0MDgwOC0zLjEKCi0tLQogLi4uL2xp
YmVkaXQvbGliZWRpdC9zdGRjLXByZWRlZi5wYXRjaCAgICAgICAgICAgIHwgMTYgKysrKysrKysr
KysrLS0tLQogLi4udF8yMDI0MDUxNy0zLjEuYmIgPT4gbGliZWRpdF8yMDI0MDgwOC0zLjEuYmJ9
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC97bGliZWRpdF8yMDI0MDUx
Ny0zLjEuYmIgPT4gbGliZWRpdF8yMDI0MDgwOC0zLjEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdC9zdGRjLXByZWRlZi5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXQvc3RkYy1wcmVkZWYucGF0Y2gK
aW5kZXggNzVlZjMwOGZhZC4uMGNlNmQxMjdhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmVkaXQvbGliZWRpdC9zdGRjLXByZWRlZi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0L3N0ZGMtcHJlZGVmLnBhdGNoCkBAIC0xLDEzICsx
LDIxIEBACitGcm9tIDMyOTE4YjNhOTFkOWZlNDcxOWJiYTc4YTQ0ZWMzMjYyYTI5OTRlNjggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgorRGF0ZTogV2VkLCAzMSBKdWwgMjAxOSAxMDo0ODoxOSAtMDcwMAorU3ViamVjdDogW1BBVENI
XSBsaWJlZGl0OiBNb3ZlIGZyb20gbWV0YS1vZQorCiBfX1NURENfSVNPXzEwNjQ2X18gaXMgZGVm
aW5lZCBpbiBzdGRjLXByZWRlZi5oCiB0aGVyZWZvcmUgaW5jbHVkZSBpdCB0byBzZWUgaWYgaXRz
IHRoZXJlIG9uIGEgcGxhdGZvcm0KIAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorLS0tCisgc3JjL2NoYXJ0eXBl
LmggfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAotSW5kZXg6IGxpYmVk
aXQtMjAxNjA5MDMtMy4xL3NyYy9jaGFydHlwZS5oCi09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gbGliZWRpdC0y
MDE2MDkwMy0zLjEub3JpZy9zcmMvY2hhcnR5cGUuaAotKysrIGxpYmVkaXQtMjAxNjA5MDMtMy4x
L3NyYy9jaGFydHlwZS5oCitkaWZmIC0tZ2l0IGEvc3JjL2NoYXJ0eXBlLmggYi9zcmMvY2hhcnR5
cGUuaAoraW5kZXggYmNkYjI5My4uOTIzMjdkMyAxMDA2NDQKKy0tLSBhL3NyYy9jaGFydHlwZS5o
CisrKysgYi9zcmMvY2hhcnR5cGUuaAogQEAgLTI5LDYgKzI5LDcgQEAKICAjaWZuZGVmIF9oX2No
YXJ0eXBlX2YKICAjZGVmaW5lIF9oX2NoYXJ0eXBlX2YKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNDA1MTctMy4xLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8yMDI0MDgwOC0zLjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8y
MDI0MDUxNy0zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xp
YmVkaXRfMjAyNDA4MDgtMy4xLmJiCmluZGV4IGY4ZmE4NzFlYzkuLjU2ZmVlMDRlYmIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNDA1MTctMy4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyNDA4MDgt
My4xLmJiCkBAIC0xMyw3ICsxMyw3IEBAIGluaGVyaXQgYXV0b3Rvb2xzCiBTUkNfVVJJID0gImh0
dHA6Ly93d3cudGhyeXNvZWUuZGsvZWRpdGxpbmUvJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAg
ZmlsZTovL3N0ZGMtcHJlZGVmLnBhdGNoIFwKICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiM2E0ODkwOTdiYjQxMTU0OTVmM2JkODVhZTc4Mjg1MmI3MDk3YzU1NmQ5NTAwMDg4ZDc0
YjZmYTM4ZGJkMTJmZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZjA1NzMzNDlkNzdjNGE0ODk2
NzE5MWNkZDY2MzRkZDdhYTVmNjM5OGM2YTU3ZmUwMzdjYzAyNjk2ZDYwOTlmIgogCiBCQkNMQVNT
RVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDQuMAoK

--===============3598367775216559985==--

