Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5650CC369C5
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20167.1744723971557029177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VjNlfrWB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hKCiJVqO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019639a761f6-ce3c809d-2cc2-4c1d-a449-443204de1bd0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FZkukEjubRM5r+g56nKKfu8lNAr1HVvgwc5bQSMvmy0=;
	b=VjNlfrWBMV2EHXi5zb15B3PBXsEmJ8/YaRXgWpNRYNbnbMd8t+a2tBRUAPwN5uOg
	uM/e8rLWKryLs8cRaKc/6/T85edyOXaBLMv2sAqqk4J5Zf4li8gMPmALC6h0U4ysCU6
	6mdoM0t7vEa1+ZRrDWXMeS0sG0uy4H9V+ktV5cy0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FZkukEjubRM5r+g56nKKfu8lNAr1HVvgwc5bQSMvmy0=;
	b=hKCiJVqOpHaRthmhB+VpZeAWMe7aGBsPLp0OpI+VejMdciz1RP31qMnFcyIGrWvA
	jiLfU7/BIaZtN9ujcfW9FxtuQvsXWZn0T2v2D6XlMglJEB1SvnSZGXSpXHivyJ/H69F
	lil3yix9BbXGz2DD1M6UOu5unURfZ+pBUR2dAQuk=
Content-Type: multipart/mixed; boundary="===============4389587916511170159=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libffi: upgrading to 3.4.8 SUCCEEDED
Message-ID: <0101019639a761f6-ce3c809d-2cc2-4c1d-a449-443204de1bd0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214938

--===============4389587916511170159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libffi* to *3.4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libffi-upgrade-3.4.7-3.4.8.patch
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
From 0ed523e99d1de161ddaf5172c2f1f68582fd99dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 13:11:58 +0000
Subject: [PATCH] libffi: upgrade 3.4.7 -> 3.4.8

---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.4.7.bb => libffi_3.4.8.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.7.bb => libffi_3.4.8.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index f4ed839ed8..f594bf194f 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From be9d4cc110c159812699780348686da371296b94 Mon Sep 17 00:00:00 2001
+From 00f6054ac82cd066374460a86adda76463baa161 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 816bfd6..e37c5a8 100644
+index f047895..630bdd5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -401,7 +401,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -402,7 +402,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.4.7.bb b/meta/recipes-support/libffi/libffi_3.4.8.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.4.7.bb
rename to meta/recipes-support/libffi/libffi_3.4.8.bb
index b2caaa88ba..7f927c650b 100644
--- a/meta/recipes-support/libffi/libffi_3.4.7.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.8.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1db54c9fd307a12218766c3c7f650ca7"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "138607dee268bdecf374adf9144c00e839e38541f75f24a1fcf18b78fda48b2d"
+SRC_URI[sha256sum] = "bc9842a18898bfacb0ed1252c4febcc7e78fa139fd27fdc7a3e30d9d9356119b"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.1


--===============4389587916511170159==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.4.7-3.4.8.patch"

RnJvbSAwZWQ1MjNlOTlkMWRlMTYxZGRhZjUxNzJjMmYxZjY4NTgyZmQ5OWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTM6MTE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJmZmk6IHVwZ3JhZGUgMy40LjcgLT4gMy40LjgKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZmZpL2xpYmZmaS9ub3Qtd2luMzIucGF0Y2ggICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2xp
YmZmaS97bGliZmZpXzMuNC43LmJiID0+IGxpYmZmaV8zLjQuOC5iYn0gICAgICAgICAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkve2xpYmZmaV8zLjQuNy5iYiA9PiBsaWJm
ZmlfMy40LjguYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
ZmZpL2xpYmZmaS9ub3Qtd2luMzIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkv
bGliZmZpL25vdC13aW4zMi5wYXRjaAppbmRleCBmNGVkODM5ZWQ4Li5mNTk0YmYxOTRmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmU5ZDRjYzExMGMxNTk4MTI2OTk3ODAzNDg2ODZkYTM3
MTI5NmI5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDBmNjA1NGFjODJjZDA2NjM3
NDQ2MGE4NmFkZGE3NjQ2M2JhYTE2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUsIDQgRmViIDIwMTYg
MTY6MjI6NTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZmZpOiBlbnN1cmUgc3lzcm9vdCBw
YXRocyBhcmUgbm90IGluIGxpYmZmaS5wYwpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUu
YWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDgxNmJmZDYuLmUzN2M1YTggMTAwNjQ0CitpbmRleCBm
MDQ3ODk1Li42MzBiZGQ1IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1
cmUuYWMKLUBAIC00MDEsNyArNDAxLDcgQEAgQUNfQVJHX0VOQUJMRShtdWx0aS1vcy1kaXJlY3Rv
cnksCitAQCAtNDAyLDcgKzQwMiw3IEBAIEFDX0FSR19FTkFCTEUobXVsdGktb3MtZGlyZWN0b3J5
LAogIAogICMgVGhlc2UgdmFyaWFibGVzIGFyZSBvbmx5IGV2ZXIgdXNlZCB3aGVuIHdlIGNyb3Nz
LWJ1aWxkIHRvIFg4Nl9XSU4zMi4KICAjIEFuZCB3ZSBvbmx5IHN1cHBvcnQgdGhpcyB3aXRoIEdD
Qywgc28uLi4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlf
My40LjcuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNC44LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZm
aS9saWJmZmlfMy40LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9s
aWJmZmlfMy40LjguYmIKaW5kZXggYjJjYWFhODhiYS4uN2Y5MjdjNjUwYiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjQuNy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNC44LmJiCkBAIC0xMyw3ICsxMyw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTFkYjU0YzlmZDMwN2ExMjIxODc2
NmMzYzdmNjUwY2E3IgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7
UFZ9LyR7QlBOfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vbm90LXdpbjMyLnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEzODYwN2RlZTI2OGJk
ZWNmMzc0YWRmOTE0NGMwMGU4MzllMzg1NDFmNzVmMjRhMWZjZjE4Yjc4ZmRhNDhiMmQiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYmM5ODQyYTE4ODk4YmZhY2IwZWQxMjUyYzRmZWJjYzdlNzhmYTEz
OWZkMjdmZGM3YTNlMzBkOWQ5MzU2MTE5YiIKIAogRVhUUkFfT0VDT05GICs9ICItLWRpc2FibGUt
YnVpbGRkaXIgLS1kaXNhYmxlLWV4ZWMtc3RhdGljLXRyYW1wIgogRVhUUkFfT0VDT05GOmNsYXNz
LW5hdGl2ZSArPSAiLS13aXRoLWdjYy1hcmNoPWdlbmVyaWMiCi0tIAoyLjQ3LjEKCg==

--===============4389587916511170159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libffi: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.4.7/libffi-3.4.7.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.4.8/libffi-3.4.8.tar.gz file://not-win32.patch"
packages/core2-64-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 128176 to 128312 (+0%)
packages/core2-64-poky-linux/libffi/libffi-dbg: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-dbg: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-dev: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-dev: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-doc: PKGSIZE changed from 44791 to 44813 (+0%)
packages/core2-64-poky-linux/libffi/libffi-doc: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-doc: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-locale: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-locale: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-src: PKGSIZE changed from 319137 to 319143 (+0%)
packages/core2-64-poky-linux/libffi/libffi-src: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-src: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-staticdev: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi: PV changed from "3.4.7" to "3.4.8"

--===============4389587916511170159==--

