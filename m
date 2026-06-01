Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971E7CD6E69
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1571.1780328137954552047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KGtqwvLA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e340jAzb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3827a-850a897d-758e-480d-9825-f925b6773b47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jl2ZPHydMRZDWhOZ/dzEfcKOwaLZbIpZfM9VaUr3NJY=;
	b=KGtqwvLAoJbFVuTxN2/pzVwoXf3mIieuXNITO21GxNiGVWKcdT0b70dyRBZPwxDU
	1IAtHrMVP9KfyxvevepfS23jV89OK7jxMhftyDkTvWDrH8JJ/SicfMAW94pnQPspwZO
	ti0ecdSAzcqcEd/erxO+Mn4EwEruPGV2iGxPR64E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jl2ZPHydMRZDWhOZ/dzEfcKOwaLZbIpZfM9VaUr3NJY=;
	b=e340jAzbUo15HKHLBq3kqF0N7bYR0V70wrG9uKdmZ8EftDsTH1iSrs0kNC5Qum9/
	l7npmP4pc9u+Xo7O+yO1Vn+Wv6tVyVUgqFvFS3PtpsVd2SPMjo8SEt6WWa5V0Y3ze1u
	AvBeJy5VxZ1rMDNjgbMAp6jQEhHn2aVz3rzYPGpM=
Content-Type: multipart/mixed; boundary="===============3197829027271836207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.23 SUCCEEDED
Message-ID: <0101019e83d3827a-850a897d-758e-480d-9825-f925b6773b47-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237878

--===============3197829027271836207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-docutils* to *0.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.22.4-0.23.patch
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
From 196d4c50f459104fcd515bdbfd0f8c142a5aa73e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:22:16 +0000
Subject: [PATCH] python3-docutils: upgrade 0.22.4 -> 0.23

---
 .../{python3-docutils_0.22.4.bb => python3-docutils_0.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.4.bb => python3-docutils_0.23.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb b/meta/recipes-devtools/python/python3-docutils_0.23.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.4.bb
rename to meta/recipes-devtools/python/python3-docutils_0.23.bb
index 571a19a958..91592d470c 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.23.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
+SRC_URI[sha256sum] = "746f5060322511280a1e50eb76846ed6bf2342984b2ac04dc42caa1a8d78799e"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============3197829027271836207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/WHEEL was removed

--===============3197829027271836207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.22.4-0.23.patch"

RnJvbSAxOTZkNGM1MGY0NTkxMDRmY2Q1MTViZGJmZDBmOGMxNDJhNWFhNzNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODoyMjoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZG9jdXRpbHM6IHVwZ3JhZGUgMC4yMi40IC0+IDAuMjMKCi0tLQogLi4uL3tweXRob24z
LWRvY3V0aWxzXzAuMjIuNC5iYiA9PiBweXRob24zLWRvY3V0aWxzXzAuMjMuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kb2N1dGlsc18wLjIyLjQuYmIg
PT4gcHl0aG9uMy1kb2N1dGlsc18wLjIzLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjIyLjQuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZG9jdXRpbHNfMC4yMi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMy5iYgppbmRleCA1NzFhMTlhOTU4Li45MTU5MmQ0NzBj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRp
bHNfMC4yMi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1k
b2N1dGlsc18wLjIzLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIK
IExJQ0VOU0UgPSAiQ0MwLTEuMCAmIEJTRC0yLUNsYXVzZSAmIEdQTC0zLjAtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcucnN0O21kNT1jZTQ2N2IwNGIzNWM3YWMzNDI5
YjY5MDhmYzhiMzE4ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkYjUzYjFmZGU5YWJlY2Ji
NzRkOTEyMzBkMzJhYjYyNmQ5NGY2YmFkZmM1NzVkNmRiOTE5NGE0OWRmMjk5NjgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNzQ2ZjUwNjAzMjI1MTEyODBhMWU1MGViNzY4NDZlZDZiZjIzNDI5ODRi
MmFjMDRkYzQyY2FhMWE4ZDc4Nzk5ZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUK
IAotLSAKMi40Ny4xCgo=

--===============3197829027271836207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-docutils: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.4.tar.gz;downloadfilename=docutils-0.22.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.23.tar.gz;downloadfilename=docutils-0.23.tar.gz"
packages/x86-64-v3-poky-linux/python3-docutils: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PV changed from "0.22.4" to "0.23"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.22.4 [default] to 0.23 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses, directory renamed /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 4503201 to 4520999 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/docutils-0.23.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/docutils-0.22.4.dist-info/WHEEL was removed

--===============3197829027271836207==--

