Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CD6CD4F4B
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34759.1778851228882772696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Od32LWsz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nE1Avo6S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcbb468-6dd8e78e-e27f-404d-9239-e29e343b0da2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HIKX3eZVPKF43Dvr/NSAbJrHKTNutYFqOz52m6Oi8lE=;
	b=Od32LWszQ/RyEyY1QhhqGV+bK18V2+eKgqTrBvd2nm6n/SP18BUohDE7GA7d76CE
	9qwJCTE0LU/cq3uPUtvxp0S6dmH0TbfYAemh9OakBxerOPjDHePblxI8naZ1GfjYH8K
	WooI21HqHUjisYejBGWi2q8juiL7zoXLSLEMYxpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HIKX3eZVPKF43Dvr/NSAbJrHKTNutYFqOz52m6Oi8lE=;
	b=nE1Avo6SsJY4VF3ecec6W4nu5tFCWP+njcRnYNne4yPuPqx+iSymVFanr2n/Nm2X
	wGnT2ZgwsiUBfnnEh1fzTnqY7PuQrTHka52wVqqAZqme+zvJKmvvCN553lAOEFl69z7
	yJOSB5PVND2TrWSN48IZgXSW7RqvlFnAU9jf7N3s=
Content-Type: multipart/mixed; boundary="===============3316020038944323771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.15 SUCCEEDED
Message-ID: <0101019e2bcbb468-6dd8e78e-e27f-404d-9239-e29e343b0da2-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237113

--===============3316020038944323771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-idna* to *3.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.13-3.15.patch
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
From 28d5abe4d66fa67057e625aaa61a59f7ed43cd8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:42:48 +0000
Subject: [PATCH] python3-idna: upgrade 3.13 -> 3.15

---
 .../python/{python3-idna_3.13.bb => python3-idna_3.15.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.13.bb => python3-idna_3.15.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.13.bb b/meta/recipes-devtools/python/python3-idna_3.15.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-idna_3.13.bb
rename to meta/recipes-devtools/python/python3-idna_3.15.bb
index 339abb89c2..901c110556 100644
--- a/meta/recipes-devtools/python/python3-idna_3.13.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a91d4eef164a242"
+SRC_URI[sha256sum] = "ca962446ea538f7092a95e057da437618e886f4d349216d2b1e294abfdb65fdc"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============3316020038944323771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-idna: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.13.tar.gz;downloadfilename=idna-3.13.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.15.tar.gz;downloadfilename=idna-3.15.tar.gz"
packages/x86-64-v3-poky-linux/python3-idna: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGSIZE changed from 1483107 to 1485293 (+0%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.13" to "3.15"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.13.dist-info -> /usr/lib/python3.14/site-packages/idna-3.15.dist-info, directory renamed /usr/lib/python3.14/site-packages/idna-3.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.15.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGV changed from 3.13 [default] to 3.15 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 604339 to 628235 (+4%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PV changed from "3.13" to "3.15"
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.13.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.15.dist-info

--===============3316020038944323771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.13.dist-info -> /usr/lib/python3.14/site-packages/idna-3.15.dist-info, directory renamed /usr/lib/python3.14/site-packages/idna-3.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.15.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.13.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.15.dist-info

--===============3316020038944323771==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.13-3.15.patch"

RnJvbSAyOGQ1YWJlNGQ2NmZhNjcwNTdlNjI1YWFhNjFhNTlmN2VkNDNjZDhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6NDI6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlkbmE6IHVwZ3JhZGUgMy4xMyAtPiAzLjE1CgotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtaWRuYV8zLjEzLmJiID0+IHB5dGhvbjMtaWRuYV8zLjE1LmJifSAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaWRuYV8zLjEzLmJiID0+IHB5dGhvbjMt
aWRuYV8zLjE1LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pZG5hXzMuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaWRuYV8zLjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTUuYmIKaW5kZXgg
MzM5YWJiODljMi4uOTAxYzExMDU1NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWlkbmFfMy4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaWRuYV8zLjE1LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20va2pkL2lkbmEiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIFB5
dGhvbi0yLjAgJiBVbmljb2RlLVRPVSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UubWQ7bWQ1PTlhNmMyOTA3OWZjOTBjMjlkODAzMzJmNDRkMjYyNWYyIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNTg1ZWE4ZmU1ZDY5YjkxODFlYzFhZmJhMzQwNDUxZmJhNmJhNzY0YWY5NzAy
NmY5MmE5MWQ0ZWVmMTY0YTI0MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYTk2MjQ0NmVhNTM4
ZjcwOTJhOTVlMDU3ZGE0Mzc2MThlODg2ZjRkMzQ5MjE2ZDJiMWUyOTRhYmZkYjY1ZmRjIgogCiBp
bmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIu
NDcuMQoK

--===============3316020038944323771==--

