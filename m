Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FE5C36018
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10360.1742048293526563129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jQP9LM63;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ESupOzHe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101959a2b8906-3fc4c687-6b53-4e3f-b991-cd951ad1cdeb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1BWvZHBPUuFvlpjYwRYUq7ERJkY2Pnt9w0dJ66vxrpU=;
	b=jQP9LM63OWnLi9R3ddLA564cF7ZUjDXX74RqGycGc8TqVG8d/wUVfqLAUvbbKiBn
	9a7u2Xgo9Q1xPBVebFcI8S70PGjY5VI09Ase6FwzPMeA/tqTPy6mKclD5ERHYKrLUNC
	HGPh53+xwM1VGn3he1dYQg/PIOyhnt5oej1KGOp8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1BWvZHBPUuFvlpjYwRYUq7ERJkY2Pnt9w0dJ66vxrpU=;
	b=ESupOzHepkPJFCT0eJXochcloRdvZOpdd1N3CYbAuoAi7BPKa2seYMGanbibMLQA
	X1uyDKr6RqNwmwYJO83bfsFnCaFDaby8f7S4x44AHEjyuhAzzxJlg5fojxU3DeGpv9J
	PmtbB5s2cQiFlr9TAnDrFyfErAjvz+0+ywFhILyo=
Content-Type: multipart/mixed; boundary="===============4927707116494114142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.9.1 SUCCEEDED
Message-ID: <010101959a2b8906-3fc4c687-6b53-4e3f-b991-cd951ad1cdeb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212910

--===============4927707116494114142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-metadata-upgrade-0.9.0-0.9.1.patch
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
From 1ffe0fb8fddccad796a72a25c10f56aa912b96cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:28:33 +0000
Subject: [PATCH] python3-pyproject-metadata: upgrade 0.9.0 -> 0.9.1

---
 ...ct-metadata_0.9.0.bb => python3-pyproject-metadata_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.9.0.bb => python3-pyproject-metadata_0.9.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
index a73d4277b1..4c58da3c07 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8511c00a4cad96686af6a6b4143433298beb96105a9379afdc9b0328f4f260c9"
+SRC_URI[sha256sum] = "b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa10528e9e1a954a816"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.44.1


--===============4927707116494114142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-metadata-upgrade-0.9.0-0.9.1.patch"

RnJvbSAxZmZlMGZiOGZkZGNjYWQ3OTZhNzJhMjVjMTBmNTZhYTkxMmI5NmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6Mjg6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cHJvamVjdC1tZXRhZGF0YTogdXBncmFkZSAwLjkuMCAtPiAwLjkuMQoKLS0tCiAu
Li5jdC1tZXRhZGF0YV8wLjkuMC5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjku
MS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cHJvamVj
dC1tZXRhZGF0YV8wLjkuMC5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjkuMS5i
Yn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuOS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjkuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlw
cm9qZWN0LW1ldGFkYXRhXzAuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuOS4xLmJiCmluZGV4IGE3M2Q0Mjc3
YjEuLjRjNThkYTNjMDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC45LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjkuMS5iYgpAQCAtMTcs
NyArMTcsNyBAQCBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiODUxMWMwMGE0Y2FkOTY2ODZhZjZhNmI0MTQzNDMzMjk4YmViOTYxMDVh
OTM3OWFmZGM5YjAzMjhmNGYyNjBjOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiOGIyMjUzZGQx
YjcwNjJiNzhjZjk0OWExMTVmMDJiYTdmYTQxMTRhYWJlNjNmYTEwNTI4ZTllMWE5NTRhODE2Igog
CiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWxvZ2dpbmcgXAotLSAKMi40NC4x
Cgo=

--===============4927707116494114142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyproject-metadata: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.9.0.tar.gz;downloadfilename=pyproject_metadata-0.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.9.1.tar.gz;downloadfilename=pyproject_metadata-0.9.1.tar.gz"
packages/core2-64-poky-linux/python3-pyproject-metadata: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PV changed from "0.9.0" to "0.9.1"
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGV changed from 0.9.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 120163 to 124402 (+4%)
Changes to packages/core2-64-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.0.dist-info moved to /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info

--===============4927707116494114142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.0.dist-info moved to /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info

--===============4927707116494114142==--

