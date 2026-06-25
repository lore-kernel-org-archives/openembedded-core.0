Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B799CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 05:42:44 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5192.1782366153835279527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 22:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UiNfl6WN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NVZVeIcE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019efd4d28c0-fbe91d1e-84bb-4849-bc43-cec4cb6c3fa8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782366153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wv+7NTiji9sfPiKJmrFtyE2BX5iTp/UNYyd5pny97oo=;
	b=UiNfl6WNbxYwNH00WBNQ6b0etsQGgLZ+zPDbxiRA8iVVZhHlqcvHGBWdsp3mRoSa
	L030DWdPd1h2mbquuh0uEQGc/3IITN62P6htcVxWDv0NQTWQ90X+/Y1g6dKMKEGsB4l
	7B9HdlP/oSjBJLut/8tzeEuPZIU4wBZrAzk3r5i0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782366153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wv+7NTiji9sfPiKJmrFtyE2BX5iTp/UNYyd5pny97oo=;
	b=NVZVeIcEtXRKUlaM2xdSQOEnQpcvcG6qxnlJi8vmErYK0fSb2B+Z6T/UeR5Em5y9
	xoi2wmVJMZjiG85DUW793gRY7jTcyJHQGZj6PW5wvYXLqJAZCgrM7Gtl/r4xC7XYFuU
	sNjWGP2y/HZikI2yIdJkPCu8fV+D2fQrru9R6IQg=
Content-Type: multipart/mixed; boundary="===============5216112651203017619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sbom-cve-check: upgrading to 1.3.2 SUCCEEDED
Message-ID: <0101019efd4d28c0-fbe91d1e-84bb-4849-bc43-cec4cb6c3fa8-000000@us-west-2.amazonses.com>
Date: Thu, 25 Jun 2026 05:42:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239539

--===============5216112651203017619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sbom-cve-check* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sbom-cve-check-upgrade-1.3.1-1.3.2.patch
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
From 12a64b778a34cae52be492f41ea15bc0afe5c1ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 25 Jun 2026 05:36:25 +0000
Subject: [PATCH] python3-sbom-cve-check: upgrade 1.3.1 -> 1.3.2

---
 ...-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
index 8120848a66..f14901e300 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
+SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============5216112651203017619==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sbom-cve-check-upgrade-1.3.1-1.3.2.patch"

RnJvbSAxMmE2NGI3NzhhMzRjYWU1MmJlNDkyZjQxZWExNWJjMGFmZTVjMWVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjUgSnVuIDIwMjYgMDU6MzY6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNib20tY3ZlLWNoZWNrOiB1cGdyYWRlIDEuMy4xIC0+IDEuMy4yCgotLS0KIC4uLi1z
Ym9tLWN2ZS1jaGVja18xLjMuMS5iYiA9PiBweXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay97cHl0aG9uMy1zYm9t
LWN2ZS1jaGVja18xLjMuMS5iYiA9PiBweXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4yLmJifSAo
ODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9w
eXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Ni
b20tY3ZlLWNoZWNrL3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjIuYmIKc2ltaWxhcml0eSBp
bmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Nib20tY3ZlLWNoZWNr
L3B5dGhvbjMtc2JvbS1jdmUtY2hlY2tfMS4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4yLmJiCmlu
ZGV4IDgxMjA4NDhhNjYuLmYxNDkwMWUzMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zYm9tLWN2ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy4xLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zYm9tLWN2ZS1jaGVjay9weXRob24zLXNib20tY3ZlLWNo
ZWNrXzEuMy4yLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01NzBhOWIzNzQ5ZGQwNDYz
YTE3Nzg4MDNiMTJhNmRjZSIKIAogUFlQSV9QQUNLQUdFID0gInNib21fY3ZlX2NoZWNrIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjY3NTgyOGIyZjAyZjExNjIwYjdhMjI5ODUzYTI0ZDA5MjY0YmY0
MTE2MWJlNWZiYjgwYTkyNDU2ZjQ2YTE0ZTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE3ZjA3
YTBjNmNlNDVkNDBhZGM2ZDMxMWRkYzI1YzQ0NjZmNTliYWZjYmNlMTQ5YjZmYjM2NjM3OTFhNWQ4
OSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4xCgo=

--===============5216112651203017619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.1.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info, added "/usr/lib/python3.14/site-packages/sbom_cve_check/analysis/__pycache__/compiled_sources.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/analysis/compiled_sources.py"
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.1.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/analysis/compiled_sources.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/analysis/__pycache__/compiled_sources.cpython-314.pyc was added

--===============5216112651203017619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.1.tar.gz;downloadfilename=sbom_cve_check-1.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sbom_cve_check/sbom_cve_check-1.3.2.tar.gz;downloadfilename=sbom_cve_check-1.3.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dbg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-dev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-doc: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-locale: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-src: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check-staticdev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGSIZE changed from 1293744 to 1320720 (+2%)
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PV changed from "1.3.1" to "1.3.2"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.1.dist-info -> /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info, added "/usr/lib/python3.14/site-packages/sbom_cve_check/analysis/__pycache__/compiled_sources.cpython-314.pyc /usr/lib/python3.14/site-packages/sbom_cve_check/analysis/compiled_sources.py"
packages/x86-64-v3-poky-linux/python3-sbom-cve-check/python3-sbom-cve-check: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-sbom-cve-check (sysroot):
  /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.1.dist-info moved to /usr/lib/python3.14/site-packages/sbom_cve_check-1.3.2.dist-info
  /usr/lib/python3.14/site-packages/sbom_cve_check/analysis/compiled_sources.py was added
  /usr/lib/python3.14/site-packages/sbom_cve_check/analysis/__pycache__/compiled_sources.cpython-314.pyc was added

--===============5216112651203017619==--

