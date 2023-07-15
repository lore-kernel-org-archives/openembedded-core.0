Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A1AC2FC02
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5943.1689456454846443455
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OrNEE534;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73a9f5-cc60563c-81a9-433c-be6d-b412f9257275-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=PIk2QW+xQgwqhA0xNDoOm43M8ukLhlUhBpR/iTYZHVY=;
	b=OrNEE534dZac0d5cafFJflbuNWQM5d5V23IH7540EYD5me4n/5aLCVrXkaW+Yuks
	zyjTchZ9wnzLoIGGjNwWTLdNWkHujKtFtXZzgME+ReRWxeJSux7qnha5tB37pZdG8EC
	VULhkcjwr7BrVifNfBJWL/MqjizQ5qivTqbn/1I8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=PIk2QW+xQgwqhA0xNDoOm43M8ukLhlUhBpR/iTYZHVY=;
	b=gI9I2LPirUPCUA6U0jQRCGwHgoa3Xb/s6ssM6xtG9uW76pNPi5G1e65o4Ss21CV+
	vwrm+BPVDyLv514CXnqw0pGj0F2N2hznBjD0iWNZ7KyjkOyf8nxAjIGTt9iBoovm5IV
	IeHhKb2Sd6EmaEU1At0HSegmJvwKAvjDbvKwF7kg=
Content-Type: multipart/mixed; boundary="===============1643127344370782573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.36 SUCCEEDED
Message-ID: <010101895b73a9f5-cc60563c-81a9-433c-be6d-b412f9257275-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184344

--===============1643127344370782573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.35-0.29.36.patch
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
From 2a5d2fa59f55d3241865658906ffc2d148a37ab6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 11:56:31 +0000
Subject: [PATCH] python3-cython: upgrade 0.29.35 -> 0.29.36

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.35.bb => python3-cython_0.29.36.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.35.bb => python3-cython_0.29.36.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 71596caedd..6aec6b012f 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "6e381fa0bf08b3c26ec2f616b19ae852c06f5750f4290118bf986b6f85c8c527"
+SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.35.bb b/meta/recipes-devtools/python/python3-cython_0.29.36.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.35.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.36.bb
-- 
2.39.2


--===============1643127344370782573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.35.tar.gz;downloadfilename=Cython-0.29.35.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.36.tar.gz;downloadfilename=Cython-0.29.36.tar.gz"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7839056 to 7739768 (-1%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8582915 to 8490406 (-1%)
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.35 [default] to 0.29.36 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.35" to "0.29.36"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 10315845 to 10285835 (-0%)
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-0.29.35.dist-info moved to /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info

--===============1643127344370782573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-0.29.35.dist-info moved to /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info

--===============1643127344370782573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.35-0.29.36.patch"

RnJvbSAyYTVkMmZhNTlmNTVkMzI0MTg2NTY1ODkwNmZmYzJkMTQ4YTM3YWI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTE6NTY6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAwLjI5LjM1IC0+IDAuMjkuMzYKCi0tLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyAgICAgICAgICAgICAgICAgIHwg
MiArLQogLi4uL3tweXRob24zLWN5dGhvbl8wLjI5LjM1LmJiID0+IHB5dGhvbjMtY3l0aG9uXzAu
MjkuMzYuYmJ9ICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0
aG9uXzAuMjkuMzUuYmIgPT4gcHl0aG9uMy1jeXRob25fMC4yOS4zNi5iYn0gKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWN5dGhvbi5pbmMKaW5kZXggNzE1
OTZjYWVkZC4uNmFlYzZiMDEyZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24tY3l0aG9uLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1jeXRob24uaW5jCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLnR4dDttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEiCiBQ
WVBJX1BBQ0tBR0UgPSAiQ3l0aG9uIgogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2Rr
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmUzODFmYTBiZjA4YjNjMjZlYzJmNjE2YjE5YWU4
NTJjMDZmNTc1MGY0MjkwMTE4YmY5ODZiNmY4NWM4YzUyNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI0MWMwY2ZkMmQ3NTRlMzgzYzllZWI5NWVmZmM5YWE0YWI4NDdkMGM5NzQ3MDc3ZGRkN2MwZGNi
NjhjM2JjMDFmIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiQ3l0aG9uLSg/UDxwdmVyPi4qKVwu
dGFyIgogCiBpbmhlcml0IHB5cGkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMC4yOS4zNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMC4yOS4zNi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8wLjI5
LjM1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0
aG9uXzAuMjkuMzYuYmIKLS0gCjIuMzkuMgoK

--===============1643127344370782573==--

