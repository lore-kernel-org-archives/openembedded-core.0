Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81313E776C4
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.65020.1696183991002758669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D4T4pMeF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i8Bc3Lci;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018aec71b79a-827278fb-070c-4cf9-b5df-7b2acce3639a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W5UmwCd4yURsmU4XqpGbqgDrAcxo90R6eBriqNHwLe4=;
	b=D4T4pMeF+azBOMJkHmH6xZbdInLR/YatNRu59Jcc+gYVWwp4Fx2ab/A9eC6zAjRy
	wtw9DVC+QpMKNMD/J/8WuqXKUaZGWNlr88j8bbd4kTv6KRJlhQo0XS5QtH5S7qGhYiq
	5Z2g0TZ43yq/Q4PsiKIHexjo6Ol7kRoBUOy5x7bs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W5UmwCd4yURsmU4XqpGbqgDrAcxo90R6eBriqNHwLe4=;
	b=i8Bc3LciPHkMBixGO0YZxo508HWNrqT/piFtEZLMed/NwRlx/Nf8kPNmQp83XYrY
	TpNahwX3/Dzi51SnOw7ZWEren045q4nQCapd63gt3AvgDU2u8HBb9Q2LOCBdo2X2Usy
	pU9b+3ZfQIQzPdVUHzI14hQvImhtP9f3vigfgWMw=
Content-Type: multipart/mixed; boundary="===============3062235251605620641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 1.16.0 SUCCEEDED
Message-ID: <0101018aec71b79a-827278fb-070c-4cf9-b5df-7b2acce3639a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188539

--===============3062235251605620641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cffi* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-1.15.1-1.16.0.patch
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
From 6c5068cfaa9bd3f470be003bc87c1ad75421fcb3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 09:09:13 +0000
Subject: [PATCH] python3-cffi: upgrade 1.15.1 -> 1.16.0

---
 .../python/{python3-cffi_1.15.1.bb => python3-cffi_1.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.15.1.bb => python3-cffi_1.16.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.15.1.bb b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cffi_1.15.1.bb
rename to meta/recipes-devtools/python/python3-cffi_1.16.0.bb
index daa290a54e..a351029ef2 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
+SRC_URI[sha256sum] = "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============3062235251605620641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.15.1.tar.gz;downloadfilename=cffi-1.15.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.16.0.tar.gz;downloadfilename=cffi-1.16.0.tar.gz"
packages/core2-32-poky-linux/python3-cffi: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 411068 to 411084 (+0%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 484006 to 485651 (+0%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 1013690 to 1025789 (+1%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info -> /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info, added "/usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc /usr/lib/python3.11/site-packages/cffi/_imp_emulation.py /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc"
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
Changes to packages/core2-32-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info moved to /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info
  /usr/lib/python3.11/site-packages/cffi/_imp_emulation.py was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py was added

--===============3062235251605620641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-1.15.1-1.16.0.patch"

RnJvbSA2YzUwNjhjZmFhOWJkM2Y0NzBiZTAwM2JjODdjMWFkNzU0MjFmY2IzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwOTowOToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2ZmaTogdXBncmFkZSAxLjE1LjEgLT4gMS4xNi4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2ZmaV8xLjE1LjEuYmIgPT4gcHl0aG9uMy1jZmZpXzEuMTYuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2ZmaV8xLjE1LjEuYmIgPT4gcHl0
aG9uMy1jZmZpXzEuMTYuMC5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE1LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8x
LjE2LjAuYmIKaW5kZXggZGFhMjkwYTU0ZS4uYTM1MTAyOWVmMiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNS4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTYuMC5iYgpAQCAtNCw3ICs0
LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT01Njc3ZTJmZGJmN2NkZGE2MWQ2ZGQyYjU3ZGY1NDdiZiIKIERFUEVORFMgKz0gImxpYmZm
aSAke1BZVEhPTl9QTn0tcHljcGFyc2VyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDQwMGJm
YjlhMzdiMTM1MTI1M2NiNDAyNjcxY2VhN2U4OWJkZWNjMjk0ZTgwMTZhNzA3ZjZkMWQ4YWM5MzRm
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiY2IzZWY0M2U1ODY2NWJiZGEyZmIxOTg2OThmY2Fl
Njc3NjQ4M2UwYzRhNjMxYWE1NjQ3ODA2YzI1ZTAyY2MwIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotLSAKMi4zOS4yCgo=

--===============3062235251605620641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info -> /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info, added "/usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc /usr/lib/python3.11/site-packages/cffi/_imp_emulation.py"
Changes to packages/core2-32-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info moved to /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info
  /usr/lib/python3.11/site-packages/cffi/_imp_emulation.py was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py was added

--===============3062235251605620641==--

