Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3042EC3ABCE
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1774.1746113609447995714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IVSFwyV8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NG7PcZ7z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7bb8cd-7b468b0a-ee23-41c6-92fd-5d92fabd8dde-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CecZ/kFTsVp1jxoZ34cmd8PaEbC+rzOr0OH1wWOSjOA=;
	b=IVSFwyV8jebhdKL5B5W6cKmmsVb5761RsUVDlTFMG4c2nIs3qjljAKLYZ4YNlK2P
	2yk5HmN8/iT0oU817yGfDH2HnLkpamHZG87uV7NAojtqWeCxR0qpEQ8nsmsxFUsmQRm
	rlVrYclnW3BZR2cIMqiOHmGW6ToW/wlotO6+j9dE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CecZ/kFTsVp1jxoZ34cmd8PaEbC+rzOr0OH1wWOSjOA=;
	b=NG7PcZ7zXjHJcTAE+nQ8VuNy2W7xKXos5uYwqEEZO2khdKvT2Ll/hNRaC4xG59O6
	g2W9d3OgKJ3xY2i9oQ0X2rSEqVUm6V6ZsOrvzEv2IPisS1xC4uyU7xqk32GeKFd6Azv
	1gPW/9ug4jWloOUxICyjYoXScnc3p8rJJAr1KHpA=
Content-Type: multipart/mixed; boundary="===============4705044699618258729=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libffi: upgrading to 3.4.8 SUCCEEDED
Message-ID: <010101968c7bb8cd-7b468b0a-ee23-41c6-92fd-5d92fabd8dde-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215895

--===============4705044699618258729==
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
From c595d045bb581afd56f7c56c2e6419b7312dc5d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 14:57:16 +0000
Subject: [PATCH] libffi: upgrade 3.4.7 -> 3.4.8

---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.4.7.bb => libffi_3.4.8.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.7.bb => libffi_3.4.8.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index f4ed839ed8..78d0fc2d21 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From be9d4cc110c159812699780348686da371296b94 Mon Sep 17 00:00:00 2001
+From fb63737d37f776e6b7f56450b9ca8744c49631db Mon Sep 17 00:00:00 2001
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


--===============4705044699618258729==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.4.7-3.4.8.patch"

RnJvbSBjNTk1ZDA0NWJiNTgxYWZkNTZmN2M1NmMyZTY0MTliNzMxMmRjNWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNDo1NzoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmZmaTogdXBncmFkZSAzLjQuNyAtPiAzLjQuOAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaCAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vbGli
ZmZpL3tsaWJmZmlfMy40LjcuYmIgPT4gbGliZmZpXzMuNC44LmJifSAgICAgICAgICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS97bGliZmZpXzMuNC43LmJiID0+IGxpYmZm
aV8zLjQuOC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJm
ZmkvbGliZmZpL25vdC13aW4zMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9s
aWJmZmkvbm90LXdpbjMyLnBhdGNoCmluZGV4IGY0ZWQ4MzllZDguLjc4ZDBmYzJkMjEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZTlkNGNjMTEwYzE1OTgxMjY5OTc4MDM0ODY4NmRhMzcx
Mjk2Yjk0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYjYzNzM3ZDM3Zjc3NmU2Yjdm
NTY0NTBiOWNhODc0NGM0OTYzMWRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFRodSwgNCBGZWIgMjAxNiAx
NjoyMjo1MCArMDAwMAogU3ViamVjdDogW1BBVENIXSBsaWJmZmk6IGVuc3VyZSBzeXNyb290IHBh
dGhzIGFyZSBub3QgaW4gbGliZmZpLnBjCkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1i
eTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5h
YyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggODE2YmZkNi4uZTM3YzVhOCAxMDA2NDQKK2luZGV4IGYw
NDc4OTUuLjYzMGJkZDUgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3Vy
ZS5hYwotQEAgLTQwMSw3ICs0MDEsNyBAQCBBQ19BUkdfRU5BQkxFKG11bHRpLW9zLWRpcmVjdG9y
eSwKK0BAIC00MDIsNyArNDAyLDcgQEAgQUNfQVJHX0VOQUJMRShtdWx0aS1vcy1kaXJlY3Rvcnks
CiAgCiAgIyBUaGVzZSB2YXJpYWJsZXMgYXJlIG9ubHkgZXZlciB1c2VkIHdoZW4gd2UgY3Jvc3Mt
YnVpbGQgdG8gWDg2X1dJTjMyLgogICMgQW5kIHdlIG9ubHkgc3VwcG9ydCB0aGlzIHdpdGggR0ND
LCBzby4uLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8z
LjQuNy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy40LjguYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZp
L2xpYmZmaV8zLjQuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xp
YmZmaV8zLjQuOC5iYgppbmRleCBiMmNhYWE4OGJhLi43ZjkyN2M2NTBiIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNC43LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy40LjguYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MWRiNTRjOWZkMzA3YTEyMjE4NzY2
YzNjN2Y2NTBjYTciCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQ
Vn0vJHtCUE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ub3Qtd2luMzIucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTM4NjA3ZGVlMjY4YmRl
Y2YzNzRhZGY5MTQ0YzAwZTgzOWUzODU0MWY3NWYyNGExZmNmMThiNzhmZGE0OGIyZCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiYzk4NDJhMTg4OThiZmFjYjBlZDEyNTJjNGZlYmNjN2U3OGZhMTM5
ZmQyN2ZkYzdhM2UzMGQ5ZDkzNTYxMTliIgogCiBFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS1i
dWlsZGRpciAtLWRpc2FibGUtZXhlYy1zdGF0aWMtdHJhbXAiCiBFWFRSQV9PRUNPTkY6Y2xhc3Mt
bmF0aXZlICs9ICItLXdpdGgtZ2NjLWFyY2g9Z2VuZXJpYyIKLS0gCjIuNDcuMQoK

--===============4705044699618258729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libffi: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.4.7/libffi-3.4.7.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.4.8/libffi-3.4.8.tar.gz file://not-win32.patch"
packages/core2-64-poky-linux/libffi/libffi-dbg: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-dbg: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 128048 to 128184 (+0%)
packages/core2-64-poky-linux/libffi/libffi-dev: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-dev: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-doc: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-doc: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-doc: PKGSIZE changed from 44791 to 44813 (+0%)
packages/core2-64-poky-linux/libffi/libffi-locale: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-locale: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-src: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-src: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi-staticdev: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.4.7 [default] to 3.4.8 [default]
packages/core2-64-poky-linux/libffi/libffi: PV changed from "3.4.7" to "3.4.8"
packages/core2-64-poky-linux/libffi/libffi: PKGV changed from 3.4.7 [default] to 3.4.8 [default]

--===============4705044699618258729==--

