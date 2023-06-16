Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D1C3DA44
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.802.1686887482575530268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=APNnmv45;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2544196-9c72d38e-fa6e-4c03-aaf3-ecaf666d52cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kRCA00aAxG6EFLXB4kdPiJKUYcaw+xEKy60SGOiM8n8=;
	b=APNnmv4568F/x8N2u21KYVfWf2CnkFppkdnqsulvgeZgtYQbTCKmn7Ep0HL6kCr9
	faBvr0rDaANb+3wVZrVGYZGNlaObDDKeblgPjCUOuxhlHmuxgfC05Oij2tlOzmCxOmh
	RDuWPuQxZHUPWCYNZhKhT9lhfcWvHyPPguuqereM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kRCA00aAxG6EFLXB4kdPiJKUYcaw+xEKy60SGOiM8n8=;
	b=ooGM4Aut1LCkFdAiek/du8e+tpt1R8BKeW7B9OnbJbK748JKL1aCkVQsnz2ikSc7
	YxmYv7J2VpiaA8MBMknL0EMFSB5ZMDrnQ4FJ1R/MKIDIUSsIeNGFAg/IJ6SgRZdeh9D
	al4I2PdXgugniPxeL8yvdB2fHrVzLzhHbaY0ux0I=
Content-Type: multipart/mixed; boundary="===============3149943498054687107=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.8.2 SUCCEEDED
Message-ID: <01010188c2544196-9c72d38e-fa6e-4c03-aaf3-ecaf666d52cd-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182900

--===============3149943498054687107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.8.1-4.8.2.patch
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
From 151d4e97790d45c020fff7f1e9fc6400f003ab69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 08:19:36 +0000
Subject: [PATCH] ccache: upgrade 4.8.1 -> 4.8.2

---
 .../{ccache_4.8.1.bb => ccache_4.8.2.bb}      | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.8.1.bb => ccache_4.8.2.bb} (37%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.8.1.bb b/meta/recipes-devtools/ccache/ccache_4.8.2.bb
similarity index 37%
rename from meta/recipes-devtools/ccache/ccache_4.8.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.8.2.bb
index b0ae7fb25c..e9d157c480 100644
--- a/meta/recipes-devtools/ccache/ccache_4.8.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.8.2.bb
@@ -1,3 +1,36 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.adoc
+# +++ LICENSE.adoc
+# @@ -72,8 +72,8 @@
+#  
+#  === src/third_party/blake3/blake3_*
+#  
+# -This is a subset of https://github.com/BLAKE3-team/BLAKE3[BLAKE3] 1.3.1 with
+# -the following license:
+# +This is a subset of https://github.com/BLAKE3-team/BLAKE3[BLAKE3] 1.4.0 with the
+# +following license:
+#  
+#  ----
+#  This work is released into the public domain with CC0 1.0. Alternatively, it is
+# @@ -516,7 +516,7 @@
+#  === src/third_party/httplib.*
+#  
+#  cpp-httplib - A C++11 cross-platform HTTP/HTTPS library. Copied from cpp-httplib
+# -v0.12.3 downloaded from https://github.com/yhirose/cpp-httplib[cpp-httplib]. The
+# +v0.12.6 downloaded from https://github.com/yhirose/cpp-httplib[cpp-httplib]. The
+#  library has the following license:
+#  
+#  ----
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,14 +40,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=1601d62d6828fbe19b6f6c2d01fdff4c"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=cd54b7abfc462470b0f505273c38f0ff"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "869903c1891beb8bee87f1ec94d8a0dad18c2add4072c456acbc85cdfc23ca63"
+SRC_URI[sha256sum] = "75eef15b8b9da48db9c91e1d0ff58b3645fc70c0e4ca2ef1b6825a12f21f217d"
 
 inherit cmake github-releases
 
-- 
2.39.2


--===============3149943498054687107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 25574156 to 25490584 (-0%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1924171 to 1927081 (+0%)
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1697828 to 1693732 (-0%)
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.8.1" to "4.8.2"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.8.1/ccache-4.8.1.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.8.2/ccache-4.8.2.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.8.1 [default] to 4.8.2 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.8.1" to "4.8.2"

--===============3149943498054687107==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.8.1-4.8.2.patch"

RnJvbSAxNTFkNGU5Nzc5MGQ0NWMwMjBmZmY3ZjFlOWZjNjQwMGYwMDNhYjY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDg6MTk6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC44LjEgLT4gNC44LjIKCi0tLQogLi4uL3tjY2FjaGVfNC44LjEuYmIg
PT4gY2NhY2hlXzQuOC4yLmJifSAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuOC4xLmJiID0+IGNjYWNoZV80LjguMi5i
Yn0gKDM3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjguMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuOC4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggMzclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
Y2FjaGUvY2NhY2hlXzQuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2Nh
Y2hlL2NjYWNoZV80LjguMi5iYgppbmRleCBiMGFlN2ZiMjVjLi5lOWQxNTdjNDgwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjguMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjguMi5iYgpAQCAtMSwzICsxLDM2
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5hZG9jCisjICsrKyBMSUNFTlNFLmFk
b2MKKyMgQEAgLTcyLDggKzcyLDggQEAKKyMgIAorIyAgPT09IHNyYy90aGlyZF9wYXJ0eS9ibGFr
ZTMvYmxha2UzXyoKKyMgIAorIyAtVGhpcyBpcyBhIHN1YnNldCBvZiBodHRwczovL2dpdGh1Yi5j
b20vQkxBS0UzLXRlYW0vQkxBS0UzW0JMQUtFM10gMS4zLjEgd2l0aAorIyAtdGhlIGZvbGxvd2lu
ZyBsaWNlbnNlOgorIyArVGhpcyBpcyBhIHN1YnNldCBvZiBodHRwczovL2dpdGh1Yi5jb20vQkxB
S0UzLXRlYW0vQkxBS0UzW0JMQUtFM10gMS40LjAgd2l0aCB0aGUKKyMgK2ZvbGxvd2luZyBsaWNl
bnNlOgorIyAgCisjICAtLS0tCisjICBUaGlzIHdvcmsgaXMgcmVsZWFzZWQgaW50byB0aGUgcHVi
bGljIGRvbWFpbiB3aXRoIENDMCAxLjAuIEFsdGVybmF0aXZlbHksIGl0IGlzCisjIEBAIC01MTYs
NyArNTE2LDcgQEAKKyMgID09PSBzcmMvdGhpcmRfcGFydHkvaHR0cGxpYi4qCisjICAKKyMgIGNw
cC1odHRwbGliIC0gQSBDKysxMSBjcm9zcy1wbGF0Zm9ybSBIVFRQL0hUVFBTIGxpYnJhcnkuIENv
cGllZCBmcm9tIGNwcC1odHRwbGliCisjIC12MC4xMi4zIGRvd25sb2FkZWQgZnJvbSBodHRwczov
L2dpdGh1Yi5jb20veWhpcm9zZS9jcHAtaHR0cGxpYltjcHAtaHR0cGxpYl0uIFRoZQorIyArdjAu
MTIuNiBkb3dubG9hZGVkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL3loaXJvc2UvY3BwLWh0dHBs
aWJbY3BwLWh0dHBsaWJdLiBUaGUKKyMgIGxpYnJhcnkgaGFzIHRoZSBmb2xsb3dpbmcgbGljZW5z
ZToKKyMgIAorIyAgLS0tLQorIyAKKyMKKwogU1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGls
ZXIgY2FjaGUiCiBERVNDUklQVElPTiA9ICJjY2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQg
c3BlZWRzIHVwIHJlY29tcGlsYXRpb24gXAogYnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZp
b3VzIGNvbXBpbGF0aW9ucyBhbmQgZGV0ZWN0aW5nIHdoZW4gdGhlIFwKQEAgLTcsMTQgKzQwLDE0
IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9jY2FjaGUuc2FtYmEub3JnIgogU0VDVElPTiA9ICJkZXZl
bCIKIAogTElDRU5TRSA9ICJHUEwtMy4wLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRS5hZG9jO21kNT0xNjAxZDYyZDY4MjhmYmUxOWI2ZjZjMmQwMWZkZmY0YyIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYzttZDU9Y2Q1NGI3YWJmYzQ2
MjQ3MGIwZjUwNTI3M2MzOGYwZmYiCiAKIERFUEVORFMgPSAienN0ZCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLXh4aGFzaC5oLUZpeC1idWlsZC13aXRoLWdjYy0xMi5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4Njk5MDNjMTg5MWJlYjhiZWU4N2Yx
ZWM5NGQ4YTBkYWQxOGMyYWRkNDA3MmM0NTZhY2JjODVjZGZjMjNjYTYzIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjc1ZWVmMTViOGI5ZGE0OGRiOWM5MWUxZDBmZjU4YjM2NDVmYzcwYzBlNGNhMmVm
MWI2ODI1YTEyZjIxZjIxN2QiCiAKIGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKLS0g
CjIuMzkuMgoK

--===============3149943498054687107==--

