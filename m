Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB53C18E17
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8652.1698848703675040269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ipsugbss;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W/IzFiuY;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b460594-819cf88f-1b00-41a3-81c5-84e9e66f836f-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rLAXy/2PSRdXmJqv78zjDnivelYf4aZR/BCq7b+pJZc=;
	b=IpsugbsswlNH32Exln1PiW4jOmldhC9lMGGl20oZyGYCUCNOVXK3+IVWVd3oPFsy
	6O1OIQFEJzLFPmukdABUQ7pal5JfpukmjEw5kqZ73Cc6gokRsnvI+xbX4/yOXnmiHDa
	GgmBfxrNuC7H762+lTvEBvuZrT8z2naH8CLkMGNc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rLAXy/2PSRdXmJqv78zjDnivelYf4aZR/BCq7b+pJZc=;
	b=W/IzFiuYB84TQf+Eue6xYDgHvanx2lUTBFaIK3kAlkVscKD2WuE5qIepDdsaM4E4
	xuXCKRLS2n7vKb8sqFDNrWkQZqMFcPIL541VARIH3DA6n0k4ab2/hlVmWP87uPlH8MF
	54+PGmfl3XYwEtoX8STKAjk9rhzPQS2GsYMFmOQw=
Content-Type: multipart/mixed; boundary="===============4131167515269095772=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.4.3 SUCCEEDED
Message-ID: <0101018b8b460594-819cf88f-1b00-41a3-81c5-84e9e66f836f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189957

--===============4131167515269095772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.4.2-7.4.3.patch
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
From 5bea64d30175d805fc46d05d635459d5307ff0ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:26:13 +0000
Subject: [PATCH] python3-pytest: upgrade 7.4.2 -> 7.4.3

---
 .../python/{python3-pytest_7.4.2.bb => python3-pytest_7.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.2.bb => python3-pytest_7.4.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.2.bb b/meta/recipes-devtools/python/python3-pytest_7.4.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.2.bb
rename to meta/recipes-devtools/python/python3-pytest_7.4.3.bb
index 710aa51716..6fa0febd88 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.4.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069"
+SRC_URI[sha256sum] = "d989d136982de4e3b29dabcc838ad581c64e8ed52c11fbe86ddebd9da0818cd5"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.2


--===============4131167515269095772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.4.2.tar.gz;downloadfilename=pytest-7.4.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.4.3.tar.gz;downloadfilename=pytest-7.4.3.tar.gz"
packages/core2-64-poky-linux/python3-pytest: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.4.2" to "7.4.3"
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.4.2 [default] to 7.4.3 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2671928 to 2675091 (+0%)
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PV changed from "7.4.2" to "7.4.3"
Changes to packages/core2-64-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.4.2.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.4.3.dist-info

--===============4131167515269095772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.4.2.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.4.3.dist-info

--===============4131167515269095772==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.4.2-7.4.3.patch"

RnJvbSA1YmVhNjRkMzAxNzVkODA1ZmM0NmQwNWQ2MzU0NTlkNTMwN2ZmMGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToyNjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0OiB1cGdyYWRlIDcuNC4yIC0+IDcuNC4zCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0ZXN0XzcuNC4yLmJiID0+IHB5dGhvbjMtcHl0ZXN0XzcuNC4zLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0XzcuNC4yLmJiID0+IHB5
dGhvbjMtcHl0ZXN0XzcuNC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfNy40LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuNC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Rf
Ny40LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXRlc3RfNy40LjMuYmIKaW5kZXggNzEwYWE1MTcxNi4uNmZhMGZlYmQ4OCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjQuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuNC4zLmJiCkBA
IC01LDcgKzUsNyBAQCBERVNDUklQVElPTiA9ICJUaGUgcHl0ZXN0IGZyYW1ld29yayBtYWtlcyBp
dCBlYXN5IHRvIHdyaXRlIHNtYWxsIHRlc3RzLCB5ZXQgc2NhbAogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iZDI3ZTQxYjY1NTBmZTBmYzQ1
MzU2ZDFkODFlZTM3YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE3NjYyNTljZmFiNTY0YTJh
ZDUyY2IxYWFlMWI4ODFhNzVjM2ViN2UzNGNhMzc3OTY5N2MyM2VkNDdjNDcwNjkiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZDk4OWQxMzY5ODJkZTRlM2IyOWRhYmNjODM4YWQ1ODFjNjRlOGVkNTJj
MTFmYmU4NmRkZWJkOWRhMDgxOGNkNSIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xz
LXNjbS1uYXRpdmUiCiAKLS0gCjIuMzkuMgoK

--===============4131167515269095772==--

