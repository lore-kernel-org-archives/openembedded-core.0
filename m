Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF49C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:35:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.501.1785476098230444818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bjQUBPrM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MfbJ4Joj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019fb6ab24e8-30870dce-4694-4dd0-bb32-c9fb5ec0f474-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785476097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=piNGLnvXcb9MU/+HU21O70UpKuABwAt6tnozxCf85v8=;
	b=bjQUBPrMmR9wGmVs7NWaYBzR+jl5d0IduwsInc1eSTFgZyON2WpvBVr5xQw8PWIv
	Ur4sBtU7AJgkUlCoxwKoMzzfGeXMlIsgPPkiABx1tEsU2yIQFr5KAn1sUgS4E5bGVK0
	jPgfO3kef/EBfsKwpa+TkBHjJAUKlomYEfLab6PQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785476097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=piNGLnvXcb9MU/+HU21O70UpKuABwAt6tnozxCf85v8=;
	b=MfbJ4JojipD86BHBKu1kSNXLFzk8AtqRRyeDxHp0K2BHUO5rUIpmfBwu6wO9QcI2
	+Cuk9X/Wy7/M2/qyGK3rw1Fsu/zUtL3meMa0mLEHB5v1J4KrTnWoCPJ0PvGCfB/EaMf
	tEauC1Y5IF+Ihs5JVCFCOoQIkXqmQIfn7o11dXnM=
Content-Type: multipart/mixed; boundary="===============7384038393778493724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.10.3 SUCCEEDED
Message-ID: <0101019fb6ab24e8-30870dce-4694-4dd0-bb32-c9fb5ec0f474-000000@us-west-2.amazonses.com>
Date: Fri, 31 Jul 2026 05:34:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.31-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242394

--===============7384038393778493724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.10.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.10.2-3.10.3.patch
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
From 1962accfbcb8126f195c5f61c0a63a202d02d749 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 31 Jul 2026 05:27:52 +0000
Subject: [PATCH] python3-markdown: upgrade 3.10.2 -> 3.10.3

Source: docs/changelog.md

## [3.10.3] - 2026-07-30

### Fixed

* Fix `SetextHeaderProcessor` regex to prevent mixed `=` and `-` chars in setext-style headers (#1606).
* Add AI Policy to Contributing Guide.
* Officially document all included extensions as being in maintenance mode.
* Link the Extension API documentation to the API Reference (#1612).
---
 .../{python3-markdown_3.10.2.bb => python3-markdown_3.10.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.2.bb => python3-markdown_3.10.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.2.bb b/meta/recipes-devtools/python/python3-markdown_3.10.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.2.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.3.bb
index 6a35e0def8..a7fd3d7840 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950"
+SRC_URI[sha256sum] = "3589362618f743188b4d955b874402bc814f4f83f544dc207719f4baa7d9c45f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============7384038393778493724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markdown-changelog.txt"

Changelog for python3-markdown: 3.10.2 -> 3.10.3
Source: docs/changelog.md

## [3.10.3] - 2026-07-30

### Fixed

* Fix `SetextHeaderProcessor` regex to prevent mixed `=` and `-` chars in setext-style headers (#1606).
* Add AI Policy to Contributing Guide.
* Officially document all included extensions as being in maintenance mode.
* Link the Extension API documentation to the API Reference (#1612).

--===============7384038393778493724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.10.2-3.10.3.patch"

RnJvbSAxOTYyYWNjZmJjYjgxMjZmMTk1YzVmNjFjMGE2M2EyMDJkMDJkNzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzEgSnVsIDIwMjYgMDU6Mjc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuMTAuMiAtPiAzLjEwLjMKClNvdXJjZTogZG9jcy9j
aGFuZ2Vsb2cubWQKCiMjIFszLjEwLjNdIC0gMjAyNi0wNy0zMAoKIyMjIEZpeGVkCgoqIEZpeCBg
U2V0ZXh0SGVhZGVyUHJvY2Vzc29yYCByZWdleCB0byBwcmV2ZW50IG1peGVkIGA9YCBhbmQgYC1g
IGNoYXJzIGluIHNldGV4dC1zdHlsZSBoZWFkZXJzICgjMTYwNikuCiogQWRkIEFJIFBvbGljeSB0
byBDb250cmlidXRpbmcgR3VpZGUuCiogT2ZmaWNpYWxseSBkb2N1bWVudCBhbGwgaW5jbHVkZWQg
ZXh0ZW5zaW9ucyBhcyBiZWluZyBpbiBtYWludGVuYW5jZSBtb2RlLgoqIExpbmsgdGhlIEV4dGVu
c2lvbiBBUEkgZG9jdW1lbnRhdGlvbiB0byB0aGUgQVBJIFJlZmVyZW5jZSAoIzE2MTIpLgotLS0K
IC4uLi97cHl0aG9uMy1tYXJrZG93bl8zLjEwLjIuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjEw
LjMuYmJ9ICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFya2Rv
d25fMy4xMC4yLmJiID0+IHB5dGhvbjMtbWFya2Rvd25fMy4xMC4zLmJifSAoNzklKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjEw
LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4x
MC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjEwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjEwLjMuYmIKaW5kZXggNmEz
NWUwZGVmOC4uYTdmZDNkNzg0MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMC4zLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1lYzU4Y2RmN2NmZWQwNmEyMWY3
YTkzNjI2MjdhNTQ4MCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21l
dGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk5NGQ1MTMyNWQyNWFkOGFhN2NlNGViYWVjMDAz
ZmViY2NlODIyYzNmOGM5MTFlM2IxN2M1MmY3ZjU4OWY5NTAiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMzU4OTM2MjYxOGY3NDMxODhiNGQ5NTViODc0NDAyYmM4MTRmNGY4M2Y1NDRkYzIwNzcxOWY0
YmFhN2Q5YzQ1ZiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoy
LjQ3LjEKCg==

--===============7384038393778493724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info

--===============7384038393778493724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.10.2.tar.gz;downloadfilename=markdown-3.10.2.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.10.3.tar.gz;downloadfilename=markdown-3.10.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.10.2" to "3.10.3"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.10.2 [default] to 3.10.3 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 754773 to 777645 (+3%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.10.3.dist-info

--===============7384038393778493724==--

