Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA528CD8C8E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1558.1780328132758483389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rdiVezHA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2ZDIOzac;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d38d98-96780310-2bc9-4a96-9e8d-287c72c0574f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ps2Lk1UR8NudSxqddVsKRl1DSujqTtC2AzmFSNTve7A=;
	b=rdiVezHAL0mLjdTIJD6zYVGmBPmMh7ddargIABTpLeVj2e8lKlCbH5xRE3Te4KUu
	vGeZPE+oRUivmUiaqb2+mRmWkW6rpQmmBvHC1mi92T7p7sQ1Ba7mBVXOhz4PXRYZs4Y
	ye0QA1vvX57CpQkq8NRDVrU+JEPV82w/X+Cb+iX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ps2Lk1UR8NudSxqddVsKRl1DSujqTtC2AzmFSNTve7A=;
	b=2ZDIOzacL58Dogz2moncmiyoH7y5BiciDLpYEz6qZ+3qOsdb7FNkf+vfCk2wKfol
	Wunn2qPvUCfJzq+eFVC8dwMjzN6yHCOBcr+X5N/t41YEFb+DulFA2CDjx1x577H+J0W
	zHfsXw5Wi7uGuMmSrkGvl44lhdm/+HZvG/csQN84=
Content-Type: multipart/mixed; boundary="===============8878720735201650565=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyelftools: upgrading to 0.33 SUCCEEDED
Message-ID: <0101019e83d38d98-96780310-2bc9-4a96-9e8d-287c72c0574f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237884

--===============8878720735201650565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyelftools* to *0.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyelftools-upgrade-0.32-0.33.patch
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
From 694e8c5036fc63e2e9b0a71df86749d9701a318d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:16:00 +0000
Subject: [PATCH] python3-pyelftools: upgrade 0.32 -> 0.33

---
 .../{python3-pyelftools_0.32.bb => python3-pyelftools_0.33.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.32.bb => python3-pyelftools_0.33.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyelftools_0.32.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.33.bb
index 447c8ad6af..5de2812813 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"
+SRC_URI[sha256sum] = "660d82dcbeb8e83d1702bd97f223f761625da06111c0cc988eac6b8ab0c1b61f"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.47.1


--===============8878720735201650565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1459551 to 1698509 (+16%)
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyelftools-0.32.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyelftools-0.33.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyelftools-0.32.dist-info -> /usr/lib/python3.14/site-packages/pyelftools-0.33.dist-info, removed "/usr/lib/python3.14/site-packages/elftools/construct/lib/py3compat.py /usr/lib/python3.14/site-packages/elftools/construct/lib/__pycache__/py3compat.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.14/site-packages/pyelftools-0.32.dist-info moved to /usr/lib/python3.14/site-packages/pyelftools-0.33.dist-info
  /usr/lib/python3.14/site-packages/elftools/construct/lib/py3compat.py was removed
  /usr/lib/python3.14/site-packages/elftools/construct/lib/__pycache__/py3compat.cpython-314.pyc was removed

--===============8878720735201650565==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyelftools-upgrade-0.32-0.33.patch"

RnJvbSA2OTRlOGM1MDM2ZmM2M2UyZTliMGE3MWRmODY3NDlkOTcwMWEzMThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOToxNjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHllbGZ0b29sczogdXBncmFkZSAwLjMyIC0+IDAuMzMKCi0tLQogLi4uL3tweXRob24z
LXB5ZWxmdG9vbHNfMC4zMi5iYiA9PiBweXRob24zLXB5ZWxmdG9vbHNfMC4zMy5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWVsZnRvb2xzXzAuMzIuYmIg
PT4gcHl0aG9uMy1weWVsZnRvb2xzXzAuMzMuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5ZWxmdG9vbHNfMC4zMi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMzMuYmIKc2ltaWxh
cml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5ZWxmdG9vbHNfMC4zMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5ZWxmdG9vbHNfMC4zMy5iYgppbmRleCA0NDdjOGFkNmFmLi41ZGUy
ODEyODEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHllbGZ0b29sc18wLjMyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWVsZnRvb2xzXzAuMzMuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwv
cHl0aG9uIgogTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTVjZTJhMmIwN2ZjYTMyNmJjN2MxNDZkMTAxMDVjY2ZjIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNmRlOTBlZTdiODI2M2U3NDBjODcxNWE5MjUzODJkNDA5OWIzNTRmMjlhYzQ4ZWE0
MGQ4NDBjZjdhYTE0YWNlNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NjBkODJkY2JlYjhlODNk
MTcwMmJkOTdmMjIzZjc2MTYyNWRhMDYxMTFjMGNjOTg4ZWFjNmI4YWIwYzFiNjFmIgogCiBQWVBJ
X1BBQ0tBR0UgPSAicHllbGZ0b29scyIKIAotLSAKMi40Ny4xCgo=

--===============8878720735201650565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyelftools: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.32.tar.gz;downloadfilename=pyelftools-0.32.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.33.tar.gz;downloadfilename=pyelftools-0.33.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyelftools: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-dev: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-dev: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-doc: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-doc: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-locale: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-locale: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-src: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-src: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools: PV changed from "0.32" to "0.33"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyelftools-0.32.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyelftools-0.33.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyelftools-0.32.dist-info -> /usr/lib/python3.14/site-packages/pyelftools-0.33.dist-info, removed "/usr/lib/python3.14/site-packages/elftools/construct/lib/__pycache__/py3compat.cpython-314.pyc /usr/lib/python3.14/site-packages/elftools/construct/lib/py3compat.py"
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools: PKGV changed from 0.32 [default] to 0.33 [default]
packages/x86-64-v3-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1459551 to 1698509 (+16%)
Changes to packages/x86-64-v3-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.14/site-packages/pyelftools-0.32.dist-info moved to /usr/lib/python3.14/site-packages/pyelftools-0.33.dist-info
  /usr/lib/python3.14/site-packages/elftools/construct/lib/py3compat.py was removed
  /usr/lib/python3.14/site-packages/elftools/construct/lib/__pycache__/py3compat.cpython-314.pyc was removed

--===============8878720735201650565==--

