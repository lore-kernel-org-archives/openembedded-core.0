Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEEDC44538
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:50:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41695.1784699400812042148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jFqkfQHI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eIdEvSag;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f885fae50-540b3a9b-2699-4030-98dd-ccecb7969bf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784699399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zwLqskk6ryPQdv8iHpfZPj9eOHJDiK/WJPVY7DJGpEM=;
	b=jFqkfQHIIjtfgaJqXWzGoycUWEtNU117uW0S/7BqQYEgemqaYD6s1mHaoLELY3YF
	DTx2OLVbZ5La6gnpDBeUByavq6opxzapyC6eYG2W+rS2lBhYu5rocmDkdZOQykqGVKu
	hbvSK3a9UekUqrPS69ny6hcS2zhUF4ZyjqQ5X3YU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784699399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zwLqskk6ryPQdv8iHpfZPj9eOHJDiK/WJPVY7DJGpEM=;
	b=eIdEvSaguKGksYYDUySC+HP3z3MRF0l9vVteUtKi7oN/cQj1nWFdQtC2xkljCXsl
	xiLKbzvqbA6/ktYhKK6fJXX3EXREHwu1FJ2c91PN6HeDnNWDJUwFGlycNYw7tWn8pT3
	UNwGjoSH+4UOn9VomvnJYinWXp9jujZZ7xSLZMLs=
Content-Type: multipart/mixed; boundary="===============7828395410074268765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.7.22 SUCCEEDED
Message-ID: <0101019f885fae50-540b3a9b-2699-4030-98dd-ccecb7969bf4-000000@us-west-2.amazonses.com>
Date: Wed, 22 Jul 2026 05:49:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241589

--===============7828395410074268765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.7.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.6.17-2026.7.22.patch
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
From 970fd0339b6c427e49ba058418e4f613f20d22b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 22 Jul 2026 05:37:00 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.6.17 -> 2026.7.22

---
 ...ython3-certifi_2026.6.17.bb => python3-certifi_2026.7.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.6.17.bb => python3-certifi_2026.7.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
index db78aaea0c..eabe412f08 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
+SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============7828395410074268765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.6.17.tar.gz;downloadfilename=certifi-2026.6.17.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.7.22.tar.gz;downloadfilename=certifi-2026.7.22.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.6.17" to "2026.7.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 245222 to 253830 (+4%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.6.17 [default] to 2026.7.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info, added "/usr/lib/python3.14/site-packages/certifi/tests/__init__.py /usr/lib/python3.14/site-packages/certifi/tests/test_certify.py /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/test_certify.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.6.17" to "2026.7.22"
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info
  /usr/lib/python3.14/site-packages/certifi/tests was added
  /usr/lib/python3.14/site-packages/certifi/tests/__init__.py was added
  /usr/lib/python3.14/site-packages/certifi/tests/__pycache__ was added
  /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/test_certify.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/certifi/tests/test_certify.py was added

--===============7828395410074268765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info/licenses, added "/usr/lib/python3.14/site-packages/certifi/tests/test_certify.py /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/certifi/tests/__init__.py /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/test_certify.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.7.22.dist-info
  /usr/lib/python3.14/site-packages/certifi/tests was added
  /usr/lib/python3.14/site-packages/certifi/tests/__init__.py was added
  /usr/lib/python3.14/site-packages/certifi/tests/__pycache__ was added
  /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/certifi/tests/__pycache__/test_certify.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/certifi/tests/test_certify.py was added

--===============7828395410074268765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.6.17-2026.7.22.patch"

RnJvbSA5NzBmZDAzMzliNmM0MjdlNDliYTA1ODQxOGU0ZjYxM2YyMGQyMmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjIgSnVsIDIwMjYgMDU6Mzc6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNi42LjE3IC0+IDIwMjYuNy4yMgoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDI2LjYuMTcuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNy4yMi5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
Ni42LjE3LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI2LjcuMjIuYmJ9ICg4NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi42
LjE3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
Ni43LjIyLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNi4xNy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi43LjIyLmJiCmlu
ZGV4IGRiNzhhYWVhMGMuLmVhYmU0MTJmMDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNi4xNy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjcuMjIuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3
OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDI0Yzg4ZWVlYzkyY2Ew
NjhkYjgwZjAyYjhiMDdjOWNlZjdiOWZlMjYxZDFkNTM1YWJmZDVhYmQ2ZjZhZjQzMiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3NDFlMmMzYjM1MWRkZjE2OWE3MzhkYTlmMmMwNDg2MDhmZjdmMmM1
Y2MwMmYxZWJjNmIxMThiYjA5MGQ1ZDU1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============7828395410074268765==--

