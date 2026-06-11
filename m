Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D10CD98E3
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50423.1781195505087963816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pGnxq0cb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jjLYTXP3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb7867b33-754ed03f-0a7f-4ddd-aa62-29980aa33397-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E8KY+mXlSgBi0n3+xANw4plXMWIPBBfwzFoNrdBnW78=;
	b=pGnxq0cbMs8BfjYn5PH4NfwybfRN4/KaJ2T65FNWVPJRWC6bDD1WqpXe2VcQPhgM
	lULrv1UNvP//DMpsI7BJL4pUyidwjzX7o9oV33i96Bi33+yuqTwJb8F3pdRVthbpqVc
	MAfLPp+XhgmB0/kTWs1CuZw9v/G2qnrqd2N7t+Ls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E8KY+mXlSgBi0n3+xANw4plXMWIPBBfwzFoNrdBnW78=;
	b=jjLYTXP3MX+Ym1tac7GGyvCi3PJlVR+SvNEHhczC46D8krbW8rFKD+2gcsioehRR
	JlEzx5il5xWG8FFHAgdFoWSeOB+0TtBioE9PgH5MPPdB0Kb+xV9JHiBgGnygpAqimAR
	Wmm5FQCwsKPlDjy7qtxCGSEm6pnwLqefM/1w0HFU=
Content-Type: multipart/mixed; boundary="===============1412618133951821301=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.18 SUCCEEDED
Message-ID: <0101019eb7867b33-754ed03f-0a7f-4ddd-aa62-29980aa33397-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238492

--===============1412618133951821301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-idna* to *3.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.17-3.18.patch
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
From f5d3bcd439443cab5c3f07a657f4c07016671434 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:36:22 +0000
Subject: [PATCH] python3-idna: upgrade 3.17 -> 3.18

---
 .../python/{python3-idna_3.17.bb => python3-idna_3.18.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.17.bb => python3-idna_3.18.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.17.bb b/meta/recipes-devtools/python/python3-idna_3.18.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-idna_3.17.bb
rename to meta/recipes-devtools/python/python3-idna_3.18.bb
index bf91b8627d..3d5e79d0f7 100644
--- a/meta/recipes-devtools/python/python3-idna_3.17.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "5eb0cb53bc467c12eadcf6de83163ad8527cec9416f44b9b61b19caedad2b87f"
+SRC_URI[sha256sum] = "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============1412618133951821301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-idna: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.17.tar.gz;downloadfilename=idna-3.17.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.18.tar.gz;downloadfilename=idna-3.18.tar.gz"
packages/x86-64-v3-poky-linux/python3-idna: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGSIZE changed from 1497611 to 1499519 (+0%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PV changed from "3.17" to "3.18"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.17.dist-info -> /usr/lib/python3.14/site-packages/idna-3.18.dist-info, directory renamed /usr/lib/python3.14/site-packages/idna-3.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.18.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGV changed from 3.17 [default] to 3.18 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 496280 to 497478 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.17.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.18.dist-info

--===============1412618133951821301==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.17-3.18.patch"

RnJvbSBmNWQzYmNkNDM5NDQzY2FiNWMzZjA3YTY1N2Y0YzA3MDE2NjcxNDM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MzY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlkbmE6IHVwZ3JhZGUgMy4xNyAtPiAzLjE4CgotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtaWRuYV8zLjE3LmJiID0+IHB5dGhvbjMtaWRuYV8zLjE4LmJifSAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaWRuYV8zLjE3LmJiID0+IHB5dGhvbjMt
aWRuYV8zLjE4LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pZG5hXzMuMTcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaWRuYV8zLjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTguYmIKaW5kZXgg
YmY5MWI4NjI3ZC4uM2Q1ZTc5ZDBmNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWlkbmFfMy4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaWRuYV8zLjE4LmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20va2pkL2lkbmEiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIFB5
dGhvbi0yLjAgJiBVbmljb2RlLVRPVSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UubWQ7bWQ1PTlhNmMyOTA3OWZjOTBjMjlkODAzMzJmNDRkMjYyNWYyIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNWViMGNiNTNiYzQ2N2MxMmVhZGNmNmRlODMxNjNhZDg1MjdjZWM5NDE2ZjQ0
YjliNjFiMTljYWVkYWQyYjg3ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZmIzODVhN2UwMzk2
NTRjZWYxYWI5ZWYzMmM2ZmFmZTI4M2MwYzA0NjdiYmExZDkwMjk3MzhjZTRhMTRhODQ4IgogCiBp
bmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIu
NDcuMQoK

--===============1412618133951821301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.17.dist-info -> /usr/lib/python3.14/site-packages/idna-3.18.dist-info, directory renamed /usr/lib/python3.14/site-packages/idna-3.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.18.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.17.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.18.dist-info

--===============1412618133951821301==--

